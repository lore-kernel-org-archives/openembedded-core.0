Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C810C04A6A
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 14:24:39 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.16617.1690986276085483434
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 07:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=gUkTV1Tz;
 spf=pass (domain: baylibre.com, ip: 209.85.128.51, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fb4146e8ceso63997555e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 07:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690986274; x=1691591074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fb/kH5cnR5ZC9QeeK+UqaNh0/9GjV2bCVuuUvtLATUA=;
        b=gUkTV1Tz6p7STjyZHq1fKPR+N5rFWvkSYRMON+dwnCNzV8T0Cjjo3oUK4MZB1NJoof
         yQk/FwxSmCsqtGBaJ7G+WtUxy/aOITX53dcEbyVW98BFOC/9yy49467GMC8/yT8LuWe7
         w1Nnjf9g0lBglrjrS1//efkWL47oV67ZXyfPrYbXiz5bmQlhbzlUcp8hsBJ1PT9+/H5B
         Gu/xGf+1nUkDbXg/covQVc8ePU0dVxRsT9JKVKM2ftj8Sw/1UWbCwDiRwanOPPI54pQ+
         kN7LMZ+OrM8V23R2HObLT/Zb4AoLvQol97or2R/AgI+nFjFdCyi/r2zDJxqIQm3KINZJ
         IhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690986274; x=1691591074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fb/kH5cnR5ZC9QeeK+UqaNh0/9GjV2bCVuuUvtLATUA=;
        b=REO8ISWAEoICl8dvP6srIRhhR4+xcZnIcwUZjbBRnhGMpx1a09ERCO5lptf1cuMJh3
         HePaorAe1MD8BHSA31vLjOx00Qdj2f7960YCCIyIhlQenaTIY8yIIlpCdOHeMxxQRf5T
         wD4XzyR8/Sdu6YnvC6PK/WVkH8xwoOagRqDEwITzlYa7FkSBpU9DqOdjOUyy83jQDpMm
         mC13ccfxPgnF1karVXwu3cpYgMZ4mh/r8TeqWNULdNSrBrVkfjB9yTyAEI6//WXNSwTb
         o7E2HRJUoNzOkWPHMQ98+HUbU1TkBPY4YWfZMLgnXQ0r2aL1TFQc0870Yo0Zj/GzAmT6
         Y6Gw==
X-Gm-Message-State: ABy/qLYmAmbtzzHktLYRb6Wl4KHFPfSqTWvxxgKPm64WtfkPKQ10o4Aw
	vCq17b4ACj2WCtLhsvPjEow12Lz0YInETsSlxY2CGQ==
X-Google-Smtp-Source: APBJJlES9X1QanYrBpWbRBaYg3KCdtW0KpT96vCBeojp8Z2O2uUOvp9H7uY7B/AI6aP36PuYdxkzXA==
X-Received: by 2002:a5d:5312:0:b0:317:606d:c767 with SMTP id e18-20020a5d5312000000b00317606dc767mr4642941wrv.44.1690986273890;
        Wed, 02 Aug 2023 07:24:33 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id y17-20020adfd091000000b003178dc2371bsm15707079wrh.7.2023.08.02.07.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 07:24:33 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v4 0/5] Add bblock helper scripts
Date: Wed,  2 Aug 2023 16:24:27 +0200
Message-ID: <20230802142432.2296716-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 14:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185403

Hi all,

This is v4 for bblock script.

Improvement from v3:
* Add self test
* Add a new "info" level for SIGGEN_LOCKEDSIGS_TASKSIG_CHECK: this allows to
  display a Note when recipe contains locked task(s)

Limitations:
* Silently does nothing if given task doesn't exist
* Silently does nothing when resetting a recipe that doesn't exist

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
 bitbake/lib/bb/cooker.py               |  16 +++
 bitbake/lib/bb/event.py                |   8 ++
 meta/conf/bitbake.conf                 |   1 +
 meta/lib/oe/sstatesig.py               |  13 +-
 meta/lib/oeqa/selftest/cases/bblock.py | 146 ++++++++++++++++++++
 scripts/bblock                         | 182 +++++++++++++++++++++++++
 7 files changed, 371 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/bblock.py
 create mode 100755 scripts/bblock

--
2.41.0

