Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B56C35FF6
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 10:24:48 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.7149.1742034282068874350
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 03:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MoNgRsEI;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso4879245e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 03:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742034280; x=1742639080; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lU9IsEi9NcpmtKKs1MDs2ZSkXpIkcrTjeMUWHbtNCBQ=;
        b=MoNgRsEIsLOrnG58m25rP2VVc48rT/wVvM0Wr9cF9kOZa3F6efVpV/uiPfkQS1xJIq
         7yXB+HRQIF5WSuUFSKcu3CtOyW4RP02f57ZW7d1cTqmBIjQohOU81Hjt3L/MJDUHpPPG
         Mc6uO/0z/nY76dUXsi8CC6RY1JPb8mLP2SInhmv44q0OPBuEgr2QeiC92Q2fwhTxuF4t
         iqxkX4zC2OtFP2nLL1f4og+2ZWm5uNa7GpKmP8Ywr+S0BIIBSA7yRyFynE1tdoTItoIK
         inBOnwEgRVx9ZQV3fmb4977PHi8+JldcX/g2nj/DHJgWCm2itu/CLL+6K0kBcs/VuDcC
         JUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742034280; x=1742639080;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lU9IsEi9NcpmtKKs1MDs2ZSkXpIkcrTjeMUWHbtNCBQ=;
        b=Z3ND5Hew7yEdV1zUMU703guDpcdwnwcfe8E7VmTvE8HfLLBk1nqwDDhIhdTLLOfRex
         88PuejjEAxotgNeesDktLHgzNe0ItTXolE3Xl8Y0O118j9B/EKG4Wuj7qsRjrFcRg2cZ
         XV+j1aW1j/4nv1YpZc2kxORaeijQr74N7KB7DVhxVe31aPjL1kMFIVXriXd5O24+PDZ1
         nb/bRUNKOojF6K5R5SGPkPQVC15Rc3jgdkxrN+QZoRmWIKyzQQekCdeHBQARejbHytQk
         Lv4Ulf6PkIMawDNEzAom9wOS4dBvfV1k9UDZBF6Xsb2BfHNL+Pmh4wrvV4T2RxTDypgf
         1xnQ==
X-Gm-Message-State: AOJu0Yx5N1gz6kzU6DYgdEzwgVVzAuI/JnHdD3rHdHsAGAg7EaeyimMg
	SKpTrviejYXGjZZp3+LvHjJaSq47OQJWxjizrSH92hIx2SOuvnCL
X-Gm-Gg: ASbGncvrNGB3f/XWKAsVRLiQjeqHy0SMRfMlF0iWdPrAyneuG70MvEDqHmEWKIjYNEY
	rRkRbA6a7IqEp5/mc3JbBeSyQ1nUYRNirG9t0kgYR8I3dwUSBy+8JoxHIY4iD7KnS3gRP0cUWY/
	VCv2HbqRjzg93c0YaVgpQqxLYdKHRXmHegUrfnk9Pbl8KZkvr+rmDkFoVijaI20fE9vTa84T/Gg
	03gIn8ZeuuvEe1Eo9J9UKRJnjoi6h6k8qmlFPWENu3nSjw134/Zb/R9m6pDNhHc/5LVFzAM7e2E
	FN3ynWXXOYMAvjxGZfs3ZPdTDQitdUw6QkP49z5Gu7zNuHrr77kwvAEE5EDwrbAfMmmA1p/iM9b
	vNfI7UTShdCTSjxKA5ZeEQg==
X-Google-Smtp-Source: AGHT+IEMW9gts4K2zfE3ufyfKIo0isEpaOEEG5rLhu8Ocnb+0urnmbnvimASe4YzzHDibmTq+rS3iA==
X-Received: by 2002:a05:6000:702:b0:385:d7f9:f157 with SMTP id ffacd0b85a97d-3972029e4c4mr6823966f8f.36.1742034279953;
        Sat, 15 Mar 2025 03:24:39 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe05e8dsm45186145e9.9.2025.03.15.03.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 03:24:39 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH OE-Core v4 0/5] Upgrade kmod 33 -> 34.1
Date: Sat, 15 Mar 2025 10:24:37 +0000
Message-Id: <20250315-kmod-v4-0-946682cc4090@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGVV1WcC/1WMwQ6CMBAFf4X0bE3pUkRO/ofxsLYFNgolrTYaw
 r9b4KAe5+XNTCxYTzawOpuYt5ECuSFBscuY7nBoLSeTmEkhlYAc+K13hqMGaAw2ZaEkS9fR24Z
 ea+Z8SdxReDj/XqtRLus38Bxbj8ZuoSi54DIXoPGIskRzanuk+167ni2hCP/yJkGSsLoqcwBdA
 apfaZ7nDxMm9GzVAAAA
X-Change-ID: 20250313-kmod-ac33fdaf6452
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 10:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212869

Bring scdoc in from meta-wayland to support generation of the manpages. Convert
to meson from autotools. Clean up usage of kmod in eudev.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
Changes in v4:
- Update gdbserver selftest to accomodate change in output
- Link to v3: https://lore.kernel.org/r/20250313-kmod-v3-0-a8b5d73c83a5@gmail.com

Changes in v3:
- Fix maintainer for scdoc
- Stop using autotools in scdoc (it just has a Makefile)
- Set upstream commit correctly for scdoc 1.11.3
- Fix scdcoc metadata
- Link to v2: https://lore.kernel.org/r/20250313-upgrade-kmod-v2-0-2103ca9a26ad@gmail.com

Changes in v2:
- Set installation directories to base_bindir/base_sbindir
- Link to v1: https://lore.kernel.org/r/20250312-upgrade-kmod-v1-0-4de94f131b64@gmail.com

---
Alex Kiernan (5):
      scdoc: Import from meta-wayland
      scdoc: Upgrade 1.11.2 -> 1.11.3
      selftest: gdbserver: Adjust regex for change to output
      kmod: Upgrade 33 -> 34.1
      eudev: Drop --output=... from kmod call in init script

 meta/conf/distro/include/maintainers.inc           |  1 +
 meta/lib/oeqa/selftest/cases/gdbserver.py          |  2 +-
 meta/recipes-core/udev/eudev/init                  |  3 +-
 .../scdoc/scdoc/0001-Makefile-drop-static.patch    | 23 +++++++++
 meta/recipes-extended/scdoc/scdoc_1.11.3.bb        | 22 ++++++++
 .../kmod/kmod/avoid_parallel_tests.patch           | 30 -----------
 meta/recipes-kernel/kmod/kmod/gtkdocdir.patch      | 30 -----------
 meta/recipes-kernel/kmod/kmod/run-ptest            |  5 --
 .../kmod/{kmod_33.bb => kmod_34.1.bb}              | 58 +++++++++-------------
 9 files changed, 71 insertions(+), 103 deletions(-)
---
base-commit: cb9bff9eac3670253076d5d09c6893e372be40a8
change-id: 20250313-kmod-ac33fdaf6452

Best regards,
-- 
Alex Kiernan <alex.kiernan@gmail.com>


