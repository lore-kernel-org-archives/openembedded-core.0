Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70B0C4167D
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 21:32:15 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.171472.1698701532261341572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 14:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JFSINgUB;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40839807e82so29619155e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 14:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698701530; x=1699306330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sj2JaepTdlcWJnLkaS//pcHi9WQU6sDX+XaJ1s5qWNw=;
        b=JFSINgUBTGY5sPfEsTrvSR+Z0nkCfp6UzfJbn5kLcSyv/MZvnrZLhd/O+Nm8kb8uV8
         +O8/zAgWQ9fH542WOhzI24+suaPl3+DUXe7YUs9oYMTKDIzPGSX8MwMXbeDOKTWEs/J9
         Ff6pX1TQ2j5UG2hYVcUQrsMHcaiXe2XMRCUDGFjht0H80LvZKjfPHoI2KfUXDsZyVQhQ
         oQlhGIyFM3m1mfPjJqOBPNwClZbxS7GvtujASuteFV+OQR6Iw90Gh0QkVMKORsSKQvcL
         HBeQtXE9l1G6iUdPhMYMk1mGvAfDjIa1FzXXfeIho0ulR2KLmtjY7T1L6OJuWVVd7CK5
         Zc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698701530; x=1699306330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sj2JaepTdlcWJnLkaS//pcHi9WQU6sDX+XaJ1s5qWNw=;
        b=YXQZMs/mMmzJUdZPr0x7kfu4kVV2SfttIOYszi6TY74moM9K/C+cwrJFvDUohqi/8k
         10RX6lpIy904Bhib3ZxF2WusvKtdffwbQcVrnUeYTGsBt4werSynuJJfUtSkWrUR3jpS
         ohWWPWJbMBLKpvr7PyrhHSqNhS4sd5L1oIwpPz9OqaSBDiNy+vWEqU9mzESGpm+uZov6
         KXqpOBpe5+6Q9zjomT9rRlMlGAX+0hYWFUcaYbu6DvJmyi/ZIiVuJznLYUmuv1PqOO28
         K9mTNuYNQXyOkqqOzsXtBEDYKBHsi9md9D0pMpZnS7c29gSmd0i3unhmlre1U2sKrTAd
         HwRw==
X-Gm-Message-State: AOJu0YytzuM1t2uYsiHbGF2ElPqXu/cU6GguaPGDhpTw2CQPUr25Y8fW
	NcPUuFsHlmRb7BPeM5EhHg1MR4HMwWQ=
X-Google-Smtp-Source: AGHT+IFkYB8N4ah8bsrZwo12AKu20Q8ccu0VucT6Cffgr5DZAzMDOEhyDkwlX2tn8o7YNW9k9JWPBA==
X-Received: by 2002:a05:600c:1987:b0:402:f91e:df80 with SMTP id t7-20020a05600c198700b00402f91edf80mr851661wmq.3.1698701529998;
        Mon, 30 Oct 2023 14:32:09 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id h6-20020a05600c350600b003fc0505be19sm304811wmq.37.2023.10.30.14.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 14:32:09 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v7 0/8] devtool ide plugin
Date: Mon, 30 Oct 2023 22:31:57 +0100
Message-ID: <20231030213205.2824790-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 21:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189812

Changes in comparison to v6:

- Fix findigs: https://lists.openembedded.org/g/openembedded-core/message/188995
  - Major refactoring to split IDE specific parts into separate files
  - Use bindir for gdbserver
  - Remove pontless warning for debuginfod
  - Simplified searching for debug symbols
  - Added a new patch that makes the behavior of image-combined-dbg.bbclass the
    default behavior of rootfs-dbg. I think this solves a whole bunch of problems
    not only for GDB but also for all the other tools that need the debug symbols.
- Dropped the workaround for the pseudo breakage with sources in tree
  After a cleanup and improving the script to better replicate what bitbake does
  I was no longer able to reproduce the issue.
- Improve the default behavior for not yet supported build tools. devtool build
  and devtool deploy-target are called.
- Improve the tests:
  - Start Qemu only once (it's expensive)
  - Test also the ide=none
- Improve documentation about the no recipe mode (to docs mailing list)
- Details and bug fixes

According to https://www.yoctoproject.org/community/yocto-project-engineering-request-for-quotation/
one of the proposed areas for development of the Yocto project is "VSCode IDE Integration - New developer tooling".
One aspect of this larger topic is helping application developers configure the IDE to work on a recipe's source code using Yocto's eSDK. This patchset provides a new devtool plugin (devtool ide) that does this fully automatically for recipes inheriting the cmake or the meson bbclass. Support for more programming languages and build tools may be added in the future.

Let's start with a brief introduction of how it looks like from a user's perspective.

Reference setup
---------------

$ . oe-init-build-env

Add the following layers to bblayers.conf file:
- meta
- meta-poky
- meta-yocto-bsp
- meta-selftest

Add the following to the local.conf

IMAGE_GEN_DEBUGFS = "1"
IMAGE_FEATURES += "ssh-server-dropbear debug-tweaks"
IMAGE_INSTALL:append = "\
    cmake-example-ptest \
    meson-example-ptest \
    gdbserver \
"

Working on a recipe
-------------------

Note for those who "hate cmake with passion": Replace cmake by meson in the following commands.

1. Add the recipe which should be modified to the workspace

   $ devtool modify cmake-example

2. Build the eSDK. This provides all the host tools as well as an image which can be used on the target device.
   Since everything is built with one bitbake command also all the debug symbols are expected to be consistent.

   $ devtool ide cmake-example core-image-minimal

3. Install the image on the target device or simply use Qemu

   $ runqemu

4. Start VSCode

   $ code "$BUILDDIR/workspace/sources/cmake-example"

5. Work in VSCode, after installing the proposed plugins

   Ctrl + Shift + p, cmake Select Configure Preset
   Ctrl + Shift + p, cmake Build

6. Execute the unit tests on the host works with Qemu even for cross compiled test executables.

   Ctrl + Shift + p, cmake Test

7. Remote debugging with GDB

   Ctrl + Shift + p, Run Task --> install && deploy-target cmake-example
   F5 (Debug configuration might be selected before)

8. Work on the recipes and call bitbake again to get the SDK updated.
   Building the application by calling cmake (from the IDE) or by calling bitbake or by calling devtool build is expected to produce the exact same results. To make that possible, the devtool ide plugin is designed to configure the IDE to call cmake with the exact same configuration as used by bitbake when building the recipe. Unlike the eSDK, the goal here is clearly that there is no longer a separation between the SDK and the application development process. Regardless of which tool is called, the same source files are edited and the same o-files are generated and re-used.

Working with a SDK without a recipe
-----------------------------------

If devtool ide is called for a recipe named none or meta-ide-support the eSDK with its generic environment file gets generated.
In case of using VSCode and cmake in addition to the well known environment file a cmake-kit
https://vector-of-bool.github.io/docs/vscode-cmake-tools/kits.html is added to the User-Local Kits.
This allows to work with cmake calling the cross-toolchain out of VSCode or a shell with the environment file sourced.

Design
------

The goal of this implementation is to create a configuration for VSCode (or other IDEs) that allows to work on the code of a recipe completely independent from bitbake. bitbake is only called if the configuration or the whole SDK has to be regenerated. But bitbake should not need to be called while working in the IDE. This has two major advantages over calling devtool build from the IDE:
- The IDE provides plugins for integration with cmake, for example. These features are usable, which would not be the case if bitbake or devtool are called from within the IDE.
- It is much faster.

Supporting other IDEs
---------------------

Focus is currently VSCode. But a paramter "--ide=none" is already supported.
With this paramter passed, no VSCode specific config files are generated.
Instead, simple scripts are generated, which should be suitable for integration with other IDEs.

Testing
-------

Reasonable but not yet complete test coverage is provided by:

$ oe-selftest -r devtool.DevtoolIdeTests

What's next?
------------

- Support for more build-tools and programming languages
- Support for more IDEs

Known bugs
----------

- IntelliSense with meson does not work. meson and ninja generate a compile_commands.json which requires to have the compiler in the PATH. (cmake generates the same file with absolute path.)

Adrian Freihofer (8):
  vscode: add minimal configuration
  cmake.bbclass: support qemu
  image-combined-dbg: make this the default
  tests: add a C++ example recipe
  devtool: refactor deploy-target
  devtool: new ide plugin
  oe-selftest devtool: ide tests
  docs: cover devtool ide

 .gitignore                                    |    2 +
 .vscode/settings.json                         |   32 +
 documentation/sdk-manual/extensible.rst       |  158 ++-
 meta-selftest/recipes-test/cpp/.gitignore     |    1 +
 .../recipes-test/cpp/autotools-example.bb     |   18 +
 .../cpp/autotools-example/run-ptest           |   10 +
 .../recipes-test/cpp/cmake-example.bb         |   17 +
 .../recipes-test/cpp/cmake-example/run-ptest  |   10 +
 .../recipes-test/cpp/cpp-example.inc          |   24 +
 .../recipes-test/cpp/files/CMakeLists.txt     |   60 +
 .../recipes-test/cpp/files/Makefile.am        |   13 +
 .../recipes-test/cpp/files/configure.ac       |   11 +
 .../cpp/files/cpp-example-lib.cpp             |   17 +
 .../cpp/files/cpp-example-lib.hpp             |   16 +
 .../recipes-test/cpp/files/cpp-example.cpp    |   16 +
 .../recipes-test/cpp/files/meson.build        |   34 +
 .../cpp/files/test-cpp-example.cpp            |   20 +
 .../recipes-test/cpp/meson-example.bb         |   17 +
 .../recipes-test/cpp/meson-example/run-ptest  |   10 +
 meta/classes-recipe/cmake.bbclass             |   20 +
 .../classes-recipe/image-combined-dbg.bbclass |   15 -
 meta/lib/oe/rootfs.py                         |   35 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |  274 ++++
 scripts/crosstap                              |   28 +-
 scripts/lib/devtool/__init__.py               |    5 +-
 scripts/lib/devtool/deploy.py                 |  230 ++--
 scripts/lib/devtool/ide.py                    | 1104 +++++++++++++++++
 scripts/lib/devtool/ide_handlers/__init__.py  |   10 +
 scripts/lib/devtool/ide_handlers/ide_base.py  |   46 +
 scripts/lib/devtool/ide_handlers/ide_code.py  |  420 +++++++
 scripts/lib/devtool/ide_handlers/ide_none.py  |   91 ++
 31 files changed, 2581 insertions(+), 183 deletions(-)
 create mode 100644 .vscode/settings.json
 create mode 100644 meta-selftest/recipes-test/cpp/.gitignore
 create mode 100644 meta-selftest/recipes-test/cpp/autotools-example.bb
 create mode 100644 meta-selftest/recipes-test/cpp/autotools-example/run-ptest
 create mode 100644 meta-selftest/recipes-test/cpp/cmake-example.bb
 create mode 100644 meta-selftest/recipes-test/cpp/cmake-example/run-ptest
 create mode 100644 meta-selftest/recipes-test/cpp/cpp-example.inc
 create mode 100644 meta-selftest/recipes-test/cpp/files/CMakeLists.txt
 create mode 100644 meta-selftest/recipes-test/cpp/files/Makefile.am
 create mode 100644 meta-selftest/recipes-test/cpp/files/configure.ac
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example-lib.cpp
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example.cpp
 create mode 100644 meta-selftest/recipes-test/cpp/files/meson.build
 create mode 100644 meta-selftest/recipes-test/cpp/files/test-cpp-example.cpp
 create mode 100644 meta-selftest/recipes-test/cpp/meson-example.bb
 create mode 100644 meta-selftest/recipes-test/cpp/meson-example/run-ptest
 delete mode 100644 meta/classes-recipe/image-combined-dbg.bbclass
 create mode 100755 scripts/lib/devtool/ide.py
 create mode 100644 scripts/lib/devtool/ide_handlers/__init__.py
 create mode 100644 scripts/lib/devtool/ide_handlers/ide_base.py
 create mode 100644 scripts/lib/devtool/ide_handlers/ide_code.py
 create mode 100644 scripts/lib/devtool/ide_handlers/ide_none.py

-- 
2.41.0


