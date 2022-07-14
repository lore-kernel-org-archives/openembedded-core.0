Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D90C43334
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:36:19 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web12.4023.1657773378502152733
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=c9er2rXZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id 70so835686pfx.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=P56G9QS+YFogAdP1se22UaOVvDzZrKpOttuiBAlmgzc=;
        b=c9er2rXZ51ViOdorcTTCTKuuS3ZkIexE6zJfRoSy/mi23mKkwCnLdYU/Zb1S5xjIQG
         Mob/QfJ0Zve+X5aHiWUSEOGwAh9Ck2T2WxSH8ui4wSqcA54faJ0XNyrkQQGo7emq/fWt
         Oe9BPqU0M9f5LREnF4xk4CvH05BtEhCTld25xMmCQe1BHOC0ASv3G8VNtGJewDQ1bBGx
         3ih7u6JcHu8S7aQe34/PeTF1iQD2I565P44y3BJ8E+Z5QAYNy9GmhUytLAFoldnd5fLk
         NjXBdKoI2xNL4kP7LFEJ2o3c7a7JkfpBaGMEd3QbvDCk/ZGy9Qdbo0IATIGGL+f5KqEQ
         D+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P56G9QS+YFogAdP1se22UaOVvDzZrKpOttuiBAlmgzc=;
        b=aINRKArzJ4wZIotB4mztFuT3csm4MfFpegAnGHvkrapXBezO2EWOwHiIg8pvXhwknl
         sLgJ5uGbn2PTbfCy/0NMK/X3ptBJy8XILCTrsX6fhS1bNmCIV9UGDWIaGdcFXo7XK3X3
         hnqk5nxbARSJn7kQxcbym/FSL2U1wGYlw+HJLn7noZIDrU0UyLsttG2YWDgRWGAQMQJY
         5zhvr7kT5MegiDIyT5iiumzPpXZarPdC5hJtEttrxY1W5Djv617zz9p6dhk10I10fpzZ
         eysD5iPC6D0Cnjs6yQygsJ5WA4r1eLkeqzexUSou9RGFRWTvXFmybnKGJVugDTpx9/GZ
         t3Mg==
X-Gm-Message-State: AJIora+/4E9KGYow+vuXlY4oWNiayjP7BnhZdB+VD8/K8DkaQXmEbE8h
	j8TtPrx20s6IU/gw9BPVnyOgsZprlsaHqQ2v
X-Google-Smtp-Source: 
 AGRyM1vB2G9WGiueZngvCf50y9iNWAa3n9M/4RsH+6FXftX4WG1gYASOZVmwbQMln+YrhFybkLFAhQ==
X-Received: by 2002:a63:d1e:0:b0:40d:379e:bff8 with SMTP id
 c30-20020a630d1e000000b0040d379ebff8mr6180186pgl.215.1657773377382;
        Wed, 13 Jul 2022 21:36:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.36.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:36:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/27] harfbuzz: fix CVE-2022-33068
Date: Wed, 13 Jul 2022 18:35:25 -1000
Message-Id: 
 <537e7d323f57a0484c279c3b52ad5bb45eb44a10.1657772638.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:36:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168002

From: Wentao Zhang <wentao.zhang@windriver.com>

Backport patch from
https://github.com/harfbuzz/harfbuzz/commit/62e803b36173fd096d7ad460dd1d1db9be542593

The 'tff' file in upstream patch is for testing only which cause error during do_patch so need be dropped.
File test/fuzzing/fonts/sbix-extents.ttf: git binary diffs are not supported.

Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../harfbuzz/harfbuzz/CVE-2022-33068.patch    | 35 +++++++++++++++++++
 .../harfbuzz/harfbuzz_4.0.1.bb                |  3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2022-33068.patch

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2022-33068.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2022-33068.patch
new file mode 100644
index 0000000000..931b9abe1e
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2022-33068.patch
@@ -0,0 +1,35 @@
+From 62e803b36173fd096d7ad460dd1d1db9be542593 Mon Sep 17 00:00:00 2001
+From: Behdad Esfahbod <behdad@behdad.org>
+Date: Wed, 1 Jun 2022 07:38:21 -0600
+Subject: [PATCH] [sbix] Limit glyph extents
+
+Fixes https://github.com/harfbuzz/harfbuzz/issues/3557
+
+Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/62e803b36173fd096d7ad460dd1d1db9be542593]
+CVE:CVE-2022-33068
+Signed-off-by: Wentao Zhang<Wentao.Zhang@windriver.com>
+
+---
+ src/hb-ot-color-sbix-table.hh | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/hb-ot-color-sbix-table.hh b/src/hb-ot-color-sbix-table.hh
+index 9741ebd45..6efae43cd 100644
+--- a/src/hb-ot-color-sbix-table.hh
++++ b/src/hb-ot-color-sbix-table.hh
+@@ -298,6 +298,12 @@ struct sbix
+ 
+       const PNGHeader &png = *blob->as<PNGHeader>();
+ 
++      if (png.IHDR.height >= 65536 | png.IHDR.width >= 65536)
++      {
++	hb_blob_destroy (blob);
++	return false;
++      }
++
+       extents->x_bearing = x_offset;
+       extents->y_bearing = png.IHDR.height + y_offset;
+       extents->width     = png.IHDR.width;
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
index bf77a5e56c..81518a53ea 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
@@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ee0f16281694fb6aa689cca1e0fb3da \
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz\
+           file://CVE-2022-33068.patch"
 SRC_URI[sha256sum] = "98f68777272db6cd7a3d5152bac75083cd52a26176d87bc04c8b3929d33bce49"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
-- 
2.25.1


