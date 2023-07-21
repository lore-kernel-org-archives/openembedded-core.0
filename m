Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912B0EB64DD
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 14:25:50 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.8485.1689949546903201848
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 07:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=BY4PpwLz;
 spf=pass (domain: baylibre.com, ip: 209.85.128.43, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fbc77e76abso17005245e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 07:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689949545; x=1690554345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QhLt9l2217JUZXAJJRi/XNqGlRMpE/Ay+2MtyvywieY=;
        b=BY4PpwLzA1wDPUu0bT3YA4iGbCxlfOeBhs78A/psm2bJEvEpSFmnyAjdVbRg3OF3SQ
         c9l+YiNtyjoVmkXS6LUZXlFtGxC6gOlcPF7X9cmmv6cGY80NWMb/umUfGCdsOCzrlfB+
         uy4jSX1umZw5VMUkr3y4F7Ox+mVeLfZ6EwmHq71BcZBb5gm3Lu3T4+Xxl1fFyevAcr7V
         VCZZFqdooev6jGwQH7bB6IF1u8jsh4dR9ngzTvQSgb0VOaEP7Dt1OlOMQfaBxbzIUe9g
         7n4AFkwqTbHieeRoC7OAHcX6i73MlmKnqg4Pk5cLMT8amzBGu+w4BlhOhW711tFcGXjZ
         mlxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689949545; x=1690554345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QhLt9l2217JUZXAJJRi/XNqGlRMpE/Ay+2MtyvywieY=;
        b=kJGkGcue50Q4LcRfspIroSj/XdIUhT5vX/CVDXXLZNSHZgpiD9FZub7/+6Rz+oWowM
         839su+vjKnppD1sOZua+B2PT0wojb57KzInrQFmOPrpm7r7aHi8xGC9UII3KRU4T+hiJ
         F3wO/3wdasOJSmZJBwuqIcUhaPSoN3kWOLQGGpDeSuHbAH7DDly56pnE8aFNH1OfpHay
         IfGcXUD3FhjyEhlrTUygow90E9o/qf0x7OnKXgZ0x/OFA/1jf12lKm/+ItoSOgJjFiCH
         AHV2NKkU/WMC9EZJJxfTjvsAvWh1AdVt721718V6Dc7Paau4Lfvj5jkB0Ke1Husuzm8C
         p8PQ==
X-Gm-Message-State: ABy/qLZEaKMKO+RoaKhdA/fqGy4iSf/nMTxDzc1jXlQIC3845K+Mubra
	OdBqXk1kWTkNZ1a36bMF2TU85tmDU+8XPpNwLaHmqg==
X-Google-Smtp-Source: APBJJlFBN87yAz8zpYd8ZS07hZVD6kZ0aj9QX/ZNEqqnTpdgONsnvulaw3snO6wsh/FpX1Ck6d+f4Q==
X-Received: by 2002:a7b:c856:0:b0:3fc:a8:dc3c with SMTP id c22-20020a7bc856000000b003fc00a8dc3cmr1549625wml.37.1689949545106;
        Fri, 21 Jul 2023 07:25:45 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:fd3b:9fed:e621:cc8f])
        by smtp.gmail.com with ESMTPSA id l5-20020a1ced05000000b003fc02219081sm3392059wmh.33.2023.07.21.07.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 07:25:44 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [RFC v2 0/2] Add bblock helper script
Date: Fri, 21 Jul 2023 16:25:41 +0200
Message-ID: <20230721142543.246415-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 14:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184697

Hi all,

This is the v2 of bblock script.

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

I did some tests using qemux86-64 and qemuarm but I may be missing some
corner cases.

I force pushed my branch on poky-contrib [1]

Any feedback are welcome!

Cheers
Julien

V1:
I am currently working on bug #13425 and I would like to post my wip
script as an RFC to get feedback on it, before going further in the
development.

The script `script/bblock` can be used with the following command:

bblock [list of recipes to lock]

Here is a summary of what is currently implemented:
* can lock several recipes at once
* on first execution bblock will append `require bblock.inc` in
  `build/conf/auto.conf` (creates `auto.conf` if it doesn't exist)
* on first execution creates the file `build/conf/bblock.inc` with a
  dedicated header and:
         - adds SIGGEN_LOCKEDSIGS_TYPES += "t-bblock"
         - adds SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "warn" to display warning but
           do not stop the build
* loops over all recipes to lock and adds entry with latest "do_compile"
  signature in `conf/bblock.inc`, such as: SIGGEN_LOCKEDSIGS_t-bblock += "bc:do_compile:e233cd793137a92dd575a417a2877e324ce526c4dc4a7db652abb9512f406f1f"

Limitations:
* only gets do_compile signature for now as a POC
* `bblock reset [list of recipes]` not yet implemented
* no check if a recipe is already locked

Steps to test the script:
bitbake bc --> generate a signature for bc's tasks
bblock bc
# modify do_compile in bc recipe to force signature change
bitbake bc --> throws the following warning: `WARNING: The bc:do_compile sig is computed to be 680bd6c291bf88e379e0c405a773cf5f81851e1a52570398cefd0196000ac1ef, but the sig is locked to e233cd793137a92dd575a417a2877e324ce526c4dc4a7db652abb9512f406f1f in SIGGEN_LOCKEDSIGS_t-bblock`

I also have a point I would like to discuss: I only get signature for
do_compile for the POC but wondering what should I do here:
* have a set of predefined task to lock, in that case how to choose the
  tasks?
* compute the list of all available tasks for a given recipe and get
  signature for all? Is there a way to get such list without using
  `infoil.build_targets(pn, "listtasks", handle_events=True)` as this
  will start bitbake, takes some time and requires some processing of
  the output
* add an option for the user to specify the task he wants to lock? (this
  may be useful to add anyway)

My branch is available here [1]

Am I going into the right direction?

Cheers
Julien

[1]: https://git.yoctoproject.org/poky-contrib/commit/?h=jstephan/bblock
Julien Stephan (2):
  bitbake.conf: include bblock.conf
  scripts/bblock: add a script to lock/unlock recipes

 meta/conf/bitbake.conf |   1 +
 scripts/bblock         | 184 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 185 insertions(+)
 create mode 100755 scripts/bblock

--
2.41.0

