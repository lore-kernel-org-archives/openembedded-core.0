Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 986D865CF5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 08:07:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5T87BFZ002002
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 01:07:12 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 29 Jun 2015 01:07:11 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Jun 2015 16:06:57 +0800
Message-ID: <1435565217-24812-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] unzip: drop 12-cve-2014-9636-test-compr-eb.patch
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
X-List-Received-Date: Mon, 29 Jun 2015 08:07:11 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

12-cve-2014-9636-test-compr-eb.patch is same as unzip-6.0_overflow3.diff,
is to fix CVE-2014-9636

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../unzip/12-cve-2014-9636-test-compr-eb.patch     | 45 ----------------------
 meta/recipes-extended/unzip/unzip_6.0.bb           |  1 -
 2 files changed, 46 deletions(-)
 delete mode 100644 meta/recipes-extended/unzip/unzip/12-cve-2014-9636-test-compr-eb.patch

diff --git a/meta/recipes-extended/unzip/unzip/12-cve-2014-9636-test-compr-eb.patch b/meta/recipes-extended/unzip/unzip/12-cve-2014-9636-test-compr-eb.patch
deleted file mode 100644
index b64dd99..0000000
--- a/meta/recipes-extended/unzip/unzip/12-cve-2014-9636-test-compr-eb.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From: mancha <mancha1 AT zoho DOT com>
-Date: Mon, 3 Nov 2014
-Subject: Info-ZIP UnZip buffer overflow
-Bug-Debian: http://bugs.debian.org/776589
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
-The patch comes from unzip_6.0-8+deb7u2.debian.tar.gz
-
-Upstream-Status: Backport
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
-
---- a/extract.c
-+++ b/extract.c
-@@ -2229,6 +2229,7 @@ static int test_compr_eb(__G__ eb, eb_size, compr_offset, test_uc_ebdata)
-     uch *eb_ucptr;
-     int r;
-     ush method;
-+    ush eb_compr_method;
- 
-     if (compr_offset < 4)                /* field is not compressed: */
-         return PK_OK;                    /* do nothing and signal OK */
-@@ -2244,6 +2245,14 @@
-      ((eb_ucsize > 0L) && (eb_size <= (compr_offset + EB_CMPRHEADLEN))))
-         return IZ_EF_TRUNC;             /* no/bad compressed data! */
- 
-+    /* 2014-11-03 Michal Zalewski, SMS.
-+     * For STORE method, compressed and uncompressed sizes must agree.
-+     * http://www.info-zip.org/phpBB3/viewtopic.php?f=7&t=450
-+     */
-+    eb_compr_method = makeword( eb + (EB_HEADSIZE + compr_offset));
-+    if ((eb_compr_method == STORED) && (eb_size - compr_offset != eb_ucsize))
-+        return PK_ERR;
-+
-     if (
- #ifdef INT_16BIT
-         (((ulg)(extent)eb_ucsize) != eb_ucsize) ||
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index b022f21..4a0a713 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -14,7 +14,6 @@ SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/unzip60.tgz \
 	file://09-cve-2014-8139-crc-overflow.patch \
 	file://10-cve-2014-8140-test-compr-eb.patch \
 	file://11-cve-2014-8141-getzip64data.patch \
-	file://12-cve-2014-9636-test-compr-eb.patch \
 "
 
 SRC_URI[md5sum] = "62b490407489521db863b523a7f86375"
-- 
1.9.1


