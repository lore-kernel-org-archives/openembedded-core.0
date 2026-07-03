Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A25C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 14:29:32 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.94390.1783088966408715804
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 07:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=A1tyogHM;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493c83474ddso6029815e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 07:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783088965; x=1783693765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NisV8/e1zgNcnTlrnEhGjWhFAHBQyAxaZCODy2NGJE0=;
        b=A1tyogHMuU1AXY0XSB/eGZ799BNCrC48f6xp5C62/HjoGTBZmFDKeXoBcr+s8U0xuI
         r/Xc9Hql27hlluiCLUPGxLc3XXGJxLjBVLs4PgkxXk5qe7H+mIbPsufJOYe8UhTd4Khz
         B3ro9a26l0msYgKnk5h6Bt5QVHjNGVyeRnpZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783088965; x=1783693765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NisV8/e1zgNcnTlrnEhGjWhFAHBQyAxaZCODy2NGJE0=;
        b=mQc1B59NkY4yW0BpMS0QLJhvQlGxT7XYg3ZYtFm7fHhT783CshvclxNtr2KNXolpLR
         Bo6IPTNm8g/C+JDHJPfmrPwlk8WpeboT+WVs16pc2NWo0rCFqAaY9dzOw+oQPV2f2Aet
         RLE7VAR2/Yv1t0XEk9t+U3uaw/VVyB1JCmwwzgoD3WaOVZKsG3t2ZbIkSYmwvPweOVH9
         uOMuakxT18BQ7/R07Fq0TqJoWJenc6xNdyi8a51yHJ7NuVUwbSew/HkAWzEDNoqVpkbu
         2UYltP1KKdOispvbFzBzz0hSnO2y2MnpXY3pXUaXR3DnN/7HnXS8pUOQs77ofPVHM3ky
         zbkw==
X-Gm-Message-State: AOJu0YxraWv2564PI5TOKq4ViEQvN64K4ScKsYo7sLfs4SUSxu2nlrtg
	R0RxtAi8djsChCr0/bk2WJrLaK3PP+WJTgDgU1nR7P65G7tuUELjPWzThSvLVQzIUYmjyydLncB
	LbZU0
X-Gm-Gg: AfdE7cm2KX1sKKUD3qxgalIIVi2aD6Dl5C1SzSRejQX4sWNW7AG4HFUd5r3NJb8jie3
	/DTYgv5zMb0v0AMJWRugz4/Sn3jitFz2TetcXQr/7jmDksH4oPtA9VfamJWQiKEHe62XxpLUdwr
	A3WU8up03j+OjtIQ8/fq+B/qbs2rdWkuyMM16Gm6CVr7RP2mkyr2nqCAIjo2aSqjsXCwicLwLIL
	Y2lJYMq7/yX15ZHSECVa2QSB7klVxWPaRF15l9DTs5P1D1O7Xn3i4uwBVhxp4A7vYhU1bMER2lR
	IjWTFvCibrkjEf3coAE0/xyoV6d64VSqEEgm8T8EQQ0bN3bcbuWePv8lCgjcJ5DVJbLXRhP2Lim
	u3GXno0FgenMQCEMuq7S2AZvTa8nC7+f2qDSdpcUz0FPfUsGMk1qdLb/AdoUL2+Lvzm1yvpDthi
	gKcZJkDrZCjI2pifRThqYYePfELnrQbwkumzkHDpcwRyTKvL5O1riSTUrQoQ==
X-Received: by 2002:a05:600c:a087:b0:490:e974:e006 with SMTP id 5b1f17b1804b1-493d0f3a14emr1242595e9.29.1783088964565;
        Fri, 03 Jul 2026 07:29:24 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm211163155e9.13.2026.07.03.07.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 07:29:24 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH] meta: Add pam to the defaults if using systemd
Date: Fri,  3 Jul 2026 17:29:16 +0300
Message-ID: <20260703142916.2868287-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 14:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240113

Add pam to the list of DISTRO_FEATURES_DEFAULTS if variable
VIRTUAL-RUNTIME_init_manager has been set to systemd. Otherwise
having systemd in conjunction with wayland but without pam leads
to a conflict with the REQUIRED_DISTRO_FEATURES for weston related
recipes.

This adjustment is required following these recent changes that
switched VIRTUAL-RUNTIME_init_manager to systemd by default and added
wayland to DISTRO_FEATURES_DEFAULTS which affects "nodistro":

- 159148f4de2595556fef6e8678578df83383857b
  meta: Support opting out of any distro features
  (Please note that this commit also extended DISTRO_FEATURES_DEFAULTS
  with wayland and vulkan.)

- 0b4061c5d50261f826d0edb4b478d2d305274b7c
  conf: Switch to systemd by default and simplify init manager selection

This fixes issues with test_machine_world when running the
yocto-check-layer script for BSP layers that include weston in the
dependency chain, for example meta-tegra:

ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'l4t-graphics-demos', 'weston']

The weston recipe has pam in REQUIRED_DISTRO_FEATURES if systemd is
enabled. Therefore, it makes sense to also add pam to the defaults
through DISTRO_FEATURES_DEFAULTS.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta/conf/distro/include/default-distrovars.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 69c6db589b..2eadfcbd74 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -29,6 +29,7 @@ DISTRO_FEATURES_DEFAULTS ?= " \
     acl alsa bluetooth debuginfod ext2 ipv4 ipv6 \
     wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp pulseaudio \
     gobject-introspection-data ldconfig opengl ptest multiarch wayland vulkan \
+    ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'pam', '', d)} \
     "
 IMAGE_FEATURES ?= ""
 
-- 
2.47.3


