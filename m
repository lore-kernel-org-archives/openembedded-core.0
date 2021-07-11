Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.8664.1626019837877868746
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 09:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fIcdq08+;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id go30so1371224ejc.8
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jul 2021 09:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZUrDSLUAKYa6EiJDArfO+1Fr3/ePM2NBkMKPJP0mWUA=;
        b=fIcdq08+o6lwxOKf3XiPG5Vc9LWKqXktWwVUrHzFFzXKr3O56d6MWvVFrHWSoaAnuJ
         qh/dum0+kmJrrJRQ9h5++bXJT094sThfpdw/4RfnTjeGvuLf10NuJQMWP4g/0gTMCV5m
         r99nhEhLce4LPN+MOtqbyROoF2n8zTleAfTNXZmKfc5yGStPlsj/l4R87ZJWeSnA5E4H
         2hxLqDB12EnOQ5rRCd7ruyAQ/e4CukaWG+m4ejG4xdH2nJnrND3nDipiKXFYvvurCyF2
         viOPG5I+qaJgVg4zCrNaeNy1zMimv8Sm1SqpyLXlyclgmZ8qaHEUI+RCh6uPSUHIYMWS
         6EcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZUrDSLUAKYa6EiJDArfO+1Fr3/ePM2NBkMKPJP0mWUA=;
        b=TJ3e83sV74OVM4EERWdjXRrJmPbRMkcrntR+V/ixIebYS6OSZnKNfXbdvrFLSo/9VF
         aOP2vNP8l/SEOs5wvg28dTyFramgalKzQVxAOET8ZO4DKfQTTEYLVgxa9tueFgKBHP//
         2h/idnttwvAyl71Hor8vCxEzXz0L4MzdRRazWy/UhuPJdwGSYRT2p2wJb9Wv1PJZXwNO
         XjdUhuiA0MMxtdtvl+2w3jlCBc3w8jys6xNAjT8ZweX0dkO129bcjTkgHwzKqRHCBLc3
         wsCLKlK6jKRPEKdsIHu30kdbS1qT+/qOpZua0RQ/nxZmzHW0bNtwY0WHbaE/Y5wsWIwM
         kr9Q==
X-Gm-Message-State: AOAM531Hw/bKz0UyLkiUFcgtYht/ZqmBr1XTlfYwqNPJwCi3iJajgfgF
	Vd+Aj2stmRB9eVtV1I+HeHKGgKgLNTuPYqdDQFo=
X-Google-Smtp-Source: ABdhPJwGygpSRO8dhdEwt/NXmRdVm/GihRXMuLdAOCj62Wmepiba/wYDfTY14OW5CeYQgNeqt6YxYweKTpEEXNFnSYc=
X-Received: by 2002:a17:907:3e22:: with SMTP id hp34mr2250508ejc.334.1626019836370;
 Sun, 11 Jul 2021 09:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210706175821.41519-1-bruce.ashfield@gmail.com> <d781befb33cb4f3b53e1e7989311ef52ce56e927.camel@linuxfoundation.org>
In-Reply-To: <d781befb33cb4f3b53e1e7989311ef52ce56e927.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 11 Jul 2021 12:10:25 -0400
Message-ID: <CADkTA4OBhNxtY+z=i4F9LJq2w0rbq9whmcQH-dyxLpWJa2-qiA@mail.gmail.com>
Subject: Re: [PATCH] linux-yocto/5.13: add devupstream support
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 11, 2021 at 5:53 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2021-07-06 at 13:58 -0400, bruce.ashfield@gmail.com wrote:
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
> > ---
> >
> > Richard,
> >
> > This is the patch that I was talking about earlier in the yocto dev
> > meeting.
> >
> > I personally find this the easiest to maintain, since it is just
> > a variant of linux-yocto_<version>, and ends up just being a
> > different branch versus anything radically different.
> >
> > I am open to making this a different / named recipe to make the
> > distinction more clear, but I'm worried about the impression
> > that we were doing extensive testing on the bare -stable branches
> > when most of the testing (which is transient to the base -stable)
> > happens on our standard/base branch.
> >
> > Either way, I'll work on getting this and the -dev tweaks I sent
> > earlier added to some part of our AB testing to make sure that
> > they stay in good shape.
>
> Sorry for the delay on this one, I wanted to try something. I have a
> tweak to propose and since patches speak louder than words:
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.13.bb b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
> index cd51e04b95d..ab81a977b8a 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.13.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
> @@ -25,13 +25,13 @@ SRCREV_machine_qemumips64 ?= "b74fe3dcca0653609fcb75aad883b1db07619081"
>  SRCREV_machine ?= "b1cead8d98582ca687f93e06438543b97144e5bf"
>  SRCREV_meta ?= "ceb5fa598d08902fe2934c041875aa92d9a6fa19"
>
> -# set your preferred version of linux-yocto to 'upstream+<version>%', and you'll
> +# set your preferred provider of virtual/kernel to 'linux-yocto-upstream', and you'll
>  # get the <version>/base branch, which is pure upstream -stable, and the same
>  # meta SRCREV as the linux-yocto-standard builds
>  BBCLASSEXTEND = "devupstream:target"
>  DEFAULT_PREFERENCE_class-devupstream = "-1"
>  SRCREV_class-devupstream = "62fb9874f5da54fdb243003b386128037319b219"
> -PV_class-devupstream = "upstream+${LINUX_VERSION}+git${SRCPV}"
> +PN_class-devupstream = "linux-yocto-upstream"
>  KBRANCH_class-devupstream = "v5.13/base"
>
>  # remap qemuarm to qemuarma15 for the 5.8 kernel
>
> Basically this does what you were doing but brings with it the advantages
> of having the target in it's own recipe namespace by changing PN.
>
> This means you'd set:
>
> PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-upstream"
>
> to enable and the advantage is that if multiple linux-yocto recipes have
> this, you can do:
>
> PREFERRED_VERSION_linux-yocto-upstream = "5.13%"
>
> or whatever, it all works as normal.
>
> This drops the hacked up PV field and I think makes things work nicely.
>
> Does that seem reasonable to you? It should work just as well with your workflows?
>

Most definitely.

That meets my goals of just having one more SRCREV to bump in the main
recipe, and it is easily accessible.

I can spin a v2, unless you want to just take your changes and merge
them as-is ?

Bruce


> Cheers,
>
> Richard
>
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
