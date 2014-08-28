Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A9F5C70E6E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 10:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7SAQvrk012483 for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 11:27:16 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id oMeO2xgvvUVS
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 11:27:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7SARDQw012503
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 11:27:14 +0100
Message-ID: <1409221634.29296.134.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Aug 2014 11:27:14 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [RFC PATCH] uninative: Add uninative - a way of reusing native/cross over multiple distros
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
X-List-Received-Date: Thu, 28 Aug 2014 10:27:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

These patches illustrate a new idea, a way of allowing a single set of
cross/native sstate to work over multiple distros, even old ones.

The assumption is that our own C library is basically up to date. We build
and share a small tarball (~2MB) of a prebuilt copy of this along with a
patchelf binary (which sadly is C++ based so libstdc++ is in there). This
tarball can be generated from our usual SDK generation process through
the supplied recipe, uninative-tarball.

At the start of the build, if its not been extracted into the sysroot, this
tarball is extracted there and configured for the specified path.

When we install binaries from a "uninative" sstate feed, we change the
dynamic loader to point at this dynamic loader and C librbary. This works
exactly the same way as our relocatable SDK does. The only real difference
is a switch to use patchelf, so even if the interpreter section is too small,
it can still adjust the binary.

Right now the patch is a working proof of concept. If you build the tarball
and place it at the head of the tree (in COREBASE), you can run a build from
sstate and successfully build packages and construct images.

There is some cleanup needed, its hardcoded for x86_64 right now, its trivial
to add 32 bit support too. The tarball isn't fetched right now, there is just a
harcoded path assumption and there is no error handling. I haven't figured
out the best delivery mechanism for that yet. BuildStarted is probably not
the right event to hook on either.

I did want to send this out and illustrate how with a small change, we might
make the native/cross sstate much more reusable and hence improve the accessibility
of lower overhead builds. With this change, its possible the Yocto Project may
be able to support a configured sstate mirror out the box. This also has
positive implications for our developer workflow/SDK improvements.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
new file mode 100644
index 0000000..862c0de
--- /dev/null
+++ b/meta/classes/uninative.bbclass
@@ -0,0 +1,47 @@
+#BUILD_LDFLAGS += "-Wl,-T${LINKERSCRIPT}"
+NATIVELSBSTRING = "universal"
+#LINKERSCRIPT = "${STAGING_DIR_NATIVE}/linkerscript"
+
+addhandler uninative_eventhandler
+uninative_eventhandler[eventmask] = "bb.event.BuildStarted"
+
+python uninative_eventhandler() {
+    loader = e.data.getVar("UNINATIVE_LOADER", True)
+    if not os.path.exists(loader):
+        import subprocess
+        cmd = e.data.expand("mkdir -p ${STAGING_DIR}; cd ${STAGING_DIR}; tar -xjf ${COREBASE}/${BUILD_ARCH}-nativesdk-libc.tar.bz2; ${STAGING_DIR}/relocate_sdk.py ${STAGING_DIR_NATIVE} ${UNINATIVE_LOADER} ${UNINATIVE_LOADER} ${STAGING_BINDIR_NATIVE}/patchelf-uninative")
+        #bb.warn("nativesdk lib extraction: " + cmd)
+        subprocess.check_call(cmd, shell=True)
+}
+
+SSTATEPOSTUNPACKFUNCS_append = " uninative_changeinterp"
+
+UNINATIVE_LOADER = "${STAGING_DIR_NATIVE}/lib/ld-linux-x86-64.so.2"
+
+python uninative_changeinterp () {
+    import subprocess
+    import stat
+    import oe.qa
+
+    if not (bb.data.inherits_class('native', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('cross', d)):
+        return
+
+    sstateinst = d.getVar('SSTATE_INSTDIR', True)
+    for walkroot, dirs, files in os.walk(sstateinst):
+        for file in files:
+            f = os.path.join(walkroot, file)
+            if os.path.islink(f):
+                continue
+            s = os.stat(f)
+            if not ((s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH)):
+                continue
+            elf = oe.qa.ELFFile(f)
+            try:
+                elf.open()
+            except:
+                continue
+
+            #bb.warn("patchelf-uninative --set-interpreter %s %s" % (d.getVar("UNINATIVE_LOADER", True), f))
+            subprocess.call("patchelf-uninative --set-interpreter %s %s" % (d.getVar("UNINATIVE_LOADER", True), f), shell=True)
+}
+
diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
new file mode 100644
index 0000000..ed1279f
--- /dev/null
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -0,0 +1,48 @@
+SUMMARY = "libc and patchelf tarball for use with uninative.bbclass"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+TOOLCHAIN_TARGET_TASK = ""
+
+TOOLCHAIN_HOST_TASK = "\
+    nativesdk-eglibc \
+    nativesdk-patchelf \
+    "
+
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS += "patchelf-native"
+
+TOOLCHAIN_OUTPUTNAME ?= "${BUILD_ARCH}-nativesdk-libc"
+
+RDEPENDS = "${TOOLCHAIN_HOST_TASK}"
+
+EXCLUDE_FROM_WORLD = "1"
+
+inherit meta
+inherit populate_sdk
+
+deltask install
+deltask package
+
+SDK_PACKAGING_FUNC = ""
+
+fakeroot create_sdk_files() {
+	cp ${COREBASE}/scripts/relocate_sdk.py ${SDK_OUTPUT}/${SDKPATH}/
+
+	# Replace the ##DEFAULT_INSTALL_DIR## with the correct pattern.
+	# Escape special characters like '+' and '.' in the SDKPATH
+	escaped_sdkpath=$(echo ${SDKPATH}/sysroots/${SDK_SYS} |sed -e "s:[\+\.]:\\\\\\\\\0:g")
+	sed -i -e "s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:" ${SDK_OUTPUT}/${SDKPATH}/relocate_sdk.py
+}
+
+
+fakeroot tar_sdk() {
+	mkdir -p ${SDK_DEPLOY}
+	cd ${SDK_OUTPUT}/${SDKPATH}
+	mv sysroots/${SDK_SYS} ./${BUILD_SYS}
+	rm sysroots -rf
+	patchelf --set-interpreter ${@''.join('a' for n in xrange(1024))} ./${BUILD_SYS}/usr/bin/patchelf
+	mv ./${BUILD_SYS}/usr/bin/patchelf ./${BUILD_SYS}/usr/bin/patchelf-uninative
+	tar ${SDKTAROPTS} -c --file=${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
+}



