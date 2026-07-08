Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EA6C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 14:37:21 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9954.1783521431238916438
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 07:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=MHyNu8/d;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c59f740cso5560935e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 07:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783521429; x=1784126229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H42/ewa0yCkL7raZbY8PdhJtxQmgR/d59AQpI6D55Cc=;
        b=MHyNu8/dUjdlsSbLQyVytxyATyDpgtB1PohvzzxFxytG0RrqJFedXSsqtbk9g4SEbp
         mESWBMxwAwTTzRl1EE4ZPXhBpIhNcrbjqGuk+6lM1zX05yASXbH80+QfPUh07ht/xKIX
         KnFwx7tResR1yNUx+OY+YoLLEZ69L9ODjur08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783521429; x=1784126229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H42/ewa0yCkL7raZbY8PdhJtxQmgR/d59AQpI6D55Cc=;
        b=GxXDQMMkrE0WfHgZMdQQdVnkpWg63OxfrbXRs9p4klzJRpoIdzPk4P/VKWCtdwDnds
         v101ib1KY/y2qMsh69k8tteSocvwPrx9ZO23xtAF/v0omf5gDwST/NSpjOGCxyNU1+dm
         ziMAw93G4rt0o4jQ2HNVXPsx3HuYTvP0gt/2qBMTUKpAfqjLmdgk3w1XiqcWUYux/zeY
         tyuCcPQ+idqNvIymSX3tBcHYI7m5BL84HjklRgZha27TXmlZP0xRpgJY1zYMnMjvgKrg
         UJH5NJ2jv1C2oacxvQGggTRxNnRNKFq01zd1SZ0CpO8MhcJmM/PTObXE9gUh91OqcQ6M
         5BLQ==
X-Gm-Message-State: AOJu0Yy4GFT9HqmiGxsQ41HhRuiROeWdyyQ4vScAQp0FZp0uAclmoNDr
	51U8S6ojUarMPc5bTZcZk1votxXRdtsNbO7CCZG2Ie+C6hjd6AOaUUVwU3GbVxn7x870lyDRNsk
	NY0N4
X-Gm-Gg: AfdE7cltEhEEAfRxmSPJuGerlJFj+VJwYCn4BKbk71N8BbKHn+DRrXR0jOL1OrUfMnj
	6Jp0z0hVprenJOjPzWfpdAhzgPDu7WH7zDdNdnvJjsOVH3H0dX2vdTxguOZWetPZNWfyW07Xhvb
	jkipMR2DC9P24pR92vDLO7gyihX5sJWwP0vHRR8e23tmtUIdqf+HqfGQUkU++jUYtHYxpATP2SH
	lzDY/vdIMU73OtpMK0aOfru8f3hMNeA0dauLweF/oQh/EWCEYMpx67bCgznhZyQ48i3SJRfawFu
	9fVJJYoDtVnLMN8v49NoIVCcxEilL+rpm83NSsToHSZC/zgezYAOvzmGEqMef236buKEgmW2CI6
	T4kijiyw+6KUdMU+UiklqylwZTJ8ksyyi7HKBwWR+un8cBzviPGSB9pwb8MLGNtSNWxxPgpqqdj
	rcvFX4RDgEGxFBiOjmWhSQQJK8ZQNYXWlLjEOOAmZ1hvyvgTqQh6hGzIooexg9V0glFQ3GknOyD
	dqB/Q/r3wrk2/O2XdM9FGI2LmH5wjRpzloWiihynA==
X-Received: by 2002:a05:600c:3acb:b0:493:b91c:6bf with SMTP id 5b1f17b1804b1-493e68c6d73mr27550455e9.18.1783521429423;
        Wed, 08 Jul 2026 07:37:09 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ad21sm42328520f8f.20.2026.07.08.07.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:37:08 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [[PATCHv3] meta: Add pam to the defaults if using systemd
Date: Wed,  8 Jul 2026 17:37:04 +0300
Message-ID: <20260708143704.2643050-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 14:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240487

Add pam to DISTRO_FEATURES_DEFAULTS in init-manager-systemd.inc.
This way pam will available if variable VIRTUAL-RUNTIME_init_manager
has been set to systemd. Otherwise having systemd in conjunction
with wayland but without pam leads to a conflict with the
REQUIRED_DISTRO_FEATURES for weston related recipes.

This adjustment is required following these recent changes that
switched VIRTUAL-RUNTIME_init_manager to systemd by default and added
wayland to DISTRO_FEATURES_DEFAULTS which affect "nodistro":

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
through DISTRO_FEATURES_DEFAULTS in init-manager-systemd.inc.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta/conf/distro/include/init-manager-systemd.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/init-manager-systemd.inc b/meta/conf/distro/include/init-manager-systemd.inc
index 63fd225ca5..9460be51af 100644
--- a/meta/conf/distro/include/init-manager-systemd.inc
+++ b/meta/conf/distro/include/init-manager-systemd.inc
@@ -1,5 +1,6 @@
 # Use systemd for system initialization
 DISTRO_FEATURES:append = " systemd usrmerge"
+DISTRO_FEATURES_DEFAULTS:append = " pam"
 VIRTUAL-RUNTIME_init_manager ??= "systemd"
 VIRTUAL-RUNTIME_initscripts ??= ""
 VIRTUAL-RUNTIME_login_manager ??= "shadow-base"
-- 
2.47.3


