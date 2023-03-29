Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF60C761AF
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 18:08:16 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.3965.1680113288861772480
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 11:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fAxc2R7d;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-17ebba88c60so17101646fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 11:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680113288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L32Z7P5dORTI2j8fhE65yD7sSOb4jHeNvgMCKuCA3W0=;
        b=fAxc2R7d66GZNJY82ASFGlF5sxUp5cw7l+uFTBgbtivjnQbG9FmOuUX8XcLTFWTu/x
         hz/tLTykyKcOvmELaPjBD2dwG3ivajL0/QAJNu4ZrOoYwI9HaruIL8JIjIFIGGL2QxvY
         v2F3gCAxfozQAWKC7URSASp1tn87d8vADbefZOYM5utrINxph9r7CXCpmd30fX0Eix/g
         IDY8zwm/FVhzsKtC4y8u0QO2/cQGPd3Ef5f112nOyHIYa0K3eokXnf2Jkd68qrux5m8Y
         eTzAvJMwWUY2AJq1Y+SiZ2fKwms03lEoxMFlQTSVBuEF0iXkT8J6XTZYXJLs3iiawt6R
         fbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680113288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L32Z7P5dORTI2j8fhE65yD7sSOb4jHeNvgMCKuCA3W0=;
        b=xA3y5/SVOmdwZH4MoPMt7yNwmICzCNvY3ATKGWZJva1HzkgLYEW0rUuqckVUuhItRA
         EwHZGR3srIJoovGhJUvB6iREeSZ6CIA37M3+D2liSuzmqqRdJHHrnvIzH3KbrR25/lOR
         0Y4ojdp/LJ4ISjLVlL6LDLOYjpJa7uyqrN6l6wgskrscNPtNwukaIP85sEonqG3cgpxk
         IKSmRCcqgKQUhRga3oQM60lkd/g05Xe0m0IXyO7KU9+8YgrAE+e3BSDiZBJbzMXvhdu/
         ITEPTi0tNok3+vplSeGFTsvKe6TPvpaa7T4dVMIn6TUM8TCJTwfauWwVSl9peh/CPBMe
         zM4g==
X-Gm-Message-State: AAQBX9d9e6zEIwg1Z7gFbRqbBusQw9q3Aj/m8UB4MKMpCQMO1QrFoDDM
	l8g0m8hWlpsMBq5qW2Frpex9T9N2QeuJdVcSYNQ=
X-Google-Smtp-Source: AKy350bY9e2eVC2upU1RbA4iYtBngbJd/brDnGSZ6RG0zGM5J09aWBN1tfIq/zS+3zSHYsAF41jhh9r/NgC35/+yVjU=
X-Received: by 2002:a05:6870:1215:b0:17e:915c:84a2 with SMTP id
 21-20020a056870121500b0017e915c84a2mr6835120oan.4.1680113288015; Wed, 29 Mar
 2023 11:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230329064717.2486576-1-nikhilar2410@gmail.com> <53e7d019d34be7a785e67f67ecc5f2c0dff2ac8e.camel@linuxfoundation.org>
In-Reply-To: <53e7d019d34be7a785e67f67ecc5f2c0dff2ac8e.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Mar 2023 11:07:42 -0700
Message-ID: <CAMKF1spzspoM+U08eKET3g9k0L0ttaxnmxZEaX1HTWVtoAaDwQ@mail.gmail.com>
Subject: Re: [OE-core] [meta][dunfell][PATCH] busybox: Make high ASCII chars printable
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: nikhil <nikhilar2410@gmail.com>, openembedded-core@lists.openembedded.org, 
	sanak@kpit.com, ranjitsinh.rathod@kpit.com, Sana Kazi <Sana.Kazi@kpit.com>, 
	Sana Kazi <sanakazisk19@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 18:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179294

On Wed, Mar 29, 2023 at 12:20=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2023-03-29 at 12:17 +0530, nikhil wrote:
> > Currently busybox utilty "ls" fails to display filenames contains
> > UTF-8 characters and replaces with "?".
> >
> > Steps to reproduce:
> > bin/busybox touch utf_test-=C3=9C
> > bin/busybox ls utf_test-* > sample.log
> > bin/busybox cat sample.log
> > utf_test-??
> > bin/busybox hexdump -C sample.log | grep "c3 9c"
> >
> > Therefore, above hexdump command is unable to find matching hex value
> > for the umlaute character.
> > Hence, change the libbb's printable_string() function to allow high ASC=
II
> > characters so that unicode filenames are displayed correctly.
> > This issue is not observed in upstream busybox.
> >
> > Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> > Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
> > Signed-off-by: Nikhil R <nikhilar2410@gmail.com>
> > ---
> >  .../270-libbb_make_unicode_printable.patch    | 39 +++++++++++++++++++
> >  meta/recipes-core/busybox/busybox_1.31.1.bb   |  1 +
> >  2 files changed, 40 insertions(+)
> >  create mode 100644 meta/recipes-core/busybox/busybox/270-libbb_make_un=
icode_printable.patch
> >
> > diff --git a/meta/recipes-core/busybox/busybox/270-libbb_make_unicode_p=
rintable.patch b/meta/recipes-core/busybox/busybox/270-libbb_make_unicode_p=
rintable.patch
> > new file mode 100644
> > index 0000000000..001d2847fe
> > --- /dev/null
> > +++ b/meta/recipes-core/busybox/busybox/270-libbb_make_unicode_printabl=
e.patch
> > @@ -0,0 +1,39 @@
> > +busybox: make high ASCII chars printable (#7993)
> > +
> > +Currently busybox utils like "ls" fail to display filenames containing=
 UTF-8
> > +characters, replacing any special characters with "?".
> > +
> > +Change libbb's printable_string() function to allow high ASCII charact=
ers so
> > +that unicode filenames are displayed correctls.
> > +
> > +Signed-off-by: Jo-Philipp Wich <jow@openwrt.org>
> > +Upstream-Status: Pending [https://git.openwrt.org/?p=3Dopenwrt/svn-arc=
hive/archive.git;a=3Dpatch;h=3Dbbca780ca657d894fc457cac8eaaaec9d414bfc8]
> > +
>
> Has the patch been submitted to busybox? The upstream we refer to here
> is really busybox. The link to openwrt is helpful but we should limit
> to any submission to busybox itself for the purposes of upstream-
> status.

yeah I think its worth a discussion on busybox ml.
>
> Cheers,
>
> Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179264): https://lists.openembedded.org/g/openembedde=
d-core/message/179264
> Mute This Topic: https://lists.openembedded.org/mt/97923178/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

