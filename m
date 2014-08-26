Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 285B4710B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 19:43:58 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id 10so1928879lbg.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 12:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=vC7d0ireQJzZRvF0nOItnzG0uAIJ5p79Tf3I+VGlLmA=;
	b=ssVJAW0q1I16TnYa4cwU/wvHFP3TGjBhn4YtpWR7oF4ZjxB/RFCnKoonJM9AHTbzO/
	y/HI6jrKHWCwish7ohOBI0cP3/JQjpDUYGUrvX/FiaWEU6zUxS7hmZ/mSBuH+GL0gR+r
	bXtTRRRaecb3GlnItBJ1qNjYe8wircCdqDrjlEnPLjyecQOkundQ482uXAxPSrXwmGst
	HFXu3P//RYKlG/+ugh+jdMZWTcD7DGccEcbHb2fT+dSHpjYN5S/psFdZ2BwqXMMMcm3h
	7DFYAX3vGBERDN0SVkVP60x7UIoVk3ET0Q61c9AM3ViOpVTg5/g7emof+1T4y1O52d/J
	bxjw==
MIME-Version: 1.0
X-Received: by 10.112.165.68 with SMTP id yw4mr28690366lbb.5.1409082238509;
	Tue, 26 Aug 2014 12:43:58 -0700 (PDT)
Received: by 10.112.202.67 with HTTP; Tue, 26 Aug 2014 12:43:58 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1408261510310.8225@localhost>
References: <alpine.LFD.2.11.1408261510310.8225@localhost>
Date: Tue, 26 Aug 2014 15:43:58 -0400
Message-ID: <CADkTA4MAOB21eT+pM7BE4nxXWm1PSOv2EPFmoLY8T2-gAu4HWA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: is INITRAMFS_TASK still useful, or can it be tossed?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Aug 2014 19:44:06 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 26, 2014 at 3:14 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   just noticed the following -- here's snippets from kernel.bbclass:
>
> ... snip ...
> INITRAMFS_TASK ?= ""
> ... snip ...
>     # NOTE: setting INITRAMFS_TASK is for backward compatibility
>     #       The preferred method is to set INITRAMFS_IMAGE, because
>     #       this INITRAMFS_TASK has circular dependency problems
>     #       if the initramfs requires kernel modules
>     image_task = d.getVar('INITRAMFS_TASK', True)
>     if image_task:
>         d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
>     ... snip ...
>         if [ "$use_alternate_initrd" = "" ] && [ "${INITRAMFS_TASK}" != "" ] ; then
>                 # The old style way of copying an prebuilt image and building it
>                 # is turned on via INTIRAMFS_TASK != ""
>     ... snip ...
>
>   i have about a dozen layers checked out and the only other place i
> see that variable used is:
>
> meta-oe/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb:
>   INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_rootfs"

check meta-handheld, it was an existing use case we didn't want to break.

Bruce

>
> so has INITRAMFS_TASK been obsoleted by INITRAMFS_IMAGE? or is it
> still worth hanging onto?
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

