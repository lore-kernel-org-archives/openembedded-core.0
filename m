Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3E8E6600E2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 16:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8QGPSYX032519 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 17:25:28 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XH3HuraLaF6l
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 17:25:28 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8QGPQwV032516
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 17:25:27 +0100
Message-ID: <1474907126.30475.14.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Sep 2016 17:25:26 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] prelink: Manipulate library paths to match the target system library setup
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Sep 2016 16:25:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Currently, prelink doesn't work unless base_libdir/libdir match
its hardcoded values. This patch manipulates those paths so that 
they match the values set in the variables and handles multilib
configurations too. The manipulations only happen in the target
case, if needed.

[YOCTO #10282]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index 5d9f260..39c9c66 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -44,6 +44,96 @@ BBCLASSEXTEND = "native"
 EXTRA_OECONF = "--disable-selinux --with-pkgversion=${PV}-${PR} \
 	--with-bugurl=http://bugzilla.yoctoproject.org/"
 
+addtask do_linkerpaths before do_configure after do_patch
+
+#
+# For target prelink we need to ensure paths match the lib path layout
+# including for any configured multilibs
+#
+python do_linkerpaths () {
+    overrides = d.getVar("OVERRIDES").split(":")
+    if "class-target" not in overrides:
+        return
+
+    arches = all_multilib_tune_list(d, "TUNE_ARCH")
+    baselibs = all_multilib_tune_list(d, "baselib")
+    abis = all_multilib_tune_list(d, "ABIEXTENSION")
+
+    def replace_lines(f, search, replacement, d, firstonly = False, secondonly = False):
+        f = d.expand(f)
+        if search == replacement:
+            return
+        bb.debug(2, "Replacing %s with %s in %s" % (search, replacement, f))
+        with open(f, "r") as data:
+            lines = data.readlines()
+        with open(f, "w") as data:
+            for line in lines:
+                if not secondonly and not firstonly:
+                    line = line.replace(search, replacement)
+                elif secondonly and search in line:
+                    secondonly = False
+                elif firstonly and search and search in line:
+                    line = line.replace(search, replacement)
+                    search = None
+                data.write(line)
+
+    def replace_lines_rtld(f, search, replacement, section, d):
+        f = d.expand(f)
+        bb.debug(2, "Replacing %s with %s in %s" % (search, replacement, f))
+        with open(f, "r") as data:
+            lines = data.readlines()
+        found = False
+        found2 = False
+        with open(f, "w") as data:
+            for line in lines:
+                if section in line:
+                    if section == "else" and "if" in line:
+                        found = False
+                    else:
+                        found = True
+                if found and "dst_LIB =" in line:
+                    found2 = True
+                elif "}" in line:
+                    found = False
+                    found2 = False
+                if found2:
+                    line = line.replace(search, replacement)
+                data.write(line)
+
+    for i, arch in enumerate(arches):
+        tune_baselib = baselibs[i]
+        abi = abis[i]
+
+        bits = 32
+        if arch == "powerpc":
+            replace_lines("${S}/src/arch-ppc.c", "/lib/ld.so.1", "/" + tune_baselib + "/ld.so.1", d)
+        elif arch == "powerpc64":
+            replace_lines("${S}/src/arch-ppc64.c", "/lib64/ld64.so.1", "/" + tune_baselib + "/ld64.so.1", d)
+            bits = 64
+        elif arch == "x86_64":
+            if abi == "x32":
+                replace_lines("${S}/src/arch-x86_64.c", "/libx32/ld-linux-x32.so.2", "/" + tune_baselib + "/ld-linux-x32.so.2", d)
+            else:
+                replace_lines("${S}/src/arch-x86_64.c", "/lib64/ld-linux-x86-64.so.2", "/" + tune_baselib + "/ld-linux-x86-64.so.2", d)
+            bits = 64
+        elif arch == "arm":
+            replace_lines("${S}/src/arch-arm.c", "/lib/ld-linux.so.3", "/" + tune_baselib + "/ld-linux.so.3", d)
+            replace_lines("${S}/src/arch-arm.c", "/lib/ld-linux-armhf.so.3", "/" + tune_baselib + "/ld-linux-armhf.so.3", d)
+        elif arch == "mips" or arch == "mipsel":
+            replace_lines("${S}/src/arch-mips.c", "/lib/ld.so.1", "/" + tune_baselib + "/ld.so.1", d, firstonly=True)
+            replace_lines("${S}/src/arch-mips.c", "/lib32/ld.so.1", "/" + tune_baselib + "/ld.so.1", d)
+        elif arch == "mips64" or arch == "mips64el":
+            replace_lines("${S}/src/arch-mips.c", "/lib/ld.so.1", "/" + tune_baselib + "/ld.so.1", d, secondonly=True)
+            replace_lines("${S}/src/arch-mips.c", "/lib64/ld.so.1", "/" + tune_baselib + "/ld.so.1", d)
+            bits = 64
+        elif arch.endswith("86"):
+            replace_lines("${S}/src/arch-i386.c", "/lib/ld-linux.so.2", "/" + tune_baselib + "/ld-linux.so.2", d)
+        if bits == 32 and tune_baselib != "lib":
+            replace_lines_rtld("${S}/src/rtld/rtld.c", "lib", tune_baselib, "else", d)
+        if bits == 64 and tune_baselib != "lib64":
+            replace_lines_rtld("${S}/src/rtld/rtld.c", "lib64", tune_baselib, "use_64bit", d)
+}
+
 do_configure_prepend () {
         # Disable documentation!
         echo "all:" > ${S}/doc/Makefile.am



