Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8D6EB64DD
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 16:40:49 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.63154.1688488841276563762
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 09:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=U28u4kUk;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.45, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-992e22c09edso393326666b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 09:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688488839; x=1691080839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5aI6Qmo2J7zytQN8zf44X8SnXZ8dCiEiRAPFgiZHzKU=;
        b=U28u4kUkk+hM6jW3mgvH5dOOIuTXkSSFicUedWazDGS3Br6E8XLNIFOQFXwx3eD47x
         2qUibElOCDwNP/CkQgRSTSnfi3EKCq4484CUb36py644w0ksN82USpyrwcoazRJxKfcx
         4lxOfJih+I1b34b7gU7phFcAnazVMkISakSyl1oVcdDPqbN0XfSe/kpTsAL64L19kOx6
         9oRMdeiBQiSyFHXpxiGNaOPndyo7df//KMCokQG9/VJsEVwMRekdZ/gmX5cwDOyfj8jv
         4t9R8tMzyO1NnaW3OVFxuHC+qXhqZJYDvQLGzs2VHwim5iJXKZYjdvsgYTcPh7vYtQM/
         ceRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688488839; x=1691080839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5aI6Qmo2J7zytQN8zf44X8SnXZ8dCiEiRAPFgiZHzKU=;
        b=gO3QAC/dEmo8CkvD6WYbyAdUAHkHKfXsQ3FgxXYa4/E4EiB7gmG3r3E/v3WkzKjG+Z
         3AYaeCg1oIF9MOaWZnE2wVcCfeIqxfjtnhr5M1Rhr9KVX4/jyWAt91qvYqGe8UeH0oM4
         AqzEPgQMRTdJhXO3CXnXSdN/mRc30L2nvytKbRsM+rNJ5XJ8ujmjd6mr8su4TeVHiw3M
         eywQVpRHsoL8aG/xqWP86ASTjuq58RDOUzY+1yNoAugkJJeXCXDFJ4eHhsEJtrdDiedB
         gUyGTWrgZosYaRx5iDHoKPPTORVOtWa4e9zeILrTKeihkwSv0jbJ9zjsqWAsizpbt9qW
         p3Ag==
X-Gm-Message-State: ABy/qLY3vW0x6H188UmYIgtZ/3vPETM/+5VLY3Eh94G3KPUuSvN7sPpH
	FY5fOI/B+r20Rmr7ISI/PBAbBpFRGs7A8jZkFSlghg==
X-Google-Smtp-Source: ACHHUZ5TLO3nmcWSL+DNTGCaPNwmgs/OG4ydP5evZ3HcJwzEiRxkU3B5R4/n1TXlAU21sMJkTsh0JOVS3A5PJu6WHMg=
X-Received: by 2002:a17:906:14db:b0:992:7329:fe4f with SMTP id
 y27-20020a17090614db00b009927329fe4fmr10227191ejc.73.1688488839473; Tue, 04
 Jul 2023 09:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAHUKmYaD2u05xyrNoGd+8eFFHbFo1wXHN1COxj+TDSmNAkHSXA@mail.gmail.com>
 <SJ0PR11MB67179B21B31BE9532F28FC87DC28A@SJ0PR11MB6717.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB67179B21B31BE9532F28FC87DC28A@SJ0PR11MB6717.namprd11.prod.outlook.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 4 Jul 2023 06:40:28 -1000
Message-ID: <CAOSpxdbzEZ-o+3LpktayGm+L4CjTBUAEdYFH5RwiL76BQT3p5g@mail.gmail.com>
Subject: Re: [OE-core] Backport of libxcrypt fix to kirkstone branch
To: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco)" <schitrod@cisco.com>
Cc: "ecordonnier@snap.com" <ecordonnier@snap.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 16:40:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183868

Got it, thanks.

Steve

On Sat, Jul 1, 2023 at 6:22=E2=80=AFPM Sanjaykumar kantibhai Chitroda -X
(schitrod - E-INFO CHIPS INC at Cisco) <schitrod@cisco.com> wrote:
>
> Hi Steve,
>
>
>
> I have cherry-picked same commit on Kirkstone branch.
>
> [kirkstone] libxcrypt: fix hard-coded ".so" extension - Patchwork (yoctop=
roject.org)
>
>
>
> Please review and provide your comment.
>
>
>
> Thanks,
>
> Sanjay
>
>
>
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Etienne Cordonnier via lists.openembedded.org
> Sent: Friday, June 30, 2023 2:20 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Steve Sakoman <steve@sakoman.com>
> Subject: [OE-core] Backport of libxcrypt fix to kirkstone branch
>
>
>
> Hello,
> can you please cherry-pick / backport following commit to the kirkstone b=
ranch:
> "libxcrypt: fix hard-coded ".so" extension" ( 2639746ba7f8a651fffaa9819ef=
9d9df776108e3 in poky and 7ed6bfa2428b4f1ba7f09d6e9e67c462ff355153 in opene=
mbedded-core). It is needed to be able to build meta-darwin's kirkstone bra=
nch with the latest kirkstone branch of meta-clang.
>
> Thanks!
>

