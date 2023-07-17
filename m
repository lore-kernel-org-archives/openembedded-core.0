Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34DD4EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 20:23:12 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.5426.1689625387823721673
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 13:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HCU48Nc3;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4fb5bcb9a28so7788224e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 13:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689625386; x=1692217386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GtBK54+4KmerVz4BrG8TVnPwyIZWvvUUS/evVd4mlE=;
        b=HCU48Nc33eem1uhEUgSvHWie0AcXH7LlRGB0zx5B1iFGbEQvPQ9KgAt8no20Uwf3iy
         FLdzgXyyHADzdLeoRvtUQlf3Pa4mTRVM4i/agAVbymY+4T89mMzaJTMxEgGGhw0uYfYe
         wGdRSSlySr+LB4YqnGlKIUNa3RRDADtM9VWS+Ni/M1di1z4vpGWQDwMGOUFiFQpAXRjZ
         /nWHdAH4veUmRCHflRI0w35TF4IKmIGM85x1ANhomUzFyfQxI2Sotz0U4EJTKOmT2Yhc
         HUc7Zjjh82dNyJ2motujIx0Vyv7Tvv20MHii2qG4jmvQP6IswHfiliAr2T+i4h06UoXa
         ym5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689625386; x=1692217386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GtBK54+4KmerVz4BrG8TVnPwyIZWvvUUS/evVd4mlE=;
        b=LaxXM/VHp3bOk3X9zFfznxy0iWHXYBWRXSMUEdpW06ZKYzF0UYO4oVWIlb2O+Y4Lq+
         ahbzhrmaqFjmrNbZ1LW3KtyuN999yfqhRdklEgZFFz9oSbXVj8fVvzA4R3aquCBp2JjJ
         PNADo/ggersgErCmNUuRspd+KQSKLFSV276ZmF0ehwAXxUmva8Xby4UYB+t1u/TX3HIG
         qm6S7SUcL1l3ccOl4cFYcnquM1n+ok8bNZ8xtSHl9WcW9b7pBVGfNaR07ZEZaR0SSOVs
         F+Wdyt5Rfaut0Cl+N1sGK4W808tklMxIbEdUEkCoPyGNl1okPILfGxYeQQPjZkhj1ee9
         X/JA==
X-Gm-Message-State: ABy/qLZ5u2AFW9jlsQDKSa0qWR3S96MjtUEPzc4G01zltfyV7Oso/bDJ
	rhuaxuxFkDapI0sQQmqa7uFErHGXCCcUXI/L+Z6yRCMe
X-Google-Smtp-Source: APBJJlHPfSoy7d7I+j1N6QOSLM0jbyZdhJJPwT4Mj/CeyfCXAikDl61xxU0x6OrxUr5t1UL5zc8ILcHQwgxBL66fQzE=
X-Received: by 2002:a05:6512:3b87:b0:4f8:6625:f2ca with SMTP id
 g7-20020a0565123b8700b004f86625f2camr9916280lfv.61.1689625385628; Mon, 17 Jul
 2023 13:23:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230630091451.3331563-1-changqing.li@windriver.com>
 <20230630091451.3331563-2-changqing.li@windriver.com> <CANNYZj-6GkQ-udC+Nd0zyQbwKtkfrr0hNKZ-AaMEUzgnTCNT1A@mail.gmail.com>
 <328B87A9-2B41-4B96-ACBE-C84E3575E1FC@arm.com> <9ef53c61-7238-f500-ba98-dab28b7fff12@windriver.com>
In-Reply-To: <9ef53c61-7238-f500-ba98-dab28b7fff12@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Jul 2023 22:22:57 +0200
Message-ID: <CANNYZj-jeX1Km0BYSS0HYDAeC+Fckmw0QA2u41iqA2PTmjuy6w@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH 2/2] rootfs-postcommands.bbclass: add
 post func remove_unused_dnf_log_lock
To: Changqing Li <changqing.li@eng.windriver.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 20:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184479

This merged to master and it should not have happened. I'm sending a revert=
.

Alex


On Tue, 11 Jul 2023 at 10:34, Changqing Li
<changqing.li@eng.windriver.com> wrote:
>
>
> On 7/4/23 19:11, Ross Burton wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > On 30 Jun 2023, at 16:07, Alexander Kanavin via lists.openembedded.org =
<alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
> >> On Fri, 30 Jun 2023 at 11:14, Changqing Li
> >> <changqing.li@eng.windriver.com> wrote:
> >>> Remove log_lock.pid which maybe created during do_rootfs. In commit
> >>> [dnf: only write the log lock to root for native dnf],
> >>> native dnf changed to write log lock to root, and target dnf still
> >>> use /var/log, so log_lock.pid need to be removed post do_rootfs.
> >> This is not making clear why the file needs to be removed. What
> >> problems occur if it is left in place? Is it supposed to be added,
> >> then removed by dnf during do_rootfs, and if this doesn't happen, is
> >> that a problem with dnf that needs to be fixed, rather than removing
> >> the file manually after the fact?
> > Absolutely.  If the dnf image creation is leaving lock files then we fi=
x the dnf image creation.  Does dnf leave a daemon hanging around? Does it =
leave lock files when it shouldn=E2=80=99t?  Either way, this should be in =
dnf or the image creation code itself, not a generic rootfs postcommand.
>
> Alex and Ross,  There is no dnf daemon hanging around,  you are right,
> seems like an dnf bug, I will report this to dnf upstream.
>
> And there is no functional problem if this file is not removed, only it
> may confuse user there is an useless file that is generated during
> do_rootfs, it should not exit in rootfs.
>
>
> //Changqing
>
> >
> > Ross
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184123): https://lists.openembedded.org/g/openembedde=
d-core/message/184123
> Mute This Topic: https://lists.openembedded.org/mt/99869451/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

