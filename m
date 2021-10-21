Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B1AC433F5
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 15:33:39 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.11039.1634830418144430053
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 08:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=jpiUE7V1;
 spf=pass (domain: burtonini.com, ip: 209.85.128.50,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f50.google.com with SMTP id o24so133169wms.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 08:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0GlAxpDWkLyYj2FKGnviAKOZ+SUEI5eLipno1pjrF5U=;
        b=jpiUE7V1yNfEVl2Ks+1dEagAckmRMAxJ2Cnz57wFtVhLHTHF+CKAVZMpfmoO6K/Ww5
         bw1oNkIYDJV8z+aqn4qw/ebr+sH5E396iRkw104GRJtfzfAFMlKUTze+/PFYaeBv5TkW
         /7666ZrMlwFgB5kqBbINzeJeewnUw+ed/bAPTSFGJ/mrHj6mrltXwhAwF4MDgHeU4R/i
         P43PVaTrM1AzdDSU17X6okS14Kld09V0qFHoflMUXl8x2ppEmA2/C8fa6qlXNN1TnWTX
         YYFQgsvFPyO900w6HzrUBjXggFRQaIQ1ffQeOA/LIIODUuAB4j8CxCKCv1g9zAJMbRTw
         /Iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0GlAxpDWkLyYj2FKGnviAKOZ+SUEI5eLipno1pjrF5U=;
        b=iiOVF0uAKaKowEuvLlq5pY58CUwXkKvy2B3731gaJ5KWaNq5UmO+EtAb01ARMXngQd
         kTrO6uf4Ije26jEj1f3uowhLqJX2JNQnM1tUGdnUkOzriKekP3iHE3nymETeYPHHwW5L
         TP0TUQd6PdbzUdNhewOgUwc/uBMq8/S6HUxrpzg529Y6VYHdXIMCaqPMeUj3ETNPp4sy
         tOjjmK3je5ETLsLcCzLve3rhAbLqJsfki4fAMYNz2VhLkxiHZhEtOl7L4a0r+cXvmB8P
         k/9UnfnEaaHybfDz9MIE02lyOhMDffgpXStxbPn1+ucONAHFMctuzSOa6lfTiJ+BX5tX
         CkdA==
X-Gm-Message-State: AOAM533V/Naq6NBoqnTRNTr50d5URkejMOfwMHA2C39yP74gRXBPEoN7
	NqGQewHEbKST4SO6M3jpkznkYy6Yz+iOihMCGv8GBg==
X-Google-Smtp-Source: 
 ABdhPJwflVdNt0sFRdrT7fqniG78W9RRpx+zHFqQkwbAbKepNpIQGJHNzM+ZaUPcpPze5DnJ9jGkNeDy0lg2J3a9xvg=
X-Received: by 2002:a05:600c:283:: with SMTP id
 3mr7614438wmk.157.1634830416438;
 Thu, 21 Oct 2021 08:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211019192614.153903-1-ross.burton@arm.com>
 <20211019192614.153903-2-ross.burton@arm.com>
 <YXFvkNkKhWFhFzTz@piout.net>
 <CAAnfSTtB9W0++zS4k3Sn_1Qg5EKQDm5Ct0jtcB3_9K7seddBtQ@mail.gmail.com>
 <YXGCzZIz09EXsJWV@piout.net>
In-Reply-To: <YXGCzZIz09EXsJWV@piout.net>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 21 Oct 2021 16:33:25 +0100
Message-ID: 
 <CAAnfSTtftg7FDSWwu9pZ6NoxKDV+70ZxXQq01FGiOCmw=uJQfg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] strace: handle loaded test systems
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Oct 2021 15:33:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157287

Ha, idiot me.  I didn't see that bit of the regex and the test suite
takes so long I didn't actually test it...

Other opinions on whether to we skip the test or relax the bounds?

Ross

On Thu, 21 Oct 2021 at 16:10, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 21/10/2021 15:20:04+0100, Ross Burton wrote:
> > Sigh.  I'll just remove the test entirely then.
>
> Actually, I think your regex is not correct because it also failed on
> qemux86. I believe you are missing a digit in the case it takes more
> than one second, before you had '1.[01]' then 5 digits, you changed it to
> '1.' and 5 digits, this should be 6
>
> >
> > Ross
> >
> > On Thu, 21 Oct 2021 at 14:48, Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > Hi Ross,
> > >
> > > On 19/10/2021 20:26:13+0100, Ross Burton wrote:
> > > > If the host is loaded when running the tests there is a good chance
> > > > that strace-T.test will fail, as it does a sleep(1) and checks that
> > > > the nanosleep() call lasted for 0.9-1.1 seconds.
> > > >
> > > > Relax the test so that the test passes if the call takes less than two
> > > > seconds.
> > > >
> > > > [ YOCTO #14596 ]
> > > >
> > > > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > > ---
> > > >  meta/recipes-devtools/strace/strace/ptest-sleep.patch | 7 +++++++
> > > >  meta/recipes-devtools/strace/strace_5.14.bb           | 1 +
> > > >  2 files changed, 8 insertions(+)
> > > >  create mode 100644 meta/recipes-devtools/strace/strace/ptest-sleep.patch
> > > >
> > > > diff --git a/meta/recipes-devtools/strace/strace/ptest-sleep.patch b/meta/recipes-devtools/strace/strace/ptest-sleep.patch
> > > > new file mode 100644
> > > > index 0000000000..5629dec319
> > > > --- /dev/null
> > > > +++ b/meta/recipes-devtools/strace/strace/ptest-sleep.patch
> > > > @@ -0,0 +1,7 @@
> > > > +diff --git a/tests/strace-T.expected b/tests/strace-T.expected
> > > > +index 1ea020465..f78d3e2c8 100644
> > > > +--- a/tests/strace-T.expected
> > > > ++++ b/tests/strace-T.expected
> > > > +@@ -1 +1 @@
> > > > +-nanosleep\(\{tv_sec=1, tv_nsec=0\}, NULL\) = 0 <(1\.[01]|0\.9)[[:digit:]]{5}>
> > > > ++nanosleep\(\{tv_sec=1, tv_nsec=0\}, NULL\) = 0 <(1\.|0\.9)[[:digit:]]{5}>
> > >
> > > Those two builds have the patch and reliably failed:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2425/steps/12/logs/stdio
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2428/steps/12/logs/stdio
> > >
> > > > diff --git a/meta/recipes-devtools/strace/strace_5.14.bb b/meta/recipes-devtools/strace/strace_5.14.bb
> > > > index a81bda04ba..9ae1367337 100644
> > > > --- a/meta/recipes-devtools/strace/strace_5.14.bb
> > > > +++ b/meta/recipes-devtools/strace/strace_5.14.bb
> > > > @@ -13,6 +13,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
> > > >             file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
> > > >             file://ptest-spacesave.patch \
> > > >             file://0001-strace-fix-reproducibilty-issues.patch \
> > > > +           file://ptest-sleep.patch \
> > > >             "
> > > >  SRC_URI[sha256sum] = "901bee6db5e17debad4530dd9ffb4dc9a96c4a656edbe1c3141b7cb307b11e73"
> > > >
> > > > --
> > > > 2.25.1
> > > >
> > >
> > > >
> > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#157202): https://lists.openembedded.org/g/openembedded-core/message/157202
> > > > Mute This Topic: https://lists.openembedded.org/mt/86448553/3617179
> > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > >
> > >
> > >
> > > --
> > > Alexandre Belloni, co-owner and COO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

