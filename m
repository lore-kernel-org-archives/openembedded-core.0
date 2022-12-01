Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB02C47088
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:25:42 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.46605.1669908335626363663
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=EhALV5jM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id w2so636630pfq.12
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 07:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rygp407UL8oUMtp7BWKEywhkkRVTCKj+DxXq271ktO4=;
        b=EhALV5jMD5BOdTb7qw3ns/jsC4nSDK5QbnTAalX+1uugkFN9E3z1kJnQ6fbk1wHtg2
         2EmdtQRpcexEwt+5pAQuYU5ps30jesSYMFui00blHLgX8lrG1x2fkn5fZAocVI5SDhCc
         kPf3pXuDlRvCUnaxcz65zyd/1kmz6HSSOWHwHZuKEqnCOZuZvrCj0wNKXfa6gSOPMlgK
         uHfD0E2aaphrPXafCgdBk1HQCVUW+eoqiyNzXxKKhsrtFrJnM9hiEpOftAdFj+8QP8Eo
         nl1bimbic6Fbzju5WUiFZhEk1qM6Iphx856SfsZ/4m3yCmkHXAT7TqJjxpdhNsqBvBgt
         62TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rygp407UL8oUMtp7BWKEywhkkRVTCKj+DxXq271ktO4=;
        b=XtyexMuHHXeOUbLQJaUYYzaULnN0ZvF47PBk3oVH6dFUhMTjjo18dnfG+RiSXhlFlG
         Ke00loHZbP5AgeeRv474bpIU/bo7RbtpeienNc6j6YX6K2WmGa+cefuv9ZFadd0fBKvv
         Zdrp1eKaYgSSCa5L/DKDyXQUqa5mx27gOUwHfNolu6sg9Yab0NHIMDvaGWF/g4S3C+pQ
         btn4JRUEDaFcsSytzoMgOn2WcpUSOFvaNCRHh5QjGxNA4+csfCG0m8bYSjpJW05wbRoW
         GPp97MX8vAkDJROp7z2d03/foFVRAXO3pgg8BYzu3AajXDlQUrtRln8AjB0bySBaAEOm
         wTIw==
X-Gm-Message-State: ANoB5pmtqf+gZOFVnLX+gb1eJhire2xVQpSDl8Xskmdij70Q6t2WKHUo
	xL1zztyVdbV/1d2TVJe1FEHd1fpna2BB/sBiqWg=
X-Google-Smtp-Source: AA0mqf6bhVjNVWO790mxAdp+SWgRfkqVzxTh0p+xhCRphdsJ8yFEL+wHxXXL26LzsIoyS0ptfBpUDw==
X-Received: by 2002:a62:54c2:0:b0:56b:fb4f:3d7c with SMTP id i185-20020a6254c2000000b0056bfb4f3d7cmr69648486pfb.54.1669908334517;
        Thu, 01 Dec 2022 07:25:34 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id jc18-20020a17090325d200b001891a17bd93sm3812769plb.43.2022.12.01.07.25.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 07:25:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/7] Patch review
Date: Thu,  1 Dec 2022 05:25:14 -1000
Message-Id: <cover.1669908167.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174113

Please review this set of patches for dunfell and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4565

The following changes since commit 408bf1b4bb4f4ed126c17fb3676f9fa0513065ba:

  sstate: Account for reserved characters when shortening sstate filenames (2022-11-23 00:26:19 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (1):
  linux-firmware: upgrade 20220913 -> 20221012

Chen Qi (1):
  kernel.bbclass: make KERNEL_DEBUG_TIMESTAMPS work at rebuild

Dmitry Baryshkov (1):
  linux-firmware: upgrade 20221012 -> 20221109

Mike Crowe (1):
  kernel: improve transformation from KERNEL_IMAGETYPE_FOR_MAKE

Ross Burton (1):
  pixman: backport fix for CVE-2022-44638

Vivek Kumbhar (1):
  qemu: fix CVE-2021-20196 block fdc null pointer dereference may lead
    to guest crash

Wang Mingyu (1):
  mobile-broadband-provider-info: upgrade 20220725 -> 20221107

 meta/classes/kernel.bbclass                   | 29 ++++++++-
 .../mobile-broadband-provider-info_git.bb     |  4 +-
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-20196.patch            | 62 +++++++++++++++++++
 .../xorg-lib/pixman/CVE-2022-44638.patch      | 34 ++++++++++
 .../xorg-lib/pixman_0.38.4.bb                 |  1 +
 ...20220913.bb => linux-firmware_20221109.bb} |  6 +-
 7 files changed, 129 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20196.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220913.bb => linux-firmware_20221109.bb} (99%)

-- 
2.25.1


