Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86180D5AE5A
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 03:38:31 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.64163.1730950701518906175
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 19:38:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=b369kiRV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e52582cf8so333502b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 19:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730950701; x=1731555501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wX/J9JepJ9MleksWSyjA8+eeNc9rKGna9Lte/4LZUzk=;
        b=b369kiRV+2sjOI1gNRKJb5gI2r4R5S7b2JD2wT+MOnlSuiO9MKH+jX2Tr+P1A4qLYR
         1vVneMyJ7CaoykLT1baFyUXpSl50YBrL7d7oWtbB+ir5ICBy5r6j/s10dgd+qHP7ECyP
         xLi07JfTh2n+QW/5EKZod3jVmORzo12+Cb0Ex+pUHnFrwXYUrv2+QbuJUyxPMQZAPuPq
         7xz4NoNKjCp9SYkK3+kYJRnXM9Htscdud1UeHQQVjlaLsLS5JtaeLuj8+ZVXo5VdYRoa
         3XKZWXetB1dA4pJHP0oeukbzDfY9TKcr/ZWHUljb0U1m07AJaQ0jDUVzEvUKhq9qtYKS
         lSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730950701; x=1731555501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wX/J9JepJ9MleksWSyjA8+eeNc9rKGna9Lte/4LZUzk=;
        b=V2MKt63FPsF1TwROai9dV6f120pJXxcN4ttJouYfFgco5num8JJjs5lMh/ShFX8Noc
         2bUe6vPfK+md4uGZOxR68JX49P9Pww6baC8rmIRiOhDSifDTWQPbZ1Eq/b3sUB6tkmLq
         gvJf8NapMBw/xmURQPWe2LBvAz2exbY6XX2KekqaabX0cSnPjK3QtpyzWO+QNQ32sjmj
         387rfvHD4nVeZJFd5el32fec1Ijqbp3ewkSBgvPqewqMuc5LAwMFb13NYoS1MZP2DWdF
         fectAB0z8x6W3U5DKNCQfpBaoeJL96yZgFzFG0cOX9j3gxVEYLlS4htjgEY0g7yryOfA
         Jsbg==
X-Gm-Message-State: AOJu0YzDAzCH/D4IGrfNo6V3L0BZ5FVLj/9vMjjSibkh/jYFjr7Fx99k
	YdNLmy0UZ8qho9JaJAqiPosl0mUh4XV7N4GldhYN9frmd7crK3eRRlXbddRWStJSwUABHjN3oCC
	D
X-Google-Smtp-Source: AGHT+IHlV+ADKA7YbT5qa1w6J2nsWUqARVq/5pqzF6/YH19ioOuXLgEKK9sRdhtSnkzVOjVkoJAC0g==
X-Received: by 2002:a05:6a00:188d:b0:71e:14c:8d31 with SMTP id d2e1a72fcca58-720c991f71dmr31473793b3a.16.1730950700714;
        Wed, 06 Nov 2024 19:38:20 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078cd2bcsm366803b3a.84.2024.11.06.19.38.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 19:38:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/10] weston: backport patch to allow neatvnc < v0.9.0
Date: Wed,  6 Nov 2024 19:37:50 -0800
Message-Id: <4aa19f4444feb3968110935818d8628a95672539.1730950520.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730950520.git.steve@sakoman.com>
References: <cover.1730950520.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 03:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206828

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
 .../recipes-graphics/wayland/weston_13.0.1.bb |  1 +
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
diff --git a/meta/recipes-graphics/wayland/weston_13.0.1.bb b/meta/recipes-graphics/wayland/weston_13.0.1.bb
index dd9517a4dd..d8f0279b65 100644
--- a/meta/recipes-graphics/wayland/weston_13.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_13.0.1.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
 
 SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
            file://0001-libweston-tools-Include-libgen.h-for-basename-signat.patch \
+           file://0001-vnc-Allow-neatvnc-in-version-0.8.0.patch \
            file://weston.png \
            file://weston.desktop \
            file://xwayland.weston-start \
-- 
2.34.1


