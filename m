Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47592C4167B
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 10:42:17 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.19176.1702550532230573592
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 02:42:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jZCzS3q5;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: max.oss.09@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50bfd8d5c77so9193901e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 02:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702550530; x=1703155330; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/2HGBZsGvpMAcJwtz4JuX35ueyyrPJCjAsyee2XBio=;
        b=jZCzS3q5Zpc5Vjt61RQSKnFndqL+AD+8J8RD2FdnB0YVnniigeVp9wAGDFNaEg9edn
         Rx5O/sQyhfeciSritKooh9oXFLKPQm3ixKuropfAZeD8k0SwbxpaCduZNoxjBE+Fzq5k
         1V3H0CHUpOW9W82eWX544ViXBnWJT3IDpbZ3ukPNhtrBfJZlIqQrhmdiLqJ01rEX9sZO
         614Mt0NfxbbY2vG0USUdzVN4/s9pybW9fCyzG2tvvh5hb7g/w0SdXHOWXaEkwqhBRVzn
         3/dQTxe1Ji1p2Gw7HMCtZo2uYVFcLcbh7apoZjiJ2vY0m8HxwNfy7ihA2Ens0IsAfP0w
         RnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702550530; x=1703155330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/2HGBZsGvpMAcJwtz4JuX35ueyyrPJCjAsyee2XBio=;
        b=bAU3iAowFmL0n5qxizL9ucQHajkr7Jrfme3jbfOLhAr4WTvAiqwbckhVnfCxNcNDyu
         Po4hSrfZ129TjUQKMFnmxys+e/AOwAAiIHroHQfiaTwPvBlmfx78+07rATntlxmXpSvK
         RRP2/k/BIrWJ26o/ouNzR2aOnWAvCa4Tq0dplLDemAkhIU9Jfsao0rvYC8Y1tJ6BXaTq
         jCd3L02eyqq5Wt7ngOmNaKcn3CGucs2mW2qihVaKPQeX/hctokmSxSD+r0NMU53AWzrT
         P40XtWCFL0SEP6zEKvrPtJ1PfiqoTa5kpWIi8tN7xfKC4tnXpG+ID3gGmRKLJJzB3JZ0
         N/pA==
X-Gm-Message-State: AOJu0Yw9Hy3a6nW/oPbwc/vAHJP+JM5v5GNKlET8n2dBsh3zHUoksoCg
	DMfhMm4mixy1lbnvvy5xXi84n6oGV5YFCZCR5sWIicWH
X-Google-Smtp-Source: AGHT+IH/eHPDwzd0OCWzgY2/omgZt6TTENh0+XLksakDcLh2M5A2kemHDW/7WWvyH2lS5ka01J9ARTGrVqxCywjbdIU=
X-Received: by 2002:a05:6512:3c9f:b0:50b:dfc9:b4be with SMTP id
 h31-20020a0565123c9f00b0050bdfc9b4bemr3230275lfv.41.1702550530058; Thu, 14
 Dec 2023 02:42:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1701299008.git.steve@sakoman.com> <9a42349a176ca4d7a1bfab3425a0821dbcbd9368.1701299008.git.steve@sakoman.com>
In-Reply-To: <9a42349a176ca4d7a1bfab3425a0821dbcbd9368.1701299008.git.steve@sakoman.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Thu, 14 Dec 2023 11:41:59 +0100
Message-ID: <CAEHkU3V=tK-rqKEWkTrk441uDkRM5quNLO2ck824ExY-di5UUQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 7/8] kernel-fitImage: Strip path component
 from dtb
To: Steve Sakoman <steve@sakoman.com>, Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 10:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192350

On Thu, Nov 30, 2023 at 12:05=E2=80=AFAM Steve Sakoman <steve@sakoman.com> =
wrote:
>
> From: Ninad Palsule <ninad@linux.ibm.com>
>
> Machines that have added subdirectires to the KERNEL_DEVICETREE
> recently, such as arm32 boards that were moved under subdirectories in
> Linux 6.5, will have that subdirectory in the node name of the FIT. This
> breaks existing systems that select a configuration in u-boot by it's
> name.
>
> Strip off the directory component from the device tree to preserve
> compatibility.

This now breaks each arm64 machine (and likely mips & riscv) as they did
have the vendor subdirectories since (nearly) ever and expect those in the
fitimage.

Breaking those existing machines / kernel combination in order to have a
smooth transition for arm32 machines which bring a 6.5 kernel to kirkstone
seems wrong to me.

I think we should revert the backport to kirkstone. If someone builds a 6.5
or later kernel in kirkstone for an arm32 based machine one could cope
with the change e.g. in the kernel recipe which provides that 6.5 kernel.

Any comments? Thanks.

Sorry that I didn't notice the change on the mailing list before it got app=
lied.

Regards
Max

>
> (From OE-Core rev: 941ba1a132bafa9c9be855fb91fec96d8b06299f)
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de> # backport =
to kirkstone
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-f=
itimage.bbclass
> index 27e17db951..194d825b0e 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -542,6 +542,11 @@ fitimage_assemble() {
>                                 DTB_PATH=3D"arch/${ARCH}/boot/$DTB"
>                         fi
>
> +                       # Strip off the path component from the filename
> +                       if "${@'false' if oe.types.boolean(d.getVar('KERN=
EL_DTBVENDORED')) else 'true'}"; then
> +                               DTB=3D`basename $DTB`
> +                       fi
> +
>                         DTB=3D$(echo "$DTB" | tr '/' '_')
>
>                         # Skip DTB if we've picked it up previously
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191471): https://lists.openembedded.org/g/openembedde=
d-core/message/191471
> Mute This Topic: https://lists.openembedded.org/mt/102883133/3617484
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
x.oss.09@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

