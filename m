Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5813DEB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 20:30:36 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.2792.1686774634683307635
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 13:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=hjQO62HZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-51a20c744ebso271254a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 13:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686774633; x=1689366633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zah+E0HQ3BdygBvmrkFGGk4vOMDqwHYTwAVnub362ns=;
        b=hjQO62HZsnOMR+FCvPz+NPV2G8/fNnaTzSEWAorvuFktrnbYSdYFWUM3+fMWpqkOYT
         Hzbu1SZbmCkrd8a1HuJoHIzQScO4rzE7Q05gv9M3nVAUFcAc7BGqiZMul1p2yvkulfok
         PPNNrJz2aqy+yUFbNAVHJK8LfDP6Oo2/nIzRbaBu6WRtmP2dk7B/2orTpbZfjVMcl+ZQ
         H1gL+9EB+7i5evvO8rTEIw5RZu3K1YUT2ik2sIVfvv87kaVpZ/2JFScW7dxiaomouk0G
         ibGxUoi557zn0YZiV8X/dvaFmFx7Ona+Bi3Ju0La62LvFacT9lnsTDLWifdCsD/Is7fM
         iJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686774633; x=1689366633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zah+E0HQ3BdygBvmrkFGGk4vOMDqwHYTwAVnub362ns=;
        b=SxiF4xYUd6O0hNRyhIYa+L+0tjxJUduzeuQPkJ4B19mya/CjGF4cHqeP/ZaObxASNN
         nc3K70En5uWdlykhwQpMVlQ4rILCQo3DgqITElomcjZOrNAOkf2GdrORab7z+fwG/Rpx
         L7V/boYtj89s0zQRsfNsz6T3yFCg6D/chEQ+HeYqvBlGTHf2x/e1cKjdxnZgn9tj42Bw
         /y2Y5uu04DWGh58odrnDXQXExGLeokbr9LDK/G5Z4gowlxSwQdYzE4mNcqKWxQLcBWi5
         lOSsloJ5fvYNe6nK9icShQtd95bVwDjm5zVN4SRxJzo49NDXOT6t2OMbTOOpQBOQs5Ka
         2sUg==
X-Gm-Message-State: AC+VfDx14/1eayDr4YE7UoMpM1MnJ955nE4snk6QTKyA4sq/KPxSf5WI
	yVp2DSQNKX2f1yiF4znp1bR11q/+5kf/kSpPvkM=
X-Google-Smtp-Source: ACHHUZ4gb7r3DtrYxEhAlf5R+mls1/oSiUQbhBv53hfS02686rA2zVZI1yRFYujwsnCMlHIxtxrA/j/oP24obuaZr/4=
X-Received: by 2002:aa7:cf88:0:b0:514:8d9a:386 with SMTP id
 z8-20020aa7cf88000000b005148d9a0386mr9794634edx.30.1686774632731; Wed, 14 Jun
 2023 13:30:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230613205212.7548-1-sudip.mukherjee@codethink.co.uk>
 <71B74F88-1911-4F00-BD3D-0B4628D9ED99@arm.com> <CADVatmN=x=5VAUZUU1if+SrX19dg7h-pBiD-B7u1PrX7wHOnBg@mail.gmail.com>
 <ADAC057F-4754-4451-B00A-FB1090212A72@arm.com>
In-Reply-To: <ADAC057F-4754-4451-B00A-FB1090212A72@arm.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Wed, 14 Jun 2023 21:29:56 +0100
Message-ID: <CADVatmP44NPGaUnZRLKu9Z1AmFQ1vtPwv7eKwHFsV7yC1ywcFg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] libssh2: Upgrade to v1.11.0
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 20:30:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182826

On Wed, 14 Jun 2023 at 16:47, Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 14 Jun 2023, at 16:13, Sudip Mukherjee <sudipm.mukherjee@gmail.com> wr=
ote:
> >
> > Hi Ross,
> >
> > On Wed, 14 Jun 2023 at 14:53, Ross Burton <ross.burton@arm.com> wrote:
> >>
> >> On 13 Jun 2023, at 21:52, Sudip Mukherjee via lists.openembedded.org <=
sudipm.mukherjee=3Dgmail.com@lists.openembedded.org> wrote:
> >>> # only one of openssl and gcrypt could be set

<snip>

> >>> mkdir -p ${D}${PTEST_PATH}/docs
> >>> cp -r ${S}/docs/* ${D}${PTEST_PATH}/docs/
> >>> }
> >>
> >> As you=E2=80=99ve clearly been looking at the tests, why does the ptes=
t support need the documentation?
> >
> > There is a test for manpage syntax "mansyntax.sh" which needs the
> > generated man pages in the docs folder.
> > compile_ptest_base will not fail, but actual tests will fail.
>
> This is where I start to say that we should be trimming the tests and onl=
y running useful tests for integration purposes, not the complete upstream =
test suite.

Sure, and as confirmed over irc I will send a followup patch removing that =
test.

--=20
Regards
Sudip

