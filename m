Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8447C05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:31:35 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.4001.1675845085994550718
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:31:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CLsbrpwx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CCCB61BF219;
	Wed,  8 Feb 2023 08:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675845083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OrdwFNmVaJ9/fOOWHyAiRHKOYFtnXBHKH5eVwk5yudc=;
	b=CLsbrpwxlB2bg8EH0o/O6kWGIFQipAllvUjK2Yk3bz2Tz2J7Vbtdk9+Wkm6IkF0MRIwUCl
	+IZCVC0uxDIyMCO+I55lktMDbBitSYM6pnA29aPL+Vg7fjPSrXZo0yzvZDvDl7WXBvLlOO
	yJlIUaq8iyc7F6ZM9SeZPzRQdmWvL4EILDZ+rQCdQ74pIm+sHtYdkdtmt8rUl8+12cF0Ca
	iya2vug+JtuBlU6GrP1995l6LbvVTpxpvuGE58blAA52RRKv69Y7GJWo+2+Qr62gS2sNWc
	4/LLC2djVrVaSn2vT2lU3k9hr1LRUiV8SR2yIJeBUY04ABv+/0IslLql2nasfg==
Date: Wed, 8 Feb 2023 09:31:20 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Cc: Kareem Zarka <zarkakareem@gmail.com>,
 openembedded-core@lists.openembedded.org, Stefan Schmidt 
 <stefan.schmidt@huawei.com>, Kareem Zarka <kareem.zarka@huawei.com>
Subject: Re: [OE-core] [PATCH] wic/plugins/source/bootimg-efi: Skip
 installing kernel-image into boot.
Message-ID: <20230208093120.5b05011a@booty>
In-Reply-To: <9910648fe8bc6cf03ce56385c038edee6502ea57.camel@linuxfoundation.org>
References: <20230206191615.2675373-1-kareem.zarka@huawei.com>
	<20230207114926.0c04b79d@booty>
	<9910648fe8bc6cf03ce56385c038edee6502ea57.camel@linuxfoundation.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 08:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176896

Hello Richard, Kareem,

On Tue, 07 Feb 2023 12:32:31 +0000
"Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2023-02-07 at 11:49 +0100, Luca Ceresoli via
> lists.openembedded.org wrote:
> > Hello Kareem,
> > 
> > thanks for your patch.
> > 
> > I have a few suggestions to improve it, see below.
> > 
> > On Mon,  6 Feb 2023 20:16:14 +0100
> > "Kareem Zarka" <zarkakareem@gmail.com> wrote:
> >   
> > > The issue with installing the kernel-image to both rootfs
> > > and boot partition is that some systems rely on the kernel-image in
> > > rootfs and not in the boot partition.
> > > This leads to duplication of the kernel-image, which can cause
> > > unnecessary storage usage and potential compatibility issues.  
> > 
> > Except for the use of unnecessary storage, I don't understand exactly
> > what problems can be created by duplication.
> >   
> > > This patch provides a solution to this problem by adding a new
> > > parameter "skip-kernel-install" to the wic kickstart file, which can
> > > be passed to the plugin.
> > > If the parameter is provided, the plugin will skip installing the
> > > kernel-image to the boot partition, avoiding duplication and potential
> > > issues.
> > > 
> > > By adding this new parameter, we give the users the option to install
> > > the kernel-image only in rootfs, or to install it in both rootfs and
> > > boot partition, depending on their needs and preferences.
> > > This will help to improve the system's storage usage and compatibility.
> > > 
> > > Tests for this functionality will be added in the next patch.
> > > 
> > > Signed-off-by: Kareem Zarka <kareem.zarka@huawei.com>
> > > ---
> > >  scripts/lib/wic/plugins/source/bootimg-efi.py | 10 +++++++---
> > >  1 file changed, 7 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
> > > index 4b00913a70..363b9f5242 100644
> > > --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> > > +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> > > @@ -363,9 +363,13 @@ class BootimgEFIPlugin(SourcePlugin):
> > >                  objcopy_cmd += " %s %s/EFI/Linux/linux.efi" % (efi_stub, hdddir)
> > >                  exec_native_cmd(objcopy_cmd, native_sysroot)
> > >          else:
> > > -            install_cmd = "install -m 0644 %s/%s %s/%s" % \
> > > -                (staging_kernel_dir, kernel, hdddir, kernel)
> > > -            exec_cmd(install_cmd)
> > > +            # skip-kernal-install was added to source_params to conifgure installing the kernel-image.
> > > +            # set skip_kernal_install in the kickstart file to skip installing it into hdddir.
> > > +            # if not set then the kernel-image will be installed.  
> > 
> > s/conifgure/configure/
> > Also check underscores vs dashes.
> > 
> > A comment in the code is welcome, but it should not include the history
> > of why this got added. When someone will read this three years from now
> > they don't care. So just remove the first line.
> >   
> > > +            if not  source_params.get('skip-kernal-install'):  
> > 
> > s/kernal/kernel/, also on other lines.
> > Also remove the unneeded double space.
> > 
> > Out of personal taste, I would prefer a positive logic rather than a
> > negative one, e.g.:
> > 
> >     if source_params.get('install-kernel-into-boot-dir') != "false":  
> 
> Whilst I know what you mean, that isn't valid python and the original
> code is probably more pythonic in that "XXX != False" is a bit
> different to "not XXX" in python.

Aa, sure, consider the above line just quickyl written pseudocode! :-)

Regardless of the implementation, my idea is this:
 * install-kernel-into-boot-dir is True  -> kernel is installed
 * install-kernel-into-boot-dir is False -> kernel is not installed
 * install-kernel-into-boot-dir not set -> kernel is installed (for backward compatibility)

But as I said, this is out of personal taste and I have a limited
perception of the whole problem.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

