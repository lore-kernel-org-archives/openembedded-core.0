Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D7AC67FBBB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:14:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47znjq2pylzC6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 18:14:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579281279;
	bh=/HB6zniz5DAdVMakJ2rwSBNXvqYgF4PNJMVPG2uA81I=;
	h=From:To:Subject:Date:From;
	b=sZcDzdBiEaLECZ5oxUK1UhbknEvKGH2L93MvsXqgFjuYeE5/P5ra08FeKX1lBR9AU
	nRFF7jgBpuDuVjJilkfDgQbibpzvh+9jCeujb0v2SpV5+bcalaeqyzvFjb52wMvvbz
	98WdFhGw96gXWCYqP96i/tGq6djV4u8uWbwohLq8VPJtIVUwBCVqMJZzeR9NmolrVb
	+ShSRuZ6EvQzgY3zfaqqSnX+9A9Qb7brkNXXw6Jxc/M6Vpb1c/KbjPzi2DKORLOiBc
	PTLREOpGBXrHeacbfxchmP5S3a5CNxKWyY3pZR4378YIY10PItpHv9ryo6fmmMYd53
	u8xRARypo4VsmejI2TI/AJgDOkANYJSymkQ5cfESSbyZjuGHIHPWawa4mHB1QQBWa+
	9KISxChHA1ze1wulbSgRGkJjEg+sZRa1FCNUjkUdooGZ4CyEOK+syFgrYr4RZN517q
	l+A7cFXL9aNs3iEvKbWh+GWczxxCzdarRz1yIfgn98y1gOJdI+33ehGW7MFg0sCJD/
	zfaJ37tvSXQm5S2Fcl5xja7YJw18nxYlEDO3jzHZv6yxsh5QH76DvT0++4AyYYlHZk
	RSw73W3qpRGSRu0uT29rYQOF/IqR5BIXAVkP/wOi3BvgBDPvIifQiOWxrKYUj9ADg3
	m5wWarSOg9ep1mR+dVwTmXwk=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 19:14:26 +0200
Message-Id: <20200117171436.17131-6-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] libarchive: fix CVE-2019-19221
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
X-List-Received-Date: Fri, 17 Jan 2020 17:14:39 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Also see:
https://github.com/libarchive/libarchive/issues/1276

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../libarchive/CVE-2019-19221.patch           | 101 ++++++++++++++++++
 .../libarchive/libarchive_3.3.3.bb            |   1 +
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
diff --git a/meta/recipes-extended/libarchive/libarchive_3.3.3.bb b/meta/recipes-extended/libarchive/libarchive_3.3.3.bb
index af5ca65297..36d5bffe09 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.3.3.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.3.3.bb
@@ -40,6 +40,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2018-1000880.patch \
            file://CVE-2019-1000019.patch \
            file://CVE-2019-1000020.patch \
+           file://CVE-2019-19221.patch \
 "
 
 SRC_URI[md5sum] = "4038e366ca5b659dae3efcc744e72120"
-- 
2.17.1


