Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D326D31774
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 17:59:34 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.26633.1730829564101035876
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 09:59:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mx7WBIhI;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: hiagofranco@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-720be27db74so39421b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 09:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730829563; x=1731434363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VU/cCaMJVWc5IJ26FY3NS2Nk39R7vIphMqgLnzJTGKc=;
        b=Mx7WBIhIkq47VbKzLVscaXcPxm6jlCrQigi6osZ30BcIueCdaUBr6MEAMK5La//pEE
         184vEhkvlfrDwVFxQjFUY96wirBCj5D3Y4vttXqCkqskPvCQ7M42SptFEEwB22/wSI2f
         H6Lvs8KExDbkIYP6AYFv/XMatP3RwAVcopcmOOd0vQWC/LXEoXI2spK0ahbpyfVlPZQ8
         +wgK6JO4NnnsTXFqMuag958u63BW4f7WHIa9PNcorpOkQ0pfcYVe1T9g+ZsFn7aCEW6s
         RQVbK24TCQxyHJ1psMqVlCDumKd4Tg/w0Aq6HuT3Jyoe5+S2QHTJwHw2/btCNC7/whKR
         cUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730829563; x=1731434363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VU/cCaMJVWc5IJ26FY3NS2Nk39R7vIphMqgLnzJTGKc=;
        b=lXpd3FrOJj3m0LOM8SFWrQ2i7aYNYPfKYLFRClhE0+fN4fFUCphStc9MYZUI/VrLPh
         GWb6Wji2C4HzQIhgnmDPV8fuH9TmBJNVIsEf5c1d4ddwXbFrtJgfj0oD3Be0tq/uMbiJ
         lalM66uSta1cTmnPIE5rucjbBzTR3PhnAcIG5RoXxVsxgB8OhoTc5xcysU7ebbeimZK9
         thRTdVmYzB5dh6o0Ao2LD2909DU3jZ9Z0QdAE9iLZfHyGyLZsvc26KoiCTmEdIwRBQ3P
         XjI2KcffuDMn+0cHIh06B0eW+P3NcZGfAwIIqa2DQ7VQymgI+7oYpEbT3oRXjXVQi75H
         be0w==
X-Gm-Message-State: AOJu0YzJSX/QIh6zHY8ZSKDEHZSyrIiNDOAiACbsCkxGArcAFvAcmasM
	H90xdLqKRfl3ZYI9i6S+vnlU2MTG2Bqa75X1xil7NgveV9hoVmYMiHHBKg==
X-Google-Smtp-Source: AGHT+IHbeameGlUAwvwbiRX0PlkYsj11DI3KTaBaab51G5KuX+zrghYo+fU6hnN+VMqKex7Z9RLakw==
X-Received: by 2002:a05:6a00:4b12:b0:71e:4dc5:259a with SMTP id d2e1a72fcca58-720bcd50aabmr29593255b3a.7.1730829562693;
        Tue, 05 Nov 2024 09:59:22 -0800 (PST)
Received: from hiago-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1e5e11sm9860851b3a.50.2024.11.05.09.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 09:59:22 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Hiago De Franco <hiago.franco@toradex.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] weston: backport patch to allow neatvnc < v0.9.0
Date: Tue,  5 Nov 2024 14:59:08 -0300
Message-Id: <20241105175908.1534426-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 17:59:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206725

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
 .../recipes-graphics/wayland/weston_13.0.1.bb |  1 +
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
diff --git a/meta/recipes-graphics/wayland/weston_13.0.1.bb b/meta/recipes-graphics/wayland/weston_13.0.1.bb
index dd9517a4dd0f..d8f0279b6575 100644
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
2.39.5


