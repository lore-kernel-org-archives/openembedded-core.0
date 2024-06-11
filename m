Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9078C27C75
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 15:55:24 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.223.1718121322914638107
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 08:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dWXDzVng;
 spf=pass (domain: konsulko.com, ip: 209.85.210.169, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70413de08c7so1063793b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 08:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718121322; x=1718726122; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oh3BKkzBUGcbGZoaO3xks1fmf9i0cT3ynBR8qNx9yyY=;
        b=dWXDzVng/rR+LiHD0rwkRZNj1KJ+EFaUQCOnlIfjcTTMIAUkijVEWQ9quiO6SnRtC4
         m0iXmIfWO9jMfwIT8TTz+yeYGclFiiFVVLBr/aWVt+S2sxdjl64yhTi+HtW4Q9chvtZt
         mBK6kiaxIPz7jMiw6bvwdasyY7LNMEEH2+98o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718121322; x=1718726122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oh3BKkzBUGcbGZoaO3xks1fmf9i0cT3ynBR8qNx9yyY=;
        b=kI2VMjd6GEFBeC5KAyLFkZebg2ySjwWoInuV332wNgQAjuQYBI+oGnTKwxHVL/wc6j
         vs13T1uoBjpoyL1WzuuBtJpAIYBoK4j/bl64TEcKCbX1CXG7MwxFL9G7oMPA7fOfrOAk
         kwl9LybBtDg+dVqsZdTGzfUc6S0mAhJzDMcuGWYcBuE/Vs8rf1vk4gCAImuxBki01aH9
         5kfhAvb08Q8qPRQ/bqfmLLXAIMfHKwIvRSN+bjn7KxFjbWqkcNC2QgTDVeuAa8yEedVM
         l7GeTXt3piIEUCGHysO3TzUUFWHdqkmO+Fu0EIt3dmCNGo7unlXwKr3qkiTOh+gneHhM
         aOIQ==
X-Gm-Message-State: AOJu0Yy1DXLWz40TRSBI3x2QVvuguNWTVXE3a2gdqXFJAZxAq1WUsAEx
	Ty/iIifWUmX+qm23CXrmcKBt/DkWHgXyKY9LQDQSLuQp3F2Vfy9rREutmOqmREpbmI2ZMDlHd6R
	5AlE=
X-Google-Smtp-Source: AGHT+IHwsRBHcuDAdCPvLWeaVhdHVot/lJ54q2jVWq2Z7snhHzHyDHUvcualbjfbDYFk4Yk8KBXZ7g==
X-Received: by 2002:a05:6a20:7fa2:b0:1b2:b191:b05a with SMTP id adf61e73a8af0-1b2f9c62568mr13396633637.44.1718121321742;
        Tue, 11 Jun 2024 08:55:21 -0700 (PDT)
Received: from localhost ([2601:1c2:c182:4da0::2bc4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-704115884fbsm7368871b3a.111.2024.06.11.08.55.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 08:55:21 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/5] Implement RECIPE_UPDATE_EXTRA_TASKS
Date: Tue, 11 Jun 2024 08:55:10 -0700
Message-ID: <cover.1718120117.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 15:55:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200538

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

This relies on a new "guessing-game" git repository which has been added to
git.yoctoproject.org/guessing-game .

Currently, update_crates is the only task tested in this
RECIPE_UPDATE_EXTRA_TASKS use case. Other use cases that have been discussed
are the python3-manifest.json and perl-rdepends.txt files which are generated
by manual tasks after an upgrade of python3 and perl respectively.

Two obvious new use cases that would be nice to add with changes in oe-core are:
(1) some kind of "go-mod://" update class to use a similar <recipe>-go-mods.inc
(2) some kind of rework of the "npm://" fetcher to use <recipe>-npm-mods.inc
But both of those are out of scope for this proposal.

The _run_recipe_update_extra_tasks() method added to lib/devtool/upgrade.py
checks the result of each of the upgrade tasks and raises a DevtoolError if it
fails.

An attempt at documenting the new variable has been added to ref-manual,
but if anyone has some ideas for better clarification, input is welcome.

The following changes since commit 46b5c2ea6cb97bb6dd0a85bef3be9eaa9a19b4b5:

  linuxloader: add -armhf on arm only for TARGET_FPU 'hard' (2024-06-11 11:41:33 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib timo/RECIPE_UPDATE_EXTRA_TASKS_v2
  https://git.yoctoproject.org/poky-contrib/log/?h=timo/RECIPE_UPDATE_EXTRA_TASKS_v2

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
 scripts/lib/devtool/upgrade.py                | 11 +++
 8 files changed, 274 insertions(+)
 create mode 100644 meta-selftest/recipes-devtools/python/python3-guessing-game-crates.inc
 create mode 100644 meta-selftest/recipes-devtools/python/python3-guessing-game-crates.inc.upgraded
 create mode 100644 meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb
 create mode 100644 meta-selftest/recipes-devtools/python/python3-guessing-game_git.bb.upgraded

-- 
2.45.2


