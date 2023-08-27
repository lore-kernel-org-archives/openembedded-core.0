Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D63C83F13
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 19:32:39 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.4407.1693164755044113940
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 12:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ItBBSS1q;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-99bfcf4c814so319229066b.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 12:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693164753; x=1693769553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoenDSfxEhrJSXJzwNF0qUZi4ZdzROlnUR735GqJdd4=;
        b=ItBBSS1qa4O8u9q0sdhu0zs6qNrV3hN/H7URDg587rr3HlmO4AwKo+6/1LIILkiUGi
         GSzF2a/0x8io/AlLfW+dsviv8bxqvIFGxLuWOj/sMcPV7nkbg1MwNzwGIqz8DpKU8cKq
         pJ2BSufpYYLE1uCc/94v69A9ftvwuvNSyT2EJkYQ2rcH6K3CmC5ZZFcofDZd2c9QdLRr
         GzPxUuZfEKpvPHBa3leOHixXK9BeXO/IVKZcAYji3Izj6smqdHCtYOJRcQEqwS9CmWae
         5Uzz9u13tUzy/ogaFMHoatHSB2sSj63kF+DRtFjH5EjpaW35leKfgFw+yN6SfUolgvKk
         cB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693164753; x=1693769553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AoenDSfxEhrJSXJzwNF0qUZi4ZdzROlnUR735GqJdd4=;
        b=SIRhb41ByQFVcnogoQzpcv2eSegTqFzQVKLzYj5RsEk+k3BoPaCjh/y6EGbW1mpJnu
         ZfmqR9S4pK1oq0O+4gTpjq8DAepYY/JsGQ1HcQ7ZYk3sNm6wXM85S79T1o+dM6m65O6U
         bW34UIshNT+FXI32jmDN19kI9onXyzioEfmWQFgEmyX3ttJUFhZhxY3qnx35mBXfKcnP
         nAWCy5HhDXwUVoJ7s6kExayNz9oNzZLKMUtUn1GSOF45vD1Ynxzwp7wr7NmHuMZu6bwJ
         xO7EKLFMlYBoD74bNxH5DeD7NfNU2kPt4ctqYvfr/kHF3CVbtwZbbXV0pTxH8KUqT1dp
         6uIw==
X-Gm-Message-State: AOJu0YwQ7+5X+JfGCpweSHO4xfhBaN0Qoamz5EsSamCmEBlt1O2F9Lat
	wy5tCfJD7CkoXPjJANObnPulrEx+sfM=
X-Google-Smtp-Source: AGHT+IE7VQQFogk1pKxZv5Wc7ocj4lQu4sis9u800MEe+UabPRJf0a+pt6362aa9RNgr3mkcDs8JAw==
X-Received: by 2002:a17:906:51c5:b0:9a5:b813:e3a8 with SMTP id v5-20020a17090651c500b009a5b813e3a8mr96484ejk.28.1693164753119;
        Sun, 27 Aug 2023 12:32:33 -0700 (PDT)
Received: from t14s-af._sites.dc._msdcs.ad007.siemens.net ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id lv12-20020a170906bc8c00b009a19701e7b5sm3740261ejb.96.2023.08.27.12.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 12:32:32 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 13/13] docs: cover devtool ide
Date: Sun, 27 Aug 2023 21:29:55 +0200
Message-ID: <20230827193200.4083340-14-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230827193200.4083340-1-adrian.freihofer@siemens.com>
References: <20230827193200.4083340-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 19:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186793

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


