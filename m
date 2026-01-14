Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA92DD38FF6
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 17:24:16 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15734.1768411450056647453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 09:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OF4cH/iU;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8c15e8b2f1aso6387085a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 09:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768411449; x=1769016249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e9iAWt1/KViEK1RtscFp8nX0iWfuYBsLz688PCx2Y0A=;
        b=OF4cH/iUuU87Net87fq1UjdMwrJfx9/6qGjJdxw+LjgCP6Y/IvINxHUnbAvLE7voSN
         zxLD79HGaJHEv8oM6T4tXpZ4l1+QeVCEGpADAmI/2Tt9o8nXlxJT38OykOVB1doHyPxS
         5EGPfujdyIB6KgxDOfK8VIjP7Fs/m8IB/beEiP+HrwTWesqiTk4lxgEJrHt0kptfZUIp
         or/mHMSdJpvLPYfE5Tue1ud5avMNtZIXQfCB+6u95qvnRgVfGgGQM8dgjJJvN2Xkp+Up
         WCjcIbU5le7uYVSJ9ilC6GobMw3y/Jd3rgVyH1gwyO7NUOB7sIRNVtmZLkm2fakiSp0m
         lEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768411449; x=1769016249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9iAWt1/KViEK1RtscFp8nX0iWfuYBsLz688PCx2Y0A=;
        b=ktrLie8xOHBmxtIJAQo4sH6tKy1H+9DECKvAgSXAy1mgpyItw4FP3WN1RO/bF8q1Kh
         v9je9gFPD3t4pNdeKPP+Hae322l3nSR8Ovkk9T4ALrFxdbJtEqIc0W3D3xZcQk22isYm
         LT2YpDlN8xBZEtjYxMuNJJjpqwDdFLM3Lr3LdjdWIbUcY+pMCC8GfwNWi+zqtlvZOOqJ
         z/fBebUk4fEsrajqSTVLzv+xwWPXksQVQDZnCfsjd+BIVSLt8qzZptxlEZO/34skTaVG
         NqhT7QIrZ7gx3QXEJ/bccKF9UkJx/ECOg6tL6HSkFktIV1FShECQKHFRtm6VngxWrw3r
         qB5w==
X-Gm-Message-State: AOJu0Yx91/LYv0X8DcjctvpfVuD1PDovLJrUjdombNyp4lI8uUK6ybqG
	64gyx3084mTNJPOadPkMX8ffp7hrcivFg1+WNYvSy/vKJzSLcw8AqU28BfyfAHO9Lq8=
X-Gm-Gg: AY/fxX43PMi2CjNhXQONOPMNcYMuTBQ/ZrGapQhyfsGorEAUR2JosN8OI2EXuFyz7w7
	1JCuICwZMUFR5JTcjmwEfGbhNRuM4pNi6bqCa+xkpHzm1A/9jyV0jZomlqs3PJzmoWeCqGg3Xck
	Z0Sd/OtBx+au85nIpY2/4dKtoP4+4aihL2vnrbWBbOqaLZrZdWaeNIU1RDchgmSqiPBXkqjXByI
	OFonbB0+v/ASp5IctsPLz7HETiRZgIJaTy/RGIFuMLd9el6k0hf72zZsAUEH16EW/5IB6wL/nkQ
	Xu4ZW/nT5JR6Ee7DZsSy2w3nb2WtMC8q/kzLD7J571V22/ywA4OlavU6B3TvRjC/Xb4YGw+eoVY
	mdK06/phOh1QN+B4u4rrtg8+dEUjgkItzECfEwzCejmJC2y8glOuf2zJL7JdI9qFYhzPuXY7iUr
	S0D7ZJ/PCLOfSckJHp4PjFS8nUh62pMQ7nC4qOK6nFdk4numZUp3TJIZZ3YJXEOpJ6SjGy3I89j
	4gJdgCUbb3vEoE=
X-Received: by 2002:a05:620a:4612:b0:8b9:d2cc:cded with SMTP id af79cd13be357-8c5317f0a00mr353042285a.52.1768411448849;
        Wed, 14 Jan 2026 09:24:08 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530bc0d9fsm197711385a.45.2026.01.14.09.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:24:08 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] linux-yocto: consolidated pull request
Date: Wed, 14 Jan 2026 12:24:00 -0500
Message-ID: <20260114172406.2271015-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 17:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229356

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

I'm aware of the AB issues, so I'm not sending these for any sort
of quick merge. I'm just sending them so anyone wondering will
see that -stable merges are progressing.

What I'm not sending at all: 6.12 and 6.16 removal. I'm going to wait
until the AB and master have come through the current issues and then
will send those potentially destabilizing patches.

Bruce

OE-core (6):
  linux-yocto/6.18: update to v6.18.5
  linux-yocto/6.18: update CVE exclusions (6.18.5)
  linux-yocto/6.18: drm: xlnx: zynqmp_kms: set preferred_depth
  linux-yocto/6.12: update to v6.12.64
  linux-yocto/6.12: update CVE exclusions (6.12.64)
  linux-yocto/6.18: arm: fix defconfig configuration audit

OE-core:
  The following changes since commit 0c3c20b9f208daa5a90bdef0b30e9a627da664d2:
  
    Reapply "glibc: Enable NFS local file locking for glibc tests" (2026-01-13 23:35:27 +0000)
  
  are available in the Git repository at:
  
    ssh://git@push.openembedded.org/openembedded-core-contrib zedd/kernel
  
  for you to fetch changes up to 2e27c0d5841bdf5eae8e09371de97bf9907dd76d:
  
    linux-yocto/6.18: arm: fix defconfig configuration audit warning (2026-01-14 09:04:23 -0500)
  
  ----------------------------------------------------------------
  Bruce Ashfield (6):
        linux-yocto/6.18: update to v6.18.5
        linux-yocto/6.18: update CVE exclusions (6.18.5)
        linux-yocto/6.18: drm: xlnx: zynqmp_kms: set preferred_depth to 16 bpp
        linux-yocto/6.12: update to v6.12.64
        linux-yocto/6.12: update CVE exclusions (6.12.64)
        linux-yocto/6.18: arm: fix defconfig configuration audit warning

 OE-core:
 meta/recipes-kernel/linux/cve-exclusion_6.12.inc   | 1566 +++++++++++++++++---
 meta/recipes-kernel/linux/cve-exclusion_6.18.inc   |   10 +-
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   |    6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb |    6 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb      |   28 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb      |   24 +-
 8 files changed, 1392 insertions(+), 260 deletions(-)

-- 
2.43.0

