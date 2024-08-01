Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5452C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 15:08:47 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.70678.1722524926330768228
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 08:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UrwhDO20;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7a1d3e93cceso211880885a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 08:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722524925; x=1723129725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5lX3C4SgHRUvBxvsleKe12O1RCjIdJWjv9gt8RfLreE=;
        b=UrwhDO20531gnJ9hzDyX9w8gUFHBOF++Qo1tgfMqRYSJ6UIHioF+YNaMtG8xstgARq
         b52bqQoe62sE6T00kgWYKIDbmcZmxk9pRkdgaH5mmnh0JYAhQNtKAkBYdiWMhUK7d1Us
         8+1Ey5wCX4tfyi93lZiTo24k0LnUB5IMHXMFPfrgX+c9+5cChjC/JxS+Ap/zPF1l2CaQ
         Hcn2iOewMz1s+bDmMRQNZdoGtHNSbqAd+144VuEhF65gk4T5iuj5arZanpMnw9+/tzYN
         9xPJpXlM+Yf5XJlgSJjmaxAX1Oj8O8o3m+TOVl3rfO7CXO4OZ56q+/kuM8TL4kbm052w
         n/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722524925; x=1723129725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lX3C4SgHRUvBxvsleKe12O1RCjIdJWjv9gt8RfLreE=;
        b=uTmHjVKWf5QwkldkoiO7zQT30Jm1Ugseqy3SlAyQEkxdLpjKALKWUC5BfVvx9seFip
         KN3QCIP+0umvGd2n/1jsvO6ShaIzf+dDbx7X4u5V3DJ9QI5MBVPEM5JWW3NyHppolT6F
         VF0840bczQPihdoLGAH71OMGqBSiCYPdQ62bY1EU5xOVmCQQx1IBRh8enC2WdrDwZk7t
         0FzRk0mTmBtD3qZ27gQyanjNiXjNISQX3+YMVBj4piNxjyXo+a8BssEL6SV6O9b8aaqj
         8zzpUQmhoWtZtFgmG9lJ0i9nlnjw3Pv5XPqW93tkYZE5PyY/IYF151bkIrBTinYPGMgA
         G6Jg==
X-Gm-Message-State: AOJu0YxcC6yOv3bPXWmmw1FzlBGpvjLi0Dk/VchcnOLWjOYRBC4HiVXV
	lSCss/nK2XYe3SPWqw4A5eWIjRXZmurMM0xX9si0xAaMnE+mcmSE
X-Google-Smtp-Source: AGHT+IF9EzeCz8MbI3OW9QAMSn3Iw0SOqCHYUbsqxOHFDZRpa5Rtl46cjNnQgqDowKNPgr1XxItLMg==
X-Received: by 2002:a05:620a:2a0c:b0:79e:f745:5445 with SMTP id af79cd13be357-7a34f00070fmr39311985a.31.1722524924862;
        Thu, 01 Aug 2024 08:08:44 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1d73b5003sm859343985a.43.2024.08.01.08.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 08:08:44 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/10] kernel-yocto: consolidated pull request
Date: Thu,  1 Aug 2024 11:08:32 -0400
Message-Id: <cover.1722524523.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 15:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202740

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

Here's the next batch of kernel updates. Obviously the -stable
updates to 6.1 are routine, but the larger changes are the
introduction of the 6.10 kernel as a new / validated reference
version.

Some notes:

  - I've included the poky/poky-tiny preferred version bumps
    in this pull request for simplicity. Yes, I know they go
    to meta-yocto, but it is easier to make this available for
    AB testing when they are all together.

  - I'm watching the status of 6.10, if for some reason it
    EOLs before we release, we'll jump to 6.11, which I have
    under test and will push as linux-yocto-dev shortly.

  - There's one known build issue with 6.10, it is zfs in
    meta-oe. The upstream hasn't updated to support 6.10 yet,
    so I'm watching and waiting on that .. but there's no
    reason to hold this request for more testing on that.

  - I've tested 6.10 for all architectures on core-image-minimal,
    core-image-sato and core-image-kernel-dev. I've also
    tested against musl and poky-altconfig (6.1 with the
    6.10 headers)

There will surely be AB issues with this, but it is now
to the point where I need additional coverage and eyes
on the changes.

Bruce

The following changes since commit fd8dc3a2f320f5b8335202ba9f366ed93bf53dd5:

  gpgme: move gpgme-tool to own sub-package (2024-07-30 12:46:22 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (10):
  linux-yocto/6.6: update to v6.6.36
  linux-yocto/6.6: update to v6.6.38
  linux-yocto/6.6: update to v6.6.40
  linux-yocto/6.6: update to v6.6.43
  linux-yocto: introduce 6.10 reference kernel
  linux-libc-headers: update to v6.10
  kernel-devsrc: remove 64 bit vdso cmd files
  linux-yocto/6.10: update to v6.10
  linux-yocto/6.10: update to v6.10.2
  poky/poky-tiny: bump preferred version to 6.10

 meta-poky/conf/distro/poky-tiny.conf          |    2 +-
 meta-poky/conf/distro/poky.conf               |    4 +-
 meta/conf/distro/include/tcmode-default.inc   |    2 +-
 ...ders_6.9.bb => linux-libc-headers_6.10.bb} |    2 +-
 .../linux/cve-exclusion_6.10.inc              | 6660 +++++++++++++++++
 meta/recipes-kernel/linux/kernel-devsrc.bb    |    1 +
 .../linux/linux-yocto-rt_6.10.bb              |   48 +
 .../linux/linux-yocto-rt_6.6.bb               |    6 +-
 .../linux/linux-yocto-tiny_6.10.bb            |   33 +
 .../linux/linux-yocto-tiny_6.6.bb             |    6 +-
 meta/recipes-kernel/linux/linux-yocto_6.10.bb |   76 +
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |   28 +-
 12 files changed, 6843 insertions(+), 25 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.9.bb => linux-libc-headers_6.10.bb} (80%)
 create mode 100644 meta/recipes-kernel/linux/cve-exclusion_6.10.inc
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_6.10.bb

-- 
2.39.2


