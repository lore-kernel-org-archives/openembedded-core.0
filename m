Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C58C001E0
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 10:34:59 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.9576.1690886090285704374
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 03:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZWLitiOP;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2b9aa1d3029so80569731fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 03:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690886088; x=1691490888;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fm1U9mVOx6xTMVcR2zaqN1XJCQE2YxEmwCqCLX2FhgE=;
        b=ZWLitiOP+TcKiVFojcpgbFviYXcYAMvAJjqi8gUKINdTvoD2/vG1g25aKneFgyRG/o
         8rNVc1i8UKb69VG7LoznDThEwoRuSLJ0r0QGcl6zqa3GjewiK3cN/hmZbDg+AZh/IoDP
         UgDFo4uL9sPnoANa3iIOwXLQH/8rJIV0vZM6YkLW+uuEY8CU0Ayl44SP90vNuLwFi9Fr
         +4II1VjVPure4c6eIMs+YQ4H4rCXtSFg+bJaohWV+b3BFE3lyj/hdvIKBrqoA3PUBsyY
         n46D8vWXxzjsv+g4LIiSTogrTiC+XBNLk8Nf2gat80ktuJ4dv+oHAdYrTv6AcJVf8llT
         PafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690886088; x=1691490888;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fm1U9mVOx6xTMVcR2zaqN1XJCQE2YxEmwCqCLX2FhgE=;
        b=C7xKcTihOPdU7ra5IPHplPrRbydSOq4q1/lBqslxRYnnb84RJqMfWCODPs6abSF3I6
         1eGPTLtOiY45pVRWZSECPqIcZ/Z+FHpLLRFqcSISbAVw1gghZ+2gtMB7KyiIw/6lCTL2
         9xEXsFVCjq22kKYK/zHz/H0tGEN3N0ZbBqxD9WSVjAhe4rp83r6wnMfzedt6Fh9uvEed
         KxFYD4vy2Pnw0XxWZK4tn57Pz+ER0wqivJjvG/RVcQX//CT1vnz7rfM/jaHfSxC+D8jy
         up9SskByIZVB/QFKaVOz/vx4ZbUlOy/RGso/f06m1UDIetGzzw49sNY8Pm0kUyteyKGm
         gGSg==
X-Gm-Message-State: ABy/qLZqBfX/DFUfbSZQiTNh/zDj3PhHcG1NSVfSzFK4pVxpIwGSPjCE
	sxomtCQb53lEgX7YQBD4EgE6rWnzhrmeFlr3GSSzRTEf
X-Google-Smtp-Source: APBJJlHuXMO1FPcETo2TXN49cJLp7FJeTSx7L11LwQ/leKJYlC8WRoY9FzhOo4knhhC6teTPYdv8qHut/i7KAJI/2KA=
X-Received: by 2002:a2e:3304:0:b0:2b8:4079:fd9d with SMTP id
 d4-20020a2e3304000000b002b84079fd9dmr2153841ljc.29.1690886088239; Tue, 01 Aug
 2023 03:34:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230801102534.60770-1-ppjadhav456@gmail.com> <CANNYZj_UNgeQ6odbQ1Mmf5kjgQMDkLNQcnR7DDLLYw0se3Fj4A@mail.gmail.com>
In-Reply-To: <CANNYZj_UNgeQ6odbQ1Mmf5kjgQMDkLNQcnR7DDLLYw0se3Fj4A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Aug 2023 12:34:36 +0200
Message-ID: <CANNYZj_nxUHVYxiaoPOvS5NguBmMxmTpYF6ccxzN3mOvpbjgbw@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] alsa-lib: Add ptest
To: Poonam Jadhav <ppjadhav456@gmail.com>
Cc: openembedded-core@lists.openembedded.org, poonam.jadhav@kpit.com, 
	ranjitsinh.rathod@kpit.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 10:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185238

Oh, and: any new feature must be submitted for master branch first,
then backported to stable branches.

Alex

On Tue, 1 Aug 2023 at 12:33, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> What do the tests do, and why they should be run? Are they actually
> useful to run when assembling a custom distribution, and would they
> help uncover integration issues? If it's merely testing the component
> itself, and it is regularly run by upstream, there is little benefit
> to adding them to yocto qa.
>
> The tests should be built via upstream makefiles, not via a manually
> hardcoded list (which is also incomplete compared to the makefile, and
> there's no explanation for that).
>
> Alex
>
> On Tue, 1 Aug 2023 at 12:25, Poonam Jadhav <ppjadhav456@gmail.com> wrote:
> >
> > From: Poonam Jadhav <Poonam.Jadhav@kpit.com>
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
> >  .../distro/include/ptest-packagelists.inc     |  1 +
> >  .../alsa/alsa-lib/run-ptest                   | 14 ++++++++++++++
> >  .../alsa/alsa-lib_1.2.1.2.bb                  | 19 ++++++++++++++++++-
> >  3 files changed, 33 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/run-ptest
> >
> > diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> > index 3fb7ec2657..b74e18a322 100644
> > --- a/meta/conf/distro/include/ptest-packagelists.inc
> > +++ b/meta/conf/distro/include/ptest-packagelists.inc
> > @@ -5,6 +5,7 @@
> >  #
> >  PTESTS_FAST = "\
> >      acl-ptest \
> > +    alsa-lib-ptest \
> >      apr-ptest \
> >      apr-util-ptest \
> >      attr-ptest \
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
> > diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
> > index 4867c798b9..192e35ba3a 100644
> > --- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
> > +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
> > @@ -18,11 +18,12 @@ SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
> >             file://0005-ucm-Do-not-fail-to-parse-configs-on-cards-with-an-em.patch \
> >             file://0001-Fix-alsa-sound-.h-for-external-programs.patch \
> >             file://0001-uapi-Move-typedefs-from-uapi-to-sound.patch \
> > +           file://run-ptest \
> >             "
> >  SRC_URI[md5sum] = "82ddd3698469beec147e4f4a67134ea0"
> >  SRC_URI[sha256sum] = "958e260e3673f1f6ff6b2d2c0df3fc2e469bea5b2957163ce96ce17f23e87943"
> >
> > -inherit autotools pkgconfig
> > +inherit autotools pkgconfig ptest
> >
> >  EXTRA_OECONF += " \
> >      ${@bb.utils.contains('TARGET_FPU', 'soft', '--with-softfloat', '', d)} \
> > @@ -52,3 +53,19 @@ RREPLACES_alsa-conf = "alsa-conf-base"
> >  RCONFLICTS_alsa-conf = "alsa-conf-base"
> >
> >  BBCLASSEXTEND = "native nativesdk"
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
> > --
> > 2.25.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#185236): https://lists.openembedded.org/g/openembedded-core/message/185236
> > Mute This Topic: https://lists.openembedded.org/mt/100480016/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

