Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A450FCAC5A5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 19:11:53 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.169.1758654705380181122
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 12:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ROj6KBWl;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-7ea50f94045so1945636d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 12:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758654704; x=1759259504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x92E9WyatCdfvftiJk0IFYNSse9YAnHzrHlM0yBDb/I=;
        b=ROj6KBWljkKabFiIFcqr6o9o6uYbJcH5F/7zvUciY9re1/Ik0QLWQp9H3vsPMvAWSg
         8uIDOtLNIAhGLjVdSgOqoOLWK838ZEcW6J/HnCecuBDQPMG15kdvBKsnbz0VSmiHOjip
         K4RoyqNddO3bqV3xiwu0Is5w4quEMYZZUo0xIr5HbDOGD/bjQvFZwRwCAyvvfq78YPJH
         PROPxH4ouOPqcEidpOwzttBknCMb0PIZbGGGUwXcnklMDNLGQbNRX4q6m/VAgrh36q9B
         zuYr86Y8OAVo4RwxErGsmj8g8mKdHx8qUNIxleGuB1zbxWWJ573WKUWgsg/XH0MjIdWU
         s+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758654704; x=1759259504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x92E9WyatCdfvftiJk0IFYNSse9YAnHzrHlM0yBDb/I=;
        b=OvvnErgHWp9Rt2wCYLD8/yvFtcWaV32b7JNcuLr0rZdOAqb83zToRPoRv3rein+LfS
         5aA8nnn2wPCBrQUPmfcU4U+kymKO5Y989Zsyd9BrTe+wXrIL9Ske21NkuoqYXKLlZSWB
         4UVOi+X2AcTPVpV0bHNfI8+5jTkxqV6RrdLZu9O9jRue2wx70mxrHkiZQCVbI5tlUaYg
         OMk4McQeHeZDOw14INJVVTbYWci4Y3Vh8o/yuk2KcI+i/0y2K4u3ZGm2dlLHfi+xxl+n
         V8H7ZIODZheODOLJHu+CXDwoYIV2LQ8vVAl2rQs7RFHoQeJVXJj/fhlFx5D4xe9VzQzU
         PwBA==
X-Gm-Message-State: AOJu0YyDvoz2WLKGlVtCQSz7p26YwM1G/rsCONj7okIFPuO4nxhCUqmk
	jTXdDV7XX1k75N+lCgksTRHnnOG1g8N6Z0VHC3AlQCgLgK0N54H9Shae9Fhk3+FKxyE=
X-Gm-Gg: ASbGncug1Mr/fkNlwLS+YJ+sxfOGYdg0ozzlFyZnMP5G5xJZ1yYLl/KkbYbOzMJQMch
	H+qfLxTYuOpTRzzRGayjaiYPh9nII3bbqYh8LSpRPp0RCuytBYYrq7uQxNW3XHlwcw35ZnG645H
	cYeNr2MCqZPbipZzmI5/FoH07ulkruKKk0cbNYnWQOwk8MRQHnaB5lJqPp+UFvVYYChmAAlym/+
	IQd1WAjkqF+arKWOwmqTEgTB54kXZc4yQZgGws9uXYa66EaTAzJCAGVZ1ZDZAqn3m+i0cBWyPRb
	2pO/ONsdbEfGIC4LnUPBZklWjzXD/ZSt/0b0mCT0H28XHpXDOw+kCjqAeOgS595GioCVNkGEQhE
	eYPMjE2PNKW1pHo+Z3CQ4LBU97OzbTn2898J0I4US0UKUV0slXfIGCcrAv30SM6p3/Qq/BPCvsR
	RKK25H+KPCZhthfVmeoRtiMdiAZ4DFDG02LhWUbpZFoZAq+IJihdCvjOi31rGUuFmmJw==
X-Google-Smtp-Source: AGHT+IE7T3CuRmhQQjs7xqF/GwtNPnR7FilRKGlOnv+XEi2+Zur0uYT0+5eUfMj/RaDNrsZbDhiokg==
X-Received: by 2002:a05:6214:2486:b0:79b:2d66:6888 with SMTP id 6a1803df08f44-7e7b7bc0f7amr39485766d6.29.1758654704068;
        Tue, 23 Sep 2025 12:11:44 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793443cf48asm94109866d6.15.2025.09.23.12.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 12:11:43 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5 v2] kernel-yocto: -stable and genericarm64 configuration updates
Date: Tue, 23 Sep 2025 15:11:37 -0400
Message-Id: <cover.1758654576.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 19:11:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223920

From: Bruce Ashfield <bruce.ashfield@gmail.com>

v2: removed debug output from the script that generates the commit summaries, no
    other changes.

original text follows:

Richard,

Here's the latest -stable bumps for our active kernels, and a nice
extension / cleanup series from Mikko for genericarm64.

Everything has passed my build and boot testing. I did see a OOM with
genericarm64 and systemd (using runqemu), but that seems unrelated to
the configuration changes.

For anyone reading the -dev kernel has also gone to 6.17-rc7.

Cheers,

Bruce


The following changes since commit e90bc48bdaa2234cad52bbb2800f5246c277ffbd:

  bitbake: tests/fetch: Update tests after bitbake tag removal (2025-09-23 09:37:35 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  linux-yocto/6.12: update to v6.12.48
  linux-yocto/6.12: update CVE exclusions (6.12.48)
  linux-yocto/6.16: update to v6.16.8
  linux-yocto/6.16: update CVE exclusions (6.16.8)
  linux-yocto/6.16: genericarm64 refactoring, extension and clean-up

 .../linux/cve-exclusion_6.12.inc              | 1464 ++++++++++++++---
 .../linux/cve-exclusion_6.16.inc              | 1462 +++++++++++++---
 .../linux/linux-yocto-rt_6.12.bb              |    6 +-
 .../linux/linux-yocto-rt_6.16.bb              |    6 +-
 .../linux/linux-yocto-tiny_6.12.bb            |    6 +-
 .../linux/linux-yocto-tiny_6.16.bb            |    6 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb |   28 +-
 meta/recipes-kernel/linux/linux-yocto_6.16.bb |   28 +-
 8 files changed, 2585 insertions(+), 421 deletions(-)

-- 
2.39.2


