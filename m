Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B87C4451C
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 13:34:32 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13730.1784295271285854789
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 06:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DZFTeQlF;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: twoerner@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7383cdb7800so3098601137.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 06:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784295270; x=1784900070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+6sZMSxNLNmir8qdS1TsoZ8QYozbjo8rzIe934rAqPM=;
        b=DZFTeQlF3uKf5ecVTFt2scU+19q9pbBB+D2ekgIcKeWFulxrYBOATjyyTCx7AQBRQZ
         T8K+WyXouZR7Ro5JbikL2jdMjZG5K1NWxxSmdnt7dgTqif+ruc2uYgtLJXKZVqqgF2no
         0y3fNxGr+gfRt+Bx/dde06JKDmUJD9W+cIvGRSeMzUNQSv0efNBAgfK4ir3MetS0flXf
         rJg7RbjvcOgjdwBedWCV4iZZ2urLzOzuk9NPuZwQK7Hqr6H5pi/ukAIvRIMf0bupypM/
         1OzOenL+/5Tp6u3ohKpR5kfBOA3AiGLhqCFHivLdWd7b/gBtqt3T7zFoVS4jwfTfO8Qq
         0QSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784295270; x=1784900070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+6sZMSxNLNmir8qdS1TsoZ8QYozbjo8rzIe934rAqPM=;
        b=T63QReJyIbLG7kkFdKaa/qulRmJ4Y1wMc82O+OfsVL7G9Z8SrD2P8J6L8MaH0vmArL
         0fr0ttXUCA90ZvyKCrkOnUSgJgVm/AUWTDx0OXqKfK/KzAUu3amK9ZvVuXOJgSUHgwyF
         trYzqumT0MMKt6MrwB9KoVe6/ta6ee6n0aDH6LteiLARo4jzQxOjWNH1Lg6luxCPHcdJ
         OTn/vxizLvvjDUgStl7+U9XtimNf+PZGZbaH9n5TUpVGHtukOet+ZYqF8e5XuIoJ/Nxo
         Ic/BAmjb6wkHH7jSBnI49G/ikVt/jYDdZ3ZSQ40Dkn09IkmHBnizMrUPsuFf2+ddQSjy
         lQpA==
X-Gm-Message-State: AOJu0YwEiz+i6TNbUdrSoi4kaq7Z+I3zRUl04glvkzHWhem1lsRo8qBS
	INEXvuidv1qdfwwqOGgDKtbRtf5g/15TfKpVL+b8OocvXTS7XVLPRcVh7vW+sw==
X-Gm-Gg: AfdE7cnXQ5ciM/W+ffejU4G+1qRl4V8IOJzxH8ri0pcBlXRyvHN+GmnVrZwGevwf8p5
	WVEecxpuFsR54vzcPxDVK5YzDKQ6pizf9F9xa2e6dJ/L/ij0w1l/FpabQkgpQ0gAKwiPKb6UJCl
	N7CMeqlqp9Mnn7OxXpa5pk8Tc03rwwuWRs7DHeHnSXzQ58ABtgr8J8sbvndOnk3045zhqaNCnyy
	CvTm6iPwEju2Ka40WTb7I9pdYt7ylBPfE2+YKJncPl0FnyWnBh6grJY7GyWZfB/ToMk7jkuYv2P
	8y7z0duUH3keaoMOardP71cIfLdgDovaQmyVcdMNxPxeW7aPhMPjNpQQzYprEHeyqZbAvstBm6Z
	C7q6R+B2M7JWzTOZY5LascojVWJ30bvT/GCRXHmnX/3z9x3q68626irYll6bbLt5rQAVO1MNIGE
	snK3JH1ryT+iI4msZ0W9785ymGJa1A9TjWMjUgc5S9Jx5/
X-Received: by 2002:a05:6102:1612:b0:6e7:5c89:3fc0 with SMTP id ada2fe7eead31-7475374957emr683916137.25.1784295270098;
        Fri, 17 Jul 2026 06:34:30 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-976fc3688e1sm565059241.3.2026.07.17.06.34.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:34:28 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 0/6] wic: ship its tools, and add an SDK_FEATURES lever
Date: Fri, 17 Jul 2026 09:34:15 -0400
Message-ID: <20260717133421.3510970-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 13:34:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241182

wic shells out to a range of host-side tools but does not declare them,
so wherever it is installed as a package (rather than run from the
bitbake do_image_wic task, which has the wic-tools native sysroot on
PATH) it works only by chance depending on what the host has installed.

Patch 1 fixes that directly: wic gains RDEPENDS on the tools it runs, so
they are installed alongside it in every variant that packages it.

The rest of the series turns "what optional tools go into the SDK" into
an explicit, self-documenting choice. It introduces SDK_FEATURES, a list
in the same spirit as DISTRO_FEATURES / MACHINE_FEATURES / IMAGE_FEATURES:
a developer reads the setting and knows exactly what their SDK contains.

  - patch 2 adds SDK_FEATURES and gates wic on the "wic" feature (off by
    default);
  - patch 3 moves the existing (unconditional, arch-gated) qemu addition
    behind a "qemu" feature, on by default so nothing regresses;
  - patch 4 adds an opt-in "sbom" feature (SPDX + SBOM/CVE tooling);
  - patch 5 moves the cross-canadian gdb behind a "gdb" feature, on by
    default; binutils and gcc stay unconditional since a cross-compiler
    is intrinsic to an SDK;
  - patch 6 adds an opt-in "lldb" feature for developers who prefer it.

The default SDK_FEATURES is "gdb qemu", so an unmodified configuration
produces the same SDK as before. The intent is to present the full range
of knobs and let review settle which belong on by default; the split
across separate patches is deliberate so each can be debated on its own.
SDK_FEATURES is a plain list, so downstream layers can define their own
features (for example a cgdb feature in meta-openembedded) the same way.

changes in v3:
- replace the SDK_INCLUDE_WIC yes/no knob with the general SDK_FEATURES
  lever, and use it for qemu, sbom, gdb and lldb as well as wic
- the v2 "buildtools-extended-tarball: drop wic helper tools" patch was
  merged already and is dropped from the series

changes in v2:
- dropped the wic-tools.inc refactor; folded the tool list into the wic
  recipe
- reworked the buildtools-extended-tarball change into a plain removal
- gated wic in the SDK behind a knob instead of adding it unconditionally

Trevor Woerner (6):
  wic: add runtime dependencies on the tools it invokes
  nativesdk-packagegroup-sdk-host: add wic via a new SDK_FEATURES lever
  nativesdk-packagegroup-sdk-host: gate qemu behind SDK_FEATURES
  nativesdk-packagegroup-sdk-host: add an sbom SDK feature
  packagegroup-cross-canadian: gate gdb behind SDK_FEATURES
  nativesdk-packagegroup-sdk-host: add an lldb SDK feature

 meta/conf/bitbake.conf                        |  2 +-
 meta/conf/documentation.conf                  |  1 +
 .../nativesdk-packagegroup-sdk-host.bb        |  5 +++-
 .../packagegroup-cross-canadian.bb            |  2 +-
 meta/recipes-support/wic/wic_0.3.1.bb         | 23 +++++++++++++++++++
 5 files changed, 30 insertions(+), 3 deletions(-)

-- 
2.50.0.173.g8b6f19ccfc3a


