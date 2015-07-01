Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 43DA960088
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 01:41:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t611fq7e028477
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 18:41:52 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 30 Jun 2015 18:41:53 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Jul 2015 09:41:31 +0800
Message-ID: <1435714891-17101-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][v2] unzip: drop unzip-6.0_overflow3.diff
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
X-List-Received-Date: Wed, 01 Jul 2015 01:41:53 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

12-cve-2014-9636-test-compr-eb.patch is same as unzip-6.0_overflow3.diff,
is to fix CVE-2014-9636, so drop unzip-6.0_overflow3.diff; and update
12-cve-2014-9636-test-compr-eb.patch to fix the patch conflict

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../unzip/12-cve-2014-9636-test-compr-eb.patch     | 40 +++++++++----------
 .../unzip/unzip/unzip-6.0_overflow3.diff           | 45 ----------------------
 meta/recipes-extended/unzip/unzip_6.0.bb           |  1 -
 3 files changed, 20 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-extended/unzip/unzip/unzip-6.0_overflow3.diff

diff --git a/meta/recipes-extended/unzip/unzip/12-cve-2014-9636-test-compr-eb.patch b/meta/recipes-extended/unzip/unzip/12-cve-2014-9636-test-compr-eb.patch
index b64dd99..0a0bfbb 100644
--- a/meta/recipes-extended/unzip/unzip/12-cve-2014-9636-test-compr-eb.patch
+++ b/meta/recipes-extended/unzip/unzip/12-cve-2014-9636-test-compr-eb.patch
@@ -1,7 +1,9 @@
+From 190040ebfcf5395a6ccedede2cc9343d34f0a108 Mon Sep 17 00:00:00 2001
 From: mancha <mancha1 AT zoho DOT com>
-Date: Mon, 3 Nov 2014
+Date: Wed, 11 Feb 2015
 Subject: Info-ZIP UnZip buffer overflow
-Bug-Debian: http://bugs.debian.org/776589
+
+Upstream-Status: Backport
 
 By carefully crafting a corrupt ZIP archive with "extra fields" that
 purport to have compressed blocks larger than the corresponding
@@ -12,33 +14,31 @@ possibly have other unspecified impact.
 This patch ensures that when extra fields use STORED mode, the
 "compressed" and uncompressed block sizes match.
 
-The patch comes from unzip_6.0-8+deb7u2.debian.tar.gz
-
-Upstream-Status: Backport
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
+Signed-off-by: mancha <mancha1 AT zoho DOT com>
+---
+ extract.c |    8 ++++++++
+ 1 file changed, 8 insertions(+)
 
 --- a/extract.c
 +++ b/extract.c
-@@ -2229,6 +2229,7 @@ static int test_compr_eb(__G__ eb, eb_size, compr_offset, test_uc_ebdata)
+@@ -2217,6 +2217,7 @@ static int test_compr_eb(__G__ eb, eb_si
+     ulg eb_ucsize;
      uch *eb_ucptr;
      int r;
-     ush method;
-+    ush eb_compr_method;
++    ush method;
  
      if (compr_offset < 4)                /* field is not compressed: */
          return PK_OK;                    /* do nothing and signal OK */
-@@ -2244,6 +2245,14 @@
-      ((eb_ucsize > 0L) && (eb_size <= (compr_offset + EB_CMPRHEADLEN))))
-         return IZ_EF_TRUNC;             /* no/bad compressed data! */
+@@ -2226,6 +2227,13 @@ static int test_compr_eb(__G__ eb, eb_si
+          eb_size <= (compr_offset + EB_CMPRHEADLEN)))
+         return IZ_EF_TRUNC;               /* no compressed data! */
  
-+    /* 2014-11-03 Michal Zalewski, SMS.
-+     * For STORE method, compressed and uncompressed sizes must agree.
-+     * http://www.info-zip.org/phpBB3/viewtopic.php?f=7&t=450
-+     */
-+    eb_compr_method = makeword( eb + (EB_HEADSIZE + compr_offset));
-+    if ((eb_compr_method == STORED) && (eb_size - compr_offset != eb_ucsize))
-+        return PK_ERR;
++    method = makeword(eb + (EB_HEADSIZE + compr_offset));
++    if ((method == STORED) &&
++        (eb_size - compr_offset - EB_CMPRHEADLEN != eb_ucsize))
++	return PK_ERR;			  /* compressed & uncompressed
++					   * should match in STORED
++					   * method */
 +
      if (
  #ifdef INT_16BIT
diff --git a/meta/recipes-extended/unzip/unzip/unzip-6.0_overflow3.diff b/meta/recipes-extended/unzip/unzip/unzip-6.0_overflow3.diff
deleted file mode 100644
index 0a0bfbb..0000000
--- a/meta/recipes-extended/unzip/unzip/unzip-6.0_overflow3.diff
+++ /dev/null
@@ -1,45 +0,0 @@
-From 190040ebfcf5395a6ccedede2cc9343d34f0a108 Mon Sep 17 00:00:00 2001
-From: mancha <mancha1 AT zoho DOT com>
-Date: Wed, 11 Feb 2015
-Subject: Info-ZIP UnZip buffer overflow
-
-Upstream-Status: Backport
-
-By carefully crafting a corrupt ZIP archive with "extra fields" that
-purport to have compressed blocks larger than the corresponding
-uncompressed blocks in STORED no-compression mode, an attacker can
-trigger a heap overflow that can result in application crash or
-possibly have other unspecified impact.
-
-This patch ensures that when extra fields use STORED mode, the
-"compressed" and uncompressed block sizes match.
-
-Signed-off-by: mancha <mancha1 AT zoho DOT com>
----
- extract.c |    8 ++++++++
- 1 file changed, 8 insertions(+)
-
---- a/extract.c
-+++ b/extract.c
-@@ -2217,6 +2217,7 @@ static int test_compr_eb(__G__ eb, eb_si
-     ulg eb_ucsize;
-     uch *eb_ucptr;
-     int r;
-+    ush method;
- 
-     if (compr_offset < 4)                /* field is not compressed: */
-         return PK_OK;                    /* do nothing and signal OK */
-@@ -2226,6 +2227,13 @@ static int test_compr_eb(__G__ eb, eb_si
-          eb_size <= (compr_offset + EB_CMPRHEADLEN)))
-         return IZ_EF_TRUNC;               /* no compressed data! */
- 
-+    method = makeword(eb + (EB_HEADSIZE + compr_offset));
-+    if ((method == STORED) &&
-+        (eb_size - compr_offset - EB_CMPRHEADLEN != eb_ucsize))
-+	return PK_ERR;			  /* compressed & uncompressed
-+					   * should match in STORED
-+					   * method */
-+
-     if (
- #ifdef INT_16BIT
-         (((ulg)(extent)eb_ucsize) != eb_ucsize) ||
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index b022f21..ec9af0c 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -10,7 +10,6 @@ SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/unzip60.tgz \
 	file://avoid-strip.patch \
 	file://define-ldflags.patch \
 	file://06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch \
-	file://unzip-6.0_overflow3.diff \
 	file://09-cve-2014-8139-crc-overflow.patch \
 	file://10-cve-2014-8140-test-compr-eb.patch \
 	file://11-cve-2014-8141-getzip64data.patch \
-- 
1.9.1


