Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E66C28CF5
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 10:28:36 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.11068.1643192914752692474
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 02:28:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=XztdCE4i;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 217E28193A;
	Wed, 26 Jan 2022 11:28:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643192913;
	bh=FLnBUIZamQo2cUz0ZXrtCXa35bv9yUzIv01chhFNL7s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XztdCE4izKCmI71VvdNDi6emyw/iGk2mE0QoyWcG+4ZoP2FXLBuZASk4adylXWvhk
	 j9I/ByYS6g10qvU5JvfcQGTnyNlrjV1p4XrNI6AXIWXY90QaJacu+vQ/R6LIt0QKBT
	 ycLnAIXgP+xzwgHs37d+AdN4C/4rd9fdjR/V4OSTa4rKoriv45jWUII83XPJrn7psD
	 G7Sxsax9NzUIn+n5lrnl398Id1TQmdUz3U+N818/32Xy8RAF67mfFR3niLl23aXFkg
	 uafHS3kTfVcPD5PuamUTIINB48zONn155fPBZIOkM3gXtqx/qv9lpzp/ZXHsVyg5Tq
	 oYzbXdy/eZieQ==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Claudius Heine <ch@denx.de>
Subject: [OE-core][RFC PATCH 02/12] gstreamer1.0-plugins-base: 1.18.5 ->
 1.20.0
Date: Wed, 26 Jan 2022 11:28:04 +0100
Message-Id: <20220126102814.4173943-3-ch@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126102814.4173943-1-ch@denx.de>
References: <20220126102814.4173943-1-ch@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 10:28:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160966

Signed-off-by: Claudius Heine <ch@denx.de>
---
 ...et-caps-from-src-pad-when-query-caps.patch | 10 +++---
 ...parse-enhance-SSA-text-lines-parsing.patch | 10 +++---
 ...iv-fb-Make-sure-config.h-is-included.patch |  8 ++---
 ...004-glimagesink-Downrank-to-marginal.patch | 32 -------------------
 ...bb =3D> gstreamer1.0-plugins-base_1.20.0.bb} | 17 +++++-----
 5 files changed, 22 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-base/0004-glimagesink-Downrank-to-marginal.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.18=
.5.bb =3D> gstreamer1.0-plugins-base_1.20.0.bb} (85%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/=
0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/reci=
pes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-=
caps-from-src-pad-when-query-caps.patch
index d5d9838372..bbc24b3e84 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-EN=
GR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-EN=
GR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -9,16 +9,16 @@ Upstream-Status: Pending
=20
 Signed-off-by: zhouming <b42586@freescale.com>
 ---
- gst-libs/gst/tag/gsttagdemux.c | 13 +++++++++++++
+ subprojects/gst-plugins-base/gst-libs/gst/tag/gsttagdemux.c | 13 ++++++=
+++++++
  1 file changed, 13 insertions(+)
- mode change 100644 =3D> 100755 gst-libs/gst/tag/gsttagdemux.c
+ mode change 100644 =3D> 100755 subprojects/gst-plugins-base/gst-libs/gs=
t/tag/gsttagdemux.c
=20
-diff --git a/gst-libs/gst/tag/gsttagdemux.c b/gst-libs/gst/tag/gsttagdem=
ux.c
+diff --git a/subprojects/gst-plugins-base/gst-libs/gst/tag/gsttagdemux.c=
 b/subprojects/gst-plugins-base/gst-libs/gst/tag/gsttagdemux.c
 old mode 100644
 new mode 100755
 index f545857..62d10ef
---- a/gst-libs/gst/tag/gsttagdemux.c
-+++ b/gst-libs/gst/tag/gsttagdemux.c
+--- a/subprojects/gst-plugins-base/gst-libs/gst/tag/gsttagdemux.c
++++ b/subprojects/gst-plugins-base/gst-libs/gst/tag/gsttagdemux.c
 @@ -1777,6 +1777,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject =
* parent, GstQuery * query)
        }
        break;
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/=
0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multime=
dia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-li=
nes-parsing.patch
index e453a500c9..c6babd4ec9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ss=
aparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ss=
aparse-enhance-SSA-text-lines-parsing.patch
@@ -10,16 +10,16 @@ Upstream-Status: Submitted [https://bugzilla.gnome.or=
g/show_bug.cgi?id=3D747496]
=20
 Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
 ---
- gst/subparse/gstssaparse.c | 150 +++++++++++++++++++++++++++++++++----
+ subprojects/gst-plugins-base/gst/subparse/gstssaparse.c | 150 +++++++++=
++++++++++++++++++++++++----
  1 file changed, 134 insertions(+), 16 deletions(-)
- mode change 100644 =3D> 100755 gst/subparse/gstssaparse.c
+ mode change 100644 =3D> 100755 subprojects/gst-plugins-base/gst/subpars=
e/gstssaparse.c
=20
-diff --git a/gst/subparse/gstssaparse.c b/gst/subparse/gstssaparse.c
+diff --git a/subprojects/gst-plugins-base/gst/subparse/gstssaparse.c b/s=
ubprojects/gst-plugins-base/gst/subparse/gstssaparse.c
 old mode 100644
 new mode 100755
 index c849c08..4b9636c
---- a/gst/subparse/gstssaparse.c
-+++ b/gst/subparse/gstssaparse.c
+--- a/subprojects/gst-plugins-base/gst/subparse/gstssaparse.c
++++ b/subprojects/gst-plugins-base/gst/subparse/gstssaparse.c
 @@ -262,6 +262,7 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * p=
arse, gchar * txt)
   * gst_ssa_parse_push_line:
   * @parse: caller element
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/=
0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedi=
a/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-i=
ncluded.patch
index 2af83ff8b9..1bf21c2e4d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-vi=
v-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-vi=
v-fb-Make-sure-config.h-is-included.patch
@@ -9,13 +9,13 @@ Upstream-Status: Pending
=20
 Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
 ---
- gst-libs/gst/gl/gl-prelude.h | 4 ++++
+ subprojects/gst-plugins-base/gst-libs/gst/gl/gl-prelude.h | 4 ++++
  1 file changed, 4 insertions(+)
=20
-diff --git a/gst-libs/gst/gl/gl-prelude.h b/gst-libs/gst/gl/gl-prelude.h
+diff --git a/subprojects/gst-plugins-base/gst-libs/gst/gl/gl-prelude.h b=
/subprojects/gst-plugins-base/gst-libs/gst/gl/gl-prelude.h
 index 05e1f62..96ce5e6 100644
---- a/gst-libs/gst/gl/gl-prelude.h
-+++ b/gst-libs/gst/gl/gl-prelude.h
+--- a/subprojects/gst-plugins-base/gst-libs/gst/gl/gl-prelude.h
++++ b/subprojects/gst-plugins-base/gst-libs/gst/gl/gl-prelude.h
 @@ -22,6 +22,10 @@
  #ifndef __GST_GL_PRELUDE_H__
  #define __GST_GL_PRELUDE_H__
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/=
0004-glimagesink-Downrank-to-marginal.patch b/meta/recipes-multimedia/gst=
reamer/gstreamer1.0-plugins-base/0004-glimagesink-Downrank-to-marginal.pa=
tch
deleted file mode 100644
index f45ea65ef3..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-gl=
imagesink-Downrank-to-marginal.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 79841a02ee754eba736cb32aaf2ed2b2fc0483d4 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 24 Sep 2015 19:47:32 +0300
-Subject: [PATCH 4/4] glimagesink: Downrank to marginal
-
-On desktop, where there is good OpenGL, xvimagesink will come up first,
-on other platforms, OpenGL can't be trusted because it's either software=
 (like
-in a VM) or broken (like on embedded)., so let ximagesink come above.
-
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=3D=
751684]
-
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- ext/gl/gstopengl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ext/gl/gstopengl.c b/ext/gl/gstopengl.c
-index 302e845..463be9c 100644
---- a/ext/gl/gstopengl.c
-+++ b/ext/gl/gstopengl.c
-@@ -127,7 +127,7 @@ plugin_init (GstPlugin * plugin)
- #endif
-=20
-   if (!gst_element_register (plugin, "glimagesink",
--          GST_RANK_SECONDARY, gst_gl_image_sink_bin_get_type ())) {
-+          GST_RANK_MARGINAL, gst_gl_image_sink_bin_get_type ())) {
-     return FALSE;
-   }
-=20
---=20
-2.28.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_=
1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1=
.20.0.bb
similarity index 85%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1=
.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2=
0.0.bb
index 180241828f..79ec8cde60 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.5.=
bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.0.=
bb
@@ -4,17 +4,16 @@ DESCRIPTION =3D "'Base' GStreamer plugins and helper li=
braries"
 HOMEPAGE =3D "https://gstreamer.freedesktop.org/"
 BUGTRACKER =3D "https://gitlab.freedesktop.org/gstreamer/gst-plugins-bas=
e/-/issues"
 LICENSE =3D "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6762ed442b3822387a51c92d928ea=
d0d"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D69333daa044cb77e486cc36129f7a=
770"
=20
-SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-=
plugins-base-${PV}.tar.xz \
-           file://0001-ENGR00312515-get-caps-from-src-pad-when-query-cap=
s.patch \
-           file://0003-viv-fb-Make-sure-config.h-is-included.patch \
-           file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
-           file://0004-glimagesink-Downrank-to-marginal.patch \
-           "
-SRC_URI[sha256sum] =3D "960b7af4585700db0fdd5b843554e11e2564fed9e061f591=
fae88a7be6446fa3"
+require gstreamer1.0-source.inc
=20
-S =3D "${WORKDIR}/gst-plugins-base-${PV}"
+S =3D "${SRC_BASE}/subprojects/gst-plugins-base"
+
+SRC_URI +=3D "file://0001-ENGR00312515-get-caps-from-src-pad-when-query-=
caps.patch;patchdir=3D${SRC_BASE} \
+            file://0003-viv-fb-Make-sure-config.h-is-included.patch;patc=
hdir=3D${SRC_BASE} \
+            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch;pa=
tchdir=3D${SRC_BASE} \
+            "
=20
 DEPENDS +=3D "iso-codes util-linux zlib"
=20
--=20
2.34.1


