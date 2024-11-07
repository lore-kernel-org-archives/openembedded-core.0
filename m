Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A44D5AE51
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 03:38:01 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.64433.1730950679376175261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 19:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WYelWJ+Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-720b2d8bcd3so340576b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 19:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730950678; x=1731555478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8qykBuKZIWt/qJZwM1tjaFX2DGVCEmqW0IayizHsOsQ=;
        b=WYelWJ+ZmtsInq4aJwdg7MBjrf46N0Ojz6rItQyS04A0d7MNJsrpNjAuwKfSK27Gyl
         GUVDyn9GjhqO/68rpVKgbp6sIzWtdR5C58yjDZ9mU6ij8yk8sTLkT1q/atyZ9YfKhvTf
         1ayrLN2dCCWhJ/ZQc4oUfgexqvTM3EK5nKPpNoX2dU7hQoMRKPDkeQ04ha1utPcX5y63
         3q+u3sDb+xuLne+cUyDRLhKedTlH4bhqPAFVk4RRz1Ft22LU3C3gFCxIUeq7FH9QMagD
         jNB9IsKndX67nC7HjKEj/472kqAEocDuX5zx2NJ6d024NJxM5BATFGpz7qxGeFyCD65r
         3U6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730950678; x=1731555478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8qykBuKZIWt/qJZwM1tjaFX2DGVCEmqW0IayizHsOsQ=;
        b=lyzM2Mk38aWX/Mft5bD5OV3aOM5+g9qLRlYc9jQNpssC+lnTTDyTiXxDYmpv/oLub4
         3KyV+MAbgw89UbEN1NONTXJGmGIQQ22FU/z1IOvK796+gPA76WeD7o/lfIPCt12Na1Kc
         l6RYWFG5ecezXUmC5giBQiGmLyAmq8VJ2OiVF4juJ27zHa4YV+e3LC8mLpT58ghocSOf
         +VTBNVa9q/zo19IM0+HC9schP0PK8kwCajF0AvNKl4e8466DsI+U5HMoshaDwazLgAjb
         pScRbIo0QS2NinyEhWGrDw022n96nLbeAoG0sX5PQfzh93cFqxkdtZGXg2D40gK5ZaxF
         6UBA==
X-Gm-Message-State: AOJu0YxGI1ovoqvV2twNoB38uRC9GjT2VmSSAr0DrsDJ+lcTpaalknvO
	HoA4RFLrmjGptk/ATz0EQ+WppclqUnOTUSb1viE7FzblnPYRGLYq4S+Q4x7HiPX9zd5JAenUFdM
	m
X-Google-Smtp-Source: AGHT+IGlJkRoPIWYuqhDm/FGuKPchiMfxBYr9aUo/72nACHgW3Hadm3CurCMfflXKZaKbC/XNLDFcw==
X-Received: by 2002:a05:6a00:23ca:b0:71e:6122:5919 with SMTP id d2e1a72fcca58-7206306ed56mr55303375b3a.20.1730950678200;
        Wed, 06 Nov 2024 19:37:58 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078cd2bcsm366803b3a.84.2024.11.06.19.37.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 19:37:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/10] Patch review
Date: Wed,  6 Nov 2024 19:37:40 -0800
Message-Id: <cover.1730950520.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 03:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206818

Please review this set of patches for scarthgap and have comments back by
end of day Friday, November 8

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/400

The following changes since commit bcd4e6d77dc7455a453e69b6d37769ec94cc02ad:

  lsb-release: fix Distro Codename shell escaping (2024-10-24 06:09:29 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Aditya Tayade (1):
  e2fsprogs: removed 'sed -u' option

Deepthi Hemraj (1):
  rust-llvm: Fix CVE-2024-0151

Hiago De Franco (1):
  weston: backport patch to allow neatvnc < v0.9.0

Martin Jansa (1):
  python3-lxml=v5.0.2

Peter Marko (3):
  cve-check: add support for cvss v4.0
  go: upgrade 1.22.6 -> 1.22.7
  go: upgrade 1.22.7 -> 1.22.8

Richard Purdie (1):
  cve_check: Use a local copy of the database during builds

Vijay Anusuri (1):
  xserver-xorg: upgrade 21.1.13 -> 21.1.14

Wang Mingyu (1):
  orc: upgrade 0.4.39 -> 0.4.40

 meta/classes/cve-check.bbclass                |   16 +-
 .../meta/cve-update-nvd2-native.bb            |   32 +-
 .../e2fsprogs/e2fsprogs/run-ptest             |    3 +-
 .../go/{go-1.22.6.inc => go-1.22.8.inc}       |    2 +-
 ...e_1.22.6.bb => go-binary-native_1.22.8.bb} |    6 +-
 ..._1.22.6.bb => go-cross-canadian_1.22.8.bb} |    0
 ...{go-cross_1.22.6.bb => go-cross_1.22.8.bb} |    0
 ...osssdk_1.22.6.bb => go-crosssdk_1.22.8.bb} |    0
 ...runtime_1.22.6.bb => go-runtime_1.22.8.bb} |    0
 .../go/{go_1.22.6.bb => go_1.22.8.bb}         |    0
 .../orc/{orc_0.4.39.bb => orc_0.4.40.bb}      |    2 +-
 ...n3-lxml_5.0.0.bb => python3-lxml_5.0.2.bb} |    3 +-
 .../0004-llvm-Fix-CVE-2024-0151.patch         | 1086 +++++++++++++++++
 .../recipes-devtools/rust/rust-llvm_1.75.0.bb |    3 +-
 ...1-vnc-Allow-neatvnc-in-version-0.8.0.patch |   27 +
 .../recipes-graphics/wayland/weston_13.0.1.bb |    1 +
 ...org_21.1.13.bb => xserver-xorg_21.1.14.bb} |    2 +-
 17 files changed, 1158 insertions(+), 25 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.6.inc => go-1.22.8.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.6.bb => go-binary-native_1.22.8.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.6.bb => go-cross-canadian_1.22.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.6.bb => go-cross_1.22.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.6.bb => go-crosssdk_1.22.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.6.bb => go-runtime_1.22.8.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.6.bb => go_1.22.8.bb} (100%)
 rename meta/recipes-devtools/orc/{orc_0.4.39.bb => orc_0.4.40.bb} (92%)
 rename meta/recipes-devtools/python/{python3-lxml_5.0.0.bb => python3-lxml_5.0.2.bb} (94%)
 create mode 100644 meta/recipes-devtools/rust/rust-llvm/0004-llvm-Fix-CVE-2024-0151.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.13.bb => xserver-xorg_21.1.14.bb} (92%)

-- 
2.34.1


