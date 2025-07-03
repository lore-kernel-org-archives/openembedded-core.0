Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE123C77B7C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 17:47:37 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.29031.1751564854139045471
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 10:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZFoLHXOX;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-714066c7bbbso618267b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 10:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751564853; x=1752169653; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxtszmRaAzcFDd+LRQpSOnZT881cLN3dzLSF2+0zj2A=;
        b=ZFoLHXOXBkWbUJ9pFqFYVcjDj6Nko1dXInC+2DHWqDBHNrnyKQvECIxAQjjf3pr20R
         Uc260sx8uIHgM8kdytVDuILWSofF2DdhEb2//aCWX1NxGQ3P2okvNWDeqSG5T/f1L8d7
         zGYYTQTlYF2eLNHVtWT8grSIi6n/09vEAHeTViCZyChEIiFOh8znFTDPK4n1dUrUwfYa
         kU+R4nzuq5gvH3XAW5j48FKqlgCLUyPafLbF7q72aCx7JDpwZ8Y2d2et7tBvaB5Nl7sP
         K1y18L5oPLCHz8LeXNT+JJevVIjTV83pTKHKPAs7M3z408vWIngoUR5fyxF8Ciuz59lq
         H5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751564853; x=1752169653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QxtszmRaAzcFDd+LRQpSOnZT881cLN3dzLSF2+0zj2A=;
        b=nu9eNQbHyqbfmCK6a745AjRSNO4ZblnB6X0Jw9BdZeMSW6Y9HG72NTixSSNvntjdcD
         FRevDPbZWAjIJoLCrVp7Hcq0UWQjKSbE4lW0nAnvATTpa1j3Pu3Ni1R8EZ1grevOXGZM
         GE35maMYXgZLIJrvVdgADmj3q/THaSh1PAze1DKg0s8lN8fS63VazG5FoiPdwnBjqw+Q
         +JTokTf8noMGFDnvUrvFYUTPvoTsqM8ZdawgCOZjxzL9NFpjvlnxVoF40jGCDCOymXj/
         AcewHaIijexLvwxnCY+B5wtZuFt2HFkVCbYOvNawzsjceHnXjk95kuUBWg8dQndRnaeJ
         6tUw==
X-Forwarded-Encrypted: i=1; AJvYcCUNty/bcQmHhy3yCWnPb85Cz9nxzTHsxVw0s7MoXYvlcvqQo2siQd0lB090+Xd5G7BxkGXEpFXA7/zQsKSZRrNPFA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy+rFmWd6lg14zqt09urG74lL8ZoyIfDVMCc0xCx1Spa9jez4so
	lCeMGRg6nhL7kY5pIxncI/MVG3dZImBg/6vBQB02Rphzbd0KOcn2xpGDO0Ee0cyLlu7vqiEhi+P
	1H3SE+Nh1T3fHz+6fbcucOrhsNau2lOGiU42y0YU=
X-Gm-Gg: ASbGnctru2eqEjnZm3tSELnOYPnUGVCeE0PG9fAaOifwiN8Eejvg/QF+wsGuvNY44GI
	eEjYFtvBhAWQagxTqNC6YsPr3/csudZXwfpBM934FX0FSkkbDOXi7Uq7wKAvawCr1LIW5YictL4
	94D0Zm9YohIpdrLFmkHvYGkXnGDY1d/HXgnfhhWyn/Wcc=
X-Google-Smtp-Source: AGHT+IHuqctxqINMvew03tjIAROF4arOSJMntMzFf46Znw3Iizqb4DCRUBBrg8tAwGDQ7qfBa3p1qqy+Fk/j02vF8hI=
X-Received: by 2002:a05:690c:6b07:b0:70e:719e:743 with SMTP id
 00721157ae682-716590cad05mr65961487b3.26.1751564853071; Thu, 03 Jul 2025
 10:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <DM8PR11MB5653BDE89A4EFB219A90C7E3EF43A@DM8PR11MB5653.namprd11.prod.outlook.com>
 <CANNYZj9UyaxakeB-CS7YZB+VRNsLkSz7vmv2Z78R6dMi26j=3w@mail.gmail.com>
In-Reply-To: <CANNYZj9UyaxakeB-CS7YZB+VRNsLkSz7vmv2Z78R6dMi26j=3w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Jul 2025 10:47:06 -0700
X-Gm-Features: Ac12FXxb6JCnnTWzv63KKXNA7t1G45cEf1wFklwR2-KBCL1BBUqlVLdO_7FyZIU
Message-ID: <CAMKF1srUnhSr4wdPcRq-XYM6Y0eASL15K-CG6NtPNajHxYZjvQ@mail.gmail.com>
Subject: Re: [OE-core] GCC Patch removal - 0008-libtool.patch
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Harish.Sadineni@windriver.com, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 17:47:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219892

On Thu, Jul 3, 2025 at 10:04=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> This was written by RP very long time ago, Khem's metadata was added
> on version update or otherwise later.
>
> Generally removing unnecessary (or poorly explained) patches is welcome.
>
> You can send a patch to oe-core that does so, and if it passes a-full
> test, then that will be considered in patch review.
>
> Alex
>
>
> On Thu, 3 Jul 2025 at 13:38, Sadineni, Harish via
> lists.openembedded.org
> <Harish.Sadineni=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > Hi Khem,
> >
> > This gcc patch https://git.openembedded.org/openembedded-core/tree/meta=
/recipes-devtools/gcc/gcc/0008-libtool.patch?h=3Dmaster modifies the libdir=
 from "/usr/lib/../lib" to "/usr/lib" in the libstdc++.la file.
> >
> > We removed this patch and rebuilt GCC using bitbake. We did not encount=
er any build or runtime issues. We tested building gcc, gcc-runtime, and co=
re-image-minimal. After booting the image, we also tested libtool and a sim=
ple C program with the following commands:
> >
> > $libtool --tag=3DCC --mode=3Dcompile x86_64-poky-linux-gcc -c hello.c
> > libtool: compile:  x86_64-poky-linux-gcc -c hello.c  -fPIC -DPIC -o .li=
bs/hello.o
> >
> > $libtool --tag=3DCC --mode=3Dlink x86_64-poky-linux-gcc  -o hello hello=
.lo
> > libtool: link: x86_64-poky-linux-gcc -o hello .libs/hello.o
> >
> > $x86_64-poky-linux-gcc hello.c -o hello
> >
> > All tools and the generated binaries are running fine. So, we believe t=
his patch is no longer needed with the latest GCC sources.
> > However, in the commit message, it is mentioned:
> > "it shouldn't be passing this into libtool in the first place but for n=
ow this resolves the nastiest problems this causes."
> >
> > Do we need any other tests to perform or is it okay to drop this patch?

Not much has changed in how libtool stuff is handled so I am not sure
if we can drop it as such. We test a subset in oe-core with build and
runtime
tests so there could be packages in larger ecosystem which is still
needing it even if we don't have them in oe-core

Can you check the content of libstdc++.la before and after this patch ?

secondly, finding an autotooled package which uses/sets
func_normal_abspath can show if it gets the values correct without
this patch
sadly I don't know of one on top of my head which you could use.
> >
> > Thanks,
> > Harish
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#219875): https://lists.openembedded.org/g/openembed=
ded-core/message/219875
> > Mute This Topic: https://lists.openembedded.org/mt/113964150/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

