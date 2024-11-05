Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E182D2B92E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 13:54:09 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.18367.1730814842912866874
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 05:54:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=d+2EJ91g;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.180, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e292926104bso4696494276.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 05:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730814842; x=1731419642; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aa4SB3E5vHVtizhvZJaaX1sYtkw9XEW5SYezFTe2/w=;
        b=d+2EJ91gsa67yapaKqePGb1C5MA1KmlYunxP6H4nnVOQS3Kbu6kBB/RNzv3A1Lam1N
         9LbP0voxCrISgAGkOG59NJjCSopXoMckzW1fUurJoMb85cwkUL14GYVOvp/NWP83In3h
         MySoNLOKF9Pa/oDerkCwtRQvWqHHsH8QEqJV8wKb2og2WEl6YO8z2LoaKgqHlsFMWnxo
         AmqYnzFuGtvUecwY+m4kC/ARzj4fnKG7PgG6u1v+ugV/lSbJz163NMXpvWgOWA17fN0e
         S+CxuViCwW39tjGJZTbQT7Ool4TI8yrJX0tY6cgcV2/lrv/By0fR8gFpdg7FpurXIHXm
         lHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730814842; x=1731419642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0aa4SB3E5vHVtizhvZJaaX1sYtkw9XEW5SYezFTe2/w=;
        b=XF3kzKMyS/78n3PQrne87Mxv21WMbI04NqhqHQWCtC/lJ+790yjyBjyuaxqya9ZFig
         y62zpsfAMvwYUbp7g3AajDoXCNdUrKvYayiCfEC4xToCzwyiwXe6gWVguUz0AS46q9CJ
         iXDIONFeAzWCRpOJ1ROBkt3xfBn6pCeqgDwyR3/IfmPrrdF13Q9Z2t0Xz18lVNxH9kXs
         DfpFE++tmGyLUV27BvKXytrJRn3YSrXWBqaNxkfmIQKPQe6AdnSaLMN3XWm9bNOyc4zu
         brfghd1KXiTgGcFnDifmuCPtofFMaKj5emFvE651yOC1g50BrWgfWnKi7t4oN+pExImD
         Gwiw==
X-Gm-Message-State: AOJu0Yxki1ckC3JzaWSJv1MILfq0rFJtFZIS+eO/jsyEB+ZDXcKUDWMl
	XoqvngqJAz99MLS8nkK1mtr8tQMWUOtzRa8eyOwZ6o4LyNixgWZXY3dX5rBQ3kpkgTyi5bQ65jW
	Tg9L4zaxIVksANbvKscd+WYNPE4yxoPrCGugViHzVs3MCrchQ
X-Google-Smtp-Source: AGHT+IGY7QAFJ7GRBMHC0DudJ3YDmvB18zQZKjOoppxPGg/JFOyjyk7q9PHyROpFp+wlwkroBT8SjHNLNpxloyzwiOA=
X-Received: by 2002:a05:6902:188b:b0:e30:dbda:de2f with SMTP id
 3f1490d57ef6-e30dbdadf77mr19717264276.39.1730814842051; Tue, 05 Nov 2024
 05:54:02 -0800 (PST)
MIME-Version: 1.0
References: <20241104145922.1039681-1-martin.jansa@gmail.com>
 <Zynq3g7_0jJQGt5f@bootlin-mathieu> <CA+chaQd4=6E-yG0CkTatF=ks__g=cBMqabPqQbHcgYWgkMZMiA@mail.gmail.com>
In-Reply-To: <CA+chaQd4=6E-yG0CkTatF=ks__g=cBMqabPqQbHcgYWgkMZMiA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 5 Nov 2024 05:53:51 -0800
Message-ID: <CAOSpxdY9SK+9XO8BH4XSaC0U+OMe+ZBzme8C2W14=WLqy5DTZg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] xmlto: backport a patch to fix build with
 gcc-14 on host
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 13:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206713

On Tue, Nov 5, 2024 at 3:39=E2=80=AFAM Martin Jansa <martin.jansa@gmail.com=
> wrote:
>
> Yes, sorry, forgot to add kirkstone tag in v3.
>
> Steve: should I resend or did you notice this one?

I noticed it now :-)

No need to resend.

Steve

>
> On Tue, Nov 5, 2024 at 10:52=E2=80=AFAM Mathieu Dubois-Briand
> <mathieu.dubois-briand@bootlin.com> wrote:
> >
> > On Mon, Nov 04, 2024 at 03:59:21PM +0100, Martin Jansa wrote:
> > > * need to add dependency on flex-native because now when the
> > >   .l file is modified by the .patch file it will try to regenerate
> > >   the c code and fail:
> > >
> > > | make[1]: Entering directory 'work/x86_64-linux/xmlto-native/0.0.28-=
r0/build'
> > > | /bin/bash ../xmlto-0.0.28/ylwrap ../xmlto-0.0.28/xmlif/xmlif.l .c x=
mlif/xmlif.c -- /bin/bash 'work/x86_64-linux/xmlto-native/0.0.28-r0/xmlto-0=
.0.28/missing' flex
> > > | work/x86_64-linux/xmlto-native/0.0.28-r0/xmlto-0.0.28/missing: line=
 81: flex: command not found
> > > | WARNING: 'flex' is missing on your system.
> > > |          You should only need it if you modified a '.l' file.
> > > |          You may want to install the Fast Lexical Analyzer package:
> > > |          <https://github.com/westes/flex>
> > >
> > > * backport
> > >   https://pagure.io/xmlto/c/32376c053733c6c0ebaca3c25c0725509342fdf3?=
branch=3Dmaster
> > >   as well, so that patched xmlif/xmlif.c is newer than xmlif/xmlif.l =
and the build
> > >   won't try to regenerate it with flex as that leads to random build =
failures reported
> > >   in:
> > >   https://lists.openembedded.org/g/openembedded-core/message/206412
> > >   https://errors.yoctoproject.org/Errors/Details/810853/
> > >   https://lists.openembedded.org/g/openembedded-core/message/206496
> > >   https://valkyrie.yoctoproject.org/#/builders/29/builds/355
> > >
> > > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > > ---
> > > v3: add touch ${S}/xmlif/xmlif.c
> > >     to make sure xmlif.c is newer than xmlif.l after do_patch (order =
of
> > >     .patch files in SRC_URI isn't enough) to prevent regenerating it
> > >     with flex-native which isn't in DEPENDS
> > >
> >
> > Hi Martin,
> >
> > This is still for Kirkstone branch, right ?
> >
> > --
> > Mathieu Dubois-Briand, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

