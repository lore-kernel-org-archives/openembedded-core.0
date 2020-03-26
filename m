Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.2448.1585247407645410880
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 11:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GrfY+aQU;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id h14so7879905qke.5
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 11:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mjbqJ8AGju3Q+5ohnxEZNHWwhmBAPkpD56rLTLKoup8=;
        b=GrfY+aQUR6jjnRJsJ24aqw2EMlME+548E2RIIn0jsFZ26B2dhy2c9bv8yjxzmPJlsy
         x4qrGywgGo4r4bEx4ueOvV7ZqsrO9XNBP4icP7lb4EdFjBPM4sX/7Pm/X+4ysaoRO0kp
         l2UxHY0cFzrtDoiGHWpbZAnbuU3YTYpUU2HvcDQX+z+ekjbW3L/paStkPt1lPRqCVNdc
         Bnq0qWmMGhJ1MtfTo/n5nALcTjQk8naIHRKhlEa5YEtynwzlaESgmz4pFpYa407/plT1
         /RlJ4H1pY3t0APFiGrY3FYBaOmzh5lR5EQx9Y4Imhcd5740yzzPU5qbRiKJRLlCBajEh
         lrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mjbqJ8AGju3Q+5ohnxEZNHWwhmBAPkpD56rLTLKoup8=;
        b=fvY/YeW9eAjvWorTNm1XS4RU2b/J/PIhaPWFxp3q99LGGLWNvVT3CGQI8mbTmOKi34
         Fa502u5aPXa+LC5IXTkIOFd63Rs3j3vxiVelnM5xXCbvwYGHIdYRBCdFHvArDFmzVJ+d
         F8EPqqS0cEPCt6f8MYGWCeCpNMuqqBVYSuApSDHZ0whQDrCU5VQTldzxbhE9kQyLldsA
         bQNTkh0+Mv4Iv7rljVr+5IDQEow5rirSqwcWQm5p4jEuo7drBxPnwpqQaKXYM9UZdkMs
         5379iTFg07LI0SfoTooj6X4dYsaECJjpsmd9Gki61Fo1PFbQPE+mKRlrn/ZE2TjwAWvb
         O92w==
X-Gm-Message-State: ANhLgQ2VnbzH4LYrct3MOGmHw14iKim3/Q0jH9j35GZ0xDicOeZFCu/T
	CySKNuQxDoYnkxnemotNYw9H5QblyMRN6UGGERI=
X-Google-Smtp-Source: ADFU+vsHCgbPd7KME2EindQUI13PMGCmnWzPYfxG47GUUTneYabNXg1xbd9rKgSwy90+mPfcpU3yyUbKqqKFYcgbwDg=
X-Received: by 2002:a37:8d81:: with SMTP id p123mr9233497qkd.17.1585247406487;
 Thu, 26 Mar 2020 11:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200325231637.802324-1-raj.khem@gmail.com> <9c14fe5a594e1edd4cb678340ec27859ba9df864.camel@linuxfoundation.org>
 <CAMKF1srYNHp7hNBzuTcgxHDAnA7rsu=53Qs8YyaE+tCxfd26Rg@mail.gmail.com>
In-Reply-To: <CAMKF1srYNHp7hNBzuTcgxHDAnA7rsu=53Qs8YyaE+tCxfd26Rg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 26 Mar 2020 11:29:39 -0700
Message-ID: <CAMKF1sp3kT69xFNVjpckzymVt+jbguz3byzZF1Pc5H5wzZj_Uw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: Pregenerate autoconf files
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Ross Burton <ross.burton@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 26, 2020 at 10:03 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Mar 26, 2020 at 5:45 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Wed, 2020-03-25 at 16:16 -0700, Khem Raj wrote:
> > > libtool patch will result in configure file regeneration, instead of
> > > doing that at build time, do it in patch itself, this avoids running
> > > autoconf before configure step.
> > >
> > > Since binutils needs specific version of autoconf ( which is 2.69 )
> > > this will break on systems using newer or older verisons of autoconf
> > > in current state.
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > Cc: Ross Burton <ross.burton@intel.com>
> > > ---
> > >  meta/recipes-devtools/binutils/binutils.inc   |     8 +-
> > >  .../binutils/0007-Use-libtool-2.4.patch       | 26583 ++++++++++++
> > > ----
> > >  2 files changed, 20352 insertions(+), 6239 deletions(-)
> >
> > Whilst I appreciate the intent here, our policy is to autoreconf most
> > things in general. This allows us to more easily support newer
> > architectures and platforms.
> >
> > There is a significant build speed benefit from not autoreconf'ing
> > things but where do we draw the line?
> >
>
> in general this is fine but binutils, gcc , glibc can not be treated
> in general category
> since they have dependencies on specific versions of autotools
> unfortunately, it currently
> works for binutils because our version of autoconf matches with what
> binutils expects
> as of now, but this will skew if this changes in future. In nutshell,
> the auto-fu in these
> packages is quite involved and has hard dependencies on specific
> versions of tools
> needed to reconfig them.
>
> > I'm also worried about patches which touch both configure and
> > configure.ac since the timestamp changes can cause things to autoreconf
> > even when we're trying to avoid that. As such this is actually quite a
> > risky change given past bad experiences :(
>
> We were not fully reconfiguring binutils even now, because of other
> autotool sversion mimatches
> only autoconf was being run which does not change the case if
> configure was say regenerated
> as you say.
>
> >
> > I'm not completely against it but I am worried.
> >
>
> perhaps addresses some of your concerns.

after some IRC discussions, I think it better for us to drop this change.

>
> > Cheers,
> >
> > Richard
> >
