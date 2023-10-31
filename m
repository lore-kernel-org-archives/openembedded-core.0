Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94FCCC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 11:17:10 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.183479.1698751025110945985
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 04:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MEk6EsCS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B524C0002;
	Tue, 31 Oct 2023 11:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698751022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CboT0b/pCzFVN0BBzIjbkZM+89sBMKcz+OXUGfJVYv4=;
	b=MEk6EsCS3BhQPBN2OwrNbn/0S1ENNor720FsapufdOtPznI29T1Rf72g2T9H7s6NIN3DRu
	+6pWcPla27hU9eWZEeeBXTU//m/mIaHJy4rgIyRGmU6tSPsqKwMn/VGWo1C8kJj5YYYpEN
	Bp04MN5mE2tJlFFSOvKwOZPSFioSsbw5kELh+QVcC4aJAPLXj48A+yoPOGV618is8Xud1w
	9OjOAx0zqDGKR72lShIqyW7b0G6Ag1P2WSFmytsUka23mloFlG2h9bJmr2rorYOEM4eyNt
	+P613oGFneBRXnGPPUESbzDWwmSpydgob+p0VGVZWPXDCDNECv3lxQKFCjAZQQ==
Message-ID: <50eb4ff6-09b8-43a8-8e00-93fede72590f@bootlin.com>
Date: Tue, 31 Oct 2023 12:17:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [OE-core] [PATCH v7 8/8] docs: cover devtool ide
Content-Language: en-US
To: Adrian Freihofer <adrian.freihofer@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20231030213205.2824790-1-adrian.freihofer@siemens.com>
 <20231030213205.2824790-9-adrian.freihofer@siemens.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20231030213205.2824790-9-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 11:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189836

Hi Adrian

Thanks for the new code and the corresponding documentation. See my 
comments below... (also copying the "docs" mailing list).

On 30.10.23 at 22:32, Adrian Freihofer wrote:
> Cover the new devtool ide plugin in the extensible sdk section.
>
> Many thanks to Enguerrand de Ribaucourt for his re-view and
> contributions.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   documentation/sdk-manual/extensible.rst | 158 +++++++++++++++++++++++-
>   1 file changed, 157 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
> index 355c6cb0e4a..361ca091fbf 100644
> --- a/documentation/sdk-manual/extensible.rst
> +++ b/documentation/sdk-manual/extensible.rst
> @@ -230,13 +230,15 @@ all the commands.
>      See the ":doc:`/ref-manual/devtool-reference`"
>      section in the Yocto Project Reference Manual.
>   
> -Three ``devtool`` subcommands provide entry-points into development:
> +Four ``devtool`` subcommands provide entry-points into development:
>   
>   -  *devtool add*: Assists in adding new software to be built.
>   
>   -  *devtool modify*: Sets up an environment to enable you to modify
>      the source of an existing component.
>   
> +-  *devtool ide*: Generates a configuration for an IDE.
> +
>   -  *devtool upgrade*: Updates an existing recipe so that you can
>      build it for an updated set of source files.
>   
> @@ -614,6 +616,160 @@ command:
>         decide you do not want to proceed with your work. If you do use this
>         command, realize that the source tree is preserved.
>   
> +Use ``devtool ide`` to generate a configuration for the IDE
> +-----------------------------------------------------------
> +
> +``devtool ide`` automatically configures IDEs for cross-compiling and remote debugging.
> +
> +Two different use cases are supported:
> +
> +#. *Recipe mode*: Generate the IDE configuration for a workspace created by ``devtool modify``.
> +
> +   In order to use the tool, a few settings must be made.
> +   As a starting example, the following lines of code can be added to the local.conf file.

I would use ``local.conf`` here.

Also, there's a simpler solution to get a code block here:

... to the ``local.conf``file::

       # Build the companion debug file system
       ...

> +
> +   .. code-block::
> +
> +      # Build the companion debug file system
> +      IMAGE_GEN_DEBUGFS = "1"
> +      # Optimize build time: with devtool ide the dbg tar is not needed
> +      IMAGE_FSTYPES_DEBUGFS = ""
> +
> +      # ssh is mandatory, no password simplifies the usage
> +      EXTRA_IMAGE_FEATURES += "\
> +         ssh-server-openssh \
> +         debug-tweaks \
> +      "
> +
> +      # Remote debugging needs the gdbserver on the target device
> +      IMAGE_INSTALL:append = " gdbserver"
> +
> +   Assuming the development environment is set up correctly and a workspace has been created
> +   for the recipe using ``devtool modify recipe``, the following command can create the
> +   configuration for VSCode in the recipe workspace:
> +
> +   .. code-block::
> +
> +      $ devtool ide recipe core-image-minimal --target root@192.168.7.2

Same here.

> +
> +   What this command does exactly depends on the recipe or the build tool used by the recipe.
> +   Currently, only CMake and Meson are supported natively.
> +
> +   For a recipe which inherits ``cmake`` it does:

Since you are talking about the cmake class:

s/``cmake``/the :ref:`ref-classes-cmake` class/

Anyway, I find that the sentence doesn't fit well with the following items.

What about

"Here is it does for a recipe which inherits the 
:ref:`ref-classes-cmake` class:"?

> +
> +   - Prepare the SDK by calling ``bitbake core-image-minimal``, ``gdb-cross``, ``qemu-native``...
> +
> +   - Generate a cmake-preset with configures CMake to use exactly the same environent and
> +     the same cmake-cache configuration as used by ``bitbake recipe``. The cmake-preset referres
> +     to the per-recipe-sysroot of the recipe.
> +
> +     Currently Configure, Build and Test presets are supported. Test presets execute the test
> +     binaries with Qemu.
> +
> +   - Generates a helper script to handle the ``do_install`` with pseudo

s/Generates/Generate/, for consistency with the previous items.

> +
> +   - Generates some helper scripts to start ``gdbserver`` on the target device
> +
> +   - Generates the ``.vscode`` folder containing the following files:


Same here in the above two lines.

> +
> +   - ``c_ccp_properties.json``: configure the code navigation


s/configure/Configure/. Be consistent with the following items.

> +
> +   - ``extensions.json``: Recommend the extensions which are used.
> +
> +   - ``launch.json``: Provide a configuration for remote debugging with ``gdb-cross`` and ``gdbserver``.
> +     The debug-symbols are searched in the build-folder, the per-recipe-sysroot and the rootfs-dbg
> +     folder which is provided by the image.
> +
> +   - ``settings.json``: configure the indexer to ignore the build folders.

s/configure/Configure/


> +
> +   - ``tasks.json``: Provide some helpers for running
> +
> +      - do_install and ``devtool deploy-target``


s/do_install/:ref:`ref-tasks-install`/

> +
> +      - start the ``gdbserver`` via ssh


s/the ``gdbserver``/``gdbserver``/

> +
> +   For a recipe which inherits meson a similar configuration is generated.


s/meson/the :ref:`ref-classes-meson`/

> +   Because there is nothing like a meson-preset a wrapper script for meson is generated.

s/meson-preset/Meson preset/ (that's something you use later anyway)

s/meson/Meson/

> +
> +   It's possible to pass multiple recipes to the ``devtool ide`` command.
> +   ``devtool ide`` tries to handle the recipes in a reasonable way if possible.
> +
> +   ``devtool ide`` aims to support multiple programming languages and multiple IDEs natively.
> +   Native means that the IDE is configured to call the build tool (e.g. cmake or meson) directly.


s/cmake or meson/CMake or Meson/

> +   This has several advantages. First of all, it is much faster than ``devtool build``, for example.
> +   But it also allows to use the very good integration of tools like CMake or GDB directly with VSCode or other IDEs.
> +   However, supporting many programming languages and multiple IDEs is quite an elaborate and constantly evolving thing.
> +   To handle combinations that are not natively supported, devtool ide creates a configuration that falls back


s/devtool ide/``devtool ide``

> +   to ``devtool build`` and ``devtool deploy-target`` if there is no native support available.
> +
> +   The default IDE is VSCode. Some hints about using VSCode:
> +
> +   - To work with CMake press ``Ctrl + Shift + p``, type ``cmake``.
> +     This will show some possible commands like selecting a CMake preset, compiling or running ctest.


s/ctest/``ctest``?

> +     A cmake-kit might be activated by ``Ctrl + Shift + p``, type ``cmake`` quick start,


s/cmake-kit/CMake kit/

> +     if not preset file is in the wokspace.
> +
> +   - To work with meson press ``Ctrl + Shift + p``, type meson.

To work with Meson press ``Ctrl + Shift + p``, type ``meson``.


> +     This will show some possible commands like compiling or executing the unit tests.
> +
> +   - For the deployment to the target device, just press ``Ctrl + Shift + p``, type task.


type ``task``

> +     Select the install & deploy task.

``install & deploy``?

> +
> +   - For remote debugging, switch to the debugging view by pressing the play button with the bug on the left side.

s/play/"play"/>

s/bug/bug icon/?

> +     This will provide a green play button with a drop-down list where a debug configuration can be selected.


Same here for "play"

> +     After selecting one of the generated configurations, press the play button.


Same here.

> +
> +   Additionally ``--ide=none`` is supported.
> +   With the none IDE some generic configurations files like ``.gdbinit`` files and some helper scripts
> +   are generated.
> +
> +   .. note::
> +
> +      To ensure that the debug symbols on the build machine match the binaries running on the target system,
> +      it is essential that the image built by ``devtool ide`` is running on the target system.
> +
> +#. *Shared sysroots mode*: Generate the IDE configuration for using a cross-toolchain as provided by
> +   ``bitbake meta-ide-support build-sysroots``.
> +
> +   For some special recipes and use cases a per-recipe-sysroot based SDK is not suitable.
> +   Therefore ``devtool ide`` also supports setting up the shared sysroots environment and generating
> +   a IDE configurations referring to the shared sysroots. Recipes leading to a shared sysroot


s/a IDE configurations/an IDE configuration/?

> +   are for example meta-ide-support or shared-sysroots. Also passing none as a recipe name leads
> +   to a shared sysroot SDK.


``meta-ide-support``or ``shared-sysroots``?
``none``

> +
> +   .. code-block::
> +
> +      $ devtool ide none core-image-minimal
> +
> +   In case of a shared sysroot SDK the configuration which gets generated for VSCode exposes the
> +   cross-tool-chain as a cmake-kit. If a cmake project is loaded into VSCode the cross-toolchain


s/cmake-kit/CMake kit/

s/cmake project/CMake project/

> +   can be selected for compiling.
> +
> +   For some special recipes and use cases a recipe-sysroot based SDK is not suitable.
> +   Therefore ``devtool ide`` also supports setting up the shared sysroots environment and generating
> +   a IDE configurations referring to the shared sysroots. Recipes leading to a shared sysroot


an IDE configuration?

> +   are for example meta-ide-support or shared-sysroots. Also passing none as a recipe name leads
> +   to a shared sysroot SDK.


You are here repeating the same sentence as a few lines above. Are you 
sure you meant to do that?

> +
> +   .. code-block::
> +
> +      $ devtool ide none core-image-minimal
> +
> +   In case of a shared sysroot SDK the configuration which gets generated for VSCode exposes the
> +   cross-tool-chain as a cmake-kit. If a CMake project is loaded into VSCode the cross-toolchain


s/cmake-kit/CMake kit/

> +   can be selected for compiling. The following example shows how the cross-toolchain can be
> +   selected in VSCode.
> +
> +
> +   .. code-block::
> +
> +      mkdir kit-test
> +      echo "project(foo VERSION 0.1)" > kit-test/CMakeLists.txt
> +      code kit-test
> +
> +      Ctrl + Shift + P --> CMake: Scan for Kits
> +      Ctrl + Shift + P --> CMake: Select a Kit
> +
>   Use ``devtool upgrade`` to Create a Version of the Recipe that Supports a Newer Version of the Software
>   -------------------------------------------------------------------------------------------------------


Good luck for the edits!
Could you let me know when the code changes made it to the master 
branch? This way I know I can merge the documentation too.

Thanks again for your work.
Cheers
Michael.


-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


