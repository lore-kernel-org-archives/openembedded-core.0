Return-Path: <tanuk@iki.fi>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id D6B9F7833B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 16:49:10 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id C16CE20CA3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 11:39:47 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Mon, 27 Nov 2017 11:39:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=B99lGCsGnT6fiI9XEMdqXoT+zDBJEZHRkItRi6SCyFo=; b=nNq7ecp9
	XLIH8uQ3QL0/Hfso1gW+NjDFY7V37TSEB1+5cCpuaYCh8gHXMxNJ/8E2PU3OMm45
	afm7/WNRfpYw7LTLcvHvrVLsK9HLVT/symVJVz+gLX8uBFrsq3p5NqWaq6zMb0qL
	2xPXtw8CPSwOC3/yf+wUV0evVk0IQKkuPC82JmQEWjXsfDt8PFsbRs+K4aZheQtN
	Zo5VI3nXgPVHLvbuIxZKuSbtMmhvyrJEF89R67a8+B5NINSKwmec6eA+GNoDp2YO
	Y/oRum4wWLx12+mXRtGB4mmq1Z8jNYho/4yC98HJHN3LVCY9FX2k3zyhOoCIpfJ1
	yDHKydkxbN0nnQ==
X-ME-Sender: <xms:0z8cWuOYBjrflHPHKhuvJw0U0WLlew-BOwMPX15KnSaQHP_ZgV5r8w>
Received: from localhost.localdomain (unknown [192.40.95.17])
	by mail.messagingengine.com (Postfix) with ESMTPA id 009DE7E13B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 11:39:46 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2017 18:39:30 +0200
Message-Id: <20171127163934.31597-3-tanuk@iki.fi>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171127163934.31597-1-tanuk@iki.fi>
References: <20171127163934.31597-1-tanuk@iki.fi>
Subject: [PATCH 2/6] lame: 3.99.5 -> 3.100
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
X-List-Received-Date: Mon, 27 Nov 2017 16:49:11 -0000

Release notes:
http://lame.cvs.sourceforge.net/viewvc/lame/lame/doc/html/history.html?revision=1.154

Dropped patches that are included in the release:
 - lame-3.99.5_fix_for_automake-1.12.x.patch
 - CVE-2017-13712.patch

The CACHED_CONFIGUREVARS thing to disable SSE code on x86 isn't needed
anymore. The build system now correctly detects when SSE isn't
available.

Note for stable branch maintainers: This release includes several fixes
for bugs that have a CVE number associated with them. The bugs (or at
least most of them) are crashes that seem to be considered "remote DoS"
vulnerabilities, probably because it's easy to imagine lame being used
with untrusted audio files from remote sources. If you want to backport
"all sercurity fixes" to the stable brances, that task seems pretty
difficult. The release notes explicitly mention three CVE numbers, but
there are more: for example, OE had a fix for CVE-2017-13712, which is
not mentioned in the release notes but is fixed in the release. The
commit log doesn't keep any track of CVE numbers either. Maybe it would
be best to just upgrade lame to 3.100 also in the stable branches.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 .../lame/lame/CVE-2017-13712.patch                 | 309 ---------------------
 .../lame/lame-3.99.5_fix_for_automake-1.12.x.patch |  59 ----
 .../lame/{lame_3.99.5.bb => lame_3.100.bb}         |   9 +-
 3 files changed, 2 insertions(+), 375 deletions(-)
 delete mode 100644 meta/recipes-multimedia/lame/lame/CVE-2017-13712.patch
 delete mode 100644 meta/recipes-multimedia/lame/lame/lame-3.99.5_fix_for_automake-1.12.x.patch
 rename meta/recipes-multimedia/lame/{lame_3.99.5.bb => lame_3.100.bb} (69%)

diff --git a/meta/recipes-multimedia/lame/lame/CVE-2017-13712.patch b/meta/recipes-multimedia/lame/lame/CVE-2017-13712.patch
deleted file mode 100644
index f9ec7665ff..0000000000
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
diff --git a/meta/recipes-multimedia/lame/lame/lame-3.99.5_fix_for_automake-1.12.x.patch b/meta/recipes-multimedia/lame/lame/lame-3.99.5_fix_for_automake-1.12.x.patch
deleted file mode 100644
index 51baef26f2..0000000000
--- a/meta/recipes-multimedia/lame/lame/lame-3.99.5_fix_for_automake-1.12.x.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-Upstream-Status: Pending
-
-Fix this kind of errors with automake 1.12.x:
-| doc/man/Makefile.am:3: error: automatic de-ANSI-fication support has been removed
-| autoreconf: automake failed with exit status: 1
-
-Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/07/13
-
-Index: lame-3.99.5/configure.in
-===================================================================
---- lame-3.99.5.orig/configure.in
-+++ lame-3.99.5/configure.in
-@@ -77,9 +77,6 @@ if test "${GCC}" = "yes"; then
- 	AC_MSG_RESULT(${GCC_version})
- fi
- 
--dnl more automake stuff
--AM_C_PROTOTYPES
--
- AC_CHECK_HEADER(dmalloc.h)
- if test "${ac_cv_header_dmalloc_h}" = "yes"; then
- 	AM_WITH_DMALLOC
-Index: lame-3.99.5/doc/html/Makefile.am
-===================================================================
---- lame-3.99.5.orig/doc/html/Makefile.am
-+++ lame-3.99.5/doc/html/Makefile.am
-@@ -1,6 +1,6 @@
- ## $Id: Makefile.am,v 1.7 2010/09/30 20:58:40 jaz001 Exp $
- 
--AUTOMAKE_OPTIONS = foreign ansi2knr
-+AUTOMAKE_OPTIONS = foreign
- 
- docdir = $(datadir)/doc
- pkgdocdir = $(docdir)/$(PACKAGE)
-Index: lame-3.99.5/libmp3lame/i386/Makefile.am
-===================================================================
---- lame-3.99.5.orig/libmp3lame/i386/Makefile.am
-+++ lame-3.99.5/libmp3lame/i386/Makefile.am
-@@ -1,6 +1,6 @@
- ## $Id: Makefile.am,v 1.26 2011/04/04 09:42:34 aleidinger Exp $
- 
--AUTOMAKE_OPTIONS = foreign $(top_srcdir)/ansi2knr
-+AUTOMAKE_OPTIONS = foreign
- 
- DEFS = @DEFS@ @CONFIG_DEFS@
- 
-Index: lame-3.99.5/doc/man/Makefile.am
-===================================================================
---- lame-3.99.5.orig/doc/man/Makefile.am
-+++ lame-3.99.5/doc/man/Makefile.am
-@@ -1,6 +1,6 @@
- ## $Id: Makefile.am,v 1.1 2000/10/22 11:39:44 aleidinger Exp $
- 
--AUTOMAKE_OPTIONS = foreign ansi2knr
-+AUTOMAKE_OPTIONS = foreign
- 
- man_MANS = lame.1
- EXTRA_DIST = ${man_MANS}
diff --git a/meta/recipes-multimedia/lame/lame_3.99.5.bb b/meta/recipes-multimedia/lame/lame_3.100.bb
similarity index 69%
rename from meta/recipes-multimedia/lame/lame_3.99.5.bb
rename to meta/recipes-multimedia/lame/lame_3.100.bb
index e5321bb9d8..ff6ac7efb2 100644
--- a/meta/recipes-multimedia/lame/lame_3.99.5.bb
+++ b/meta/recipes-multimedia/lame/lame_3.100.bb
@@ -10,16 +10,13 @@ DEPENDS = "ncurses gettext-native"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9 \
                     file://include/lame.h;beginline=1;endline=20;md5=a2258182c593c398d15a48262130a92b \
 "
-PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lame/lame-${PV}.tar.gz \
            file://no-gtk1.patch \
-           file://lame-3.99.5_fix_for_automake-1.12.x.patch \
-           file://CVE-2017-13712.patch \
            "
 
-SRC_URI[md5sum] = "84835b313d4a8b68f5349816d33e07ce"
-SRC_URI[sha256sum] = "24346b4158e4af3bd9f2e194bb23eb473c75fb7377011523353196b19b9a23ff"
+SRC_URI[md5sum] = "83e260acbe4389b54fe08e0bdbf7cddb"
+SRC_URI[sha256sum] = "ddfe36cab873794038ae2c1210557ad34857a4b6bdc515785d1da9e175b1da1e"
 
 inherit autotools pkgconfig
 
@@ -28,5 +25,3 @@ FILES_${PN} = "${bindir}/lame"
 FILES_libmp3lame = "${libdir}/libmp3lame.so.*"
 FILES_libmp3lame-dev = "${includedir} ${libdir}/*"
 FILES_${PN}-dev = ""
-
-CACHED_CONFIGUREVARS_append_x86 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
-- 
2.14.2


