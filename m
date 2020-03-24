Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web11.6416.1585057837367936536
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 06:50:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GUuKRFAq;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id z13so9223102qvw.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 06:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=om01XSJAXF8YE6rZwzNJSCTKghrsavyyS2cVL8cM88M=;
        b=GUuKRFAqp4fOie7nEzEAEpkUuB8Tq/t55ROq8IAR1p/euyvViu3NyA5QnYdsL58M0p
         w1DEzer+/j9K7w2fKDvJ5+RigHvWsrB+1Wd8et3yVSatfT3/mRgOojCRcI0rP4jR7Wzy
         Dqdf+WWDPoz757MlMdFt+Ma10+VrJftpQSx+LNTxdl39r3iNr1YzDoaKR66i6hV70DB5
         gSHAbalaFIjeNTNswHPy71Lp7KHSe2ofK9IAEBxe88NA9iPBAqVFrwFIpj/Xz4cCMdcW
         kZMxim2Ntne2Y0UAyujPFZPOujWugW/StjNEKZ7grUn7gbWUQd7zb3iVHRyxMyYTJcAh
         6jbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=om01XSJAXF8YE6rZwzNJSCTKghrsavyyS2cVL8cM88M=;
        b=HDwqAj50ChNOklIwuawa0Yh3sIF/6z29gDLfQy+92RJja0S6xy7J1OZlvMSSt1EjLB
         xvQO3Jzez2wzt7SqDYtVs+pZvqhmBhaBIaNLJjJ3Y19XD5IeJ1t2tVT3HLGOo/3lHaca
         TGEDCnyjbnRfc+4Oeg1r1JJEhLr49wiAMHqHaeDmPqK5DJ+UY/cpMwyYPbejnIvmULZ9
         4Is8cyCHt9sFJ1flOFZlNKZD0VrOs0a6jnSju7DpaIFP43JmYYrmX0JrHegI++qWbJj1
         I+XdGi3e8ywEL4UomLKj9MVXLpaYucYz6l+PXm2Tx3X0qp13/kVAEQUBrWeAR9qyEwd4
         ztfA==
X-Gm-Message-State: ANhLgQ0AZySTNBqCjQb1/ELdvSOQbjbt3+Fh2LoXLKA9ZgODSIYdi33s
	J0vPpERB7VMBoo4/ZtDpHdGPSNbitXoFYZS4AobDHipc
X-Google-Smtp-Source: ADFU+vtHbkQPuy78zjYBRSKEdc05wG3kKj6i23UtVHmTvHA89lC4jb7UxPDyV7hGJkUuOTSnqR9qBXA/CkvKjCEaEuM=
X-Received: by 2002:a0c:9104:: with SMTP id q4mr26148318qvq.61.1585057836322;
 Tue, 24 Mar 2020 06:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200323232529.3658577-1-raj.khem@gmail.com> <20200324112723.GA10278@localhost>
 <ab2b3e84dea3b88666bf4807466b4bb64ab359b3.camel@linuxfoundation.org>
In-Reply-To: <ab2b3e84dea3b88666bf4807466b4bb64ab359b3.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 24 Mar 2020 06:50:09 -0700
Message-ID: <CAMKF1sqQq7mR5UEYgsFybwJMegHoH3utxc3AJvgw_bEyzqBKEA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lto.inc: Add global LTO distro policy file
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Adrian Bunk <bunk@stusta.de>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 24, 2020 at 4:50 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2020-03-24 at 13:27 +0200, Adrian Bunk wrote:
> > On Mon, Mar 23, 2020 at 04:25:29PM -0700, Khem Raj wrote:
> > > Distros which want to enable LTO can utilize this file, it only
> > > covers
> > > packages from OE-Core, other layers should include there own
> > > exclusion
> > > list for recipe which dont work with LTO
> > > ...
> > > +++ b/meta/conf/distro/include/lto.inc
> > > @@ -0,0 +1,23 @@
> > > +LTO_pn-glibc = ""
> > > +LTO_pn-gcc-runtime = ""
> > > +LTO_pn-libgcc-initial = ""
> > > +LTO_pn-libgcc = ""
> > > +LTO_pn-libpam = ""
> > > +LTO_pn-elfutils = ""
> > > +LTO_pn-perl = ""
> > > +LTO_pn-busybox = ""
> > > +LTO_pn-libxcrypt = ""
> > > +LTO_pn-curl = ""
> > > +LTO_pn-libcap = ""
> > > +LTO_pn-python3 = ""
> > > +LTO_pn-libproxy = ""
> > > +LTO_pn-libbsd = ""
> > > ...
> >
> > It would be better to have these in the individual recipes,
> > it is much easier to understand what is going on when all
> > recipe-specific information is in the recipe.
>
> I disagree. These files do let someone working on specific enablement
> see the status collectively and allow people to opt in/out of a given
> development feature.
>
> At some point in the future that can tip into making more sense in a
> recipe but its a staged process and things often make sense to start
> like this.

yeah. Maybe there should be a distro feature knob this inc file should
add which can be used by recipes
for an exception like adding configure options
>
> Cheers,
>
> Richard
>
