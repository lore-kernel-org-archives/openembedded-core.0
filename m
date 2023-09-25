Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE112CE7A81
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 08:04:59 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.56257.1695629098713397494
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 01:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=COFY3nwq;
 spf=pass (domain: baylibre.com, ip: 209.85.128.47, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3ff1c397405so66119685e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 01:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695629097; x=1696233897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2JqAfam+qZ4QWPbclTvnaIYC8xsP2VnniLjjFpb4kMo=;
        b=COFY3nwqwkJjgIt9rkCU0vNUBfUj75O/CI2JOnz1bOaUgqkGvU9Ijjr8uXRwzJPp/G
         cGXZOuuEw73Z8LirOb6EzvKLyvaazM37dh+y7VtqSayeiKQBGYaUB8DKMJt9hS1jLrEX
         XURBiOG96F9C4fbmC2SxZ2Z76LmuyZZx9H3qJ5tepiFKFKb5y/9eTFnBtD0Z4yk1+/0u
         Yvb6oB9/ChDu/cPf7X/HZnpZww7KL2Q8upmIZdcc34oEDcj5xCAfkuaLC9a/NFTg89qV
         oY/NKhyRPl5IiyXIfKXaBcEr419HHYeEXjxVJSJQk8PqjIeyaHXJPlOpr7PT5X6aMDbd
         TxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695629097; x=1696233897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2JqAfam+qZ4QWPbclTvnaIYC8xsP2VnniLjjFpb4kMo=;
        b=hNJtBER6eBgvjI70kwKJd+PqmDoVNRupKU2z/felxf4t/FHJgJxTZnrkdz24AN0uGp
         INlOrsqpLqUlhBh6J1OVPGXrv05mJ+z2PVIbvd7B0Cow009FjDgY6WsWWt9s1a30BaOt
         4LWo/YZGKZuo6flf/qffoq2XqcOhJ/6amv1Jryp6ZqwW08BrtdqISjPoERlUKPSW9tAY
         2U/fbbiM6dZ/7N9AOyneGEIXAGBvGFv5Ca+x2h+XYuodXm44GqAej3kyq21c+2ogxhRC
         GzBHZ08vpFk8TRWfRL4vRWZcZyACaTUVZ4G/D4XiVLkeH2IdwhXQOalAUTdOpT9VGPIx
         MNjg==
X-Gm-Message-State: AOJu0YyfijEnEQj3xvGre5tNJjXebqRnIbrI+ox39DnfBAIfp25YcTt8
	k8pANYJc7HPzoIOuCt17CgURZBMX7SjkYoZjg+Y=
X-Google-Smtp-Source: AGHT+IGG6IFvZO1GFK4ap9X4GYXMhlHRN53e3dKuv/++NSTrWb123piDK4xWL8j8tzrZWp6EV7Id3A==
X-Received: by 2002:a7b:c3d0:0:b0:403:e21:1355 with SMTP id t16-20020a7bc3d0000000b004030e211355mr5323298wmj.36.1695629096791;
        Mon, 25 Sep 2023 01:04:56 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600c040c00b0040586360a36sm3196950wmb.17.2023.09.25.01.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 01:04:56 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v5 0/5] Add bblock helper scripts
Date: Mon, 25 Sep 2023 10:04:47 +0200
Message-ID: <20230925080452.803540-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 08:04:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188174

Hi all,

This is v5 for bblock script.

Improvement from v4:
* Fix self test error reported by autobuilder
* Allow to specify task with/without the "do_" prefix:
  example: bblock bc -t compile,do_install
* Fix test_lock_single_recipe_all_tasks
* Fix getTaskSignatures: now retrieve all tasks and filter out the
* setscene and nostamps ones

Limitations:
* Silently does nothing if given task doesn't exist
* Silently does nothing when resetting a recipe that doesn't exist

Improvement from v3:
* Add self test
* Add a new "info" level for SIGGEN_LOCKEDSIGS_TASKSIG_CHECK: this allows to
  display a Note when recipe contains locked task(s)

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

V3: https://lists.openembedded.org/g/openembedded-core/message/184932
V2: https://lists.openembedded.org/g/openembedded-core/message/184697
V1: https://lists.openembedded.org/g/openembedded-core/message/184584

My branch is available here [1]

Cheers
Julien

[1]: https://git.yoctoproject.org/poky-contrib/commit/?h=jstephan/bblock

Julien Stephan (5):
  bitbake.conf: include bblock.conf
  bitbake: cooker: add a new function to retrieve task signatures
  sstatesig: add a new info level for SIGGEN_LOCKEDSIGS_TASKSIG_CHECK
  scripts/bblock: add a script to lock/unlock recipes
  oeqa/selftest/bblock: add self test for bblock tool

 bitbake/lib/bb/command.py              |   6 +
 bitbake/lib/bb/cooker.py               |  31 ++++
 bitbake/lib/bb/event.py                |   8 +
 meta/conf/bitbake.conf                 |   1 +
 meta/lib/oe/sstatesig.py               |  18 ++-
 meta/lib/oeqa/selftest/cases/bblock.py | 201 +++++++++++++++++++++++++
 scripts/bblock                         | 184 ++++++++++++++++++++++
 7 files changed, 448 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/bblock.py
 create mode 100755 scripts/bblock

--
2.41.0


