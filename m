Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE9CCD128A
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 13:11:08 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.165495.1712754665817595794
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 06:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WvLAYMSQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6ed5109d924so2434899b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 06:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712754665; x=1713359465; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fO9xJDoPO608qMjlrcG3tf+dcXjkiwP6GmVjFs+LWXM=;
        b=WvLAYMSQXnd+5V3/AyiKYqj1SmuaQKXE+VKkDdw4tjeRmVl6BgMIqvt0yYGXXAg2QI
         QOhQaB2zXA24iD+G62cOUjLVuokkxrC4ZVP5RqRTYEJk9/W3AnnUgVSusrQrk8TF0Aw+
         Mh/MBYFP264Wsi0JflaJS8Rwy6ncfzkrtONZpS7nZ62RblAVrkRePo3kxaUAhkYVi+MK
         NMkiycRnw8cnPLVcKgGDZGxWrNpFk7RaSVdrkP8YyE2RZpi1DuPAUvEny3rTVzBmVdxd
         HEmRZfKphZhWjOCqkY8PMpJQSgVl2cLeGD+tDXGsNfJqQdsmP9Hu6bFeWzLMMStrUB1B
         BKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712754665; x=1713359465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fO9xJDoPO608qMjlrcG3tf+dcXjkiwP6GmVjFs+LWXM=;
        b=fVeUqzSedZ79lHCsxvo3KTR5lI87pTccxSS19/EVEHuHbsucTB2GY2SFshYxTqk5vJ
         vZwU+QJGWHipsK6bCtYTw+b33n5h+MkijZRfQz+kkwvyN+RCmp72XiafitD+0z5KRANW
         TFKHCFy7wSdJ7WVx80YbrdFbG8xyRyN03lH3nnuMq2SenVm7ufRr1/pW/YTeuV233pB6
         l5RfIYqDP7GhDc8gvPqMJWETzpSCVnHhfbcJL84ZTbctziJLCT762qgJbQYTQEYD1YCW
         tE4dLVqpyL7xc0FuC8FeDhV4Wsg5vvUtgQd+gma3lyAY3TDb23hkRYib8QWe1bBByUBI
         kqUQ==
X-Gm-Message-State: AOJu0YyUkPw4Tsh558ixXQ7yWWMtZ2N9EKwCHn/RBdzd/tgW/9mKaMai
	Rq0DxWSQKE2x8wsdfzXaDd1ztquMnFaCLCSdRrUTCsLrJzAHCxUJRyXKvrtDgXLL7bdKk1Mcoo/
	vnvs=
X-Google-Smtp-Source: AGHT+IGn+KmdDkZc+LccsPlK3vMjVDs0gcKiLB2ZVzZMsQUxKf6yf2TxWRiql14zqp3cQjRsxgBiZA==
X-Received: by 2002:a05:6a20:3214:b0:1a7:a412:c881 with SMTP id hl20-20020a056a20321400b001a7a412c881mr2437302pzc.30.1712754664885;
        Wed, 10 Apr 2024 06:11:04 -0700 (PDT)
Received: from xps13.. ([199.58.97.236])
        by smtp.gmail.com with ESMTPSA id c17-20020aa78c11000000b006ed0199bd57sm10054887pfd.177.2024.04.10.06.11.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:11:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/5] Patch review
Date: Wed, 10 Apr 2024 06:10:53 -0700
Message-Id: <cover.1712754495.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 13:11:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198093

Please review this set of changes for dunfell and have comments back by
end of day Friday, April 12

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6774

The following changes since commit 47ce772102b45db14dc21112367534ea1c37e33c:

  perf: bump PR to deal with sstate corruption on autobuilder (2024-04-02 05:46:56 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Ashish Sharma (3):
  go: Backport fix for CVE-2024-24784
  xserver-xorg: Backport fix for CVE-2024-31081
  xserver-xorg: Backport fix for CVE-2024-31080

Colin McAllister (1):
  licenses.conf: Add missing LGPLv2.0+ license

Vijay Anusuri (1):
  ncurses: Backport fix for CVE-2023-50495

 meta/conf/licenses.conf                       |   1 +
 .../ncurses/files/CVE-2023-50495.patch        |  79 +++++++
 meta/recipes-core/ncurses/ncurses_6.2.bb      |   1 +
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2024-24784.patch           | 205 ++++++++++++++++++
 .../xserver-xorg/CVE-2024-31080.patch         |  49 +++++
 .../xserver-xorg/CVE-2024-31081.patch         |  47 ++++
 .../xorg-xserver/xserver-xorg_1.20.14.bb      |   2 +
 8 files changed, 385 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2023-50495.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2024-24784.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31080.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31081.patch

-- 
2.34.1


