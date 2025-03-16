Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC3BC35FF3
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:32 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.31782.1742141548255963325
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KP0ZD5Fp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so6953895e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141546; x=1742746346; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jFiHn6OlkjimoOT8PJDcYQjCYzepAEhbx03ltiMiOTs=;
        b=KP0ZD5Fpkw8YQu2jlc1c9r+OsHLF1ZqslfbsD1SYTnPV1p8Qs9NRYx3EgVhcfrpU1U
         2Y1yWK/dR5mjUnyqavXVt8r1Tiqijuw5Rll3d8pDvttp6kLN0/vfU/pO1JX2hmRhBXOU
         64CMUuT++Dr2wFgsftxuMoISw/b6A18p/jF3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141546; x=1742746346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFiHn6OlkjimoOT8PJDcYQjCYzepAEhbx03ltiMiOTs=;
        b=I6w3zGeQGeRf0IXsX2P327Cj529WdCs03QtqlrW9yVX/7kWSLWsBCzLIDFIEt3bSFS
         XMHmyhQ9yS/gBuXW0u6Or6Y2QiR52MUj+mYhs+GyubWaLWmXJe9jJbDdlL7kU3WvT7im
         bwro04v4Ipsdnxt7xbVulL6GsSXk2g3Xbo0PhnRNwSO4n5Lql1AtvjN/YpBSDagopCPk
         3QNMmg/Dxh3DBhpqfE/0Dpm3EVkWQVzruw5mF8IhYeD5AOtrPS8aFYwThjvcRE16ZCBO
         8gDaDWxXl9skHxNUheCi1poUDBnjA9MbN0xZwHCykodwU/igugmcgNNeXAaDd/of2OUW
         C8Gw==
X-Gm-Message-State: AOJu0YzwMdfdrAFNrmGKuEaEyfhuuVpl/mGKActFTP+1r+sKGtInC/Z4
	M1513Fc/FNoEy4h+LegwlA2YfJCN7g/IAxlU8+shU54nlChEQuDNy9Bshgk7nwehkO+3k1bkTw0
	G
X-Gm-Gg: ASbGncssFm8mnV4JSlWVpZ8uct443h6i1gdBdxHfFISrGnyrl6wEr/nJ6+xO95FCdlM
	3w7utyzsSnQZjZGywqQzByk4q1XMstyL89uoRNP/rm0RGmLapBit7HT2gR1eI1xR/rBauFnbxMV
	Tbq7409bf8cRCXk+z1HoAU74Itsb0Rj3SUK6M53/hQ8W0Npbta5JVhCGmRTGDs3lSoTnduZIT/1
	zS8iiDC/KAhsuwJeFTQ4h+NhO4AVz7FtUVJt5h8g9uK8otsx0bhr0PAoYKPvHt/JsPwWSYDE4LP
	VwRaElyA3ajHV84YnH04dnTMdU9yCAhlcNw9PeBuGL9aVNrpjsgUq9PA/sZu6ItGoWgw0SgQBw=
	=
X-Google-Smtp-Source: AGHT+IFYx1R3hejbHIvbdi8RPC5qSiZ0wz5pXBR1es7mj5Zz+VlUDmY+C63DrZIzGH1Gu3AiEFK8Vw==
X-Received: by 2002:a05:600c:5493:b0:439:873a:1114 with SMTP id 5b1f17b1804b1-43d1f1f2a21mr91542585e9.6.1742141546123;
        Sun, 16 Mar 2025 09:12:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/43] libical: upgrade 3.0.19 -> 3.0.20
Date: Sun, 16 Mar 2025 16:11:37 +0000
Message-ID: <20250316161209.3629986-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213014

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch | 2 +-
 .../libical/{libical_3.0.19.bb => libical_3.0.20.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libical/{libical_3.0.19.bb => libical_3.0.20.bb} (96%)

diff --git a/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch b/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
index 0a7c6965302..0f0dadb4e4c 100644
--- a/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
+++ b/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
@@ -1,4 +1,4 @@
-From 145a0f3919f6884c377a9e6b8a03de707feb45fe Mon Sep 17 00:00:00 2001
+From 7b20ca7f24a4cac25998bfcc70eed75bf796816b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 3 Mar 2022 20:10:04 -0800
 Subject: [PATCH] cmake: Do not export CC into gir compiler
diff --git a/meta/recipes-support/libical/libical_3.0.19.bb b/meta/recipes-support/libical/libical_3.0.20.bb
similarity index 96%
rename from meta/recipes-support/libical/libical_3.0.19.bb
rename to meta/recipes-support/libical/libical_3.0.20.bb
index 1ee39aa94ff..d62c88e3477 100644
--- a/meta/recipes-support/libical/libical_3.0.19.bb
+++ b/meta/recipes-support/libical/libical_3.0.20.bb
@@ -15,7 +15,7 @@ SECTION = "libs"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch \
           "
-SRC_URI[sha256sum] = "6a1e7f0f50a399cbad826bcc286ce10d7151f3df7cc103f641de15160523c73f"
+SRC_URI[sha256sum] = "e73de92f5a6ce84c1b00306446b290a2b08cdf0a80988eca0a2c9d5c3510b4c2"
 
 inherit cmake pkgconfig gobject-introspection vala github-releases
 

