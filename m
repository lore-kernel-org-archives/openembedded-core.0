Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80394C4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 13:59:41 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.74264.1705931971316804621
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 05:59:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YrxNFNQl;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50edf4f478eso4066259e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 05:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705931969; x=1706536769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkA8JmIqu+tEZQPINCgxYk+1SogLmP0MfuItZDG+1ho=;
        b=YrxNFNQl0TMhkAIulnzcES9q5OKbfApTyvUw7PL+Jno3a9k5uczT1OXfG1k14pat4W
         Ih+pDIP/rcLaVcXfYNDIKlWmQt/9veVRC0EdCtX9nxXRuGiGb5XU50EIgS1vi7zIdWlL
         v4zvvbA8yPGtB7jBGbD4i4tCJVfFJekYtUGT2fXGsOoYhRrTtBeU5z04+x/UwEUn7sKI
         udojDMwUpKy7n1k6+vsOYqugsRAvCekDQs/N2lk5Qx29aeBSAGozB3d80aJGAObF7Sps
         y5i/vLcRbr4rXwV6A+w1mssmtw8yEK6rGkBCVHQxXn8ZrPyYRAPSGey4lTrBjYKUZPzx
         5BRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705931969; x=1706536769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vkA8JmIqu+tEZQPINCgxYk+1SogLmP0MfuItZDG+1ho=;
        b=xQ26UdRs4RoMoQPk9ZylujC6GyH+YTooUHC+A1sujjG6bx3ShMNCSamRVUyhvGQr0b
         i3IFx9jpTiQfeopcNDAXIPi0yvB1QVdVbdT5pe1ADcVNlj4iOKLDZs5tv39eyKk4hmSz
         ADpH0baLUUQ5OB1J809/pe4aZbuPiUmoEoaA0MeNjbYmQTb1cikvD4tuR245yz7k3iUw
         xpZ2N+oVELJ8PkjdR6YodEGm1Y5hOEFNxhaASkP1vQyWpaxIPo6dBIOLbnecqKUy9y5X
         Y1pNTZ5wK4f/8oAH8F7f9efdnw+FLcV7OmgtTB1eAsc93ZN/8IERtdurVrdglaHvUZBJ
         rdHQ==
X-Gm-Message-State: AOJu0Yyi+Vqh4n0LU2wyMLC2H/Gfe6lubYwkobWDlKwC3ZIQaVYG9YYx
	rGKeL/bHM1ZIey2QjG+K4jUAOcs9qyXYdqPMJ6hk+7ccaidkDACpdf2FpzrJ
X-Google-Smtp-Source: AGHT+IHG+SalTJnBNqzLJpRQ2+fvqSBlQl56AHx39s8Lm+j52Wai674hmgt1AkE5+UCUhnas7b/rSQ==
X-Received: by 2002:ac2:5dee:0:b0:50e:44a4:d439 with SMTP id z14-20020ac25dee000000b0050e44a4d439mr1556377lfq.56.1705931968978;
        Mon, 22 Jan 2024 05:59:28 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id vw15-20020a170907a70f00b00a2d0595cd0dsm11568513ejc.86.2024.01.22.05.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 05:59:28 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v10 9/9] WIP: sdk-manual: extensible.rst: cover devtool ide-sdk
Date: Mon, 22 Jan 2024 14:58:27 +0100
Message-ID: <20240122135901.171596-10-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122135901.171596-1-adrian.freihofer@siemens.com>
References: <20240122135901.171596-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 13:59:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194158

Cover the new devtool ide plugin in the extensible sdk section.

Many thanks to Enguerrand de Ribaucourt for his re-view and
contributions.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/sdk-manual/extensible.rst | 257 +++++++++++++++++++++++-
 1 file changed, 256 insertions(+), 1 deletion(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 355c6cb0e4a..7a80f94a38b 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -63,6 +63,8 @@ their own pros and cons:
    need to provide a well-functioning binary artefact cache over the network
    for developers with underpowered laptops.
 
+.. _setting_up_ext_sdk_in_build:
+
 Setting up the Extensible SDK environment directly in a Yocto build
 -------------------------------------------------------------------
 
@@ -168,6 +170,8 @@ architecture. The example assumes the SDK installer is located in
    that case, set up the proper permissions in the directory and run the
    installer again.
 
+.. _running_the_ext_sdk_env:
+
 Running the Extensible SDK Environment Setup Script
 ===================================================
 
@@ -205,6 +209,8 @@ use the SDK (e.g. ``PATH``, :term:`CC`, :term:`LD`, and so forth). If you want
 to see all the environment variables the script exports, examine the
 installation file itself.
 
+.. _using_devtool:
+
 Using ``devtool`` in Your SDK Workflow
 ======================================
 
@@ -230,13 +236,15 @@ all the commands.
    See the ":doc:`/ref-manual/devtool-reference`"
    section in the Yocto Project Reference Manual.
 
-Three ``devtool`` subcommands provide entry-points into development:
+``devtool`` subcommands provide entry-points into development:
 
 -  *devtool add*: Assists in adding new software to be built.
 
 -  *devtool modify*: Sets up an environment to enable you to modify
    the source of an existing component.
 
+-  *devtool ide-sdk*: Generates a configuration for an IDE.
+
 -  *devtool upgrade*: Updates an existing recipe so that you can
    build it for an updated set of source files.
 
@@ -614,6 +622,253 @@ command:
       decide you do not want to proceed with your work. If you do use this
       command, realize that the source tree is preserved.
 
+``devtool ide-sdk`` configures IDEs for the extensible SDK
+----------------------------------------------------------
+
+``devtool ide-sdk`` automatically configures IDEs to use the extensible SDK.
+To make sure that all parts of the extensible SDK required by the generated IDE configuration are
+available, ``devtool ide-sdk`` uses bitbake in the background to bootstrap the extensible SDK.
+
+The extensible SDK supports two different development modes.
+``devtool ide-sdk`` supports both of them:
+
+#. *Modified mode*:
+
+   By default ``devtool ide-sdk`` generates IDE configurations for recipes in workspaces
+   created by ``devtool modify`` or ``devtool add`` as described in :ref:`using_devtool`.
+   This mode creates IDE configurations with support for advanced features, such as deploying
+   the binaries to the remote target device and performing remote debugging sessions.
+   The generated IDE configurations use the per recipe sysroots as Bitbake does internally.
+
+   In order to use the tool, a few settings must be made.
+   As a starting example, the following lines of code can be added to the ``local.conf`` file::
+
+      # Build the companion debug file system
+      IMAGE_GEN_DEBUGFS = "1"
+      # Optimize build time: with devtool ide-sdk the dbg tar is not needed
+      IMAGE_FSTYPES_DEBUGFS = ""
+      # Without copying the binaries into roofs-dbg, GDB does not find all source files.
+      IMAGE_CLASSES += "image-combined-dbg"
+
+      # ssh is mandatory, no password simplifies the usage
+      EXTRA_IMAGE_FEATURES += "\
+         ssh-server-openssh \
+         debug-tweaks \
+      "
+
+      # Remote debugging needs the gdbserver on the target device
+      IMAGE_INSTALL:append = " gdbserver"
+
+      # Add the recipes which should be modified to the image
+      # Otherwise some dependencies might be missing.
+      IMAGE_INSTALL:append = " my-recipe"
+
+   Assuming the bitbake environment is set up correctly and a workspace has been created
+   for the recipe using ``devtool modify my-recipe``, the following command can create the
+   SDK and the configuration for VSCode in the recipe workspace::
+
+      $ devtool ide-sdk my-recipe core-image-minimal --target root@192.168.7.2
+
+   The command requires an image recipe (``core-image-minimal`` for this example)
+   that is used to create the SDK.
+   This firmware image should also be installed on the target device.
+   It is possible to pass multiple package recipes.
+   ``devtool ide-sdk`` tries to create an IDE configuration for all package recipes.
+
+   Exactly what this command does depends on the recipe respectively on the build tool used by
+   the recipe. The basic idea is to configure the IDE so that it calls the build tool exactly
+   as ``bitbake`` does.
+
+   For example, a CMake preset is created for a recipe that inherits :ref:`ref-classes-cmake`.
+   In the case of VSCode, CMake presets are supported by the CMake Tools plugin.
+   This is an example of how the build configuration used by ``bitbake`` is exported to an IDE
+   configuration that gives exactly the same build results.
+
+   Support for remote debugging with seamless integration into the IDE is important for a cross-SDK.
+   ``devtool ide-sdk`` automatically generates the necessary helper scripts for deploying the compiled
+   artifacts to the target device as well as the necessary configuration for the debugger and the IDE.
+
+   .. note::
+
+      To ensure that the debug symbols on the build machine match the binaries running on the target device,
+      it is essential that the image built by ``devtool ide-sdk`` is running on the target device.
+
+   ``devtool ide-sdk`` aims to support multiple programming languages and multiple IDEs natively.
+   Native means that the IDE is configured to call the build tool (e.g. CMake or Meson) directly.
+   This has several advantages. First of all, it is much faster than ``devtool build``.
+   But it also allows to use the very good integration of tools like CMake or GDB directly with VSCode or other IDEs.
+   However, supporting many programming languages and multiple IDEs is quite an elaborate and constantly evolving thing.
+   Support for IDEs is therefore implemented as plugins.
+   Plugins can also be provided by optional layers.
+
+   The default IDE is VSCode. Some hints about using VSCode:
+
+   - To work on the source code of a recipe an instance of VSCode is started in the recipe's workspace.
+     Example::
+
+        code build/workspace/sources/my-recipe
+
+   - To work with CMake press ``Ctrl + Shift + p``, type ``cmake``.
+     This will show some possible commands like selecting a CMake preset, compiling or running CTest.
+
+     For recipes inheriting :ref:`ref-classes-cmake-qemu` rather than :ref:`ref-classes-cmake` executing
+     cross-compiled unit tests on the host can be supported transparently with QEMU user-mode.
+
+   - To work with Meson press ``Ctrl + Shift + p``, type ``meson``.
+     This will show some possible commands like compiling or executing the unit tests.
+
+     A note on running cross-compiled unit tests on the host: Meson enables support for QEMU user-mode by default.
+     It is expected that the execution of the unit tests from the IDE will work easily without any additional steps,
+     provided that the code is suitable for execution on the host machine.
+
+   - For the deployment to the target device, just press ``Ctrl + Shift + p``, type ``task``.
+     Select the ``install && deploy-target``.
+
+   - For remote debugging, switch to the debugging view by pressing the "play" button with the ``bug icon`` on the left side.
+     This will provide a green play button with a drop-down list where a debug configuration can be selected.
+     After selecting one of the generated configurations, press the "play" button.
+
+     Starting a remote debugging session automatically initiates the deployment to the target device.
+     If this is not desired, the ``"dependsOn": ["install && deploy-target...]`` parameter of the tasks
+     with ``"label": "gdbserver start...`` can be removed from the ``tasks.json`` file.
+
+     VSCode supports GDB with many different setups and configurations for many different use cases.
+     However, most of these setups have some limitations when it comes to cross-development, support only a few target
+     architectures or require a high performance target device.
+     Therefore ``devtool ide-sdk`` supports the classic, generic setup with GDB on the development host and gdbserver
+     on the target device.
+     Roughly summarized, this means:
+
+     - The binaries are copied via ssh to the remote target device by a script referred by ``tasks.json``.
+     - gdbserver is started on the remote target device via ssh by a script referred by ``tasks.json``.
+
+       Changing the parameters that are passed to the debugging executable requires changing the generated script.
+       The scipts is located at ``oe-scripts/gdbserver_*``.
+       The definition of the parameters in the ``args`` field in the ``launch.json`` file does not work.
+
+     - VSCode connects to the gdbserver as documented in
+       `Remote debugging or debugging with a local debugger server <https://code.visualstudio.com/docs/cpp/launch-json-reference#_remote-debugging-or-debugging-with-a-local-debugger-server>`__.
+
+   Additionally ``--ide=none`` is supported.
+   With the none IDE parameter some generic configurations files like ``gdbinit`` files and some helper scripts
+   starting the gdbserver remotely on the target device as well as the gdb client on the host are generated.
+
+   Usage example for the cmake-example recipe from the meta-selftest layer
+   which inherits :ref:`ref-classes-cmake-qemu`:
+
+   .. code-block:: sh
+
+      # Create the SDK
+      devtool modify cmake-example
+      devtool ide-sdk cmake-example core-image-minimal -c --debug-build-config --ide=none
+
+      # Install the firmware on a target device or start QEMU
+      runqemu
+
+      # From a Navigate into the workspace of cmake-example
+      cd build/workspace/sources/cmake-example
+
+      # Find cmake-native and save the path into a variable
+      # Note: using just cmake instead of $CMAKE_NATIVE would work in many cases
+      CMAKE_NATIVE="$(jq -r '.configurePresets[0] | "\(.cmakeExecutable)"' CMakeUserPresets.json)"
+
+      # List available CMake presets
+      "$CMAKE_NATIVE" --list-presets
+      Available configure presets:
+
+        "cmake-example-cortexa57" - cmake-example: cortexa57
+
+      # Re-compile the already compiled sources
+      "$CMAKE_NATIVE" --build --preset cmake-example-cortexa57
+      ninja: no work to do.
+      # Do a clean re-build
+      "$CMAKE_NATIVE" --build --preset cmake-example-cortexa57 --target clean
+      [1/1] Cleaning all built files...
+      Cleaning... 8 files.
+      "$CMAKE_NATIVE" --build --preset cmake-example-cortexa57 --target all
+      [7/7] Linking CXX executable cmake-example
+
+      # Run the cross-compiled unit tests with QEMU user-mode
+      "$CMAKE_NATIVE" --build --preset cmake-example-cortexa57 --target test
+      [0/1] Running tests...
+      Test project .../build/tmp/work/cortexa57-poky-linux/cmake-example/1.0/cmake-example-1.0
+          Start 1: test-cmake-example
+      1/1 Test #1: test-cmake-example ...............   Passed    0.03 sec
+
+      100% tests passed, 0 tests failed out of 1
+
+      Total Test time (real) =   0.03 sec
+
+      # Using CTest directly is possible as well
+      CTEST_NATIVE="$(dirname "$CMAKE_NATIVE")/ctest"
+
+      # List available CMake presets
+      "$CTEST_NATIVE" --list-presets
+      Available test presets:
+
+        "cmake-example-cortexa57" - cmake-example: cortexa57
+
+      # Run the cross-compiled unit tests with QEMU user-mode
+      "$CTEST_NATIVE" --preset "cmake-example-cortexa57" 
+      Test project ...build/tmp/work/cortexa57-poky-linux/cmake-example/1.0/cmake-example-1.0
+          Start 1: test-cmake-example
+      1/1 Test #1: test-cmake-example ...............   Passed    0.03 sec
+
+      100% tests passed, 0 tests failed out of 1
+
+      Total Test time (real) =   0.03 sec
+
+      # Deploying the new build to the target device (default is QEUM at 192.168.7.2)
+      oe-scripts/install_and_deploy_cmake-example-cortexa57
+
+      # Start a remote debugging session with gdbserver on the target ang GDB on the host
+      oe-scripts/gdbserver_1234_usr-bin-cmake-example_m
+      oe-scripts/gdb_1234_usr-bin-cmake-example
+      break main
+      run
+      step
+      stepi
+      continue
+      quit
+
+      # Stop the gdbserver on the target device
+      oe-scripts/gdbserver_1234_usr-bin-cmake-example_m stop
+
+#. *Shared sysroots mode*
+
+   For some recipes and use cases a per-recipe sysroot based SDK is not suitable.
+   Optionally ``devtool ide-sdk`` configures the IDE to use the tool-chain provided by the
+   extensible SDK as described in :ref:`running_the_ext_sdk_env`.
+   ``devtool ide-sdk --mode=shared`` is basically a wrapper for the setup of the extensible SDK
+   as described in :ref:`setting_up_ext_sdk_in_build`.
+   The IDE gets configuration to use the shared sysroots.
+
+   Creating a SDK with shared sysroots that contains all the dependencies needed to work with my-recipe is possible
+   with the following example command::
+
+      $ devtool ide-sdk --mode=shared my-recipe
+
+   For VSCode the cross-tool-chain is exposed as a CMake kit. CMake kits are defined in
+   ``~/.local/share/CMakeTools/cmake-tools-kits.json``.
+   The following example shows how the cross-toolchain can be selected in VSCode.
+   Fist of all we need a folder containing a CMake project.
+   For this example lets create a CMake project and start VSCode::
+
+      mkdir kit-test
+      echo "project(foo VERSION 1.0)" > kit-test/CMakeLists.txt
+      code kit-test
+
+   If there is a CMake project in the workspace cross-compilation is supported:
+
+   - Press ``Ctrl + Shift + P``, type ``CMake: Scan for Kits``
+   - Press ``Ctrl + Shift + P``, type ``CMake: Select a Kit``
+
+   Finally most of the features provided by CMake and the IDE should be available.
+
+   Other IDEs than VSCode are supported as well.
+   However, ``devtool ide-sdk --mode=shared --ide=none my-recipe`` is currently just a simple wrapper
+   for the setup of the extensible SDK as described in :ref:`setting_up_ext_sdk_in_build`.
+
 Use ``devtool upgrade`` to Create a Version of the Recipe that Supports a Newer Version of the Software
 -------------------------------------------------------------------------------------------------------
 
-- 
2.43.0


