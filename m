Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128D8C4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 13:59:31 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.74254.1705931962872155059
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 05:59:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cc1vmU/e;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a2cea0563cbso476966966b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 05:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705931961; x=1706536761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6EhOzY/G6xN2OmB939erCCWG6Ej3KFlVEGbJjvqi3c4=;
        b=cc1vmU/e2cVETfV2Q/keNh9t6B2SBI26JFnKfaGkGldV6RqoO3kO7E/9IKe/oRuQNl
         xMHL1E88jTS7thiIMMWXmE4VurOTie3QcavkT2OaR9UzpXEU3CWQfj3LUfHVq3TE6Pju
         M2+P7ydrq8sCG6t9Ajjupag1u01lQW5fRf3TryglHrI2JI3tiChta5FReTg3CLEIji+7
         gi51Y8f2pcATI8eHCol0NLTTiiZx6S93B7iBOvE5owM349Y3nxGsDQvJYFZP6XhWP/mz
         VCDBsWKIBGPXz9eRu0a/ceDEVWUTJllz9TWTuRdWlX5PhesGTkypPekNAVvZt+cp91o0
         gXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705931961; x=1706536761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6EhOzY/G6xN2OmB939erCCWG6Ej3KFlVEGbJjvqi3c4=;
        b=UM7rU7AsQl1pxaD7wKzoVo7eiDVlswwWtd8nDmd1T6p2bi2KK+JqAgRUXaYBksQ7VM
         S9y6Hhi31pzqlYfHbQBTSk2CJYhFMgCtHo5JhCZsvaaBqwK1eyT2ISEFKN7dUWmNZpkf
         xnzzFFY44nbo2RTIl6XQC7k+Uy35SaWGd2fw/UtU2AIZKWz4YbPFUbDfcdctvbkX9vNL
         +30H6CCcC5ewpHUeStp8A+3S53MD75GvfWK0nIFibRIvwgu7zrGqpr0RUiaU2e0+9E7O
         yiBKhizHOhMHHr5NwMxDcFm5+31Ba/os/0AcUdEfPg5fKsr+ULf/3KpFqSK/t20HmAn5
         vA8g==
X-Gm-Message-State: AOJu0YyV6HDQRdymNHI5rjQl5EZv0PIANoqccICPfySIfArbYzxtAxww
	GxVbqGg10PzyuE3vXohKdrRVkRw6HzCEr7u14DmzC7gknmP6K/4D1lq7vc2t
X-Google-Smtp-Source: AGHT+IHagdnpVMixm49tBUkIx+UQsJJzqQo3liHeuWywvHZ6rlhJGBQwt6gI8DasnM3P07InaPHWvg==
X-Received: by 2002:a17:906:7142:b0:a2c:fd6c:41be with SMTP id z2-20020a170906714200b00a2cfd6c41bemr2203120ejj.58.1705931960653;
        Mon, 22 Jan 2024 05:59:20 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id vw15-20020a170907a70f00b00a2d0595cd0dsm11568513ejc.86.2024.01.22.05.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 05:59:20 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v10 0/9] devtool ide plugin
Date: Mon, 22 Jan 2024 14:58:18 +0100
Message-ID: <20240122135901.171596-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 13:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194149

Changes from v9 to v10:
- Fix a bashism issue which was the root cause for the failures on the
  AB Debian and Ubuntu hosts:
  https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6257/steps/14/logs/stdio
  https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2751/steps/14/logs/stdio
  https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6317/steps/14/logs/stdio
  Learning:
    . oe-init-build-env build-folder
  does not work. Sourcing scripts with arguments requires bash.
- Fix a non-reproducible issue. Python os.listdir and os.walk return the
  files in undefined order. This was the root cause for:
  https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6318/steps/14/logs/stdio
  Fixed by sorting the list.
- Fix a bug in the fall-back to devtool build and deploy-target mode.

Changes from v8 to v9 (repeated since v9 was not passing the AB):
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
 scripts/lib/devtool/ide_plugins/ide_code.py |  438 ++++++++
 scripts/lib/devtool/ide_plugins/ide_none.py |   53 +
 scripts/lib/devtool/ide_sdk.py              | 1065 +++++++++++++++++++
 10 files changed, 2716 insertions(+), 119 deletions(-)
 create mode 100644 scripts/lib/devtool/ide_plugins/__init__.py
 create mode 100644 scripts/lib/devtool/ide_plugins/ide_code.py
 create mode 100644 scripts/lib/devtool/ide_plugins/ide_none.py
 create mode 100755 scripts/lib/devtool/ide_sdk.py

-- 
2.43.0


