Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web08.25422.1622999274335888092
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WVc+CXUQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id i68so10917673qke.3
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Jun 2021 10:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mIQHa8kNFh3GiXTbV5QGhkG4SaIe6caCbMOW01LU7vk=;
        b=WVc+CXUQm52o7sccuDJ6vCJ2RnFj95D4VMPh31XClwpEJUvRi+mvfiMpbzGCIVKHRt
         5DmKWuB9krPWOpTjFFLJ0ufm+zL1yqjIrC3CsayM0XmggFWytY/lPp9xURtrQXT3w7cP
         wSvOntjYrOpjKyIzigRLuEyIcLdMIYYvZAbuz1Yj7Y8pon3lzG04Uznj046pgTr/RMLw
         plh4Xw/99plDwh7Ws8Q2sjyNa9+hZsN4MsL5tp2fFpbdZZUSF/0kWdFOZ5K7EApxFDae
         IiPY7xKEs8LyZDFmr89xVGqWebXYAZ9F503ICYTEInnfNyPwEocHuK9uvML4fHJDLxBa
         qyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mIQHa8kNFh3GiXTbV5QGhkG4SaIe6caCbMOW01LU7vk=;
        b=pAw8HtG71dyrhDMw/4CbkBbvU3rzNillb9RCliOwvdRboCrbpfHdJedxpIg4fnVOW6
         oc2FAwGFIJPuycoMOZLMZKuyObD1w1LYrDVduSMBH3krwhf2Sc23QnRiN/NU0xtc40h4
         nWFv6iQeSJ/JX7nh4gMZqE6AubG0zy1lhvo2BSjVr6UuRlU8zTTG7543VL6WOlr4SZ2q
         38OcClECTNJsDWvppnPtTJCfaFDfCYM8VkwbHuvbXXt3Q/Y2IXgDnlrGl6hJdsf1bsOA
         erX2whxEAmZQfjNtmdt02bpJHPdwsxWpVhMaKb18sxMhEqd91w4Tzvhi/HMyXIBatPwe
         T4FQ==
X-Gm-Message-State: AOAM533ywaF57QU7auMoPScEex72Ijj9f9fOVb4995r/Pp1quMsa0FSh
	5OwM2qI5N5I/JvXLjxbHw+HUQO16RgEiIPrXgYg=
X-Google-Smtp-Source: ABdhPJxaE8ZYPmAI47j92qZ0vAMFOlgI3ZQbXIJWIC1bB4GKnNjqm70DWZt1/PFFRrfVRsZibiAOEHkiXxt01iGYjnc=
X-Received: by 2002:ae9:e40f:: with SMTP id q15mr13402056qkc.125.1622999273349;
 Sun, 06 Jun 2021 10:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210602232104.3490139-1-alistair.francis@wdc.com>
 <20210602232104.3490139-2-alistair.francis@wdc.com> <96b9bce469e6cdcc86165ff9abb4ced53d4f8444.camel@linuxfoundation.org>
In-Reply-To: <96b9bce469e6cdcc86165ff9abb4ced53d4f8444.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 6 Jun 2021 10:07:25 -0700
Message-ID: <CAMKF1sqzVKDYoyoGLgbnHEhiUDsD5EKQLkhq+frmr4S55a6+vQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] recipes-bsp/u-boot: Allow deploying the u-boot DTB
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 3, 2021 at 11:20 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2021-06-03 at 09:21 +1000, Alistair Francis wrote:
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  meta/classes/uboot-config.bbclass  | 4 ++++
> >  meta/recipes-bsp/u-boot/u-boot.inc | 7 ++++++-
> >  2 files changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
> > index 3bba02828b..6444f58437 100644
> > --- a/meta/classes/uboot-config.bbclass
> > +++ b/meta/classes/uboot-config.bbclass
> > @@ -71,6 +71,10 @@ UBOOT_MKIMAGE_SIGN ?= "${UBOOT_MKIMAGE}"
> >  UBOOT_MKIMAGE_SIGN_ARGS ?= ""
> >  SPL_MKIMAGE_SIGN_ARGS ?= ""
> >
> >
> >
> >
> > +# Options to deploy the u-boot device tree
> > +UBOOT_DTB ?= ""
> > +UBOOT_DTB_BINARY ?= ""
> > +
> >  python () {
> >      ubootmachine = d.getVar("UBOOT_MACHINE")
> >      ubootconfigflags = d.getVarFlags('UBOOT_CONFIG')
>
> I think this breaks other fitimage workflows:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2185/steps/14/logs/stdio
>
> (other selftests fails similiarly)

yes we should use ?? for UBOOT_DTB_BINARY otherwise it will use this assignment

>
> Cheers,
>
> Richard
>
>
