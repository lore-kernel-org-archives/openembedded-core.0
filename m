Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.570.1620922654259988530
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 09:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ThzTFnaB;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id k19so729131qta.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 09:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XFQ5kJd2/9ZwoaD8fOolWP0rHx4Ax4zOV513er1My8U=;
        b=ThzTFnaBINBjlHLoKIGiqcZujPp1S7I3JO0F86heze7tRpRBvQtjQj7Td+8AfI9uQf
         Gtz3hdC4MfQr82Bo/JUHx/xEpzARBuvcUJJTSts1PmET+jJ+EBU/LzN4JR8Y6WAKHnor
         gLw/unTbqluntTEJlzUnTDcH7c3N2Jitusa3uBoy89x7c8NRzmzcSeQUIzac630zEfoL
         lHhHiDM6XHhNfa9dXiNuY4ltbDONEspRJaVfW3ikOlwIXbhqXkIegXwwlxInd/FXRbuM
         1U1EA/1M6w4TEVJzl+VSBvAv4G+9lrdtr0zMZwApmGSr3RqRTvfvcky4zELO9fdgNTHB
         prGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XFQ5kJd2/9ZwoaD8fOolWP0rHx4Ax4zOV513er1My8U=;
        b=OnsRfYdA0iDhkG0NJ6sbC6m2AyD+8VfpnWmuzfKF2r2/VKx0SfqNVuIhZyyuwKv0zi
         1cfKNeuX7mkbLVkJ0lU2yZSkM87ScK44QxJV7zUgblj8nHnNkSPiabDiUvN6OfF3/PYp
         KWB9PnfGb2ffL9F1wZo2wqmvUpOxZKQ8Dv/rgSofigsNAXDAPuSngb9IbFMOF4UU+Fdx
         2FlQaXJvHesk9yf2rfrXRZSBGX2/kSKuAJjCevYjCVByRUZtNMwwjVXmTQO22D8GIfaM
         ZT06+rfnnKfXDzc5Z/H5kNr/nbD2IptiIvolSQNld8ceEZNiN5D+8QSxEXzsM8bFZx3E
         IWjw==
X-Gm-Message-State: AOAM531lD7EqN3pPsXDLsac8SBp2mGuB0hs4Kf5soZpOovZJ1k33nJdo
	Zb05zOw2fcGCuxrccE+T1OPYASyda8MqoR7ra3o=
X-Google-Smtp-Source: ABdhPJxp91DlsoFRZBpGIPaiqkU/0kPVpqd0iuPbmL62VBtS091G5jmlAg/XXzmPDJSqzU/3VyyDwA4Mqm1Ueg3/1F0=
X-Received: by 2002:ac8:7e81:: with SMTP id w1mr4066554qtj.82.1620922653339;
 Thu, 13 May 2021 09:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210512213212.2283022-1-richard.purdie@linuxfoundation.org>
 <CAMKF1spC4W1sWy32C_=WwY8SwH2CHPD7YQJym-gUShy2BZaR5g@mail.gmail.com> <a797bbeecd3bdbfdcf52943ff5a51857729ffe00.camel@linuxfoundation.org>
In-Reply-To: <a797bbeecd3bdbfdcf52943ff5a51857729ffe00.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 13 May 2021 09:17:05 -0700
Message-ID: <CAMKF1spzH-8g_arkUqRBdRLV6eNCJoP-JjLSztBbc=sW51gkcw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] ovmf: Disable lto to aid reproducibility
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 12, 2021 at 4:12 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2021-05-12 at 16:04 -0700, Khem Raj wrote:
> > On Wed, May 12, 2021 at 2:32 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > lto tends to break reproducibility and makes ovmf near impossible to debug
> > > reproducibility issues in. Disable it and supress the warnings that then
> > > generates from Werror.
> > >
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  meta/recipes-core/ovmf/ovmf_git.bb | 9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
> > > index 1fe01146d6b..ef5545bf705 100644
> > > --- a/meta/recipes-core/ovmf/ovmf_git.bb
> > > +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> > > @@ -102,15 +102,22 @@ fix_toolchain_append_class-native() {
> > >      # to make ovmf-native reusable across distros.
> > >      sed -i \
> > >          -e 's#^\(DEFINE GCC.*DLINK.*FLAGS  *=\)#\1 -fuse-ld=bfd#' \
> > > +        -e 's#-flto#-fno-lto#g' \
> > > +        -e 's#-DUSING_LTO##g' \
> > >          ${S}/BaseTools/Conf/tools_def.template
> > >  }
> > >
> > > +# We disable lto above since the results are not reproducible and make it hard to compare
> > > +# binary build aretfacts to debug reproducibility problems.
> > > +# Surprisingly, if you disable lto, you see compiler warnings which are fatal. We therefore
> > > +# have to hack warnings overrides into GCC_PREFIX_MAP to allow it to build.
> > > +
> >
> > could lto piece be turned into a packageconfig,as I think LTO usage
> > will only grow in coming future
> > some distros may prefer LTO over reproducibility for performance reasons.
>
> If someone wants to do it, sure. I've had enough problems with this horrid build
> system already today. You don't want to know how many hours the reproducibility
> fixes have taken :(.
>

I guess defer it to LTO times as it does not seem straight forward to
turn into knob as I see it in your patch

> Cheers,
>
> Richard
>
