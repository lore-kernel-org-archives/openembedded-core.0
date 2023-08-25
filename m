Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83034FC616B
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 22:27:53 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.2568.1693002468337200657
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 15:27:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=PB2gzdsV;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5298e43bb67so2973398a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 15:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693002466; x=1693607266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoenDSfxEhrJSXJzwNF0qUZi4ZdzROlnUR735GqJdd4=;
        b=PB2gzdsVJSl9JWcCzCl4HPrI7M0k2kadcvm6dkRuAxwlPQM9e0k8pYpY6QXcYy2xJ9
         LXAfHBjB6d8thCWDqqp+X2uDKnh+KATG0h97Gve7xkPNLl+SzwL+MzRemJesX0Vaxhi4
         bve32JdnnrsiYNPJCR9NqMJEPLSAcAolbjchMk2TY1jeXivZZYkK2DzQcD2Bs9FYClo+
         BIsvoJ/RHBknTSHtBYoz6fyt+ZII2qEItC3zJ+hsPbuXCuI9NAHgQMk9RSQXWZ7GZBaQ
         32nZdsQMeRUqjr9NaULc1ZZ5K85eBJcPKz+RZGSaAYxdrOQDuFZra0oc418Wu7SwDEeY
         gQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693002466; x=1693607266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AoenDSfxEhrJSXJzwNF0qUZi4ZdzROlnUR735GqJdd4=;
        b=hC9+mIqy5ptsBb49VvuDqMk6ObvrOXF0TjDdXUTa1xAMoML9myuBMoxToFWZt2oGu+
         hDQlFnylmh8mj1PrNXhVvHit9EdwVN00OeJ0ytODSY26M/cDzNoOXMX7eauY0LcHjrTV
         z6cTFlzd54Q9mlcKxn7V7aM8u0jAOSWDrHbxP/dzPUjfeLrBhH8T048aPtwovKBvkXoT
         eGmixYFRWwFm2t9QCeDsWhqN9COgmTPG0nV5K5KBHUTd65iDn27NF+jK4f7m56B8VR9Q
         uXmToaJ95ScyX/Tsi2bMduH3R8k1kZG3FN6uhqsYPJlJiEKukw6SEP2F/pYRHVw3OLDR
         E1rw==
X-Gm-Message-State: AOJu0Yw+4l+q+6SkCUBi/ifgy0CZszuDjLicv4YVc0phu4wnQliVzYr+
	byxKhGj/ur3W+Od87kEtjbPj5JNqkMY=
X-Google-Smtp-Source: AGHT+IFRz/Bbpn0Qhvlngj9jUsU0d3NifUBcr8Q6/0A2ESMgXYtCcauaK4jTA2c6Wnz/rfev7r0c8A==
X-Received: by 2002:a05:6402:1e93:b0:521:ef0f:8ef9 with SMTP id f19-20020a0564021e9300b00521ef0f8ef9mr21500180edf.19.1693002466469;
        Fri, 25 Aug 2023 15:27:46 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id n24-20020aa7d058000000b0050488d1d376sm1449057edo.0.2023.08.25.15.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 15:27:45 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 13/13] docs: cover devtool ide
Date: Sat, 26 Aug 2023 00:25:53 +0200
Message-ID: <20230825222711.2735745-14-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825222711.2735745-1-adrian.freihofer@siemens.com>
References: <20230825222711.2735745-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 22:27:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186740

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


