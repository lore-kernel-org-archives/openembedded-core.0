Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.115658.1597943156006109047
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 10:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qZajXBud;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id w9so1699297qts.6
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2020 10:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WntbnbV4qhx7FzIyAiOKp3x4SPuHqXf3Nbywl5QXNLY=;
        b=qZajXBudDezCYKaO66Hie05wWjrYz0wvMbbvrn0j4jkd6UPp3zRF4aet149STOSnEy
         IZpsUHiN9iQAh5Mh3+RAX3mwtH20AXXMEFNkP5EWQCFK2VKotqpc4SMJvrbC9xgnI5aX
         vEtStRCCdaYp/JtR994H24gzi1MBt/BfRMEWfQy9Mf9R4ukAPxd+XgvifoDk50BXEWd7
         etWw5iLBXIwom9lcPpfArZwlKLIy+m9HMlLnnvENPyokgtXxWHmnt2LMKmis11ci4aOa
         CvAO9Kk2RNj/Q5ZbOikNEI1AJiU1BMpPtBDTq8bxQf44UKcyHjrnhnz7NGb62Pe4Exbh
         OE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WntbnbV4qhx7FzIyAiOKp3x4SPuHqXf3Nbywl5QXNLY=;
        b=PBn6lN4VVnXxlZzgC3oNr6AGkjzNjFHtwXo7iQEwZkauMKHwTM5bSOYI56jO02gb1a
         qL/ZXNRf51Gx9viKCkX9/YPt8WmFNsWh6QSaldVeY4ZsEPKPGzo7jpHR5fLviu3p9hzV
         G+liReHntre9SUxTmzFFNNFjS96J+WCBpqkxS7qfXIC8GWOkOqynYa/qvfkoSv5+Y9gj
         MLrbXO6tp8Mr6D29cYLWtp81eJ9xzb++MQnnUbv5/wXOctLl3FQPuYiXXcDlJAKHOiXe
         cZAIBPfoEkyvop3jnTpVbE3l1j7UBgQ3pkKknTFMZ2IYUx8vgrwywcL8XcgqDFysqL4h
         krLQ==
X-Gm-Message-State: AOAM530E2EbDDX9c1QHdwRcF7c8v3FVJrIK8MdWu1K0r2Mmf5agdYpXE
	aWSLjEuv4LIRewCVhV7Bq/cdHhP0/rzB83eabGG9JXxCAdREBQ==
X-Google-Smtp-Source: ABdhPJyuHIam2DLl8bf9kXLDhW+Exo2hZZ91K7EkQH62r/Q42nRfodJ2p0Cm64VktPYDqi6UM4lySja+38EGgyrXPnA=
X-Received: by 2002:ac8:70cd:: with SMTP id g13mr3581126qtp.53.1597943154999;
 Thu, 20 Aug 2020 10:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200820065727.2589128-1-raj.khem@gmail.com> <20200820065727.2589128-2-raj.khem@gmail.com>
 <CAMjhiJiEdpLHF7EONY4YchXAeXPK0qbgb2JF_pRLmvTQedEn=w@mail.gmail.com>
In-Reply-To: <CAMjhiJiEdpLHF7EONY4YchXAeXPK0qbgb2JF_pRLmvTQedEn=w@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 20 Aug 2020 10:05:28 -0700
Message-ID: <CAMKF1soWSJw8oPG2RRYBNNr3YO5e71rroHbiC++-JOVgD32yPQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] gcc-cross-canadian: Install gcc/g++ wrappers for musl
To: Leon Woestenberg <leon@sidebranch.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 20, 2020 at 5:29 AM Leon Woestenberg <leon@sidebranch.com> wrote:
>
> Hi Khem,
>
> Thanks for looking into this. I applied your patch on top of our zeus
> branch (I think the issue is in zeus, dunfell, master).
>
> On Thu, Aug 20, 2020 at 8:57 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > gcc needs -mmusl option to be passed in SDK since we ship crossdk compiler
> > configured for glibc by default, this helps in creating correct
> > compiler defaults for musl based SDK compilers
> >
> > [YOCTO #13459]
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
>
> Can you elaborate why this is the proper solution over just
> TARGET_CC_ARCH_append_linux-musl = " --mmusl" in
> toolchain-scripts.bbclass?

this helps in keeping signatures the same when building SDK for musl
as well as glibc, changing TARGET_CC_ARCH based on target OS means
signatures will change for sdk environment recipe.

>
> > +
> > +       for i in linux ${CANADIANEXTRAOS}
>
> Why keep linux in here?
>
> > +       do
> > +               for v in ${CANADIANEXTRAVENDOR}
> > +               do
> > +                       d=${D}${bindir}/../${TARGET_ARCH}$v-$i
> > +                       install -d $d
>
> Hmm, even for the non-musl case?

this whole logic is taken from cross-canadian bbclass.

>
> > +                       for j in ${TARGET_PREFIX}gcc${EXEEXT} ${TARGET_PREFIX}g++${EXEEXT}
> > +                       do
> > +                               p=${TARGET_ARCH}$v-$i-`echo $j | sed -e s,${TARGET_PREFIX},,`
> > +                               case $i in
> > +                               *musl*)
> > +                                       echo "#!/usr/bin/env sh" > $d/$p
>
> $d/$p already exists at this point, and it's a softlink to the actual gcc.
> The redirected output will end up in the *target* of the softlink;
> this replaces the actual gcc compiler binary by a script, which calls
> itself.
> It ends up being a recursive invocation.
>
> I have added rm -f $d/$p above to fix this locally, while testing.

you should have tried v2

>
> > +                                       echo "exec \`dirname \$0\`/../${TARGET_SYS}/$j -mmusl \$@" >> $d/$p
> > +                                       chmod 0755 $d/$p
> > +                                       ;;
>
> Regards,
>
> Leon.
