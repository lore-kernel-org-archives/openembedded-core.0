Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.3043.1585270669869654976
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 17:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XWb9uBiP;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id e11so9201684qkg.9
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 17:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2QZQ+AreYJVs/gsNzBs+0Qk7K1iCsu8jttpmxK+QIZY=;
        b=XWb9uBiPsM4OfSKUAa1EZsQLWu15+of8MifKHhNF9AxAnkghv17/DnnGX0aqJjfUmK
         U3dDG/UBuJkAXnLdXIeiRuf+WNhnN1zIwGOZsq37DOUSlIUHpVbxZkB2ZfWpVLiBo4du
         fISof1WcMR5lCSDOs+K8v00OdfYHe7/z6SK0/+S85UUkS2rwdWZxzXvz/pMXQI9S/RPc
         MDWCTfQBg1u7UmCW5SK38fvbr1Naez79ZHpeGh52ik8HUJfqMbvDzVPvTcnhejVHM+mv
         flo6uz+DUu9sU75Jr2gjODgNNHuADFW+97rqiiV0QUUbQKiu+45jEbvsemn0xOCGnVQ+
         HQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2QZQ+AreYJVs/gsNzBs+0Qk7K1iCsu8jttpmxK+QIZY=;
        b=ckhV8Dc0xUHeDnjDUUpwG0y23K5+NnEVBCIXT+ANXITvcIWGFHYeIySTSsvvfeZUvR
         Ci4C/LTAxww8SKtcqp2gtD8J4EfVya2ZR/AaMRpyRv5Z1XlpADLX/6/NSwtqdR/xQn/c
         yv8PGMVjeiURdvHQZqdzcP6v3a1FQe8WoDEXKWktTG7TU2RW4nk3/yTNnC2EXOJNsi5Y
         kIIvJvRG6Sa0lykkZ9ejnw6WhN2Syt/W1eZgRFAjewRN3JWlOHaL+bwTCT53nAtYld2h
         79i929HYt1HP6yKqvIqRcAAakJyUOEeH1djSOm5+rA63dgEQHIvpk3uoV6o0/jBnoItj
         kd/w==
X-Gm-Message-State: ANhLgQ1mGJIBU+mhEpSjM9INgpfvpeL7Qcc4gX1DU2GAnZvDrSe/JU3B
	TQ+CoRrM0X5Oa/d1EFYieNRaXXkBzrTkM+mRQ4g=
X-Google-Smtp-Source: ADFU+vtEhmR2RKs73bREBL2WdFWX2aAQKog3c3yfklOwj07MU4m4nLKrsjnMHs8OZ8gj/gpyUdBe+LwYiujP0Vpwe4U=
X-Received: by 2002:a05:620a:22b:: with SMTP id u11mr11620006qkm.225.1585270668574;
 Thu, 26 Mar 2020 17:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200325231637.802324-1-raj.khem@gmail.com> <9c14fe5a594e1edd4cb678340ec27859ba9df864.camel@linuxfoundation.org>
 <CAMKF1srYNHp7hNBzuTcgxHDAnA7rsu=53Qs8YyaE+tCxfd26Rg@mail.gmail.com> <CAMKF1sp3kT69xFNVjpckzymVt+jbguz3byzZF1Pc5H5wzZj_Uw@mail.gmail.com>
In-Reply-To: <CAMKF1sp3kT69xFNVjpckzymVt+jbguz3byzZF1Pc5H5wzZj_Uw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 26 Mar 2020 17:57:21 -0700
Message-ID: <CAMKF1sr=dHZs=B-O-0C8C5V-Yni3pKbe7L2v16deE1ZpOZ+5Ng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: Pregenerate autoconf files
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Ross Burton <ross.burton@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 26, 2020 at 11:29 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Mar 26, 2020 at 10:03 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, Mar 26, 2020 at 5:45 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Wed, 2020-03-25 at 16:16 -0700, Khem Raj wrote:
> > > > libtool patch will result in configure file regeneration, instead of
> > > > doing that at build time, do it in patch itself, this avoids running
> > > > autoconf before configure step.
> > > >
> > > > Since binutils needs specific version of autoconf ( which is 2.69 )
> > > > this will break on systems using newer or older verisons of autoconf
> > > > in current state.
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > Cc: Ross Burton <ross.burton@intel.com>
> > > > ---
> > > >  meta/recipes-devtools/binutils/binutils.inc   |     8 +-
> > > >  .../binutils/0007-Use-libtool-2.4.patch       | 26583 ++++++++++++
> > > > ----
> > > >  2 files changed, 20352 insertions(+), 6239 deletions(-)
> > >
> > > Whilst I appreciate the intent here, our policy is to autoreconf most
> > > things in general. This allows us to more easily support newer
> > > architectures and platforms.
> > >
> > > There is a significant build speed benefit from not autoreconf'ing
> > > things but where do we draw the line?
> > >
> >
> > in general this is fine but binutils, gcc , glibc can not be treated
> > in general category
> > since they have dependencies on specific versions of autotools
> > unfortunately, it currently
> > works for binutils because our version of autoconf matches with what
> > binutils expects
> > as of now, but this will skew if this changes in future. In nutshell,
> > the auto-fu in these
> > packages is quite involved and has hard dependencies on specific
> > versions of tools
> > needed to reconfig them.
> >
> > > I'm also worried about patches which touch both configure and
> > > configure.ac since the timestamp changes can cause things to autoreconf
> > > even when we're trying to avoid that. As such this is actually quite a
> > > risky change given past bad experiences :(
> >
> > We were not fully reconfiguring binutils even now, because of other
> > autotool sversion mimatches
> > only autoconf was being run which does not change the case if
> > configure was say regenerated
> > as you say.
> >
> > >
> > > I'm not completely against it but I am worried.
> > >
> >
> > perhaps addresses some of your concerns.
>
> after some IRC discussions, I think it better for us to drop this change.
>

I think IRC discussions confused me a bit,  This patch will improve
the situation for binutils since
we dont have to run Autoconf which we are now doing on few selected
directories where configure.ac has
been changed due to our patches.

This patch ensures that all configure scripts are up to date and do
not require to be regenerated during do_configure
step like common autotooled recipes.


> >
> > > Cheers,
> > >
> > > Richard
> > >
