Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.3528.1620089870351842487
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 17:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 373D440C1E;
	Tue,  4 May 2021 00:57:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XSrcWEF_LJPF; Tue,  4 May 2021 00:57:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1397C40A28;
	Tue,  4 May 2021 00:57:47 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id B79BB1745DB; Mon,  3 May 2021 20:57:46 -0400 (EDT)
Date: Mon, 3 May 2021 20:57:46 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Andre McCurdy <armccurdy@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] how to add a "-dev" package to host SDK?
Message-ID: <20210504005746.GL21867@denix.org>
References: <14306152-1445-7a44-523-beb73a6dbda@crashcourse.ca>
 <CAJ86T=WaeNQCJr4ednad1znvq8LV3P6wYvPwrzZh4rHWUDma-A@mail.gmail.com>
 <35c8bcd5-bc86-1a8a-e0d6-a35ef9bb2d47@crashcourse.ca>
MIME-Version: 1.0
In-Reply-To: <35c8bcd5-bc86-1a8a-e0d6-a35ef9bb2d47@crashcourse.ca>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 03, 2021 at 03:41:50PM -0400, Robert P. J. Day wrote:
> On Mon, 3 May 2021, Andre McCurdy wrote:
> 
> > On Mon, May 3, 2021 at 7:55 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > >
> > >   colleague asks a simple question (and i'm not in front of my dev
> > > box at the moment so i can't verify what i'm about to suggest):
> > > how to add the header files in a given "-dev" package to the host
> > > component of the SDK?
> >
> > The implication of that is that you want to use a header file from a
> > host component of the SDK to be able to compile additional tools etc
> > to run on the host after the SDK has been created?
> 
>   i am *assuming* that's the plan, but i was provided with no actual
> rationale, only asked how to do it. i'm going to harangue people
> tomorrow regarding what they're after.
> 
> > Normally the SDK tools etc which run on the host are all compiled as
> > part of creating the SDK, not afterwards.
> 
>   that's my understanding but, again, i'm just responding to a very
> specific request; i guess we'll soon see if that's the right approach
> to what they're looking for.
> 
> > >   i haven't spent a lot of time messing with SDKs (that is about to
> > > change), but as i read it, if one wants to add the contents of any
> > > given development package to the host SDK, it would look like:
> > >
> > >   TOOLCHAIN_HOST_TASK_append = " nativesdk-fubar-dev"
> > >
> > >   i have no idea what the rationale is here, i'm just trying to
> > > address the question, which in addition asks, "if you add something
> > > like that to the host side, is it automatically added to the target
> > > side?"
> >
> > It's not.
> 
>   i was pretty sure it wasn't but i tried a number of examples just to
> be absolutely sure. however, i did notice something i didn't
> understand. (this is my first foray into messing with SDKs so these
> will be simple questions.)
> 
>   as a test, i built a core-image-minimal for qemuarm64, then started
> playing with:
> 
>   TOOLCHAIN_HOST_TASK_append = " ..."
> 
> to see what was added to the host manifest file.
> 
>   when i added:
> 
>   TOOLCHAIN_HOST_TASK_append = " nativesdk-expect"
> 
> then, sure enough, that package was added to the host manifest file.
> however, when i added the -dev package:
> 
>   TOOLCHAIN_HOST_TASK_append = " nativesdk-expect-dev"
> 
> then *both* packages were added, as in, the regular package was
> dragged along with the -dev package, which *seems* reasonable, but
> where in the code (class file?) is this processing done? put another
> way, under what circumstances will adding a -dev package to the host
> portion of the SDK necessarily add the primary package?

By default, ${PN}-dev RDEPENDS on ${PN} automatically, if not changed:

https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.conf#n321

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
