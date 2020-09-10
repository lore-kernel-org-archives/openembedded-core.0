Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web10.24418.1599750674778634887
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 08:11:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=lkKn8G2N;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.67, mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f67.google.com with SMTP id z13so7431109iom.8
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 08:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ODYPX3OiIftVsaYscAwpdP9kGspowg5W+BppOWWG3Fg=;
        b=lkKn8G2NQg1YjAXj9usNI1TPVfm++Klk7WxWQFViUB0OVtWrn/R/B07YIu66yeQifj
         9BUpYevkttrec7Z7Ra00hZpG49CxwY/rCra5DdQ3/eL7Repots+5KSLT+UTwVblxfUHY
         IttFefHEmD/zj6WTjFDy6iAAT3DxVFdFR4SgPqiEKipprEFSKutmUSPgWz4NyPmyQ/ts
         wtuGL2tbc6JxVYgpLdM/+04aaUEerpvLnXdEjDzV4OtOzYD+mIo1NFWF6ktlcldczGHS
         /gkz6rVEGkTW3NUFyS0nBlO0vmOn6eHzISq6/YGSBIdFpMJmbOIHbaCVYfuFBs6r8p+0
         nXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ODYPX3OiIftVsaYscAwpdP9kGspowg5W+BppOWWG3Fg=;
        b=Phjf+JIey14v/fvIj5aIw8q/dAITnqBTwbTvdUoHZy3KnjMJO6Ou6vauqOeTJFoeQu
         t8DSWsPOztu40Dm8/GAGWDbmMJssXxa2ad9B+TPg9kGhWgmYPvAtbckbEbEYNCt6vkMG
         zSWua6uQbMy38xqmfN5KKsfpWoF047SBn8QdjKhsofPBC5/iyNrB8WFWIf4v9jNkQjNN
         1p8XwNz1jVO/w/HTP3sNg1ePP/HdDWKvxSpnPxnyl5IRKHkbkdRVhQ4WnlyKhyd0x2cl
         MTHZNFHf+BhMWPfZI7q+LjPot9uTL7HSgaPppPmQ77sElV3EpgqXiBNjd0g4IYNaJSL+
         alaQ==
X-Gm-Message-State: AOAM531bESnstQdwcaEC/oJmxjvJtQMuME3hQeacbv+d0IkK03ZttLUM
	4/WQNvQCbuwMvt0eHb53yrO7zhimV7A6bhfvM9MbA9vcLhVAvQ==
X-Google-Smtp-Source: ABdhPJzwayPA/YH4FuSUy//t5+9s2tyhKnZ+T+x7UpFVNL7SyXXWkPzoZA7hh7aOyClKpKpNOIlDMLBx84Seo6CAuhs=
X-Received: by 2002:a05:6638:224e:: with SMTP id m14mr9019466jas.101.1599750673707;
 Thu, 10 Sep 2020 08:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200909224535.27164-1-jon.mason@arm.com> <20200909224535.27164-2-jon.mason@arm.com>
 <0990a4f9-96c8-4b1a-9068-ba3760512f0c@kernel.crashing.org>
 <CAPoiz9woev9k4cccExxyds6C2POvNmracp9awJgwvZJxqxYHSA@mail.gmail.com> <e947e9f7-92f7-d6bc-7d80-467411e18cf9@kernel.crashing.org>
In-Reply-To: <e947e9f7-92f7-d6bc-7d80-467411e18cf9@kernel.crashing.org>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Thu, 10 Sep 2020 11:11:02 -0400
Message-ID: <CAPoiz9yF=cxDOE24M7DXyBXdqybkeuZ+jrkHAGtuiv+_Bp5jAw@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][RFC 1/6] arm64: set BASE_LIB to lib64
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 10, 2020 at 12:57 AM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
>
>
> On 9/9/20 6:29 PM, Jon Mason wrote:
> > On Wed, Sep 9, 2020 at 6:55 PM Mark Hatle
> > <mark.hatle@kernel.crashing.org> wrote:
> >>
> >>
> >>
> >> On 9/9/20 5:45 PM, Jon Mason wrote:
> >>> Set BASE_LIB for all arm64 systems to be lib64 by default.  This can be
> >>> overridden for those that want something else (see tune-cortexa32.inc).
> >>>
> >>> Signed-off-by: Jon Mason <jon.mason@arm.com>
> >>> ---
> >>>  meta/conf/machine/include/arm/arch-arm64.inc           | 3 +--
> >>>  meta/conf/machine/include/arm/arch-armv8-2a.inc        | 2 --
> >>>  meta/conf/machine/include/arm/arch-armv8a.inc          | 4 ----
> >>>  meta/conf/machine/include/tune-cortexa32.inc           | 1 +
> >>>  meta/conf/machine/include/tune-cortexa35.inc           | 2 --
> >>>  meta/conf/machine/include/tune-cortexa53.inc           | 2 --
> >>>  meta/conf/machine/include/tune-cortexa55.inc           | 1 -
> >>>  meta/conf/machine/include/tune-cortexa57-cortexa53.inc | 1 -
> >>>  meta/conf/machine/include/tune-cortexa57.inc           | 2 --
> >>>  meta/conf/machine/include/tune-cortexa72-cortexa53.inc | 2 --
> >>>  meta/conf/machine/include/tune-cortexa72.inc           | 1 -
> >>>  meta/conf/machine/include/tune-cortexa73-cortexa53.inc | 2 --
> >>>  12 files changed, 2 insertions(+), 21 deletions(-)
> >>>
> >>> diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
> >>> index 6d5b22fff081..8c3764186ec4 100644
> >>> --- a/meta/conf/machine/include/arm/arch-arm64.inc
> >>> +++ b/meta/conf/machine/include/arm/arch-arm64.inc
> >>> @@ -1,4 +1,5 @@
> >>>  DEFAULTTUNE ?= "aarch64"
> >>> +BASE_LIB ?= "lib64"
> >>
> >> Does this work?  The default multilib behavior is:
> >>
> >> multilib.conf:baselib = "${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE')
> >> or 'INVALID')) or d.getVar('BASELIB')}"
> >>
> >> bitbake.conf:baselib = "${BASELIB}"
> >> bitbake.conf:BASELIB = "lib"
> >> bitbake.conf:BASELIB_powerpc64 = "lib64"
> >> bitbake.conf:BASELIB_powerpc64le = "lib64"
> >>
> >> is what has been defined in the bitbake.conf file.
> >>
> >> Idea being in the 'normal' (not-multilib) case, 'baselib' (which what is used)
> >> gets set to 'BASELIB'.  Only PowerPC 64 has a hard coded 'lib64'.  Every other
> >> architecture is considered to be variable, unless defined in the tune.  (The two
> >> PowerPC settings really should be in a PPC tune file.)
> >>
> >> So IF the multilib.conf is enabled, it's going to look for BASE_LIB_tune-....
> >> and then BASELIB, but it won't look at 'BASE_LIB'.
> >
> > It depends on what "work" is defined as :)
> > I did build, boot, and run testimage on it (with issue).  But I'm
> > probably not hitting the multilib issue you are describing.  Honestly,
> > I don't understand it and needed to spend more time than I did (based
> > on your comments).  I like the removal of lines to simplify it, but I
> > need to do some more reading on it.  I'll drop this patch and come
> > back to the underlying problem at some point in the future.
>
> (This is from memory, so it may not be right)
>
> In your local.conf:
>
> MULTILIBS = "multilib:lib32"
> require conf/multilib.conf
>
> DEFAULTTUNE_virtclass-multilib-lib32 = "armv7vethf"
> MACHINE = "qemuarm64"
>
> Then add something like "lib32-glibc" as a dependency to your image.

This is building, booting, and passing testimage for me.  It's
possible I screwed something up (weird that a screwup would make
things work though).

Thanks,
Jon

> --Mark
>
> > Thanks,
> > Jon
> >
> >>>  require conf/machine/include/arm/arch-armv7ve.inc
> >>>
> >>> @@ -14,8 +15,6 @@ TUNE_FEATURES_tune-aarch64 = "aarch64"
> >>>  TUNE_FEATURES_tune-aarch64_be = "${TUNE_FEATURES_tune-aarch64} bigendian"
> >>>  TUNE_PKGARCH_64_tune-aarch64 = "aarch64"
> >>>  TUNE_PKGARCH_64_tune-aarch64_be = "aarch64_be"
> >>> -BASE_LIB_tune-aarch64 = "lib64"
> >>> -BASE_LIB_tune-aarch64_be = "lib64"
> >>
> >> This was originally done like this to enable multilib, as BASE_LIB needs to be
> >> configured per multilib.  (I don't know if it's really necessary any longer.)
> >>
> >> Note the other 32/64 bit architecture are still implemented like this.
> >>
> >> There was also talk at the time of different lib dirs for little and big endian,
> >> but I never saw that actually happen.
> >>
> >> We also wanted a way to build optimized libraries, like some distributions, that
> >> are optimized for specific tunings and place those into non-conflicting
> >> directories.  But again, AFAIK nobody actually did it and I' not sure it
> >> actually works.
> >>
> >> And for the record BASE_LIB is documented in the tune README as:
> >>
> >> BASE_LIB_tune-<tune> - The "/lib" location for a specific ABI.  This is
> >> used in a multilib configuration to place the libraries in the correct,
> >> non-conflicting locations.
> >>
> >>>  PACKAGE_EXTRA_ARCHS_tune-aarch64 = "aarch64"
> >>>  PACKAGE_EXTRA_ARCHS_tune-aarch64_be = "aarch64_be"
> >>> diff --git a/meta/conf/machine/include/arm/arch-armv8-2a.inc b/meta/conf/machine/include/arm/arch-armv8-2a.inc
> >>> index 1c095256d185..b40ebf176e43 100644
> >>> --- a/meta/conf/machine/include/arm/arch-armv8-2a.inc
> >>> +++ b/meta/conf/machine/include/arm/arch-armv8-2a.inc
> >>> @@ -15,5 +15,3 @@ TUNE_FEATURES_tune-armv8-2a                  = "aarch64 armv8-2a"
> >>>  TUNE_FEATURES_tune-armv8-2a-crypto           = "${TUNE_FEATURES_tune-armv8-2a} crypto"
> >>>  PACKAGE_EXTRA_ARCHS_tune-armv8-2a            = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8-2a"
> >>>  PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} armv8-2a-crypto"
> >>> -BASE_LIB_tune-armv8-2a                       = "lib64"
> >>> -BASE_LIB_tune-armv8-2a-crypto                = "lib64"
> >>> diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/machine/include/arm/arch-armv8a.inc
> >>> index f810a1e8fc98..5584005f7009 100644
> >>> --- a/meta/conf/machine/include/arm/arch-armv8a.inc
> >>> +++ b/meta/conf/machine/include/arm/arch-armv8a.inc
> >>> @@ -24,7 +24,3 @@ PACKAGE_EXTRA_ARCHS_tune-armv8a            = "aarch64 armv8a"
> >>>  PACKAGE_EXTRA_ARCHS_tune-armv8a-crc        = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-crc"
> >>>  PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8a-crypto"
> >>>  PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} armv8a-crypto armv8a-crc-crypto"
> >>> -BASE_LIB_tune-armv8a                       = "lib64"
> >>> -BASE_LIB_tune-armv8a-crc                   = "lib64"
> >>> -BASE_LIB_tune-armv8a-crypto                = "lib64"
> >>> -BASE_LIB_tune-armv8a-crc-crypto            = "lib64"
> >>> diff --git a/meta/conf/machine/include/tune-cortexa32.inc b/meta/conf/machine/include/tune-cortexa32.inc
> >>> index 0ffb3e068855..78dab8bed6e1 100644
> >>> --- a/meta/conf/machine/include/tune-cortexa32.inc
> >>> +++ b/meta/conf/machine/include/tune-cortexa32.inc
> >>> @@ -14,5 +14,6 @@ TUNE_FEATURES_tune-cortexa32          = "armv8a cortexa32 crc"
> >>>  TUNE_FEATURES_tune-cortexa32-crypto   = "${TUNE_FEATURES_tune-cortexa32} crypto"
> >>>  PACKAGE_EXTRA_ARCHS_tune-cortexa32             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa32"
> >>>  PACKAGE_EXTRA_ARCHS_tune-cortexa32-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa32 cortexa32-crypto"
> >>> +# Cortex-A32 is 32bit only
> >>>  BASE_LIB_tune-cortexa32               = "lib"
> >>>  BASE_LIB_tune-cortexa32-crypto        = "lib"
> >>> diff --git a/meta/conf/machine/include/tune-cortexa35.inc b/meta/conf/machine/include/tune-cortexa35.inc
> >>> index 61696da540cc..80825972b612 100644
> >>> --- a/meta/conf/machine/include/tune-cortexa35.inc
> >>> +++ b/meta/conf/machine/include/tune-cortexa35.inc
> >>> @@ -13,5 +13,3 @@ TUNE_FEATURES_tune-cortexa35          = "aarch64 cortexa35 crc"
> >>>  TUNE_FEATURES_tune-cortexa35-crypto   = "${TUNE_FEATURES_tune-cortexa35} crypto"
> >>>  PACKAGE_EXTRA_ARCHS_tune-cortexa35             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa35"
> >>>  PACKAGE_EXTRA_ARCHS_tune-cortexa35-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa35 cortexa35-crypto"
> >>> -BASE_LIB_tune-cortexa35               = "lib64"
> >>> -BASE_LIB_tune-cortexa35-crypto        = "lib64"
> >>> diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/machine/include/tune-cortexa53.inc
> >>> index 79ce7c4b1c21..385c2d225777 100644
> >>> --- a/meta/conf/machine/include/tune-cortexa53.inc
> >>> +++ b/meta/conf/machine/include/tune-cortexa53.inc
> >>> @@ -14,5 +14,3 @@ TUNE_FEATURES_tune-cortexa53-crypto   = "${TUNE_FEATURES_tune-cortexa53} crypto"
> >>>  PACKAGE_EXTRA_ARCHS_tune-cortexa53             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa53"
> >>>  PACKAGE_EXTRA_ARCHS_tune-cortexa53-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa53 cortexa53-crypto"
> >>>
> >>> -BASE_LIB_tune-cortexa53               = "lib64"
> >>> -BASE_LIB_tune-cortexa53-crypto        = "lib64"
> >>> diff --git a/meta/conf/machine/include/tune-cortexa55.inc b/meta/conf/machine/include/tune-cortexa55.inc
> >>> index 66a5d0c437ee..099b6d72851a 100644
> >>> --- a/meta/conf/machine/include/tune-cortexa55.inc
> >>> +++ b/meta/conf/machine/include/tune-cortexa55.inc
> >>> @@ -10,4 +10,3 @@ AVAILTUNES += "cortexa55"
> >>>  ARMPKGARCH_tune-cortexa55             = "cortexa55"
> >>>  TUNE_FEATURES_tune-cortexa55          = "aarch64 cortexa55 crypto"
> >>>  PACKAGE_EXTRA_ARCHS_tune-cortexa55    = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa55"
> >>> -BASE_LIB_tune-cortexa55               = "lib64"
> >>> diff --git a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
> >>> index 5880bf203231..02691d0deee2 100644
> >>> --- a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
> >>> +++ b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
> >>> @@ -12,4 +12,3 @@ AVAILTUNES += "cortexa57-cortexa53"
> >>>  ARMPKGARCH_tune-cortexa57-cortexa53 = "cortexa57-cortexa53"
> >>>  TUNE_FEATURES_tune-cortexa57-cortexa53 = "aarch64 crc cortexa57-cortexa53"
> >>>  PACKAGE_EXTRA_ARCHS_tune-cortexa57-cortexa53 = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa57-cortexa53"
> >>> -BASE_LIB_tune-cortexa57-cortexa53 = "lib64"
> >>> diff --git a/meta/conf/machine/include/tune-cortexa57.inc b/meta/conf/machine/include/tune-cortexa57.inc
> >>> index 3206ce75a6b6..868939ca10c7 100644
> >>> --- a/meta/conf/machine/include/tune-cortexa57.inc
> >>> +++ b/meta/conf/machine/include/tune-cortexa57.inc
> >>> @@ -13,5 +13,3 @@ TUNE_FEATURES_tune-cortexa57          = "aarch64 cortexa57 crc"
> >>>  TUNE_FEATURES_tune-cortexa57-crypto   = "${TUNE_FEATURES_tune-cortexa57} crypto"
> >>>  PACKAGE_EXTRA_ARCHS_tune-cortexa57             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa57"
> >>>  PACKAGE_EXTRA_ARCHS_tune-cortexa57-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa57 cortexa57-crypto"
> >>> -BASE_LIB_tune-cortexa57               = "lib64"
> >>> -BASE_LIB_tune-cortexa57-crypto        = "lib64"
> >>> diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> >>> index feb1df5c178d..34aaa6cc72a7 100644
> >>> --- a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> >>> +++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> >>> @@ -15,6 +15,4 @@ TUNE_FEATURES_tune-cortexa72-cortexa53               = "aarch64 crc cortexa72-co
> >>>  TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        = "${TUNE_FEATURES_tune-cortexa72-cortexa53} crypto"
> >>>  PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa72-cortexa53"
> >>>  PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72-cortexa53 cortexa72-cortexa53-crypto"
> >>> -BASE_LIB_tune-cortexa72-cortexa53                    = "lib64"
> >>> -BASE_LIB_tune-cortexa72-cortexa53-crypto             = "lib64"
> >>>
> >>> diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/tune-cortexa72.inc
> >>> index 00f7745a22fd..f0f76cad14db 100644
> >>> --- a/meta/conf/machine/include/tune-cortexa72.inc
> >>> +++ b/meta/conf/machine/include/tune-cortexa72.inc
> >>> @@ -10,4 +10,3 @@ AVAILTUNES += "cortexa72"
> >>>  ARMPKGARCH_tune-cortexa72             = "cortexa72"
> >>>  TUNE_FEATURES_tune-cortexa72          = "aarch64 cortexa72 crc crypto"
> >>>  PACKAGE_EXTRA_ARCHS_tune-cortexa72    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72"
> >>> -BASE_LIB_tune-cortexa72               = "lib64"
> >>> diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
> >>> index 1c221999f408..6da93ffac0b7 100644
> >>> --- a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
> >>> +++ b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
> >>> @@ -15,6 +15,4 @@ TUNE_FEATURES_tune-cortexa73-cortexa53               = "aarch64 crc cortexa73-co
> >>>  TUNE_FEATURES_tune-cortexa73-cortexa53-crypto        = "${TUNE_FEATURES_tune-cortexa73-cortexa53} crypto"
> >>>  PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa73-cortexa53"
> >>>  PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa53 cortexa73-cortexa53-crypto"
> >>> -BASE_LIB_tune-cortexa73-cortexa53                    = "lib64"
> >>> -BASE_LIB_tune-cortexa73-cortexa53-crypto             = "lib64"
> >>>
> >>>
> >>>
> >>> 
> >>>
