Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 389E2C27C50
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 21:01:12 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.68305.1717362069251343491
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 14:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dIS/ateq;
 spf=pass (domain: konsulko.com, ip: 209.85.210.176, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70255d5ddc7so1010275b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 14:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1717362068; x=1717966868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8uw/cArj54Xh+U6sMfg/h8PoTHxGxagKfMHmBO+x5Xs=;
        b=dIS/ateqAar0Nd5qr+fjw8WGskJPM4DWCcSrKOsoUDhknIPbOJWQMpKlmjNe/oD6e4
         UHUfPg8796XRI7tMsjSG3s4SWcnkr3Br78e4VBzaRunYb59GTSWacVd4c5K+wKcBWLDb
         APakOLDVN4kKQjriDu9ScDcl/3XVb7UVU4qCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717362068; x=1717966868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8uw/cArj54Xh+U6sMfg/h8PoTHxGxagKfMHmBO+x5Xs=;
        b=Ctn9BciqCfVrVT4PhvQK0FkqGSvFr/jt2cEMCadpEBC7fyAaEuso1V1N+X2D/jDGI1
         MPd5TL8k9LXszhLUcsCBgm494mc2Q+eiQPEXdNMV8hRPn+TO+cY5769lIo8J9+i0FPqN
         pUe+X5XjQquGwfNgj+93Ytx6HdB9A6OUp6MnkfD28g5dpCn/prziN2NYfrqCMRJejY4m
         JHe0t2vXIIbgxK4s+U9B+GpWdXfk+e1/KrPOppvUTp5CwL9Fk5/4xk8lVlZ/wVOnZ/aR
         wL7MZ2Kaqc15zHYTucHxlMEoGznVAX4VPmzIEkyjcXlAYIh6DaEO5Pspd2W0WeugcPEf
         OiaA==
X-Gm-Message-State: AOJu0Yz+/RJ/5en/kcVVDjJF6U3ONf/zGaY0AST0lX6a/dlNmQ9TLg3d
	nNK9DyZGJj2F6YEl/BTroI+cK/D7vVoJgdHzddXoYqZ3pPugzF8m62/mvq1K+Pz6KA+SOGXOEOw
	LQwM=
X-Google-Smtp-Source: AGHT+IGGtSHMvTvkP4kwbJ14qVsvea5rq/wIafaI0eF778rnOpFrGylxQ2nDlreU3rUIFbSffYuiMQ==
X-Received: by 2002:a05:6a20:734e:b0:1b0:812:ab3e with SMTP id adf61e73a8af0-1b26f25d051mr8728658637.38.1717362067512;
        Sun, 02 Jun 2024 14:01:07 -0700 (PDT)
Received: from localhost ([2601:1c0:ca00:bd60:3fc2:5771:b380:483a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423c7c78sm4312042b3a.7.2024.06.02.14.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 14:01:06 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org
Subject: [RFC PATCH 0/3] Implement RECIPE_UPDATE_EXTRA_TASKS
Date: Sun,  2 Jun 2024 14:00:37 -0700
Message-ID: <cover.1717361301.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 21:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200216

From: Tim Orling <tim.orling@konsulko.com>

Whenever a recipe which inherits cargo-update-recipe-crates is upgraded with
devtool (such as with the Auto Upgrade Helper) we frequently see failures.
If the upstream Cargo.toml or Cargo.lock has been changed, the corresponding
<recipe_name>-crates.inc needs to be updated. This is done by running the
"bitbake -c update_crates <recipe_name>" task, but this has until now been
a manual operation.

Add a new variable RECIPE_UPDATE_EXTRA_TASKS which is a string delimited
list of tasks to be run during the upgrade() method of
meta/lib/devtool/upgrade.py.

To solve the problem described above, the solution is for all recipes which
inherit cargo-update-recipe-crates to add the "do_update_crates" task to
the RECIPE_UPDATE_EXTRA_TASKS variable. Add this to the bbclass.

Add test case based on the guessing-game source we currently use for the
maturin runtime test cases, based on https://www.maturin.rs/tutorial.
This oe-selftest case checks for both the change in the recipe file and
the recipe -crates.inc file.

This will rely on a new "guessing-game" git repository to be added to
git.yoctoproject.org/guessing-game (currently hosted on GitHub for the
purposes of this RFC).

Currently, update_crates is the only task known to the author to fall into
this RECIPE_UPDATE_EXTRA_TASKS use case. If anyone can think of other use
cases that can also be added (and tested!), please let me know.

Two obvious use cases that would be nice to add with changes in oe-core are:
(1) some kind of "go-mod://" update class to use a similar <recipe>-go-mods.inc
(2) some kind of rework of the "npm://" fetcher to use <recipe>-npm-mods.inc
But both of those are out of scope for this proposal.

The _run_recipe_update_extra_tasks() method added to lib/devtool/upgrade.py
is functional, but could probably use some more guards and checks. Ideas for
improvements are welcome, hence the RFC.

An attempt at documenting the new variable has been added to ref-manual,
but if anyone has some ideas for better clarification, input is welcome.

The following changes since commit af6d28d2b0abdfcfa70edcc95abd99a3c1a64ac8:

  sanity: Check if tar is gnutar (2024-05-31 16:58:36 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib timo/RECIPE_UPDATE_EXTRA_TASKS
  https://git.yoctoproject.org/poky-contrib/log/?h=timo/RECIPE_UPDATE_EXTRA_TASKS

Tim Orling (5):
  devtool upgrade: enable RECIPE_UPDATE_EXTRA_TASKS
  cargo-update-recipe-crates: add RECIPE_UPDATE_EXTRA_TASKS
  ref-manual: add RECIPE_UPDATE_EXTRA_TASKS variable
  meta-selftest: add python3-guessing-game
  oe-selftest: add RECIPE_UPDATE_EXTRA_TASKS test

 documentation/ref-manual/variables.rst        |  7 ++
 .../python/python3-guessing-game-crates.inc   | 82 +++++++++++++++++
 .../python3-guessing-game-crates.inc.upgraded | 88 +++++++++++++++++++
 .../python/python3-guessing-game_git.bb       | 19 ++++
 .../python3-guessing-game_git.bb.upgraded     | 19 ++++
 .../cargo-update-recipe-crates.bbclass        |  2 +
 meta/lib/oeqa/selftest/cases/devtool.py       | 46 ++++++++++
 scripts/lib/devtool/upgrade.py                | 12 +++
 8 files changed, 275 insertions(+)
 create mode 100644 meta-selftest/recipes-devtools/python/python3-guessing-game-crates.inc
 create mode 100644 meta-selftest/recipes-devtools/python/python3-guessing-game-crates.inc.upgraded
 create mode 100644 meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb
 create mode 100644 meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.upgraded

-- 
2.45.2


