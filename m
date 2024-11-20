Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496FAD63947
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:34 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.13939.1732111045061008119
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=I3Dq9xul;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ea4d429e43so2939979a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111044; x=1732715844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXh+h3OyLQu4fx0ilO3JHaDp+fVL507LNfR2n+7r2KI=;
        b=I3Dq9xulxYzbWsXyZBSdD+tOKjt/FgLMvBUD6MHHvoih+vpNxuoDHzrzGGFqwA6uGg
         Cv/22KrnG14HXW7J3lR+HW1f16y1wEzFF2jZYTqme6jUsMIWOe+9L/h2E9MyTZ6D99/3
         p9R1MqRa9qRdDUPgqOOzWe8yQL4ZRxQClqBo992qIbPOglS/RHgNXwzCoJa3I2Ha8XoA
         0gVVkK8IeYsWclM+uubkUDmWL0WcW0E2DtjFi3V/V7X5fE/9fIIg2VzHUUbF/FJKfrCw
         Q5x62YdIOX2z6w2dfuYbtEroNiZu1jJ0zaYIf2F8vt/mD8qJLrjGlhkZAJYR6WQXC1yl
         MLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111044; x=1732715844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXh+h3OyLQu4fx0ilO3JHaDp+fVL507LNfR2n+7r2KI=;
        b=DzagfLhrfQN9GVbWdS43Yax6H7175R7QdIa85t8sXC+KGxgukEcZ1egLYM2lv2Cphb
         Rs9tG7nOaWNpZY+xylMC8mavwRwuMFFQ4QTI6BaVs0GfSZi8KnGbl6fsIzkMA49JJ2Gm
         g8bKsbLJiH0sVCPJO6Hc+F/4fBOk7d68PGqGS1x8A0f0exoABFQG4HUXm+9C35ScG0qW
         7jAmSa+rOtu+ztEhQ0Rt1uYlwu5HE2OdCmLRAmIt99lkFOhl2CjVaGnO2aBHhunSb3EW
         ds2/jVcIxKzFK411kQZDvTd7yPLjzOkTHyLXTcsq+0oyvh9AQwxHWty9yba1TUBiDB9e
         CA3Q==
X-Gm-Message-State: AOJu0Yy9wzQ+z/5xdyJutqYJRDXcPlqXzrSWqF87z8Cnxlqur4bXirna
	jQiHE8+EUsO6O7jehoqjeOornr1cfO8l73qwQgDcuPv3UkeEWzGMgcNIf8GRjJ9Otgyq4HihEmO
	L
X-Google-Smtp-Source: AGHT+IGc4NjcM3oGNxMkDrlztFFg5axflssefqehFDL8Uqz1POLyRMCPmgx589OQpA6rnub5LPyvyQ==
X-Received: by 2002:a17:90b:1dc9:b0:2ea:7179:5c2b with SMTP id 98e67ed59e1d1-2eaca7de4a2mr3412501a91.35.1732111044268;
        Wed, 20 Nov 2024 05:57:24 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 08/31] weston: backport patch to allow neatvnc < v0.9.0
Date: Wed, 20 Nov 2024 05:56:40 -0800
Message-Id: <be0ec3f36f022f076363d6afa4c8d23663b82e3f.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207432

From: Hiago De Franco <hiago.franco@toradex.com>

Currently weston 13.0.3 with neatvnc 0.8.1 does not compile when using
VNC:

| Dependency neatvnc found: NO found 0.8.1 but need: '< 0.8.0' ;
matched: '>= 0.7.0'

However weston upstream already increased the allowed version to 0.9.0,
since neatvnc 0.8.0 does not introduce any changes that breaks API used
by the VNC backend. Therefore, backport this patch.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8516496018a3ee9e81a67d4682bf9784d0eab2bd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-vnc-Allow-neatvnc-in-version-0.8.0.patch | 27 +++++++++++++++++++
 .../recipes-graphics/wayland/weston_13.0.3.bb |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch

diff --git a/meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch b/meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch
new file mode 100644
index 0000000000..4ac1c075fd
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch
@@ -0,0 +1,27 @@
+From 534cfa08ea0a0c2646b4aec20b16bf95f6d0aae6 Mon Sep 17 00:00:00 2001
+From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
+Date: Mon, 3 Jun 2024 13:39:27 +0200
+Subject: [PATCH] vnc: Allow neatvnc in version 0.8.0
+
+Neat VNC 0.8.0 does not introduce any changes that breaks API used
+by VNC backend, so it is safe to extend compatibility.
+
+Upstream-Status: Backport [05e5405651054c580b248c4ab2791ed8d66369e3]
+Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
+---
+ libweston/backend-vnc/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libweston/backend-vnc/meson.build b/libweston/backend-vnc/meson.build
+index b7b6916..39b15cf 100644
+--- a/libweston/backend-vnc/meson.build
++++ b/libweston/backend-vnc/meson.build
+@@ -3,7 +3,7 @@ if not get_option('backend-vnc')
+ endif
+ 
+ config_h.set('BUILD_VNC_COMPOSITOR', '1')
+-dep_neatvnc = dependency('neatvnc', version: ['>= 0.7.0', '< 0.8.0'], required: false, fallback: ['neatvnc', 'neatvnc_dep'])
++dep_neatvnc = dependency('neatvnc', version: ['>= 0.7.0', '< 0.9.0'], required: false, fallback: ['neatvnc', 'neatvnc_dep'])
+ if not dep_neatvnc.found()
+ 	error('VNC backend requires neatvnc which was not found. Or, you can use \'-Dbackend-vnc=false\'.')
+ endif
diff --git a/meta/recipes-graphics/wayland/weston_13.0.3.bb b/meta/recipes-graphics/wayland/weston_13.0.3.bb
index e4843d38f7..19b242d01b 100644
--- a/meta/recipes-graphics/wayland/weston_13.0.3.bb
+++ b/meta/recipes-graphics/wayland/weston_13.0.3.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
            file://0001-libweston-tools-Include-libgen.h-for-basename-signat.patch \
+           file://0001-vnc-Allow-neatvnc-in-version-0.8.0.patch \
            file://weston.png \
            file://weston.desktop \
            file://xwayland.weston-start \
-- 
2.34.1


