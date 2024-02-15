Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242F5C48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:18:28 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.18123.1708013907691612261
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:18:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=h3dHpeY+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d911c2103aso6670385ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 08:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708013907; x=1708618707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B0plenJxBJyqCsH1zjoU79VrMryGYSA+Ug5Olg6AnRo=;
        b=h3dHpeY+GeuhRemZhGtCGgxkp9bmNqvTqWFe7gx/LbdslqXjPRp2pL5+Ku8YK3Y5Qe
         wJHVIl3TfYDgWi3geHpHiqfhkqAPl5CnpaJ0U11IAbaXxw9zlsLOuMgRk2kFS7/Bv7Ht
         06FXGCtpabABY+yCOTGncsBiEPhQAI4G8nH4zbL+YtOrkZNRE99EoutmSjepEAA4JaJ6
         Uv7oYxb4Uu/WCgva/ym/93yacP3edhPWC3I4IaQfM0rJ2WMy4+UrpeNEXL3cHuFhqPhx
         sASUSenfVE4wXq8+lL1blDYoUYNn+aBXeVNSqZY9DWKeFU1KVM8B2QnZHJ2xazKJIi2J
         cx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013907; x=1708618707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0plenJxBJyqCsH1zjoU79VrMryGYSA+Ug5Olg6AnRo=;
        b=gBPlokRXYXURo7qkNy2tP5xpLjB+3mUgdo9freksrz2msbzPCLw8AVpDXPwSNNTxze
         qNe7LvrrDPv1nCEgZkTaLm5k66jRe3AjeUSHLMACL0CIyI05vNAQnqCKFVx5Jerruvqt
         xfeMpHZLCXeH66NAHZTPiKMAafGkACrWh6SQYvP5hAnTLw+7zD//S/xytI617dKb+hTQ
         Xnb+RUYtooCN4VpnqqLRfRCg4egTrERkFIrZiuaBovQuVfXEukpXNSHOVLCUdtbOKWCP
         KH8TFaURe+7h0g6eiJfY7tR0fRVT5/9p7l1UISFZ8j/Ixr1I8U57XbAb3idBTbc4KlfA
         H8bw==
X-Gm-Message-State: AOJu0YxABCZnW8I+TC4+Yw4+c0CuTuKPu46m+E0egfiyEP3U8fx0CgIN
	McNrjSXyt74ZQT6JbxppQELPN86IYtQo4Iv04mfPXU92FIYi6rv3mdddujUNkIt2/sFttqvWJab
	cgTk=
X-Google-Smtp-Source: AGHT+IEMnLGQ5ZEmKGw7xQlaqte0lYJh3iYQ9Dmg5amsY5RF0MhYAGV37MR7wLg2uR+vcMBTt7SUkg==
X-Received: by 2002:a17:903:2289:b0:1d9:8e37:56d6 with SMTP id b9-20020a170903228900b001d98e3756d6mr3064195plh.40.1708013907029;
        Thu, 15 Feb 2024 08:18:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902d05100b001db66f3748bsm1445683pll.121.2024.02.15.08.18.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 08:18:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 08/21] gtk: Set CVE_PRODUCT
Date: Thu, 15 Feb 2024 06:17:51 -1000
Message-Id: <e1bab7d2f5a885f2e4fd0332599edb8bfa55be45.1708012696.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708012696.git.steve@sakoman.com>
References: <cover.1708012696.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195528

From: Robert Joslyn <robert.joslyn@redrectangle.org>

The CPE vendor is "gnome" and the CPE product is "gtk" for both gtk+3
and gtk4 recipes. Set CVE_PRODUCT so we properly match the NVD database.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 253f5f745d66acefcc739f1c9ad2dd46be630e47)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb | 2 ++
 meta/recipes-gnome/gtk+/gtk4_4.12.3.bb   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb
index 37fa0a7290..c23c46a689 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb
@@ -13,3 +13,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
                     file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
                     file://gdk/gdk.h;endline=25;md5=c920ce39dc88c6f06d3e7c50e08086f2 \
                     file://tests/testgtk.c;endline=25;md5=cb732daee1d82af7a2bf953cf3cf26f1"
+
+CVE_PRODUCT = "gnome:gtk"
diff --git a/meta/recipes-gnome/gtk+/gtk4_4.12.3.bb b/meta/recipes-gnome/gtk+/gtk4_4.12.3.bb
index 001b06934e..2c85e7e75f 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.12.3.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.12.3.bb
@@ -41,6 +41,8 @@ SRC_URI[sha256sum] = "148ce262f6c86487455fb1d9793c3f58bc3e1da477a29617fadb0420f5
 
 S = "${WORKDIR}/gtk-${PV}"
 
+CVE_PRODUCT = "gnome:gtk"
+
 inherit meson gettext pkgconfig gi-docgen update-alternatives gsettings features_check gobject-introspection
 
 # TBD: nativesdk
-- 
2.34.1


