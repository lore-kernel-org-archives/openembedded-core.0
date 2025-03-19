Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F65C36001
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 14:10:41 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.8829.1742393435827317480
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 07:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Xr6Gx7Yk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2241053582dso38257395ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 07:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1742393435; x=1742998235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JnAOvN/qtVkz9eUiXu3w/v5nQIMm2tKh5bMFQSCq9Z8=;
        b=Xr6Gx7YkzycrYj4+SEnKfKUvWxT9TxpIt9kUy9oY+UUDjDZPEO12I53uH5rU+/E2Xc
         96Lu2cLVZDJg73Q7bLVbcmid+RHJIo0ihY5z2ml3no6duNmuBIVLF91/aVVojcA1NvlZ
         fFn9s1xjO1yBanWZUJyEr01aiFGBsciao7XiruUnJ78Ckp/mDZrzCmxjL3Tq0tFn7EY9
         tMmCXHkslg3Pite/sUdRY/iyjnGNN2+vUj50JVovHDwGRefxAvId9iG6Q1GC8082ChXC
         z6tHBLALSjFS+IpYdqxEirDLgCYch7pe2JwJTIU8p4ySpsgScgpqiQl76CdGlBov/GpO
         P41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742393435; x=1742998235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JnAOvN/qtVkz9eUiXu3w/v5nQIMm2tKh5bMFQSCq9Z8=;
        b=cebJ1FknbOornGNFInJPPvRoicRIx4xhfj5Sdfg7EdRjm++y41d0bogS8rRs0aMHCw
         y+/T1Kp16ai3fDcwymysop5eOnDgI17Ep+D3FH+fX0BnxFBAdUKRboq7jlvAC9nRxBYQ
         gwm3jlzBxbfgSVVFXh3HaSEXvVm8/cCDhZ4BlQkbUP5OCWDErJbSg94Es5RCDdZF0PNC
         8Ku7GWPp9FOBUKToaRRlJrYizp2K4i2gEPuUjZagtIaadL6ROpPIREEnSS8CKOECiaqV
         WwvIcKpHYLiVxs7dVDLtrevLvpl1kCc/rwHmmIBJ+h0FggsegPvMIAQSsrh7grXz3VHR
         J2jw==
X-Gm-Message-State: AOJu0Yz58Hg18Qx0NRhFbF/z3R1m4Zq8q7BHRRAI2UmqrepXGUgK1L5v
	171f5Nwf/Ph5PHDiKtfOzwCwpDkCr/xTp9lMNfFw5iwoIf8gI4FK04Wf2NkW99PP+DGkvSBx5BL
	q
X-Gm-Gg: ASbGncskRTGSIlIM6DJkBPE6B9JKFRLq/ehBUEZe51vkCnIqcSDF9f+zXFlk2S1qWfH
	9C8IqILAc9Ng1mzWgJQJXzeCvXs7+ZXLKAneHfGbgGFObhvXVxObbpYKJ3RRHY8xgZ3tFGUxBxa
	DbFM7KzItM4y9Qat6pzmF8ZM/0tnq/kXwbmkkU7rZftbKU6bVBWNoPY83m8nOjvHq4VRKtnITTu
	yGyLbmAITtGyBmDwSuC7R3+vRcZ8CKo8XxH8G6PwC0/FMpeavfgxDMUreocSLAQywA7q1tnEE3s
	kqeB1Vdoa1B7/hEU8u/Eyf7EpsY8I0RMxBMi
X-Google-Smtp-Source: AGHT+IGzVIH4vmgE2km5eGviWHu0rdzZ8rh7Wac2lC/98JRb425MtWlRBB2zSxqa6kpzBq5A04erhQ==
X-Received: by 2002:a05:6a00:1912:b0:736:ab1d:7ed5 with SMTP id d2e1a72fcca58-7376d4f02a0mr4644273b3a.0.1742393434804;
        Wed, 19 Mar 2025 07:10:34 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116b10e1sm11557214b3a.165.2025.03.19.07.10.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:10:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 0/4] Patch review
Date: Wed, 19 Mar 2025 07:10:14 -0700
Message-ID: <cover.1742392880.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 14:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213334

Please review this set of changes for styhead and have comments back by
end of day Friday, March 21

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1213

The following changes since commit a0989930949689dd971dea61e851b548af86a1bf:

  xserver-xorg: upgrade 21.1.15 -> 21.1.16 (2025-03-12 07:10:58 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/styhead-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/styhead-nut

Makarios Christakis (1):
  icu: Adjust ICU_DATA_DIR path on big endian targets

Peter Marko (3):
  openssh: patch CVE-2025-26466
  openssh: patch CVE-2025-26465
  xserver-xorg: mark CVEs fixed in 21.1.16 as fixed

 .../openssh/openssh/CVE-2025-26465.patch      | 166 ++++++++++++++++++
 .../openssh/openssh/CVE-2025-26466.patch      |  36 ++++
 .../openssh/openssh_9.8p1.bb                  |   2 +
 .../xorg-xserver/xserver-xorg.inc             |   4 +
 meta/recipes-support/icu/icu_75-1.bb          |   2 +-
 5 files changed, 209 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-26466.patch

-- 
2.43.0


