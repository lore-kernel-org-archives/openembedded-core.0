Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C068AEE57DF
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 11:55:10 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.56530.1694433299827070393
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Sep 2023 04:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eTI6QQUl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A5DF6000F;
	Mon, 11 Sep 2023 11:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694433297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D/YTlWw8ub12S6ZwpyjxDH6ai/SC24UjakI2JInpucU=;
	b=eTI6QQUldYVWsBOofF2SD6h00GtGpouc/URekmS6bI00dROUpwZPO9oTWMAN6vNjvXGnwB
	FMm6Xvc4JmIxpBGYoB/kjATO529AC3Wr1mRiLAAd/uTf7nrw2nqk50Wwx2PJXkAeBz82h2
	RiH+CoOOoy1lpDbVol2k5jqrKwmyOY7+znM0/5TvhXu6IlP3MfksQcFhfnEn/iboH6d32B
	L4fz0z+7YchGetnSsu2JuQPlYUH2/xGtaFDXcKBPs9fX2mgocyQk26ID21msNewi8eOFoD
	aln4YFZcnVbdGudMG449tf6Wv6QGA03hhULrXwXmxAqsnjejpLD2GRJrBkOUpg==
Message-ID: <09a3df61-5b45-f5bb-d253-480c8ce77459@bootlin.com>
Date: Mon, 11 Sep 2023 13:54:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v6 12/12] docs: cover devtool ide
Content-Language: en-US
To: Adrian Freihofer <adrian.freihofer@gmail.com>
References: <20230910161850.4032227-1-adrian.freihofer@siemens.com>
 <20230910161850.4032227-13-adrian.freihofer@siemens.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20230910161850.4032227-13-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 11:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187489

Hi Andrian

Many thanks for the documentation patch!
Copying the docs@ mailing list...

On 10.09.23 at 17:52, Adrian Freihofer wrote:
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   documentation/sdk-manual/extensible.rst | 97 ++++++++++++++++++++++++-
>   1 file changed, 96 insertions(+), 1 deletion(-)
>
> diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
> index 9e08e57a4e7..d05d4e36aa7 100644
> --- a/documentation/sdk-manual/extensible.rst
> +++ b/documentation/sdk-manual/extensible.rst
> @@ -237,7 +237,7 @@ all the commands.
>      devtool
>      quick reference.
>   
> -Three ``devtool`` subcommands provide entry-points into
> +Four ``devtool`` subcommands provide entry-points into
>   development:
>   
>   -  *devtool add*: Assists in adding new software to be built.
> @@ -245,6 +245,8 @@ development:
>   -  *devtool modify*: Sets up an environment to enable you to modify
>      the source of an existing component.
>   
> +-  *devtool ide*: Generates a configuration for an IDE.
> +
>   -  *devtool upgrade*: Updates an existing recipe so that you can
>      build it for an updated set of source files.
>   
> @@ -632,6 +634,99 @@ command:
>         proceed with your work. If you do use this command, realize that
>         the source tree is preserved.
>   
> +Use ``devtool ide`` to generate an configuration for the IDE


s/an configuration/a configuration/

> +------------------------------------------------------------
> +
> +``devtool ide`` automatically configures the IDE for cross-compiling and remote debugging.
> +The IDE is configured to call for example cmake directly. This has several advantages.
> +First of all it is much faster than using e.g. ``devtool build``. But it also allows to
> +use the very good integration of build tools like cmake or gdb with VSCode directly.

For consistency with the other parts of the manual, it would be better 
to use:

  * CMake or ``cmake``
  * GDB or ``gdb``

> +
> +Two different use cases are supported:
> +
> +- Generate the IDE configuration for a workspace created by ``devtool modify``.
> +
> +- Generate the IDE configuration for using a cross-toolchain as provided by
> +  ``bitbake meta-ide-support build-sysroots``.
> +
> +Assuming the development environment is set up correctly and a workspace has been created
> +for the recipe using ``devtool modify recipe``, the following command can create the
> +configuration for VSCode in the recipe workspace:


You should have "::" at the end of the line here. That's how a 
blockquote is introduced.


> +
> +   $ devtool ide recipe core-image-minimal --target root@192.168.7.2
> +
> +What this command does exactly depends on the recipe or the build tool used by the recipe.
> +Currently, only CMake and Meson are supported natively.
> +
> +For a recipe which inherits cmake it does:
> +
> +- Prepare the SDK by calling bitbake core-image-minimal, gdb-cross, qemu-native...

``bitbake core-image-minimal``, ``gdb-cross``, ``qemu-native``.

> +
> +- Generate a cmake-preset with configures cmake to use exactly the same environent and
> +  the same cmake-cache configuration as used by ``bitbake recipe``. The cmake-preset referres
> +  to the per-recipe-sysroot of the recipe.
> +
> +  Currently Configure, Build and Test presets are supported. Test presets execute the test
> +  binaries with Qemu.


Missing ":" before the bullet list?

> +
> +- Generates a helper script to handle the do_install with pseudo


s/the do_install/``do_install``/?

> +
> +- Generates some helper scripts to start the gdbserver on the target device


s/the gdbserver/``gdbserver``/?

> +
> +- Generates the ``.vscode`` folder containing the following files:
> +
> +  - c_ccp_properties.json: configure the code navigation
> +
> +  - extensions.json: Recommend the extensions which are used.
> +
> +  - launch.json: Provide a configuration for remote debugging with gdb-cross and gdbserver.
> +    The debug-symbols are searched in the build-folder, the per-recipe-sysroot and the rootfs-dbg
> +    folder which is provided by the image.
> +
> +  - settings.json: confgure the indexer to ignore the build folders
> +
> +  - tasks.json: Provide some helpers for running
> +
> +    - do_install and ``devtool deploy-target``
> +
> +    - start the gdbserver via ssh


You also need double backquotes in the filenames above.

> +
> +For a recipe which inherits meson a similar configuration is generated.
> +Because there is nothing like a meson-preset a wrapper script for meson is generated.
> +
> +For some special recipes and use cases a per-recipe-sysroot based SDK is not suitable.
> +Therefore devtool ide also supports setting up the shared sysroots environment and generating
> +a IDE configurations referring to the shared sysroots. Recipes leading to a shared sysroot
> +are for example meta-ide-support or shared-sysroots. Also passing none as a recipe name leads
> +to a shared sysroot SDK.

Same here, "::" at the end of the line.
Don't hesitate to submit a V2 of this one, and ping me when your code 
patches are merged.

Thanks again for your help with the documentation!
Cheers

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


