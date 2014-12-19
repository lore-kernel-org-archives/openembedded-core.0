Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3C98F72920
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 17:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBJHk2uj022930 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 17:46:02 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id g1nB0lXuqZzT
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 17:46:02 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBJHjogl022927
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 17:46:02 GMT
Message-ID: <1419011187.13316.27.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Dec 2014 17:46:27 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] kernel: Fix non linux-yocto builds
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
X-List-Received-Date: Fri, 19 Dec 2014 17:46:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

After the recent kernel changes, non linux-yocto builds stopped working
properly for two reasons:

a) ${S} was being reset to ${WORKDIR}/git for example and STAGING_KERNEL_DIR
   did not contain the source

b) Most builds were using ${B} == ${S}

This patch adds a fixup to the unpack function to handle the case where
${S} != ${STAGING_KERNEL_DIR} and also set up the infrastrcture so that
B != S for kernel builds from now on. The kernel build system is one of the
best for supporting this and there is no good reason to take advantage of it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 94b5661..9a77a8a 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -3,9 +3,10 @@ inherit linux-kernel-base kernel-module-split
 PROVIDES += "virtual/kernel"
 DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross bc-native"
 
-S = "${STAGING_DIR_TARGET}/${KERNEL_SRC_PATH}"
-
-do_unpack[cleandirs] = "${S}"
+S = "${STAGING_KERNEL_DIR}"
+B = "${WORKDIR}/build"
+KBUILD_OUTPUT = "${B}"
+OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"
 
 # we include gcc above, we dont need virtual/libc
 INHIBIT_DEFAULT_DEPS = "1"
@@ -35,6 +36,22 @@ python __anonymous () {
         d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
 }
 
+# Old style kernels may set ${S} = ${WORKDIR}/git for example
+# We need to move these over to STAGING_KERNEL_DIR. We can't just
+# create the symlink in advance as the git fetcher can't cope with
+# the symlink.
+do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR}"
+base_do_unpack_append () {
+    s = d.getVar("S", True)
+    kernsrc = d.getVar("STAGING_KERNEL_DIR", True)
+    if s != kernsrc:
+        bb.utils.mkdirhier(kernsrc)
+        bb.utils.remove(kernsrc, recurse=True)
+        import subprocess
+        subprocess.call(d.expand("mv ${S} ${STAGING_KERNEL_DIR}"), shell=True)
+        os.symlink(kernsrc, s)
+}
+
 inherit kernel-arch deploy
 
 PACKAGES_DYNAMIC += "^kernel-module-.*"
@@ -255,7 +272,7 @@ python sysroot_stage_all () {
     oe.path.copyhardlinktree(d.expand("${D}${KERNEL_SRC_PATH}"), d.expand("${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}"))
 }
 
-KERNEL_CONFIG_COMMAND ?= "oe_runmake_call oldnoconfig || yes '' | oe_runmake oldconfig"
+KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} oldnoconfig || yes '' | oe_runmake oldconfig"
 
 kernel_do_configure() {
 	# fixes extra + in /lib/modules/2.6.37+
@@ -264,6 +281,10 @@ kernel_do_configure() {
 	# $ make kernelrelease => 2.6.37+
 	touch ${B}/.scmversion ${S}/.scmversion
 
+	if [ "${S}" != "${B}" ] && [ -f "${S}/.config" ] && [ ! -f "${B}/.config" ]; then
+		mv "${S}/.config" "${B}/.config"
+	fi
+
 	# Copy defconfig to .config if .config does not exist. This allows
 	# recipes to manage the .config themselves in do_configure_prepend().
 	if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then



