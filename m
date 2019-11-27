Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 93BDF7FA02
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 03:29:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Nov 2019 19:29:55 -0800
X-IronPort-AV: E=Sophos;i="5.69,248,1571727600"; d="scan'208";a="383364234"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.19.240])
	by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Nov 2019 19:29:54 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2019 11:29:50 +0800
Message-Id: <20191127032950.8125-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] libarchive: fix CVE-2019-19221
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
X-List-Received-Date: Wed, 27 Nov 2019 03:29:54 -0000
Content-Transfer-Encoding: 8bit

Also see:
https://github.com/libarchive/libarchive/issues/1276

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libarchive/CVE-2019-19221.patch           | 101 ++++++++++++++++++
 .../libarchive/libarchive_3.4.0.bb            |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2019-19221.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2019-19221.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2019-19221.patch
new file mode 100644
index 0000000000..b57e87874f
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2019-19221.patch
@@ -0,0 +1,101 @@
+From 22b1db9d46654afc6f0c28f90af8cdc84a199f41 Mon Sep 17 00:00:00 2001
+From: Martin Matuska <martin@matuska.org>
+Date: Thu, 21 Nov 2019 03:08:40 +0100
+Subject: [PATCH] Bugfix and optimize archive_wstring_append_from_mbs()
+
+The cal to mbrtowc() or mbtowc() should read up to mbs_length
+bytes and not wcs_length. This avoids out-of-bounds reads.
+
+mbrtowc() and mbtowc() return (size_t)-1 wit errno EILSEQ when
+they encounter an invalid multibyte character and (size_t)-2 when
+they they encounter an incomplete multibyte character. As we return
+failure and all our callers error out it makes no sense to continue
+parsing mbs.
+
+As we allocate `len` wchars at the beginning and each wchar has
+at least one byte, there will never be need to grow the buffer,
+so the code can be left out. On the other hand, we are always
+allocatng more memory than we need.
+
+As long as wcs_length == mbs_length == len we can omit wcs_length.
+We keep the old code commented if we decide to save memory and
+use autoexpanding wcs_length in the future.
+
+Fixes #1276
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/22b1db9d46654afc6f0c28f90af8cdc84a199f41]
+CVE: CVE-2019-19221
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ libarchive/archive_string.c | 28 +++++++++++++++++-----------
+ 1 file changed, 17 insertions(+), 11 deletions(-)
+
+diff --git a/libarchive/archive_string.c b/libarchive/archive_string.c
+index 979a418b6..bd39c96f1 100644
+--- a/libarchive/archive_string.c
++++ b/libarchive/archive_string.c
+@@ -591,7 +591,7 @@ archive_wstring_append_from_mbs(struct archive_wstring *dest,
+ 	 * No single byte will be more than one wide character,
+ 	 * so this length estimate will always be big enough.
+ 	 */
+-	size_t wcs_length = len;
++	// size_t wcs_length = len;
+ 	size_t mbs_length = len;
+ 	const char *mbs = p;
+ 	wchar_t *wcs;
+@@ -600,7 +600,11 @@ archive_wstring_append_from_mbs(struct archive_wstring *dest,
+ 
+ 	memset(&shift_state, 0, sizeof(shift_state));
+ #endif
+-	if (NULL == archive_wstring_ensure(dest, dest->length + wcs_length + 1))
++	/*
++	 * As we decided to have wcs_length == mbs_length == len
++	 * we can use len here instead of wcs_length
++	 */
++	if (NULL == archive_wstring_ensure(dest, dest->length + len + 1))
+ 		return (-1);
+ 	wcs = dest->s + dest->length;
+ 	/*
+@@ -609,6 +613,12 @@ archive_wstring_append_from_mbs(struct archive_wstring *dest,
+ 	 * multi bytes.
+ 	 */
+ 	while (*mbs && mbs_length > 0) {
++		/*
++		 * The buffer we allocated is always big enough.
++		 * Keep this code path in a comment if we decide to choose
++		 * smaller wcs_length in the future
++		 */
++/*
+ 		if (wcs_length == 0) {
+ 			dest->length = wcs - dest->s;
+ 			dest->s[dest->length] = L'\0';
+@@ -618,24 +628,20 @@ archive_wstring_append_from_mbs(struct archive_wstring *dest,
+ 				return (-1);
+ 			wcs = dest->s + dest->length;
+ 		}
++*/
+ #if HAVE_MBRTOWC
+-		r = mbrtowc(wcs, mbs, wcs_length, &shift_state);
++		r = mbrtowc(wcs, mbs, mbs_length, &shift_state);
+ #else
+-		r = mbtowc(wcs, mbs, wcs_length);
++		r = mbtowc(wcs, mbs, mbs_length);
+ #endif
+ 		if (r == (size_t)-1 || r == (size_t)-2) {
+ 			ret_val = -1;
+-			if (errno == EILSEQ) {
+-				++mbs;
+-				--mbs_length;
+-				continue;
+-			} else
+-				break;
++			break;
+ 		}
+ 		if (r == 0 || r > mbs_length)
+ 			break;
+ 		wcs++;
+-		wcs_length--;
++		// wcs_length--;
+ 		mbs += r;
+ 		mbs_length -= r;
+ 	}
diff --git a/meta/recipes-extended/libarchive/libarchive_3.4.0.bb b/meta/recipes-extended/libarchive/libarchive_3.4.0.bb
index 9c0d5e26ec..755a9c7fa4 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.4.0.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.4.0.bb
@@ -32,6 +32,7 @@ PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4,"
 EXTRA_OECONF += "--enable-largefile"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
+           file://CVE-2019-19221.patch \
 "
 
 SRC_URI[md5sum] = "6046396255bd7cf6d0f6603a9bda39ac"
-- 
2.21.0


