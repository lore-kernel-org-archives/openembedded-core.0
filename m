Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1E5C88E7F
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 09:52:39 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19505.1789465954615967353
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 02:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SeiK4qO2;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.76, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f88so1716751f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 02:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789465952; x=1790070752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gASngCJajsg/pnk6YruYAJSG8jzzJ/Y6iF+/uubT//M=;
        b=SeiK4qO2ALJ5FmpAX8Kn6ES9HpeVB/ElItFiGpJnB7ptm7IFAnoLXUbGhigkgLqU+/
         sGr2laDDF5ykPFGaCcBElFQcs/ed2tvb8c7md5WTWxzO48l5lWY/D8zowLFdo8C7spKY
         9Dnu0cuf3XC9+mV6Lto8wMU7mWGv2aRGb/kXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465952; x=1790070752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gASngCJajsg/pnk6YruYAJSG8jzzJ/Y6iF+/uubT//M=;
        b=MP6XoNia4yNd6yMWs2wRlkiPiuEKhuT3sK0GGLPi0U5PgEjOzi42xywjGN3oQDQRWW
         hLd6laZjSk/yyuiVFtSgOoDW1iqzGC1Xzij5aLFkqzqMNQP9XDgxHPfn5bxQwSiB4IWR
         26m8vytQU1Y8OT/0cdxF5e+zPlD+vKOwS9lyXrsMdMZpwW4+4niNKMQZv+rLdtQXdgkP
         y8ABGYr3VwhtuOZuDEz7ypjTis3gtbJgKn+079DbWkFUyj73iPnhPLw+fMmRWiWpomM8
         dK4jxQvxblEjgqPOv9rd8euZHpQj6UcKf+WpGRXuOXh+AQRzCVoyqjRtPMM+lhseRyqI
         Tlfg==
X-Gm-Message-State: AFuF++n3jcUOERAKjDIhBK+IZ15otp8YMtoKwRwkSGE7xcWpnTkHacGP
	nGQLt2OG0M7Or+cFM7zGovuAgS0KQGhvo6+x46Aqse2qfcF9EghoBpJSt5c1GbJkd0QvpIgLwum
	mE4UDs6I=
X-Gm-Gg: AYBFou08J0qy9vyPRuzKu6sfL7UFJFVxCkSDJw/7tuMAhgI/LHAceBGM5qSJnSksBg3
	29txC04zZv5K/WGLqjNIiWAWP/hYox6XQw2YRXslT7MmJEGW4y5eoc7aKNSLq1Hnd2pX0QZFeC/
	do4uU1hcst2r3nYlj6t+1X9WxU8siMh0rcMkf7tHVnvQsqfIpyTOJxhqhVnnTHVP/w2MGUtU0bt
	nbBntp3r9Mi+dBjAeoW8sqZR/OhRdIMrHi4hOeNg0PC40uxfCan0h6U5RYgEM4Iu9+ci9AvH4Vx
	9TlBMwgIsAEg2rHKgpSqxX+JNH9y2nJ/35KBW2yKxPfQ63HSHQx02pUbdnsOOmJK25KVQPwTOeK
	1gMP1eYfKfxo/ZSRAs27fx0KKV3QZuvcETKwwEKB8PBTA591hlGS3inTZHAuG+UyQ9U1H49zgLY
	zWMzH2TutIAE5jUH/4eN9uH+w35Vp+69yKBcx27A4/pHt8FNNlRijhcG2B74jxw4CnTqaM+rVqZ
	0W3qegVWi+gQjprAU+mgs83oTRY
X-Received: by 2002:a05:600c:34d3:b0:49e:63cd:31fb with SMTP id 5b1f17b1804b1-49e7a6485a4mr99761725e9.9.1789465952116;
        Tue, 15 Sep 2026 02:52:32 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fe92:a101:5d63:1ea8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d69f6d6sm62617775e9.8.2026.09.15.02.52.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:52:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] gsettings-desktop-schemas: upgrade 50.1 -> 51.0
Date: Tue, 15 Sep 2026 10:52:26 +0100
Message-ID: <20260915095229.2292237-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915095229.2292237-1-richard.purdie@linuxfoundation.org>
References: <20260915095229.2292237-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 09:52:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245832

Major changes in 51.0
=====================
- Translation updates

Major changes in 51.rc
======================
- Added setting for custom pointer acceleration profile
- Remove gconf schema migration files
- Translation updates

Major changes in 51.beta
========================
- Add setting to configure the focus ring visibility timeout
- Add 'orientation-lock' setting to take over the g-s-d setting
- Translation updates

Major changes in 51.alpha
=========================
- Translation updates
- Add scroll speed setting for touchpads
- Add the ability to enable button scrolling on a mouse
- Increase default maximum thumbnail cache from 512MB to 2GB

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...esktop-schemas_50.1.bb => gsettings-desktop-schemas_51.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_50.1.bb => gsettings-desktop-schemas_51.0.bb} (84%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb
similarity index 84%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb
index 1edb548ad6e..e02c082b001 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.1.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb
@@ -11,4 +11,4 @@ DEPENDS = "glib-2.0"
 
 inherit gnomebase gsettings gobject-introspection gettext
 
-SRC_URI[archive.sha256sum] = "0a2aa25082672585d16fcdab61c7b0e33f035fb87476505c794f29565afa485b"
+SRC_URI[archive.sha256sum] = "1e2419a5f21d26c324b28ae1c00e29e9175e8b596fff385a04c2172b36652226"

