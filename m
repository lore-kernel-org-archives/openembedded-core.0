Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E00C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 09:02:58 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.169224.1783414974134486689
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 02:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Ultqnqv0;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso37436605e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 02:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783414972; x=1784019772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IS/ccOGF4lB6Sp4X03WFeO8d2NKtd7olPwViMB3brPA=;
        b=Ultqnqv0fRbkjtDbSNAu5UDdLVc+qAIiVw+mMyoioPGQTcqCeBpVwdjleIqa2+j7sM
         u3TDRP3YIJ7AKqxyHCBJKS7IhFTrvO1oRzkN8L/+3LTuJA5VccZRoI5v3K6JjjsujjEd
         aQmWY2+LDsCH4cQzisQ0no7dAuu7xlM9Wfeek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783414972; x=1784019772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IS/ccOGF4lB6Sp4X03WFeO8d2NKtd7olPwViMB3brPA=;
        b=cea4NoS6dz/E+HsvqnYh0OtPM3hug6PplLo7mixRKC9prlP0vsMlpuggFQio3oZ5G9
         KGUTBhbyJ3jQsgooxhuStP8ZbLeSnfpjAds4iR6OU4Xi8P1SKC0rtYhxVuQu1bwp8m3w
         P24h2Caezr5YgzZULRgaXC7Gms30V3uXsdvsTnz+lt6xNo94tqx9Ax37i1IOJJ6A9105
         d0Hih2bkcPvxUo6xrERALaGKW6iyAmFMZinns1R5YOvEIOJQrl6hlxebpOUnuvVcgMDd
         /e9To041WoGDR5VkhPHywrPxywn6lvthl3hHh0WCFqhvhczZOq1UGERX5dLUAUiex+6K
         fztQ==
X-Gm-Message-State: AOJu0YwbVMbH1fIvOgHeJFVT/Na8WinO6ZEQhbTnXYExHpNgrKMDD+eH
	pM+T4zc2C4fVUjziQC9hPGx4x1ZSd/izmYEr2djBSDOZ79aF1a/hhvk+6DiAnZN+JpbwmGwvyBq
	XxFnO
X-Gm-Gg: AfdE7ckqtPxniNFH0aX9QRa4qpTAPUSmrhWDwg6NO7ah6gtHXcj3GhEC76SYNF12Lcc
	5FMlFYCgwV0QhBAsvitybnRh7qlTV7oCjnHg0dX4/lKhaRG0+r8Nw1dXghRe0YcuChpFC1BoCKp
	J7bTVLi6l8Xhp3pxk4rTefXuBUF1R2Gbhc54y4kDT38BYaTQXpllKkKr3LhCyQqsyM2MsJRA1gV
	x4C1FLGtk60UTMFwHaqjvQgXmFd5kW3p3yB4s1xK8YoTekboMli+SBzrg6uz/Y1QUx5dh7wTAYF
	wsOsW5BeLsn0fKroMhWJI3iYBRfQrqEB7vWhyBNbbThuleX/C/WsiBlSNP8YWFtwHoWZuazsIFm
	Rs4ek6howkpu1xXtUTrQJi1W+CVPXssJE3krOZfmW6x4RtJ+/XZTsaKVrflJx5NKHA+U1ncQDk5
	w/pr8uNmDtGUZEU8WVNOcYJ36Uk7G0r8Sb2RH6oC+xJ1xmgBYx+y0S64yMkA==
X-Received: by 2002:a05:600c:19cb:b0:493:c3e0:c4 with SMTP id 5b1f17b1804b1-493df0a7516mr44568795e9.22.1783414972073;
        Tue, 07 Jul 2026 02:02:52 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fccf2dsm41387235e9.15.2026.07.07.02.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:02:51 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [[PATCHv2] meta: Add pam to DISTRO_FEATURES if using systemd
Date: Tue,  7 Jul 2026 12:02:48 +0300
Message-ID: <20260707090248.417251-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 09:02:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240374

Add pam to the list of DISTRO_FEATURES in init-manager-systemd.inc.
This way pam will available if variable VIRTUAL-RUNTIME_init_manager
has been set to systemd. Otherwise having systemd in conjunction
with wayland but without pam leads to a conflict with the
REQUIRED_DISTRO_FEATURES for weston related recipes.

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
through DISTRO_FEATURES in init-manager-systemd.inc.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta/conf/distro/include/init-manager-systemd.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/init-manager-systemd.inc b/meta/conf/distro/include/init-manager-systemd.inc
index 63fd225ca5..2e9eef24b5 100644
--- a/meta/conf/distro/include/init-manager-systemd.inc
+++ b/meta/conf/distro/include/init-manager-systemd.inc
@@ -1,5 +1,5 @@
 # Use systemd for system initialization
-DISTRO_FEATURES:append = " systemd usrmerge"
+DISTRO_FEATURES:append = " systemd usrmerge pam"
 VIRTUAL-RUNTIME_init_manager ??= "systemd"
 VIRTUAL-RUNTIME_initscripts ??= ""
 VIRTUAL-RUNTIME_login_manager ??= "shadow-base"
-- 
2.47.3


