Return-Path: <andrea.adami@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 812C572491
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 08:27:06 +0000 (UTC)
Received: by iecvy18 with SMTP id vy18so27627874iec.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 00:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=O0Tz3Y0w1x+btlF3kLkiYTupPv+hDntbfQzzggYKQVI=;
	b=n4w+jreOaXMMOApZzd6VVanglCKdrfjcteNlBk1gdW0hXRfFUO3OE0Ejt/UxfCM6RB
	RdKUdBGrkOXBx1iu9leDVD91gS9d0a86Kz3kKJqCMzh8mprGP+h8Ga8UwcI/lqdqfAdI
	VuVMOWv1Uc6Ep1T1H0l4fpnRSYhLOCbYueH0uKlwKiPEJp/2GSc9vxVAeUFlkEVGIgv9
	2ZuHOhhCqf7CQPuUDVrPEriUkDpOsUXkL4axD01KPMqiMPihubyLr0P929qTMpttq1uv
	J5nx4000G7D9jy33yYwRC2g8udOlc/CID2iJY5EGIP20UAmxig10lQIqQAMyVyTjrGrU
	MKYA==
MIME-Version: 1.0
X-Received: by 10.107.148.197 with SMTP id w188mr17005322iod.73.1425025627697; 
	Fri, 27 Feb 2015 00:27:07 -0800 (PST)
Received: by 10.36.69.38 with HTTP; Fri, 27 Feb 2015 00:27:07 -0800 (PST)
In-Reply-To: <alpine.LFD.2.11.1502261554100.6816@localhost>
References: <alpine.LFD.2.11.1502261554100.6816@localhost>
Date: Fri, 27 Feb 2015 09:27:07 +0100
Message-ID: <CAAQYJAtoKqKUEukAu+4Fv7FXDtF5HD0_EUTBKb6BRZduD2nWVw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: any value in keeping INITRAMFS_TASK?
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
X-List-Received-Date: Fri, 27 Feb 2015 08:27:09 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 26, 2015 at 9:59 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   just tripped over INITRAMFS_TASK in kernel.bbclass, which claims to
> be only for backward compatibility and should be replaced by
> INITRAMFS_IMAGE:
>
>     # NOTE: setting INITRAMFS_TASK is for backward compatibility
>     #       The preferred method is to set INITRAMFS_IMAGE, because
>     #       this INITRAMFS_TASK has circular dependency problems
>     #       if the initramfs requires kernel modules
>
> but i still see usage over in
> meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.1[07].bb:
>
> INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
> INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_rootfs"
>
> should that be updated, and INITRAMFS_TASK tossed?
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
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Robert,

this is is an unobvious way to allow the build in one pass of:
- a standard kernel (without initramfs)
- a second kernel embedding an initramfs

The 'preferred method' does inject the initramfs in any recipe using
kernel.bbclass so to keep the old behavior (selectively add the
initramfs) we can circumvent it using INITRAMFS_TASK.

So no, please, don't toss it ;)

Cheers

Andrea

