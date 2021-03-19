Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.749.1616176543157930356
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 10:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:52920 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lNJLZ-00Fg4x-AF; Fri, 19 Mar 2021 13:55:42 -0400
Date: Fri, 19 Mar 2021 13:55:37 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Andre McCurdy <armccurdy@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] diff between "bitbake meta-toolchain" and "bitbake -c populate_sdk <target>?
In-Reply-To: <CAJ86T=X8gf=bni_bguQObcgNt_ME3Re2a9xc4OmuhynvG8C9cg@mail.gmail.com>
Message-ID: <3dd5e65f-bd42-bc7d-ac1e-20c9f4cba5e2@crashcourse.ca>
References: <92d67e94-f4d9-e693-b3af-18b69b8d881@crashcourse.ca> <CAJ86T=X8gf=bni_bguQObcgNt_ME3Re2a9xc4OmuhynvG8C9cg@mail.gmail.com>
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

On Fri, 19 Mar 2021, Andre McCurdy wrote:

> On Fri, Mar 19, 2021 at 7:23 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >   colleague just asked me about the difference between building an SDK
> > with either of:
> >
> >   $ bitbake meta-toolchain
> >   $ bitbake -c populate_sdk <some target>
> >
> > i know that the meta-toolchain recipe file contains little more than
> > inheriting populate_sdk so, without checking, i speculated wildly as
> > follows:
> >
> >   "bitbake meta-toolchain" takes no target, so it's limited to
> > whatever info it can glean from local.conf and bitbake.conf and so on
> > and so on, things like MACHINE and DISTRO, and whatever assignments to
> > TOOLCHAIN_HOST_TASK, etc, it runs into in its travels; in essence,
> > it's a "generic" toolchain.
>
> It's an example of a "pure" toolchain recipe. You are free to modify
> it and add additional packages or use it as a reference to create your
> own toolchain recipe. Here's another example of a pure toolchain
> recipe from my current project:
>
>   SUMMARY = "Installable toolchain for SK"
>   LICENSE = "MIT"
>
>   inherit populate_sdk
>
>   TOOLCHAIN_TARGET_TASK_append = " packagegroup-sk-build-deps"

  i'd guessed as much ... is this actually written down somewhere in
the docs?

> (As a side note, LICENSE still seems to be required in toolchain
> recipes even though it's not in image recipes... it's a bug).

  yes, that does seem a bit odd.
>
> >   on the other hand, "bitbake -c populate_sdk <target>" can, in
> > addition, consult the target recipe file where it can collect even
> > further SDK defining info, like what you find in
> > core-image-sato.bb:
>
> You mean <image-recipe> instead of <target>. I don't think you can
> create a toolchain from a normal recipe.

  yup, that's what i meant.

> > TOOLCHAIN_HOST_TASK_append = " nativesdk-intltool nativesdk-glib-2.0"
> >
> >   at the risk of over-simplification, is that a not wholly inaccurate
> > explanation of the difference?
>
> Sounds about right. Note that using the populate_sdk task for an
> image recipe means your toolchain will contain some extra junk (e.g.
> busybox, etc) which isn't required and won't be there in toolchains
> created from a pure toolchain recipe (since in a pure toolchain
> recipe you have direct control over TOOLCHAIN_TARGET_TASK).
>
> They both basically do the same but the populate_sdk task for an
> image recipe automatically sets TOOLCHAIN_TARGET_TASK and
> TOOLCHAIN_HOST_TASK for you based on the contents of the image
> whereas with a pure toolchain recipe you are responsible for
> controlling these explicitly (or leaving them alone, in which case
> you'll get a minimal toolchain, as you do with the meta-toolchain
> recipe (horrible naming IMO)).

  all this sounds about right, thanks.

rday
