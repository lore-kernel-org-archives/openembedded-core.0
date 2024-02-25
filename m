Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544F7C47DD9
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 20:48:03 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.6008.1708894072838506251
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 12:47:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yp0Lucod;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-412a588c8b4so761275e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 12:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708894071; x=1709498871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sjnu+Jt0Cacf9LKQ3EIEwqNCv/bVN5zbC/Vg99LXW5Y=;
        b=Yp0Lucodt5dw4D7ABoGn8aouo6DW63t9pAPQyXE+9byXPVKpsUrCgrKga85rpLiUsu
         anvrg2I3jp9ED6LzCMe9Vj1ByIB+704yCUS3wPzWjO5n5aoJJ1AWTCMwIny7C+WFMzY8
         1LUvGu9bUgq7K/zoHe3wD8c+pKCkFqINugci6eSCVbwhVchMVAaWX18DKgiKDkiREpSn
         RhMmEUM1IejN+E4WIQUchUDLTlpFZ88AV2V+xhZm4neWXqPAS9aVBvQGsjnqc5aAGm7W
         wc1ExgPVMz63AuiTbAsVK6hDKuqbblYwsfjPIIXMjRKIZEXxE1Ex90tDo8mPTjH1O1n/
         SROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708894071; x=1709498871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sjnu+Jt0Cacf9LKQ3EIEwqNCv/bVN5zbC/Vg99LXW5Y=;
        b=YZL7nEV3bhzpTJPR55TB/KX3LstB5FtUS5O2oYm72A1XcrVZnXJIZ5HZLw7gsvDZf9
         nV6bYPc66rD79iULojM1x9S6iTPVy1l0EzpXtqgTnzfSHhga47mEMWmL8RY+F2Amxcph
         sduo0OtogM7rFFNBnJZ3WgPakR8XPd9zOyu6j5aF5VXJ4Z5OHEboKNPi6orWqS7nYhxu
         CM+GsNb8i9C6zIi7SklIQI7XYAz6C5BDoiZzY4hWVbyeKi4BjfIATsh5DuvK87u6j6i4
         xaKE4RQAA6TtCUI1pTHAXJdn/0enRNmN195wsVHuObwr7ueSYo1UjMo8jMVchlpALH/u
         8XrQ==
X-Gm-Message-State: AOJu0YzUQ4iwg8ir5s7XxgMHOv9si/nBrge8fXrg2MCMCzVgfAp6DNnj
	XXIHu2FgfihOr2/Qi5d8/o+BRmsWXclqV9xlJLFOsPUhovCVty64HTbt3NR4
X-Google-Smtp-Source: AGHT+IE/XHyED9Rnb2/5eW8MdHc5fDCMZxK0a23U/STlBFjlSnHb0MTbMpN+tCnR4Jqsl19yX8ngUg==
X-Received: by 2002:a05:600c:154a:b0:412:a508:c04d with SMTP id f10-20020a05600c154a00b00412a508c04dmr434496wmg.32.1708894070855;
        Sun, 25 Feb 2024 12:47:50 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id dq2-20020a0560000cc200b0033b483d1abcsm6005989wrb.53.2024.02.25.12.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 12:47:50 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/4] devtool ide-sdk source mappings
Date: Sun, 25 Feb 2024 21:46:59 +0100
Message-ID: <20240225204741.650070-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 20:48:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196146

This is an improved version of the patch from Enguerrand de Ribaucourt
which was originally published here:
https://lists.openembedded.org/g/openembedded-core/message/196037

The basic idea is still the same but the implementation is a bit
different and the commit message and some comments explain how this is
supposed to work.

The tests have been improved to check whether GDB really uses the
correct source files. The tests still use the cpp example project, which
only provides local files. Problems in relation to source files that are
retrieved from a Git repository, for example, are therefore not yet
detected.

The commit "devtool: ide-sdk launch.json per recipe only" is a fix for
an issue which was discoverd during testing.

Adrian Freihofer (3):
  devtool: ide-sdk launch.json per recipe only
  devtool: ide-sdk prefer sources from workspace
  oe-selftest devtool: ide-sdk tests

Enguerrand de Ribaucourt (1):
  devtool: ide-sdk source mapping for vscode

 meta/lib/oeqa/selftest/cases/devtool.py     | 42 ++++++++++++++++-----
 scripts/lib/devtool/ide_plugins/__init__.py | 19 +++++++++-
 scripts/lib/devtool/ide_plugins/ide_code.py | 25 ++++++++++--
 scripts/lib/devtool/ide_sdk.py              |  2 +
 4 files changed, 73 insertions(+), 15 deletions(-)

-- 
2.43.1


