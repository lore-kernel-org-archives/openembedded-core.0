Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8292575FC3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:55 +0000 (UTC)
Received: by pacan13 with SMTP id an13so77391181pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=wtOAg+IZ0Pm+5A7gxgkKT2tkkCGIkrLnMvbXaz4Dn80=;
	b=ubEUtUH3gDO3FWzubr/mhVHxdbTlae0AAjHpMyfHpqEejA6BfEvscAqwajXTEAALqk
	6T+jnVuz8CbNQbNQuZWEfc3VqG5qUgqQkLzu0q7Cg8NKD1st9wL4nqihympNfY07y5a5
	4HRBMVP/9YaVZOMHwC+FbkMu74OhxQDJy6q+1fsCxygTBIzcDsO+E3x7YBTYuTVIj+pe
	0rQk4WKvQuAiahnZGh/yE+qQjGRKyNWiFZCnFAuKzukWbqyMWSnpH/z/Qg2sCCz0sYy4
	PngMGPZi8z59GYMZA45L89IUwSdjTodzxVD6qXZ2LvBxUjmL+2uCw2mffLKfZlmJT1sI
	WKAw==
X-Received: by 10.66.147.68 with SMTP id ti4mr40384608pab.90.1437232616417;
	Sat, 18 Jul 2015 08:16:56 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	tm3sm14691571pac.44.2015.07.18.08.16.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:51 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 5CDA4FC12FE; Sat, 18 Jul 2015 08:16:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:29 -0700
Message-Id: <5e28a55073b306aea5b53d38ba73ccc07e40f12b.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
Subject: [PATCH 22/25] unzip: drop 12-cve-2014-9636-test-compr-eb.patch
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
X-List-Received-Date: Sat, 18 Jul 2015 15:16:57 -0000

From: Roy Li <rongqing.li@windriver.com>

12-cve-2014-9636-test-compr-eb.patch is same as unzip-6.0_overflow3.diff,
is to fix CVE-2014-9636

(From OE-Core rev: 9cf42db4e545cd260faf45931d3b3c63ab3b3aab)

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
index 00b68ad..e590f81 100644
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


