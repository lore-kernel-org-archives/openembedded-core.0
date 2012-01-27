Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RqpUg-0005Wb-GH
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 18:21:47 +0100
Received: by mail-gy0-f175.google.com with SMTP id g19so802214ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 09:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/7xSL/AsHypSFYKcxp1qrPw/EUzYqsF1yA8N0V7AkMM=;
	b=bxiimVC/T/NlwxUGiCE2HntGwGc7Gs+3SemJcE9tk7F7fSTgIh61otnlrw/pQu1Qyj
	9q1UG+AAl7h1eGJe1LGtvfan0EUiPj2s/4lMfSXzTIwyyt3eidZZMvFRR2iirAWxvwoJ
	i4Flu+bsbcbxybzkAWKUjV5+6FEpqDyh/LYkE=
Received: by 10.101.18.12 with SMTP id v12mr3490308ani.59.1327684439449;
	Fri, 27 Jan 2012 09:13:59 -0800 (PST)
Received: from sb-u1004lts-64bit.alm.mentorg.com (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id f47sm14547996yhh.8.2012.01.27.09.13.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 09:13:58 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2012 11:13:46 -0600
Message-Id: <11a449c2659341f946915682c39d04a6e4a43d1a.1327684024.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <cover.1327684024.git.chris_larson@mentor.com>
References: <cover.1327684024.git.chris_larson@mentor.com>
In-Reply-To: <cover.1327684024.git.chris_larson@mentor.com>
References: <cover.1327684024.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 08/10] external-csl-toolchain: support ia32
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
X-List-Received-Date: Fri, 27 Jan 2012 17:21:48 -0000

From: Christopher Larson <chris_larson@mentor.com>

Unfortunately, the CSL ia32 toolchain has non-prefixed binaries in its bindir
(e.g. gcc, ld). To avoid this messing up our build, we avoid adding this
bindir to our PATH, and instead add symlinks to the prefixed binaries to our
staging toolchain bindir.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/conf/distro/include/tcmode-external-csl.inc |   59 +++++++++++++++++++++-
 meta/recipes-core/meta/external-csl-toolchain.bb |    5 ++
 2 files changed, 63 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-external-csl.inc b/meta/conf/distro/include/tcmode-external-csl.inc
index 1d82ca1..0135590 100644
--- a/meta/conf/distro/include/tcmode-external-csl.inc
+++ b/meta/conf/distro/include/tcmode-external-csl.inc
@@ -4,7 +4,8 @@
 
 EXTERNAL_TOOLCHAIN ?= "/usr/local/csl/${TARGET_ARCH}"
 
-PATH =. "${EXTERNAL_TOOLCHAIN}/bin:"
+TOOLCHAIN_PATH_ADD = "${EXTERNAL_TOOLCHAIN}/bin:"
+PATH =. "${TOOLCHAIN_PATH_ADD}"
 
 CSL_TARGET_SYS_powerpc = "powerpc-linux-gnu"
 CSL_TARGET_SYS_powerpc64 = "powerpc-linux-gnu"
@@ -12,6 +13,8 @@ CSL_TARGET_SYS_arm = "arm-none-linux-gnueabi"
 CSL_TARGET_SYS_mips = "mips-linux-gnu"
 CSL_TARGET_SYS_mipsel = "mips-linux-gnu"
 CSL_TARGET_SYS_mips64 = "mips-linux-gnu"
+CSL_TARGET_SYS_i686 = "i686-pc-linux-gnu"
+CSL_TARGET_SYS_i586 = "i686-pc-linux-gnu"
 CSL_TARGET_SYS = "${TARGET_SYS}"
 
 TARGET_PREFIX = "${CSL_TARGET_SYS}-"
@@ -41,6 +44,8 @@ TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_HOST}"
 def csl_target_core(d):
     coredata = {
         'armv7a-vfp-neon': 'armv7-a-neon',
+        'i586': 'sgxx-glibc',
+        'i686': 'sgxx-glibc',
         'mips': 'mips32',
         'mipsel': 'el',
         'ppce500': 'te500v1',
@@ -51,3 +56,55 @@ def csl_target_core(d):
     return coredata.get(d.getVar('TUNE_PKGARCH', True), '')
 
 CSL_TARGET_CORE = "${@csl_target_core(d)}"
+
+# Unfortunately, the CSL ia32 toolchain has non-prefixed binaries in its
+# bindir (e.g. gcc, ld). To avoid this messing up our build, we avoid adding
+# this bindir to our PATH, and instead add symlinks to the prefixed binaries
+# to our staging toolchain bindir.
+
+python toolchain_metadata_setup () {
+    if not isinstance(e, bb.event.ConfigParsed):
+        return
+
+    d = e.data
+
+    if d.getVar('TUNE_PKGARCH', True) in ('i586', 'i686'):
+        d.setVar('TOOLCHAIN_PATH_ADD', '')
+}
+addhandler toolchain_metadata_setup
+
+python toolchain_setup () {
+    if not isinstance(e, bb.event.BuildStarted):
+        return
+
+    d = e.data
+
+    if d.getVar('TUNE_PKGARCH', True) in ('i586', 'i686'):
+        populate_toolchain_links(d)
+}
+addhandler toolchain_setup
+
+def populate_toolchain_links(d):
+    import errno
+    import os
+    from glob import glob
+
+    d = d.createCopy()
+    d.finalize()
+
+    pattern = bb.data.expand('${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}*', d)
+    files = glob(pattern)
+    if not files:
+        bb.fatal("Unable to populate toolchain binary symlinks")
+
+    bindir = d.getVar('STAGING_BINDIR_TOOLCHAIN', True)
+    bb.mkdirhier(bindir)
+    for f in files:
+        base = os.path.basename(f)
+        newpath = os.path.join(bindir, base)
+        try:
+            os.symlink(f, newpath)
+        except OSError as exc:
+            if exc.errno == errno.EEXIST:
+                break
+            bb.fatal("Unable to populate toolchain binary symlink for %s: %s" % (newpath, exc))
diff --git a/meta/recipes-core/meta/external-csl-toolchain.bb b/meta/recipes-core/meta/external-csl-toolchain.bb
index 37ea271..a866e3e 100644
--- a/meta/recipes-core/meta/external-csl-toolchain.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain.bb
@@ -60,6 +60,11 @@ external_toolchain_sysroot_adjust() {
                rm -f ${SYSROOT_DESTDIR}/${CSL_TARGET_CORE}
                ln -s . ${SYSROOT_DESTDIR}/${CSL_TARGET_CORE}
        fi
+
+       if [ "${TUNE_PKGARCH}" = "i586" ]; then
+               rm -f ${SYSROOT_DESTDIR}/system32
+               ln -s . ${SYSROOT_DESTDIR}/system32
+       fi
 }
 
 GLIBC_INTERNAL_USE_BINARY_LOCALE ?= "compile"
-- 
1.7.8.rc4



