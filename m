Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E3DC83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 14:36:53 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.15653.1693406209414317738
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 07:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=J1POBjs+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7254FC0007;
	Wed, 30 Aug 2023 14:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693406207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TsHRaV+9eRjDwe39Qx8Pw9/D/YawRljEJGO2bdog6hA=;
	b=J1POBjs+ThOkN7mUzookFz9rSeJyKkLKCaYZ/zZqb01/5ILHgbzBENbb/z2iopZQMU8SdD
	Le2vDEOcgt6clLU6bo8jaOdOgJZt+2ap02YZSvDoZTKbpipEPDteDNNe2HFHF5GcQ1cIJD
	DUnOvIjKkuqidVDLfGhdCWXNJd22WSwJqe0U0VNuRTR6tSqKPoWNy75W9oTu849xL2P78O
	tTlIbL8BcxM0Eo/FhPgNewd05Xvxuary4whCZwut0FJNuDUaU3/Ecv7SLCDls3rBN4tZWr
	Qpk4AB3iTiFWOaYRfKLQRetz3raFIwIjtWwnHj/pJfSZ87XQQoeeKwOXjM0vJA==
Date: Wed, 30 Aug 2023 16:36:46 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: Re: [OE-core] [PATCH v4 00/13] devtool ide plugin
Message-ID: <202308301436460ab7d471@mail.local>
References: <20230827193200.4083340-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230827193200.4083340-1-adrian.freihofer@siemens.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 14:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186893

Hello,


This causes the following failures:

2023-08-30 14:00:30,617 - oe-selftest - INFO - FAIL: sstatetests.SStateHashSameSigs4.test_sstate_noop_samesigs (subunit.RemotedTestCase)
2023-08-30 14:00:30,617 - oe-selftest - INFO - ----------------------------------------------------------------------
2023-08-30 14:00:30,766 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/sstatetests.py", line 649, in test_sstate_noop_samesigs
    self.fail("sstate hashes not identical.")
  File "/usr/lib64/python3.9/unittest/case.py", line 676, in fail
    raise self.failureException(msg)
AssertionError: sstate hashes not identical.


2023-08-30 14:00:32,413 - oe-selftest - INFO - FAIL: devtool.DevtoolIdeTests.test_devtool_ide_recipe_cmake (subunit.RemotedTestCase)
2023-08-30 14:00:32,413 - oe-selftest - INFO - ----------------------------------------------------------------------
2023-08-30 14:00:32,413 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/devtool.py", line 2319, in test_devtool_ide_recipe_cmake
    self.__devtool_ide_qemu()
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/devtool.py", line 2256, in __devtool_ide_qemu
    self.assertEqual(status, 0)
  File "/usr/lib64/python3.9/unittest/case.py", line 837, in assertEqual
    assertion_func(first, second, msg=msg)
  File "/usr/lib64/python3.9/unittest/case.py", line 830, in _baseAssertEqual
    raise self.failureException(msg)
AssertionError: 127 != 0


2023-08-30 14:00:32,413 - oe-selftest - INFO - FAIL: devtool.DevtoolIdeTests.test_devtool_ide_recipe_meson (subunit.RemotedTestCase)
2023-08-30 14:00:32,414 - oe-selftest - INFO - ----------------------------------------------------------------------
2023-08-30 14:00:32,419 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/devtool.py", line 2327, in test_devtool_ide_recipe_meson
    self.__devtool_ide_qemu()
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/devtool.py", line 2256, in __devtool_ide_qemu
    self.assertEqual(status, 0)
  File "/usr/lib64/python3.9/unittest/case.py", line 837, in assertEqual
    assertion_func(first, second, msg=msg)
  File "/usr/lib64/python3.9/unittest/case.py", line 830, in _baseAssertEqual
    raise self.failureException(msg)
AssertionError: 127 != 0


https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5672/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5693/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5661/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5618/steps/14/logs/stdio

On 27/08/2023 21:29:42+0200, Adrian Freihofer wrote:
> Changes in comparison to v3:
> - Add workspace/attic fodler to vscode ignore lists.
> 
> Changes in comparison to v2:
> - Fix the oe-selftests to run on a mchine without vscode installed
> 
> 
> According to https://www.yoctoproject.org/community/yocto-project-engineering-request-for-quotation/
> one of the proposed areas for development of the Yocto project is "VSCode IDE Integration - New developer tooling".
> One aspect of this larger topic is helping application developers configure the IDE to work on a recipe's source code using Yocto's eSDK. This patchset provides a new devtool plugin (devtool ide) that does this fully automatically for recipes inheriting the cmake or the meson bbclass. Support for more programming languages and build tools may be added in the future.
> 
> Let's start with a brief introduction of how it looks like from a user's perspective.
> 
> Reference setup
> ---------------
> 
> $ . oe-init-build-env
> 
> Add the following layers to bblayers.conf file:
> - meta
> - meta-poky
> - meta-yocto-bsp
> - meta-selftest
>   
> Add the following to the local.conf
> 
> IMAGE_CLASSES += "image-combined-dbg"
> IMAGE_GEN_DEBUGFS = "1"
> IMAGE_FEATURES += "ssh-server-dropbear debug-tweaks"
> IMAGE_INSTALL:append = "\
>     cmake-example-ptest \
>     meson-example-ptest \
>     gdbserver \
> "
> 
> Working on a recipe
> -------------------
> 
> Note for those who "hate cmake with passion": Replace cmake by meson in the following commands.
> 
> 1. Add the recipe which should be modified to the workspace
> 
>    $ devtool modify cmake-example
> 
> 2. Build the eSDK. This provides all the host tools as well as an image which can be used on the target device.
>    Since everything is built with one bitbake command also all the debug symbols are expected to be consistent.
> 
>    $ devtool ide cmake-example core-image-minimal
> 
> 3. Install the image on the target device or simply use Qemu
> 
>    $ runqemu
> 
> 4. Start VSCode
> 
>    $ code "$BUILDDIR/workspace/sources/cmake-example"
> 
> 5. Work in VSCode, after installing the proposed plugins
> 
>    Ctrl + Shift + p, cmake Select Configure Preset
>    Ctrl + Shift + p, cmake Build
> 
> 6. Execute the unit tests on the host works with Qemu even for cross compiled test executables.
> 
>    Ctrl + Shift + p, cmake Test
> 
> 7. Remote debugging with GDB
> 
>    Ctrl + Shift + p, Run Task --> install && deploy-target cmake-example
>    F5 (Debug configuration might be selected before)
> 
> 8. Work on the recipes and call bitbake again to get the SDK updated.
>    Building the application by calling cmake (from the IDE) or by calling bitbake or by calling devtool build is expected to produce the exact same results. To make that possible, the devtool ide plugin is designed to configure the IDE to call cmake with the exact same configuration as used by bitbake when building the recipe. Unlike the eSDK, the goal here is clearly that there is no longer a separation between the SDK and the application development process. Regardless of which tool is called, the same source files are edited and the same o-files are generated and re-used.
> 
> Working with a SDK without a recipe
> -----------------------------------
> 
> If devtool ide is called for a recipe named none or meta-ide-support the eSDK with its generic environment file gets generated.
> In case of using VSCode and cmake in addition to the well known environment file a cmake-kit
> https://vector-of-bool.github.io/docs/vscode-cmake-tools/kits.html is added to the User-Local Kits.
> This allows to work with cmake calling the cross-toolchain out of VSCode or a shell with the environment file sourced.
> 
> Design
> ------
> 
> The goal of this implementation is to create a configuration for VSCode (or other IDEs) that allows to work on the code of a recipe completely independent from bitbake. bitbake is only called if the configuration or the whole SDK has to be regenerated. But bitbake should not need to be called while working in the IDE. This has two major advantages over calling devtool build from the IDE:
> - The IDE provides plugins for integration with cmake, for example. These features are usable, which would not be the case if bitbake or devtool are called from within the IDE.
> - It is much faster.
> 
> Supporting other IDEs
> ---------------------
> 
> Focus is currently VSCode. But a paramter "--ide=none" is already supported.
> With this paramter passed, no VSCode specific config files are generated.
> Instead, simple scripts are generated, which should be suitable for integration with other IDEs.
> 
> Testing
> -------
> 
> Reasonable but not yet complete test coverage is provided by:
> 
> $ oe-selftest -r devtool.DevtoolIdeTests
> 
> What's next?
> ------------
> 
> - There is still a lot of room for improvement. But nonetheless, it provides a first implementation that could be integrated into the core, I think. Unfortunately there was no feedback on my RFC at https://lists.openembedded.org/g/openembedded-core/message/183819 so far.
> - Support for more build-tools and programming languages as well as more IDEs should be possible. To prove the extendability 2 of both are already supported.
> 
> 
> Adrian Freihofer (13):
>   vscode: add minimal configuration
>   cmake.bbclass: refactor cmake args
>   cmake.bbclass: cleanup spaces and tabs
>   cmake.bbclass: support qemu
>   devtool: new ide plugin
>   tests: add a C++ example recipe
>   cmake-example: workaround for pseudo breakeage
>   refactor: make multiprocess_launch callable without d
>   refactor: make strip_execs callable without d
>   devtool: refactor deploy-target
>   devtool: ide make deploy-target quicker
>   oe-selftest devtool: ide tests
>   docs: cover devtool ide
> 
>  .gitignore                                    |    2 +
>  .vscode/settings.json                         |   32 +
>  documentation/sdk-manual/extensible.rst       |   97 +-
>  meta-selftest/recipes-test/cpp/.gitignore     |    1 +
>  .../recipes-test/cpp/cmake-example.bb         |   23 +
>  .../recipes-test/cpp/cmake-example/run-ptest  |   10 +
>  .../recipes-test/cpp/cpp-example.inc          |   24 +
>  .../recipes-test/cpp/files/CMakeLists.txt     |   60 +
>  .../cpp/files/cpp-example-lib.cpp             |   17 +
>  .../cpp/files/cpp-example-lib.hpp             |   16 +
>  .../recipes-test/cpp/files/cpp-example.cpp    |   16 +
>  .../recipes-test/cpp/files/meson.build        |   34 +
>  .../cpp/files/test-cpp-example.cpp            |   19 +
>  .../recipes-test/cpp/meson-example.bb         |   17 +
>  .../recipes-test/cpp/meson-example/run-ptest  |   10 +
>  meta/classes-global/staging.bbclass           |    3 +-
>  meta/classes-recipe/cmake.bbclass             |   70 +-
>  meta/lib/oe/package.py                        |    7 +-
>  meta/lib/oe/utils.py                          |   12 +-
>  meta/lib/oeqa/selftest/cases/devtool.py       |  133 ++
>  scripts/lib/devtool/__init__.py               |    5 +-
>  scripts/lib/devtool/deploy.py                 |  230 ++--
>  scripts/lib/devtool/ide.py                    | 1185 +++++++++++++++++
>  23 files changed, 1883 insertions(+), 140 deletions(-)
>  create mode 100644 .vscode/settings.json
>  create mode 100644 meta-selftest/recipes-test/cpp/.gitignore
>  create mode 100644 meta-selftest/recipes-test/cpp/cmake-example.bb
>  create mode 100644 meta-selftest/recipes-test/cpp/cmake-example/run-ptest
>  create mode 100644 meta-selftest/recipes-test/cpp/cpp-example.inc
>  create mode 100644 meta-selftest/recipes-test/cpp/files/CMakeLists.txt
>  create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example-lib.cpp
>  create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example-lib.hpp
>  create mode 100644 meta-selftest/recipes-test/cpp/files/cpp-example.cpp
>  create mode 100644 meta-selftest/recipes-test/cpp/files/meson.build
>  create mode 100644 meta-selftest/recipes-test/cpp/files/test-cpp-example.cpp
>  create mode 100644 meta-selftest/recipes-test/cpp/meson-example.bb
>  create mode 100644 meta-selftest/recipes-test/cpp/meson-example/run-ptest
>  create mode 100755 scripts/lib/devtool/ide.py
> 
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186780): https://lists.openembedded.org/g/openembedded-core/message/186780
> Mute This Topic: https://lists.openembedded.org/mt/100996575/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

