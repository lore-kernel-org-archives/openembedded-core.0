Return-Path: <anatol.oe@belski.net>
X-Greylist: delayed 326 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 29 Jun 2019 18:42:44 UTC
Received: from h1123647.serverkompetenz.net (klapt.com [85.214.73.107])
	by mail.openembedded.org (Postfix) with ESMTP id D15CF7E98F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2019 18:42:44 +0000 (UTC)
Received: by h1123647.serverkompetenz.net (Postfix, from userid 1006)
	id E8BA817A2FDB; Sat, 29 Jun 2019 20:37:18 +0200 (CEST)
Received: from
	anbelski-lsg-linux-yocto-0.jls0im4d1fsuxcyoqe2kuaxlef.yx.internal.cloudapp.net
	(unknown [13.78.141.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by h1123647.serverkompetenz.net (Postfix) with ESMTPSA id 2727F17A2FDB; 
	Sat, 29 Jun 2019 20:37:16 +0200 (CEST)
From: anatol.oe@belski.net
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Jun 2019 18:37:03 +0000
Message-Id: <20190629183703.96352-1-anatol.oe@belski.net>
X-Mailer: git-send-email 2.17.1
Cc: Anatol Belski <anatol.belski@microsoft.com>
Subject: [PATCH] bzip2: Fix CVE-2019-12900
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
X-List-Received-Date: Sat, 29 Jun 2019 18:42:45 -0000

From: Anatol Belski <anatol.belski@microsoft.com>

Affects bzip2 <= 1.0.6

Upstream-Status: Accepted

Upstream patch
https://gitlab.com/federicomenaquintero/bzip2/commit/74de1e2e6ffc9d51ef9824db71a8ffee5962cdbc

Signed-off-by: Anatol Belski <anatol.belski@microsoft.com>
---
 .../bzip2/bzip2-1.0.6/CVE-2019-12900.patch    | 32 +++++++++++++++++++
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb    |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch

diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
new file mode 100644
index 0000000000..9213a713d0
--- /dev/null
+++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
@@ -0,0 +1,32 @@
+From 74de1e2e6ffc9d51ef9824db71a8ffee5962cdbc Mon Sep 17 00:00:00 2001
+From: Albert Astals Cid <aacid@kde.org>
+Date: Tue, 28 May 2019 19:35:18 +0200
+Subject: [PATCH] Make sure nSelectors is not out of range
+
+nSelectors is used in a loop from 0 to nSelectors to access selectorMtf
+which is
+	UChar    selectorMtf[BZ_MAX_SELECTORS];
+so if nSelectors is bigger than BZ_MAX_SELECTORS it'll do an invalid memory
+access
+
+Fixes out of bounds access discovered while fuzzying karchive
+---
+ decompress.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/decompress.c b/decompress.c
+index ab6a624..f3db91d 100644
+--- a/decompress.c
++++ b/decompress.c
+@@ -287,7 +287,7 @@ Int32 BZ2_decompress ( DState* s )
+       GET_BITS(BZ_X_SELECTOR_1, nGroups, 3);
+       if (nGroups < 2 || nGroups > 6) RETURN(BZ_DATA_ERROR);
+       GET_BITS(BZ_X_SELECTOR_2, nSelectors, 15);
+-      if (nSelectors < 1) RETURN(BZ_DATA_ERROR);
++      if (nSelectors < 1 || nSelectors > BZ_MAX_SELECTORS) RETURN(BZ_DATA_ERROR);
+       for (i = 0; i < nSelectors; i++) {
+          j = 0;
+          while (True) {
+-- 
+2.21.0
+
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index acbf80a685..16948bb902 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://sourceware.org/bzip2/"
 SECTION = "console/utils"
 LICENSE = "bzip2"
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=8;endline=37;md5=40d9d1eb05736d1bfc86cfdd9106e6b2"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz \
            file://fix-bunzip2-qt-returns-0-for-corrupt-archives.patch \
@@ -14,6 +14,7 @@ SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz \
            file://Makefile.am;subdir=${BP} \
            file://run-ptest \
            file://CVE-2016-3189.patch \
+           file://CVE-2019-12900.patch \
            "
 
 SRC_URI[md5sum] = "00b516f4704d4a7cb50a1d97e6e8e15b"
-- 
2.17.1


