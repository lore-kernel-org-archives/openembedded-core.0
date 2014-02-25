Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id DA3D76E27B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 05:47:13 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id h18so6752637igc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 21:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=CkacE97BS34nxMLolfsFgc63P7Rlah5c/n+53y2NdVE=;
	b=b4yei3z0yNCS440Ghq3VFpsCYBjzSKE2VK4nL9oYpevjXFW7OvwXHUB2fBGGs0yZ9I
	gHLqOnaAfS7DgwDM4eOq3Z4XzVMUixBeoV6daW0c7zAHQG9hgikop3XkLSs2X0UJnfxm
	3q6SurXq5SrioqA4n/mHE6eqynEohvM3/77CJgpIklHQid/sBd/RrWtoGVNCxkOs4qva
	iLSN6DyqL5yJI1zaOAzTBwXjEzguE491YI0V7Lw4lvDb3fBvo1q5x5n7wZvuqb9Nl+np
	QTArBu70c3CluLm5BAoFqWWR1l194ItB1aK6IX5xuxawL/EFCILrrHgIGtVsqY82TyQP
	jZJA==
X-Received: by 10.50.103.101 with SMTP id fv5mr1285307igb.2.1393307233914;
	Mon, 24 Feb 2014 21:47:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Mon, 24 Feb 2014 21:46:43 -0800 (PST)
In-Reply-To: <1393253881.31769.6.camel@ted>
References: <1393253881.31769.6.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Feb 2014 21:46:43 -0800
Message-ID: <CAMKF1spGuggEKfnLchYMeU0ounonupUhsLkC0wU_7S6nX-W8KQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Separate build dir for autotools
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
X-List-Received-Date: Tue, 25 Feb 2014 05:47:18 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 24, 2014 at 6:58 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> For a while poky and others have been using the seperatebuilddir.inc
> file. This makes ${S} != ${B} and means that ${B} can be wiped when
> configuration changes.
>
> This helps deal with the fact that autotools and friends are not
> particular good at rebuilding things that change. The recent libcheck
> upgrade which broke bluez4 builds is but one example of the kind of
> problem we can hit. Sadly bluez4 doesn't work for S!=B so it didn't
> protect against that issue but it does protect other packages.
>
> I'd really love to switch the default in autotools.bbclass to make this
> the default and then have broken packages opt out of it.
>
> I can deal with OE-Core and make sure the metadata there is updated, my
> bigger worry is what this would do to other layers.
>
> The options I can see are therefore basically:
>
> a) We change the default in autotools.bbclass and fix things that break

This would be sort of late call for 1.6 IMO but I would prefer this solution.

>
> b) We introduce an "autotools2" class and have recipes inherit that.
> This version would default to separate builddirs. It does mean change to
> all the "good" recipes rather than the broken ones though and hence a
> fair bit of churn.

probably a better migration path can happen over time. may be we can raname
existing autotools.bbclass to autotoolsold and have autotools.bbclass
default to S != B
that way the recipes which break can inherit autotoolsold and can have quick fix
then we can slowly remove inheriting autotoolsold and finally remove
the class itself.

>
> Have we got the willpower to fix a)? is b) an option? Other ideas?
>
> One way or another I think we should try and switch things somehow...
>
> Cheers,
>
> Richard
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

