Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web08.15818.1625623493226101032
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 19:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lYZnplDP;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id t3so1180224edt.12
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jul 2021 19:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WN7uBd0CchXwVkTOPosdKmkxI4KlG9pxtBgefB+VLHA=;
        b=lYZnplDP4hMUfLMI2RfwJ+NT7gIBUR2CU9kl1ZhOKtqFBcltIQopM4RGsNV5iHad6V
         srulbbWaf+/685zannqPAdKISl3o8ikoKOOVeJ9NCmpvGV0B7nPtOBuG/yUEO9XM6+38
         sr04/Bz/TYuQFsoIJwuh4WJRDy00uq2I9Z0iQRnaJio5VGSWUJRkzlCU4MyDXrivSEwu
         voFgBCZqNO0tkfrFes47CzrCeWtXXkl/O5PTEnP31YFycLvrT4/WvShZK6oSTi9nYAgw
         WQFNrBEtHOSgnUxHM7Zfoq+8+Kao2UMZT60YHFNrXT860lIC3l8DEXaxKiygVtMT1HHP
         B2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WN7uBd0CchXwVkTOPosdKmkxI4KlG9pxtBgefB+VLHA=;
        b=fAl5gUI50cX6PNZ7nfgBSaOZYW9ktLTdru8+Or5f/7fRGNFRIC5h1O/NweDR+N3KlV
         ElBkMAt6PP0jbn1gYlIlo/Hh0EAqUySqUA1cRz2zizn9CJIjKwFEJTZ66cnFGbMBwLj+
         0dKUtpEebChZZ/CaFyUeWB3+3nHklRJHuziG1hKSfTx2BrAyHU2hD41yWaNSCactsVUU
         jkd+eSckvBnfEwAW8mhL5m1f4qOBp1eVldfE2Uk6Jj8mssh7gtywS29S8c+V1yvXYDx1
         dJqFMQ2cpBqF5RwVpsefhDD6m4zGFVdAAVuxma880T5GSFDd8T6EsfQkxJmeLD7sbbrW
         YWHg==
X-Gm-Message-State: AOAM532xWSugNaZDrBquGDpIcS6f1NPBYghjrUbStHGGrlC1sUVW42Az
	ajtTlTfCJpjE1T9pBI4IcjQbEGyg1KqxNCNewVA=
X-Google-Smtp-Source: ABdhPJyxat6XUDAfLRa0UEp0D5tEOXwLfMnCTR0icXmRKKTXeLKfGS2VkuC9a4x6R2KIN9b62jAxcVmWdrwRqlBlN/g=
X-Received: by 2002:a50:f0cf:: with SMTP id a15mr26542193edm.347.1625623491736;
 Tue, 06 Jul 2021 19:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210706175821.41519-1-bruce.ashfield@gmail.com> <20210706224830.7bd3f5e7.paul@pbarker.dev>
In-Reply-To: <20210706224830.7bd3f5e7.paul@pbarker.dev>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 6 Jul 2021 22:04:40 -0400
Message-ID: <CADkTA4N8dQnEYD1CS_PqfnssQPeXzw6L8s8mU47-7zoj5DBe4A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto/5.13: add devupstream support
To: Paul Barker <paul@pbarker.dev>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 5:48 PM Paul Barker <paul@pbarker.dev> wrote:
>
> On Tue,  6 Jul 2021 13:58:21 -0400
> "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:
>
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > We are always getting questions about building -stable, or mainline
> > master. Rather than introducing a separate set of recipes, we can
> > facilitate this sort of testing by using the existing devupstream
> > bbclass support.
> >
> > To build an unpatched or otherwise modifed -stable of 5.13, simply
> > set the linux-yocto preferred version to:
> >
> >   upstream+5.13%
> >
> > And your wish will be granted, as the build will use v5.13/base
> > which matches the main linux-yocto version, simply with no extra
> > changes applied.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> This looks like a good thing to have in oe-core, in the basic case of
> just wanting the latest mainline as-is you'd not need to add extra
> layers any longer. meta-linux-mainline would still fill a niche as it
> provides recipes for older stable kernels and supports using mainline &
> newer stable kernels on dunfell & hardknott.

Agreed, since we are still holding to the cadence in master of LTS +
"latest" + dev. So those older -stables are still being updated in the
various linux-yocto branches, but the SRCREV bumps and versioned
recipes are still only in their respective release branches. So someone
that wants those older versions, needs a copy of the recipe, or uses
meta-linux-mainline (as you just said :)

>
> I guess the meta repository (yocto-kernel-cache) would still be cloned
> and the upstream kernel could still be modified by patches or config
> fragments enabled by KERNEL_FEATURES. That may be worth noting in the
> documentation if I'm right. For my use-case where I want to use the
> exact upstream defconfig I would probably need to override this, e.g.
> `KERNEL_FEATURES_forcevariable = ""`, to make use of this.

Right, I want to clear some of the features when this is used, since they aren't
all available. I've run into it a few times myself, and the unconditional append
of some of the features are an issue, not only in this use case but in others
where fragments are supported, but linux-yocto isn't used.  I just need to
detangle things a bit and make their appends be specific to linux-yocto and
skip them for the devupstream variant.

So hopefully once I have this into shape, we won't need to document it, since
it'll be 'fixed' .. but good catch, that is an important point.

>
> I also guess this would also allow you to follow newer kernel releases
> as they're added to linux-yocto recipes by setting the preferred version
> to 'upstream%' (or maybe 'upstream+%' to be more restrictive). That
> would then avoid the build breaking when the 5.13 recipe disappears and
> is replaced by 5.14 or something else later.

Yes. That wasn't something I was thinking about, but you could definitely
do that and have it follow along as the newly versioned recipe is added
(and potentially older ones removed) without needing to explicitly change
your preferred version.

Bruce

>
> Thanks,
>
> --
> Paul Barker
> https://pbarker.dev/



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
