Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726FAC46467
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 18:39:15 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.25196.1672425545953139560
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 10:39:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D6D5YrCz;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id l26so14086803wme.5
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 10:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0pwcxvvPaBLY4zCx5Cf1ZwvWish67VRgfzwYQ5jF8o=;
        b=D6D5YrCz0rgSt66qRwK90URDVURbdrGKQHaeAC3K3GdLkC5YMtSM5oAdbgDJqqRtU9
         44X0HERIwylBFWnT8VbneF1iyrL4PiHCIAWnh17ADTCpbPkiqFhj+AXT6Bmtlk5E6NXk
         242KNVmv8DGnKjk8ucT43nAnDoebx8umjt/MXvY5ifvFBgSgoDLLofsrec0m9SdSx1Xu
         hq+TznHaP9UNS32sngjc6+ndbJbmR9ZUiYWUlWN4ORIzZAbALIi7kP0tG07wEdQWvG8s
         PZAHeCFjIle3E29s6A0xWkjB9MQBuJqZimu3q78wWB1T5knOZ6KLB5oJZ7jAGMdSKjYq
         8M/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0pwcxvvPaBLY4zCx5Cf1ZwvWish67VRgfzwYQ5jF8o=;
        b=Pt5FEENIRofVtLi5nB2HdDyLZx7S0T18RXjdRtNl7KGI3mr82y6CQeebk/Kc1kE8ch
         0xWdG357gPItkSIVaqraf5lCjv+5Qw299bQ0JCYQLcev4H8gnXRykCaChrr80JdCgq9p
         rJ8GfTqlx/erpbmAvM+BIVP/zessw0+m+uhfpIeLrEcwY/LplXrer2sj4dGOupfm8jM+
         vQgyy5OdqqLDjp3OFewD0bwozHFK5abHdWUDo6EHoHT0jfwwtdHkbpjhDUJL0Iw/7WZ5
         ovWlO8o0J4MtppgT8SSaa6hssUUjbdSeECALtP92nGvsxXpbZxoPe3Y0XyrWDFZDBmxt
         hGjg==
X-Gm-Message-State: AFqh2kqykGVDjqZ38WAEGiIl1WqZkwDlMyMcxCyD67alLTrqt099+E9G
	btreJikMuYbv35rVGoyc4v1G0papygY=
X-Google-Smtp-Source: AMrXdXuXe/ab1uxhbpFKKMaFxiq67Gu9xPupWKG0PDOZU4XkSQMcmKtaR8b+wUZumZBY2M69SaqIBA==
X-Received: by 2002:a05:600c:4b1d:b0:3d3:3deb:d916 with SMTP id i29-20020a05600c4b1d00b003d33debd916mr23679400wmp.4.1672425544498;
        Fri, 30 Dec 2022 10:39:04 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id n1-20020a05600c4f8100b003d96b8e9bcasm31426682wmq.32.2022.12.30.10.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 10:39:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/11] epiphany: update 42.4 -> 43.0
Date: Fri, 30 Dec 2022 19:38:46 +0100
Message-Id: <20221230183850.3089510-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221230183850.3089510-1-alex@linutronix.de>
References: <20221230183850.3089510-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 18:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175170

soup 2.x support has been removed upstream.
libportal is no longer optional.
epiphany now also needs gtk-update-icon-cache
and update-desktop-database executables.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../epiphany/{epiphany_42.4.bb => epiphany_43.0.bb} | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_42.4.bb => epiphany_43.0.bb} (75%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_42.4.bb b/meta/recipes-gnome/epiphany/epiphany_43.0.bb
similarity index 75%
rename from meta/recipes-gnome/epiphany/epiphany_42.4.bb
rename to meta/recipes-gnome/epiphany/epiphany_43.0.bb
index 0cbe1c9c58..4a6007b0df 100644
--- a/meta/recipes-gnome/epiphany/epiphany_42.4.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_43.0.bb
@@ -15,12 +15,15 @@ DEPENDS = " \
           libarchive \
           libdazzle \
           libhandy \
+          libportal \
+          libsoup \
           glib-2.0-native \
           coreutils-native \
+          desktop-file-utils-native \
           "
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase gsettings features_check gettext mime-xdg
+inherit gnomebase gsettings features_check gettext mime-xdg gtk-icon-cache
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
@@ -28,16 +31,10 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "370938ad2920eeb28bc2435944776b7ba55a0e2ede65836f79818cfb7e8f0860"
-
-PACKAGECONFIG_SOUP ?= "soup3"
-PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
+SRC_URI[archive.sha256sum] = "b66d499f9ee72696d83cf844125377181a954554a4bb3785b73293380ac0c227"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-PACKAGECONFIG[soup2] = "-Dsoup2=enabled,-Dsoup2=disabled,libsoup-2.4,,,soup3"
-PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
-PACKAGECONFIG[libportal] = "-Dlibportal=enabled,-Dlibportal=disabled,libportal"
 
 FILES:${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS:${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
-- 
2.30.2


