Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1780ACD343E
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 15:12:11 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.25891.1725376325002135795
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 08:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fCYzY6w2;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.171, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6d5893cd721so28534457b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725376324; x=1725981124; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7al+BqqUU+vtgm6aKpxEuO6l0PasuvLXJMExiScUrU=;
        b=fCYzY6w2RS0+cYx4smqsDmXIIzCkg6L93EVCkYTz7lLgj+uuSRMU59NKcD/ZlTqzgc
         0g5bDMq3Da2h1qKXExQFCZpmEiBzbriCNIBjvdXtRIgXoskg4fD+cYaJ/hI8ouLodker
         OBPqWVlKu5CiPss6119cS6wSWI+xN5eb2q3kGZB/LxPUuYxOSb+RMRZ0iQHkDZ1waFt2
         5nel5AiKYaywOgF9+sVAOw1NkzQ8OOjexAdV5JkDcaN8RTFV3AzezxnFyDDgwEGoKD3g
         qOcTeQ7qnO50OaGMtHx382YZ2AYg15sccxSHutMowVZqMQ2K3u3vr3pNparu+oSxzgyp
         NA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725376324; x=1725981124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7al+BqqUU+vtgm6aKpxEuO6l0PasuvLXJMExiScUrU=;
        b=CnIKKZeuG8nAoMbIGjET00cCmcGqIWMW0Vu2LD9glP9lj+xF56q0pNvgmFRsQUXyTm
         H+lwU3ts/SBCRByqi0t6clGCl93fAEcvrVbKTgMzeVdD6cmkYhF6egmYJZUePMZLpSR6
         Q3MTgworN9RUNRq0abvlpHYbhN+osw1hG1ygzsuFBS9k5WL/3nVCFhZNsnHTSIS6a/Qz
         FDENYVmaJCywBWA872qA/jxs2J8FBfxMN7niQMx2eCNUEPDHY/SFjt29mx2tCrGCNSLJ
         YRCauFi/W+JyFcaZwRI2FjSqLFBNOwkJ3OUPjH9OkZnN9wauYINBLYA+35kGe5kQfJlA
         Rg9w==
X-Gm-Message-State: AOJu0YwaNFRvUWIz0FuTEhwzosuiUJ1kM043UlgSPGNtKUv7zh95X2S/
	WmI/q0wbn0RaeMh3t1dV/i+uLQ8lqDNWgjHbBcwCj860E/Ldx07ASHTPCQm8LlJ1bV+ffildsK3
	EH8Gx4wqBh+nrDDYQh9a1MBkj5EfHiYJOZkyvFA==
X-Google-Smtp-Source: AGHT+IGUkdanVNSPRLr4jy8Ncjo2z96DDX2jrxJ/kxCkEj7XQZf6RHxycio+3ZTeRInhPz2htzpgKYcpXfROPhSjryA=
X-Received: by 2002:a05:690c:c10:b0:6ae:486c:59f with SMTP id
 00721157ae682-6d40f9295acmr155261167b3.29.1725376324107; Tue, 03 Sep 2024
 08:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240902102240.3760442-1-pedro.silva.ferreira@criticaltechworks.com>
In-Reply-To: <20240902102240.3760442-1-pedro.silva.ferreira@criticaltechworks.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 3 Sep 2024 08:11:51 -0700
Message-ID: <CAOSpxdbGZWFzLaZW0_kxcSTseh5VQh9o+K0svWqsp6b2v76xpg@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH 1/4] buildhistory: Fix intermittent
 package file list creation
To: pedro.silva.ferreira@criticaltechworks.com
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 15:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204169

Same issue with kirkstone version:

Applying: buildhistory: Fix intermittent package file list creation
Using index info to reconstruct a base tree...
error: patch failed: meta/classes/buildhistory.bbclass:597
error: meta/classes/buildhistory.bbclass: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
Patch failed at 0001 buildhistory: Fix intermittent package file list creat=
ion

Steve

On Mon, Sep 2, 2024 at 3:23=E2=80=AFAM Pedro Ferreira via
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
> (cherry picked from commit 8de9b8c1e199896b9a7bc5ed64967c6bfbf84bea)
> ---
>  meta/classes/buildhistory.bbclass | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistor=
y.bbclass
> index 4345ffc693..b35508db27 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -597,15 +597,12 @@ buildhistory_list_files_no_owners() {
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
> View/Reply Online (#204074): https://lists.openembedded.org/g/openembedde=
d-core/message/204074
> Mute This Topic: https://lists.openembedded.org/mt/108224278/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

