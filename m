Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1695075618
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 09:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5J99sef009376 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 10:09:54 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lkJIkrrIfZ-8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 10:09:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5J99eTZ009371
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 10:09:51 +0100
Message-ID: <1434704980.14710.108.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Jun 2015 10:09:40 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] staging: Strip files in sysroot
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
X-List-Received-Date: Fri, 19 Jun 2015 09:09:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Add functionality to strip binaries/libraries going into the sysroot. Whilst
this does fractionally slow down the build, it also significantly reduces the
size of the sstate cache files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 10198fd..7732e16 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -57,6 +57,101 @@ sysroot_stage_all() {
 	sysroot_stage_dirs ${D} ${SYSROOT_DESTDIR}
 }
 
+python sysroot_strip () {
+    import stat, errno
+
+    dvar = d.getVar('SYSROOT_DESTDIR', True)
+    pn = d.getVar('PN', True)
+
+    os.chdir(dvar)
+
+    # Return type (bits):
+    # 0 - not elf
+    # 1 - ELF
+    # 2 - stripped
+    # 4 - executable
+    # 8 - shared library
+    # 16 - kernel module
+    def isELF(path):
+        type = 0
+        ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
+
+        if ret:
+            bb.error("split_and_strip_files: 'file %s' failed" % path)
+            return type
+
+        # Not stripped
+        if "ELF" in result:
+            type |= 1
+            if "not stripped" not in result:
+                type |= 2
+            if "executable" in result:
+                type |= 4
+            if "shared" in result:
+                type |= 8
+        return type
+
+
+    elffiles = {}
+    inodes = {}
+    libdir = os.path.abspath(dvar + os.sep + d.getVar("libdir", True))
+    baselibdir = os.path.abspath(dvar + os.sep + d.getVar("base_libdir", True))
+    if (d.getVar('INHIBIT_SYSROOT_STRIP', True) != '1'):
+        #
+        # First lets figure out all of the files we may have to process
+        #
+        for root, dirs, files in os.walk(dvar):
+            for f in files:
+                file = os.path.join(root, f)
+
+                try:
+                    ltarget = oe.path.realpath(file, dvar, False)
+                    s = os.lstat(ltarget)
+                except OSError as e:
+                    (err, strerror) = e.args
+                    if err != errno.ENOENT:
+                        raise
+                    # Skip broken symlinks
+                    continue
+                if not s:
+                    continue
+                # Check its an excutable
+                if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
+                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and ".so" in f):
+                    # If it's a symlink, and points to an ELF file, we capture the readlink target
+                    if os.path.islink(file):
+                        continue
+
+                    # It's a file (or hardlink), not a link
+                    # ...but is it ELF, and is it already stripped?
+                    elf_file = isELF(file)
+                    if elf_file & 1:
+                        if elf_file & 2:
+                            bb.warn("File '%s' from %s was already stripped, this will prevent future debugging!" % (file[len(dvar):], pn))
+                            continue
+
+                        if s.st_ino in inodes:
+                            os.unlink(file)
+                            os.link(inodes[s.st_ino], file)
+                        else:
+                            inodes[s.st_ino] = file
+                            # break hardlink
+                            bb.utils.copyfile(file, file)
+                            elffiles[file] = elf_file
+
+        #
+        # Now strip them (in parallel)
+        #
+        strip = d.getVar("STRIP", True)
+        sfiles = []
+        for file in elffiles:
+            elf_file = int(elffiles[file])
+            #bb.note("Strip %s" % file)
+            sfiles.append((file, elf_file, strip))
+
+        oe.utils.multiprocess_exec(sfiles, oe.package.runstrip)
+}
+
 do_populate_sysroot[dirs] = "${SYSROOT_DESTDIR}"
 do_populate_sysroot[umask] = "022"
 
@@ -90,6 +185,7 @@ def sysroot_checkhashes(covered, tasknames, fnids, fns, d, invalidtasks = None):
 
 python do_populate_sysroot () {
     bb.build.exec_func("sysroot_stage_all", d)
+    bb.build.exec_func("sysroot_strip", d)
     for f in (d.getVar('SYSROOT_PREPROCESS_FUNCS', True) or '').split():
         bb.build.exec_func(f, d)
     pn = d.getVar("PN", True)
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 984362e..8ea5915 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -17,6 +17,8 @@ python __anonymous () {
 # Set this to zero if you don't want ldconfig in the output package
 USE_LDCONFIG ?= "1"
 
+INHIBIT_SYSROOT_STRIP = "1"
+
 PACKAGES = "${PN}-dbg catchsegv sln nscd ldd tzcode ${PN}-utils glibc-thread-db ${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN} glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
 
 # The ld.so in this glibc supports the GNU_HASH



