Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16612D31773
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 17:55:44 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.26708.1730829342920237448
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 09:55:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mn5TewN1;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e30116efc9so4582151a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 09:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730829342; x=1731434142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=amaCOa0ktjhp6XWwRZkqlb0qh7O9+MDWl28x2rLA0X0=;
        b=Mn5TewN14/oSjCsbI/tINTBhLpYEGPH5o6eCO74j0lUiXdNtLBUb+U8NHNVx9XW0Ti
         i0OLZeC1Xe5/HlWyy2I6uoLyK7X1+roUWEJADEKcV+koB7Zj7l+mm3mBwRssVpWnn662
         VssEpV2nghamnyuRYvJIKLbn2L5U1t5xHkuT0RPGCFIM1fl2jBYiFyk4e88SFSaySUEK
         BQmUAdq5IkOtvsbZKXF/7u0LupL019AdUQNT6gTNmbeUPIzafPBcIMHCegVV/3vSnArd
         ahPLWk2HTiSWTkCxkj2MMy04zVdUX6+aeOO/NQG/MY81r1CNgtJzeU9QNp5KK73/hWdX
         evwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730829342; x=1731434142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amaCOa0ktjhp6XWwRZkqlb0qh7O9+MDWl28x2rLA0X0=;
        b=abTVFRI5jeDaFYcFneYGoiskOdL8YlnM7yjb2eY+EA/DwzJ7WeKVrrI5Xiky933z3w
         cDXcY2HKC2yFnjON9IKZguzpTkKDJtNtw30KdsOdlX3l0duxeVaddZhv0nqtLKiEjMK3
         M2xX2qilOEPlzSGNbjFE7vJtfN/cyTA3lrlRyAnH5Ab6j3wqBZIdXFMUL8iwumXomnD+
         2BYBpH9LZCAto5Db+2dhl8CJFqIYLyoaqWWMbQ+Op5NcvlbJpE3HDfLX5bNTNTzwIwqd
         3hCEMgGLRIMbo8iHvt+15mebhRl8O0/ISCHNkqIyu6gkaJ54bZfJ43GwAAA/FLEyKR98
         VEOA==
X-Gm-Message-State: AOJu0YxUQHPKUFS9LCwFadarJVy1C7knX1Ayf9OGo8wka/CvL5gsyxvA
	tmA9zxJKAFYg1od5jLRgPOBDAO+c4tZ0jlYllxm7oXXDSJxLXGiyNaKJ9A==
X-Google-Smtp-Source: AGHT+IHRi7jN+fCV7lfEEzQfN36ZlwwiM5vUBIQA91R2FXv6z1OVstFYZPrmvRzvibnFdIBdys1ulg==
X-Received: by 2002:a17:90a:3d0a:b0:2e2:c252:f861 with SMTP id 98e67ed59e1d1-2e8f10a7298mr39363774a91.28.1730829342055;
        Tue, 05 Nov 2024 09:55:42 -0800 (PST)
Received: from hiago-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e93da983e2sm10080821a91.11.2024.11.05.09.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 09:55:41 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Hiago De Franco <hiago.franco@toradex.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [styhead][PATCH] weston: backport patch to allow neatvnc < v0.9.0
Date: Tue,  5 Nov 2024 14:55:13 -0300
Message-Id: <20241105175513.1533210-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 17:55:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206724

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
---
 ...1-vnc-Allow-neatvnc-in-version-0.8.0.patch | 27 +++++++++++++++++++
 .../recipes-graphics/wayland/weston_13.0.3.bb |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch

diff --git a/meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch b/meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch
new file mode 100644
index 000000000000..4ac1c075fdce
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
index e4843d38f716..19b242d01b8f 100644
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
2.39.5


