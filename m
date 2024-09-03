Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E8EACD3430
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 13:19:30 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.23154.1725369564746946935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 06:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZcmviSOS;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.172, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e1a989bd17aso2891395276.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 06:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725369564; x=1725974364; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Tw6cnH/B2jW6f/SHFh2D4wmLfjQj0N0G0n8mvD3NVo=;
        b=ZcmviSOS41WEKZa/BnsvPjeYQJcem2hPXWEpI8AHb29s/Fbj2X+Xw6tu6LxhNRoNtw
         UsTx2psL1bEqzY6ZgGy1E4VXfMPpapU4rjGMU0eaPWxRWYRWsoESq6PK9YTCOVT09Xfz
         q9Ayf4eOVW2wf/x721K9+TM3uy76JrK34+EObGNdHEQFWxECndfKRJtbP/FrXw61D8sC
         cYydD0Tcqpyi4p/t/JPDNent6bcKR6FgDiulYsp6l1WamRLudNF9Fdg80oTLnf4j9vuJ
         fOeJzvY4ROfkJFe93Yhdse8GN80MEEf7S/tpEg2pd6I0rAHTd+fM1MMHYS5ACVLtWm7I
         CzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725369564; x=1725974364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Tw6cnH/B2jW6f/SHFh2D4wmLfjQj0N0G0n8mvD3NVo=;
        b=MAzc3XdQlILFN10JI43Rgg8NjgfQFEYqUF8lhRjDm9l/VY2mo+EO7lrIHUPxI+pvP1
         sjH9colUNJAkOfuPXB/fwru1eVL2TW+zl0qbxYYFJ6Lbe9SqUEEXQkrFRXm0/S6G2JuW
         dXXjZQAjFsCSmWyPLEvvyI8wLDn4/NKGieiYbnP1HGCK0xDLhD6CyXJjJWMitAvO5oTT
         kvGZUb2mEmYcvCEz3Mfc2djOqL9ClePxyA4cNbjzFdAExslYVW0OCMGunLm/j/Y9/jFc
         Cih4DkjK3oz7C0ASHY0MJjFhKOJQzREpI3gt1w2oAaDd2WbV+2pbADFt+uXr0kyY1yem
         9k4w==
X-Gm-Message-State: AOJu0Yy+emWDCnn+C6enI0OpHUGM98Sj2DrZEtjX7RaFKi8ONHtCL60u
	pT9q2+vjoSZHdf0ByIgG7NI8R6HQ9T8RkfHO2uRXjRrGrmU3rQZCV75nJRbuBqpnNU6Mb2XYsMe
	d2ZRxZ13YZ+i/gcSLyJicCDzYhEBadHyFScjy5A==
X-Google-Smtp-Source: AGHT+IEJNiZrWNcb8/V/4xKeI83cx/pqJT9J8W40kvqkqFKEKsw9xP13ZI/0bIoezzcSVZRISSNvf/sm7xvJmr1abhw=
X-Received: by 2002:a25:310b:0:b0:e1a:7dc5:515b with SMTP id
 3f1490d57ef6-e1a7dc5528fmr13378299276.26.1725369563858; Tue, 03 Sep 2024
 06:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240902103148.3762538-1-pedro.silva.ferreira@criticaltechworks.com>
In-Reply-To: <20240902103148.3762538-1-pedro.silva.ferreira@criticaltechworks.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 3 Sep 2024 06:19:12 -0700
Message-ID: <CAOSpxdaYYyG=GLT1NR=SvOTpr5e=V3Zhr4O_0xLQD=RVSap1Vw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH 1/4] buildhistory: Fix intermittent
 package file list creation
To: pedro.silva.ferreira@criticaltechworks.com
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 13:19:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204162

This patch doesn't apply:

Applying: buildhistory: Fix intermittent package file list creation
Using index info to reconstruct a base tree...
error: patch failed: meta/classes/buildhistory.bbclass:599
error: meta/classes/buildhistory.bbclass: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
Patch failed at 0001 buildhistory: Fix intermittent package file list creat=
ion

Steve

On Mon, Sep 2, 2024 at 3:32=E2=80=AFAM Pedro Ferreira via
lists.openembedded.org
<pedro.silva.ferreira=3Dcriticaltechworks.com@lists.openembedded.org>
wrote:
>
> The directory that buildhistory_list_pkg_files writes to during do_packag=
e
> is created by do_packagedata so a clean buildhistory doesn't have
> files-in-package written during the first build since packagedata happens
> after do_package.
>
> Ensure the output package folder is created to avoid missing
> files-in-package.txt files.
>
> Also it ensures that in case of `find` fails we leave with
> a hard error instead of hiding the error on the for loop.
>
> Signed-off-by: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechwor=
ks.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/buildhistory.bbclass | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistor=
y.bbclass
> index fd53e92402..d219519f86 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -599,15 +599,12 @@ buildhistory_list_files_no_owners() {
>
>  buildhistory_list_pkg_files() {
>         # Create individual files-in-package for each recipe's package
> -       for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type d); do
> +       pkgdirlist=3D$(find ${PKGDEST}/* -maxdepth 0 -type d)
> +       for pkgdir in $pkgdirlist; do
>                 pkgname=3D$(basename $pkgdir)
>                 outfolder=3D"${BUILDHISTORY_DIR_PACKAGE}/$pkgname"
>                 outfile=3D"$outfolder/files-in-package.txt"
> -               # Make sure the output folder exists so we can create the=
 file
> -               if [ ! -d $outfolder ] ; then
> -                       bbdebug 2 "Folder $outfolder does not exist, file=
 $outfile not created"
> -                       continue
> -               fi
> +               mkdir -p $outfolder
>                 buildhistory_list_files $pkgdir $outfile fakeroot
>         done
>  }
> --
> 2.34.1
>
> The information in this communication may contain confidential or legally=
 privileged information. It is intended solely for the use of the individua=
l or entity it addresses and others authorized to receive it. If you are no=
t an intended recipient, you are hereby notified that any disclosure, copyi=
ng, distribution or action in reliance on the contents of this information =
is strictly prohibited and may be unlawful. If you have received this commu=
nication by error, please notify us immediately by responding to this e-mai=
l and then delete it from your system. Critical TechWorks is not liable for=
 the proper and complete transmission of the information in this communicat=
ion nor for any delay in its receipt
>
> This e-mail is environmentally friendly, just like Critical TechWorks, wh=
ich lives in a paper-free atmosphere. Therefore, please consider the enviro=
nment before printing it!
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204080): https://lists.openembedded.org/g/openembedde=
d-core/message/204080
> Mute This Topic: https://lists.openembedded.org/mt/108224347/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

