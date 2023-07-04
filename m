Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00D8EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 20:58:31 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.3608.1688504302028179115
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 13:58:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TqdiHVG7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: luca.ceresoli@bootlin.com)
X-GND-Sasl: luca.ceresoli@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688504300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c48J3dJDWDSYArMzo5Op/Kli9bPp9muD5mElbZbZPVE=;
	b=TqdiHVG7k0joc8JF6x83ceGE6X7C/VZNT+uozZGP3cIm9ZU3uElM0LBcY0ioIIP29sN+3Q
	I0OuazAxNYI2DM4BS+wYlCUSFQuincEwAx5jJVT/in5YLandmJKMaOs5B9UoaY40Rss+An
	o0d4bKsxE9aoFQBTyB7e+dZ5hLXfFsyL26510qfnTydU4Wjc/+bJGqR98ip38CR2Q8F6U6
	2qJMf2/cVmHcvqHZbnrM9GFDoEeKMl/phh8NX7rVTzj/b35DlXaOAOUGrYCJIUaxaKmewB
	R3OridnuV46SAD5vLrg28NzhTQZdKyHLpA7ZPv8b7y9r7/F7vqDt4znD6Evv/Q==
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76A7B1C0003;
	Tue,  4 Jul 2023 20:58:19 +0000 (UTC)
Date: Tue, 4 Jul 2023 22:58:16 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, Richard Purdie
 <richard.purdie@linuxfoundation.org>, Bruce Ashfield
 <bruce.ashfield@gmail.com>
Subject: Re: [OE-core] [PATCH v2] kernel.bbclass: hoist up "unset S" bbfatal
 from kernel-yocto.bbclass to kernel.bbclass
Message-ID: <20230704225816.1f9fefeb@booty>
In-Reply-To: <20230630150651a71148e4@mail.local>
References: <20230626135024.34405-1-luca.ceresoli@bootlin.com>
 <20230630150651a71148e4@mail.local>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 20:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183872

Hello Richard, Bruce,

On Fri, 30 Jun 2023 17:06:51 +0200
Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:

> Hello,
> 
> This caused the following failures on the AB:
> 
> stdio: ERROR: linux-yocto-6.1.35+gitAUTOINC+b358c237cf_915f4d2237-r0 do_symlink_kernsrc: S is not set to the linux source directory. Check the recipe and set S to the proper extracted subdirectory.
> stdio: ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/linux-yocto/6.1.35+gitAUTOINC+b358c237cf_915f4d2237-r0/temp/log.do_symlink_kernsrc.3914759
> stdio: ERROR: Task (/home/pokybuild/yocto-worker/qemuarm/build/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_symlink_kernsrc) failed with exit code '1'
> stdio: ERROR: Command . ./oe-init-build-env; bitbake core-image-sato core-image-sato-sdk core-image-minimal core-image-minimal-dev core-image-sato:do_populate_sdk -k failed with exit code 1, see errors above. (1687981572.9: 11986.3)

v2, where I removed the "not git" condition as discussed[0], fails
because the check is *before* do_kernel_checkout, so the move/clone has
not been done yet. And cannot be done before in the git case as it
could be a bare repo thus no Makefile exists yet anywhere.

I think there are two options:

 1. Move the check *after* do_kernel_checkout, when the source code
    must be there
 2. Revert to the v1 approach, which checks only in the tarball case as
    the current code does

I think it is better to check sooner rather than later (before git init
+ git add in the tar case). Not only because the user would be warned
as soon as reasonably possible, but also because an error might cause
a error path in do_kernel_checkout anyway.

So unless there are better ideas I would get back to initial approach,
possibly with a different patch to take into account the comments from
both of you.

[0]
https://lore.kernel.org/openembedded-core/674d0a964611cc1e5451318976f17a4a24cbca5a.camel@linuxfoundation.org/#t

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

