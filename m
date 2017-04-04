Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id E968071D87
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 14:40:02 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id w204so5157357wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Apr 2017 07:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=tTrukrjic5Uyb8TxrOSzdDcr4B6NDPeQI+5ZJBJ7rag=;
	b=tJ40COQev6d10FJCZ7fAq4LtZ1PAuRVQP3eMT6BntTjpVUD1J7temKmbfYFwFr7nD3
	Ozn+bdfH6GKIj/BNvm6p0XqveiTe1rCcFx0wqDyeLNO5Rcr7j2qj5J+SoJGE4LJ2TaHn
	Fq8h1WrmX1JFWxOeqAeR1OhRWWlB+9ijJChcWHaHbGOubW2zc4v/fX+B2bflhctZr38i
	gDtp4vrW5tfxyYzK3fAauRrSX4+JayHxMTolVS7YNHtvGamisszqO3dN/Fy2jswvUPEQ
	YyDhF6eWWvJTr4yDPsgY5oQc1/sCG/UvWZMXOfxThro06Ctui2YoYSmUJv0c9waUtDGm
	4sKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=tTrukrjic5Uyb8TxrOSzdDcr4B6NDPeQI+5ZJBJ7rag=;
	b=mldN1d5kF73+XjUGmnRKdixvFZfp94jPAiKF/LG/nDhau7Ckv1vc/GAEiu4dIbJQWW
	pfeRsgonT/JdQEBhyh4DXGrw2S2gxFrjktmUAdqsD2+NcnEyqG6AEcPUZLvAXq2xdaaj
	ROB2d2CGijWjEyv4wtPCch6Q0qsVUG/9mbojpPAwoifmkyoZ8qv5/fU6Vrst2nfxBBFs
	RJwBu1M6JZ4DIOvq82AoUNewDLwYoMMLw4NGc1K+pkemlCosAEjplU5UEToraZ4F+BvZ
	KT8GvljxlInKgWCRUKGB/55z3YEWnhCFuqRfp8FfcaLbzuf7AcSPfrN0o7FOjmRzLVmF
	nHtA==
X-Gm-Message-State: AFeK/H1YsM0S+7BJGaWm3589mJsaDrT7wKtkH/YKt0TqvJgNcoUYPqCjY02avBjlu+ghy5He
X-Received: by 10.28.52.137 with SMTP id b131mr15226120wma.30.1491316803188;
	Tue, 04 Apr 2017 07:40:03 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 43sm6221373wry.64.2017.04.04.07.40.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Apr 2017 07:40:02 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Apr 2017 15:40:01 +0100
Message-Id: <1491316801-31005-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] gpgme: fix configure if 'import distutils' causes output on stderr
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
X-List-Received-Date: Tue, 04 Apr 2017 14:40:03 -0000

There are a number of reasons that importing a module could cause output on
stderr that isn't a fatal error (compatibilty problems with inputrc, or encoding
warnings) so backport a patch from autoconf-archive to only check the exit code
instead of asserting that stderr is empty.

[ YOCTO #11231 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/gpgme/gpgme/python-import.patch | 19 +++++++++++++++++++
 meta/recipes-support/gpgme/gpgme_1.8.0.bb            |  2 +-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gpgme/gpgme/python-import.patch

diff --git a/meta/recipes-support/gpgme/gpgme/python-import.patch b/meta/recipes-support/gpgme/gpgme/python-import.patch
new file mode 100644
index 0000000..61b77a1
--- /dev/null
+++ b/meta/recipes-support/gpgme/gpgme/python-import.patch
@@ -0,0 +1,19 @@
+Don't check for output on stderr to know if an import worked, host inputrc and
+sysroot readline can cause warnings on stderr.
+
+Upstream-Status: Backport (from autoconf-archive 883a2abd)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/m4/ax_python_devel.m4 b/m4/ax_python_devel.m4
+index b990d5b..318b089 100644
+--- a/m4/ax_python_devel.m4
++++ b/m4/ax_python_devel.m4
+@@ -137,7 +137,7 @@ variable to configure. See ``configure --help'' for reference.
+ 	#
+ 	AC_MSG_CHECKING([for the distutils Python package])
+ 	ac_distutils_result=`$PYTHON -c "import distutils" 2>&1`
+-	if test -z "$ac_distutils_result"; then
++	if test $? -eq 0; then
+ 		AC_MSG_RESULT([yes])
+ 	else
+ 		AC_MSG_RESULT([no])
diff --git a/meta/recipes-support/gpgme/gpgme_1.8.0.bb b/meta/recipes-support/gpgme/gpgme_1.8.0.bb
index 2756ef8..eddf3a0 100644
--- a/meta/recipes-support/gpgme/gpgme_1.8.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.8.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://python-lang-config.patch \
            file://0001-Correctly-install-python-modules.patch \
            file://0001-Avoid-host-contamination-from-gpg-config.patch \
+           file://python-import.patch \
           "
 
 SRC_URI[md5sum] = "722a4153904b9b5dc15485a22d29263b"
@@ -70,4 +71,3 @@ do_configure_prepend () {
 	rm -f ${S}/m4/gpg-error.m4
 	rm -f ${S}/m4/libassuan.m4
 }
-
-- 
2.8.1


