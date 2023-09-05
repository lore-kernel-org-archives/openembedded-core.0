Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50632CA1008
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 16:59:44 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.27508.1693933183446393178
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 09:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=SZJ99x1T;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-31ad9155414so2141377f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 09:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693933182; x=1694537982; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoenDSfxEhrJSXJzwNF0qUZi4ZdzROlnUR735GqJdd4=;
        b=SZJ99x1Tvv0lfdIEnmiw8OLmmcM87Qmy7H3sv4ruE4sA3vrJi6cNdYdkvp0018+COj
         85RLf38Js1nIHJMetMFlGcpRRM2It3IriPe77EcBXk02XqkvT2Ty5MatzR4micE4SxWj
         WJ6crfhU6KRhOMbAciP81mpWfHaQEK2nl1LpNh6S5b6418iIWV9dYtkjqp+uwZz9W60d
         sWD6DsvQaHN9fQQpyApxwk4YoOCtRBNGAWSLyPJSFiY+8GpXevyLKiK0tmdI0glSSUT4
         Q0cYzgXapKE0XS4YOJGTulWhCxTJI5QxqOE2eFXfQc1em9pfd/m4/T7saVgiYecsL3FG
         1eXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693933182; x=1694537982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AoenDSfxEhrJSXJzwNF0qUZi4ZdzROlnUR735GqJdd4=;
        b=FCm/rK1FPg2ZBjcvA//xkJug5PIu14keblkNdd05sc59jGcoEkTVUC0R64CuSJi+JH
         1v4iY4i7hUxHa18p6F08tk4i0eBdzAyvf9NKCHVztqBYS7iZOcasqyr6SjlJ83LBqbLP
         KzgHorBQ4CGRrXnOTi8O38HdgKhydgCRdGXtk2dGSUlA/GrEsGzuMa0FVmIP7+YDcHzk
         rDyNDXAiAYACeJIr15LnLSVC6nwGZMa5gqgpQ/edEYCVqkdV7qI19+2Bjuy/93H8kn5L
         MDK2TO1JtFmWp+JurstRluS4TKfUPpzrwTM5/tTG5xVXTiPU7bPEnWwbQAdz34ZRx3qW
         ShQg==
X-Gm-Message-State: AOJu0YxuhIb63K2c9aeU0c8CpQX2UkbewRyhO0GaZEvBtNMckco3KKk0
	1w4VXjJOEHRfpbaORS+0q4PW4S3/aEU=
X-Google-Smtp-Source: AGHT+IEK05y7OhDOmZUJhRDe8Auo9Y+Q5BqTfauzv5bnjnteqEl80b30FWMINrF+Iu4v/2kn3tOIDw==
X-Received: by 2002:a5d:5450:0:b0:31c:84e9:20fd with SMTP id w16-20020a5d5450000000b0031c84e920fdmr367525wrv.13.1693933181674;
        Tue, 05 Sep 2023 09:59:41 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id c7-20020a5d4147000000b0031de43fe9bfsm18146269wrq.0.2023.09.05.09.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 09:59:41 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH v5 14/14] docs: cover devtool ide
Date: Tue,  5 Sep 2023 18:51:23 +0200
Message-ID: <20230905165913.2560907-15-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230905165913.2560907-1-adrian.freihofer@siemens.com>
References: <20230905165913.2560907-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 16:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187246

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/sdk-manual/extensible.rst | 97 ++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 1 deletion(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 9e08e57a4e7..d05d4e36aa7 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -237,7 +237,7 @@ all the commands.
    devtool
    quick reference.
 
-Three ``devtool`` subcommands provide entry-points into
+Four ``devtool`` subcommands provide entry-points into
 development:
 
 -  *devtool add*: Assists in adding new software to be built.
@@ -245,6 +245,8 @@ development:
 -  *devtool modify*: Sets up an environment to enable you to modify
    the source of an existing component.
 
+-  *devtool ide*: Generates a configuration for an IDE.
+
 -  *devtool upgrade*: Updates an existing recipe so that you can
    build it for an updated set of source files.
 
@@ -632,6 +634,99 @@ command:
       proceed with your work. If you do use this command, realize that
       the source tree is preserved.
 
+Use ``devtool ide`` to generate an configuration for the IDE
+------------------------------------------------------------
+
+``devtool ide`` automatically configures the IDE for cross-compiling and remote debugging.
+The IDE is configured to call for example cmake directly. This has several advantages.
+First of all it is much faster than using e.g. ``devtool build``. But it also allows to
+use the very good integration of build tools like cmake or gdb with VSCode directly.
+
+Two different use cases are supported:
+
+- Generate the IDE configuration for a workspace created by ``devtool modify``.
+
+- Generate the IDE configuration for using a cross-toolchain as provided by
+  ``bitbake meta-ide-support build-sysroots``.
+
+Assuming the development environment is set up correctly and a workspace has been created
+for the recipe using ``devtool modify recipe``, the following command can create the
+configuration for VSCode in the recipe workspace:
+
+   $ devtool ide recipe core-image-minimal --target root@192.168.7.2
+
+What this command does exactly depends on the recipe or the build tool used by the recipe.
+Currently, only CMake and Meson are supported natively.
+
+For a recipe which inherits cmake it does:
+
+- Prepare the SDK by calling bitbake core-image-minimal, gdb-cross, qemu-native...
+
+- Generate a cmake-preset with configures cmake to use exactly the same environent and
+  the same cmake-cache configuration as used by ``bitbake recipe``. The cmake-preset referres
+  to the per-recipe-sysroot of the recipe.
+
+  Currently Configure, Build and Test presets are supported. Test presets execute the test
+  binaries with Qemu.
+
+- Generates a helper script to handle the do_install with pseudo
+
+- Generates some helper scripts to start the gdbserver on the target device
+
+- Generates the ``.vscode`` folder containing the following files:
+
+  - c_ccp_properties.json: configure the code navigation
+
+  - extensions.json: Recommend the extensions which are used.
+
+  - launch.json: Provide a configuration for remote debugging with gdb-cross and gdbserver.
+    The debug-symbols are searched in the build-folder, the per-recipe-sysroot and the rootfs-dbg
+    folder which is provided by the image.
+
+  - settings.json: confgure the indexer to ignore the build folders
+
+  - tasks.json: Provide some helpers for running
+
+    - do_install and ``devtool deploy-target``
+
+    - start the gdbserver via ssh
+
+For a recipe which inherits meson a similar configuration is generated.
+Because there is nothing like a meson-preset a wrapper script for meson is generated.
+
+For some special recipes and use cases a per-recipe-sysroot based SDK is not suitable.
+Therefore devtool ide also supports setting up the shared sysroots environment and generating
+a IDE configurations referring to the shared sysroots. Recipes leading to a shared sysroot
+are for example meta-ide-support or shared-sysroots. Also passing none as a recipe name leads
+to a shared sysroot SDK.
+
+   $ devtool ide none core-image-minimal
+
+In case of a shared sysroot SDK the configuration which gets generated for VSCode exposes the
+cross-tool-chain as a cmake-kit. If a cmake project is loaded into VSCode the cross-toolchain
+can be selected for compiling.
+
+The default IDE is VSCode. Some hints about using VSCode:
+
+- To work with cmake press ``Ctrl + Shift + p``, type cmake.
+  This will show some possible commands like selecting a cmake preset, compiling or running ctest.
+  A cmake kit might be activated by ``Ctrl + Shift + p``, type cmake quick start,
+  if not preset file is in the wokspace.
+
+- To work with meson press ``Ctrl + Shift + p``, type meson.
+  This will show some possible commands like compiling or executing the unit tests.
+
+- For the deployment to the target device, just press ``Ctrl + Shift + p``, type task.
+  Select the install & deploy task.
+
+- For remote debugging, switch to the debugging view by pressing the play button with the bug on the left side.
+  This will provide a green play button with a drop-down list where a debug configuration can be selected.
+  After selecting one of the generated configurations, press the play button.
+
+Additionally ``--ide=none`` is supported.
+With the none IDE some generic configurations files like .gdbinit files and some helper scripts
+are generated.
+
 Use ``devtool upgrade`` to Create a Version of the Recipe that Supports a Newer Version of the Software
 -------------------------------------------------------------------------------------------------------
 
-- 
2.41.0


