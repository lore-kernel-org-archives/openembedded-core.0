Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8781FEB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 22:06:03 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.2418.1687903553699367991
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 15:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=uJAzQ4RI;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.51, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-51d80c5c834so590677a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 15:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687903552; x=1690495552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55RhqbNp1MgZUzgywfZ5cVzis0h4bDwgVbO/ldi1k8s=;
        b=uJAzQ4RI69K2K/xn0ZJWl+nYGFPmDK3lq6C+MOuqYEuDGBPC9G0P4P2q7HnTZr2o+Z
         bKztzmzfXeYMaLQI2NJ0YsU1xxRDjw+q09vG2Nl+WZ9z+9GiYn9qDog4BKgt4YaCqTJU
         6clDWsUCMglkWd5xObqXczyMdyDReaZAENB2d33PlYAZ4mFtsfMP1EHes2n5dFylNNYi
         fK8TrwQuTOsnjmW9pFVOTnR3/+j1Lw+XyDBM1GpR5fcbdcNzGvq2eug70aIAM/EsIAqG
         cgl2YReK9HL7cvTBwfnzE59R4UKvWhCp3Q4WZKLyCRgp9aP6SdvETc/NkWOJczqPK7Zj
         ELyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687903552; x=1690495552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55RhqbNp1MgZUzgywfZ5cVzis0h4bDwgVbO/ldi1k8s=;
        b=amAW/gZdcGNAGRU+0dDR1/JIjlvD6eG/D/gjBvjhVbL5tS8mVkLbN4P1yoUuadPGAB
         xyXr3sEIB8E6Zn5k+QM0WPU4lJjRLuyA3w2vZxZiF8L9k868eQLgLf6czbDy3GxKJP+G
         rMxeMmyf1TWoS1kgZsL0iPvpDVDnjThKh41cNg/xNI2Yq3s9sx/fd1JLFJEl1rNNaraU
         S2AapjbfnvE74lc1HPfDiYU1eFK+lMaxVdtxETVDSWVIJU7tVuj3LkUOZCtbm/3nTkit
         NkcQOv24pMGNPCDBUTR799weXDZuy4qbQ5eI+3yx95AgNIASuHYWzuo64+9ERRGIMcfd
         YuUQ==
X-Gm-Message-State: AC+VfDwuTI2LFRcXMy/7MHyZJDbzO9M0SmDd5i+hM+xbk5S6lAchMLQF
	HNJHIkM5ufTp4Dme+MjAWZeeiASaSgW7nFCSzMU85A==
X-Google-Smtp-Source: ACHHUZ4/STeaH7iGhmqMRaqxvjOYHYcQs7C5l+MkLCmKC+CxXOPDToauChNrosXFnsQuGsaad5h7xf0waVcKTxyMcA4=
X-Received: by 2002:aa7:ce15:0:b0:51b:ec90:cf0f with SMTP id
 d21-20020aa7ce15000000b0051bec90cf0fmr14927615edv.6.1687903552001; Tue, 27
 Jun 2023 15:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230625135020.104159-1-marex@denx.de> <CAOSpxdYin7XBvq-r+CW1s6wan28cNnuJbsj-rHLXEx7_+NMCuw@mail.gmail.com>
 <b348e1ac-5222-6ad9-4e1f-1b2ddec3074c@denx.de>
In-Reply-To: <b348e1ac-5222-6ad9-4e1f-1b2ddec3074c@denx.de>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 27 Jun 2023 12:05:41 -1000
Message-ID: <CAOSpxdYQ_7KZL4Zg=Rh5LwtSRT8M7P8NO5oc2A+-bfw7NyhYeQ@mail.gmail.com>
Subject: Re: [kirkstone][PATCH] cpio: Replace fix wrong CRC with ASCII CRC for
 large files with upstream backport
To: Marek Vasut <marex@denx.de>
Cc: openembedded-core@lists.openembedded.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Khem Raj <raj.khem@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 22:06:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183504

On Tue, Jun 27, 2023 at 11:59=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> On 6/27/23 16:08, Steve Sakoman wrote:
> > On Sun, Jun 25, 2023 at 3:50=E2=80=AFAM Marek Vasut <marex@denx.de> wro=
te:
> >>
> >> Replace the original "Wrong CRC with ASCII CRC for large files"
> >> patch with upstream backport, and add additional fix on top of
> >> the same problem which upstream detected and fixed.
> >
> > Your replacement patches are missing Upstream-Status and Signed-off-by =
tags:
> >
> > ERROR: cpio-2.13-r0 do_patch: Missing Upstream-Status in patch
> > /home/steve/builds/poky-contrib-kirkstone/meta/recipes-extended/cpio/cp=
io-2.13/0003-Fix-calculation-of-CRC-in-copy-out-mode.patch
> > Please add according to
> > https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch=
_Header_Recommendations:_Upstream-Status
> > .
> > ERROR: cpio-2.13-r0 do_patch: Missing Upstream-Status in patch
> > /home/steve/builds/poky-contrib-kirkstone/meta/recipes-extended/cpio/cp=
io-2.13/0004-Fix-appending-to-archives-bigger-than-2G.patch
> > Please add according to
> > https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch=
_Header_Recommendations:_Upstream-Status
>
> Upstream-Status was indeed missed.
>
> What do I put into SoB line if the original patches have no SoB line
> (which btw is common in other backports in OE-core and e.g. oelint-adv
> warns about that too) ?

Probably common because only missing Upstream-Status generates an error!

The Signed-off-by should be your name/email if you are kind enough to add i=
t.

Steve

