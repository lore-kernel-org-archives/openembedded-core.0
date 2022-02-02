Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EF2C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 13:43:02 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.64037.1643809380875382068
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 05:43:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=W9lv7QYt;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 45F63838CB;
	Wed,  2 Feb 2022 14:42:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643809379;
	bh=JckVzeb7ViIJZRq+52+zJ/zYQE6fzEZ2b4kvALO4JwQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W9lv7QYtpGqqrdU6zE+04adNBNLR7k2hNDyifZlGLOjXnLUL4UH9cqpgGN69Lxlad
	 JU9I/CIP4ND43r9BmN0hUxxQmkkR06R0hCnhVUwS9SveHgEFFS4myf0a1UX41mrVSe
	 89ZeZSxOjkoplgULIoO4NvTfKtRffSadJbZPnwEAJuqilBYkSaoX8dHKwT4neqNsET
	 f/N3jrwsci0hrLg9ilOobVEOp7GJCPsX8obBwYVa0YFxHxR4BjCETeMVO0Gg2I0AAn
	 Ov2RWfqzDTdYYgJlACOud87vmfqQNUacpZz1TTnNab6WzmfRCkMq0Xfp+CDGjaiMbh
	 C/BETKDdlRdzQ==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH 02/12] gstreamer1.0-plugins-base: 1.18.5 -> 1.19.90
Date: Wed,  2 Feb 2022 14:42:23 +0100
Message-Id: <20220202134233.2091916-3-ch@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220202134233.2091916-1-ch@denx.de>
References: <20220202134233.2091916-1-ch@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 13:43:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161198

Signed-off-by: Claudius Heine <ch@denx.de>
---
 ...004-glimagesink-Downrank-to-marginal.patch | 32 -------------------
 ...b =3D> gstreamer1.0-plugins-base_1.19.90.bb} |  5 ++-
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-base/0004-glimagesink-Downrank-to-marginal.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.18=
.5.bb =3D> gstreamer1.0-plugins-base_1.19.90.bb} (94%)

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
.19.90.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1=
.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.1=
9.90.bb
index 180241828f..5b02d4565a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.18.5.=
bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.19.90=
.bb
@@ -4,15 +4,14 @@ DESCRIPTION =3D "'Base' GStreamer plugins and helper li=
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
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-=
plugins-base-${PV}.tar.xz \
            file://0001-ENGR00312515-get-caps-from-src-pad-when-query-cap=
s.patch \
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
-           file://0004-glimagesink-Downrank-to-marginal.patch \
            "
-SRC_URI[sha256sum] =3D "960b7af4585700db0fdd5b843554e11e2564fed9e061f591=
fae88a7be6446fa3"
+SRC_URI[sha256sum] =3D "667c5cbfae1873c8291b5911bedbf20ce92ee607b8b1b3d3=
7120ed54e452db00"
=20
 S =3D "${WORKDIR}/gst-plugins-base-${PV}"
=20
--=20
2.34.1


