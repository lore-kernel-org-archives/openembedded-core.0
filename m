Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67AECC4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 11:01:49 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.4305.1698836506339544021
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 04:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LGGJV0sh;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-53e751aeb3cso10887097a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 04:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698836504; x=1699441304; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMZV7zfeVn25f8BX39wkgKysvmENsdvySkR3QPsm8mc=;
        b=LGGJV0shRl2hW4oaJVPacjk69mR4QozF1sy5X0m/crywWzQUwPrnRPmujE8nRyImWH
         vMsA/3xujeg+2LYIIpuDZa65sKqyE6g59ktoPDwSrCC0EATf00f3mK6SF9LDGkgyh+Ik
         d/E8wrbtzSFWH/m/KsAqLRjlJ2Dl28LoC89qr3JxQLic6vmjsljw98dvEUwc42Vc4B8R
         jGGS6EOTQhqOZuBB/oaTuoa2GcgbNkE/xZc7gMze1rReRrhr5ZF5dLSgPTLRjsYSlXMt
         hCNKQwj36nxbFZfuojbguRZUFoeEQP7kiU+1Jhs4S80QZD8nUE4EsPuoAv7ZW1GiJ2nQ
         ixGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698836504; x=1699441304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMZV7zfeVn25f8BX39wkgKysvmENsdvySkR3QPsm8mc=;
        b=gmKEay0Uwu41FXccLeDhdDa3N/5rFM20hll7WBQVu9Q2CyIm+yg9N45uf4MxuSYTdM
         ksFW0W2tHKmBPKfR6uNtUO6LGeKrCZ9zYJugErZPNXV1+jIC4x5UImHpwadrp8mL6LIJ
         ejgiikgt5xREKChOQUtiRzCp6skAFBCzt8hm84awLW6lRvEeijGmkJGCcD9cg/xT+pf9
         hyW38Avjv3WJLxI+wuHSc5Qw+nYdbQB3pM6SiSEBDLFl/4Pw+41V4LSkaHXhkGSa/HG/
         9aZt9FbHUYcW/sJxwV+WSw0XdylnYj1J06ny/ssyIAq4Z0gE9ZhyvJtxhGa6xQEfhZRx
         N3Sg==
X-Gm-Message-State: AOJu0YxFopo3GryVZkjmLgzFuRJoQkT7pvjJwUMH2Rc/5DLXbptC4rnN
	kOSVLC7b7wv07wX9V3/dsPv3gUaNSZw=
X-Google-Smtp-Source: AGHT+IE1ldYLbcMypjZqQQEGhT+N3mF2Osh0+gABI51QFYhotGu6J+gat5eRYC1LO610b+M7QoQjHw==
X-Received: by 2002:a17:907:a0a:b0:9c3:e158:316a with SMTP id bb10-20020a1709070a0a00b009c3e158316amr1638542ejc.68.1698836504415;
        Wed, 01 Nov 2023 04:01:44 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id m12-20020a17090607cc00b009c7608eb499sm2262426ejc.94.2023.11.01.04.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 04:01:43 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v8 8/8] docs: cover devtool ide
Date: Wed,  1 Nov 2023 12:01:29 +0100
Message-ID: <20231101110129.647878-9-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101110129.647878-1-adrian.freihofer@siemens.com>
References: <20231101110129.647878-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 11:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189907

Cover the new devtool ide plugin in the extensible sdk section.

Many thanks to Enguerrand de Ribaucourt for his re-view and
contributions.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/sdk-manual/extensible.rst | 153 +++++++++++++++++++++++-
 1 file changed, 152 insertions(+), 1 deletion(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 355c6cb0e4a..51d9fff2638 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -63,6 +63,8 @@ their own pros and cons:
    need to provide a well-functioning binary artefact cache over the network
    for developers with underpowered laptops.
 
+.. _setting_up_ext_sdk_in_build:
+
 Setting up the Extensible SDK environment directly in a Yocto build
 -------------------------------------------------------------------
 
@@ -230,13 +232,15 @@ all the commands.
    See the ":doc:`/ref-manual/devtool-reference`"
    section in the Yocto Project Reference Manual.
 
-Three ``devtool`` subcommands provide entry-points into development:
+Four ``devtool`` subcommands provide entry-points into development:
 
 -  *devtool add*: Assists in adding new software to be built.
 
 -  *devtool modify*: Sets up an environment to enable you to modify
    the source of an existing component.
 
+-  *devtool ide*: Generates a configuration for an IDE.
+
 -  *devtool upgrade*: Updates an existing recipe so that you can
    build it for an updated set of source files.
 
@@ -614,6 +618,153 @@ command:
       decide you do not want to proceed with your work. If you do use this
       command, realize that the source tree is preserved.
 
+Use ``devtool ide`` to generate a configuration for the IDE
+-----------------------------------------------------------
+
+``devtool ide`` automatically configures IDEs for cross-compiling and remote debugging.
+
+Two different use cases are supported:
+
+#. *Recipe mode*: Generate the IDE configuration for a workspace created by ``devtool modify``.
+
+   In order to use the tool, a few settings must be made.
+   As a starting example, the following lines of code can be added to the ``local.conf`` file::
+
+      # Build the companion debug file system
+      IMAGE_GEN_DEBUGFS = "1"
+      # Optimize build time: with devtool ide the dbg tar is not needed
+      IMAGE_FSTYPES_DEBUGFS = ""
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
+   Assuming the development environment is set up correctly and a workspace has been created
+   for the recipe using ``devtool modify recipe``, the following command can create the
+   configuration for VSCode in the recipe workspace::
+
+      $ devtool ide recipe core-image-minimal --target root@192.168.7.2
+
+   What this command does exactly depends on the recipe or the build tool used by the recipe.
+   Currently, only CMake and Meson are supported natively.
+   Here is what it does for a recipe which inherits the :ref:`ref-classes-cmake` class:
+
+   - Prepare the SDK by calling ``bitbake core-image-minimal``, ``gdb-cross``, ``qemu-native``...
+
+   - Generate a CMake preset with configures CMake to use exactly the same environent and
+     the same CMmake cache configuration as used by ``bitbake recipe``. The CMake preset referres
+     to the per-recipe-sysroot of the recipe.
+
+     Currently Configure, Build and Test presets are supported. Test presets execute the test
+     binaries with Qemu (qemu-user not qemu-system).
+
+   - Generate a helper script to handle the ``do_install`` with pseudo.
+
+   - Generate a helper script which does the same as ``devtool deploy-target`` does.
+     Therefore ``devtool ide`` supports the same set of target related command line parameters
+     as ``devtool deploy-target`` does.
+     The ``--target`` parameter in the example above is just an example for that. It is optional.
+
+   - Generate some helper scripts to start ``gdbserver`` on the target device.
+
+   - Generate the ``.vscode`` folder containing the following files:
+
+   - ``c_ccp_properties.json``: Configure IntelliSense for code navigation.
+
+   - ``extensions.json``: Recommend the extensions which are used.
+
+   - ``launch.json``: Provide a configuration for remote debugging with ``gdb-cross`` and ``gdbserver``.
+     The debug-symbols are searched in the build-folder and in the rootfs-dbg folder
+     which is provided by the image recipe passed to the ``devtool ide`` command.
+
+   - ``settings.json``: Configure the code indexers to ignore the build folders.
+     Without reasonable exclude settings, it is very likely that some indexer plugins will run
+     with 100% CPU load until an OOM exception occurs. In the case of VSCode, the indexers started
+     immediately and do not stop or reconfigure when the ignore list is updated. This means that the
+     settings.json file must be available before VSCode is started in the workspace folder or before
+     ``devtool modify`` has added the ``oe-workdir`` symlink to the large build folder of ``bitbake``.
+
+   - ``tasks.json``: Provide some helpers for running
+
+      - :ref:`ref-tasks-install` and ``devtool deploy-target``
+
+      - start ``gdbserver`` via ssh
+
+   For a recipe which inherits the :ref:`ref-classes-meson` a similar configuration is generated.
+   Because there is nothing like a Meson preset a wrapper script for Meson is generated.
+
+   It's possible to pass multiple recipes to the ``devtool ide`` command.
+   ``devtool ide`` tries to handle the recipes in a reasonable way if possible.
+
+   ``devtool ide`` aims to support multiple programming languages and multiple IDEs natively.
+   Native means that the IDE is configured to call the build tool (e.g. CMake or Meson) directly.
+   This has several advantages. First of all, it is much faster than ``devtool build``, for example.
+   But it also allows to use the very good integration of tools like CMake or GDB directly with VSCode or other IDEs.
+   However, supporting many programming languages and multiple IDEs is quite an elaborate and constantly evolving thing.
+   To handle combinations that are not natively supported, ``devtool ide`` creates a configuration that falls back
+   to ``devtool build`` and ``devtool deploy-target`` if there is no native support available.
+
+   The default IDE is VSCode. Some hints about using VSCode:
+
+   - To work with CMake press ``Ctrl + Shift + p``, type ``cmake``.
+     This will show some possible commands like selecting a CMake preset, compiling or running CTest.
+
+   - To work with Meson press ``Ctrl + Shift + p``, type ``meson``.
+     This will show some possible commands like compiling or executing the unit tests.
+
+   - For the deployment to the target device, just press ``Ctrl + Shift + p``, type ``task``.
+     Select the ``install & deploy task``.
+
+   - For remote debugging, switch to the debugging view by pressing the "play" button with the ``bug icon`` on the left side.
+     This will provide a green play button with a drop-down list where a debug configuration can be selected.
+     After selecting one of the generated configurations, press the "play" button.
+
+     Starting a remote debugging sesssion automatically initiates the deployment to the target device.
+     If this is not desired, the ``"dependsOn": ["install && deploy-target...]`` parameter of the tasks
+     with ``"label": "gdbserver start...`` can be removed from the ``tasks.json`` file.
+
+   Additionally ``--ide=none`` is supported.
+   With the none IDE parameter some generic configurations files like ``.gdbinit`` files and some helper scripts
+   starting the gdbserver remotely on the target device as well as the gdb client on the host are generated.
+
+   .. note::
+
+      To ensure that the debug symbols on the build machine match the binaries running on the target system,
+      it is essential that the image built by ``devtool ide`` is running on the target system.
+
+#. *Shared sysroots mode*: Generate the IDE configuration for using a cross-toolchain as provided by
+   ``bitbake meta-ide-support build-sysroots``.
+
+   For some special recipes and use cases a per-recipe-sysroot based SDK is not suitable.
+   Therefore ``devtool ide`` also supports setting up the shared sysroots environment and generating
+   IDE configurations referring to the shared sysroots. Recipes leading to a shared sysroot
+   are for example ``meta-ide-support`` or ``shared-sysroots``.
+   Also passing ``none`` as a recipe name leads to a shared sysroot SDK::
+
+      $ devtool ide none core-image-minimal
+
+   For VSCode the cross-tool-chain is exposed as a CMake kit. CMake kits are defined in
+   ``~/.local/share/CMakeTools/cmake-tools-kits.json``.
+   The following minimalistic example shows how the cross-toolchain can be selected in VSCode.
+   Fist of all we create a minimalistic CMake project and start VSCode::
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
+   For other IDEs than VSCode ``devtool ide none ...`` is just a simple wrapper for the
+   setup of the extensible SDK as decribed in :ref:`setting_up_ext_sdk_in_build`.
+
 Use ``devtool upgrade`` to Create a Version of the Recipe that Supports a Newer Version of the Software
 -------------------------------------------------------------------------------------------------------
 
-- 
2.41.0


