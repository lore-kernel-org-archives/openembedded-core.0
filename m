Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440BAC2BA1B
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 08:58:49 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.10300.1741856324611480627
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 01:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S0+U6dEJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so5540045e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 01:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741856323; x=1742461123; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vfr+KjOCvFAUNfp9hKYJG3D3dmHniL5Wdjj9ZudNshM=;
        b=S0+U6dEJkG3B5KwQf8TPO4iF/CHoyOJgpfIvwC06I7WJVCbVx9MT2tptNU3SY7loIN
         6+o+HxdOUSfiZbis/qKO+tyQD1BXGSvFfSTp/pOoQfBg1/9ChBuraAnMp4blGB0qAqui
         85eNrDqfcAzo/6Q9aI/AL/BlBhrHMUb1rB0OzkLyo5RbCORLtT8nHg94aYWHUtrKLrhO
         LywgqhPM0lS2TBVhXSU47FkA7Romy/Cm4LU6d8AeJjxAKCwa/dM0X0Vd1tUKmsMy9vqD
         7V+5Ig85wzXUOnxj03cxiGvPHgtt0V9nz8DKK02pvAUfWSSpAu6/2qIsDifrHYBUONxu
         fbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741856323; x=1742461123;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfr+KjOCvFAUNfp9hKYJG3D3dmHniL5Wdjj9ZudNshM=;
        b=omJLT38YmO/5u2YPugcs9RxZ6/n4x4w1rj6w1k1ZPKiXdqBWDuTFC7pvXF3XJ6SbD/
         G2ByZ2qO8Ch9u8r54OZItABwunUZF9mjwfdnR+rg9ZVryzW4M7unH4xthzwAWnthYIzl
         BqEm2kOtIMgIXCRGsETvvyGIrLo4RCc947/n64zQ33odp7akCutGGkhFkZmz7WC9MBz7
         RPhfKlOTLvpGgbOX4gjf8YWz+8o3D6k1EjkX6YEG/0j1Uqh834DNbcC2SBKrnWHqO71D
         owmcB+SzxOOlyUnzisy8VNLwo4BRcPH55EKfeLn0rKR9D7Qz9L+jvJHZDdyPii1R6KT7
         G3lQ==
X-Gm-Message-State: AOJu0YzmrQWwula/TETfLW10WdUX2IwCUjIM76rHEof7jEOiFVOY8H2q
	4CmQIWDhgJERmomUE/UHzu9nK1LS8iQ8JsB+B2QBkYWdaP29vOkTPoJ/udM6
X-Gm-Gg: ASbGncv+oNomDGRL3MdREB/MenSLSRPEkaKdc/IArSAyrYTDL2lMXtkN+qyoRWE32AW
	HdFCoeVVMYMo6VYqPDI8ADNU9q1xsItzY25k3xofI7Ht9jNESfnbdp/VgSZqNj70lBEDNXANmuG
	gIJMFvmd/M0kbwkuTKV0LGpa0DAKW14Av/zYPs0DDiP0pPmQrtADuFExzhjuG2No9qsPBizZ3Vj
	1x9NNLfF2C6sgVbSG9xG/A8zHM/Mv0SJpcn+32dInetAxdXC9NprD2AO+Tktice1VdUhp4HC8UQ
	x9MptZm4eh9Pw9RXJgpxuSfIgifpxyAAZsx+YC7UR2pI0A+Z42T8E2hwHgnkc/PCeAAQoR/Z29b
	+PVR5yprOkbo=
X-Google-Smtp-Source: AGHT+IFjOe/IngyLyZz9+DfAZeuurzuE6DMlwAXPU6GZ+f/BWxzXgI+immP7H+TVF3JPahI1SZJ7xQ==
X-Received: by 2002:a05:600c:1c0d:b0:43c:ebc4:36a5 with SMTP id 5b1f17b1804b1-43cebc45152mr165953825e9.7.1741856322439;
        Thu, 13 Mar 2025 01:58:42 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d18a4c2dasm12978845e9.33.2025.03.13.01.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 01:58:41 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH OE-Core v2 0/4] Upgrade kmod 33 -> 34.1
Date: Thu, 13 Mar 2025 08:58:32 +0000
Message-Id: <20250313-upgrade-kmod-v2-0-2103ca9a26ad@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADie0mcC/3XMQQ6CMBCF4auQWVvTTosRV9zDsKh0gIlCSauNh
 vTuVvYu/5e8b4NIgSnCpdogUOLIfimBhwr6yS4jCXalASXWUisUr3UM1pG4z96JMzZoaym1tQj
 lsgYa+L1z1670xPHpw2fXk/qtf6CkhBTGUWMGpdXtZNpxtvw49n6GLuf8BTX/4E+oAAAA
X-Change-ID: 20250312-upgrade-kmod-8292a5003aa2
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 08:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212749

Bring scdoc in from meta-wayland to support generation of the manpages. Convert
to meson from autotools. Clean up usage of kmod in eudev.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
Changes in v2:
- Set installation directories to base_bindir/base_sbindir
- Link to v1: https://lore.kernel.org/r/20250312-upgrade-kmod-v1-0-4de94f131b64@gmail.com

---
Alex Kiernan (4):
      scdoc: Import from meta-wayland
      scdoc: Upgrade 1.11.2 -> 1.11.3
      kmod: Upgrade 33 -> 34.1
      eudev: Drop --output=... from kmod call in init script

 meta/conf/distro/include/maintainers.inc           |  1 +
 meta/recipes-core/udev/eudev/init                  |  3 +-
 meta/recipes-extended/scdoc/scdoc_1.11.3.bb        | 22 ++++++++
 .../kmod/kmod/avoid_parallel_tests.patch           | 30 -----------
 meta/recipes-kernel/kmod/kmod/gtkdocdir.patch      | 30 -----------
 meta/recipes-kernel/kmod/kmod/run-ptest            |  5 --
 .../kmod/{kmod_33.bb => kmod_34.1.bb}              | 58 +++++++++-------------
 7 files changed, 47 insertions(+), 102 deletions(-)
---
base-commit: 3c808ebd910ae68491109c73e644354f90eb5a13
change-id: 20250312-upgrade-kmod-8292a5003aa2

Best regards,
-- 
Alex Kiernan <alex.kiernan@gmail.com>


