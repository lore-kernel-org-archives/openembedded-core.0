Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web08.9093.1619077061486380967
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 00:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IplxAUEu;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id w3so67337859ejc.4
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 00:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IC5+uzwXocsNDk18kqltcTcfO0tyYs9tj5GpKlgFuoc=;
        b=IplxAUEugeWz2RlxYzX/9CG39R3oM5Z2HnUD5xZxm/lYwfq4XRA8cNF7+sJ2iwbIPP
         VWmBLsGg3X5RlkECf7QD7Tzy03xb7T7BfwU88uzPbw4z9upfUoU6ZyMyk2djrVCb4Igz
         25wgXUCMmPtiQwC3/EluL1Js9MWpzWmJz/3Be108zBl+tW8UJame760VlF5x4Jyf9M7C
         dDCpYZVWS/QYAfowvXhwDUyOaqjZ3OrVJfSg1g1tymxDWZoDwLhxsZ6QNooyKH5+zKud
         pxcXY8hOYVfvYEADKtWgn83PbCdOxhRl1b+uWKix7I9vWNkCCtERlXoA3XFTvwD9TjWa
         wayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IC5+uzwXocsNDk18kqltcTcfO0tyYs9tj5GpKlgFuoc=;
        b=Fb77Bn48dKF0f9gJ5YTfCPQFkrZaLX8CHiGD6T1W8Kfyrn+KyrqQw7dZoh4c2ehzX8
         TLCwjnwpLmppDBjnybVGsS8YFlF71pZjrqhA6RdVfpinsPrjLwbaXiBY0V5dAvAD4+vY
         28/+QvhX8h664kt6hXUApGk8JSFvlYg267t5OIHgE4P4usvgJ3hWkUVzpKIyT+GfeF/h
         yXPMXLeBl40DPllP48dlZpw29CrGRg+T/8o6oi4qXN+mkq1IiNrNPcelL8liP05oY8X1
         24egg5Yejw/1sl3W/dyb+ePnaun6Zwu7hhRQK+vYjpoHfNESqlEmqkNFsK5MZhTnhAaj
         tJQg==
X-Gm-Message-State: AOAM533A3MLM1nNgZ2WzQl4LdcwKzfpXt3uE6l6ic27nyQ6cxCSTJx/E
	gvPGve5ArXtE7RBWy2sXaJS8w6lDs1g=
X-Google-Smtp-Source: ABdhPJwiR4sJZPpIrvkUvsG4iAIckDQC8jTizrRusydLBCyBJnoCmWNXSDVQ+/adXgN6DHNE/sE4mg==
X-Received: by 2002:a17:906:8551:: with SMTP id h17mr1903182ejy.377.1619077059817;
        Thu, 22 Apr 2021 00:37:39 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v16sm1328861edt.53.2021.04.22.00.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 00:37:39 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] xwayland: add opengl to REQUIRED_DISTRO_FEATURES
Date: Thu, 22 Apr 2021 09:37:33 +0200
Message-Id: <20210422073733.11837-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* it depends on libepoxy which has this restriction
* fixes:
  ERROR: Nothing PROVIDES 'libepoxy' (but openembedded-core/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb DEPENDS on or otherwise requires it)
  libepoxy was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Nothing RPROVIDES 'xwayland' (but openembedded-core/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb RDEPENDS on or otherwise requires it)
  No eligible RPROVIDERs exist for 'xwayland'
  NOTE: Runtime target 'xwayland' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['xwayland']
  ERROR: Nothing RPROVIDES 'xwayland-dev' (but openembedded-core/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb RDEPENDS on or otherwise requires it)
  No eligible RPROVIDERs exist for 'xwayland-dev'
  NOTE: Runtime target 'xwayland-dev' is unbuildable, removing...
  Missing or unbuildable dependency chain was: ['xwayland-dev']

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xwayland/xwayland_21.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb b/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb
index 82765cdaf9..b2ff25fbbc 100644
--- a/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
 SRC_URI[sha256sum] = "31f261ce51bbee76a6ca3ec02aa367ffa2b5efa2b98412df57ccefd7a19003ce"
 
 inherit meson features_check
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 DEPENDS += "xorgproto xtrans pixman libxkbfile libxfont2 wayland wayland-native wayland-protocols libdrm libepoxy"
 
-- 
2.30.2

