Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web12.2655.1588755397569873819
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 01:56:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=ZK/xwjGh;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=388eec6a1=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588755397; x=1620291397;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zOUF19jCI3+COyVBBvG1FbGGP2kDCfZP9Q90btfLVMo=;
  b=ZK/xwjGhHdhnMfXv9w3cr8QpbVHAFTDTorSzkDSJYoNxFeCaXt1G60xr
   zhEF1xuFf3Ck2VpkCRLvaOiDqajHyuV4MmPefMzzwMkhU+sh052kbyp45
   2P6aOaAiPqYPnbgdJ5q4TNU7+g/xprzecLJOa9JdKBzDLGoLNKp7fOQ4q
   2ehj92CSVSYyr8/12Wo9VymbN/XWgSobqYyP9GunyUiqOEEOeri9iq3XM
   qx8utXXH2zuRC/JZ/iWIxQRjqXOmxq0O+PMqTFc7iwiuCFSM+9irV3epH
   QPrk2mithnE7zo/q9/D6CE/+2bxPYqnD87jh0gnT1Zoc86EmRysebIMta
   g==;
IronPort-SDR: GZPXd+9nIhgUF9gsRV3HZzGdreItLsM6zZJFhjNALaIlwGKG5fruNLcvqzAj5bPnZEMlVGaWiT
 /DwwHLJj7vxNCGmY6Fe9YQf0fqTGDDbiwcrN/QA3jmkQdXOgtnApJ398a0BfMGF31SC5LjGMMb
 uGLlkZ4mrF2x6xQs6Jns7iKSe6buPyYWiD9fv3A1luL8gGI5qDS1u6FfV/U8OkdV235to05GcI
 bHnyh9FoLM5n3SfCTL4X1iRxnBugQwfF9SN0+2dw5Pm04n1IWnDqhJ8S2dyle7Lm/sqdAbZPjw
 2FE=
X-IronPort-AV: E=Sophos;i="5.73,358,1583190000"; 
   d="scan'208";a="24186520"
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-core@lists.openembedded.org>
CC: Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH 1/2] binutils: add patch to fix issues with gcc 10
Date: Wed, 6 May 2020 10:56:18 +0200
Message-ID: <20200506085619.2110220-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

gcc 10 introduced "-fno-common" as default. Therefore backport the
according binutils patch to fix this issue.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 .../binutils/binutils-2.34.inc                |  1 +
 ...dundant-program_name-definition-fno-.patch | 63 +++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index 66a3850ef2..f65fdb7328 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -41,6 +41,7 @@ SRC_URI = "\
      file://0014-Detect-64-bit-MIPS-targets.patch \
      file://0015-sync-with-OE-libtool-changes.patch \
      file://0016-Check-for-clang-before-checking-gcc-version.patch \
+     file://0017-binutils-drop-redundant-program_name-definition-fno-.patch \
      file://CVE-2020-0551.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch b/meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch
new file mode 100644
index 0000000000..76d24eec6e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch
@@ -0,0 +1,63 @@
+From 57a3e055605b28a9449b1b27eda7125737c42b00 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <siarheit@google.com>
+Date: Sat, 1 Feb 2020 23:16:11 +0000
+Subject: [PATCH] binutils: drop redundant 'program_name' definition
+ (-fno-common)
+
+	* coffdump.c (program_name): Drop redundant definition.
+	* srconv.c (program_name): Likewise
+	* sysdump.c (program_name): Likewise
+
+This is binutils upstream commit 0b398d69ac (binutils: drop redundant
+'program_name' definition (-fno-common), 2020-02-01)
+
+Signed-off-by: Sergei Trofimovich <siarheit@google.com>
+Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
+---
+ binutils/coffdump.c | 2 --
+ binutils/srconv.c   | 2 --
+ binutils/sysdump.c  | 2 --
+ 3 files changed, 6 deletions(-)
+
+diff --git a/binutils/coffdump.c b/binutils/coffdump.c
+index 531a4e46c3..336da57ca2 100644
+--- a/binutils/coffdump.c
++++ b/binutils/coffdump.c
+@@ -456,8 +456,6 @@ coff_dump (struct coff_ofile *ptr)
+     dump_coff_section (ptr->sections + i);
+ }
+ 
+-char * program_name;
+-
+ static void
+ show_usage (FILE *file, int status)
+ {
+diff --git a/binutils/srconv.c b/binutils/srconv.c
+index 5742b16759..f071794f0a 100644
+--- a/binutils/srconv.c
++++ b/binutils/srconv.c
+@@ -1687,8 +1687,6 @@ prescan (struct coff_ofile *otree)
+     }
+ }
+ 
+-char *program_name;
+-
+ ATTRIBUTE_NORETURN static void
+ show_usage (FILE *ffile, int status)
+ {
+diff --git a/binutils/sysdump.c b/binutils/sysdump.c
+index d433e71ed9..7eebbd61d3 100644
+--- a/binutils/sysdump.c
++++ b/binutils/sysdump.c
+@@ -633,8 +633,6 @@ module (void)
+     }
+ }
+ 
+-char *program_name;
+-
+ ATTRIBUTE_NORETURN static void
+ show_usage (FILE *ffile, int status)
+ {
+-- 
+2.26.2
+
-- 
2.26.2

