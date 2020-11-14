Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.4302.1605348580487520947
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2020 02:09:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m+4q0M/K;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id a3so17889238wmb.5
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2020 02:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iAuaOaTpStlLGfsYY9QvvCoSOGO3uJTrE5f0LepgH5k=;
        b=m+4q0M/K8K9kJWqIYQrxkS1vZrLfs6kVkXBuLnis4kbt1DkFQ9cE6lV/dIKgo3m3ZA
         wrYEyVEtXH/l6CnQndOyqsIpU0cZDMIBko+XmUIU87Pe5ohXvVfGUQEulqv0iWZ3EA46
         z8ekxL1LRuWDk5hAfwScvYpbG7hV8+p9PbRy48vgZ5zy5OjLQwkait1owR3EHrcaLPp9
         X1Is3ltjGcPfDsWTFlwrsVwxA1b3iNvFlVaB4a4k2gFY9WS6mUU1dfiQ+lR5LGt4O7LN
         VRpF0uQ4V+g23RZ6R64MO/8TBSaQu6iliJFN51RGg6QvjTkvt2RXo7E9ponyY6ytBZiC
         wpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iAuaOaTpStlLGfsYY9QvvCoSOGO3uJTrE5f0LepgH5k=;
        b=acd6flnTe2/txUZu72nOJKMQvjCiZc27XUtxhzTNvBvEm29EzMyvHh689O65JREgdF
         sbUFXvJ4ySQagE15Lk1qbg8/K7c9Nje+AtoVIciny8mGWU+gpRJa94oVOSBUY9GHIeNv
         /SXQ1nwd651t9Cd8dLO/UYVZ1iGD1IqQ3gArahvFMKHm8Qj40cMCRFONJaRnqIDWcuS0
         WovtlrD5w0TWLZGrN+CUh0tcOArpYdznfPYzutIqvNAk3fnlini4nb+ifNl14RBJOMIn
         ImzOKmAF0rn9VeXiPjRIndM7QNftg854CR4g9cRLe2Fry543wDVkjK3ktASwhPqrvYJD
         cSVw==
X-Gm-Message-State: AOAM532N10Cfkex9C73yR2rEEPt2jOIuj+Wk1THZ9trcuVz1EMlyh2lJ
	SBWPuxmFX1y08IHHZZt4Vk8sb2IilqU=
X-Google-Smtp-Source: ABdhPJw2aWase79LPw+EOU4GQUa3M8WUfGFPMVq+GrAH5yYaU+kPGIFfPokSh6xsPuc78VmXLqwEpA==
X-Received: by 2002:a1c:e3c1:: with SMTP id a184mr6498653wmh.88.1605348578452;
        Sat, 14 Nov 2020 02:09:38 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b14sm13800895wrq.47.2020.11.14.02.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 02:09:37 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] weston: add pam to REQUIRED_DISTRO_FEATURES
Date: Sat, 14 Nov 2020 11:09:35 +0100
Message-Id: <20201114100935.218002-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* it was added to weston-init in 72dd74c5d384dbe641cc7c02ecf766ff8d5f555f now world
  builds are failing with:

  ERROR: Nothing RPROVIDES 'weston-init' (but openembedded-core/meta/recipes-graphics/wayland/weston_9.0.0.bb RDEPENDS on or otherwise requires it)
  weston-init was skipped: missing required distro feature 'pam' (not in DISTRO_FEATURES)
  NOTE: Runtime target 'weston-init' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['weston-init']
  ERROR: Nothing RPROVIDES 'weston-dev' (but openembedded-core/meta/recipes-graphics/wayland/weston_9.0.0.bb RDEPENDS on or otherwise requires it)
  No eligible RPROVIDERs exist for 'weston-dev'
  NOTE: Runtime target 'weston-dev' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['weston-dev']
  ERROR: Nothing RPROVIDES 'weston' (but openembedded-core/meta/recipes-graphics/wayland/weston_9.0.0.bb RDEPENDS on or otherwise requires it)
  No eligible RPROVIDERs exist for 'weston'
  NOTE: Runtime target 'weston' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['weston']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/wayland/weston_9.0.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_9.0.0.bb b/meta/recipes-graphics/wayland/weston_9.0.0.bb
index 051fd85941..8cb105c785 100644
--- a/meta/recipes-graphics/wayland/weston_9.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_9.0.0.bb
@@ -21,7 +21,8 @@ UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
 inherit meson pkgconfig useradd features_check
 # depends on virtual/egl
-REQUIRED_DISTRO_FEATURES = "opengl"
+# weston-init requires pam enabled if started via systemd
+REQUIRED_DISTRO_FEATURES = "opengl ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'pam', '', d)}"
 
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0"
 DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native"
-- 
2.27.0

