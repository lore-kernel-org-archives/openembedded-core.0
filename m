Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C20BEEB57D
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 16:19:29 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.39050.1694362761146656281
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Sep 2023 09:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=EJphr1fY;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-31f71b25a99so3308053f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 09:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694362759; x=1694967559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wTPQDg3VdOGUx+vwPS/cNOaRaEiO5tJPDqIsTq0foZo=;
        b=EJphr1fYgHxI69lg8OyrUCYHGFuoSBSEMcbOX4sWurjT4C5jJswK9W6DqhSWlyJeiU
         QTyNmapvtfU1gTMhpGSieXAMUEcF6c0rOCVE4Au8CInuY0kM229WfJeRJM9GgfK19Rnd
         44uwFDWeYL9HoXkfYLkRRxrh+TzjJD6CqOuoSXR8WQD+YUnnTCpkwYbYl2GkvsFVHf/q
         /CKUWFy5m2HjkkR1tW1atJeqz18K904ulQNqhVxIjt/clNQN/NQwuA6xtkdhYyttzguf
         agtkTKzslS4OD9RNbN4cv8OO1+jxkGr5QlrSswOienxuKO/A3oI4nsNAXJqfOrFzzeMD
         f50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694362759; x=1694967559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wTPQDg3VdOGUx+vwPS/cNOaRaEiO5tJPDqIsTq0foZo=;
        b=aZlii76Cf1qbiCxtbeIWyOm1YyfhvxhSgAp6J0q8oN8lhlM8KshAVnb0wiB5SOVS9/
         vrCPcYh9RpYzuFM1DBg4wCb9Xil/yFIbmuzCzM69qJw+631HwDvL+doJCAQYmRMZS59S
         q5r3mLNWtIGINczYaM0pdGtqfyRTASkvb6+AWfaLzWcImWiZNjHVfQASRfi7rqIC9qux
         sXSS3tfhIe8TrX1avTAwIEUvnOhZ1JycYF0C76LOzQhu5ZoLBJt7ShdW16VxIXcHeQFW
         iSolMqYlAwkHQ1ikMx0XJq5fT5VVjFIBMFVYyh57vvJUVGfW1HS5UOgVD8C9uEPzOHPh
         lXfQ==
X-Gm-Message-State: AOJu0YxKOTgK8XqTSDv+9m7YlprhgSxhvJoITZ/jnYrRHcx1suXL+RsZ
	DXNIRe3Iml7Zuu5Px0seewR4rHKHN2M=
X-Google-Smtp-Source: AGHT+IEl8sX8SroyE9/Rw/0e3MgUhhd1XUR0xRSwN947RUMsSqKTxHf2U7Xalocw6BDbHk99tQUXjg==
X-Received: by 2002:a5d:50c5:0:b0:317:eee2:6fba with SMTP id f5-20020a5d50c5000000b00317eee26fbamr6463261wrt.40.1694362758896;
        Sun, 10 Sep 2023 09:19:18 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:dcf2:2f65:9442:83f])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d408c000000b003142ea7a661sm7605431wrp.21.2023.09.10.09.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 09:19:18 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH v6 00/12] devtool ide plugin
Date: Sun, 10 Sep 2023 17:52:26 +0200
Message-ID: <20230910161850.4032227-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 16:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187458

Changes in comparison to v5:

Fix the oe-selftests 
  AssertionError: 127 != 0 : cmake-example failed: sh: cmake-example:  not found
  and
  AssertionError: 127 != 0 : mesonex failed: sh: mesonex: not found
Since v1 of this patchset, there has been more than one problem that caused the autobuilder to abort with the same error. The hopefully last error is now probably fixed as well. The main cause was that the test case did IMAGE_INSTALL += instead of IMAGE_INSTALL:append.
Unfortunately, I had the same IMAGE_INSTALL:append in my local.conf file which made the bug invisible in my test runs. The v5 run on the AB led me in the right direction in the improved error message.

With the v5 tests running on the AB there were also test_devtool_add_fetch_git failures.
I just can't see any relation between my changes and this error. It's also a bit strange that this error didn't occur with previous versions of almost the same patches. Please let me know if I should investigate further. 




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


Adrian Freihofer (12):
  vscode: add minimal configuration
  cmake.bbclass: support qemu
  devtool: new ide plugin
  tests: add a C++ example recipe
  cpp-example: workaround for pseudo breakeage
  refactor: make multiprocess_launch callable without d
  refactor: make strip_execs callable without d
  devtool: refactor deploy-target
  devtool: ide make deploy-target quicker
  oe-selftest devtool: refactor runqemu pre-requisites
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
 meta/classes-recipe/cmake.bbclass             |   21 +
 meta/conf/bitbake.conf                        |    2 +-
 meta/lib/oe/package.py                        |    7 +-
 meta/lib/oe/utils.py                          |   12 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |  227 +++-
 scripts/lib/devtool/__init__.py               |    5 +-
 scripts/lib/devtool/deploy.py                 |  230 ++--
 scripts/lib/devtool/ide.py                    | 1185 +++++++++++++++++
 24 files changed, 1928 insertions(+), 142 deletions(-)
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


