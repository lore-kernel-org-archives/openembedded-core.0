Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1796C4167D
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 21:32:25 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.171854.1698701537959593326
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 14:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aZxu3FBC;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c50cd16f3bso69272281fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 14:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698701536; x=1699306336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTHpTb/9HDayDKDafdZ//W3sAFKlkff/Fkn6MaPNR+Y=;
        b=aZxu3FBCQkEcmtuWUgfhtuwhmpVwHsGBS4VjSekYQtC4zKTu53L9i5pl7qdgd5gCBC
         J4yL0gy002HXmo3OeObKuGbIPDUabbWNhUxfi5ytGqe+whfQwE+K8P+dK/DitY7LIDod
         BVxg4RuPAoXvNdEfN1H4VT3EmJ2vIDvUvGtfYztTe6FYj0DdXVTa5LkhaKOngVuQC96X
         7zU9rkabszDR4IaH2TE5gnQbBJbuf2Oremz9j8RjTGQ318uGkXEuL80Hz9USsvTLoOiT
         upsUvWGdkBfof+l5RQ4mUdnpgY3goYqXAHXBruRtUM2ENM3jnKTVatUT2YjzzW9sgT/s
         uYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698701536; x=1699306336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTHpTb/9HDayDKDafdZ//W3sAFKlkff/Fkn6MaPNR+Y=;
        b=HdMggeDEUR8sYxHOh36Usp/F20aHvnd1AaX3UFQoXm44fpDHonHZ9514mmE/Eygsm3
         gqsFZsT+N7Sr2zA1HynyVdt6vGi3G3x8qqk2lblw9RpFcW69Jai4XSNjbKPrnXTWeISx
         ejnMVKHWYIWXjkzMLvas4f3J7VzwrYEDi/vAV62P1i6XXwT0v2iTZosNQeEeOcdxPQXR
         Mw8Rep2MJwC9ugEU/3HI6szmIs3FR6FPo8SVKRShOeIZtlPi0x26AyyfuC6Pq7kp9n2d
         ghwCyuEazeP4TtVg0+b55QRVx9Jg1puQvWuVITYrTHHU5wgn7LSQRGWxjGieqzjW+XXb
         AL4A==
X-Gm-Message-State: AOJu0YwKIEj/qwHZouS0xXLyDPq5SlpyhFR/oFm00Qg/RfSAPIQOla2i
	2R6LhpAQl2rIPj22n9m1uZ51i7QrxVA=
X-Google-Smtp-Source: AGHT+IGnVq/LGNKQ8DnAH8FQEd3CnCtjIPleVUvlgeaHD9UxnNj7IRT5hsK9P/+MFqRU0rWM3G+chg==
X-Received: by 2002:a2e:95d7:0:b0:2c5:11e7:6d20 with SMTP id y23-20020a2e95d7000000b002c511e76d20mr8826613ljh.35.1698701535583;
        Mon, 30 Oct 2023 14:32:15 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id h6-20020a05600c350600b003fc0505be19sm304811wmq.37.2023.10.30.14.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 14:32:15 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v7 8/8] docs: cover devtool ide
Date: Mon, 30 Oct 2023 22:32:05 +0100
Message-ID: <20231030213205.2824790-9-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231030213205.2824790-1-adrian.freihofer@siemens.com>
References: <20231030213205.2824790-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 21:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189820

Cover the new devtool ide plugin in the extensible sdk section.

Many thanks to Enguerrand de Ribaucourt for his re-view and
contributions.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/sdk-manual/extensible.rst | 158 +++++++++++++++++++++++-
 1 file changed, 157 insertions(+), 1 deletion(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 355c6cb0e4a..361ca091fbf 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -230,13 +230,15 @@ all the commands.
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
 
@@ -614,6 +616,160 @@ command:
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
+   As a starting example, the following lines of code can be added to the local.conf file.
+
+   .. code-block::
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
+   configuration for VSCode in the recipe workspace:
+
+   .. code-block::
+
+      $ devtool ide recipe core-image-minimal --target root@192.168.7.2
+
+   What this command does exactly depends on the recipe or the build tool used by the recipe.
+   Currently, only CMake and Meson are supported natively.
+
+   For a recipe which inherits ``cmake`` it does:
+
+   - Prepare the SDK by calling ``bitbake core-image-minimal``, ``gdb-cross``, ``qemu-native``...
+
+   - Generate a cmake-preset with configures CMake to use exactly the same environent and
+     the same cmake-cache configuration as used by ``bitbake recipe``. The cmake-preset referres
+     to the per-recipe-sysroot of the recipe.
+
+     Currently Configure, Build and Test presets are supported. Test presets execute the test
+     binaries with Qemu.
+
+   - Generates a helper script to handle the ``do_install`` with pseudo
+
+   - Generates some helper scripts to start ``gdbserver`` on the target device
+
+   - Generates the ``.vscode`` folder containing the following files:
+
+   - ``c_ccp_properties.json``: configure the code navigation
+
+   - ``extensions.json``: Recommend the extensions which are used.
+
+   - ``launch.json``: Provide a configuration for remote debugging with ``gdb-cross`` and ``gdbserver``.
+     The debug-symbols are searched in the build-folder, the per-recipe-sysroot and the rootfs-dbg
+     folder which is provided by the image.
+
+   - ``settings.json``: configure the indexer to ignore the build folders.
+
+   - ``tasks.json``: Provide some helpers for running
+
+      - do_install and ``devtool deploy-target``
+
+      - start the ``gdbserver`` via ssh
+
+   For a recipe which inherits meson a similar configuration is generated.
+   Because there is nothing like a meson-preset a wrapper script for meson is generated.
+
+   It's possible to pass multiple recipes to the ``devtool ide`` command.
+   ``devtool ide`` tries to handle the recipes in a reasonable way if possible.
+
+   ``devtool ide`` aims to support multiple programming languages and multiple IDEs natively.
+   Native means that the IDE is configured to call the build tool (e.g. cmake or meson) directly.
+   This has several advantages. First of all, it is much faster than ``devtool build``, for example.
+   But it also allows to use the very good integration of tools like CMake or GDB directly with VSCode or other IDEs.
+   However, supporting many programming languages and multiple IDEs is quite an elaborate and constantly evolving thing.
+   To handle combinations that are not natively supported, devtool ide creates a configuration that falls back
+   to ``devtool build`` and ``devtool deploy-target`` if there is no native support available.
+
+   The default IDE is VSCode. Some hints about using VSCode:
+
+   - To work with CMake press ``Ctrl + Shift + p``, type ``cmake``.
+     This will show some possible commands like selecting a CMake preset, compiling or running ctest.
+     A cmake-kit might be activated by ``Ctrl + Shift + p``, type ``cmake`` quick start,
+     if not preset file is in the wokspace.
+
+   - To work with meson press ``Ctrl + Shift + p``, type meson.
+     This will show some possible commands like compiling or executing the unit tests.
+
+   - For the deployment to the target device, just press ``Ctrl + Shift + p``, type task.
+     Select the install & deploy task.
+
+   - For remote debugging, switch to the debugging view by pressing the play button with the bug on the left side.
+     This will provide a green play button with a drop-down list where a debug configuration can be selected.
+     After selecting one of the generated configurations, press the play button.
+
+   Additionally ``--ide=none`` is supported.
+   With the none IDE some generic configurations files like ``.gdbinit`` files and some helper scripts
+   are generated.
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
+   a IDE configurations referring to the shared sysroots. Recipes leading to a shared sysroot
+   are for example meta-ide-support or shared-sysroots. Also passing none as a recipe name leads
+   to a shared sysroot SDK.
+
+   .. code-block::
+
+      $ devtool ide none core-image-minimal
+
+   In case of a shared sysroot SDK the configuration which gets generated for VSCode exposes the
+   cross-tool-chain as a cmake-kit. If a cmake project is loaded into VSCode the cross-toolchain
+   can be selected for compiling.
+
+   For some special recipes and use cases a recipe-sysroot based SDK is not suitable.
+   Therefore ``devtool ide`` also supports setting up the shared sysroots environment and generating
+   a IDE configurations referring to the shared sysroots. Recipes leading to a shared sysroot
+   are for example meta-ide-support or shared-sysroots. Also passing none as a recipe name leads
+   to a shared sysroot SDK.
+
+   .. code-block::
+
+      $ devtool ide none core-image-minimal
+
+   In case of a shared sysroot SDK the configuration which gets generated for VSCode exposes the
+   cross-tool-chain as a cmake-kit. If a CMake project is loaded into VSCode the cross-toolchain
+   can be selected for compiling. The following example shows how the cross-toolchain can be
+   selected in VSCode.
+
+
+   .. code-block::
+
+      mkdir kit-test
+      echo "project(foo VERSION 0.1)" > kit-test/CMakeLists.txt
+      code kit-test
+
+      Ctrl + Shift + P --> CMake: Scan for Kits
+      Ctrl + Shift + P --> CMake: Select a Kit
+
 Use ``devtool upgrade`` to Create a Version of the Recipe that Supports a Newer Version of the Software
 -------------------------------------------------------------------------------------------------------
 
-- 
2.41.0


