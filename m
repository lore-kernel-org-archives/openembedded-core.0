Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54722C001DF
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 17:34:04 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.19461.1690911236026418394
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 10:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RjlwWap3;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2b703a0453fso90539831fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 10:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690911234; x=1691516034;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tH5qa9hKh5xXXtwLzuiGWNv8BaTexdrs+TQkiCShlkE=;
        b=RjlwWap3UTS/FHZDuL1X37PuAl4FpnXnvJTe/Xav3bqgw35JclzCFVDK98BUoFMJtZ
         FhvSqjnjU2w3pCn/dukihHE5oL9CbpWSuFEIYZEVx+wNO1YmAAWJ03J9OOp3UGcikQPV
         29HuVrxRV5GGtFLUv4K7tK4yI/gVEnxAEwc2WtSFcaQM7ufJsUk5PLhwNSVcPJoQvHUT
         jaU/FDBaL/H+Rc16hqJlrPdkbaxTjD+MUBQoc8oB4CVlMnB7yoJmADgZrs83PqdtggXj
         O+u6cvTL4NheIYoMb7OmHg0Fsz8HDpSh86Ok+JVbjohjq69V1QFJqHYl7yCmSX5NEUAo
         qs3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690911234; x=1691516034;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tH5qa9hKh5xXXtwLzuiGWNv8BaTexdrs+TQkiCShlkE=;
        b=J4YebHoeDbppp+DZM1r7syu1mlcuvQQG7ROZa6DbKIzOVGj15lC0pOWNKuLxdFBYXe
         AikjuX2ynWrVbRDMBa9lGwI8W0hA9QK87Z7NUjfiZ/RQ+xUEYzdD1XYV3xEM76BQYWAd
         tLXXoqt4rhXgBVZcli+lHRi0UEYwJhwDAYKtYYqEm4CFV4xqDiOm2uJCsamwDDudVT/1
         6Sf3HGimUjLyiQ0oI8rFqMKxYroay32GSY+/DhhEImUyLyCGhycl9lk2zdnWLGxuRjMU
         lvf6FW2dPdEUfOEDYekTog83M5rXy+PTIpurMr0NsexrGntosNwBCiZlP7hz63N0Bw5p
         HQBA==
X-Gm-Message-State: ABy/qLZnCIVPwUIIhu9R3VPk6k9lI0OEC/lU7awxNu5A5j4gPNVZ8ttO
	RLQYZKwhPZTgdbspH6g+nZeN0kNkcgbcsb9s8cw=
X-Google-Smtp-Source: APBJJlEo0nExDUSS5+ri94fFiTfgX/AuJ/v+q6/Oqm2etA8WYVQ3bg/cyyt9EhWr4FhVZaFpRx3LqX1HEvaI9zdbMYc=
X-Received: by 2002:a2e:3817:0:b0:2b9:a28d:6495 with SMTP id
 f23-20020a2e3817000000b002b9a28d6495mr3441090lja.9.1690911234111; Tue, 01 Aug
 2023 10:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230801133833.96667-1-ppjadhav456@gmail.com> <b4ccc207-16f9-9c70-95f8-9368effa8603@gmail.com>
In-Reply-To: <b4ccc207-16f9-9c70-95f8-9368effa8603@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Aug 2023 19:33:42 +0200
Message-ID: <CANNYZj8f7B4DHEjmidUvPhx43CU0aaU3qJQ29m7G6AgYKC1UzQ@mail.gmail.com>
Subject: Re: [OE-core][master][PATCH] alsa-lib: Add ptest
To: Khem Raj <raj.khem@gmail.com>
Cc: Poonam Jadhav <ppjadhav456@gmail.com>, openembedded-core@lists.openembedded.org, 
	poonam.jadhav@kpit.com, ranjitsinh.rathod@kpit.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 17:34:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185360

The actual list is defined in the makefile:

https://github.com/alsa-project/alsa-lib/blob/master/test/Makefile.am

I had asked why the patch builds and runs only a hardcoded subset, but
got no response. Also the need for doing this as a ptest should be
justified to begin with.

Alex

On Tue, 1 Aug 2023 at 18:50, Khem Raj <raj.khem@gmail.com> wrote:
>
> On 8/1/23 6:38 AM, Poonam Jadhav wrote:
> > From: Poonam Jadhav <poonam.jadhav@kpit.com>
> >
> > Alsa-lib is a user space library that provides audio
> > and MIDI functionality apis for simplifying application
> > programming and provide higher level functionality
> >
> > ptest executes below binaries on target:
> > 1.config
> > 2.control
> > 3.client_event_filter
> > 4.midi_event
> > 5.namehint
> >
> > Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
> > ---
> >   .../distro/include/ptest-packagelists.inc     |  1 +
> >   .../alsa/alsa-lib/run-ptest                   | 14 ++++++++++++
> >   .../recipes-multimedia/alsa/alsa-lib_1.2.9.bb | 22 +++++++++++++++++--
> >   3 files changed, 35 insertions(+), 2 deletions(-)
> >   create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/run-ptest
> >
> > diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> > index 6250cf081e..99f09132ae 100644
> > --- a/meta/conf/distro/include/ptest-packagelists.inc
> > +++ b/meta/conf/distro/include/ptest-packagelists.inc
> > @@ -5,6 +5,7 @@
> >   #
> >   PTESTS_FAST = "\
> >       acl \
> > +    alsa-lib \
> >       apr-util \
> >       attr \
> >       babeltrace \
> > diff --git a/meta/recipes-multimedia/alsa/alsa-lib/run-ptest b/meta/recipes-multimedia/alsa/alsa-lib/run-ptest
> > new file mode 100644
> > index 0000000000..8fbf9f140a
> > --- /dev/null
> > +++ b/meta/recipes-multimedia/alsa/alsa-lib/run-ptest
> > @@ -0,0 +1,14 @@
> > +#!/bin/sh
> > +set -eux
> > +
> > +for t in config control midi_event client_event_filter client_event_filter
>
> It will be good to derive this list from the sources so it remains in
> sync with future additions/deletions.
>
> > +do
> > +    if "./$t" > "alsa-lib_$t.log" 2>&1
> > +    then
> > +        echo "PASS: $t"
> > +    else
> > +        echo "FAIL: $t"
> > +        cat "alsa-lib_$t.log"
> > +    fi
> > +    rm "alsa-lib_$t.log"
> > +done
> > diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb
> > index d482e27683..8dcd7c4448 100644
> > --- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb
> > +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb
> > @@ -9,10 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
> >                       file://src/socket.c;md5=285675b45e83f571c6a957fe4ab79c93;beginline=9;endline=24 \
> >                       "
> >
> > -SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
> > +SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
> > +           file://run-ptest \
> > +          "
> >   SRC_URI[sha256sum] = "dc9c643fdc4ccfd0572cc685858dd41e08afb583f30460b317e4188275f615b2"
> >
> > -inherit autotools pkgconfig
> > +inherit autotools pkgconfig ptest
> >
> >   EXTRA_OECONF += " \
> >       ${@bb.utils.contains('TARGET_FPU', 'soft', '--with-softfloat', '', d)} \
> > @@ -42,3 +44,19 @@ RREPLACES:alsa-conf = "alsa-conf-base"
> >   RCONFLICTS:alsa-conf = "alsa-conf-base"
> >
> >   BBCLASSEXTEND = "native nativesdk"
> > +
> > +do_compile:append() {
> > +    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/lsb/config.c" -I "${S}/include" -L "${B}/src/.libs/" -lasound -o config
> > +    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/control.c" -I "${S}/include" -L "${B}/src/.libs/" -lasound -o control
> > +    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/client_event"_filter.c -I "${S}/include" -L "${B}/src/.libs/" -lasound -o client_event_filter
> > +    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/namehint.c" -I "${S}/include" -L "${B}/src/.libs/" -lasound -o namehint
> > +    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/lsb/midi_event.c" -I "${S}/include" -L "${B}/src/.libs/" -lasound -o midi_event
> > +}
> > +
> > +do_install_ptest:append() {
> > +    install -m 0755 "${B}/config" "${D}${PTEST_PATH}"
> > +    install -m 0755 "${B}/control" "${D}${PTEST_PATH}"
> > +    install -m 0755 "${B}/client_event_filter" "${D}${PTEST_PATH}"
> > +    install -m 0755 "${B}/midi_event" "${D}${PTEST_PATH}"
> > +    install -m 0755 "${B}/namehint" "${D}${PTEST_PATH}"
> > +}
> >
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185359): https://lists.openembedded.org/g/openembedded-core/message/185359
> Mute This Topic: https://lists.openembedded.org/mt/100483753/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

