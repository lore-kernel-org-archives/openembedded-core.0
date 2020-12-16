Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web12.999.1608145234376278386
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 11:00:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BNMdmMxc;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id z9so18166518qtn.4
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Dec 2020 11:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KnTenDqhHuBtuNcKuQJwdwKglV8rXtHfSlUUPRLcgL4=;
        b=BNMdmMxciADP/Rdvx54bdZ5nz3Yf49IBAe2I/pE1CUOmzCZ019TfbMk96paxEn9Pa7
         P2nvxy0rLTdbQEzEy/WGAB+hwyuW1yt4sVud8QvO57FduRDB+YLEW1lY3T+V5XdfjE7+
         3/uDRdaUl6A+8UrgdDJvNkfmplXmMa4mtM50qlIGKsPNRiiz5EHHEDBG6C1V6kzMCg7d
         IkwzDpmNERwHV/s3iagCTNgNNHJBQMk0SaZM7HE51Hkb+qfqZ2QwLKloJad6BqreUw4g
         koMzPyPRJKFSZaSU53YXc8CmUNKOxez973imKM60aq3hgt0xzI5GCZH31Hnpy1dRS6W/
         th5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KnTenDqhHuBtuNcKuQJwdwKglV8rXtHfSlUUPRLcgL4=;
        b=g0iWTp1WDHCDDYYZU8MXCiHQCDZuI3deaEDsG/7OAv5BmCcjxpSqxCFAGOWhzx6sAG
         2rTrbPmpxvB0ptapdKRE+J3qos4WMtL+CG0ZyB5pAouxjV2WrWb7vaQJGN0MQDWNxnn0
         QoY/bY/VvAS5SHOIiMI84c62+UIAYZvr+vlwwaXpJ6Ntas0sr9cYk8HAuF9sKKC3gMOe
         /cOkYcHmyBlmC+C7PQ3zNUvDgMhgn65kvgv45VBIIoYjgiUdxwZrGZQq5EhqWG9wMa4h
         llt8cA0trfeOv/zeDd9GTVdl/eq3l8xh89DiQD58QtbenyT0iJ2kY+mB9bW7LYyXF0J5
         hxeQ==
X-Gm-Message-State: AOAM532FThCu8JZjS4IsiiwlL82txY2a62/1QcCguDI4p8VmdulhPFLW
	9ym/fBT8E5N18Wsue3RfaFZrqRMWsVys86kKNwmSpIx7HaQ=
X-Google-Smtp-Source: ABdhPJykJ4q0j/aSxRMUq2BD2DgM/MKndDUTMlMoHVs0z/wz9oUrTtmwS6ELt7rW91eCx56jyHXCp/93E+ooUVfwy1o=
X-Received: by 2002:ac8:729a:: with SMTP id v26mr44105210qto.53.1608145233251;
 Wed, 16 Dec 2020 11:00:33 -0800 (PST)
MIME-Version: 1.0
References: <20201216073754.4371-1-alanp@snowmoose.com> <CAMKF1sq+_YGUfaKVDYW8APSFdMDC8BWV+Tdf4mm+XjJ+w4_BvQ@mail.gmail.com>
 <d1e0520e-3321-2ef1-9ba6-9a4a5287998a@snowmoose.com>
In-Reply-To: <d1e0520e-3321-2ef1-9ba6-9a4a5287998a@snowmoose.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 16 Dec 2020 11:00:07 -0800
Message-ID: <CAMKF1sr0mDqyrvNg2nLBdKytZv9vLbGNBSn8rH_V0P+rEhRmXw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: add libopcodes package for perf
To: Alan Perry <alanp@snowmoose.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 16, 2020 at 10:57 AM Alan Perry <alanp@snowmoose.com> wrote:
>
>
>
> On 12/16/20 10:27 AM, Khem Raj wrote:
> > On Tue, Dec 15, 2020 at 11:38 PM Alan Perry <alanp@snowmoose.com> wrote:
> >> Add a package for libopcodes, since, like libbfd, it is needed by
> >> perf. Without separate packages for these libraries, all of the
> >> binutil tools get added as well.
> >>
> > libopcodes is not an API that binutils publish for wider consumption,
> > its meant for internal components and
> > external components can use it from binutils itself knowing very well
> > that it will change with binutils and therefore
> > I would prefer to not separate it out into separate package like this
> > which can appear as if its an external API
> > that binutils will respect.
>
> Currently in binutils, the libbfd package is there "so including perf
> doesn't include extra stuff".
>
> Without this change, including perf includes that extra stuff anyway.
>
> If that comment is to be believed, the libbfd is not currently being
> provided in binutils as an external API.

yes libbfd should also have not been done this way as well but I guess
there are more than
one user for libbfd which tilted in its favor.

>
>
> >
> >> Signed-off-by: Alan Perry <alanp@snowmoose.com>
> >> ---
> >>   meta/recipes-devtools/binutils/binutils_2.35.bb | 6 ++++--
> >>   1 file changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/recipes-devtools/binutils/binutils_2.35.bb b/meta/recipes-devtools/binutils/binutils_2.35.bb
> >> index 2e645e1ed8..976e49765a 100644
> >> --- a/meta/recipes-devtools/binutils/binutils_2.35.bb
> >> +++ b/meta/recipes-devtools/binutils/binutils_2.35.bb
> >> @@ -52,9 +52,11 @@ do_install_class-native () {
> >>          rmdir ${D}/${libdir}64 || :
> >>   }
> >>
> >> -# Split out libbfd-*.so so including perf doesn't include extra stuff
> >> -PACKAGE_BEFORE_PN += "libbfd"
> >> +# Split out libbfd-*.so and libopcodes-*.so so including perf doesn't include
> >> +# extra stuff
> >> +PACKAGE_BEFORE_PN += "libbfd libopcodes"
> >>   FILES_libbfd = "${libdir}/libbfd-*.so.* ${libdir}/libbfd-*.so"
> >> +FILES_libopcodes = "${libdir}/libopcodes-*.so.* ${libdir}/libopcodes-*.so"
> >>
> >>   SRC_URI_append_class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch "
> >>
> >> --
> >> 2.17.1
> >>
> >>
> >> 
> >>
>
