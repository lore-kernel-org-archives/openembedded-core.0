Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 793FE7894E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 14:28:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Mar 2018 07:28:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,330,1517904000"; d="scan'208";a="29285298"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 19 Mar 2018 07:28:50 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Mar 2018 16:22:03 +0200
Message-Id: <20180319142203.23140-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
Subject: [PATCH][rocko] lame: revert "lame: fix CVE-2017-13712"
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
X-List-Received-Date: Mon, 19 Mar 2018 14:28:51 -0000

I don't know how this made it in, but the backported patch most definitely
fails to apply:

ERROR: lame-3.99.5-r1 do_patch: Command Error: 'quilt --quiltrc /home/ak/development/poky/build-musl/tmp/work/core2-64-poky-linux-musl/lame/3.99.5-r1/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
Applying patch CVE-2017-13712.patch
patching file libmp3lame/id3tag.c
Hunk #1 succeeded at 195 with fuzz 1 (offset 1 line).
Hunk #11 succeeded at 1023 (offset 24 lines).
Hunk #12 FAILED at 1051.

The reason we have't seen it is that LICENSE_FLAGS_WHITELIST += " commercial"
needs to be in config to trigger this.

This reverts commit fd994b5bede3724ce23f3766e6109d83e534d3f3.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../lame/lame/CVE-2017-13712.patch                 | 309 ---------------------
 meta/recipes-multimedia/lame/lame_3.99.5.bb        |   4 +-
 2 files changed, 1 insertion(+), 312 deletions(-)
 delete mode 100644 meta/recipes-multimedia/lame/lame/CVE-2017-13712.patch

diff --git a/meta/recipes-multimedia/lame/lame/CVE-2017-13712.patch b/meta/recipes-multimedia/lame/lame/CVE-2017-13712.patch
deleted file mode 100644
index f9ec7665ff3..00000000000
--- a/meta/recipes-multimedia/lame/lame/CVE-2017-13712.patch
+++ /dev/null
@@ -1,309 +0,0 @@
-Upstream-Status: Backport [http://lame.cvs.sourceforge.net/viewvc/lame/lame/libmp3lame/id3tag.c?r1=1.79&r2=1.80]
-
-Backport patch to fix CVE-2017-13712 for lame.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
---- a/libmp3lame/id3tag.c	2017/08/22 19:44:05	1.79
-+++ b/libmp3lame/id3tag.c	2017/08/28 15:39:51	1.80
-@@ -194,7 +194,11 @@
- }
- #endif
- 
--
-+static int
-+is_lame_internal_flags_null(lame_t gfp)
-+{
-+    return (gfp && gfp->internal_flags) ? 0 : 1;
-+}
- 
- static int
- id3v2_add_ucs2_lng(lame_t gfp, uint32_t frame_id, unsigned short const *desc, unsigned short const *text);
-@@ -238,8 +242,7 @@
- static void
- id3v2AddAudioDuration(lame_t gfp, double ms)
- {
--    lame_internal_flags *gfc = gfp != 0 ? gfp->internal_flags : 0;
--    SessionConfig_t const *const cfg = &gfc->cfg;
-+    SessionConfig_t const *const cfg = &gfp->internal_flags->cfg; /* caller checked pointers */
-     char    buffer[1024];
-     double const max_ulong = MAX_U_32_NUM;
-     unsigned long playlength_ms;
-@@ -280,7 +283,12 @@
- void
- id3tag_init(lame_t gfp)
- {
--    lame_internal_flags *gfc = gfp->internal_flags;
-+    lame_internal_flags *gfc = 0;
-+
-+    if (is_lame_internal_flags_null(gfp)) {
-+        return;
-+    }
-+    gfc = gfp->internal_flags;
-     free_id3tag(gfc);
-     memset(&gfc->tag_spec, 0, sizeof gfc->tag_spec);
-     gfc->tag_spec.genre_id3v1 = GENRE_NUM_UNKNOWN;
-@@ -293,7 +301,12 @@
- void
- id3tag_add_v2(lame_t gfp)
- {
--    lame_internal_flags *gfc = gfp->internal_flags;
-+    lame_internal_flags *gfc = 0;
-+
-+    if (is_lame_internal_flags_null(gfp)) {
-+        return;
-+    }
-+    gfc = gfp->internal_flags;
-     gfc->tag_spec.flags &= ~V1_ONLY_FLAG;
-     gfc->tag_spec.flags |= ADD_V2_FLAG;
- }
-@@ -301,7 +314,12 @@
- void
- id3tag_v1_only(lame_t gfp)
- {
--    lame_internal_flags *gfc = gfp->internal_flags;
-+    lame_internal_flags *gfc = 0;
-+
-+    if (is_lame_internal_flags_null(gfp)) {
-+        return;
-+    }
-+    gfc = gfp->internal_flags;
-     gfc->tag_spec.flags &= ~(ADD_V2_FLAG | V2_ONLY_FLAG);
-     gfc->tag_spec.flags |= V1_ONLY_FLAG;
- }
-@@ -309,7 +327,12 @@
- void
- id3tag_v2_only(lame_t gfp)
- {
--    lame_internal_flags *gfc = gfp->internal_flags;
-+    lame_internal_flags *gfc = 0;
-+
-+    if (is_lame_internal_flags_null(gfp)) {
-+        return;
-+    }
-+    gfc = gfp->internal_flags;
-     gfc->tag_spec.flags &= ~V1_ONLY_FLAG;
-     gfc->tag_spec.flags |= V2_ONLY_FLAG;
- }
-@@ -317,7 +340,12 @@
- void
- id3tag_space_v1(lame_t gfp)
- {
--    lame_internal_flags *gfc = gfp->internal_flags;
-+    lame_internal_flags *gfc = 0;
-+
-+    if (is_lame_internal_flags_null(gfp)) {
-+        return;
-+    }
-+    gfc = gfp->internal_flags;
-     gfc->tag_spec.flags &= ~V2_ONLY_FLAG;
-     gfc->tag_spec.flags |= SPACE_V1_FLAG;
- }
-@@ -331,7 +359,12 @@
- void
- id3tag_set_pad(lame_t gfp, size_t n)
- {
--    lame_internal_flags *gfc = gfp->internal_flags;
-+    lame_internal_flags *gfc = 0;
-+
-+    if (is_lame_internal_flags_null(gfp)) {
-+        return;
-+    }
-+    gfc = gfp->internal_flags;
-     gfc->tag_spec.flags &= ~V1_ONLY_FLAG;
-     gfc->tag_spec.flags |= PAD_V2_FLAG;
-     gfc->tag_spec.flags |= ADD_V2_FLAG;
-@@ -583,22 +616,29 @@
- int
- id3tag_set_albumart(lame_t gfp, const char *image, size_t size)
- {
--    int     mimetype = 0;
--    unsigned char const *data = (unsigned char const *) image;
--    lame_internal_flags *gfc = gfp->internal_flags;
--
--    /* determine MIME type from the actual image data */
--    if (2 < size && data[0] == 0xFF && data[1] == 0xD8) {
--        mimetype = MIMETYPE_JPEG;
--    }
--    else if (4 < size && data[0] == 0x89 && strncmp((const char *) &data[1], "PNG", 3) == 0) {
--        mimetype = MIMETYPE_PNG;
--    }
--    else if (4 < size && strncmp((const char *) data, "GIF8", 4) == 0) {
--        mimetype = MIMETYPE_GIF;
-+    int     mimetype = MIMETYPE_NONE;
-+    lame_internal_flags *gfc = 0;
-+
-+    if (is_lame_internal_flags_null(gfp)) {
-+        return 0;
-     }
--    else {
--        return -1;
-+    gfc = gfp->internal_flags;
-+
-+    if (image != 0) {
-+        unsigned char const *data = (unsigned char const *) image;
-+        /* determine MIME type from the actual image data */
-+        if (2 < size && data[0] == 0xFF && data[1] == 0xD8) {
-+            mimetype = MIMETYPE_JPEG;
-+        }
-+        else if (4 < size && data[0] == 0x89 && strncmp((const char *) &data[1], "PNG", 3) == 0) {
-+            mimetype = MIMETYPE_PNG;
-+        }
-+        else if (4 < size && strncmp((const char *) data, "GIF8", 4) == 0) {
-+            mimetype = MIMETYPE_GIF;
-+        }
-+        else {
-+            return -1;
-+        }
-     }
-     if (gfc->tag_spec.albumart != 0) {
-         free(gfc->tag_spec.albumart);
-@@ -606,7 +646,7 @@
-         gfc->tag_spec.albumart_size = 0;
-         gfc->tag_spec.albumart_mimetype = MIMETYPE_NONE;
-     }
--    if (size < 1) {
-+    if (size < 1 || mimetype == MIMETYPE_NONE) {
-         return 0;
-     }
-     gfc->tag_spec.albumart = lame_calloc(unsigned char, size);
-@@ -959,6 +999,9 @@
-     if (frame_id == 0) {
-         return -1;
-     }
-+    if (is_lame_internal_flags_null(gfp)) {
-+        return 0;
-+    }
-     if (text == 0) {
-         return 0;
-     }
-@@ -1008,6 +1051,9 @@
-     if (frame_id == 0) {
-         return -1;
-     }
-+    if (is_lame_internal_flags_null(gfp)) {
-+        return 0;
-+    }
-     if (text == 0) {
-         return 0;
-     }
-@@ -1037,6 +1083,9 @@
- int
- id3tag_set_comment_latin1(lame_t gfp, char const *lang, char const *desc, char const *text)
- {
-+    if (is_lame_internal_flags_null(gfp)) {
-+        return 0;
-+    }
-     return id3v2_add_latin1(gfp, ID_COMMENT, lang, desc, text);
- }
- 
-@@ -1044,6 +1093,9 @@
- int
- id3tag_set_comment_utf16(lame_t gfp, char const *lang, unsigned short const *desc, unsigned short const *text)
- {
-+    if (is_lame_internal_flags_null(gfp)) {
-+        return 0;
-+    }
-     return id3v2_add_ucs2(gfp, ID_COMMENT, lang, desc, text);
- }
- 
-@@ -1054,6 +1106,9 @@
- int
- id3tag_set_comment_ucs2(lame_t gfp, char const *lang, unsigned short const *desc, unsigned short const *text)
- {
-+    if (is_lame_internal_flags_null(gfp)) {
-+        return 0;
-+    }
-     return id3tag_set_comment_utf16(gfp, lang, desc, text);
- }
- 
-@@ -1244,9 +1299,9 @@
- int
- id3tag_set_genre(lame_t gfp, const char *genre)
- {
--    lame_internal_flags *gfc = gfp->internal_flags;
-+    lame_internal_flags *gfc = gfp != 0 ? gfp->internal_flags : 0;
-     int     ret = 0;
--    if (genre && *genre) {
-+    if (gfc && genre && *genre) {
-         int const num = lookupGenre(genre);
-         if (num == -1) return num;
-         gfc->tag_spec.flags |= CHANGED_FLAG;
-@@ -1539,6 +1594,9 @@
- int
- id3tag_set_fieldvalue(lame_t gfp, const char *fieldvalue)
- {
-+    if (is_lame_internal_flags_null(gfp)) {
-+        return 0;
-+    }
-     if (fieldvalue && *fieldvalue) {
-         if (strlen(fieldvalue) < 5 || fieldvalue[4] != '=') {
-             return -1;
-@@ -1551,6 +1609,9 @@
- int
- id3tag_set_fieldvalue_utf16(lame_t gfp, const unsigned short *fieldvalue)
- {
-+    if (is_lame_internal_flags_null(gfp)) {
-+        return 0;
-+    }
-     if (fieldvalue && *fieldvalue) {
-         size_t dx = hasUcs2ByteOrderMarker(fieldvalue[0]);
-         unsigned short const separator = fromLatin1Char(fieldvalue, '=');
-@@ -1581,20 +1642,21 @@
- int
- id3tag_set_fieldvalue_ucs2(lame_t gfp, const unsigned short *fieldvalue)
- {
-+    if (is_lame_internal_flags_null(gfp)) {
-+        return 0;
-+    }
-     return id3tag_set_fieldvalue_utf16(gfp, fieldvalue);
- }
- 
- size_t
- lame_get_id3v2_tag(lame_t gfp, unsigned char *buffer, size_t size)
- {
--    lame_internal_flags *gfc;
--    if (gfp == 0) {
-+    lame_internal_flags *gfc = 0;
-+
-+    if (is_lame_internal_flags_null(gfp)) {
-         return 0;
-     }
-     gfc = gfp->internal_flags;
--    if (gfc == 0) {
--        return 0;
--    }
-     if (test_tag_spec_flags(gfc, V1_ONLY_FLAG)) {
-         return 0;
-     }
-@@ -1736,7 +1798,12 @@
- int
- id3tag_write_v2(lame_t gfp)
- {
--    lame_internal_flags *gfc = gfp->internal_flags;
-+    lame_internal_flags *gfc = 0;
-+
-+    if (is_lame_internal_flags_null(gfp)) {
-+        return 0;
-+    }
-+    gfc = gfp->internal_flags;
- #if 0
-     debug_tag_spec_flags(gfc, "write v2");
- #endif
-@@ -1837,10 +1904,15 @@
- int
- id3tag_write_v1(lame_t gfp)
- {
--    lame_internal_flags *const gfc = gfp->internal_flags;
-+    lame_internal_flags* gfc = 0;
-     size_t  i, n, m;
-     unsigned char tag[128];
- 
-+    if (is_lame_internal_flags_null(gfp)) {
-+        return 0;
-+    }
-+    gfc = gfp->internal_flags;
-+
-     m = sizeof(tag);
-     n = lame_get_id3v1_tag(gfp, tag, m);
-     if (n > m) {
diff --git a/meta/recipes-multimedia/lame/lame_3.99.5.bb b/meta/recipes-multimedia/lame/lame_3.99.5.bb
index e5321bb9d83..047761153dc 100644
--- a/meta/recipes-multimedia/lame/lame_3.99.5.bb
+++ b/meta/recipes-multimedia/lame/lame_3.99.5.bb
@@ -14,9 +14,7 @@ PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lame/lame-${PV}.tar.gz \
            file://no-gtk1.patch \
-           file://lame-3.99.5_fix_for_automake-1.12.x.patch \
-           file://CVE-2017-13712.patch \
-           "
+           file://lame-3.99.5_fix_for_automake-1.12.x.patch "
 
 SRC_URI[md5sum] = "84835b313d4a8b68f5349816d33e07ce"
 SRC_URI[sha256sum] = "24346b4158e4af3bd9f2e194bb23eb473c75fb7377011523353196b19b9a23ff"
-- 
2.16.1


