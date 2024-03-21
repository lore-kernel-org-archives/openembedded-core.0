Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D51A9C54E68
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 15:19:49 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.10505.1711034384004912155
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Mar 2024 08:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AZM2l4hN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DACBCC0008;
	Thu, 21 Mar 2024 15:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711034382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2vRnD3+WrjI/HsjZTikJ22uG0B56/590Ot+E66zkI08=;
	b=AZM2l4hNrveTQgWS7VZNkAWgTzmdvuRmv/jW4PYvl8gB4MW/FB1OLj+nGQQcVl1Nx+6G3l
	yQUWKqYYzPZi3/4BwBV3Ab5LrrJgruKA3VZZHpfnHn2bUncqcsigLe9J7JoFSmA1WbkTAW
	YU5J7afRrsG64FafW83SZ5v+9aHB+7EyBjIKo6PDRT32S3aEnfJtgE/1IgwPwARY9XUokV
	kIbYvVUEdBdQks52YBjWviPRJLpNIJ7q81qc7bCP+1o0pzi5A9kUCFJYY/7ZyOWfdI0rRq
	UZcxTc9tSeGpdhlcq565M1iYXpVYHF6bPOPCOUjC0T2r+0z2tXXBYgtcPiOVWw==
Date: Thu, 21 Mar 2024 16:19:41 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] toolchain-shar-relocate.sh: Add check for
 missing command 'file'
Message-ID: <20240321151941c828fa8a@mail.local>
References: <20240316173558.468284-1-tom.hochstein@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240316173558.468284-1-tom.hochstein@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 15:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197414

Hello Tom,

On 16/03/2024 12:35:58-0500, Tom Hochstein wrote:
> On a machine without the file command, the SDK install fails with a
> cryptic error message.
> 
> ```
> xargs: file: No such file or directory
> sed: no input files
> Failed to replace perl. Relocate script failed. Abort!
> ```
> 
> Add a test for 'file' to print a clear error message.
> 
> ```
> The command 'file' is required by the relocation script, please install it first. Abort!
> ```
> 
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> ---
>  meta/files/toolchain-shar-relocate.sh | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
> index e8ab357717..3d55e38102 100644
> --- a/meta/files/toolchain-shar-relocate.sh
> +++ b/meta/files/toolchain-shar-relocate.sh
> @@ -1,7 +1,9 @@
> -if ! xargs --version > /dev/null 2>&1; then
> -	echo "xargs is required by the relocation script, please install it first. Abort!"
> -	exit 1
> -fi
> +for cmd in xargs file; do
> +	if ! command -v $cmd &> /dev/null; then

This fails on some of our builders:
https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/9148/steps/12/logs/stdio

> +		echo "The command '$cmd' is required by the relocation script, please install it first. Abort!"
> +		exit 1
> +	fi
> +done
>  
>  # fix dynamic loader paths in all ELF SDK binaries
>  # allow symlinks to be accessed via the find command too
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197256): https://lists.openembedded.org/g/openembedded-core/message/197256
> Mute This Topic: https://lists.openembedded.org/mt/104970783/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

