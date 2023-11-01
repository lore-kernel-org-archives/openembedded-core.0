Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB23C4167D
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 11:01:49 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.4298.1698836500885847714
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 04:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M1zG1b3U;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9c5b313b3ffso993465566b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 04:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698836499; x=1699441299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nOFiV1e3p4/ELYpJINSXKvzt4miWvtYhv8sIEmTd7Es=;
        b=M1zG1b3ULgehkbCb8/QjNgGHnPYUZ6l8KgnVIBQxqK7t9rVTftTjABHkaTMGKvom8W
         wCaLKnjCbF0Bw58a+MG15CsclvF1TJ/KEM3XribObINw8jF/2Wclw/WZXf8fPDuR6/yR
         A2wuU7sspINsrj6sIc6aXgqEnELFmHR+rEjw/8AL+LK5bL7897wBGMeMP2k43g86KF8I
         pSG8wNAR3OpW+HvyL0z1SJFYhMOCLAO3Wpe6IVFijyA66eNkQM7E1a6/ubhPxr0FlwQE
         X1ZX7+jfOG3WZJtzv0SlZhC1Sx/D4wa/y0PJ9iZDOFUq1l4AuTZJoirctTPpFH1abIFY
         B0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698836499; x=1699441299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nOFiV1e3p4/ELYpJINSXKvzt4miWvtYhv8sIEmTd7Es=;
        b=UuvFmhYGEDevrNplFhCaer5ddjgfQNH2mTBFeuUW+mt2Ph/mSPoIA1xe94oja37sdG
         zlxuxopbPKbpXQSiFFjhece1MyXmS/gqgnWA1i5roOW1VeAGd9AUE6I6UYDcbaJUmcgg
         e/soidoieTSQC9yJSbZRdHYCKKsrLZGpUvesIVOKnuqx28Cih57TicOHAzY+XMSozQnt
         1V3xYXAuj3t1AyjCX+nv0ADQ1BB9t/jYplLTHfnXCPodA4qlcMK7GHIuZizTu7rhJuWA
         nt5gSas1gxadvJOG+cRluSFOybXW5FJghhvUjl/IZ2q4YquqG78RFtI3Ojn0SVzZJ96M
         f5iw==
X-Gm-Message-State: AOJu0YyMDLqA1GmEpZTlub2TjfAvT+hGm+Y2VOzC4GQUoqFPejxRXE51
	LdfkyT3kdf336jzAIQKZoroHvE2ji74=
X-Google-Smtp-Source: AGHT+IEW1xTM/cjPNWpLMbEKhiTv/vJXj7jaBqr7hRC+hDmPoYyqI/Hnco4QlzPJQqcuioyLyIOPpw==
X-Received: by 2002:a17:907:26c5:b0:9d1:92bb:ce58 with SMTP id bp5-20020a17090726c500b009d192bbce58mr1620487ejc.24.1698836498778;
        Wed, 01 Nov 2023 04:01:38 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id m12-20020a17090607cc00b009c7608eb499sm2262426ejc.94.2023.11.01.04.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 04:01:38 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v8 0/8] devtool ide plugin
Date: Wed,  1 Nov 2023 12:01:21 +0100
Message-ID: <20231101110129.647878-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 11:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189899

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
 documentation/sdk-manual/extensible.rst       |  153 ++-
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
 meta/lib/oeqa/selftest/cases/devtool.py       |  274 +++++
 scripts/crosstap                              |   28 +-
 scripts/lib/devtool/__init__.py               |    5 +-
 scripts/lib/devtool/deploy.py                 |  230 ++--
 scripts/lib/devtool/ide.py                    | 1095 +++++++++++++++++
 scripts/lib/devtool/ide_handlers/__init__.py  |   23 +
 scripts/lib/devtool/ide_handlers/ide_base.py  |   46 +
 scripts/lib/devtool/ide_handlers/ide_code.py  |  420 +++++++
 scripts/lib/devtool/ide_handlers/ide_none.py  |   91 ++
 31 files changed, 2580 insertions(+), 183 deletions(-)
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


