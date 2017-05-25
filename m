Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A9D9773D5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 09:24:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v4P9O2I4028685
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 02:24:02 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 25 May 2017 02:24:01 -0700
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 May 2017 17:23:24 +0800
Message-ID: <1495704204-228972-1-git-send-email-wenlin.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] freetype: Fix some CVE
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
X-List-Received-Date: Thu, 25 May 2017 09:24:01 -0000
Content-Type: text/plain

Fix the follow CVE.
  CVE-2017-7864
  CVE-2017-7858
  CVE-2017-7857
  CVE-2017-8105
  CVE-2017-8287

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 ...01-truetype-Fix-MVAR-post-action-handling.patch | 68 +++++++++++++++++++
 ...mprove-handling-for-buggy-variation-fonts.patch | 74 +++++++++++++++++++++
 ...fnt-Another-fix-for-buggy-variation-fonts.patch | 63 ++++++++++++++++++
 .../0004-psaux-Better-protect-flex-handling.patch  | 77 ++++++++++++++++++++++
 ...sobjs.c-t1_builder_close_contour-Add-safe.patch | 59 +++++++++++++++++
 meta/recipes-graphics/freetype/freetype_2.7.1.bb   |  8 ++-
 6 files changed, 348 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/freetype/freetype/0001-truetype-Fix-MVAR-post-action-handling.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype/0002-sfnt-Improve-handling-for-buggy-variation-fonts.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype/0003-sfnt-Another-fix-for-buggy-variation-fonts.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype/0004-psaux-Better-protect-flex-handling.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype/0005-src-psaux-psobjs.c-t1_builder_close_contour-Add-safe.patch

diff --git a/meta/recipes-graphics/freetype/freetype/0001-truetype-Fix-MVAR-post-action-handling.patch b/meta/recipes-graphics/freetype/freetype/0001-truetype-Fix-MVAR-post-action-handling.patch
new file mode 100644
index 0000000..8bb78f1
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/0001-truetype-Fix-MVAR-post-action-handling.patch
@@ -0,0 +1,68 @@
+From 00af09fabe6ccef97a162be304d475c0544062b9 Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Thu, 25 May 2017 16:15:53 +0800
+Subject: [PATCH 1/5] [truetype] Fix MVAR post-action handling.
+
+Reported as
+
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=509
+
+* src/truetype/ttobjs.c (tt_size_reset): Do nothing for CFF2.  This
+is important to make `tt_size_reset_iterator' (called in
+`tt_apply_mvar') always work.
+
+This patch comes from git://git.savannah.gnu.org/freetype/freetype2.git,
+the commit is e6699596af5c5d6f0ae0ea06e19df87dce088df8.
+
+Upsteam-Status: Backport
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ ChangeLog             | 12 ++++++++++++
+ src/truetype/ttobjs.c |  8 ++++++--
+ 2 files changed, 18 insertions(+), 2 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 23f5748..b0239ec 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,15 @@
++	[truetype] Fix MVAR post-action handling.
++
++	Reported as
++
++	  https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=509
++
++	* src/truetype/ttobjs.c (tt_size_reset): Do nothing for CFF2.  This
++	is important to make `tt_size_reset_iterator' (called in
++	`tt_apply_mvar') always work.
++
++2017-02-02  Werner Lemberg  <wl@gnu.org>
++
+ 2016-09-08  Werner Lemberg  <wl@gnu.org>
+ 
+ 	* Version 2.7.1 released.
+diff --git a/src/truetype/ttobjs.c b/src/truetype/ttobjs.c
+index 7e37113..3d760b8 100644
+--- a/src/truetype/ttobjs.c
++++ b/src/truetype/ttobjs.c
+@@ -1194,10 +1194,14 @@
+     FT_Size_Metrics*  metrics;
+ 
+ 
+-    size->ttmetrics.valid = FALSE;
+-
+     face = (TT_Face)size->root.face;
+ 
++    /* nothing to do for CFF2 */
++    if ( face->isCFF2 )
++      return FT_Err_Ok;
++
++    size->ttmetrics.valid = FALSE;
++
+     metrics = &size->metrics;
+ 
+     /* copy the result from base layer */
+-- 
+1.9.1
+
diff --git a/meta/recipes-graphics/freetype/freetype/0002-sfnt-Improve-handling-for-buggy-variation-fonts.patch b/meta/recipes-graphics/freetype/freetype/0002-sfnt-Improve-handling-for-buggy-variation-fonts.patch
new file mode 100644
index 0000000..7940fb4
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/0002-sfnt-Improve-handling-for-buggy-variation-fonts.patch
@@ -0,0 +1,74 @@
+From b642aa8f590658cfd394bfaa9db5e138d6013938 Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Thu, 25 May 2017 16:23:09 +0800
+Subject: [PATCH 2/5] [sfnt] Improve handling for buggy variation fonts.
+
+Reported as
+
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=738
+
+* src/sfnt/sfobjs.c (sfnt_init_face): While setting number of
+instances to zero for `CFF' fonts table, ensure that there is no `glyf'
+present also (which gets priority).
+
+This patch comes from git://git.savannah.gnu.org/freetype/freetype2.git,
+the commit is 779309744222a736eba0f1731e8162fce6288d4e.
+
+Upstream-Status: Backport
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ ChangeLog         | 12 ++++++++++++
+ src/sfnt/sfobjs.c |  9 +++++----
+ 2 files changed, 17 insertions(+), 4 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index b0239ec..1fe66f3 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,15 @@
++2017-03-07  Werner Lemberg  <wl@gnu.org>
++
++	[sfnt] Improve handling for buggy variation fonts.
++
++	Reported as
++
++	  https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=738
++
++	* src/sfnt/sfobjs.c (sfnt_init_face): While setting number of
++	instances to zero for `CFF' fonts table, ensure that there is no `glyf'
++	present also (which gets priority).
++
+ 	[truetype] Fix MVAR post-action handling.
+ 
+ 	Reported as
+diff --git a/src/sfnt/sfobjs.c b/src/sfnt/sfobjs.c
+index 818009e..a3a4f42 100644
+--- a/src/sfnt/sfobjs.c
++++ b/src/sfnt/sfobjs.c
+@@ -985,10 +985,6 @@
+       else
+         face->variation_support |= TT_FACE_FLAG_VAR_FVAR;
+ 
+-      /* we don't support Multiple Master CFFs yet */
+-      if ( !face->goto_table( face, TTAG_CFF, stream, 0 ) )
+-        num_instances = 0;
+-
+       /* we support at most 2^15 - 1 instances */
+       if ( num_instances >= ( 1U << 15 ) - 1 )
+       {
+@@ -998,6 +994,11 @@
+           num_instances = 0;
+       }
+ 
++      /* we don't support Multiple Master CFFs yet */
++      if ( face->goto_table( face, TTAG_glyf, stream, 0 ) &&
++           !face->goto_table( face, TTAG_CFF, stream, 0 ) )
++        num_instances = 0;
++
+       /* instance indices in `face_instance_index' start with index 1, */
+       /* thus `>' and not `>='                                         */
+       if ( instance_index > num_instances )
+-- 
+1.9.1
+
diff --git a/meta/recipes-graphics/freetype/freetype/0003-sfnt-Another-fix-for-buggy-variation-fonts.patch b/meta/recipes-graphics/freetype/freetype/0003-sfnt-Another-fix-for-buggy-variation-fonts.patch
new file mode 100644
index 0000000..7c7cd9b
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/0003-sfnt-Another-fix-for-buggy-variation-fonts.patch
@@ -0,0 +1,63 @@
+From 5e696da661d311f042fe0f136c67b3e5df0b9ed5 Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Thu, 25 May 2017 16:28:28 +0800
+Subject: [PATCH 3/5] [sfnt] Another fix for buggy variation fonts.
+
+Reported as
+
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=759
+
+* src/sfnt/sfobjs.c (sfnt_init_face): While setting number of
+instances to zero for `CFF' fonts table, ensure that there is no
+`CFF2' present also (which gets priority).
+
+This patch comes from git://git.savannah.gnu.org/freetype/freetype2.git,
+the commit is 7bbb91fbf47fc0775cc9705673caf0c47a81f94b.
+
+Upsteam-Status: Backport
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ ChangeLog         | 12 ++++++++++++
+ src/sfnt/sfobjs.c |  4 +++-
+ 2 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 1fe66f3..7f72ca9 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,15 @@
++2017-03-08  Werner Lemberg  <wl@gnu.org>
++
++	[sfnt] Another fix for buggy variation fonts.
++
++	Reported as
++
++	  https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=759
++
++	* src/sfnt/sfobjs.c (sfnt_init_face): While setting number of
++	instances to zero for `CFF' fonts table, ensure that there is no
++	`CFF2' present also (which gets priority).
++
+ 2017-03-07  Werner Lemberg  <wl@gnu.org>
+ 
+ 	[sfnt] Improve handling for buggy variation fonts.
+diff --git a/src/sfnt/sfobjs.c b/src/sfnt/sfobjs.c
+index a3a4f42..b660f33 100644
+--- a/src/sfnt/sfobjs.c
++++ b/src/sfnt/sfobjs.c
+@@ -994,8 +994,10 @@
+           num_instances = 0;
+       }
+ 
+-      /* we don't support Multiple Master CFFs yet */
++      /* we don't support Multiple Master CFFs yet; */
++      /* note that `glyf' or `CFF2' have precedence */
+       if ( face->goto_table( face, TTAG_glyf, stream, 0 ) &&
++           face->goto_table( face, TTAG_CFF2, stream, 0 ) &&
+            !face->goto_table( face, TTAG_CFF, stream, 0 ) )
+         num_instances = 0;
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-graphics/freetype/freetype/0004-psaux-Better-protect-flex-handling.patch b/meta/recipes-graphics/freetype/freetype/0004-psaux-Better-protect-flex-handling.patch
new file mode 100644
index 0000000..776465c
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/0004-psaux-Better-protect-flex-handling.patch
@@ -0,0 +1,77 @@
+From c74936d2747ca188cfaa7b15177da11b0e1b8223 Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Thu, 25 May 2017 16:33:50 +0800
+Subject: [PATCH 4/5] [psaux] Better protect `flex' handling.
+
+Reported as
+
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=935
+
+* src/psaux/t1decode.c (t1_decoder_parse_charstrings)
+<callothersubr>: Since there is not a single flex operator but a
+series of subroutine calls, malformed fonts can call arbitrary other
+operators after the start of a flex, possibly adding points.  For
+this reason we have to check the available number of points before
+inserting a point.
+
+This patch comes from git://git.savannah.gnu.org/freetype/freetype2.git,
+the commit is f958c48ee431bef8d4d466b40c9cb2d4dbcb7791.
+
+Upsteam-Status: Backport
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ ChangeLog            | 15 +++++++++++++++
+ src/psaux/t1decode.c |  9 +++++++++
+ 2 files changed, 24 insertions(+)
+
+diff --git a/ChangeLog b/ChangeLog
+index 7f72ca9..db9be9a 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,18 @@
++	[psaux] Better protect `flex' handling.
++
++	Reported as
++
++	  https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=935
++
++	* src/psaux/t1decode.c (t1_decoder_parse_charstrings)
++	<callothersubr>: Since there is not a single flex operator but a
++	series of subroutine calls, malformed fonts can call arbitrary other
++	operators after the start of a flex, possibly adding points.  For
++	this reason we have to check the available number of points before
++	inserting a point.
++
++2017-03-23  Werner Lemberg  <wl@gnu.org>
++
+ 2017-03-08  Werner Lemberg  <wl@gnu.org>
+ 
+ 	[sfnt] Another fix for buggy variation fonts.
+diff --git a/src/psaux/t1decode.c b/src/psaux/t1decode.c
+index 1cd9d73..bc5e3d2 100644
+--- a/src/psaux/t1decode.c
++++ b/src/psaux/t1decode.c
+@@ -780,10 +780,19 @@
+             /* point without adding any point to the outline    */
+             idx = decoder->num_flex_vectors++;
+             if ( idx > 0 && idx < 7 )
++            {
++              /* in malformed fonts it is possible to have other */
++              /* opcodes in the middle of a flex (which don't    */
++              /* increase `num_flex_vectors'); we thus have to   */
++              /* check whether we can add a point                */
++              if ( FT_SET_ERROR( t1_builder_check_points( builder, 1 ) ) )
++                goto Syntax_Error;
++
+               t1_builder_add_point( builder,
+                                     x,
+                                     y,
+                                     (FT_Byte)( idx == 3 || idx == 6 ) );
++            }
+           }
+           break;
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-graphics/freetype/freetype/0005-src-psaux-psobjs.c-t1_builder_close_contour-Add-safe.patch b/meta/recipes-graphics/freetype/freetype/0005-src-psaux-psobjs.c-t1_builder_close_contour-Add-safe.patch
new file mode 100644
index 0000000..ea40f65
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/0005-src-psaux-psobjs.c-t1_builder_close_contour-Add-safe.patch
@@ -0,0 +1,59 @@
+From fe786d2dfd829707206c6d105d9227521a36e263 Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Thu, 25 May 2017 16:38:46 +0800
+Subject: [PATCH 5/5] * src/psaux/psobjs.c (t1_builder_close_contour): Add
+ safety guard.
+
+Reported as
+
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=941
+
+This patch comes from git://git.savannah.gnu.org/freetype/freetype2.git,
+the commit is 3774fc08b502c3e685afca098b6e8a195aded6a0.
+
+Upsteam-Status: Backport
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ ChangeLog          | 8 ++++++++
+ src/psaux/psobjs.c | 8 ++++++++
+ 2 files changed, 16 insertions(+)
+
+diff --git a/ChangeLog b/ChangeLog
+index db9be9a..b3abcd9 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,11 @@
++2017-03-26  Werner Lemberg  <wl@gnu.org>
++
++	* src/psaux/psobjs.c (t1_builder_close_contour): Add safety guard.
++
++	Reported as
++
++	  https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=941
++
+ 	[psaux] Better protect `flex' handling.
+ 
+ 	Reported as
+diff --git a/src/psaux/psobjs.c b/src/psaux/psobjs.c
+index 6e528d4..475df45 100644
+--- a/src/psaux/psobjs.c
++++ b/src/psaux/psobjs.c
+@@ -1718,6 +1718,14 @@
+     first = outline->n_contours <= 1
+             ? 0 : outline->contours[outline->n_contours - 2] + 1;
+ 
++    /* in malformed fonts it can happen that a contour was started */
++    /* but no points were added                                    */
++    if ( outline->n_contours && first == outline->n_points )
++    {
++      outline->n_contours--;
++      return;
++    }
++
+     /* We must not include the last point in the path if it */
+     /* is located on the first point.                       */
+     if ( outline->n_points > 1 )
+-- 
+1.9.1
+
diff --git a/meta/recipes-graphics/freetype/freetype_2.7.1.bb b/meta/recipes-graphics/freetype/freetype_2.7.1.bb
index 544f835..dec81dd 100644
--- a/meta/recipes-graphics/freetype/freetype_2.7.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.7.1.bb
@@ -13,7 +13,13 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=4af6221506f202774ef74f64932878a1
                     file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
-           file://use-right-libtool.patch"
+           file://use-right-libtool.patch \
+           file://0001-truetype-Fix-MVAR-post-action-handling.patch \
+           file://0002-sfnt-Improve-handling-for-buggy-variation-fonts.patch \
+           file://0003-sfnt-Another-fix-for-buggy-variation-fonts.patch \
+           file://0004-psaux-Better-protect-flex-handling.patch \
+           file://0005-src-psaux-psobjs.c-t1_builder_close_contour-Add-safe.patch \
+"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/freetype/files/freetype2/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
1.9.1


