Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63645EE49AB
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 22:27:43 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.2556.1693002458454837785
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 15:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Y801CTV8;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-51bece5d935so1929375a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 15:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693002457; x=1693607257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R/7qBCrwx6RDuIXm9VldKZ+TqqMAvtgdaXE8NmRFsT8=;
        b=Y801CTV87XkwuBRZ2K7EJaS1NrECRHlzQTIjSQIsz0Nx7ndUIziGaf9ZSbNqvYT0uE
         APfXv6+zvmxLJLE3VRvHsw8gOG0rRfL2bqyJ0sdNTDNrGccuH+8ZpBhEbV49ynSVfUio
         7WsSbVgGUg2yK5tWm2oTIrZhYBmSdqHboJuoDQocwDnzOlI+y8nsm6GCvvURdNkrw7/Q
         1lAzi6q5Eh2HpsOsIMSv+KA6QW5/WHgC7MtPu6XgKthLlnXMts7/xTs5bxe3S5zy0Hde
         CT634BxiVBCi4I6KJAAWphKtxeWWEdPDlTfuYt7uH7UAHUZCnY0OtUsd/GUlG7ULFuq/
         O5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693002457; x=1693607257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/7qBCrwx6RDuIXm9VldKZ+TqqMAvtgdaXE8NmRFsT8=;
        b=EA5dIjwbIKAMc1KB1pDXXARdZofE/4PDMJnk/eDwIe1DRj851VJFnT+ObMd1EkBbqo
         YcfM+kRMKYKzBdhxcIIhja01W7zcApETaggh5Q/d1DNQM7nbir6giwgAP996Zw5Zwr7D
         BM5bzBIlCx9n3SvWo7eigWI4qyuF/hR3q0WRGLCZ1n60b3u1r+7McInU07jZqdkt0vKq
         8qqfIB71XrsWldAIeIj3XP0gbX1eM+dEal/IvqKdS75TEhMXrqaOrUTPO7K/JG83FHDC
         pDb5n/YNljKKNGRHPon9xamKO5jKk4IcHxiAEs3SrHnZV8cwI1w+rRkfs4CHbutx/g6p
         /QUA==
X-Gm-Message-State: AOJu0YzKbiglmoig3p/mkiERaNiMpBBTdvRZhKqnxgmVXP1M47ixRkMQ
	lUHFI5mky7ldSgRAGxF2ZHnvRO7XYIY=
X-Google-Smtp-Source: AGHT+IElDyLJ00lrwRX6/gkon0NlCKtIrDAhssF1VFgilu/uvsD1aIkrEhuJLF6T2TCLWd+Ui1T1WQ==
X-Received: by 2002:aa7:d790:0:b0:523:b37e:b83d with SMTP id s16-20020aa7d790000000b00523b37eb83dmr15536864edq.41.1693002456339;
        Fri, 25 Aug 2023 15:27:36 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id n24-20020aa7d058000000b0050488d1d376sm1449057edo.0.2023.08.25.15.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 15:27:35 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 00/13] devtool ide plugin
Date: Sat, 26 Aug 2023 00:25:40 +0200
Message-ID: <20230825222711.2735745-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 22:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186727

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
 .vscode/settings.json                         |   29 +
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
 23 files changed, 1880 insertions(+), 140 deletions(-)
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


