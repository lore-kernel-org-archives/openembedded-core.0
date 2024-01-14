Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC98C47077
	for <webhook@archiver.kernel.org>; Sun, 14 Jan 2024 22:14:50 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.52010.1705270482970980290
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jan 2024 14:14:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SThucpws;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-336c9acec03so6824805f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 14:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705270481; x=1705875281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=enrSEs92xTIreh6Fmv6xeyQ2l6Sp1Bi2Jc4f4UZMTKg=;
        b=SThucpwsVZ7anOdsYiQqQ0dyKbXsfJk4xCyMvIVoNXzTWgZh/IN4GxGTzzgIkDqcpP
         idYQmD9XNTg8RgwaBMS7Nqw4zSxat1BNcVSHusJ0J0E5MYZfv1XuTVDaLlrCW6CUI/62
         4skz/Eo3uHClcebOfY33uLA7FDo3RbTvEJaGGjk57u8PFeVDgSyHhOSI6Q1p9j5XfOrj
         MkFNruGeTt/aWec4OBtz5ffFgljsmJCSX+uMMRL7o4GlphbIHu+JhD9CiHe8PZJdtKh1
         1J9YJkCqatbGL8bbzsjExPLqQwjFSxBUH3ikrEBFh9FMvXEMhX09OI3lHxVSL0ivFNUV
         ll5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705270481; x=1705875281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enrSEs92xTIreh6Fmv6xeyQ2l6Sp1Bi2Jc4f4UZMTKg=;
        b=M8RglmIJEiT6I5qio4Wr+8w5u2iYGI4IaridlBk+74Eo8qKXKsn2zRieM88D/yUoMU
         p6q+C5IkYV/bt0Lj2nVwCI0Ls8CF6RyD/YIshJaJ0P0ZlsrP6m3YIKBfkP3a5R2hj+wZ
         KMNoWngchx35zcmmxIeKgOswKQiR9PoBem9GyRZ68VAQXyseBAbDonmT2c6awIHM9v8N
         P51yHNFmO97P6LfTU8zkfZ8EFz1Gb74gjzfr6K0agJ5iz1doSFIohpnViOIq0UjMb6t4
         wGCQyZPtefEJpEDpMfSSxxIQV85ZnpSCsrIFpZjenUlX7fydHYkjgbmGfYk+ez2cgduF
         +auA==
X-Gm-Message-State: AOJu0YzGmK0RrT77GwricQbTj91M13HUXzQxV8TqNkJ45xx0xyvU+xTW
	E614LgOs+GescetU7VT/yY76oALY834=
X-Google-Smtp-Source: AGHT+IHyaNQ+e6zO7vJrvG0w3Pvr5q+mWpZ9uT49t6zsUaQTTaS160aIYhMdQCM6RZgAuobWs4NtfQ==
X-Received: by 2002:a05:600c:1389:b0:40e:44ba:eb45 with SMTP id u9-20020a05600c138900b0040e44baeb45mr2336571wmf.115.1705270480721;
        Sun, 14 Jan 2024 14:14:40 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id t21-20020a05600c451500b0040e3ac9f4c8sm17451943wmo.28.2024.01.14.14.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jan 2024 14:14:40 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v9 0/9] devtool ide plugin
Date: Sun, 14 Jan 2024 23:14:12 +0100
Message-ID: <20240114221437.1255866-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 22:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193618

The changes from v8 to v9 are:
- Rename the plugin from "devtool ide" to "devtool ide-sdk".
- Change the wording from "recipe mode" versus "no recipe mode" to
  "devtool modify mode" or "modified mode" versus "shared sysroots mode"
  or "shared mode".
- Use cmake --install to separate the do_install and the do_compile step
  from each other. The dependency is now resolved by bitbake or by the
  SDK/IDE rather then by cmake internally.
- The impelmentation of the do_install step was replicating the code of
  bitbake. This is no longer the case. The new version calls bitbake.
  This works and might be improved later.
- Extend devtool to support pulgins of plugins and make the devtool
  ide-sdk IDE plugins real plugins which can also be provided by other
  layers.
- Improve the --ide=none mode. There is now a full set of scripts
  covering the complete remote debugging workflow. These is also useful
  for the oe-selftest implementaton.
- Improved the oe-selftest coverage.
- Drop the changes related to image-combined-dbg. Merging rootfs and
  rootfs-dbg does not change. Using debuginfod might be supported later
  on.
- Make the refactoring of the devtool deploy function easier to review.
  There are now three commits instead of one. But I have to admit that
  doing the refactoring was very easy but looking at the commits with
  e.g. git diff is still not ideal.
  The 4 commits are now optional and moved after the commits adding the
  devtool ide-sdk code to make them optional.
  What might helps is that devtool deploy-target is well tested by:
  oe-selftest -r devtool.DevtoolExtractTests.test_devtool_deploy_target
- QEMU user-mode related patches are already on poky master.

Documentation:
- The commit "WIP: sdk-manual: extensible.rst: cover devtool ide-sdk"
  documents how this new plugin is supposed to be used.
  The commit will be sent to the docs mailing list after these patches
  have been accepted.
- There was a presentation at the Yocto Summit 2023.11:
  https://www.youtube.com/watch?v=AqSCR5WiUds
  Note: The "none recipe mode" is now more flexible and implemented with
  --mode=shared.

Adrian Freihofer (9):
  cmake.bbclass: use --install
  devtool: support plugins with plugins
  devtool: new ide-sdk plugin
  oe-selftest devtool: ide-sdk tests
  devtool: refactor exec_fakeroot
  devtool: refactor deploy to use exec_fakeroot_no_d
  devtool: refactor deploy-target
  devtool: ide-sdk make deploy-target quicker
  WIP: sdk-manual: extensible.rst: cover devtool ide-sdk

 documentation/sdk-manual/extensible.rst     |  257 ++++-
 meta/classes-recipe/cmake.bbclass           |   14 +-
 meta/lib/oeqa/selftest/cases/devtool.py     |  492 +++++++++
 scripts/devtool                             |    5 +-
 scripts/lib/devtool/__init__.py             |    5 +-
 scripts/lib/devtool/deploy.py               |  239 +++--
 scripts/lib/devtool/ide_plugins/__init__.py |  267 +++++
 scripts/lib/devtool/ide_plugins/ide_code.py |  432 ++++++++
 scripts/lib/devtool/ide_plugins/ide_none.py |   53 +
 scripts/lib/devtool/ide_sdk.py              | 1063 +++++++++++++++++++
 10 files changed, 2708 insertions(+), 119 deletions(-)
 create mode 100644 scripts/lib/devtool/ide_plugins/__init__.py
 create mode 100644 scripts/lib/devtool/ide_plugins/ide_code.py
 create mode 100644 scripts/lib/devtool/ide_plugins/ide_none.py
 create mode 100755 scripts/lib/devtool/ide_sdk.py

-- 
2.43.0


