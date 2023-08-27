Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFECC83F10
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 19:32:29 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.4405.1693164745401023047
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 12:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hFchI7fl;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-99c93638322so532958266b.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 12:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693164743; x=1693769543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1MN05mWP0vgSr2IlnoLxDAvFvZRlIOgmeR9aWGJeWv0=;
        b=hFchI7flEtk/M51sdzKHlkqn/lJPEcjBnhMfuvifWzRaYB+9tmVLyH0Dpc1m9xtCy6
         W+lOyvSv56Vzt8qrdbB2XOHDm8zp/SL6jsIwaDamh+EYFxT+0mdyetfXw+pI7nKJrleB
         xyf5MIwV6SqACFs6iPt0y50z/+1SKSibsOIed9CIZP/u/kBLE453qFP8i7oqR2reS16r
         yAQ9yQu0wt7CwG8smRAgPSAkM+jggwVbbITgS1yz4FDdo/OcHdupOqWn1GfhJoQkyvSE
         aevMrC0ow65BIA4kwWm80QfGC3JjtBzLSvOKYlzBF3r5yFWA4ub/zmLiOQkwilQcd8di
         eAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693164743; x=1693769543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MN05mWP0vgSr2IlnoLxDAvFvZRlIOgmeR9aWGJeWv0=;
        b=DMCm/N2ZANHH4ogEWXdByp2AFCGZCCEWy3U0I5nMevtqtfSuWBrGOmh9idDiTUp1mh
         ZRx02ACSPOBlwQoopU/8bcne+SqZvhicvhKVOK3N1b6jCNvvxnSJ5F7MfuRPjpXK4h3w
         083FYIyvd+fRrWP6iMA0Zbap6cPZuDoOOiBJPxEkPYNXPtTDHSVZ/WCMoAi4aqsNPlNV
         0RHuDes+YQjBbHCrgfHmAhFHbagzlZBxZmBp/hS/UruF0zQM0ZLJNf52j9QM2Q3KKsSi
         aadjF+DavKIU9JaBBUOc5aALXQDtIHK/JVSVZsL3OWoxgggGLZO61PMmbfrZYDrXfPca
         GD1Q==
X-Gm-Message-State: AOJu0Ywa6oRkKl6R4lH3lO9NLK3n6fXeW75SXJJb2ycm6wbGbedHN1jc
	ZQ8m09IMxHum9RPE58uEVEJ7J0dQ/5Q=
X-Google-Smtp-Source: AGHT+IHmTufdmF7wutHr1sQy0Rsrp3uTOXAPapp6E2Z5uqU5M9FxHCPeL6S7Sa8WHE+iV07SC13lVA==
X-Received: by 2002:a17:907:628f:b0:9a1:ad4b:f9e9 with SMTP id nd15-20020a170907628f00b009a1ad4bf9e9mr18764065ejc.32.1693164743281;
        Sun, 27 Aug 2023 12:32:23 -0700 (PDT)
Received: from t14s-af._sites.dc._msdcs.ad007.siemens.net ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id lv12-20020a170906bc8c00b009a19701e7b5sm3740261ejb.96.2023.08.27.12.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 12:32:22 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 00/13] devtool ide plugin
Date: Sun, 27 Aug 2023 21:29:42 +0200
Message-ID: <20230827193200.4083340-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 19:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186780

Changes in comparison to v3:
- Add workspace/attic fodler to vscode ignore lists.

Changes in comparison to v2:
- Fix the oe-selftests to run on a mchine without vscode installed


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

- There is still a lot of room for improvement. But nonetheless, it provides a first implementation that could be integrated into the core, I think. Unfortunately there was no feedback on my RFC at https://lists.openembedded.org/g/openembedded-core/message/183819 so far.
- Support for more build-tools and programming languages as well as more IDEs should be possible. To prove the extendability 2 of both are already supported.


Adrian Freihofer (13):
  vscode: add minimal configuration
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

 .gitignore                                    |    2 +
 .vscode/settings.json                         |   32 +
 documentation/sdk-manual/extensible.rst       |   97 +-
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
 scripts/lib/devtool/__init__.py               |    5 +-
 scripts/lib/devtool/deploy.py                 |  230 ++--
 scripts/lib/devtool/ide.py                    | 1185 +++++++++++++++++
 23 files changed, 1883 insertions(+), 140 deletions(-)
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


