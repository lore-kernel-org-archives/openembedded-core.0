Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB76D46603
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 17:11:24 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41359.1768497074596110579
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 09:11:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=DHtdz5H/;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XxG2kAj92QlyZbQl5AyTaJV2NvZ5wwjUm471cpvNGdI=; b=DHtdz5H/7VOuUPZu12wRT+yw2N
	HTSRGmjIlzknjJqcaT0F9BTc9OiANNO6jsIg4/MFK/8ls4itk8PaD9I0gPDM9ekgMFF3zL5UTTnfV
	4LbWTUHHsvZlOVyFLkDhpL1+Kh+IE/Cxavbxaf0FBMcx+Xjt4r4c52BxNurn7TYQeYvrS6I2o8XvL
	jkFyp2JZ7CwIKdm+jXE2ULLUwx34JYJ0GnMhTwxEJUETC2wyD+tzWcTNz2eFPi0hp/5LjT1UVM+Go
	82OZS2zwedK627ucEYjZ2/YEuDeDM1H0/PolpZyi8qg6zo+Zs5CSO0ddk81jzoBavVpoApNyP12md
	2RTzwFCg==;
Received: from [147.129.179.166] (port=54872 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vgQsJ-0000000A12a-1xh2;
	Thu, 15 Jan 2026 12:11:13 -0500
Date: Thu, 15 Jan 2026 12:14:37 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@cherry.de>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] packaging error for linux-libc-headers: "Files installed
 but not shipped ..."
In-Reply-To: <5705db27-bb7a-4ca6-997e-eda10ad04fa5@cherry.de>
Message-ID: <eabc4951-71c9-d57e-5423-a99c64a5d721@crashcourse.ca>
References: <f7ecaee8-192f-1abe-08fd-f2b1ff95e7b7@crashcourse.ca> <5705db27-bb7a-4ca6-997e-eda10ad04fa5@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 17:11:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229425

On Thu, 15 Jan 2026, Quentin Schulz wrote:

> Hi Robert,
>
> On 1/15/26 4:30 PM, Robert P. J. Day via lists.openembedded.org wrote:
> >
> >    (hoping that someone might have an idea of what weirdness might be
> > happening here, or might have seen this before.)
> >
> >    i've jumped into an existing YP build and am trying to untangle it,
> > so here's the layout. all "walnascar" releases for:
> >
> >    * STMicroelectronics (STM) layer meta-st-stm32mp for MACHINE defn
> >    * Poky
> >    * meta-openembedded for some basic networking stuff
> >
> > rather than try to build for the final image, i do as i always do and
> > back off and try to build a simple core-image-minimal (or even
> > simpler) and work up from there.
> >
> >    given that the STM layer defines a linux-stm32mp recipe file and
> > that's the preferred provider for "virtual/kernel", i started simple:
> >
> >    $ bitbake linux-stm32mp
> >
> > ... snip ...
> >
> > WARNING: linux-libc-headers-6.12-r0 do_package: linux-libc-headers-lic
> > package already existed in linux-libc-headers.
> > ERROR: linux-libc-headers-6.12-r0 do_package: QA Issue:
> > linux-libc-headers: Files/directories were installed but not shipped
> > in any package:
> >    /usr/share
> >    /usr/share/licenses
> >    /usr/share/licenses/linux-libc-headers
> >    /usr/share/licenses/linux-libc-headers/COPYING
> >    /usr/share/licenses/linux-libc-headers/generic_GPL-2.0-only
> > Please set FILES such that these items are packaged. Alternatively if
> > they are unneeded, avoid installing them or delete them within
> > do_install.
> > linux-libc-headers: 5 installed and not shipped files.
> > [installed-vs-shipped]
> > ERROR: linux-libc-headers-6.12-r0 do_package: Fatal QA errors were
> > found, failing task.
> > ERROR: Logfile of failure stored in:
> > /home/rpjday/BOARDS/nexus/walnascar/core_plus_nexus/build/tmp/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/linux-libc-headers/6.12/temp/log.do_package.1893820
> > ERROR: Task
> > (/home/rpjday/layers/oe/walnascar/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_package)
> > failed with exit code '1'
> >
> >
> >    OK, i find that puzzling, that a well-established recipe like
> > linux-libc-headers could have such a blatant packaging flaw. i went
> > looking in the STM layer and in the local layers for anything that
> > might have modified that recipe with a bbappend file or something, but
> > found nothing. and then i ran across this little nugget.
> >
> >    the STM layer insists that it is compatible with walnascar, so
> > that's the branch i checked out. but when i looked closer, their
> > kernel recipe file is linux-stm32mp_6.6.bb. that is, 6.6, not 6.12
> > that one would find in the OE layer for the walnascar branch. so it
> > seems that the build is trying to build a 6.6 kernel based on the STM
> > layer, but is trying to build 6.12 of linux-libc-headers based on the
> > poky layer.
> >
> >    if i go to the STM layer and check out the scarthgap branch, sure
> > enough, it has the same linux-stm32mp_6.6.bb, so it seems STM bumped
> > their layer compatibility from scarthgap to walnascar but never
> > updated their kernel recipe. is that a possible explanation as to what
> > is going on here?
> >
>
> You can have kernel headers newer than the kernel recipes you're building. The
> kernel *should* report whether it actually supports something when requested
> by userspace (e.g. ioctl, syscalls). The kernel headers are supposed to be
> stable API/ABI as far as I remember, so newer headers only mean you can use
> newer features (if your kernel supports it).
>
> We also have multiple linux-yocto recipes which are older than the
> linux-libc-headers, that's not an issue. If you look at meta-cherry-es, you'll
> see you're building a 6.1 kernel for Jaguar and Tiger while linux-libc-headers
> is 6.6.
>
> The only limitation is the minimum kernel supported by glibc. This is handled
> by the OLDEST_KERNEL variable (which is 5.15 right now).
>
> As for the issue, I **think** it's been reported a few times but the vague
> recollection I have of it was that it goes away after cleaning and that the
> fix wasn't straightforward?

  i knew that you could have kernel headers newer than the kernel, i
just wasn't sure if there was some spectacularly obscure issue related
to building in OE that might surface.

  i did a complete clean of the build directory (leaving in place only
the conf/ directory), then focused on building just the headers:

  $ bitbake linux-libc-headers

and got the same error:

WARNING: linux-libc-headers-6.12-r0 do_package: linux-libc-headers-lic
package already existed in linux-libc-headers.
ERROR: linux-libc-headers-6.12-r0 do_package: QA Issue:
linux-libc-headers: Files/directories were installed but not shipped
in any package:
  /usr/share
  /usr/share/licenses
  /usr/share/licenses/linux-libc-headers
  /usr/share/licenses/linux-libc-headers/COPYING
  /usr/share/licenses/linux-libc-headers/generic_GPL-2.0-only
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
linux-libc-headers: 5 installed and not shipped files.
[installed-vs-shipped]
ERROR: linux-libc-headers-6.12-r0 do_package: Fatal QA errors were
found, failing task.
ERROR: Logfile of failure stored in:
/home/rpjday/BOARDS/nexus/walnascar/core_plus_nexus/build/tmp/work/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/linux-libc-headers/6.12/temp/log.do_package.3799275
ERROR: Task
(/home/rpjday/layers/oe/walnascar/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_package)
failed with exit code '1'


  what i find intriguing is that first line:

WARNING: linux-libc-headers-6.12-r0 do_package: linux-libc-headers-lic
package already existed in linux-libc-headers.

suggesting that the license package was already created by the recipe,
and that perhaps it's trying to duplicate that work unnecessarily and
that's why it's failing(?)

  i'm going to go over the non-OE/YP layers to see if there is
*anything* trying to process that recipe or package that might be
causing this, but so far, i don't see anything like that.

rday

