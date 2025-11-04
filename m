Return-Path: <elmehdi.younes@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D1E7CCFA05
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 17:16:03 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1230.1762276554872409343
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 09:15:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iUm0tJTQ;
 spf=pass (domain: smile.fr, ip: 209.85.167.43, mailfrom: elmehdi.younes@smile.fr)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5943d1d6442so58207e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 09:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1762276553; x=1762881353; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuAqXRqCYBHqJPdeGnDOOWrIROsCqIquw2eQuAks/I8=;
        b=iUm0tJTQm7uvh/ER6VF7WC3bvInfg2uymkm9TE+f39rhTzIKhuN6Ukkt8ISUxrh3GA
         6bNnEjRd8QGiTdtIvJvK6p67UtpzfFtAUDle82pzfKYw4XjQBcm1F29IyvvptG/k2yFg
         mxa3d7u8s7FMSnkTMexr/jd/yHUGDKRhG7yEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762276553; x=1762881353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZuAqXRqCYBHqJPdeGnDOOWrIROsCqIquw2eQuAks/I8=;
        b=QvGm4jeZwa/41dQJzz8e++c2Sw+SsQefTMN0266ytO9EZnhA2DXQ9M6uh/JWX5hpQg
         TfGkl78BSYZQHkbz0ae2GWZKaax2C53zY9LWmpxGPi9j1vL3DC437qTyGowrd4ebGa+G
         Ov9oUDnVGCbv3HeMqHNpfHLFOopw2bUMKJyuL7rdXrQ8GlZ0Vcu9HD2/Z34qWlUxqfEq
         ktajDzu8ly+smVHRc1Qgk+/NqLiYlsfl09wbgC5PqXBuAHzTKfxyW5Jysjirt+p/G14S
         53oY34mSwRkEfx8gYVS1Qlms/ua7TYRIPYuKv1NbRe7cynbqBVj+F2Z0bmjVJrn02WXZ
         kQ0A==
X-Gm-Message-State: AOJu0YzNCpiZpMJVeWMZonp6lKESg7wp9P/T4KMDzrC0IBdUdZXwsMno
	/D126d1hmnBDRBDX0bl7qcNQtVSX34DugPVqkEU+WP7qdm/ZuhA6y2m48bEigr5cTBbdGgcd0Jl
	FpHQpuDU=
X-Gm-Gg: ASbGncvJ5xVdJPjxUESDYutWBU29VCiMK/wVZJIc/E1oZm8Vii1IpRUmJ68vsHJIfF9
	Npt9LfLszbEKo9bMVQ5W9N3C3RhRfMFRxdmNHW0KSlS9NhYJzvGwMfZ4+ywoeTplNYhXP1RbUk3
	Iby5n7TajJWNIhsWFD/zFfutA51yx2YKrishjSExoY/taTsQAv3uhY3lxr7nAHo04K7X93Y5fL9
	xsEgHFheAQMajR0A3EfgRZgEOxlL5CHPK2en9BaRTmeAfE/DnkK6WyNT2VlqbUyvXr+uPx13f6P
	i8KHM6u3MCCNyftSnDX9t7aR09O3Gn7RInmWCX7dvxtjoOfpRazthYmo1iAZYauVCG1pBSnXhts
	2D4M+40II/VKEgQGZ/aVvYXwTSlcKsqttPM8uMiYNpE4GktmKaQUzeGtP5ApgSIxHmEFL9J4nhT
	eW6x/Qz0iNyGlYmbD7+5JcTtCIcmKd/TaDX+R7Qroln9Eb2VS1YnoNDXwu0rWXAWWUNVmhwH/tI
	53WC3IV
X-Google-Smtp-Source: AGHT+IGWusbNVxcQXwsTwuJxJF8zH2nvhGYhQCgvm/W0NKm1/oMKW7mE3Q9zEqyLv7a3cfyX9MYjsg==
X-Received: by 2002:a05:6512:b17:b0:585:5cb5:590 with SMTP id 2adb3069b0e04-5941d511e78mr5438129e87.11.1762276552514;
        Tue, 04 Nov 2025 09:15:52 -0800 (PST)
Received: from FRSMI25-BOLET.. (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5943437efd1sm914407e87.4.2025.11.04.09.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 09:15:52 -0800 (PST)
From: El Mehdi YOUNES <elmehdi.younes@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	El Mehdi YOUNES <elmehdi.younes@smile.fr>
Subject: [RFC PATCH 0/4] Add rust-for-linux option for linux-yocto
Date: Tue,  4 Nov 2025 18:16:07 +0100
Message-ID: <20251104171611.2227798-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 17:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225736

Hi all,

This patch series introduces support for Rust for Linux in the 'linux-yocto'
kernel. The main approach is to make all changes conditional on a new
'DISTRO_FEATURE' flag: 'rust-kernel'.

When this feature is enabled, the patches will:

* Patch 1/4 (kernel-yocto.bbclass): Adds the core build logic,
    adding 'DEPENDS' and 'EXTRA_OEMAKE' to pass QA.

* Patch 2/4 (linux-yocto.inc): Conditionally adds the 'rust.scc'
    kernel feature to 'KERNEL_FEATURES'. It also adds a conditional
    'CCACHE_DISABLE' as a workaround for a build error found during
    testing. This needs further debugging to understand the root
    cause of the 'ccache' failure.

* Patch 3/4 : Conditionally installs the necessary Rust
    stdlib sources (the 'library/' dir) into the 'rust-native'
    toolchain.

* Patch 4/4 : Adds the actual 'rust.scc' and 'rust.cfg' files.
    These files ideally belong in the 'yocto-kernel-cache' repository.
    They are included here only to make this RFC series testable.
    If the approach is approved, this patch will be removed and submitted
    to 'yocto-kernel-cache' separately.

**Important Note on Testing :**

The 'rust-native' build context does not inherit
the target's 'DISTRO_FEATURES'. For the conditional logic in Patch 3/4
to work, testers MUST add the following to their
'local.conf':

DISTRO_FEATURES_FILTER_NATIVE:append = " rust-kernel"

This is a necessary step for this RFC. We should discuss if this approach
should be added to 'bitbake.conf' permanently.

I have been working on this for some time. Another series on this
topic was posted recently . https://lists.openembedded.org/g/openembedded-core/message/225236
We started this work before that was posted and believe our 'opt-in'
conditional approach is worth sharing with the community.
Our two series may be complementary.

Thank you for your feedback.

Best regards,
El Mehdi YOUNES

El Mehdi YOUNES (4):
  kernel-yocto.bbclass: Add integrated support for Rust-for-Linux
  linux-yocto.inc: Conditionally add rust.scc kernel feature
  rust-native: Conditionally install sources for kernel builds
  linux-yocto-dev: Add temporary Rust kernel feature

 meta/classes-recipe/kernel-yocto.bbclass     | 19 +++++++++++++++++++
 meta/recipes-devtools/rust/rust_1.90.0.bb    |  8 ++++++++
 meta/recipes-kernel/linux/files/rust.cfg     |  6 ++++++
 meta/recipes-kernel/linux/files/rust.scc     |  2 ++
 meta/recipes-kernel/linux/linux-yocto-dev.bb |  2 ++
 meta/recipes-kernel/linux/linux-yocto.inc    |  4 ++++
 6 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
 create mode 100644 meta/recipes-kernel/linux/files/rust.scc


