Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DF1EEB57D
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 16:19:39 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.39130.1694362770777027885
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Sep 2023 09:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=d/vsVVDy;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-307d20548adso3652194f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 09:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694362769; x=1694967569; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoenDSfxEhrJSXJzwNF0qUZi4ZdzROlnUR735GqJdd4=;
        b=d/vsVVDy/2ZK5pcyH7VapqQGMuiKyPnooEzkdH4/FyZC37fFLgBdQyLtbduVsrDpfo
         1gfe4Tn1F9yfwwZck9kibtzcwQJigsIZbhR9V7Sv/WbJQzGhU2Zsjf1KxhKR9VzGeP+w
         gHStm5xS+cETbuOA+KsuhKaCKwK7CYvIB5mBy7OjopwQKobUHrEjcTpgf5ZPPs+0nEUo
         wpDNY7Urvi+HvovbP/8FuOvG2yQERVPxaJTB4mnIqGGXkc1ULfcddhOkSXbC1zst8rwX
         bKu2vPHWK88+o4Lsjv5gwmZpdnkwi/7Ph/mb+eajxVPwImXadFApB3Law9uoQFncVvzb
         VhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694362769; x=1694967569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AoenDSfxEhrJSXJzwNF0qUZi4ZdzROlnUR735GqJdd4=;
        b=Auf4jUP8RQH6kd/LNQBL/fY+VIrn9r/vgdnm4ZtA3M0jceapF8/1JX+L6Kg3fEpFJK
         ThXpONNpGUS1Lh2uCbwlYVzlGmZaEuqhMgZtRvHQGgDqXf+LsIZ76LKbtD3morPCy6Ee
         gVeDpr+nQkkuIMqEB5tBAUjnmI1PnokZbpj2AJV0ehjBRwjL036eVGbkzxsAfFB4vuI+
         Lbuj1ba2LYG3qZvDplaDYz7Yc3kmDGSHiuUm4/BauYP2b+UMS3dFvayKmbJMK7sHP/z0
         PcS8CjTsXSiaJAWVeuo7pqSWDbAyL/GDfNJw13exb747/bhMTC3TVMt9PAfEXotAMJJv
         nLAA==
X-Gm-Message-State: AOJu0Yytn1eIqhOLySTU1zM7+ABAX0uqdnK3ZZ/KSYZl6jAj9mXM0S0v
	Sq8eRlPWLBmu3mKgwRlDkjk8UzDJ2fc=
X-Google-Smtp-Source: AGHT+IHFscbUoyp36emfChJc3KPojtVFJmRmigXqV1Dx3Oi+AYMToAOs5wbQvOWWzeoKdAYITquMHA==
X-Received: by 2002:adf:f74e:0:b0:319:83e8:fccf with SMTP id z14-20020adff74e000000b0031983e8fccfmr5811276wrp.23.1694362768990;
        Sun, 10 Sep 2023 09:19:28 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:dcf2:2f65:9442:83f])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d408c000000b003142ea7a661sm7605431wrp.21.2023.09.10.09.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 09:19:28 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH v6 12/12] docs: cover devtool ide
Date: Sun, 10 Sep 2023 17:52:38 +0200
Message-ID: <20230910161850.4032227-13-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230910161850.4032227-1-adrian.freihofer@siemens.com>
References: <20230910161850.4032227-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 16:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187470

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


