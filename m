Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D64CD11DB
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 23:01:38 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.30887.1710889295736297079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 16:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TvmElSIK;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-22195b3a8fbso4403231fac.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 16:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710889295; x=1711494095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PN7/yI3cplqLi0TYeFxUcXyPqMpr72FpXPqC7/xWtU0=;
        b=TvmElSIK5Z4j9fVblu+VRFPH9s6gXtttLTfLqBe7dwvkGnYWRK2FwWOTPXjox+J5Tl
         Rdz+bbBZiRXvSytx8KjGrmc7KYX5o8iSbaqRBElxuDNpkQDa/xZkg4MIpp9kLALSb1Yq
         613FCeXkuEg4jd5Z9jl212fTrUEwDBph8xGrn82utZMAfpK1VpV0FaFCQWepwHTaCaTz
         L5/ElZxG2j+BJMqLtzPtE3Ntyp7DGOCemj7X6ryqN1AA5tE9XGuWutxdgx5UdoWqx5i6
         OvmjVZWBRTTx8vsVkmheoYGJBBXQP50hXR8ANV78/8HMga3ZFbpR5Rp4SpWpPbUyOTd7
         zR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710889295; x=1711494095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PN7/yI3cplqLi0TYeFxUcXyPqMpr72FpXPqC7/xWtU0=;
        b=p67l8ywpTZhmYpyInUlr32SnQVjTG96R4lDUSztUTt0OQzVAlfatlMhVEmmKDlwGV/
         FFUZongvgBAynGgcIacIM2Jp/jf0Lzw+I2AOA1JpXSLVICC9GevMPSfaP1WxaEsk1eKL
         IsNmhTRhoeNlBLgMzQLxEuJfb20rHZ0eYEDl3c0n8l1gOx+4bq57fLF8dQnehaGfZXhv
         KUVQs26BhNvqW6gO8nheMBulERDUcPDv779jU6RZRcPyMAMLOX2H7UsYnY/ssvCxF99W
         lOUmwH6jpXks96j5rriYkv5V69NrZhbJXZj0bp605ebGNXQ082sIGf2TbF1AEuy6iEQZ
         KQIg==
X-Gm-Message-State: AOJu0YxfPLlBayc7fih9KELEy1bEqYse688tA0NPulEsZjj+U7ei5ExB
	p/QNtjWiJx5U8LJWHYixKFMQ5QJHijWkSQjr6HgHFR2lQdafRrcE
X-Google-Smtp-Source: AGHT+IFUXBtpyH/WdQiEIJj4uqzKoyCbflUJT6lbctlJ3HoW9YfSi4NsntE6/2IrB/YxOI/P9pqOlg==
X-Received: by 2002:a05:6870:1651:b0:221:3c64:fbb with SMTP id c17-20020a056870165100b002213c640fbbmr19192588oae.30.1710889294781;
        Tue, 19 Mar 2024 16:01:34 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id kc28-20020a056214411c00b00690bfb6aac7sm7047065qvb.51.2024.03.19.16.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 16:01:34 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9] linux-yocto: consolidated pull request
Date: Tue, 19 Mar 2024 19:01:23 -0400
Message-Id: <cover.1710888915.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 23:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197335

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

This took longer than I wanted but here ar the next set
of linux-yocto updates.

We have -stable, config tweaks (in particular genericarm64) and
a fix for the beaglebone-yocto graphics issue.

Rather than sending the yocto-bsp update separately, I included
it in this series, so you can match it to the core kernel
updates.

Cheers,

Bruce

The following changes since commit 78e48090b2c2aa94112b986e0948b0a981d08e7f:

  gstreamer1.0: improve test reliability (2024-03-19 15:25:12 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (9):
  linux-yocto/6.6: cfg: generic arm64
  linux-yocto/6.6: cfg: riscv XHCI
  linux-yocto/6.6: update to v6.6.21
  yocto-bsps: update to v6.6.21
  linux-yocto/6.6: update CVE exclusions (6.6.21)
  linux-yocto/6.6: cfg: drop unsettable options
  linux-yocto/6.6: drm/tilcdc: Set preferred depth
  linux-yocto/6.6: update to v6.6.22
  linux-yocto/6.6: update CVE exclusions (6.6.22)

 .../linux/linux-yocto_6.6.bbappend            | 14 +++++-----
 .../linux/cve-exclusion_6.6.inc               |  4 +--
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 5 files changed, 29 insertions(+), 29 deletions(-)

-- 
2.39.2


