Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B22EE49AC
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 16:11:47 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.1045.1692634304093286796
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 09:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=a2SJ7Ysf;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so9517258a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 09:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692634302; x=1693239102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wMYjuv8etVBtZ7Sbs81bYlzvPXRsGTUogJZulbapQKU=;
        b=a2SJ7YsffBHbmYaDBgDs3t33VcT9oyGE2xTNKghl1S2+scIewa6hllAEiORf8QuFL6
         5K4OnQblryQF3wUjB2m82BYD/3QB9QwT+YAsIIurzJiF3FexHCkqXgRyLxr7BnDWJd1X
         CHlPSZDc/jFO5NLl1QZMP8it3qou9Ng2f2M3aklxfUXpHfwG32U9XVjIw3/lH5Ec4BIE
         DAPIW3jeneLoiFEXFVzO6zJf4hfzbG1W8rjxO2kTQZzBe7Bc4dQ7H24DAd4yWenZ8cCB
         xbWbeRHjdBp4ds79VkVl//CpCFgj6SHa+W7k/KD2tvoWrxSxJWNhp5lWeAshFqy8KxyZ
         Dw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692634302; x=1693239102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wMYjuv8etVBtZ7Sbs81bYlzvPXRsGTUogJZulbapQKU=;
        b=WW0BU8mSIyD17xQPx0FkoCrsvJkBD7KzziIXCvxQvc+rlXN31uF6a882hkDVvBhIT3
         24ZOVmFUozRvmXGpREy/b2kTgzZIc+UB36VnKslb60/pHG/TKCyNRW6lZthHJTF/lENf
         XsEhIStXPD+DruZVRrlBbblnnCpDFcwQdiHFVCrEWws/I6NJn9bZGsu/0wZb73+t9z4C
         F9M8+jkMZ96YgTL2sBXMjr/mjaQi625oJ6eCfSnD5RaDSN73zEkLzG25r/H8+FVZ5wPe
         GvGQHC/lftDf9nVa9a5UX8lS8vpQKGbJG+R3oCVTJscm8sJnOjDog4sMZ/rhdNBFT8GL
         cuvA==
X-Gm-Message-State: AOJu0Yy0EyBiIhNKSQAIpLgO5/LunSYNIxkPIyQRgZVt1ikwL70JOXZs
	4v6ANfC4g73/rPNffhozfmryOGzFPzM=
X-Google-Smtp-Source: AGHT+IE3RE4L9X3D+uV6C3FHMtdMFHUC0u+eY1yG4vYE7fammgIXK9c6XuNPiKtiVWNuicCcu6v+ow==
X-Received: by 2002:aa7:de12:0:b0:522:3149:159b with SMTP id h18-20020aa7de12000000b005223149159bmr8293284edv.2.1692634302003;
        Mon, 21 Aug 2023 09:11:42 -0700 (PDT)
Received: from t14s-af._sites.dc._msdcs.ad007.siemens.net ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id x21-20020aa7dad5000000b0052284228e3bsm6175579eds.8.2023.08.21.09.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 09:11:41 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 00/14] devtool ide plugin
Date: Mon, 21 Aug 2023 18:07:03 +0200
Message-ID: <20230821161120.171956-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 16:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186463

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

IMAGE_CLASSES += "image-combined-dbg"
IMAGE_GEN_DEBUGFS = "1"
IMAGE_FEATURES += "ssh-server-dropbear"
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

- There is still a lot of room for improvement. But nonetheless, it provides a first implementation that could be integrated into the core, I think. Unfortunately there was no feedback on my RFC at https://lists.openembedded.org/g/openembedded-core/message/183819 so far.
- Support for more build-tools and programming languages as well as more IDEs should be possible. To prove the extendability 2 of both are already supported.


Please note that the first 2 patches should probably not be merged. But something like that is reuired to work with VSCode without OOM exceptions.


Adrian Freihofer (14):
  gitignore: vscode bitbake plugin folder
  build: vscode configuration
  cmake.bbclass: refactor cmake args
  cmake.bbclass: cleanup spaces and tabs
  cmake.bbclass: support qemu
  devtool: new ide plugin
  tests: add a C++ example recipe
  cmake-example: workaround for pseudo breakeage
  refactor: make multiprocess_launch callable without d
  refactor: make strip_execs callable without d
  devtool: refactor deploy-target
  devtool: ide make deploy-target quicker
  oe-selftest devtool: ide tests
  docs: cover devtool ide

 .gitignore                                    |    1 +
 .vscode/extensions.json                       |   11 +
 .vscode/launch.json                           |   27 +
 .vscode/settings.json                         |   30 +
 documentation/sdk-manual/extensible.rst       |  100 +-
 meta-selftest/recipes-test/cpp/.gitignore     |    1 +
 .../recipes-test/cpp/cmake-example.bb         |   23 +
 .../recipes-test/cpp/cmake-example/run-ptest  |   10 +
 .../recipes-test/cpp/cpp-example.inc          |   24 +
 .../recipes-test/cpp/files/CMakeLists.txt     |   60 +
 .../cpp/files/cpp-example-lib.cpp             |   17 +
 .../cpp/files/cpp-example-lib.hpp             |   16 +
 .../recipes-test/cpp/files/cpp-example.cpp    |   16 +
 .../recipes-test/cpp/files/meson.build        |   34 +
 .../cpp/files/test-cpp-example.cpp            |   19 +
 .../recipes-test/cpp/meson-example.bb         |   17 +
 .../recipes-test/cpp/meson-example/run-ptest  |   10 +
 meta/classes-global/staging.bbclass           |    3 +-
 meta/classes-recipe/cmake.bbclass             |   70 +-
 meta/lib/oe/package.py                        |    7 +-
 meta/lib/oe/utils.py                          |   12 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |  133 ++
 oe-init-build-env                             |    8 +
 scripts/lib/devtool/__init__.py               |    5 +-
 scripts/lib/devtool/deploy.py                 |  230 ++--
 scripts/lib/devtool/ide.py                    | 1185 +++++++++++++++++
 26 files changed, 1929 insertions(+), 140 deletions(-)
 create mode 100644 .vscode/extensions.json
 create mode 100644 .vscode/launch.json
 create mode 100644 .vscode/settings.json
 create mode 100644 meta-selftest/recipes-test/cpp/.gitignore
 create mode 100644 meta-selftest/recipes-test/cpp/cmake-example.bb
 create mode 100644 meta-selftest/recipes-test/cpp/cmake-example/run-ptest
 create mode 100644 meta-selftest/recipes-test/cpp/cpp-example.inc
 create mode 100644 meta-selftest/recipes-test/cpp/files/CMakeLists.txt
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example-lib.cpp
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp
 create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example.cpp
 create mode 100644 meta-selftest/recipes-test/cpp/files/meson.build
 create mode 100644 meta-selftest/recipes-test/cpp/files/test-cpp-example.cpp
 create mode 100644 meta-selftest/recipes-test/cpp/meson-example.bb
 create mode 100644 meta-selftest/recipes-test/cpp/meson-example/run-ptest
 create mode 100755 scripts/lib/devtool/ide.py

-- 
2.41.0


