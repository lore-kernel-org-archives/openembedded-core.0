Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7417C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 06:35:00 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.8022.1661322891188698988
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 23:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pK7WN6rQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id w13so9121363pgq.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 23:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ZssukcpYhmA5+w/Pfdf7IqK9yP1BzO1s3i+w0bdaJAE=;
        b=pK7WN6rQghYQ/uheLG4rQRlI5B1oC9z8IM+xud8XLZDRc0woT4Oe+eV6pQttJa6m8F
         YouwhxrArgaERrSbANU1+NUeoD6ozph7lC5jh5cn0b96XAbX22XmM3edpjfaWEy/ftrb
         UKKzjQUIEIXYILgRB6L3FAFgB/tbKRF0SqHy0vP4pWke88JzMvdmwDTO9YQy2GWWRdbS
         V39olazDC8zfI4KB5Bwci5cBbon2KG55IcOF7RGr39dxeUTiBEe7j55sz5zecjngapge
         EoUubLmZaMsubFxBfM/Rrga2qyQZv3us0twbcDf9ho6gRskzhiyemxB1HPuIwYjPlCBi
         +MZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ZssukcpYhmA5+w/Pfdf7IqK9yP1BzO1s3i+w0bdaJAE=;
        b=QHeJo2tVtgcGNcvkuebctSzsU3Ru5B0Ivscot3J/VzzhFjm3ja8jjCtM27XjREfIlC
         FWqDoObvgryjxv9Km3dwDDEdQeZ/yRJodSke8PcSF4womlY+XF63LiLESBCsgV8sptGb
         YruJ1PLdudjxysTpquMT+dhF9Cd53MNvOZ2KCpFlKAK5EIg6WpWF1FZVYgKB0jWop+2Z
         HBU/x7Js9mx+7Pb2wnw4l+zG7HEQ/amNjpQkBr84WktQdkR6zeFL+2nA31QGSlkFCkSc
         4VwFN6ZBtOrzqaw4DX8q3FnI9Tm99pk0wl1KMorXFnFDH4tuT6QKuYuoTPL4+yU//P/z
         EBzQ==
X-Gm-Message-State: ACgBeo1x/iVzvBGcwORNmGDTWe2cWzZLxoYn57UVxSmb+ufchB7CAh4s
	+VJvS7KYq41U9mbfDSdwiMVRkFsgpv67yQ==
X-Google-Smtp-Source: 
 AA6agR7elB/y43r7fV+qu3Arwg97vUEkxztbqKMUhZiplTqfB0ax0zl49UGx2Jo+a3X/KARoiKASnw==
X-Received: by 2002:a63:cf44:0:b0:42a:277:1cb8 with SMTP id
 b4-20020a63cf44000000b0042a02771cb8mr23139684pgj.198.1661322890297;
        Tue, 23 Aug 2022 23:34:50 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 s24-20020a639258000000b0042a3d9a1275sm8384957pgn.16.2022.08.23.23.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 23:34:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 6/7] gcr: Define _GNU_SOURCE
Date: Tue, 23 Aug 2022 23:34:42 -0700
Message-Id: <20220824063443.1774094-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220824063443.1774094-1-raj.khem@gmail.com>
References: <20220824063443.1774094-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 06:35:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169780

This ensures that definitions of functions e.g. getpass() are correctly
sourced from system headers, since it depends on feature test macros

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-gnome/gcr/gcr_3.40.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/gcr/gcr_3.40.0.bb b/meta/recipes-gnome/gcr/gcr_3.40.0.bb
index 0c2af42f06..917be5938b 100644
--- a/meta/recipes-gnome/gcr/gcr_3.40.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.40.0.bb
@@ -13,6 +13,8 @@ DEPENDS = "p11-kit glib-2.0 libgcrypt gnupg-native \
 
 CACHED_CONFIGUREVARS += "ac_cv_path_GPG='gpg2'"
 
+CFLAGS += "-D_GNU_SOURCE"
+
 GNOMEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION = "gtk_doc"
 inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
-- 
2.37.2


