Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.2210.1620070916321443117
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 12:41:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:47280 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ldeS2-0003A9-3l; Mon, 03 May 2021 15:41:54 -0400
Date: Mon, 3 May 2021 15:41:50 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Andre McCurdy <armccurdy@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] how to add a "-dev" package to host SDK?
In-Reply-To: <CAJ86T=WaeNQCJr4ednad1znvq8LV3P6wYvPwrzZh4rHWUDma-A@mail.gmail.com>
Message-ID: <35c8bcd5-bc86-1a8a-e0d6-a35ef9bb2d47@crashcourse.ca>
References: <14306152-1445-7a44-523-beb73a6dbda@crashcourse.ca> <CAJ86T=WaeNQCJr4ednad1znvq8LV3P6wYvPwrzZh4rHWUDma-A@mail.gmail.com>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Mon, 3 May 2021, Andre McCurdy wrote:

> On Mon, May 3, 2021 at 7:55 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >   colleague asks a simple question (and i'm not in front of my dev
> > box at the moment so i can't verify what i'm about to suggest):
> > how to add the header files in a given "-dev" package to the host
> > component of the SDK?
>
> The implication of that is that you want to use a header file from a
> host component of the SDK to be able to compile additional tools etc
> to run on the host after the SDK has been created?

  i am *assuming* that's the plan, but i was provided with no actual
rationale, only asked how to do it. i'm going to harangue people
tomorrow regarding what they're after.

> Normally the SDK tools etc which run on the host are all compiled as
> part of creating the SDK, not afterwards.

  that's my understanding but, again, i'm just responding to a very
specific request; i guess we'll soon see if that's the right approach
to what they're looking for.

> >   i haven't spent a lot of time messing with SDKs (that is about to
> > change), but as i read it, if one wants to add the contents of any
> > given development package to the host SDK, it would look like:
> >
> >   TOOLCHAIN_HOST_TASK_append = " nativesdk-fubar-dev"
> >
> >   i have no idea what the rationale is here, i'm just trying to
> > address the question, which in addition asks, "if you add something
> > like that to the host side, is it automatically added to the target
> > side?"
>
> It's not.

  i was pretty sure it wasn't but i tried a number of examples just to
be absolutely sure. however, i did notice something i didn't
understand. (this is my first foray into messing with SDKs so these
will be simple questions.)

  as a test, i built a core-image-minimal for qemuarm64, then started
playing with:

  TOOLCHAIN_HOST_TASK_append = " ..."

to see what was added to the host manifest file.

  when i added:

  TOOLCHAIN_HOST_TASK_append = " nativesdk-expect"

then, sure enough, that package was added to the host manifest file.
however, when i added the -dev package:

  TOOLCHAIN_HOST_TASK_append = " nativesdk-expect-dev"

then *both* packages were added, as in, the regular package was
dragged along with the -dev package, which *seems* reasonable, but
where in the code (class file?) is this processing done? put another
way, under what circumstances will adding a -dev package to the host
portion of the SDK necessarily add the primary package?

rday

