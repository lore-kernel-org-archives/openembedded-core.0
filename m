Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF8E65FEC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 15:00:53 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id ft15so7134300pdb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Sep 2014 08:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6gmE9JsKSX/DT0cPj0aLlHVQx/fns06RHMXFVTDP7t8=;
	b=AUEQFRarLHw1Zt2FaFDTOT+jdGERB9aPFjx0p05MDoNkShv0IGB+qKBg041YJqFY5r
	Ubm+vOJyQ56Ma9RrJjunwf8Zgirlpb/GMH0HwaxC2GpPQ49LDiwvkYfffvLF44qfeJaZ
	sP+TZXIzwe8AD0xoGIo3YDeAhU3fakvJfuy3iN2wHGhw2a9VeIR3/WQ0CsoRQqs9v982
	D6kWHZIQMmMexRHO874BoDKeqgpPId8UBhKSAedhCz+T33rzvMPWV8ISvxPuDJbtez36
	cCZ27GN5GYIdaqd4LKHgiy9EWYSNe1OkQbQv18fE9xBcV/r0S2lH794f1JVybKHb1Qj/
	4CAQ==
X-Received: by 10.68.197.170 with SMTP id iv10mr17402706pbc.129.1410274854754; 
	Tue, 09 Sep 2014 08:00:54 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218]) by mx.google.com with ESMTPSA id
	ta6sm12449422pac.14.2014.09.09.08.00.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Sep 2014 08:00:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Sep 2014 08:04:29 -0700
Message-Id: <1410275069-6700-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] glibc: Incremental bump to 2.20 release branch
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
X-List-Received-Date: Tue, 09 Sep 2014 15:01:02 -0000

Now that glibc 2.20 has been released. We switch
to use release branch and remove the already applied
patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../glibc/cross-localedef-native_2.20.bb           |    4 +-
 .../0001-Define-__GI_fegetenv-for-e500-libm.patch  |   45 --------------------
 meta/recipes-core/glibc/glibc_2.20.bb              |    5 +--
 3 files changed, 4 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0001-Define-__GI_fegetenv-for-e500-libm.patch

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.20.bb b/meta/recipes-core/glibc/cross-localedef-native_2.20.bb
index fd8c242..ccf56a9 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.20.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.20.bb
@@ -16,7 +16,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/glibc:"
 
 PV = "2.20"
 
-SRC_URI = "git://sourceware.org/git/glibc.git;branch=master;name=glibc \
+SRC_URI = "git://sourceware.org/git/glibc.git;branch=release/${PV}/master;name=glibc \
            git://github.com/kraj/localedef;branch=master;name=localedef;destsuffix=git/localedef \
 	   file://fix_for_centos_5.8.patch \
            ${EGLIBCPATCHES} \
@@ -33,7 +33,7 @@ EGLIBCPATCHES = "\
            file://eglibc-use-option-groups.patch \
           "
 
-SRCREV_glibc = "529bf51595fffbe80023e7d895b671391991bb1b"
+SRCREV_glibc = "b8079dd0d360648e4e8de48656c5c38972621072"
 SRCREV_localedef = "c833367348d39dad7ba018990bfdaffaec8e9ed3"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/glibc/glibc/0001-Define-__GI_fegetenv-for-e500-libm.patch b/meta/recipes-core/glibc/glibc/0001-Define-__GI_fegetenv-for-e500-libm.patch
deleted file mode 100644
index c0e155c..0000000
--- a/meta/recipes-core/glibc/glibc/0001-Define-__GI_fegetenv-for-e500-libm.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 07299d036672c86b278256e55ae0cbdae8f751fd Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Aug 2014 16:46:14 -0700
-Subject: [PATCH] Define __GI_fegetenv for e500 libm
-
-generic HAVE_RM_CTX implementation which is used for ppc/e500 as well
-has introduced calls to fegetenv which should be resolved internally
-with in libm
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Submitted
-
----
- ChangeLog                                       | 5 +++++
- sysdeps/powerpc/powerpc32/e500/nofpu/fegetenv.c | 1 +
- 2 files changed, 6 insertions(+)
-
-diff --git a/ChangeLog b/ChangeLog
-index 6261ed4..629ea8e 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,8 @@
-+2014-08-29  Khem Raj  <raj.khem@gmail.com>
-+
-+	* sysdeps/powerpc/powerpc32/e500/nofpu/fegetenv.c (fegetenv): Add
-+	libm_hidden_ver.
-+
- 2014-08-27  Allan McRae  <allan@archlinux.org>
- 
- 	* sysdeps/i386/fpu/libm-test-ulps: Update ULPs.
-diff --git a/sysdeps/powerpc/powerpc32/e500/nofpu/fegetenv.c b/sysdeps/powerpc/powerpc32/e500/nofpu/fegetenv.c
-index 2ae06b8..5faabe8 100644
---- a/sysdeps/powerpc/powerpc32/e500/nofpu/fegetenv.c
-+++ b/sysdeps/powerpc/powerpc32/e500/nofpu/fegetenv.c
-@@ -43,5 +43,6 @@ __fegetenv (fenv_t *envp)
- strong_alias (__fegetenv, __old_fegetenv)
- compat_symbol (libm, __old_fegetenv, fegetenv, GLIBC_2_1);
- #endif
-+libm_hidden_ver (__fegetenv, fegetenv)
- 
- versioned_symbol (libm, __fegetenv, fegetenv, GLIBC_2_2);
--- 
-2.1.0
-
diff --git a/meta/recipes-core/glibc/glibc_2.20.bb b/meta/recipes-core/glibc/glibc_2.20.bb
index c6ef34a..30a4397 100644
--- a/meta/recipes-core/glibc/glibc_2.20.bb
+++ b/meta/recipes-core/glibc/glibc_2.20.bb
@@ -4,9 +4,9 @@ DEPENDS += "gperf-native kconfig-frontends-native"
 
 PV = "2.20"
 
-SRCREV = "529bf51595fffbe80023e7d895b671391991bb1b"
+SRCREV = "b8079dd0d360648e4e8de48656c5c38972621072"
 
-SRC_URI = "git://sourceware.org/git/glibc.git;branch=master \
+SRC_URI = "git://sourceware.org/git/glibc.git;branch=release/${PV}/master \
            file://IO-acquire-lock-fix.patch \
            file://mips-rld-map-check.patch \
            file://etc/ld.so.conf \
@@ -23,7 +23,6 @@ SRC_URI = "git://sourceware.org/git/glibc.git;branch=master \
            file://ppce6500-32b_slow_ieee754_sqrt.patch \
            file://grok_gold.patch \
            file://fix_am_rootsbindir.patch \
-           file://0001-Define-__GI_fegetenv-for-e500-libm.patch \
            ${EGLIBCPATCHES} \
           "
 EGLIBCPATCHES = "\
-- 
1.7.10.4


