Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web12.1702.1619553478793754804
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Apr 2021 12:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PtQwlAym;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 12so95230135lfq.13
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Apr 2021 12:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7Wisn0xOYWqH1UwleVPpHQzVuseofRefnvGB2gQwDmQ=;
        b=PtQwlAym06OOH5O2PoM48HR0PhDP5Goa8JS92zu41QIkNAYatCzVjmwCIBnA1n5lsU
         1B3V6sdY/fHgSa3Po3+ivI6lCFzO6cpCJdf1lS3ZD4YABpFbPTgNHNUEBioo59XREOI7
         Ri6zx3NtlV4mq+0HViv0B4XmiFAtir49tX13H/zmgjtbAxhtmuD9ihmKo3pll1YSbSwv
         dxlT9gcMrU0aAntIUNvJCorJ4lKlW+hCgYID8AUiGpS+bk0yxYyP/lGtfbMFZ3VWf2c1
         bA58qMIoL/NDDbqr82Pc4wiFYNCpd1a9CLZ2bRLvQLmTofsc3HplI5YKo2bPkzz3DnKy
         YqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7Wisn0xOYWqH1UwleVPpHQzVuseofRefnvGB2gQwDmQ=;
        b=E5yAYOz4n+Rgo+jLakcLugfgssC494YDlKO+scftPHdXyqvhOR5Danzz8WedIVQ3yn
         Ks6Bd7loEexI43h32R9xYmfswVefdzoLGbwvYER+s4x2ZykDp0WKkrgVlij+khUhfwxa
         wt7IsPI/Xiwk27dNedcn09vWjKqNjSyA97nYwFkz2/DfDfT7xkjqfTi1gI95IKKETtgf
         9vcygnTJM7Cy2EijtogcN0ITkNBG1CnDd9n8iQZjlM8jfGTTrV6soJJA9NyWlx7muJEd
         3bUmIHIBaHhrUlnIndKuywSq23N0FOV/1BYOWuN/WzOM4yqIy3y3VXSqlNLnZpR8U8MA
         234w==
X-Gm-Message-State: AOAM533Fllc6HZNa76LhUTHW/adgAcHa12/oiMxfK4qPX4AwrgJct2l+
	Kndx+QxO7tscAk21aCppi9bc2mdz7X5URPE+PAo=
X-Google-Smtp-Source: ABdhPJybP67VeQ7ea/Onjba/sp0coAnmmvijGofdRftDJ92Y42DMN7jsFgNSE0TMRGDbMGeb3G0qKY/i6czJBTbI/cY=
X-Received: by 2002:ac2:54b2:: with SMTP id w18mr17748462lfk.392.1619553476743;
 Tue, 27 Apr 2021 12:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <YIcMLMtsNSTlinqq@pevik> <CAJ86T=VDx=w4FB34BZhsGcFYO8zAJ27kE6t9d_3xbBvkpOPDfg@mail.gmail.com>
 <YIhjWj/HwYya8k1l@pevik>
In-Reply-To: <YIhjWj/HwYya8k1l@pevik>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 27 Apr 2021 12:57:45 -0700
Message-ID: <CAJ86T=V=2F8vesD+=Ps7kyMLbivy-VHa58HK+MSMkoKtMFX_eQ@mail.gmail.com>
Subject: Re: [OE-core] LTP drop MUSL specific patch
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 27, 2021 at 12:17 PM Petr Vorel <petr.vorel@gmail.com> wrote:
>
> Hi all,
>
> > On Mon, Apr 26, 2021 at 11:53 AM Petr Vorel <petr.vorel@gmail.com> wrote:
>
> > > Hi Khem, Richard,
>
> > > I'd like to replace MUSL specific patch
> > > meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch
> > > with just removing broken files. We use this in upstream CI for Alpine, I ported
> > > it to Buildroot [2], where works well. It's better because it does allow to
> > > handle MUSL without rebasing this patch.
>
> > > I was looking into the docs, it looks to me that do_configure [3] might be good hook
> > > to add it into. But it looks like by default it contains oe_runmake clean [4].
> > > Or should I use different hook? And how to find the default content of chosen
> > > hook? (if I need to extend it, I'll have to provide the original as well)
>
> > Changes to source files, including removing them, should be done as
> > part of the do_patch task. Since do_patch is implemented in python you
> > can't simply _append shell script commands to it, but you can add a
> > shell function via do_patch[postfuncs]. If you grep for
> > "do_patch[postfuncs]" in oe-core you should find a few examples.
>
> One more question: how to make this function MUSL specific?
> I noticed some functions has suffix "_libc-musl" (e.g.
> do_install_append_libc-musl), but I guess this would not work for
> do_patch[postfuncs], where I specify the name.

You can either use an intermediate variable in the recipe, e.g.

  PRUNESOURCE = ""
  PRUNESOURCE_libc-musl = "the-real-function"
  do_patch[postfuncs] += "${PRUNESOURCE}"

Or you can call the script unconditionally and check if [ "${TCLIBC}"
= "musl" ] from inside it.
