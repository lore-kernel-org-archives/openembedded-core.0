Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB3FC43334
	for <webhook@archiver.kernel.org>; Fri, 24 Jun 2022 14:34:38 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.8315.1656081269821853047
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jun 2022 07:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Rrylt4Fa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7BC1340003;
	Fri, 24 Jun 2022 14:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656081268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tCa7zVEG9kwiUyp7R4IlkbspBTKxwXU1vw0VlHECAUM=;
	b=Rrylt4Fa3vwgH+XB3MxLntUV6AOpQ0WPOxiPFk6LJkz/XbZSSWJ7fz8PQkZONI8sxchtTX
	LdNufOjaJbJ3lNsUKfnCTSdjnyBPZljekgrC7WGLcBOypU1+Oxr6iHaloFQIlTARqd+0Dr
	3J7NT6AnPc+BYIUBpI4zhU8jCLaweMtyqdt9oh9Go1Dz+DlbGobImt+2Q/GiwmUltt2A8o
	3ul30xBxddcBg0l2Wp1CcJcpVn84s8jPwWF7xVEm/VIHTy/yhOyh0MVg3T158vupW8jihL
	bvby3WxyP7Zowh4lrXmycTlvIMYvgImDnhegqZUwuY3Mz7J9EWmDzaUFFzG87g==
Date: Fri, 24 Jun 2022 16:34:26 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] packagegroup-core-ssh-dropbear: Add
 openssh-sftp-server recommendation
Message-ID: <20220624163426.4b3e0d56@booty>
In-Reply-To: <20220624135817.259030-1-richard.purdie@linuxfoundation.org>
References: <20220624135817.259030-1-richard.purdie@linuxfoundation.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jun 2022 14:34:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167294

Hi Richard,

On Fri, 24 Jun 2022 14:58:17 +0100
"Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:

> Seems sad to have to do this but openssh is moving to use sftp instead
> of scp to move files. This means scp from Fedora 36 will no longer be
> able to move files to/from a dropbear based image. This breaks a number
> of our key QA tests and I suspect will cause users pain too.
> 
> The sftp server from openssh is small (200kb uncompressed) and standalone
> so adding it to the packagegroup seems to be the best way to preserve user
> sanity. If people really don't want it, they can just use dropbear instead
> of the packageground.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> v2: Make a reccomentation, tweak commit message
> 
> 
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
> index 4f844ad9255..d06c6a56095 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
> @@ -4,3 +4,4 @@ PR = "r1"
>  inherit packagegroup
>  
>  RDEPENDS:${PN} = "dropbear"
> +RRECOMMENDS:${PN} = "openssh-sftp-server"

This fixes some failures but triggers some new ones:

Error: 
 Problem: package dropbear-dev-2022.82-r0.mips64 requires dropbear = 2022.82-r0, but none of the providers can be installed
  - package dropbear-2022.82-r0.mips64 conflicts with openssh provided by openssh-9.0p1-r0.mips64
  - package openssh-9.0p1-r0.mips64 conflicts with dropbear provided by dropbear-2022.82-r0.mips64
  - package openssh-dev-9.0p1-r0.mips64 requires openssh = 9.0p1-r0, but none of the providers can be installed
  - conflicting requests

https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/5414/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/5414/steps/11/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

