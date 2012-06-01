Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SaHK3-00034m-OQ
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 04:10:40 +0200
Received: by dalh21 with SMTP id h21so2151364dal.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 19:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=W8iAPsULVWtkGieKt4bjVk8iBRTF2X4IIflz64qQt48=;
	b=igNqF5cKYaALgAw7yLp4GnfRWBlAa1J0U7VQtV3qXAV5+gSB0Mr52vJi9e1qhqCxl9
	ixV0BGOyktuaBrTroJSr7ksuVKDmhmNLvG0His/F1MFcDHkSBL+rkpFGQURmhc8k2Hv7
	PuAbV1QEs4mp/EHQnbz4j8OS7Mtsg81vYMqu6hNQXvZB5chwLilAgm9yUf7lak3UYhVK
	f4KcSRjXVUiLQ1AdTvJ0Tt/+X141Ij30AOgNiDBnDYqkVgXBF21M1E3R3RgzDOUVxfsi
	S0IYhN+SB0cV1H+ZWeUn+Z+dWSd0D/8qtfqhTo/erG/3ILRNdnP/HDWyWAdUyU7PCvs5
	XncQ==
Received: by 10.68.221.98 with SMTP id qd2mr5573377pbc.3.1338516018421;
	Thu, 31 May 2012 19:00:18 -0700 (PDT)
Received: from localhost.localdomain (ip68-110-79-242.ph.ph.cox.net.
	[68.110.79.242])
	by mx.google.com with ESMTPS id tk1sm994850pbc.8.2012.05.31.19.00.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 19:00:17 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 May 2012 19:00:04 -0700
Message-Id: <367a51d945217c0a11caab13e71fe83a557a6872.1338515870.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.10.3
In-Reply-To: <cover.1338515870.git.chris_larson@mentor.com>
References: <cover.1338515870.git.chris_larson@mentor.com>
In-Reply-To: <cover.1338515870.git.chris_larson@mentor.com>
References: <cover.1338515870.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/3] external-sourcery: extract src and dest sysroot paths from gcc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jun 2012 02:10:40 -0000

From: Christopher Larson <chris_larson@mentor.com>

Rather than hardcoding the multilib path in a map, and hardcoding dest sysroot
symlink creation in a hook, now we just use -print-sysroot for both, and pass
the appropriate multilib args to the toolchain for particular tunes.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../distro/include/tcmode-external-sourcery.inc    |   51 +++++++++++++-------
 .../meta/external-sourcery-toolchain.bb            |   21 +++-----
 2 files changed, 40 insertions(+), 32 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-external-sourcery.inc b/meta/conf/distro/include/tcmode-external-sourcery.inc
index 79fef25..d5abc16 100644
--- a/meta/conf/distro/include/tcmode-external-sourcery.inc
+++ b/meta/conf/distro/include/tcmode-external-sourcery.inc
@@ -42,24 +42,39 @@ ENABLE_BINARY_LOCALE_GENERATION = ""
 
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_HOST}"
 
-# Translate to CodeSourcery's names for their optimized files in the toolchain
-def csl_target_core(d):
-    coredata = {
-        'armv7a-vfp-neon': 'armv7-a-neon',
-        'i586': 'sgxx-glibc',
-        'i686': 'sgxx-glibc',
-        'core2': 'sgxx-glibc',
-        'mips': 'mips32',
-        'mipsel': 'el',
-        'powerpc-nf': 'nof',
-        'ppce500': 'te500v1',
-        'ppce500mc': 'te500mc',
-        'ppce500v2': 'te500v2',
-        'ppce600': 'te600'
-    }
-    return coredata.get(d.getVar('TUNE_PKGARCH', True), '')
-
-CSL_TARGET_CORE ?= "${@csl_target_core(d)}"
+# Point to the appropriate multilib sysroot from the external toolchain, whose
+# files will be extracted into the OE sysroot
+def exttc_run(d, cmd):
+    try:
+        return bb.process.run(cmd, shell=True, env={'PATH': d.getVar('PATH', True)})[0].rstrip()
+    except (OSError, bb.process.CmdError):
+        return ''
+
+EXTERNAL_TOOLCHAIN_SYSROOT_CMD = "${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} -print-sysroot"
+EXTERNAL_TOOLCHAIN_SYSROOT ??= "${@exttc_run(d, EXTERNAL_TOOLCHAIN_SYSROOT_CMD)}"
+
+# These bits are here temporarily to sidestep the need to use a separate set
+# of tune files to pass the appropriate multilib selection arguments to the
+# sourcery toolchain, as is needed to extract the sysroot content.
+CSL_MULTILIB_ARGS[i586] = "-msgxx-glibc"
+CSL_MULTILIB_ARGS[i686] = "-msgxx-glibc"
+CSL_MULTILIB_ARGS[core2] = "-msgxx-glibc"
+CSL_MULTILIB_ARGS[x86] = "-msgxx-glibc"
+CSL_MULTILIB_ARGS[x86-64] = "-msgxx-glibc"
+CSL_MULTILIB_ARGS[ppce500] = "-te500v1"
+CSL_MULTILIB_ARGS[ppce500mc] = "-te500mc"
+CSL_MULTILIB_ARGS[ppce500v2] = "-te500v2"
+CSL_MULTILIB_ARGS[ppce600] = "-te600"
+
+def csl_multilib_arg(d):
+    argument = d.getVarFlag('CSL_MULTILIB_ARGS', d.getVar('DEFAULTTUNE', True) or '')
+    if argument:
+        return argument
+    else:
+        return ''
+
+EXTERNAL_TOOLCHAIN_SYSROOT_CMD += "${@csl_multilib_arg(d)}"
+
 
 # Unfortunately, the CSL ia32 toolchain has non-prefixed binaries in its
 # bindir (e.g. gcc, ld). To avoid this messing up our build, we avoid adding
diff --git a/meta/recipes-core/meta/external-sourcery-toolchain.bb b/meta/recipes-core/meta/external-sourcery-toolchain.bb
index b8cb6d9..b67410b 100644
--- a/meta/recipes-core/meta/external-sourcery-toolchain.bb
+++ b/meta/recipes-core/meta/external-sourcery-toolchain.bb
@@ -24,7 +24,7 @@ PROVIDES += "\
 	virtual/linux-libc-headers \
 "
 PV = "${CSL_VER_MAIN}"
-PR = "r5"
+PR = "r6"
 
 #SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/${CSL_TARGET_SYS}/arm-${PV}-${TARGET_PREFIX}i686-pc-linux-gnu.tar.bz2"
 
@@ -32,10 +32,7 @@ SRC_URI = "file://SUPPORTED"
 
 do_install() {
 	# Use optimized files if available
-	sysroot="${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc"
-	if [ -d $sysroot/${CSL_TARGET_CORE} ]; then
-		sysroot="$sysroot/${CSL_TARGET_CORE}"
-	fi
+	sysroot="${EXTERNAL_TOOLCHAIN_SYSROOT}"
 
 	cp -a $sysroot${base_libdir}/. ${D}${base_libdir}
 	cp -a $sysroot/etc/. ${D}${sysconfdir}
@@ -76,15 +73,11 @@ do_install() {
 
 SYSROOT_PREPROCESS_FUNCS += "external_toolchain_sysroot_adjust"
 external_toolchain_sysroot_adjust() {
-       if [ -n "${CSL_TARGET_CORE}" ]; then
-               rm -f ${SYSROOT_DESTDIR}/${CSL_TARGET_CORE}
-               ln -s . ${SYSROOT_DESTDIR}/${CSL_TARGET_CORE}
-       fi
-
-       if [ "${TUNE_PKGARCH}" = "i586" ]; then
-               rm -f ${SYSROOT_DESTDIR}/system32
-               ln -s . ${SYSROOT_DESTDIR}/system32
-       fi
+	dest_sysroot="$(${CC} -print-sysroot | sed -e's,^${STAGING_DIR_HOST},,; s,/$,,')"
+	if [ -n "$dest_sysroot" ]; then
+		rm -f ${SYSROOT_DESTDIR}/$dest_sysroot
+		ln -s . ${SYSROOT_DESTDIR}/$dest_sysroot
+	fi
 }
 
 PACKAGES =+ "libgcc libgcc-dev libstdc++ libstdc++-dev libstdc++-staticdev linux-libc-headers linux-libc-headers-dev gdbserver gdbserver-dbg"
-- 
1.7.4.1



