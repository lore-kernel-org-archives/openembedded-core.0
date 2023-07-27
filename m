Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6BDC0015E
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 13:56:30 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.8024.1690466179785515964
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 06:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=g+DXbHJi;
 spf=pass (domain: baylibre.com, ip: 209.85.128.47, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3fd0f000f1cso6553075e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 06:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690466177; x=1691070977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oJYh4s4rm9IuGxk+WVpae0FSplRkwQpEx3CxwXXBVv4=;
        b=g+DXbHJiav0ArwYj0RtuhfoF7QB/19O7g9ICCyBawzTEAcHyTjoDO9xNVDJA3qnSVp
         DQwntAqwCxzO8ffK21ILhqAkYgzU6fdbeh9lOuvgI5S7kGBrbH6h9ZyKaDqVxoyjef59
         ZSZDoX4S6MM+lfhzaW8iwIknwD4bj5OC9pOd2/0Dl55DKn9al+lLkimakNnpP24chNM5
         JGuF/30l/QVDiRxHSZMYsRGQZoJRQL7Krn2IAr+fk4Dnhafa/liAOG1znrOqLMCPnsV8
         KSiG4r7nGxMZlWWN7eU7YJ6o2+j7DFlPzITehdjO/49lj625tG812PkjapvXMcPiMhtB
         YQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690466177; x=1691070977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJYh4s4rm9IuGxk+WVpae0FSplRkwQpEx3CxwXXBVv4=;
        b=B6QcbOA2sk7gNz7Mci6/ZSjiROFkG8LN8ERLumQlFMBBAGFPOP6MwoXBZsJQx/A1it
         4je3SLgIAhOA1eYzjxO7f2AKF/QaL0KJjlPGCcJZIiqeC5sVfJev/UpYgSw+xeku52K2
         gocfwSrqQVf7IxpfHMtlEDO2rDfs5Q3MX30W2K3ozSem9BOTStaEfrRxE1ksRwf46zSj
         mJOmtDIrM88n0xgXdqPeeFScZMytmqQPKpoKPFk+Imdci9QhHgJMtkRLA3qzDG+MUbzV
         1jMoLYUAVVYFzw/+U5TWpXuF/+2IYHFk8+gEhE0VvX+TPVwAxygo1aoaUHmpwbDpchY5
         cpPg==
X-Gm-Message-State: ABy/qLaaS2fg94Nab5/2BcIDPzpMPrUYeWiHjkQ60UDz9J6ZTukXqAvF
	I9b1Pq8fh+iB47PF9MWP7aiD/41EgNQxH7e8f4mxgA==
X-Google-Smtp-Source: APBJJlHOcdUCGuVR2b/p2t8PVNVSdkmbuDBuDhK3lW3VVjaKD93EIV+vf8lMT0dBPrKhOFM9j4WW0w==
X-Received: by 2002:a05:600c:1c8b:b0:3fb:b075:8239 with SMTP id k11-20020a05600c1c8b00b003fbb0758239mr1866906wms.4.1690466177253;
        Thu, 27 Jul 2023 06:56:17 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id y26-20020a1c4b1a000000b003fc04eb92cbsm1868884wma.44.2023.07.27.06.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 06:56:16 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 0/3] Add bblock helper scripts
Date: Thu, 27 Jul 2023 15:56:09 +0200
Message-ID: <20230727135612.951926-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 13:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184932

Hi all,

This is v3 from bblock script.

Improvement from v2:
* Add a function in bb.cooker to compute task signatures
* Replace the findSigInfo function by the new created one. This has the
  following advantages:
    * findSigInfo needs the task to be already built to get the siginfo
      file, meaning we cannot lock a recipe on a fresh build
    * we can now generate the signatures for all available task of a given
      recipe
* Check if a given task is already locked. If so, don't duplicate
  entry in bblock.conf

Limitations:
* Needs to taint tasks that are locked, to display a warning
* I may be still missing some checks on user input
* Silently does nothing if given task doesn't exist
* Silently does nothing when resetting a recipe that doesn't exist

I did some tests using qemux86-64 and qemuarm but I may be missing some
corner cases.

Improvement from V1:
* Signatures are now package architecture specific meaning that if you
  switch MACHINE, the lock sig will not be taken into account
* I added the -r option to unlock recipes
* I added a -d option to display the current bblock.conf
* Added an include directive for conf/bblock.conf inside bitbake.conf
* Added -t option to specify the tasks to lock/unlock

Limitations:
* I may be still missing some checks on user input
* I need to find a way to get the list of tasks ( by default still lock
  only the do_compile for now, unless -t is specified)
* Do not check if a particular recipe/task is already locked when trying
  to add lock. So entries may appear multiple times
* We still need the signature of the tasks to be already computed before
  locking. Need to find a way to generate it if missing

V2: https://lists.openembedded.org/g/openembedded-core/message/184697
V1: https://lists.openembedded.org/g/openembedded-core/message/184584

My branch is available here [1]

Cheers
Julien

[1]: https://git.yoctoproject.org/poky-contrib/commit/?h=jstephan/bblock

Julien Stephan (3):
  bitbake.conf: include bblock.conf
  bitbake: cooker: add a new function to retrieve task signatures
  scripts/bblock: add a script to lock/unlock recipes

 bitbake/lib/bb/command.py |   6 ++
 bitbake/lib/bb/cooker.py  |  16 ++++
 bitbake/lib/bb/event.py   |   8 ++
 meta/conf/bitbake.conf    |   1 +
 scripts/bblock            | 182 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 213 insertions(+)
 create mode 100755 scripts/bblock

--
2.41.0

