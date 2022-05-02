Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BACCC433F5
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 23:03:09 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.4330.1651532585323644994
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 16:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=sZ9Z/Yyt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d25so563156pfo.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 16:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T9hQpp+V2BKcKTCVMw0wA8QldTgCa4fayYRllbYEgwk=;
        b=sZ9Z/Yytpi0ZhEZS03BhssWfDwA1TgAE0VDuLe3GdHp5dd/XEqH6/ZbdrvxRRJw8Re
         GAgMPYOr0zffcVH/8KaWPninREDT78P+aGE9KUQpAPCzHNdcJH6dRs0YRDJJS41xP+54
         8/Fgx4YzLqKywymzt1/7le8w1WB5lJwOKMZbVyZGPRgbDQZml0cfzMw6mYKykzUOcJVi
         GYtpDnYCNaCW6xbCTjKMmrUpc8JYnDMUwuneABlG+oTwzWD70Yk/MPqo1aWSJIIfwNbt
         3+CALlqCk1jZbVz+N3W12TYnOOcvYgr4L3S/Eo4KgpwWpvmatjXh5VXu5WI6J5xiXU4R
         KGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T9hQpp+V2BKcKTCVMw0wA8QldTgCa4fayYRllbYEgwk=;
        b=HjbVI8m4itiliXK8TwjnDRDYz7dAbEZbU+Xelko0XTAupe0s5JKAy7OnHu0LKbIo1c
         4d4LTG/gg3Eee57YXJwFOhaSRy8eSYBgPd9h9W8tp7DTYu5KTWuV4NiHVheHqXLVD62e
         woHYtPNZkoGc09p2MKsx65U3iX5UdssR/4CueJd2kDE1MFTP75+QO2qJSQ/D1FUSw9R0
         XzjFunrlVig94S0gDxXaubDLMCwd6Et9R1QirR1RgFs/fKn7QrtbBKmvtCuTQ05ZXd0d
         Y/Nh4/qlrxZ1Cbpuadw0Oasbm7J9yjBuyVLzyI5wv3O540ahkEV55J44twiUGTIpxlEg
         U8pQ==
X-Gm-Message-State: AOAM5308g6ymcAhoF0uau8pDTUqToWKRCOkddd2XJGAVOym9br//f7tK
	oGVOX3sybwBukDj/5qzPVaSUV5t9h21Mp0N28+k=
X-Google-Smtp-Source: 
 ABdhPJxX2BKF/6J9EVB55/Va/vNZdRnCt9QO6P2bXAC6O08W6us0saK00Rs07u6XUOuyAGV5n6wx3w==
X-Received: by 2002:a63:5a1e:0:b0:3c2:7057:25c3 with SMTP id
 o30-20020a635a1e000000b003c2705725c3mr1002227pgb.529.1651532583613;
        Mon, 02 May 2022 16:03:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b0015eaa9aee50sm2002945plp.202.2022.05.02.16.03.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 16:03:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/9] Patch review
Date: Mon,  2 May 2022 13:02:45 -1000
Message-Id: <cover.1651531749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 23:03:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165179

Please review this set of patches for dunfell and have comments back by end
of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3600

with the exception of the meta-virtualization test which was just added
to a-full:

https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/19

Note that the test passed for qemuarm and qemuarm64, but failed for qemux86-64.

I tried to refrain from commenting that the test was added by someone with an
arm.com address, but I couldn't help myself ;-) (looking at you Ross!)

I'm not going to hold up the review process on this, since this is a newly added test.

Any help fixing this for qemux86-64 would be much appreciated.

Steve

The following changes since commit bb3fc61f0d7f7bcd77ef194b76f4fdd8a7ff6aa5:

  scripts/contrib/oe-build-perf-report-email.py: remove obsolete check for phantomjs and optipng (2022-04-27 05:00:00 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Chen Qi (1):
  cases/buildepoxy.py: fix typo

Khem Raj (1):
  busybox: Use base_bindir instead of hardcoding /bin path

Paul Gortmaker (1):
  install/devshell: Introduce git intercept script due to fakeroot
    issues

Peter Kjellerstedt (1):
  devshell.bbclass: Allow devshell & pydevshell to use the network

Rahul Kumar (1):
  neard: Switch SRC_URI to git repo

Richard Purdie (2):
  base: Drop git intercept
  uninative: Upgrade to 3.6 with gcc 12 support

Ross Burton (2):
  python3: ignore CVE-2015-20107
  bitbake.conf: mark all directories as safe for git to read

 meta/classes/devshell.bbclass                 |  4 ++++
 meta/conf/bitbake.conf                        |  8 ++++++++
 meta/conf/distro/include/yocto-uninative.inc  |  8 ++++----
 meta/lib/oeqa/sdk/cases/buildepoxy.py         |  2 +-
 meta/recipes-connectivity/neard/neard_0.16.bb | 13 +++++++------
 meta/recipes-core/busybox/busybox.inc         |  2 +-
 .../recipes-devtools/python/python3_3.8.13.bb |  3 +++
 scripts/git-intercept/git                     | 19 +++++++++++++++++++
 8 files changed, 47 insertions(+), 12 deletions(-)
 create mode 100755 scripts/git-intercept/git

-- 
2.25.1


