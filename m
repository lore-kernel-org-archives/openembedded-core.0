Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CAE4107BCEA
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 23:22:33 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.393.1773444146701005198
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 16:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LRqM14J0;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so2849030f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 16:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773444145; x=1774048945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hqf1ro8Y5elFC++jXqcz3Q1zrOSOAgVObf995pprZec=;
        b=LRqM14J0VIPBNLTTj+aylMgRTtIw5AKvS/7luLVTcEIENPDnwi7higd5Le3CGJXwu7
         fWEGjePqlMRTjKJ2VmevLffyzRrz6FZpKKSJh4CkMMQv04iSZgqpaYLB6NJd69gdcWD4
         R0+mTOyyMylHSjoYgpZamA3vArH0nNkSUxacI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773444145; x=1774048945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hqf1ro8Y5elFC++jXqcz3Q1zrOSOAgVObf995pprZec=;
        b=BD0/C0OHhx/kc0tdhE3epRrlLAzV4Ac25yP8sjWS+v2guAxqBjhd9VVXAnyTsHS2Ci
         mqMQhF+iADpHVqQEqMnzENYTcYxdyunR8ZJAyJhCH10wphy4Sv8r1dRvkKmm5AtAvjO4
         hOXdVPAmkYa1gePcDaDQqJsNhs6CbBJ0SNmj8koM/9yhDn8MfWQPAJaY/+Jk/bHXriJF
         vhf9YapXJ0H+dhH1eRU3Zv6oFHGGEE/hPb+vcFVSjTFbQ4f/6Q78mtBvpzYS1yZpcLq/
         U9Ce8Oxv9abXBxYU1E0+Vr7q7ah1BS6FHjG+wLVZ3MZLv5ma22dDehdq2a0tjWA0ys+o
         YWsw==
X-Gm-Message-State: AOJu0Yw/nLGGVGfZG57MTwcMjSg7uRA9DxWcY/5vOjlN+Fbs7iDreOaa
	PiCIKvY9lc5QM0FyoKxtp81eRqC7mVtbQWmYQcmV+HzJdCur/YiaSpTSl1LEiOnrCpA9x7MrRff
	kaSZe
X-Gm-Gg: ATEYQzwfQJ8te8739SkNFyzSnh4dLHKh0Y/0F+E97lqpstXBKK6ikSDcparFqS+2lZe
	bhXB+lkYruMfCz0ECaiANB0q1/4BdORqryH+7Yy51gGZMXX+r7HSptjhq1+kuHuAoetVU7/w/DP
	1SQn+DvW7c8eMV5It4XvtRNj1y/HZPmKnj++f98y0hHaXrevJVzwBsMR4bsZfccNKy5T2Guud+I
	XH5BhxaRDBi4vkLTA3D3S4xT/j/0cG0gjJCOVRrAIkCB559iPbQhRB6BbplRpxO28v1Lt7mqNSV
	38UHHoKlrpUt7TAAvO3dSOlswvJh0sjYE09ZzRZ5DyTrQ4fG96tXOTJZZZJkUf+XxuOhb9uF79a
	K4OuJziGC9ICVkmurEX8ebq6n+GMahPWP1WFxEylgRErFPlGLUvPc8gQ3MDvN4SKdknVCrQ5wpT
	BkjWBTQIlzfZP7JfX3T/6EBP591mC0+w2GT8oIJpQjQkMj91/Q12STQrImxhGKqsOmKCom7N1xb
	jo7zoywWFOsDhPNmQVcQ9mOrxE=
X-Received: by 2002:a5d:5f56:0:b0:439:ccd7:cdcd with SMTP id ffacd0b85a97d-43a04d790bemr9644686f8f.7.1773444144695;
        Fri, 13 Mar 2026 16:22:24 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe226473sm20687292f8f.32.2026.03.13.16.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 16:22:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][whinlatter 0/7] Pull request (cover letter only)
Date: Sat, 14 Mar 2026 00:22:03 +0100
Message-ID: <cover.1773443879.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 23:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233070

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1773257124.git.yoann.congal@smile.fr/
extended with "[whinlatter][PATCH] scripts/install-buildtools: Update to 5.3.2"
https://lore.kernel.org/openembedded-core/20260312231730.751467-1-yoann.congal@smile.fr/T/#u

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3400

The following changes since commit 96d653f64e6eaa919dd1f62193a5a96f43430dc4:

  build-appliance-image: Update to whinlatter head revisions (2026-03-10 11:53:11 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/whinlatter-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/whinlatter-next

for you to fetch changes up to 59bf0f60bf2fd424509fb077e187fce64d1c4695:

  scripts/install-buildtools: Update to 5.3.2 (2026-03-13 00:17:05 +0100)

----------------------------------------------------------------

Livin Sunny (1):
  busybox: Fixes CVE-2025-60876

Martin Jansa (1):
  lsb.py: strip ' from os-release file

Peter Marko (3):
  inetutils: patch CVE-2026-28372
  libpam: set status for CVE-2024-10041
  go: upgrade 1.25.7 -> 1.25.8

Vijay Anusuri (1):
  freetype: Fix CVE-2026-23865

Yoann Congal (1):
  scripts/install-buildtools: Update to 5.3.2

 meta/lib/oe/lsb.py                            |  2 +-
 .../inetutils/inetutils/CVE-2026-28372.patch  | 86 +++++++++++++++++++
 .../inetutils/inetutils_2.6.bb                |  1 +
 .../busybox/busybox/CVE-2025-60876.patch      | 42 +++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |  1 +
 .../go/{go-1.25.7.inc => go-1.25.8.inc}       |  2 +-
 ...e_1.25.7.bb => go-binary-native_1.25.8.bb} |  6 +-
 ..._1.25.7.bb => go-cross-canadian_1.25.8.bb} |  0
 ...{go-cross_1.25.7.bb => go-cross_1.25.8.bb} |  0
 ...osssdk_1.25.7.bb => go-crosssdk_1.25.8.bb} |  0
 ...runtime_1.25.7.bb => go-runtime_1.25.8.bb} |  0
 .../go/{go_1.25.7.bb => go_1.25.8.bb}         |  0
 meta/recipes-extended/pam/libpam_1.7.1.bb     |  2 +
 .../freetype/freetype/CVE-2026-23865.patch    | 54 ++++++++++++
 .../freetype/freetype_2.13.3.bb               |  4 +-
 scripts/install-buildtools                    |  4 +-
 16 files changed, 196 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-28372.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-60876.patch
 rename meta/recipes-devtools/go/{go-1.25.7.inc => go-1.25.8.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.7.bb => go-binary-native_1.25.8.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.25.7.bb => go-cross-canadian_1.25.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.25.7.bb => go-cross_1.25.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.25.7.bb => go-crosssdk_1.25.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.25.7.bb => go-runtime_1.25.8.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.25.7.bb => go_1.25.8.bb} (100%)
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2026-23865.patch


