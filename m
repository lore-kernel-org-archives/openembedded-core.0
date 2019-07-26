Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B71C77F13D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 04:47:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Jul 2019 21:47:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,309,1559545200"; d="scan'208";a="172069559"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga007.fm.intel.com with ESMTP; 25 Jul 2019 21:47:40 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2019 12:47:27 +0800
Message-Id: <1564116449-69248-5-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564116449-69248-1-git-send-email-anuj.mittal@intel.com>
References: <1564116449-69248-1-git-send-email-anuj.mittal@intel.com>
Subject: [warrior][PATCH 5/7] bzip2: fix CVE-2019-12900
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
X-List-Received-Date: Fri, 26 Jul 2019 04:47:40 -0000

Also include a patch to fix regression caused by it. See:

https://gitlab.com/federicomenaquintero/bzip2/issues/24

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../bzip2/bzip2-1.0.6/CVE-2019-12900.patch         | 33 +++++++++
 .../fix-regression-CVE-2019-12900.patch            | 82 ++++++++++++++++++++++
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |  2 +
 3 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
 create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/fix-regression-CVE-2019-12900.patch

diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
new file mode 100644
index 0000000..9841644
--- /dev/null
+++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
@@ -0,0 +1,33 @@
+From 11e1fac27eb8a3076382200736874c78e09b75d6 Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2019-12900
+Upstream-Status: Backport
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+---
+ decompress.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/decompress.c b/decompress.c
+index 311f566..b6e0a29 100644
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
diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/fix-regression-CVE-2019-12900.patch b/meta/recipes-extended/bzip2/bzip2-1.0.6/fix-regression-CVE-2019-12900.patch
new file mode 100644
index 0000000..362e6cf
--- /dev/null
+++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/fix-regression-CVE-2019-12900.patch
@@ -0,0 +1,82 @@
+From 212f3ed7ac3931c9e0e9167a0bdc16eeb3c76af4 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Wed, 3 Jul 2019 01:28:11 +0200
+Subject: [PATCH] Accept as many selectors as the file format allows.
+
+But ignore any larger than the theoretical maximum, BZ_MAX_SELECTORS.
+
+The theoretical maximum number of selectors depends on the maximum
+blocksize (900000 bytes) and the number of symbols (50) that can be
+encoded with a different Huffman tree. BZ_MAX_SELECTORS is 18002.
+
+But the bzip2 file format allows the number of selectors to be encoded
+with 15 bits (because 18002 isn't a factor of 2 and doesn't fit in
+14 bits). So the file format maximum is 32767 selectors.
+
+Some bzip2 encoders might actually have written out more selectors
+than the theoretical maximum because they rounded up the number of
+selectors to some convenient factor of 8.
+
+The extra 14766 selectors can never be validly used by the decompression
+algorithm. So we can read them, but then discard them.
+
+This is effectively what was done (by accident) before we added a
+check for nSelectors to be at most BZ_MAX_SELECTORS to mitigate
+CVE-2019-12900.
+
+The extra selectors were written out after the array inside the
+EState struct. But the struct has extra space allocated after the
+selector arrays of 18060 bytes (which is larger than 14766).
+All of which will be initialized later (so the overwrite of that
+space with extra selector values would have been harmless).
+
+Upstream-Status: Backport
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+---
+ compress.c   |  2 +-
+ decompress.c | 10 ++++++++--
+ 2 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/compress.c b/compress.c
+index caf7696..19b662b 100644
+--- a/compress.c
++++ b/compress.c
+@@ -454,7 +454,7 @@ void sendMTFValues ( EState* s )
+ 
+    AssertH( nGroups < 8, 3002 );
+    AssertH( nSelectors < 32768 &&
+-            nSelectors <= (2 + (900000 / BZ_G_SIZE)),
++            nSelectors <= BZ_MAX_SELECTORS,
+             3003 );
+ 
+ 
+diff --git a/decompress.c b/decompress.c
+index b6e0a29..78060c9 100644
+--- a/decompress.c
++++ b/decompress.c
+@@ -287,7 +287,7 @@ Int32 BZ2_decompress ( DState* s )
+       GET_BITS(BZ_X_SELECTOR_1, nGroups, 3);
+       if (nGroups < 2 || nGroups > 6) RETURN(BZ_DATA_ERROR);
+       GET_BITS(BZ_X_SELECTOR_2, nSelectors, 15);
+-      if (nSelectors < 1 || nSelectors > BZ_MAX_SELECTORS) RETURN(BZ_DATA_ERROR);
++      if (nSelectors < 1) RETURN(BZ_DATA_ERROR);
+       for (i = 0; i < nSelectors; i++) {
+          j = 0;
+          while (True) {
+@@ -296,8 +296,14 @@ Int32 BZ2_decompress ( DState* s )
+             j++;
+             if (j >= nGroups) RETURN(BZ_DATA_ERROR);
+          }
+-         s->selectorMtf[i] = j;
++         /* Having more than BZ_MAX_SELECTORS doesn't make much sense
++            since they will never be used, but some implementations might
++            "round up" the number of selectors, so just ignore those. */
++         if (i < BZ_MAX_SELECTORS)
++           s->selectorMtf[i] = j;
+       }
++      if (nSelectors > BZ_MAX_SELECTORS)
++        nSelectors = BZ_MAX_SELECTORS;
+ 
+       /*--- Undo the MTF values for the selectors. ---*/
+       {
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index 7d04e30..d30e1b9 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -14,6 +14,8 @@ SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz \
            file://Makefile.am;subdir=${BP} \
            file://run-ptest \
            file://CVE-2016-3189.patch \
+           file://CVE-2019-12900.patch \
+           file://fix-regression-CVE-2019-12900.patch \
            "
 
 SRC_URI[md5sum] = "00b516f4704d4a7cb50a1d97e6e8e15b"
-- 
2.7.4


