Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC62C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:43:52 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.9314.1685522621891735684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 01:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=msrV1cNn;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2af2c7f2883so58789361fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 01:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685522620; x=1688114620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A+8eNfkT3o1DgboOkUTiCxd5GA5tGqTm82YOanao8QE=;
        b=msrV1cNnsKKMav0c1r3IuAu+sPQt0kXncCc4lOiZxqCd0oVb4mE+LsNh2sW6JmSnsg
         rZ3+2bNo8d/Trjt/Rl1co4Cpq69fTc7ZpgfXTHRx7S9kEeo59CUmHbgTi2Mo50PoChsW
         zXfBfLjnTS4wcbjgLjq0wGRac4gf5D32f8zJ30YKjaVqyRxfUBEgm4T8dhn+z18Q85f7
         AMoUstMCx4oSydWAFKweiV+8anwdAEHpNwBpK2nkvqjvB41nu11KL2iPkVGA/f3iu/Ht
         ljvJ6LuV2OfzU+Y873rGX9Zgvcvmtvg3zlzKQ3t695/imAK51iGnD9MLEHG8WMzS7zNr
         XhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685522620; x=1688114620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+8eNfkT3o1DgboOkUTiCxd5GA5tGqTm82YOanao8QE=;
        b=I3Kp9qEXRy3NK+HdDiIBuICNhw2kJpOqUkgQKcw3V0Mq64VEtxqLDn70OAco1z7Oaq
         EgILfUg61RTNew2MBQK1819YROenUoB3QfSYjKYwCuhIGgGvx/2FYg6hCcIZ67b5sm83
         +4RrcelZfPKGtsom+Qx1YL79OeSc7h+OgyAHK4EMT88olPY5o8FwqH9MbHvddgDE2zTn
         ca9lpSuPF5/DWDDQmZMSliogSVdf+HMb1UX8ioSlqDvUAk91vN/X01tblbrcQANmPEmM
         JXig12gwmaAE8Ej5nhynvb5xpANCLAyP4JdrgVextqzcPNG8Z7qb9WVzCZqU+n9ECUfC
         K0vQ==
X-Gm-Message-State: AC+VfDxFjHruc3OEL8SDd/dYX+QEhCBEVSAi0hu+MKmR5JWXVrxV4Bf/
	Ru3XAXDen/QRF5LSY4tKFgbAdB/yathmBTw/mwo=
X-Google-Smtp-Source: ACHHUZ4mdgAevCYhSZJ20/B05W+yekLUtvcFysRsbZ1alYtuMwhu3WNA4u37tV4c0ImGxONWA9Z45aztSn4dPbXFEiU=
X-Received: by 2002:a2e:88c5:0:b0:2ac:77e9:c7b0 with SMTP id
 a5-20020a2e88c5000000b002ac77e9c7b0mr2474131ljk.9.1685522619638; Wed, 31 May
 2023 01:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230530070823.4010-1-Riyaz.Khan@kpit.com> <CANNYZj89h-+LVWxEQ45Qi2XNW8asOHOY8X-37BpcsyCmY2vQ3A@mail.gmail.com>
 <BM1PR01MB3633DE4CABEC530FBEEFF376E8489@BM1PR01MB3633.INDPRD01.PROD.OUTLOOK.COM>
 <CANNYZj8Zj13cX94vJv=6sNJo58vaaGQ7JpTqhZHoSqC1NZhODA@mail.gmail.com> <PN3PR01MB7382924C3BFAD78BF363EDF48F489@PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN3PR01MB7382924C3BFAD78BF363EDF48F489@PN3PR01MB7382.INDPRD01.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 31 May 2023 10:43:27 +0200
Message-ID: <CANNYZj8jdgZJhrX9CsqR5MzY7A2owYjgOc=p82YH4iaJhpSn5w@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH v3] openssh: Remove BSD-4-clause
 contents completely from codebase
To: Ranjitsinh Rathod <Ranjitsinh.Rathod@kpit.com>
Cc: Riyaz Ahmed Khan <rak3033@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Steve Sakoman <steve@sakoman.com>, Riyaz Ahmed Khan <Riyaz.Khan@kpit.com>
Content-Type: multipart/related; boundary="0000000000000143df05fcf9518a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 08:43:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182002

--0000000000000143df05fcf9518a
Content-Type: multipart/alternative; boundary="0000000000000143de05fcf95189"

--0000000000000143de05fcf95189
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

Perhaps it would be easier to adjust the LICENSE entry in the openssh
recipe for all affected oe-core branches, with appropriate comment next to
that entry (because it would have to be again adjusted once new openssh is
released)? Is your goal to avoid the license, or simply to ensure it is
correctly specified?

Alex

On Wed, 31 May 2023 at 10:36, Ranjitsinh Rathod <Ranjitsinh.Rathod@kpit.com=
>
wrote:

> Hi Alexander,
>
> Let me explain a bit more here.
>
> Below upstream commit removed BSD-4-Clause from the LICENSE variable, But
> actually if we check from the source code of the openssh for this version
> (8.9p1), there are some files (*openbsd-compat/libressl-api-compat.c*)
> still affected and so this is wrong as per me.
> Link:
> https://git.yoctoproject.org/poky/commit/?id=3D2c86f586d55d0f6b99053e3e4d=
14c9ee36fa8aa8
>
> ~/sources/openssh-portable$ git branch
> * (HEAD detached at V_8_9_P1)
>   master
> ~/sources/openssh-portable$ grep -rl "All advertising materials mentionin=
g
> features or use of this software" *|grep -v \.1|grep -v \.5|grep -v \.8 |
> sort
> *openbsd-compat/libressl-api-compat.c*
>
> When we checked in the master branch, it seems the below commit from the
> openssh is removing it and so to completely remove the BSD-4-Clause, belo=
w
> commit from the openssh is required.
> Openssh commit:
> https://github.com/openssh/openssh-portable/commit/7280401bdd77ca54be6867=
a154cc01e0d72612e0
>
> We can upstream this to both kirkstone as well as master branch. Please
> suggest. As the version is different in both the branches, same change
> would get not apply on both and so we need to send two different patches
> each for master and kirkstone.
>
> So currently the v3 patch for kirkstone is correct and can be applied and
> for the master branch we can send another patch.
>
>
> Thanks,
>
> Best Regards,
>
> *Ranjitsinh Rathod*
> Technical Leader |  | KPIT Technologies Ltd.
> Cellphone: +91-84606 92403
>
> *__________________________________________ *KPIT <http://www.kpit.com/> =
|
>  Follow us on LinkedIn <http://www.kpit.com/linkedin>
>
> <https://www.kpit.com/TheNewBrand>
> ------------------------------
> *From:* Alexander Kanavin <alex.kanavin@gmail.com>
> *Sent:* Wednesday, May 31, 2023 12:11 PM
> *To:* Riyaz Ahmed Khan <Riyaz.Khan@kpit.com>
> *Cc:* Riyaz Ahmed Khan <rak3033@gmail.com>;
> openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>; Ranjitsinh Rathod <
> Ranjitsinh.Rathod@kpit.com>; Steve Sakoman <steve@sakoman.com>
> *Subject:* Re: [OE-core][kirkstone][PATCH v3] openssh: Remove
> BSD-4-clause contents completely from codebase
>
> Caution: This email originated from outside of the KPIT. Do not click
> links or open attachments unless you recognize the sender and know the
> content is safe.
>
> That is not how it works. If the issue exists in both master and
> kirkstone (which it does), it must be resolved in master first. Also
> 'resolves BSD-5 clause license issue' does not explain what the issue
> is, and you need to provide a better explanation.
>
> Alex
>
> On Wed, 31 May 2023 at 07:49, Riyaz Ahmed Khan <Riyaz.Khan@kpit.com>
> wrote:
> >
> > Hi Alex,
> >
> > As openssh is pointing to LTS branch in kirkstone and openssh is still
> at 8.9 the usage of BSD-4 can be limited. Hence, we need  this patch to b=
e
> integrated in kirkstone to resolve BSD-5 clause license issue for that th=
e
> reason this patch has been created to backport and remove the BSD-4 claus=
e
> license. In the master branch it is closer to the latest version and can
> wait for the official openssh release, but I hope there will not be a
> release to kirkstone from master for this reason we created this patch.
> >
> > Hi Steve,
> >
> > Please take this patch for kirkstone as it will resolve BSD-5 clause
> license issue.
> >
> > Regards,
> > Riyaz
> >
> > ________________________________
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > Sent: Tuesday, May 30, 2023 13:38
> > To: Riyaz Ahmed Khan <rak3033@gmail.com>
> > Cc: openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>; Ranjitsinh Rathod <
> Ranjitsinh.Rathod@kpit.com>; Riyaz Ahmed Khan <Riyaz.Khan@kpit.com>
> > Subject: Re: [OE-core][kirkstone][PATCH v3] openssh: Remove BSD-4-claus=
e
> contents completely from codebase
> >
> > Caution: This email originated from outside of the KPIT. Do not click
> links or open attachments unless you recognize the sender and know the
> content is safe.
> >
> > What is the rationale for adding this patch to oe-core? Why can't this
> > wait until openssh releases a version with this change?
> >
> > Alex
> >
> > On Tue, 30 May 2023 at 09:08, Riyaz Ahmed Khan <rak3033@gmail.com>
> wrote:
> > >
> > > As upstream removed this BSD-4-clause license, there are still some
> files
> > > has this license. Below file affected by this BSD-4-clause contents
> when
> > > below command is executed
> > > grep -rl "All advertising materials mentioning features or use of thi=
s
> software"
> > > *|grep -v \.1|grep -v \.5|grep -v \.8 | sort
> openbsd-compat/libressl-api-compat.c
> > >
> > > All advertising materials mentioning features or use of this software
> > >
> > > Openssh upstream removes the bsd-4 license compeletely from this comm=
it
> > >
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fopenssh%2Fopenssh-portable%2Fcommit%2F7280401bdd77ca54be6867a154cc0=
1e0d72612e0&data=3D05%7C01%7CRanjitsinh.Rathod%40kpit.com%7Cd788d3aa157742d=
facb008db61a20d08%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638211120911=
246208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DAiOVMsuUKtG5WkExJNwIVaM9rqrH=
XXMg0c8WziS9yHQ%3D&reserved=3D0
> <https://github.com/openssh/openssh-portable/commit/7280401bdd77ca54be686=
7a154cc01e0d72612e0>
> > > Hence, Remove and backport this commit completely to remove license o=
f
> BSD-4-clause
> > > contents from codebase. Hunks are refreshed, removed couple of hunks
> from
> > > configure.ac and openbsd-compat/libressl-api-compat.c as hunk code
> > > is not prasent.
> > >
> > > Signed-off-by: Riyaz Khan <Riyaz.Khan@kpit.com>
> > > ---
> > >  ...401bdd77ca54be6867a154cc01e0d72612e0.patch | 984 ++++++++++++++++=
++
> > >  .../openssh/openssh_8.9p1.bb                  |   1 +
> > >  2 files changed, 985 insertions(+)
> > >  create mode 100644
> meta/recipes-connectivity/openssh/openssh/7280401bdd77ca54be6867a154cc01e=
0d72612e0.patch
> > >
> > > diff --git
> a/meta/recipes-connectivity/openssh/openssh/7280401bdd77ca54be6867a154cc0=
1e0d72612e0.patch
> b/meta/recipes-connectivity/openssh/openssh/7280401bdd77ca54be6867a154cc0=
1e0d72612e0.patch
> > > new file mode 100644
> > > index 0000000000..ebdff1ffe4
> > > --- /dev/null
> > > +++
> b/meta/recipes-connectivity/openssh/openssh/7280401bdd77ca54be6867a154cc0=
1e0d72612e0.patch
> > > @@ -0,0 +1,984 @@
> > > +From 7280401bdd77ca54be6867a154cc01e0d72612e0 Mon Sep 17 00:00:00 20=
01
> > > +From: Damien Miller <djm@mindrot.org>
> > > +Date: Fri, 24 Mar 2023 13:56:25 +1100
> > > +Subject: [PATCH] remove support for old libcrypto
> > > +
> > > +OpenSSH now requires LibreSSL 3.1.0 or greater or
> > > +OpenSSL 1.1.1 or greater
> > > +
> > > +with/ok dtucker@
> > > +
> > > +Upstream-Status: Backport [
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fopenssh%2Fopenssh-portable%2Fcommit%2F7280401bdd77ca54be6867a154cc0=
1e0d72612e0&data=3D05%7C01%7CRanjitsinh.Rathod%40kpit.com%7Cd788d3aa157742d=
facb008db61a20d08%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638211120911=
246208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DAiOVMsuUKtG5WkExJNwIVaM9rqrH=
XXMg0c8WziS9yHQ%3D&reserved=3D0
> <https://github.com/openssh/openssh-portable/commit/7280401bdd77ca54be686=
7a154cc01e0d72612e0>
> ]
> > > +Comment: Hunk are refreshed, removed couple of hunks from
> configure.ac as hunk code is not prasent
> > > +and backported to the existing code.
> > > +Signed-off-by: Riyaz Khan <Riyaz.Khan@kpit.com>
> > > +
> > > +---
> > > + .github/workflows/c-cpp.yml          |   7 -
> > > + INSTALL                              |   8 +-
> > > + cipher-aes.c                         |   2 +-
> > > + configure.ac                         |  96 ++---
> > > + openbsd-compat/libressl-api-compat.c | 556
> +--------------------------
> > > + openbsd-compat/openssl-compat.h      | 151 +-------
> > > + 6 files changed, 40 insertions(+), 780 deletions(-)
> > > +
> > > +diff --git a/.github/workflows/c-cpp.yml b/.github/workflows/c-cpp.y=
ml
> > > +index 3d9aa22dba5..d299a32468d 100644
> > > +--- a/.github/workflows/c-cpp.yml
> > > ++++ b/.github/workflows/c-cpp.yml
> > > +@@ -40,18 +40,11 @@
> > > +           - { os: ubuntu-20.04, configs: tcmalloc }
> > > +           - { os: ubuntu-20.04, configs: musl }
> > > +           - { os: ubuntu-latest, configs: libressl-master }
> > > +-          - { os: ubuntu-latest, configs: libressl-2.2.9 }
> > > +-          - { os: ubuntu-latest, configs: libressl-2.8.3 }
> > > +-          - { os: ubuntu-latest, configs: libressl-3.0.2 }
> > > +           - { os: ubuntu-latest, configs: libressl-3.2.6 }
> > > +           - { os: ubuntu-latest, configs: libressl-3.3.4 }
> > > +           - { os: ubuntu-latest, configs: libressl-3.4.1 }
> > > +           - { os: ubuntu-latest, configs: openssl-master }
> > > +           - { os: ubuntu-latest, configs: openssl-noec }
> > > +-          - { os: ubuntu-latest, configs: openssl-1.0.1 }
> > > +-          - { os: ubuntu-latest, configs: openssl-1.0.1u }
> > > +-          - { os: ubuntu-latest, configs: openssl-1.0.2u }
> > > +-          - { os: ubuntu-latest, configs: openssl-1.1.0h }
> > > +           - { os: ubuntu-latest, configs: openssl-1.1.1 }
> > > +           - { os: ubuntu-latest, configs: openssl-1.1.1k }
> > > +           - { os: ubuntu-latest, configs: openssl-3.0.0 }
> > > +diff --git a/INSTALL b/INSTALL
> > > +index 68b15e13190..f99d1e2a809 100644
> > > +--- a/INSTALL
> > > ++++ b/INSTALL
> > > +@@ -21,12 +21,8 @@
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fzlib.=
net%2F&data=3D05%7C01%7CRanjitsinh.Rathod%40kpit.com%7Cd788d3aa157742dfacb0=
08db61a20d08%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63821112091124620=
8%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DgazTCzbsb8yEsXaj1Vn9FGK6t4V1Fop5t=
8tPb%2BWqUns%3D&reserved=3D0
> <https://zlib.net/>
> > > +
> > > + libcrypto from either of LibreSSL or OpenSSL.  Building without
> libcrypto
> > > + is supported but severely restricts the available ciphers and
> algorithms.
> > > +- - LibreSSL (
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.l=
ibressl.org%2F&data=3D05%7C01%7CRanjitsinh.Rathod%40kpit.com%7Cd788d3aa1577=
42dfacb008db61a20d08%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638211120=
911246208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DCmw7m41lEsAw3CFeFKL1R8u%2=
Bbu%2FWslzOq%2BhS%2FEkXohg%3D&reserved=3D0
> <https://www.libressl.org/>)
> > > +- - OpenSSL (
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.o=
penssl.org%2F&data=3D05%7C01%7CRanjitsinh.Rathod%40kpit.com%7Cd788d3aa15774=
2dfacb008db61a20d08%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6382111209=
11246208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DJIzbanv8OPCrZyGkB%2B%2BqyN=
gDfk72Qy2BmB9LAIS%2FTKk%3D&reserved=3D0
> <https://www.openssl.org/>) with any of the following versions:
> > > +-   - 1.0.x >=3D 1.0.1 or 1.1.0 >=3D 1.1.0g or any 1.1.1
> > > +-
> > > +-Note that due to a bug in EVP_CipherInit OpenSSL 1.1 versions prior
> to
> > > +-1.1.0g can't be used.
> > > ++ - LibreSSL (
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.l=
ibressl.org%2F&data=3D05%7C01%7CRanjitsinh.Rathod%40kpit.com%7Cd788d3aa1577=
42dfacb008db61a20d08%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638211120=
911246208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DCmw7m41lEsAw3CFeFKL1R8u%2=
Bbu%2FWslzOq%2BhS%2FEkXohg%3D&reserved=3D0
> <https://www.libressl.org/>) 3.1.0 or greater
> > > ++ - OpenSSL (
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.o=
penssl.org%2F&data=3D05%7C01%7CRanjitsinh.Rathod%40kpit.com%7Cd788d3aa15774=
2dfacb008db61a20d08%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6382111209=
11246208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DJIzbanv8OPCrZyGkB%2B%2BqyN=
gDfk72Qy2BmB9LAIS%2FTKk%3D&reserved=3D0
> <https://www.openssl.org/>) 1.1.1 or greater
> > > +
> > > + LibreSSL/OpenSSL should be compiled as a position-independent libra=
ry
> > > + (i.e. -fPIC, eg by configuring OpenSSL as "./config [options] -fPIC=
"
> > > +diff --git a/cipher-aes.c b/cipher-aes.c
> > > +index 8b101727284..87c763353d8 100644
> > > +--- a/cipher-aes.c
> > > ++++ b/cipher-aes.c
> > > +@@ -69,7 +69,7 @@ ssh_rijndael_init(EVP_CIPHER_CTX *ctx, const u_cha=
r
> *key, const u_char *iv,
> > > +
> > > + static int
> > > + ssh_rijndael_cbc(EVP_CIPHER_CTX *ctx, u_char *dest, const u_char
> *src,
> > > +-    LIBCRYPTO_EVP_INL_TYPE len)
> > > ++    size_t len)
> > > + {
> > > +       struct ssh_rijndael_ctx *c;
> > > +       u_char buf[RIJNDAEL_BLOCKSIZE];
> > > +diff --git a/configure.ac b/configure.ac
> > > +index 22fee70f604..1c0ccdf19c5 100644
> > > +--- a/configure.ac
> > > ++++ b/configure.ac
> > > +@@ -2744,42 +2744,40 @@
> > > +       #include <openssl/crypto.h>
> > > +       #define DATA "conftest.ssllibver"
> > > +               ]], [[
> > > +-              FILE *fd;
> > > +-              int rc;
> > > ++              FILE *f;
> > > +
> > > +-              fd =3D fopen(DATA,"w");
> > > +-              if(fd =3D=3D NULL)
> > > ++              if ((f =3D fopen(DATA, "w")) =3D=3D NULL)
> > > +                       exit(1);
> > > +-#ifndef OPENSSL_VERSION
> > > +-# define OPENSSL_VERSION SSLEAY_VERSION
> > > +-#endif
> > > +-#ifndef HAVE_OPENSSL_VERSION
> > > +-# define OpenSSL_version      SSLeay_version
> > > +-#endif
> > > +-#ifndef HAVE_OPENSSL_VERSION_NUM
> > > +-# define OpenSSL_version_num  SSLeay
> > > +-#endif
> > > +-              if ((rc =3D fprintf(fd, "%08lx (%s)\n",
> > > ++              if (fprintf(f, "%08lx (%s)",
> > > +                   (unsigned long)OpenSSL_version_num(),
> > > +-                  OpenSSL_version(OPENSSL_VERSION))) < 0)
> > > ++                  OpenSSL_version(OPENSSL_VERSION)) < 0)
> > > ++                      exit(1);
> > > ++#ifdef LIBRESSL_VERSION_NUMBER
> > > ++              if (fprintf(f, " libressl-%08lx",
> LIBRESSL_VERSION_NUMBER) < 0)
> > > ++                      exit(1);
> > > ++#endif
> > > ++              if (fputc('\n', f) =3D=3D EOF || fclose(f) =3D=3D EOF=
)
> > > +                       exit(1);
> > > +-
> > > +               exit(0);
> > > +               ]])],
> > > +               [
> > > +-                      ssl_library_ver=3D`cat conftest.ssllibver`
> > > ++                      sslver=3D`cat conftest.ssllibver`
> > > ++                      ssl_showver=3D`echo "$sslver" | sed 's/
> libressl-.*//'`
> > > +                       # Check version is supported.
> > > +-                      case "$ssl_library_ver" in
> > > +-                      10000*|0*)
> > > +-                              AC_MSG_ERROR([OpenSSL >=3D 1.0.1
> required (have "$ssl_library_ver")])
> > > +-                              ;;
> > > +-                      100*)   ;; # 1.0.x
> > > +-                      101000[[0123456]]*)
> > > +-                              #
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fopenssl%2Fopenssl%2Fpull%2F4613&data=3D05%7C01%7CRanjitsinh.Rathod%=
40kpit.com%7Cd788d3aa157742dfacb008db61a20d08%7C3539451eb46e4a26a242ff61502=
855c7%7C0%7C0%7C638211120911246208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw=
MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D=
dJwZf4dbh%2FT3T5kfAA4%2FAXjZEhsAx5Rzay3Nq9Z0nK0%3D&reserved=3D0
> <https://github.com/openssl/openssl/pull/4613>
> > > +-                              AC_MSG_ERROR([OpenSSL 1.1.x versions
> prior to 1.1.0g have a bug that breaks their use with OpenSSH (have
> "$ssl_library_ver")])
> > > ++                      case "$sslver" in
> > > ++                      100*|10100*) # 1.0.x, 1.1.0x
> > > ++                              AC_MSG_ERROR([OpenSSL >=3D 1.1.1
> required (have "$ssl_showver")])
> > > +                               ;;
> > > +                       101*)   ;; # 1.1.x
> > > +-                      200*)   ;; # LibreSSL
> > > ++                      200*)   # LibreSSL
> > > ++                              lver=3D`echo "$sslver" | sed
> 's/.*libressl-//'`
> > > ++                              case "$lver" in
> > > ++                              2*|300*) # 2.x, 3.0.0
> > > ++                                      AC_MSG_ERROR([LibreSSL >=3D
> 3.1.0 required (have "$ssl_showver")])
> > > ++                                      ;;
> > > ++                              *) ;;   # Assume all other versions
> are good.
> > > ++                              esac
> > > ++                              ;;
> > > +                       300*)   ;; # OpenSSL 3
> > > +                       301*)   ;; # OpenSSL development branch.
> > > +                       *)
> > > +@@ -2781,10 +2781,10 @@
> > > +                       300*)   ;; # OpenSSL 3
> > > +                       301*)   ;; # OpenSSL development branch.
> > > +                       *)
> > > +-                              AC_MSG_ERROR([Unknown/unsupported
> OpenSSL version ("$ssl_library_ver")])
> > > ++                              AC_MSG_ERROR([Unknown/unsupported
> OpenSSL version ("$ssl_showver")])
> > > +                               ;;
> > > +                       esac
> > > +-                      AC_MSG_RESULT([$ssl_library_ver])
> > > ++                      AC_MSG_RESULT([$ssl_showver])
> > > +               ],
> > > +               [
> > > +                       AC_MSG_RESULT([not found])
> > > +@@ -2804,9 +2804,6 @@
> > > +       #include <openssl/opensslv.h>
> > > +       #include <openssl/crypto.h>
> > > +               ]], [[
> > > +-#ifndef HAVE_OPENSSL_VERSION_NUM
> > > +-# define OpenSSL_version_num  SSLeay
> > > +-#endif
> > > +               exit(OpenSSL_version_num() =3D=3D OPENSSL_VERSION_NUM=
BER ?
> 0 : 1);
> > > +               ]])],
> > > +               [
> > > +@@ -2881,44 +2878,13 @@
> > > +           )
> > > +       )
> > > +
> > > +-      # LibreSSL/OpenSSL 1.1x API
> > > ++      # LibreSSL/OpenSSL API differences
> > > +       AC_CHECK_FUNCS([ \
> > > +-              OPENSSL_init_crypto \
> > > +-              DH_get0_key \
> > > +-              DH_get0_pqg \
> > > +-              DH_set0_key \
> > > +-              DH_set_length \
> > > +-              DH_set0_pqg \
> > > +-              DSA_get0_key \
> > > +-              DSA_get0_pqg \
> > > +-              DSA_set0_key \
> > > +-              DSA_set0_pqg \
> > > +-              DSA_SIG_get0 \
> > > +-              DSA_SIG_set0 \
> > > +-              ECDSA_SIG_get0 \
> > > +-              ECDSA_SIG_set0 \
> > > +               EVP_CIPHER_CTX_iv \
> > > +               EVP_CIPHER_CTX_iv_noconst \
> > > +               EVP_CIPHER_CTX_get_iv \
> > > +               EVP_CIPHER_CTX_get_updated_iv \
> > > +               EVP_CIPHER_CTX_set_iv \
> > > +-              RSA_get0_crt_params \
> > > +-              RSA_get0_factors \
> > > +-              RSA_get0_key \
> > > +-              RSA_set0_crt_params \
> > > +-              RSA_set0_factors \
> > > +-              RSA_set0_key \
> > > +-              RSA_meth_free \
> > > +-              RSA_meth_dup \
> > > +-              RSA_meth_set1_name \
> > > +-              RSA_meth_get_finish \
> > > +-              RSA_meth_set_priv_enc \
> > > +-              RSA_meth_set_priv_dec \
> > > +-              RSA_meth_set_finish \
> > > +-              EVP_PKEY_get0_RSA \
> > > +-              EVP_MD_CTX_new \
> > > +-              EVP_MD_CTX_free \
> > > +-              EVP_chacha20 \
> > > +       ])
> > > +
> > > +       if test "x$openssl_engine" =3D "xyes" ; then
> > > +@@ -3040,8 +3006,8 @@
> > > +       fi
> > > +       AC_CHECK_FUNCS([crypt DES_crypt])
> > > +
> > > +-      # Check for SHA256, SHA384 and SHA512 support in OpenSSL
> > > +-      AC_CHECK_FUNCS([EVP_sha256 EVP_sha384 EVP_sha512])
> > > ++      # Check for various EVP support in OpenSSL
> > > ++      AC_CHECK_FUNCS([EVP_sha256 EVP_sha384 EVP_sha512 EVP_chacha20=
])
> > > +
> > > +       # Check complete ECC support in OpenSSL
> > > +       AC_MSG_CHECKING([whether OpenSSL has NID_X9_62_prime256v1])
> > > +diff --git a/openbsd-compat/libressl-api-compat.c
> b/openbsd-compat/libressl-api-compat.c
> > > +index 498180dc894..59be17397c5 100644
> > > +--- a/openbsd-compat/libressl-api-compat.c
> > > ++++ b/openbsd-compat/libressl-api-compat.c
> > > +@@ -1,129 +1,5 @@
> > > +-/* $OpenBSD: dsa_lib.c,v 1.29 2018/04/14 07:09:21 tb Exp $ */
> > > +-/* $OpenBSD: rsa_lib.c,v 1.37 2018/04/14 07:09:21 tb Exp $ */
> > > +-/* $OpenBSD: evp_lib.c,v 1.17 2018/09/12 06:35:38 djm Exp $ */
> > > +-/* $OpenBSD: dh_lib.c,v 1.32 2018/05/02 15:48:38 tb Exp $ */
> > > +-/* $OpenBSD: p_lib.c,v 1.24 2018/05/30 15:40:50 tb Exp $ */
> > > +-/* $OpenBSD: digest.c,v 1.30 2018/04/14 07:09:21 tb Exp $ */
> > > +-/* Copyright (C) 1995-1998 Eric Young (eay@cryptsoft.com)
> > > +- * All rights reserved.
> > > +- *
> > > +- * This package is an SSL implementation written
> > > +- * by Eric Young (eay@cryptsoft.com).
> > > +- * The implementation was written so as to conform with Netscapes
> SSL.
> > > +- *
> > > +- * This library is free for commercial and non-commercial use as
> long as
> > > +- * the following conditions are aheared to.  The following conditio=
ns
> > > +- * apply to all code found in this distribution, be it the RC4, RSA=
,
> > > +- * lhash, DES, etc., code; not just the SSL code.  The SSL
> documentation
> > > +- * included with this distribution is covered by the same copyright
> terms
> > > +- * except that the holder is Tim Hudson (tjh@cryptsoft.com).
> > > +- *
> > > +- * Copyright remains Eric Young's, and as such any Copyright notice=
s
> in
> > > +- * the code are not to be removed.
> > > +- * If this package is used in a product, Eric Young should be given
> attribution
> > > +- * as the author of the parts of the library used.
> > > +- * This can be in the form of a textual message at program startup =
or
> > > +- * in documentation (online or textual) provided with the package.
> > > +- *
> > > +- * Redistribution and use in source and binary forms, with or witho=
ut
> > > +- * modification, are permitted provided that the following conditio=
ns
> > > +- * are met:
> > > +- * 1. Redistributions of source code must retain the copyright
> > > +- *    notice, this list of conditions and the following disclaimer.
> > > +- * 2. Redistributions in binary form must reproduce the above
> copyright
> > > +- *    notice, this list of conditions and the following disclaimer
> in the
> > > +- *    documentation and/or other materials provided with the
> distribution.
> > > +- * 3. All advertising materials mentioning features or use of this
> software
> > > +- *    must display the following acknowledgement:
> > > +- *    "This product includes cryptographic software written by
> > > +- *     Eric Young (eay@cryptsoft.com)"
> > > +- *    The word 'cryptographic' can be left out if the rouines from
> the library
> > > +- *    being used are not cryptographic related :-).
> > > +- * 4. If you include any Windows specific code (or a derivative
> thereof) from
> > > +- *    the apps directory (application code) you must include an
> acknowledgement:
> > > +- *    "This product includes software written by Tim Hudson (
> tjh@cryptsoft.com)"
> > > +- *
> > > +- * THIS SOFTWARE IS PROVIDED BY ERIC YOUNG ``AS IS'' AND
> > > +- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO=
,
> THE
> > > +- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
> PARTICULAR PURPOSE
> > > +- * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
> LIABLE
> > > +- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> CONSEQUENTIAL
> > > +- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUT=
E
> GOODS
> > > +- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
> INTERRUPTION)
> > > +- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
> CONTRACT, STRICT
> > > +- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING I=
N
> ANY WAY
> > > +- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
> POSSIBILITY OF
> > > +- * SUCH DAMAGE.
> > > +- *
> > > +- * The licence and distribution terms for any publically available
> version or
> > > +- * derivative of this code cannot be changed.  i.e. this code canno=
t
> simply be
> > > +- * copied and put under another distribution licence
> > > +- * [including the GNU Public Licence.]
> > > +- */
> > > +-
> > > +-/* $OpenBSD: dsa_asn1.c,v 1.22 2018/06/14 17:03:19 jsing Exp $ */
> > > +-/* $OpenBSD: ecs_asn1.c,v 1.9 2018/03/17 15:24:44 tb Exp $ */
> > > +-/* $OpenBSD: digest.c,v 1.30 2018/04/14 07:09:21 tb Exp $ */
> > > +-/* Written by Dr Stephen N Henson (steve@openssl.org) for the
> OpenSSL
> > > +- * project 2000.
> > > +- */
> > > +-/*
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +- * Copyright (c) 2000-2005 The OpenSSL Project.  All rights reserve=
d.
> > > +- *
> > > +- * Redistribution and use in source and binary forms, with or witho=
ut
> > > +- * modification, are permitted provided that the following conditio=
ns
> > > +- * are met:
> > > +- *
> > > +- * 1. Redistributions of source code must retain the above copyrigh=
t
> > > +- *    notice, this list of conditions and the following disclaimer.
> > > +- *
> > > +- * 2. Redistributions in binary form must reproduce the above
> copyright
> > > +- *    notice, this list of conditions and the following disclaimer =
in
> > > +- *    the documentation and/or other materials provided with the
> > > +- *    distribution.
> > > +- *
> > > +- * 3. All advertising materials mentioning features or use of this
> > > +- *    software must display the following acknowledgment:
> > > +- *    "This product includes software developed by the OpenSSL
> Project
> > > +- *    for use in the OpenSSL Toolkit. (
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.op=
enssl.org%2F&data=3D05%7C01%7CRanjitsinh.Rathod%40kpit.com%7Cd788d3aa157742=
dfacb008db61a20d08%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63821112091=
1246208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI=
6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Dxcpid%2F25wbVMoxg4ok8qGpgBj=
iL8jXkZN5bX4hSS2wc%3D&reserved=3D0
> <http://www.openssl.org/>)"
> > > +- *
> > > +- * 4. The names "OpenSSL Toolkit" and "OpenSSL Project" must not be
> used to
> > > +- *    endorse or promote products derived from this software withou=
t
> > > +- *    prior written permission. For written permission, please
> contact
> > > +- *    licensing@OpenSSL.org.
> > > +- *
> > > +- * 5. Products derived from this software may not be called "OpenSS=
L"
> > > +- *    nor may "OpenSSL" appear in their names without prior written
> > > +- *    permission of the OpenSSL Project.
> > > +- *
> > > +- * 6. Redistributions of any form whatsoever must retain the
> following
> > > +- *    acknowledgment:
> > > +- *    "This product includes software developed by the OpenSSL
> Project
> > > +- *    for use in the OpenSSL Toolkit (
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.op=
enssl.org%2F&data=3D05%7C01%7CRanjitsinh.Rathod%40kpit.com%7Cd788d3aa157742=
dfacb008db61a20d08%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63821112091=
1246208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI=
6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Dxcpid%2F25wbVMoxg4ok8qGpgBj=
iL8jXkZN5bX4hSS2wc%3D&reserved=3D0
> <http://www.openssl.org/>)"
> > > +- *
> > > +- * THIS SOFTWARE IS PROVIDED BY THE OpenSSL PROJECT ``AS IS'' AND A=
NY
> > > +- * EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
> THE
> > > +- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICUL=
AR
> > > +- * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE OpenSSL PROJECT O=
R
> > > +- * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> > > +- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
> > > +- * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
> > > +- * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> > > +- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
> CONTRACT,
> > > +- * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
> > > +- * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
> ADVISED
> > > +- * OF THE POSSIBILITY OF SUCH DAMAGE.
> > > +- *
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +- *
> > > +- * This product includes cryptographic software written by Eric You=
ng
> > > +- * (eay@cryptsoft.com).  This product includes software written by
> Tim
> > > +- * Hudson (tjh@cryptsoft.com).
> > > +- *
> > > +- */
> > > +-
> > > +-/*    $OpenBSD: rsa_meth.c,v 1.2 2018/09/12 06:35:38 djm Exp
> $        */
> > > + /*
> > > +- * Copyright (c) 2018 Theo Buehler <tb@openbsd.org>
> > > ++ * Copyright (c) 2018 Damien Miller <djm@mindrot.org>
> > > +  *
> > > +  * Permission to use, copy, modify, and distribute this software fo=
r
> any
> > > +  * purpose with or without fee is hereby granted, provided that the
> above
> > > +@@ -147,192 +23,7 @@
> > > + #include <stdlib.h>
> > > + #include <string.h>
> > > +
> > > +-#include <openssl/err.h>
> > > +-#include <openssl/bn.h>
> > > +-#include <openssl/dsa.h>
> > > +-#include <openssl/rsa.h>
> > > + #include <openssl/evp.h>
> > > +-#ifdef OPENSSL_HAS_ECC
> > > +-#include <openssl/ecdsa.h>
> > > +-#endif
> > > +-#include <openssl/dh.h>
> > > +-
> > > +-#ifndef HAVE_DSA_GET0_PQG
> > > +-void
> > > +-DSA_get0_pqg(const DSA *d, const BIGNUM **p, const BIGNUM **q, cons=
t
> BIGNUM **g)
> > > +-{
> > > +-      if (p !=3D NULL)
> > > +-              *p =3D d->p;
> > > +-      if (q !=3D NULL)
> > > +-              *q =3D d->q;
> > > +-      if (g !=3D NULL)
> > > +-              *g =3D d->g;
> > > +-}
> > > +-#endif /* HAVE_DSA_GET0_PQG */
> > > +-
> > > +-#ifndef HAVE_DSA_SET0_PQG
> > > +-int
> > > +-DSA_set0_pqg(DSA *d, BIGNUM *p, BIGNUM *q, BIGNUM *g)
> > > +-{
> > > +-      if ((d->p =3D=3D NULL && p =3D=3D NULL) || (d->q =3D=3D NULL =
&& q =3D=3D NULL)
> ||
> > > +-          (d->g =3D=3D NULL && g =3D=3D NULL))
> > > +-              return 0;
> > > +-
> > > +-      if (p !=3D NULL) {
> > > +-              BN_free(d->p);
> > > +-              d->p =3D p;
> > > +-      }
> > > +-      if (q !=3D NULL) {
> > > +-              BN_free(d->q);
> > > +-              d->q =3D q;
> > > +-      }
> > > +-      if (g !=3D NULL) {
> > > +-              BN_free(d->g);
> > > +-              d->g =3D g;
> > > +-      }
> > > +-
> > > +-      return 1;
> > > +-}
> > > +-#endif /* HAVE_DSA_SET0_PQG */
> > > +-
> > > +-#ifndef HAVE_DSA_GET0_KEY
> > > +-void
> > > +-DSA_get0_key(const DSA *d, const BIGNUM **pub_key, const BIGNUM
> **priv_key)
> > > +-{
> > > +-      if (pub_key !=3D NULL)
> > > +-              *pub_key =3D d->pub_key;
> > > +-      if (priv_key !=3D NULL)
> > > +-              *priv_key =3D d->priv_key;
> > > +-}
> > > +-#endif /* HAVE_DSA_GET0_KEY */
> > > +-
> > > +-#ifndef HAVE_DSA_SET0_KEY
> > > +-int
> > > +-DSA_set0_key(DSA *d, BIGNUM *pub_key, BIGNUM *priv_key)
> > > +-{
> > > +-      if (d->pub_key =3D=3D NULL && pub_key =3D=3D NULL)
> > > +-              return 0;
> > > +-
> > > +-      if (pub_key !=3D NULL) {
> > > +-              BN_free(d->pub_key);
> > > +-              d->pub_key =3D pub_key;
> > > +-      }
> > > +-      if (priv_key !=3D NULL) {
> > > +-              BN_free(d->priv_key);
> > > +-              d->priv_key =3D priv_key;
> > > +-      }
> > > +-
> > > +-      return 1;
> > > +-}
> > > +-#endif /* HAVE_DSA_SET0_KEY */
> > > +-
> > > +-#ifndef HAVE_RSA_GET0_KEY
> > > +-void
> > > +-RSA_get0_key(const RSA *r, const BIGNUM **n, const BIGNUM **e, cons=
t
> BIGNUM **d)
> > > +-{
> > > +-      if (n !=3D NULL)
> > > +-              *n =3D r->n;
> > > +-      if (e !=3D NULL)
> > > +-              *e =3D r->e;
> > > +-      if (d !=3D NULL)
> > > +-              *d =3D r->d;
> > > +-}
> > > +-#endif /* HAVE_RSA_GET0_KEY */
> > > +-
> > > +-#ifndef HAVE_RSA_SET0_KEY
> > > +-int
> > > +-RSA_set0_key(RSA *r, BIGNUM *n, BIGNUM *e, BIGNUM *d)
> > > +-{
> > > +-      if ((r->n =3D=3D NULL && n =3D=3D NULL) || (r->e =3D=3D NULL =
&& e =3D=3D NULL))
> > > +-              return 0;
> > > +-
> > > +-      if (n !=3D NULL) {
> > > +-              BN_free(r->n);
> > > +-              r->n =3D n;
> > > +-      }
> > > +-      if (e !=3D NULL) {
> > > +-              BN_free(r->e);
> > > +-              r->e =3D e;
> > > +-      }
> > > +-      if (d !=3D NULL) {
> > > +-              BN_free(r->d);
> > > +-              r->d =3D d;
> > > +-      }
> > > +-
> > > +-      return 1;
> > > +-}
> > > +-#endif /* HAVE_RSA_SET0_KEY */
> > > +-
> > > +-#ifndef HAVE_RSA_GET0_CRT_PARAMS
> > > +-void
> > > +-RSA_get0_crt_params(const RSA *r, const BIGNUM **dmp1, const BIGNUM
> **dmq1,
> > > +-    const BIGNUM **iqmp)
> > > +-{
> > > +-      if (dmp1 !=3D NULL)
> > > +-              *dmp1 =3D r->dmp1;
> > > +-      if (dmq1 !=3D NULL)
> > > +-              *dmq1 =3D r->dmq1;
> > > +-      if (iqmp !=3D NULL)
> > > +-              *iqmp =3D r->iqmp;
> > > +-}
> > > +-#endif /* HAVE_RSA_GET0_CRT_PARAMS */
> > > +-
> > > +-#ifndef HAVE_RSA_SET0_CRT_PARAMS
> > > +-int
> > > +-RSA_set0_crt_params(RSA *r, BIGNUM *dmp1, BIGNUM *dmq1, BIGNUM *iqm=
p)
> > > +-{
> > > +-      if ((r->dmp1 =3D=3D NULL && dmp1 =3D=3D NULL) ||
> > > +-          (r->dmq1 =3D=3D NULL && dmq1 =3D=3D NULL) ||
> > > +-          (r->iqmp =3D=3D NULL && iqmp =3D=3D NULL))
> > > +-              return 0;
> > > +-
> > > +-      if (dmp1 !=3D NULL) {
> > > +-              BN_free(r->dmp1);
> > > +-              r->dmp1 =3D dmp1;
> > > +-      }
> > > +-      if (dmq1 !=3D NULL) {
> > > +-              BN_free(r->dmq1);
> > > +-              r->dmq1 =3D dmq1;
> > > +-      }
> > > +-      if (iqmp !=3D NULL) {
> > > +-              BN_free(r->iqmp);
> > > +-              r->iqmp =3D iqmp;
> > > +-      }
> > > +-
> > > +-      return 1;
> > > +-}
> > > +-#endif /* HAVE_RSA_SET0_CRT_PARAMS */
> > > +-
> > > +-#ifndef HAVE_RSA_GET0_FACTORS
> > > +-void
> > > +-RSA_get0_factors(const RSA *r, const BIGNUM **p, const BIGNUM **q)
> > > +-{
> > > +-      if (p !=3D NULL)
> > > +-              *p =3D r->p;
> > > +-      if (q !=3D NULL)
> > > +-              *q =3D r->q;
> > > +-}
> > > +-#endif /* HAVE_RSA_GET0_FACTORS */
> > > +-
> > > +-#ifndef HAVE_RSA_SET0_FACTORS
> > > +-int
> > > +-RSA_set0_factors(RSA *r, BIGNUM *p, BIGNUM *q)
> > > +-{
> > > +-      if ((r->p =3D=3D NULL && p =3D=3D NULL) || (r->q =3D=3D NULL =
&& q =3D=3D NULL))
> > > +-              return 0;
> > > +-
> > > +-      if (p !=3D NULL) {
> > > +-              BN_free(r->p);
> > > +-              r->p =3D p;
> > > +-      }
> > > +-      if (q !=3D NULL) {
> > > +-              BN_free(r->q);
> > > +-              r->q =3D q;
> > > +-      }
> > > +-
> > > +-      return 1;
> > > +-}
> > > +-#endif /* HAVE_RSA_SET0_FACTORS */
> > > +
> > > + #ifndef HAVE_EVP_CIPHER_CTX_GET_IV
> > > + int
> > > +@@ -392,249 +83,4 @@ EVP_CIPHER_CTX_set_iv(EVP_CIPHER_CTX *ctx, cons=
t
> unsigned char *iv, size_t len)
> > > + }
> > > + #endif /* HAVE_EVP_CIPHER_CTX_SET_IV */
> > > +
> > > +-#ifndef HAVE_DSA_SIG_GET0
> > > +-void
> > > +-DSA_SIG_get0(const DSA_SIG *sig, const BIGNUM **pr, const BIGNUM
> **ps)
> > > +-{
> > > +-      if (pr !=3D NULL)
> > > +-              *pr =3D sig->r;
> > > +-      if (ps !=3D NULL)
> > > +-              *ps =3D sig->s;
> > > +-}
> > > +-#endif /* HAVE_DSA_SIG_GET0 */
> > > +-
> > > +-#ifndef HAVE_DSA_SIG_SET0
> > > +-int
> > > +-DSA_SIG_set0(DSA_SIG *sig, BIGNUM *r, BIGNUM *s)
> > > +-{
> > > +-      if (r =3D=3D NULL || s =3D=3D NULL)
> > > +-              return 0;
> > > +-
> > > +-      BN_clear_free(sig->r);
> > > +-      sig->r =3D r;
> > > +-      BN_clear_free(sig->s);
> > > +-      sig->s =3D s;
> > > +-
> > > +-      return 1;
> > > +-}
> > > +-#endif /* HAVE_DSA_SIG_SET0 */
> > > +-
> > > +-#ifdef OPENSSL_HAS_ECC
> > > +-#ifndef HAVE_ECDSA_SIG_GET0
> > > +-void
> > > +-ECDSA_SIG_get0(const ECDSA_SIG *sig, const BIGNUM **pr, const BIGNU=
M
> **ps)
> > > +-{
> > > +-      if (pr !=3D NULL)
> > > +-              *pr =3D sig->r;
> > > +-      if (ps !=3D NULL)
> > > +-              *ps =3D sig->s;
> > > +-}
> > > +-#endif /* HAVE_ECDSA_SIG_GET0 */
> > > +-
> > > +-#ifndef HAVE_ECDSA_SIG_SET0
> > > +-int
> > > +-ECDSA_SIG_set0(ECDSA_SIG *sig, BIGNUM *r, BIGNUM *s)
> > > +-{
> > > +-      if (r =3D=3D NULL || s =3D=3D NULL)
> > > +-              return 0;
> > > +-
> > > +-      BN_clear_free(sig->r);
> > > +-      BN_clear_free(sig->s);
> > > +-      sig->r =3D r;
> > > +-      sig->s =3D s;
> > > +-      return 1;
> > > +-}
> > > +-#endif /* HAVE_ECDSA_SIG_SET0 */
> > > +-#endif /* OPENSSL_HAS_ECC */
> > > +-
> > > +-#ifndef HAVE_DH_GET0_PQG
> > > +-void
> > > +-DH_get0_pqg(const DH *dh, const BIGNUM **p, const BIGNUM **q, const
> BIGNUM **g)
> > > +-{
> > > +-      if (p !=3D NULL)
> > > +-              *p =3D dh->p;
> > > +-      if (q !=3D NULL)
> > > +-              *q =3D dh->q;
> > > +-      if (g !=3D NULL)
> > > +-              *g =3D dh->g;
> > > +-}
> > > +-#endif /* HAVE_DH_GET0_PQG */
> > > +-
> > > +-#ifndef HAVE_DH_SET0_PQG
> > > +-int
> > > +-DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g)
> > > +-{
> > > +-      if ((dh->p =3D=3D NULL && p =3D=3D NULL) || (dh->g =3D=3D NUL=
L && g =3D=3D
> NULL))
> > > +-              return 0;
> > > +-
> > > +-      if (p !=3D NULL) {
> > > +-              BN_free(dh->p);
> > > +-              dh->p =3D p;
> > > +-      }
> > > +-      if (q !=3D NULL) {
> > > +-              BN_free(dh->q);
> > > +-              dh->q =3D q;
> > > +-      }
> > > +-      if (g !=3D NULL) {
> > > +-              BN_free(dh->g);
> > > +-              dh->g =3D g;
> > > +-      }
> > > +-
> > > +-      return 1;
> > > +-}
> > > +-#endif /* HAVE_DH_SET0_PQG */
> > > +-
> > > +-#ifndef HAVE_DH_GET0_KEY
> > > +-void
> > > +-DH_get0_key(const DH *dh, const BIGNUM **pub_key, const BIGNUM
> **priv_key)
> > > +-{
> > > +-      if (pub_key !=3D NULL)
> > > +-              *pub_key =3D dh->pub_key;
> > > +-      if (priv_key !=3D NULL)
> > > +-              *priv_key =3D dh->priv_key;
> > > +-}
> > > +-#endif /* HAVE_DH_GET0_KEY */
> > > +-
> > > +-#ifndef HAVE_DH_SET0_KEY
> > > +-int
> > > +-DH_set0_key(DH *dh, BIGNUM *pub_key, BIGNUM *priv_key)
> > > +-{
> > > +-      if (pub_key !=3D NULL) {
> > > +-              BN_free(dh->pub_key);
> > > +-              dh->pub_key =3D pub_key;
> > > +-      }
> > > +-      if (priv_key !=3D NULL) {
> > > +-              BN_free(dh->priv_key);
> > > +-              dh->priv_key =3D priv_key;
> > > +-      }
> > > +-
> > > +-      return 1;
> > > +-}
> > > +-#endif /* HAVE_DH_SET0_KEY */
> > > +-
> > > +-#ifndef HAVE_DH_SET_LENGTH
> > > +-int
> > > +-DH_set_length(DH *dh, long length)
> > > +-{
> > > +-      if (length < 0 || length > INT_MAX)
> > > +-              return 0;
> > > +-
> > > +-      dh->length =3D length;
> > > +-      return 1;
> > > +-}
> > > +-#endif /* HAVE_DH_SET_LENGTH */
> > > +-
> > > +-#ifndef HAVE_RSA_METH_FREE
> > > +-void
> > > +-RSA_meth_free(RSA_METHOD *meth)
> > > +-{
> > > +-      if (meth !=3D NULL) {
> > > +-              free((char *)meth->name);
> > > +-              free(meth);
> > > +-      }
> > > +-}
> > > +-#endif /* HAVE_RSA_METH_FREE */
> > > +-
> > > +-#ifndef HAVE_RSA_METH_DUP
> > > +-RSA_METHOD *
> > > +-RSA_meth_dup(const RSA_METHOD *meth)
> > > +-{
> > > +-      RSA_METHOD *copy;
> > > +-
> > > +-      if ((copy =3D calloc(1, sizeof(*copy))) =3D=3D NULL)
> > > +-              return NULL;
> > > +-      memcpy(copy, meth, sizeof(*copy));
> > > +-      if ((copy->name =3D strdup(meth->name)) =3D=3D NULL) {
> > > +-              free(copy);
> > > +-              return NULL;
> > > +-      }
> > > +-
> > > +-      return copy;
> > > +-}
> > > +-#endif /* HAVE_RSA_METH_DUP */
> > > +-
> > > +-#ifndef HAVE_RSA_METH_SET1_NAME
> > > +-int
> > > +-RSA_meth_set1_name(RSA_METHOD *meth, const char *name)
> > > +-{
> > > +-      char *copy;
> > > +-
> > > +-      if ((copy =3D strdup(name)) =3D=3D NULL)
> > > +-              return 0;
> > > +-      free((char *)meth->name);
> > > +-      meth->name =3D copy;
> > > +-      return 1;
> > > +-}
> > > +-#endif /* HAVE_RSA_METH_SET1_NAME */
> > > +-
> > > +-#ifndef HAVE_RSA_METH_GET_FINISH
> > > +-int
> > > +-(*RSA_meth_get_finish(const RSA_METHOD *meth))(RSA *rsa)
> > > +-{
> > > +-      return meth->finish;
> > > +-}
> > > +-#endif /* HAVE_RSA_METH_GET_FINISH */
> > > +-
> > > +-#ifndef HAVE_RSA_METH_SET_PRIV_ENC
> > > +-int
> > > +-RSA_meth_set_priv_enc(RSA_METHOD *meth, int (*priv_enc)(int flen,
> > > +-    const unsigned char *from, unsigned char *to, RSA *rsa, int
> padding))
> > > +-{
> > > +-      meth->rsa_priv_enc =3D priv_enc;
> > > +-      return 1;
> > > +-}
> > > +-#endif /* HAVE_RSA_METH_SET_PRIV_ENC */
> > > +-
> > > +-#ifndef HAVE_RSA_METH_SET_PRIV_DEC
> > > +-int
> > > +-RSA_meth_set_priv_dec(RSA_METHOD *meth, int (*priv_dec)(int flen,
> > > +-    const unsigned char *from, unsigned char *to, RSA *rsa, int
> padding))
> > > +-{
> > > +-      meth->rsa_priv_dec =3D priv_dec;
> > > +-      return 1;
> > > +-}
> > > +-#endif /* HAVE_RSA_METH_SET_PRIV_DEC */
> > > +-
> > > +-#ifndef HAVE_RSA_METH_SET_FINISH
> > > +-int
> > > +-RSA_meth_set_finish(RSA_METHOD *meth, int (*finish)(RSA *rsa))
> > > +-{
> > > +-      meth->finish =3D finish;
> > > +-      return 1;
> > > +-}
> > > +-#endif /* HAVE_RSA_METH_SET_FINISH */
> > > +-
> > > +-#ifndef HAVE_EVP_PKEY_GET0_RSA
> > > +-RSA *
> > > +-EVP_PKEY_get0_RSA(EVP_PKEY *pkey)
> > > +-{
> > > +-      if (pkey->type !=3D EVP_PKEY_RSA) {
> > > +-              /* EVPerror(EVP_R_EXPECTING_AN_RSA_KEY); */
> > > +-              return NULL;
> > > +-      }
> > > +-      return pkey->pkey.rsa;
> > > +-}
> > > +-#endif /* HAVE_EVP_PKEY_GET0_RSA */
> > > +-
> > > +-#ifndef HAVE_EVP_MD_CTX_NEW
> > > +-EVP_MD_CTX *
> > > +-EVP_MD_CTX_new(void)
> > > +-{
> > > +-      return calloc(1, sizeof(EVP_MD_CTX));
> > > +-}
> > > +-#endif /* HAVE_EVP_MD_CTX_NEW */
> > > +-
> > > +-#ifndef HAVE_EVP_MD_CTX_FREE
> > > +-void
> > > +-EVP_MD_CTX_free(EVP_MD_CTX *ctx)
> > > +-{
> > > +-      if (ctx =3D=3D NULL)
> > > +-              return;
> > > +-
> > > +-      EVP_MD_CTX_cleanup(ctx);
> > > +-
> > > +-      free(ctx);
> > > +-}
> > > +-#endif /* HAVE_EVP_MD_CTX_FREE */
> > > +-
> > > + #endif /* WITH_OPENSSL */
> > > +diff --git a/openbsd-compat/openssl-compat.h
> b/openbsd-compat/openssl-compat.h
> > > +index 61a69dd56eb..d0dd2c3450d 100644
> > > +--- a/openbsd-compat/openssl-compat.h
> > > ++++ b/openbsd-compat/openssl-compat.h
> > > +@@ -33,26 +33,13 @@
> > > + int ssh_compatible_openssl(long, long);
> > > + void ssh_libcrypto_init(void);
> > > +
> > > +-#if (OPENSSL_VERSION_NUMBER < 0x1000100fL)
> > > +-# error OpenSSL 1.0.1 or greater is required
> > > ++#if (OPENSSL_VERSION_NUMBER < 0x10100000L)
> > > ++# error OpenSSL 1.1.0 or greater is required
> > > + #endif
> > > +-
> > > +-#ifndef OPENSSL_VERSION
> > > +-# define OPENSSL_VERSION      SSLEAY_VERSION
> > > +-#endif
> > > +-
> > > +-#ifndef HAVE_OPENSSL_VERSION
> > > +-# define OpenSSL_version(x)   SSLeay_version(x)
> > > +-#endif
> > > +-
> > > +-#ifndef HAVE_OPENSSL_VERSION_NUM
> > > +-# define OpenSSL_version_num  SSLeay
> > > +-#endif
> > > +-
> > > +-#if OPENSSL_VERSION_NUMBER < 0x10000001L
> > > +-# define LIBCRYPTO_EVP_INL_TYPE unsigned int
> > > +-#else
> > > +-# define LIBCRYPTO_EVP_INL_TYPE size_t
> > > ++#ifdef LIBRESSL_VERSION_NUMBER
> > > ++# if LIBRESSL_VERSION_NUMBER < 0x3010000fL
> > > ++#  error LibreSSL 3.1.0 or greater is required
> > > ++# endif
> > > + #endif
> > > +
> > > + #ifndef OPENSSL_RSA_MAX_MODULUS_BITS
> > > +@@ -68,25 +55,6 @@ void ssh_libcrypto_init(void);
> > > + # endif
> > > + #endif
> > > +
> > > +-/* LibreSSL/OpenSSL 1.1x API compat */
> > > +-#ifndef HAVE_DSA_GET0_PQG
> > > +-void DSA_get0_pqg(const DSA *d, const BIGNUM **p, const BIGNUM **q,
> > > +-    const BIGNUM **g);
> > > +-#endif /* HAVE_DSA_GET0_PQG */
> > > +-
> > > +-#ifndef HAVE_DSA_SET0_PQG
> > > +-int DSA_set0_pqg(DSA *d, BIGNUM *p, BIGNUM *q, BIGNUM *g);
> > > +-#endif /* HAVE_DSA_SET0_PQG */
> > > +-
> > > +-#ifndef HAVE_DSA_GET0_KEY
> > > +-void DSA_get0_key(const DSA *d, const BIGNUM **pub_key,
> > > +-    const BIGNUM **priv_key);
> > > +-#endif /* HAVE_DSA_GET0_KEY */
> > > +-
> > > +-#ifndef HAVE_DSA_SET0_KEY
> > > +-int DSA_set0_key(DSA *d, BIGNUM *pub_key, BIGNUM *priv_key);
> > > +-#endif /* HAVE_DSA_SET0_KEY */
> > > +-
> > > + #ifndef HAVE_EVP_CIPHER_CTX_GET_IV
> > > + # ifdef HAVE_EVP_CIPHER_CTX_GET_UPDATED_IV
> > > + #  define EVP_CIPHER_CTX_get_iv EVP_CIPHER_CTX_get_updated_iv
> > > +@@ -101,112 +69,5 @@ int EVP_CIPHER_CTX_set_iv(EVP_CIPHER_CTX *ctx,
> > > +     const unsigned char *iv, size_t len);
> > > + #endif /* HAVE_EVP_CIPHER_CTX_SET_IV */
> > > +
> > > +-#ifndef HAVE_RSA_GET0_KEY
> > > +-void RSA_get0_key(const RSA *r, const BIGNUM **n, const BIGNUM **e,
> > > +-    const BIGNUM **d);
> > > +-#endif /* HAVE_RSA_GET0_KEY */
> > > +-
> > > +-#ifndef HAVE_RSA_SET0_KEY
> > > +-int RSA_set0_key(RSA *r, BIGNUM *n, BIGNUM *e, BIGNUM *d);
> > > +-#endif /* HAVE_RSA_SET0_KEY */
> > > +-
> > > +-#ifndef HAVE_RSA_GET0_CRT_PARAMS
> > > +-void RSA_get0_crt_params(const RSA *r, const BIGNUM **dmp1, const
> BIGNUM **dmq1,
> > > +-    const BIGNUM **iqmp);
> > > +-#endif /* HAVE_RSA_GET0_CRT_PARAMS */
> > > +-
> > > +-#ifndef HAVE_RSA_SET0_CRT_PARAMS
> > > +-int RSA_set0_crt_params(RSA *r, BIGNUM *dmp1, BIGNUM *dmq1, BIGNUM
> *iqmp);
> > > +-#endif /* HAVE_RSA_SET0_CRT_PARAMS */
> > > +-
> > > +-#ifndef HAVE_RSA_GET0_FACTORS
> > > +-void RSA_get0_factors(const RSA *r, const BIGNUM **p, const BIGNUM
> **q);
> > > +-#endif /* HAVE_RSA_GET0_FACTORS */
> > > +-
> > > +-#ifndef HAVE_RSA_SET0_FACTORS
> > > +-int RSA_set0_factors(RSA *r, BIGNUM *p, BIGNUM *q);
> > > +-#endif /* HAVE_RSA_SET0_FACTORS */
> > > +-
> > > +-#ifndef DSA_SIG_GET0
> > > +-void DSA_SIG_get0(const DSA_SIG *sig, const BIGNUM **pr, const
> BIGNUM **ps);
> > > +-#endif /* DSA_SIG_GET0 */
> > > +-
> > > +-#ifndef DSA_SIG_SET0
> > > +-int DSA_SIG_set0(DSA_SIG *sig, BIGNUM *r, BIGNUM *s);
> > > +-#endif /* DSA_SIG_SET0 */
> > > +-
> > > +-#ifdef OPENSSL_HAS_ECC
> > > +-#ifndef HAVE_ECDSA_SIG_GET0
> > > +-void ECDSA_SIG_get0(const ECDSA_SIG *sig, const BIGNUM **pr, const
> BIGNUM **ps);
> > > +-#endif /* HAVE_ECDSA_SIG_GET0 */
> > > +-
> > > +-#ifndef HAVE_ECDSA_SIG_SET0
> > > +-int ECDSA_SIG_set0(ECDSA_SIG *sig, BIGNUM *r, BIGNUM *s);
> > > +-#endif /* HAVE_ECDSA_SIG_SET0 */
> > > +-#endif /* OPENSSL_HAS_ECC */
> > > +-
> > > +-#ifndef HAVE_DH_GET0_PQG
> > > +-void DH_get0_pqg(const DH *dh, const BIGNUM **p, const BIGNUM **q,
> > > +-    const BIGNUM **g);
> > > +-#endif /* HAVE_DH_GET0_PQG */
> > > +-
> > > +-#ifndef HAVE_DH_SET0_PQG
> > > +-int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g);
> > > +-#endif /* HAVE_DH_SET0_PQG */
> > > +-
> > > +-#ifndef HAVE_DH_GET0_KEY
> > > +-void DH_get0_key(const DH *dh, const BIGNUM **pub_key, const BIGNUM
> **priv_key);
> > > +-#endif /* HAVE_DH_GET0_KEY */
> > > +-
> > > +-#ifndef HAVE_DH_SET0_KEY
> > > +-int DH_set0_key(DH *dh, BIGNUM *pub_key, BIGNUM *priv_key);
> > > +-#endif /* HAVE_DH_SET0_KEY */
> > > +-
> > > +-#ifndef HAVE_DH_SET_LENGTH
> > > +-int DH_set_length(DH *dh, long length);
> > > +-#endif /* HAVE_DH_SET_LENGTH */
> > > +-
> > > +-#ifndef HAVE_RSA_METH_FREE
> > > +-void RSA_meth_free(RSA_METHOD *meth);
> > > +-#endif /* HAVE_RSA_METH_FREE */
> > > +-
> > > +-#ifndef HAVE_RSA_METH_DUP
> > > +-RSA_METHOD *RSA_meth_dup(const RSA_METHOD *meth);
> > > +-#endif /* HAVE_RSA_METH_DUP */
> > > +-
> > > +-#ifndef HAVE_RSA_METH_SET1_NAME
> > > +-int RSA_meth_set1_name(RSA_METHOD *meth, const char *name);
> > > +-#endif /* HAVE_RSA_METH_SET1_NAME */
> > > +-
> > > +-#ifndef HAVE_RSA_METH_GET_FINISH
> > > +-int (*RSA_meth_get_finish(const RSA_METHOD *meth))(RSA *rsa);
> > > +-#endif /* HAVE_RSA_METH_GET_FINISH */
> > > +-
> > > +-#ifndef HAVE_RSA_METH_SET_PRIV_ENC
> > > +-int RSA_meth_set_priv_enc(RSA_METHOD *meth, int (*priv_enc)(int fle=
n,
> > > +-    const unsigned char *from, unsigned char *to, RSA *rsa, int
> padding));
> > > +-#endif /* HAVE_RSA_METH_SET_PRIV_ENC */
> > > +-
> > > +-#ifndef HAVE_RSA_METH_SET_PRIV_DEC
> > > +-int RSA_meth_set_priv_dec(RSA_METHOD *meth, int (*priv_dec)(int fle=
n,
> > > +-    const unsigned char *from, unsigned char *to, RSA *rsa, int
> padding));
> > > +-#endif /* HAVE_RSA_METH_SET_PRIV_DEC */
> > > +-
> > > +-#ifndef HAVE_RSA_METH_SET_FINISH
> > > +-int RSA_meth_set_finish(RSA_METHOD *meth, int (*finish)(RSA *rsa));
> > > +-#endif /* HAVE_RSA_METH_SET_FINISH */
> > > +-
> > > +-#ifndef HAVE_EVP_PKEY_GET0_RSA
> > > +-RSA *EVP_PKEY_get0_RSA(EVP_PKEY *pkey);
> > > +-#endif /* HAVE_EVP_PKEY_GET0_RSA */
> > > +-
> > > +-#ifndef HAVE_EVP_MD_CTX_new
> > > +-EVP_MD_CTX *EVP_MD_CTX_new(void);
> > > +-#endif /* HAVE_EVP_MD_CTX_new */
> > > +-
> > > +-#ifndef HAVE_EVP_MD_CTX_free
> > > +-void EVP_MD_CTX_free(EVP_MD_CTX *ctx);
> > > +-#endif /* HAVE_EVP_MD_CTX_free */
> > > +-
> > > + #endif /* WITH_OPENSSL */
> > > + #endif /* _OPENSSL_COMPAT_H */
> > > diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
> b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
> > > index 6057d055f4..1d53c2488b 100644
> > > --- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
> > > +++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
> > > @@ -26,6 +26,7 @@ SRC_URI =3D "
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fftp.op=
enbsd.org%2Fpub%2FOpenBSD%2FOpenSSH%2Fportable%2Fopenssh-%24&data=3D05%7C01=
%7CRanjitsinh.Rathod%40kpit.com%7Cd788d3aa157742dfacb008db61a20d08%7C353945=
1eb46e4a26a242ff61502855c7%7C0%7C0%7C638211120911246208%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3=
000%7C%7C%7C&sdata=3DdDzVG6aYgMYab04aGD%2F6l6tLxk2tzcSndFcqwlT%2FRg0%3D&res=
erved=3D0{PV}.tar
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fftp.o=
penbsd.org%2Fpub%2FOpenBSD%2FOpenSSH%2Fportable%2Fopenssh-%24&data=3D05%7C0=
1%7CRanjitsinh.Rathod%40kpit.com%7Cd788d3aa157742dfacb008db61a20d08%7C35394=
51eb46e4a26a242ff61502855c7%7C0%7C0%7C638211120911246208%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
3000%7C%7C%7C&sdata=3DdDzVG6aYgMYab04aGD%2F6l6tLxk2tzcSndFcqwlT%2FRg0%3D&re=
served=3D0%7BPV%7D.tar>
> > >             file://add-test-support-for-busybox.patch \
> > >             file://f107467179428a0e3ea9e4aa9738ac12ff02822d.patch \
> > >
> file://0001-Default-to-not-using-sandbox-when-cross-compiling.patch \
> > > +           file://7280401bdd77ca54be6867a154cc01e0d72612e0.patch \
> > >             "
> > >  SRC_URI[sha256sum] =3D
> "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7"
> > >
> > > --
> > > 2.17.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#181902):
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.openembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F181902&data=3D05%7C01=
%7CRanjitsinh.Rathod%40kpit.com%7Cd788d3aa157742dfacb008db61a20d08%7C353945=
1eb46e4a26a242ff61502855c7%7C0%7C0%7C638211120911246208%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3=
000%7C%7C%7C&sdata=3D3B6FWTx0mX6a%2F14mRs3CqIFrko671tih13RGrDhjfFc%3D&reser=
ved=3D0
> <https://lists.openembedded.org/g/openembedded-core/message/181902>
> > > Mute This Topic:
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.openembedded.org%2Fmt%2F99215252%2F1686489&data=3D05%7C01%7CRanjitsinh.Rat=
hod%40kpit.com%7Cd788d3aa157742dfacb008db61a20d08%7C3539451eb46e4a26a242ff6=
1502855c7%7C0%7C0%7C638211120911246208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdat=
a=3DwYwpf8EzfQo3bpSknW9TQF%2FbwKQcwgcGVrbnzT0%2Bcbc%3D&reserved=3D0
> <https://lists.openembedded.org/mt/99215252/1686489>
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe:
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=3D05%7C01%7CRanjitsi=
nh.Rathod%40kpit.com%7Cd788d3aa157742dfacb008db61a20d08%7C3539451eb46e4a26a=
242ff61502855c7%7C0%7C0%7C638211120911246208%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7=
C&sdata=3DEFlXzS8E9JdB5UV%2BHvW8sYJLH2BEn6Jc%2BAHB5iB8cUs%3D&reserved=3D0
> <https://lists.openembedded.org/g/openembedded-core/unsub> [
> alex.kanavin@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> > This message contains information that may be privileged or confidentia=
l
> and is the property of the KPIT Technologies Ltd. It is intended only for
> the person to whom it is addressed. If you are not the intended recipient=
,
> you are not authorized to read, print, retain copy, disseminate,
> distribute, or use this message or any part thereof. If you receive this
> message in error, please notify the sender immediately and delete all
> copies of this message. KPIT Technologies Ltd. does not accept any
> liability for virus infected mails.
> This message contains information that may be privileged or confidential
> and is the property of the KPIT Technologies Ltd. It is intended only for
> the person to whom it is addressed. If you are not the intended recipient=
,
> you are not authorized to read, print, retain copy, disseminate,
> distribute, or use this message or any part thereof. If you receive this
> message in error, please notify the sender immediately and delete all
> copies of this message. KPIT Technologies Ltd. does not accept any
> liability for virus infected mails.
>

--0000000000000143de05fcf95189
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello all,<br></div><div><br></div><div>Perhaps it wo=
uld be easier to adjust the LICENSE entry in the openssh recipe for all aff=
ected oe-core branches, with appropriate comment next to that entry (becaus=
e it would have to be again adjusted once new openssh is released)? Is your=
 goal to avoid the license, or simply to ensure it is correctly specified?<=
br></div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 31 May 2023 at 10:36, Ra=
njitsinh Rathod &lt;<a href=3D"mailto:Ranjitsinh.Rathod@kpit.com">Ranjitsin=
h.Rathod@kpit.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div class=3D"msg985507573848848757">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Hi=C2=A0Alexander,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Let me explain a bit more here.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Below upstream commit removed BSD-4-Clause from the LICENSE variable, But a=
ctually if we check from the source code of the openssh for this version (8=
.9p1), there are some files (<b style=3D"color:rgb(102,102,102);background-=
color:rgb(255,255,255)">openbsd-compat/libressl-api-compat.c</b>)
 still affected and so this is wrong as per me.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Link:=C2=A0<a href=3D"https://git.yoctoproject.org/poky/commit/?id=3D2c86f5=
86d55d0f6b99053e3e4d14c9ee36fa8aa8" id=3D"m_985507573848848757LPlnk238407" =
target=3D"_blank">https://git.yoctoproject.org/poky/commit/?id=3D2c86f586d5=
5d0f6b99053e3e4d14c9ee36fa8aa8</a></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<blockquote style=3D"border-color:rgb(200,200,200);border-left:3px solid rg=
b(200,200,200);padding-left:1ex;margin-left:0.8ex;color:rgb(102,102,102)">
~/sources/openssh-portable$ git branch
<div>* (HEAD detached at V_8_9_P1)</div>
<div>=C2=A0 master</div>
<div>~/sources/openssh-portable$ grep -rl &quot;All advertising materials m=
entioning features or use of this software&quot; *|grep -v \.1|grep -v \.5|=
grep -v \.8 | sort</div>
<div><b>openbsd-compat/libressl-api-compat.c</b></div>
</blockquote>
When we checked in the master branch, it seems the below commit from the op=
enssh is removing it and so to completely remove the BSD-4-Clause, below co=
mmit from the openssh is required.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Openssh commit:=C2=A0<a href=3D"https://github.com/openssh/openssh-portable=
/commit/7280401bdd77ca54be6867a154cc01e0d72612e0" id=3D"m_98550757384884875=
7LPlnk703217" target=3D"_blank">https://github.com/openssh/openssh-portable=
/commit/7280401bdd77ca54be6867a154cc01e0d72612e0</a></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
We can upstream this to both kirkstone as well as master branch. Please sug=
gest. As the version is different in both the branches, same change would g=
et not apply on both and so we need to send two different patches each for =
master and kirkstone.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
So currently the v3 patch for kirkstone is correct and can be applied and f=
or the master branch we can send another patch.</div>
<div id=3D"m_985507573848848757Signature">
<div>
<div></div>
<div></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<p style=3D"margin:0in;font-size:11pt;font-family:Calibri,sans-serif;text-a=
lign:start;color:rgb(32,31,30);background-color:rgb(255,255,255)">
<span style=3D"font-family:&quot;Work Sans&quot;;font-size:10pt;color:rgb(8=
9,89,89)"><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;fon=
t-size:16px;display:inline;color:rgb(0,0,0);background-color:rgb(255,255,25=
5)"><br>
</span></span></p>
<p style=3D"margin:0in;font-size:11pt;font-family:Calibri,sans-serif;text-a=
lign:start;color:rgb(32,31,30);background-color:rgb(255,255,255)">
<span style=3D"font-family:&quot;Work Sans&quot;;font-size:10pt;color:rgb(8=
9,89,89)"><span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;fon=
t-size:16px;display:inline;color:rgb(0,0,0);background-color:rgb(255,255,25=
5)">Thanks,</span><br>
</span></p>
<p style=3D"margin:0in;font-size:11pt;font-family:Calibri,sans-serif;text-a=
lign:start;color:rgb(32,31,30);background-color:rgb(255,255,255)">
<span style=3D"font-family:&quot;Work Sans&quot;;font-size:10pt;color:rgb(8=
9,89,89)">Best Regards,</span><br>
</p>
<p style=3D"margin:0in 0in 12pt;font-size:11pt;font-family:Calibri,sans-ser=
if;text-align:start;color:rgb(32,31,30);background-color:rgb(255,255,255)">
<span style=3D"margin:0px;font-family:&quot;Work Sans Medium&quot;;color:rg=
b(89,89,89)" lang=3D"EN-IN"><b>Ranjitsinh Rathod</b></span><span style=3D"m=
argin:0px;font-size:14pt;font-family:&quot;Work Sans&quot;;color:rgb(0,137,=
207)" lang=3D"EN-IN"><br>
</span><span style=3D"margin:0px;font-size:9pt;font-family:&quot;Work Sans&=
quot;;color:rgb(127,127,127)" lang=3D"EN-IN">Technical Leader |=C2=A0=C2=A0=
| KPIT Technologies Ltd.<br>
Cellphone: +91-84606 92403<br>
</span><b><sup><span style=3D"margin:0px;font-size:14pt;font-family:&quot;W=
ork Sans&quot;;color:rgb(176,255,69)" lang=3D"EN-IN">______________________=
____________________<br>
</span></sup></b><span style=3D"margin:0px;color:rgb(31,73,125)"><a href=3D=
"http://www.kpit.com/" rel=3D"noopener noreferrer" style=3D"margin:0px" tar=
get=3D"_blank"><span style=3D"margin:0px;font-size:12pt;font-family:&quot;W=
ork Sans Medium&quot;;color:gray" lang=3D"EN-IN">KPIT</span></a></span><spa=
n style=3D"margin:0px;font-family:&quot;Work Sans&quot;;color:gray"><span>=
=C2=A0</span></span><span style=3D"margin:0px;font-size:12pt;font-family:&q=
uot;Work Sans&quot;;color:gray" lang=3D"EN-IN">|</span><span style=3D"margi=
n:0px;font-size:9pt;font-family:&quot;Work Sans&quot;;color:gray" lang=3D"E=
N-IN"><span>=C2=A0</span></span><span style=3D"margin:0px;color:rgb(31,73,1=
25)"><a href=3D"http://www.kpit.com/linkedin" rel=3D"noopener noreferrer" s=
tyle=3D"margin:0px" target=3D"_blank"><span style=3D"margin:0px;font-size:9=
pt;font-family:&quot;Work Sans&quot;;color:gray" lang=3D"EN-IN">Follow
 us on LinkedIn</span></a></span><span style=3D"margin:0px;font-size:9pt;fo=
nt-family:&quot;Work Sans&quot;;color:rgb(89,89,89)"></span><span style=3D"=
margin:0px;font-size:12pt;font-family:&quot;Times New Roman&quot;,serif"></=
span></p>
<p style=3D"margin:0in;font-size:11pt;font-family:Calibri,sans-serif;text-a=
lign:start;color:rgb(32,31,30);background-color:rgb(255,255,255)">
<a href=3D"https://www.kpit.com/TheNewBrand" rel=3D"noopener noreferrer" st=
yle=3D"margin:0px" target=3D"_blank"><span style=3D"margin:0px;color:rgb(31=
,73,125)"><img style=3D"margin: 0px; width: 6.4687in; height: 1.25in;" src=
=3D"cid:18870f5c1ed4d4ea0eb1" width=3D"621" height=3D"120"></span></a></p>
</div>
</div>
</div>
</div>
<div id=3D"m_985507573848848757appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_985507573848848757divRplyFwdMsg" dir=3D"ltr"><font style=3D"fo=
nt-size:11pt" face=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> A=
lexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_b=
lank">alex.kanavin@gmail.com</a>&gt;<br>
<b>Sent:</b> Wednesday, May 31, 2023 12:11 PM<br>
<b>To:</b> Riyaz Ahmed Khan &lt;<a href=3D"mailto:Riyaz.Khan@kpit.com" targ=
et=3D"_blank">Riyaz.Khan@kpit.com</a>&gt;<br>
<b>Cc:</b> Riyaz Ahmed Khan &lt;<a href=3D"mailto:rak3033@gmail.com" target=
=3D"_blank">rak3033@gmail.com</a>&gt;; <a href=3D"mailto:openembedded-core@=
lists.openembedded.org" target=3D"_blank">openembedded-core@lists.openembed=
ded.org</a> &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.org"=
 target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;; Ranjit=
sinh Rathod &lt;<a href=3D"mailto:Ranjitsinh.Rathod@kpit.com" target=3D"_bl=
ank">Ranjitsinh.Rathod@kpit.com</a>&gt;; Steve Sakoman &lt;<a href=3D"mailt=
o:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt;<br>
<b>Subject:</b> Re: [OE-core][kirkstone][PATCH v3] openssh: Remove BSD-4-cl=
ause contents completely from codebase</font>
<div>=C2=A0</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>Caution: This email originated from outside of the KPIT. Do not click =
links or open attachments unless you recognize the sender and know the cont=
ent is safe.<br>
<br>
That is not how it works. If the issue exists in both master and<br>
kirkstone (which it does), it must be resolved in master first. Also<br>
&#39;resolves BSD-5 clause license issue&#39; does not explain what the iss=
ue<br>
is, and you need to provide a better explanation.<br>
<br>
Alex<br>
<br>
On Wed, 31 May 2023 at 07:49, Riyaz Ahmed Khan &lt;<a href=3D"mailto:Riyaz.=
Khan@kpit.com" target=3D"_blank">Riyaz.Khan@kpit.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Alex,<br>
&gt;<br>
&gt; As openssh is pointing to LTS branch in kirkstone and openssh is still=
 at 8.9 the usage of BSD-4 can be limited. Hence, we need=C2=A0 this patch =
to be integrated in kirkstone to resolve BSD-5 clause license issue for tha=
t the reason this patch has been created
 to backport and remove the BSD-4 clause license. In the master branch it i=
s closer to the latest version and can wait for the official openssh releas=
e, but I hope there will not be a release to kirkstone from master for this=
 reason we created this patch.<br>
&gt;<br>
&gt; Hi Steve,<br>
&gt;<br>
&gt; Please take this patch for kirkstone as it will resolve BSD-5 clause l=
icense issue.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Riyaz<br>
&gt;<br>
&gt; ________________________________<br>
&gt; From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; Sent: Tuesday, May 30, 2023 13:38<br>
&gt; To: Riyaz Ahmed Khan &lt;<a href=3D"mailto:rak3033@gmail.com" target=
=3D"_blank">rak3033@gmail.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"mai=
lto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembedde=
d-core@lists.openembedded.org</a>&gt;; Ranjitsinh Rathod &lt;<a href=3D"mai=
lto:Ranjitsinh.Rathod@kpit.com" target=3D"_blank">Ranjitsinh.Rathod@kpit.co=
m</a>&gt;; Riyaz Ahmed Khan &lt;<a href=3D"mailto:Riyaz.Khan@kpit.com" targ=
et=3D"_blank">Riyaz.Khan@kpit.com</a>&gt;<br>
&gt; Subject: Re: [OE-core][kirkstone][PATCH v3] openssh: Remove BSD-4-clau=
se contents completely from codebase<br>
&gt;<br>
&gt; Caution: This email originated from outside of the KPIT. Do not click =
links or open attachments unless you recognize the sender and know the cont=
ent is safe.<br>
&gt;<br>
&gt; What is the rationale for adding this patch to oe-core? Why can&#39;t =
this<br>
&gt; wait until openssh releases a version with this change?<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Tue, 30 May 2023 at 09:08, Riyaz Ahmed Khan &lt;<a href=3D"mailto:r=
ak3033@gmail.com" target=3D"_blank">rak3033@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; As upstream removed this BSD-4-clause license, there are still so=
me files<br>
&gt; &gt; has this license. Below file affected by this BSD-4-clause conten=
ts when<br>
&gt; &gt; below command is executed<br>
&gt; &gt; grep -rl &quot;All advertising materials mentioning features or u=
se of this software&quot;<br>
&gt; &gt; *|grep -v \.1|grep -v \.5|grep -v \.8 | sort openbsd-compat/libre=
ssl-api-compat.c<br>
&gt; &gt;<br>
&gt; &gt; All advertising materials mentioning features or use of this soft=
ware<br>
&gt; &gt;<br>
&gt; &gt; Openssh upstream removes the bsd-4 license compeletely from this =
commit<br>
&gt; &gt; <a href=3D"https://github.com/openssh/openssh-portable/commit/728=
0401bdd77ca54be6867a154cc01e0d72612e0" target=3D"_blank">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fopenssh%2Fopenssh-portable%2Fcommit%2F7280401bdd77ca54be6867a154cc01e=
0d72612e0&amp;data=3D05%7C01%7CRanjitsinh.Rathod%40kpit.com%7Cd788d3aa15774=
2dfacb008db61a20d08%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6382111209=
11246208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DAiOVMsuUKtG5WkExJNwIVa=
M9rqrHXXMg0c8WziS9yHQ%3D&amp;reserved=3D0</a><br>
&gt; &gt; Hence, Remove and backport this commit completely to remove licen=
se of BSD-4-clause<br>
&gt; &gt; contents from codebase. Hunks are refreshed, removed couple of hu=
nks from<br>
&gt; &gt; <a href=3D"http://configure.ac" target=3D"_blank">configure.ac</a=
> and openbsd-compat/libressl-api-compat.c as hunk code<br>
&gt; &gt; is not prasent.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Riyaz Khan &lt;<a href=3D"mailto:Riyaz.Khan@kpit.c=
om" target=3D"_blank">Riyaz.Khan@kpit.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 ...401bdd77ca54be6867a154cc01e0d72612e0.patch | 984 +++++++=
+++++++++++<br>
&gt; &gt;=C2=A0 .../openssh/<a href=3D"http://openssh_8.9p1.bb" target=3D"_=
blank">openssh_8.9p1.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +<br=
>
&gt; &gt;=C2=A0 2 files changed, 985 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-connectivity/openssh/openss=
h/7280401bdd77ca54be6867a154cc01e0d72612e0.patch<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-connectivity/openssh/openssh/7280401bdd=
77ca54be6867a154cc01e0d72612e0.patch b/meta/recipes-connectivity/openssh/op=
enssh/7280401bdd77ca54be6867a154cc01e0d72612e0.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..ebdff1ffe4<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-connectivity/openssh/openssh/7280401bdd77ca54b=
e6867a154cc01e0d72612e0.patch<br>
&gt; &gt; @@ -0,0 +1,984 @@<br>
&gt; &gt; +From 7280401bdd77ca54be6867a154cc01e0d72612e0 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: Damien Miller &lt;<a href=3D"mailto:djm@mindrot.org" targe=
t=3D"_blank">djm@mindrot.org</a>&gt;<br>
&gt; &gt; +Date: Fri, 24 Mar 2023 13:56:25 +1100<br>
&gt; &gt; +Subject: [PATCH] remove support for old libcrypto<br>
&gt; &gt; +<br>
&gt; &gt; +OpenSSH now requires LibreSSL 3.1.0 or greater or<br>
&gt; &gt; +OpenSSL 1.1.1 or greater<br>
&gt; &gt; +<br>
&gt; &gt; +with/ok dtucker@<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Backport [<a href=3D"https://github.com/openssh=
/openssh-portable/commit/7280401bdd77ca54be6867a154cc01e0d72612e0" target=
=3D"_blank">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fgithub.com%2Fopenssh%2Fopenssh-portable%2Fcommit%2F7280401bdd77ca54be6=
867a154cc01e0d72612e0&amp;data=3D05%7C01%7CRanjitsinh.Rathod%40kpit.com%7Cd=
788d3aa157742dfacb008db61a20d08%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%=
7C638211120911246208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DAiOVMsuUKt=
G5WkExJNwIVaM9rqrHXXMg0c8WziS9yHQ%3D&amp;reserved=3D0</a>]<br>
&gt; &gt; +Comment: Hunk are refreshed, removed couple of hunks from <a hre=
f=3D"http://configure.ac" target=3D"_blank">configure.ac</a> as hunk code i=
s not prasent<br>
&gt; &gt; +and backported to the existing code.<br>
&gt; &gt; +Signed-off-by: Riyaz Khan &lt;<a href=3D"mailto:Riyaz.Khan@kpit.=
com" target=3D"_blank">Riyaz.Khan@kpit.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +---<br>
&gt; &gt; + .github/workflows/c-cpp.yml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 -<br>
&gt; &gt; + INSTALL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-<br>
&gt; &gt; + cipher-aes.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-<br>
&gt; &gt; + <a href=3D"http://configure.ac" target=3D"_blank">configure.ac<=
/a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 96 ++---<br>
&gt; &gt; + openbsd-compat/libressl-api-compat.c | 556 +-------------------=
-------<br>
&gt; &gt; + openbsd-compat/openssl-compat.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
 151 +-------<br>
&gt; &gt; + 6 files changed, 40 insertions(+), 780 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/.github/workflows/c-cpp.yml b/.github/workflows/c-c=
pp.yml<br>
&gt; &gt; +index 3d9aa22dba5..d299a32468d 100644<br>
&gt; &gt; +--- a/.github/workflows/c-cpp.yml<br>
&gt; &gt; ++++ b/.github/workflows/c-cpp.yml<br>
&gt; &gt; +@@ -40,18 +40,11 @@<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - {=
 os: ubuntu-20.04, configs: tcmalloc }<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - {=
 os: ubuntu-20.04, configs: musl }<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - {=
 os: ubuntu-latest, configs: libressl-master }<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - { os: =
ubuntu-latest, configs: libressl-2.2.9 }<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - { os: =
ubuntu-latest, configs: libressl-2.8.3 }<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - { os: =
ubuntu-latest, configs: libressl-3.0.2 }<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - {=
 os: ubuntu-latest, configs: libressl-3.2.6 }<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - {=
 os: ubuntu-latest, configs: libressl-3.3.4 }<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - {=
 os: ubuntu-latest, configs: libressl-3.4.1 }<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - {=
 os: ubuntu-latest, configs: openssl-master }<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - {=
 os: ubuntu-latest, configs: openssl-noec }<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - { os: =
ubuntu-latest, configs: openssl-1.0.1 }<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - { os: =
ubuntu-latest, configs: openssl-1.0.1u }<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - { os: =
ubuntu-latest, configs: openssl-1.0.2u }<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - { os: =
ubuntu-latest, configs: openssl-1.1.0h }<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - {=
 os: ubuntu-latest, configs: openssl-1.1.1 }<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - {=
 os: ubuntu-latest, configs: openssl-1.1.1k }<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - {=
 os: ubuntu-latest, configs: openssl-3.0.0 }<br>
&gt; &gt; +diff --git a/INSTALL b/INSTALL<br>
&gt; &gt; +index 68b15e13190..f99d1e2a809 100644<br>
&gt; &gt; +--- a/INSTALL<br>
&gt; &gt; ++++ b/INSTALL<br>
&gt; &gt; +@@ -21,12 +21,8 @@ <a href=3D"https://zlib.net/" target=3D"_blan=
k">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fzlib=
.net%2F&amp;data=3D05%7C01%7CRanjitsinh.Rathod%40kpit.com%7Cd788d3aa157742d=
facb008db61a20d08%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638211120911=
246208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DgazTCzbsb8yEsXaj1Vn9FGK6=
t4V1Fop5t8tPb%2BWqUns%3D&amp;reserved=3D0</a><br>
&gt; &gt; +<br>
&gt; &gt; + libcrypto from either of LibreSSL or OpenSSL.=C2=A0 Building wi=
thout libcrypto<br>
&gt; &gt; + is supported but severely restricts the available ciphers and a=
lgorithms.<br>
&gt; &gt; +- - LibreSSL (<a href=3D"https://www.libressl.org/" target=3D"_b=
lank">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww.libressl.org%2F&amp;data=3D05%7C01%7CRanjitsinh.Rathod%40kpit.com%7Cd788=
d3aa157742dfacb008db61a20d08%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6=
38211120911246208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM=
zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DCmw7m41lEsAw3=
CFeFKL1R8u%2Bbu%2FWslzOq%2BhS%2FEkXohg%3D&amp;reserved=3D0</a>)<br>
&gt; &gt; +- - OpenSSL (<a href=3D"https://www.openssl.org/" target=3D"_bla=
nk">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww=
.openssl.org%2F&amp;data=3D05%7C01%7CRanjitsinh.Rathod%40kpit.com%7Cd788d3a=
a157742dfacb008db61a20d08%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6382=
11120911246208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DJIzbanv8OPCrZyGk=
B%2B%2BqyNgDfk72Qy2BmB9LAIS%2FTKk%3D&amp;reserved=3D0</a>)
 with any of the following versions:<br>
&gt; &gt; +-=C2=A0=C2=A0 - 1.0.x &gt;=3D 1.0.1 or 1.1.0 &gt;=3D 1.1.0g or a=
ny 1.1.1<br>
&gt; &gt; +-<br>
&gt; &gt; +-Note that due to a bug in EVP_CipherInit OpenSSL 1.1 versions p=
rior to<br>
&gt; &gt; +-1.1.0g can&#39;t be used.<br>
&gt; &gt; ++ - LibreSSL (<a href=3D"https://www.libressl.org/" target=3D"_b=
lank">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww.libressl.org%2F&amp;data=3D05%7C01%7CRanjitsinh.Rathod%40kpit.com%7Cd788=
d3aa157742dfacb008db61a20d08%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6=
38211120911246208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM=
zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DCmw7m41lEsAw3=
CFeFKL1R8u%2Bbu%2FWslzOq%2BhS%2FEkXohg%3D&amp;reserved=3D0</a>)
 3.1.0 or greater<br>
&gt; &gt; ++ - OpenSSL (<a href=3D"https://www.openssl.org/" target=3D"_bla=
nk">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww=
.openssl.org%2F&amp;data=3D05%7C01%7CRanjitsinh.Rathod%40kpit.com%7Cd788d3a=
a157742dfacb008db61a20d08%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6382=
11120911246208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DJIzbanv8OPCrZyGk=
B%2B%2BqyNgDfk72Qy2BmB9LAIS%2FTKk%3D&amp;reserved=3D0</a>)
 1.1.1 or greater<br>
&gt; &gt; +<br>
&gt; &gt; + LibreSSL/OpenSSL should be compiled as a position-independent l=
ibrary<br>
&gt; &gt; + (i.e. -fPIC, eg by configuring OpenSSL as &quot;./config [optio=
ns] -fPIC&quot;<br>
&gt; &gt; +diff --git a/cipher-aes.c b/cipher-aes.c<br>
&gt; &gt; +index 8b101727284..87c763353d8 100644<br>
&gt; &gt; +--- a/cipher-aes.c<br>
&gt; &gt; ++++ b/cipher-aes.c<br>
&gt; &gt; +@@ -69,7 +69,7 @@ ssh_rijndael_init(EVP_CIPHER_CTX *ctx, const u=
_char *key, const u_char *iv,<br>
&gt; &gt; +<br>
&gt; &gt; + static int<br>
&gt; &gt; + ssh_rijndael_cbc(EVP_CIPHER_CTX *ctx, u_char *dest, const u_cha=
r *src,<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 LIBCRYPTO_EVP_INL_TYPE len)<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 size_t len)<br>
&gt; &gt; + {<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ssh_rijndael_ctx *c;=
<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u_char buf[RIJNDAEL_BLOCKSI=
ZE];<br>
&gt; &gt; +diff --git a/<a href=3D"http://configure.ac" target=3D"_blank">c=
onfigure.ac</a> b/<a href=3D"http://configure.ac" target=3D"_blank">configu=
re.ac</a><br>
&gt; &gt; +index 22fee70f604..1c0ccdf19c5 100644<br>
&gt; &gt; +--- a/<a href=3D"http://configure.ac" target=3D"_blank">configur=
e.ac</a><br>
&gt; &gt; ++++ b/<a href=3D"http://configure.ac" target=3D"_blank">configur=
e.ac</a><br>
&gt; &gt; +@@ -2744,42 +2744,40 @@<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #include &lt;openssl/crypto=
.h&gt;<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #define DATA &quot;conftest=
.ssllibver&quot;<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ]], [[<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 FILE *fd;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 int rc;<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 FILE *f;<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 fd =3D fopen(DATA,&quot;w&quot;);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if(fd =3D=3D NULL)<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if ((f =3D fopen(DATA, &quot;w&quot;)) =3D=3D NULL)<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit(=
1);<br>
&gt; &gt; +-#ifndef OPENSSL_VERSION<br>
&gt; &gt; +-# define OPENSSL_VERSION SSLEAY_VERSION<br>
&gt; &gt; +-#endif<br>
&gt; &gt; +-#ifndef HAVE_OPENSSL_VERSION<br>
&gt; &gt; +-# define OpenSSL_version=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SSLeay_v=
ersion<br>
&gt; &gt; +-#endif<br>
&gt; &gt; +-#ifndef HAVE_OPENSSL_VERSION_NUM<br>
&gt; &gt; +-# define OpenSSL_version_num=C2=A0 SSLeay<br>
&gt; &gt; +-#endif<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if ((rc =3D fprintf(fd, &quot;%08lx (%s)\n&quot;,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (fprintf(f, &quot;%08lx (%s)&quot;,<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (unsigned long)OpenSSL_versio=
n_num(),<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OpenSSL_version(OPENSSL_VERSION))) =
&lt; 0)<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OpenSSL_version(OPENSSL_VERSION)) &=
lt; 0)<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit(1);<br=
>
&gt; &gt; ++#ifdef LIBRESSL_VERSION_NUMBER<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (fprintf(f, &quot; libressl-%08lx&quot;, LIBRESSL_VERSIO=
N_NUMBER) &lt; 0)<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit(1);<br=
>
&gt; &gt; ++#endif<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (fputc(&#39;\n&#39;, f) =3D=3D EOF || fclose(f) =3D=3D E=
OF)<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit(=
1);<br>
&gt; &gt; +-<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 exit(0);<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ]])],<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 [<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ssl_library=
_ver=3D`cat conftest.ssllibver`<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sslver=3D`c=
at conftest.ssllibver`<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ssl_showver=
=3D`echo &quot;$sslver&quot; | sed &#39;s/ libressl-.*//&#39;`<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Che=
ck version is supported.<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case &quot;=
$ssl_library_ver&quot; in<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10000*|0*)<=
br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AC_MSG_ERROR([OpenSSL &gt;=3D 1.0.1 re=
quired (have &quot;$ssl_library_ver&quot;)])<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 100*)=C2=A0=
=C2=A0 ;; # 1.0.x<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 101000[[012=
3456]]*)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # <a href=3D"https://github.com/openss=
l/openssl/pull/4613" target=3D"_blank">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fopenssl%2Fopenssl%2Fpull%2F4613&amp;data=3D05%7C01%7CRanjitsinh.Ratho=
d%40kpit.com%7Cd788d3aa157742dfacb008db61a20d08%7C3539451eb46e4a26a242ff615=
02855c7%7C0%7C0%7C638211120911246208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sd=
ata=3DdJwZf4dbh%2FT3T5kfAA4%2FAXjZEhsAx5Rzay3Nq9Z0nK0%3D&amp;reserved=3D0</=
a><br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AC_MSG_ERROR([OpenSSL 1.1.x versions p=
rior to 1.1.0g have a bug that breaks their use with OpenSSH (have &quot;$s=
sl_library_ver&quot;)])<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case &quot;=
$sslver&quot; in<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 100*|10100*=
) # 1.0.x, 1.1.0x<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AC_MSG_ERROR([OpenSSL &gt;=3D 1.1.1 re=
quired (have &quot;$ssl_showver&quot;)])<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 101*)=
=C2=A0=C2=A0 ;; # 1.1.x<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 200*)=C2=A0=
=C2=A0 ;; # LibreSSL<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 200*)=C2=A0=
=C2=A0 # LibreSSL<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lver=3D`echo &quot;$sslver&quot; | sed=
 &#39;s/.*libressl-//&#39;`<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case &quot;$lver&quot; in<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2*|300*) # 2.x, 3.0.0<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 AC_MSG_ERROR([LibreSSL &gt;=3D 3.1.0 required (have &quot;$ssl_sh=
owver&quot;)])<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ;;<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *) ;;=C2=A0=C2=A0 # Assume all other v=
ersions are good.<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 esac<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 300*)=
=C2=A0=C2=A0 ;; # OpenSSL 3<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 301*)=
=C2=A0=C2=A0 ;; # OpenSSL development branch.<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *)<br=
>
&gt; &gt; +@@ -2781,10 +2781,10 @@<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 300*)=
=C2=A0=C2=A0 ;; # OpenSSL 3<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 301*)=
=C2=A0=C2=A0 ;; # OpenSSL development branch.<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *)<br=
>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AC_MSG_ERROR([Unknown/unsupported Open=
SSL version (&quot;$ssl_library_ver&quot;)])<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AC_MSG_ERROR([Unknown/unsupported Open=
SSL version (&quot;$ssl_showver&quot;)])<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ;;<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 esac<=
br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AC_MSG_RESU=
LT([$ssl_library_ver])<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AC_MSG_RESU=
LT([$ssl_showver])<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ],<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 [<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AC_MS=
G_RESULT([not found])<br>
&gt; &gt; +@@ -2804,9 +2804,6 @@<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #include &lt;openssl/openss=
lv.h&gt;<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #include &lt;openssl/crypto=
.h&gt;<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ]], [[<br>
&gt; &gt; +-#ifndef HAVE_OPENSSL_VERSION_NUM<br>
&gt; &gt; +-# define OpenSSL_version_num=C2=A0 SSLeay<br>
&gt; &gt; +-#endif<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 exit(OpenSSL_version_num() =3D=3D OPENSSL_VERSION_NUM=
BER ? 0 : 1);<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ]])],<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 [<br>
&gt; &gt; +@@ -2881,44 +2878,13 @@<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )<b=
r>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # LibreSSL/OpenSSL 1.1x API<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # LibreSSL/OpenSSL API differenc=
es<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AC_CHECK_FUNCS([ \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 OPENSSL_init_crypto \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 DH_get0_key \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 DH_get0_pqg \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 DH_set0_key \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 DH_set_length \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 DH_set0_pqg \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 DSA_get0_key \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 DSA_get0_pqg \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 DSA_set0_key \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 DSA_set0_pqg \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 DSA_SIG_get0 \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 DSA_SIG_set0 \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ECDSA_SIG_get0 \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ECDSA_SIG_set0 \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 EVP_CIPHER_CTX_iv \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 EVP_CIPHER_CTX_iv_noconst \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 EVP_CIPHER_CTX_get_iv \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 EVP_CIPHER_CTX_get_updated_iv \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 EVP_CIPHER_CTX_set_iv \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 RSA_get0_crt_params \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 RSA_get0_factors \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 RSA_get0_key \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 RSA_set0_crt_params \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 RSA_set0_factors \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 RSA_set0_key \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 RSA_meth_free \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 RSA_meth_dup \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 RSA_meth_set1_name \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 RSA_meth_get_finish \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 RSA_meth_set_priv_enc \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 RSA_meth_set_priv_dec \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 RSA_meth_set_finish \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 EVP_PKEY_get0_RSA \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 EVP_MD_CTX_new \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 EVP_MD_CTX_free \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 EVP_chacha20 \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ])<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if test &quot;x$openssl_eng=
ine&quot; =3D &quot;xyes&quot; ; then<br>
&gt; &gt; +@@ -3040,8 +3006,8 @@<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AC_CHECK_FUNCS([crypt DES_c=
rypt])<br>
&gt; &gt; +<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Check for SHA256, SHA384 and S=
HA512 support in OpenSSL<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AC_CHECK_FUNCS([EVP_sha256 EVP_s=
ha384 EVP_sha512])<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Check for various EVP support =
in OpenSSL<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AC_CHECK_FUNCS([EVP_sha256 EVP_s=
ha384 EVP_sha512 EVP_chacha20])<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Check complete ECC suppor=
t in OpenSSL<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AC_MSG_CHECKING([whether Op=
enSSL has NID_X9_62_prime256v1])<br>
&gt; &gt; +diff --git a/openbsd-compat/libressl-api-compat.c b/openbsd-comp=
at/libressl-api-compat.c<br>
&gt; &gt; +index 498180dc894..59be17397c5 100644<br>
&gt; &gt; +--- a/openbsd-compat/libressl-api-compat.c<br>
&gt; &gt; ++++ b/openbsd-compat/libressl-api-compat.c<br>
&gt; &gt; +@@ -1,129 +1,5 @@<br>
&gt; &gt; +-/* $OpenBSD: dsa_lib.c,v 1.29 2018/04/14 07:09:21 tb Exp $ */<b=
r>
&gt; &gt; +-/* $OpenBSD: rsa_lib.c,v 1.37 2018/04/14 07:09:21 tb Exp $ */<b=
r>
&gt; &gt; +-/* $OpenBSD: evp_lib.c,v 1.17 2018/09/12 06:35:38 djm Exp $ */<=
br>
&gt; &gt; +-/* $OpenBSD: dh_lib.c,v 1.32 2018/05/02 15:48:38 tb Exp $ */<br=
>
&gt; &gt; +-/* $OpenBSD: p_lib.c,v 1.24 2018/05/30 15:40:50 tb Exp $ */<br>
&gt; &gt; +-/* $OpenBSD: digest.c,v 1.30 2018/04/14 07:09:21 tb Exp $ */<br=
>
&gt; &gt; +-/* Copyright (C) 1995-1998 Eric Young (<a href=3D"mailto:eay@cr=
yptsoft.com" target=3D"_blank">eay@cryptsoft.com</a>)<br>
&gt; &gt; +- * All rights reserved.<br>
&gt; &gt; +- *<br>
&gt; &gt; +- * This package is an SSL implementation written<br>
&gt; &gt; +- * by Eric Young (<a href=3D"mailto:eay@cryptsoft.com" target=
=3D"_blank">eay@cryptsoft.com</a>).<br>
&gt; &gt; +- * The implementation was written so as to conform with Netscap=
es SSL.<br>
&gt; &gt; +- *<br>
&gt; &gt; +- * This library is free for commercial and non-commercial use a=
s long as<br>
&gt; &gt; +- * the following conditions are aheared to.=C2=A0 The following=
 conditions<br>
&gt; &gt; +- * apply to all code found in this distribution, be it the RC4,=
 RSA,<br>
&gt; &gt; +- * lhash, DES, etc., code; not just the SSL code.=C2=A0 The SSL=
 documentation<br>
&gt; &gt; +- * included with this distribution is covered by the same copyr=
ight terms<br>
&gt; &gt; +- * except that the holder is Tim Hudson (<a href=3D"mailto:tjh@=
cryptsoft.com" target=3D"_blank">tjh@cryptsoft.com</a>).<br>
&gt; &gt; +- *<br>
&gt; &gt; +- * Copyright remains Eric Young&#39;s, and as such any Copyrigh=
t notices in<br>
&gt; &gt; +- * the code are not to be removed.<br>
&gt; &gt; +- * If this package is used in a product, Eric Young should be g=
iven attribution<br>
&gt; &gt; +- * as the author of the parts of the library used.<br>
&gt; &gt; +- * This can be in the form of a textual message at program star=
tup or<br>
&gt; &gt; +- * in documentation (online or textual) provided with the packa=
ge.<br>
&gt; &gt; +- *<br>
&gt; &gt; +- * Redistribution and use in source and binary forms, with or w=
ithout<br>
&gt; &gt; +- * modification, are permitted provided that the following cond=
itions<br>
&gt; &gt; +- * are met:<br>
&gt; &gt; +- * 1. Redistributions of source code must retain the copyright<=
br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0 notice, this list of conditions and the fo=
llowing disclaimer.<br>
&gt; &gt; +- * 2. Redistributions in binary form must reproduce the above c=
opyright<br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0 notice, this list of conditions and the fo=
llowing disclaimer in the<br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0 documentation and/or other materials provi=
ded with the distribution.<br>
&gt; &gt; +- * 3. All advertising materials mentioning features or use of t=
his software<br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0 must display the following acknowledgement=
:<br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0 &quot;This product includes cryptographic =
software written by<br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0=C2=A0 Eric Young (<a href=3D"mailto:eay@cr=
yptsoft.com" target=3D"_blank">eay@cryptsoft.com</a>)&quot;<br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0 The word &#39;cryptographic&#39; can be le=
ft out if the rouines from the library<br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0 being used are not cryptographic related :=
-).<br>
&gt; &gt; +- * 4. If you include any Windows specific code (or a derivative=
 thereof) from<br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0 the apps directory (application code) you =
must include an acknowledgement:<br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0 &quot;This product includes software writt=
en by Tim Hudson (<a href=3D"mailto:tjh@cryptsoft.com" target=3D"_blank">tj=
h@cryptsoft.com</a>)&quot;<br>
&gt; &gt; +- *<br>
&gt; &gt; +- * THIS SOFTWARE IS PROVIDED BY ERIC YOUNG ``AS IS&#39;&#39; AN=
D<br>
&gt; &gt; +- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITE=
D TO, THE<br>
&gt; &gt; +- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PART=
ICULAR PURPOSE<br>
&gt; &gt; +- * ARE DISCLAIMED.=C2=A0 IN NO EVENT SHALL THE AUTHOR OR CONTRI=
BUTORS BE LIABLE<br>
&gt; &gt; +- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR=
 CONSEQUENTIAL<br>
&gt; &gt; +- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBST=
ITUTE GOODS<br>
&gt; &gt; +- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTE=
RRUPTION)<br>
&gt; &gt; +- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CO=
NTRACT, STRICT<br>
&gt; &gt; +- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISI=
NG IN ANY WAY<br>
&gt; &gt; +- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSS=
IBILITY OF<br>
&gt; &gt; +- * SUCH DAMAGE.<br>
&gt; &gt; +- *<br>
&gt; &gt; +- * The licence and distribution terms for any publically availa=
ble version or<br>
&gt; &gt; +- * derivative of this code cannot be changed.=C2=A0 i.e. this c=
ode cannot simply be<br>
&gt; &gt; +- * copied and put under another distribution licence<br>
&gt; &gt; +- * [including the GNU Public Licence.]<br>
&gt; &gt; +- */<br>
&gt; &gt; +-<br>
&gt; &gt; +-/* $OpenBSD: dsa_asn1.c,v 1.22 2018/06/14 17:03:19 jsing Exp $ =
*/<br>
&gt; &gt; +-/* $OpenBSD: ecs_asn1.c,v 1.9 2018/03/17 15:24:44 tb Exp $ */<b=
r>
&gt; &gt; +-/* $OpenBSD: digest.c,v 1.30 2018/04/14 07:09:21 tb Exp $ */<br=
>
&gt; &gt; +-/* Written by Dr Stephen N Henson (<a href=3D"mailto:steve@open=
ssl.org" target=3D"_blank">steve@openssl.org</a>) for the OpenSSL<br>
&gt; &gt; +- * project 2000.<br>
&gt; &gt; +- */<br>
&gt; &gt; +-/* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; +- * Copyright (c) 2000-2005 The OpenSSL Project.=C2=A0 All right=
s reserved.<br>
&gt; &gt; +- *<br>
&gt; &gt; +- * Redistribution and use in source and binary forms, with or w=
ithout<br>
&gt; &gt; +- * modification, are permitted provided that the following cond=
itions<br>
&gt; &gt; +- * are met:<br>
&gt; &gt; +- *<br>
&gt; &gt; +- * 1. Redistributions of source code must retain the above copy=
right<br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0 notice, this list of conditions and the fo=
llowing disclaimer.<br>
&gt; &gt; +- *<br>
&gt; &gt; +- * 2. Redistributions in binary form must reproduce the above c=
opyright<br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0 notice, this list of conditions and the fo=
llowing disclaimer in<br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0 the documentation and/or other materials p=
rovided with the<br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0 distribution.<br>
&gt; &gt; +- *<br>
&gt; &gt; +- * 3. All advertising materials mentioning features or use of t=
his<br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0 software must display the following acknow=
ledgment:<br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0 &quot;This product includes software devel=
oped by the OpenSSL Project<br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0 for use in the OpenSSL Toolkit. (<a href=
=3D"http://www.openssl.org/" target=3D"_blank">https://apc01.safelinks.prot=
ection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.openssl.org%2F&amp;data=3D05%7C0=
1%7CRanjitsinh.Rathod%40kpit.com%7Cd788d3aa157742dfacb008db61a20d08%7C35394=
51eb46e4a26a242ff61502855c7%7C0%7C0%7C638211120911246208%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
3000%7C%7C%7C&amp;sdata=3Dxcpid%2F25wbVMoxg4ok8qGpgBjiL8jXkZN5bX4hSS2wc%3D&=
amp;reserved=3D0</a>)&quot;<br>
&gt; &gt; +- *<br>
&gt; &gt; +- * 4. The names &quot;OpenSSL Toolkit&quot; and &quot;OpenSSL P=
roject&quot; must not be used to<br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0 endorse or promote products derived from t=
his software without<br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0 prior written permission. For written perm=
ission, please contact<br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0 licensing@OpenSSL.org.<br>
&gt; &gt; +- *<br>
&gt; &gt; +- * 5. Products derived from this software may not be called &qu=
ot;OpenSSL&quot;<br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0 nor may &quot;OpenSSL&quot; appear in thei=
r names without prior written<br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0 permission of the OpenSSL Project.<br>
&gt; &gt; +- *<br>
&gt; &gt; +- * 6. Redistributions of any form whatsoever must retain the fo=
llowing<br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0 acknowledgment:<br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0 &quot;This product includes software devel=
oped by the OpenSSL Project<br>
&gt; &gt; +- *=C2=A0=C2=A0=C2=A0 for use in the OpenSSL Toolkit (<a href=3D=
"http://www.openssl.org/" target=3D"_blank">https://apc01.safelinks.protect=
ion.outlook.com/?url=3Dhttp%3A%2F%2Fwww.openssl.org%2F&amp;data=3D05%7C01%7=
CRanjitsinh.Rathod%40kpit.com%7Cd788d3aa157742dfacb008db61a20d08%7C3539451e=
b46e4a26a242ff61502855c7%7C0%7C0%7C638211120911246208%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C300=
0%7C%7C%7C&amp;sdata=3Dxcpid%2F25wbVMoxg4ok8qGpgBjiL8jXkZN5bX4hSS2wc%3D&amp=
;reserved=3D0</a>)&quot;<br>
&gt; &gt; +- *<br>
&gt; &gt; +- * THIS SOFTWARE IS PROVIDED BY THE OpenSSL PROJECT ``AS IS&#39=
;&#39; AND ANY<br>
&gt; &gt; +- * EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED =
TO, THE<br>
&gt; &gt; +- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PART=
ICULAR<br>
&gt; &gt; +- * PURPOSE ARE DISCLAIMED.=C2=A0 IN NO EVENT SHALL THE OpenSSL =
PROJECT OR<br>
&gt; &gt; +- * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDEN=
TAL,<br>
&gt; &gt; +- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT=
<br>
&gt; &gt; +- * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;=
<br>
&gt; &gt; +- * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)<br>
&gt; &gt; +- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CO=
NTRACT,<br>
&gt; &gt; +- * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE=
)<br>
&gt; &gt; +- * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF =
ADVISED<br>
&gt; &gt; +- * OF THE POSSIBILITY OF SUCH DAMAGE.<br>
&gt; &gt; +- * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; +- *<br>
&gt; &gt; +- * This product includes cryptographic software written by Eric=
 Young<br>
&gt; &gt; +- * (<a href=3D"mailto:eay@cryptsoft.com" target=3D"_blank">eay@=
cryptsoft.com</a>).=C2=A0 This product includes software written by Tim<br>
&gt; &gt; +- * Hudson (<a href=3D"mailto:tjh@cryptsoft.com" target=3D"_blan=
k">tjh@cryptsoft.com</a>).<br>
&gt; &gt; +- *<br>
&gt; &gt; +- */<br>
&gt; &gt; +-<br>
&gt; &gt; +-/*=C2=A0=C2=A0=C2=A0 $OpenBSD: rsa_meth.c,v 1.2 2018/09/12 06:3=
5:38 djm Exp $=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */<br>
&gt; &gt; + /*<br>
&gt; &gt; +- * Copyright (c) 2018 Theo Buehler &lt;<a href=3D"mailto:tb@ope=
nbsd.org" target=3D"_blank">tb@openbsd.org</a>&gt;<br>
&gt; &gt; ++ * Copyright (c) 2018 Damien Miller &lt;<a href=3D"mailto:djm@m=
indrot.org" target=3D"_blank">djm@mindrot.org</a>&gt;<br>
&gt; &gt; +=C2=A0 *<br>
&gt; &gt; +=C2=A0 * Permission to use, copy, modify, and distribute this so=
ftware for any<br>
&gt; &gt; +=C2=A0 * purpose with or without fee is hereby granted, provided=
 that the above<br>
&gt; &gt; +@@ -147,192 +23,7 @@<br>
&gt; &gt; + #include &lt;stdlib.h&gt;<br>
&gt; &gt; + #include &lt;string.h&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +-#include &lt;openssl/err.h&gt;<br>
&gt; &gt; +-#include &lt;openssl/bn.h&gt;<br>
&gt; &gt; +-#include &lt;openssl/dsa.h&gt;<br>
&gt; &gt; +-#include &lt;openssl/rsa.h&gt;<br>
&gt; &gt; + #include &lt;openssl/evp.h&gt;<br>
&gt; &gt; +-#ifdef OPENSSL_HAS_ECC<br>
&gt; &gt; +-#include &lt;openssl/ecdsa.h&gt;<br>
&gt; &gt; +-#endif<br>
&gt; &gt; +-#include &lt;openssl/dh.h&gt;<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_DSA_GET0_PQG<br>
&gt; &gt; +-void<br>
&gt; &gt; +-DSA_get0_pqg(const DSA *d, const BIGNUM **p, const BIGNUM **q, =
const BIGNUM **g)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (p !=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *p =3D d-&gt;p;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (q !=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *q =3D d-&gt;q;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (g !=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *g =3D d-&gt;g;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_DSA_GET0_PQG */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_DSA_SET0_PQG<br>
&gt; &gt; +-int<br>
&gt; &gt; +-DSA_set0_pqg(DSA *d, BIGNUM *p, BIGNUM *q, BIGNUM *g)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((d-&gt;p =3D=3D NULL &amp;&a=
mp; p =3D=3D NULL) || (d-&gt;q =3D=3D NULL &amp;&amp; q =3D=3D NULL) ||<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (d-&gt;g=
 =3D=3D NULL &amp;&amp; g =3D=3D NULL))<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return 0;<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (p !=3D NULL) {<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BN_free(d-&gt;p);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 d-&gt;p =3D p;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (q !=3D NULL) {<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BN_free(d-&gt;q);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 d-&gt;q =3D q;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (g !=3D NULL) {<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BN_free(d-&gt;g);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 d-&gt;g =3D g;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_DSA_SET0_PQG */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_DSA_GET0_KEY<br>
&gt; &gt; +-void<br>
&gt; &gt; +-DSA_get0_key(const DSA *d, const BIGNUM **pub_key, const BIGNUM=
 **priv_key)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pub_key !=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *pub_key =3D d-&gt;pub_key;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (priv_key !=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *priv_key =3D d-&gt;priv_key;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_DSA_GET0_KEY */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_DSA_SET0_KEY<br>
&gt; &gt; +-int<br>
&gt; &gt; +-DSA_set0_key(DSA *d, BIGNUM *pub_key, BIGNUM *priv_key)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (d-&gt;pub_key =3D=3D NULL &a=
mp;&amp; pub_key =3D=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return 0;<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pub_key !=3D NULL) {<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BN_free(d-&gt;pub_key);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 d-&gt;pub_key =3D pub_key;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (priv_key !=3D NULL) {<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BN_free(d-&gt;priv_key);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 d-&gt;priv_key =3D priv_key;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_DSA_SET0_KEY */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_GET0_KEY<br>
&gt; &gt; +-void<br>
&gt; &gt; +-RSA_get0_key(const RSA *r, const BIGNUM **n, const BIGNUM **e, =
const BIGNUM **d)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (n !=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *n =3D r-&gt;n;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (e !=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *e =3D r-&gt;e;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (d !=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *d =3D r-&gt;d;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_RSA_GET0_KEY */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_SET0_KEY<br>
&gt; &gt; +-int<br>
&gt; &gt; +-RSA_set0_key(RSA *r, BIGNUM *n, BIGNUM *e, BIGNUM *d)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((r-&gt;n =3D=3D NULL &amp;&a=
mp; n =3D=3D NULL) || (r-&gt;e =3D=3D NULL &amp;&amp; e =3D=3D NULL))<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return 0;<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (n !=3D NULL) {<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BN_free(r-&gt;n);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 r-&gt;n =3D n;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (e !=3D NULL) {<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BN_free(r-&gt;e);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 r-&gt;e =3D e;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (d !=3D NULL) {<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BN_free(r-&gt;d);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 r-&gt;d =3D d;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_RSA_SET0_KEY */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_GET0_CRT_PARAMS<br>
&gt; &gt; +-void<br>
&gt; &gt; +-RSA_get0_crt_params(const RSA *r, const BIGNUM **dmp1, const BI=
GNUM **dmq1,<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 const BIGNUM **iqmp)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dmp1 !=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *dmp1 =3D r-&gt;dmp1;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dmq1 !=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *dmq1 =3D r-&gt;dmq1;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (iqmp !=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *iqmp =3D r-&gt;iqmp;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_RSA_GET0_CRT_PARAMS */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_SET0_CRT_PARAMS<br>
&gt; &gt; +-int<br>
&gt; &gt; +-RSA_set0_crt_params(RSA *r, BIGNUM *dmp1, BIGNUM *dmq1, BIGNUM =
*iqmp)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((r-&gt;dmp1 =3D=3D NULL &amp=
;&amp; dmp1 =3D=3D NULL) ||<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (r-&gt;d=
mq1 =3D=3D NULL &amp;&amp; dmq1 =3D=3D NULL) ||<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (r-&gt;i=
qmp =3D=3D NULL &amp;&amp; iqmp =3D=3D NULL))<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return 0;<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dmp1 !=3D NULL) {<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BN_free(r-&gt;dmp1);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 r-&gt;dmp1 =3D dmp1;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dmq1 !=3D NULL) {<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BN_free(r-&gt;dmq1);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 r-&gt;dmq1 =3D dmq1;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (iqmp !=3D NULL) {<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BN_free(r-&gt;iqmp);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 r-&gt;iqmp =3D iqmp;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_RSA_SET0_CRT_PARAMS */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_GET0_FACTORS<br>
&gt; &gt; +-void<br>
&gt; &gt; +-RSA_get0_factors(const RSA *r, const BIGNUM **p, const BIGNUM *=
*q)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (p !=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *p =3D r-&gt;p;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (q !=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *q =3D r-&gt;q;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_RSA_GET0_FACTORS */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_SET0_FACTORS<br>
&gt; &gt; +-int<br>
&gt; &gt; +-RSA_set0_factors(RSA *r, BIGNUM *p, BIGNUM *q)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((r-&gt;p =3D=3D NULL &amp;&a=
mp; p =3D=3D NULL) || (r-&gt;q =3D=3D NULL &amp;&amp; q =3D=3D NULL))<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return 0;<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (p !=3D NULL) {<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BN_free(r-&gt;p);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 r-&gt;p =3D p;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (q !=3D NULL) {<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BN_free(r-&gt;q);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 r-&gt;q =3D q;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_RSA_SET0_FACTORS */<br>
&gt; &gt; +<br>
&gt; &gt; + #ifndef HAVE_EVP_CIPHER_CTX_GET_IV<br>
&gt; &gt; + int<br>
&gt; &gt; +@@ -392,249 +83,4 @@ EVP_CIPHER_CTX_set_iv(EVP_CIPHER_CTX *ctx, =
const unsigned char *iv, size_t len)<br>
&gt; &gt; + }<br>
&gt; &gt; + #endif /* HAVE_EVP_CIPHER_CTX_SET_IV */<br>
&gt; &gt; +<br>
&gt; &gt; +-#ifndef HAVE_DSA_SIG_GET0<br>
&gt; &gt; +-void<br>
&gt; &gt; +-DSA_SIG_get0(const DSA_SIG *sig, const BIGNUM **pr, const BIGNU=
M **ps)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pr !=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *pr =3D sig-&gt;r;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ps !=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *ps =3D sig-&gt;s;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_DSA_SIG_GET0 */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_DSA_SIG_SET0<br>
&gt; &gt; +-int<br>
&gt; &gt; +-DSA_SIG_set0(DSA_SIG *sig, BIGNUM *r, BIGNUM *s)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r =3D=3D NULL || s =3D=3D NU=
LL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return 0;<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BN_clear_free(sig-&gt;r);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sig-&gt;r =3D r;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BN_clear_free(sig-&gt;s);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sig-&gt;s =3D s;<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_DSA_SIG_SET0 */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifdef OPENSSL_HAS_ECC<br>
&gt; &gt; +-#ifndef HAVE_ECDSA_SIG_GET0<br>
&gt; &gt; +-void<br>
&gt; &gt; +-ECDSA_SIG_get0(const ECDSA_SIG *sig, const BIGNUM **pr, const B=
IGNUM **ps)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pr !=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *pr =3D sig-&gt;r;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ps !=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *ps =3D sig-&gt;s;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_ECDSA_SIG_GET0 */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_ECDSA_SIG_SET0<br>
&gt; &gt; +-int<br>
&gt; &gt; +-ECDSA_SIG_set0(ECDSA_SIG *sig, BIGNUM *r, BIGNUM *s)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r =3D=3D NULL || s =3D=3D NU=
LL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return 0;<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BN_clear_free(sig-&gt;r);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BN_clear_free(sig-&gt;s);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sig-&gt;r =3D r;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sig-&gt;s =3D s;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_ECDSA_SIG_SET0 */<br>
&gt; &gt; +-#endif /* OPENSSL_HAS_ECC */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_DH_GET0_PQG<br>
&gt; &gt; +-void<br>
&gt; &gt; +-DH_get0_pqg(const DH *dh, const BIGNUM **p, const BIGNUM **q, c=
onst BIGNUM **g)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (p !=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *p =3D dh-&gt;p;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (q !=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *q =3D dh-&gt;q;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (g !=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *g =3D dh-&gt;g;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_DH_GET0_PQG */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_DH_SET0_PQG<br>
&gt; &gt; +-int<br>
&gt; &gt; +-DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((dh-&gt;p =3D=3D NULL &amp;&=
amp; p =3D=3D NULL) || (dh-&gt;g =3D=3D NULL &amp;&amp; g =3D=3D NULL))<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return 0;<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (p !=3D NULL) {<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BN_free(dh-&gt;p);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 dh-&gt;p =3D p;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (q !=3D NULL) {<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BN_free(dh-&gt;q);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 dh-&gt;q =3D q;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (g !=3D NULL) {<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BN_free(dh-&gt;g);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 dh-&gt;g =3D g;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_DH_SET0_PQG */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_DH_GET0_KEY<br>
&gt; &gt; +-void<br>
&gt; &gt; +-DH_get0_key(const DH *dh, const BIGNUM **pub_key, const BIGNUM =
**priv_key)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pub_key !=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *pub_key =3D dh-&gt;pub_key;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (priv_key !=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *priv_key =3D dh-&gt;priv_key;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_DH_GET0_KEY */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_DH_SET0_KEY<br>
&gt; &gt; +-int<br>
&gt; &gt; +-DH_set0_key(DH *dh, BIGNUM *pub_key, BIGNUM *priv_key)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pub_key !=3D NULL) {<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BN_free(dh-&gt;pub_key);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 dh-&gt;pub_key =3D pub_key;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (priv_key !=3D NULL) {<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BN_free(dh-&gt;priv_key);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 dh-&gt;priv_key =3D priv_key;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_DH_SET0_KEY */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_DH_SET_LENGTH<br>
&gt; &gt; +-int<br>
&gt; &gt; +-DH_set_length(DH *dh, long length)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (length &lt; 0 || length &gt;=
 INT_MAX)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return 0;<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dh-&gt;length =3D length;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_DH_SET_LENGTH */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_METH_FREE<br>
&gt; &gt; +-void<br>
&gt; &gt; +-RSA_meth_free(RSA_METHOD *meth)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (meth !=3D NULL) {<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 free((char *)meth-&gt;name);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 free(meth);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_RSA_METH_FREE */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_METH_DUP<br>
&gt; &gt; +-RSA_METHOD *<br>
&gt; &gt; +-RSA_meth_dup(const RSA_METHOD *meth)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RSA_METHOD *copy;<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((copy =3D calloc(1, sizeof(*=
copy))) =3D=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return NULL;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(copy, meth, sizeof(*copy)=
);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((copy-&gt;name =3D strdup(me=
th-&gt;name)) =3D=3D NULL) {<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 free(copy);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return NULL;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return copy;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_RSA_METH_DUP */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_METH_SET1_NAME<br>
&gt; &gt; +-int<br>
&gt; &gt; +-RSA_meth_set1_name(RSA_METHOD *meth, const char *name)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *copy;<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((copy =3D strdup(name)) =3D=
=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return 0;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free((char *)meth-&gt;name);<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meth-&gt;name =3D copy;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_RSA_METH_SET1_NAME */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_METH_GET_FINISH<br>
&gt; &gt; +-int<br>
&gt; &gt; +-(*RSA_meth_get_finish(const RSA_METHOD *meth))(RSA *rsa)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return meth-&gt;finish;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_RSA_METH_GET_FINISH */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_METH_SET_PRIV_ENC<br>
&gt; &gt; +-int<br>
&gt; &gt; +-RSA_meth_set_priv_enc(RSA_METHOD *meth, int (*priv_enc)(int fle=
n,<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 const unsigned char *from, unsigned char *to=
, RSA *rsa, int padding))<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meth-&gt;rsa_priv_enc =3D priv_e=
nc;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_RSA_METH_SET_PRIV_ENC */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_METH_SET_PRIV_DEC<br>
&gt; &gt; +-int<br>
&gt; &gt; +-RSA_meth_set_priv_dec(RSA_METHOD *meth, int (*priv_dec)(int fle=
n,<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 const unsigned char *from, unsigned char *to=
, RSA *rsa, int padding))<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meth-&gt;rsa_priv_dec =3D priv_d=
ec;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_RSA_METH_SET_PRIV_DEC */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_METH_SET_FINISH<br>
&gt; &gt; +-int<br>
&gt; &gt; +-RSA_meth_set_finish(RSA_METHOD *meth, int (*finish)(RSA *rsa))<=
br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meth-&gt;finish =3D finish;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_RSA_METH_SET_FINISH */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_EVP_PKEY_GET0_RSA<br>
&gt; &gt; +-RSA *<br>
&gt; &gt; +-EVP_PKEY_get0_RSA(EVP_PKEY *pkey)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pkey-&gt;type !=3D EVP_PKEY_=
RSA) {<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /* EVPerror(EVP_R_EXPECTING_AN_RSA_KEY); */<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return NULL;<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return pkey-&gt;pkey.rsa;<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_EVP_PKEY_GET0_RSA */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_EVP_MD_CTX_NEW<br>
&gt; &gt; +-EVP_MD_CTX *<br>
&gt; &gt; +-EVP_MD_CTX_new(void)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return calloc(1, sizeof(EVP_MD_C=
TX));<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_EVP_MD_CTX_NEW */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_EVP_MD_CTX_FREE<br>
&gt; &gt; +-void<br>
&gt; &gt; +-EVP_MD_CTX_free(EVP_MD_CTX *ctx)<br>
&gt; &gt; +-{<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ctx =3D=3D NULL)<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return;<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EVP_MD_CTX_cleanup(ctx);<br>
&gt; &gt; +-<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free(ctx);<br>
&gt; &gt; +-}<br>
&gt; &gt; +-#endif /* HAVE_EVP_MD_CTX_FREE */<br>
&gt; &gt; +-<br>
&gt; &gt; + #endif /* WITH_OPENSSL */<br>
&gt; &gt; +diff --git a/openbsd-compat/openssl-compat.h b/openbsd-compat/op=
enssl-compat.h<br>
&gt; &gt; +index 61a69dd56eb..d0dd2c3450d 100644<br>
&gt; &gt; +--- a/openbsd-compat/openssl-compat.h<br>
&gt; &gt; ++++ b/openbsd-compat/openssl-compat.h<br>
&gt; &gt; +@@ -33,26 +33,13 @@<br>
&gt; &gt; + int ssh_compatible_openssl(long, long);<br>
&gt; &gt; + void ssh_libcrypto_init(void);<br>
&gt; &gt; +<br>
&gt; &gt; +-#if (OPENSSL_VERSION_NUMBER &lt; 0x1000100fL)<br>
&gt; &gt; +-# error OpenSSL 1.0.1 or greater is required<br>
&gt; &gt; ++#if (OPENSSL_VERSION_NUMBER &lt; 0x10100000L)<br>
&gt; &gt; ++# error OpenSSL 1.1.0 or greater is required<br>
&gt; &gt; + #endif<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef OPENSSL_VERSION<br>
&gt; &gt; +-# define OPENSSL_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SSLEAY_V=
ERSION<br>
&gt; &gt; +-#endif<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_OPENSSL_VERSION<br>
&gt; &gt; +-# define OpenSSL_version(x)=C2=A0=C2=A0 SSLeay_version(x)<br>
&gt; &gt; +-#endif<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_OPENSSL_VERSION_NUM<br>
&gt; &gt; +-# define OpenSSL_version_num=C2=A0 SSLeay<br>
&gt; &gt; +-#endif<br>
&gt; &gt; +-<br>
&gt; &gt; +-#if OPENSSL_VERSION_NUMBER &lt; 0x10000001L<br>
&gt; &gt; +-# define LIBCRYPTO_EVP_INL_TYPE unsigned int<br>
&gt; &gt; +-#else<br>
&gt; &gt; +-# define LIBCRYPTO_EVP_INL_TYPE size_t<br>
&gt; &gt; ++#ifdef LIBRESSL_VERSION_NUMBER<br>
&gt; &gt; ++# if LIBRESSL_VERSION_NUMBER &lt; 0x3010000fL<br>
&gt; &gt; ++#=C2=A0 error LibreSSL 3.1.0 or greater is required<br>
&gt; &gt; ++# endif<br>
&gt; &gt; + #endif<br>
&gt; &gt; +<br>
&gt; &gt; + #ifndef OPENSSL_RSA_MAX_MODULUS_BITS<br>
&gt; &gt; +@@ -68,25 +55,6 @@ void ssh_libcrypto_init(void);<br>
&gt; &gt; + # endif<br>
&gt; &gt; + #endif<br>
&gt; &gt; +<br>
&gt; &gt; +-/* LibreSSL/OpenSSL 1.1x API compat */<br>
&gt; &gt; +-#ifndef HAVE_DSA_GET0_PQG<br>
&gt; &gt; +-void DSA_get0_pqg(const DSA *d, const BIGNUM **p, const BIGNUM =
**q,<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 const BIGNUM **g);<br>
&gt; &gt; +-#endif /* HAVE_DSA_GET0_PQG */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_DSA_SET0_PQG<br>
&gt; &gt; +-int DSA_set0_pqg(DSA *d, BIGNUM *p, BIGNUM *q, BIGNUM *g);<br>
&gt; &gt; +-#endif /* HAVE_DSA_SET0_PQG */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_DSA_GET0_KEY<br>
&gt; &gt; +-void DSA_get0_key(const DSA *d, const BIGNUM **pub_key,<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 const BIGNUM **priv_key);<br>
&gt; &gt; +-#endif /* HAVE_DSA_GET0_KEY */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_DSA_SET0_KEY<br>
&gt; &gt; +-int DSA_set0_key(DSA *d, BIGNUM *pub_key, BIGNUM *priv_key);<br=
>
&gt; &gt; +-#endif /* HAVE_DSA_SET0_KEY */<br>
&gt; &gt; +-<br>
&gt; &gt; + #ifndef HAVE_EVP_CIPHER_CTX_GET_IV<br>
&gt; &gt; + # ifdef HAVE_EVP_CIPHER_CTX_GET_UPDATED_IV<br>
&gt; &gt; + #=C2=A0 define EVP_CIPHER_CTX_get_iv EVP_CIPHER_CTX_get_updated=
_iv<br>
&gt; &gt; +@@ -101,112 +69,5 @@ int EVP_CIPHER_CTX_set_iv(EVP_CIPHER_CTX *c=
tx,<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0 const unsigned char *iv, size_t len);<b=
r>
&gt; &gt; + #endif /* HAVE_EVP_CIPHER_CTX_SET_IV */<br>
&gt; &gt; +<br>
&gt; &gt; +-#ifndef HAVE_RSA_GET0_KEY<br>
&gt; &gt; +-void RSA_get0_key(const RSA *r, const BIGNUM **n, const BIGNUM =
**e,<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 const BIGNUM **d);<br>
&gt; &gt; +-#endif /* HAVE_RSA_GET0_KEY */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_SET0_KEY<br>
&gt; &gt; +-int RSA_set0_key(RSA *r, BIGNUM *n, BIGNUM *e, BIGNUM *d);<br>
&gt; &gt; +-#endif /* HAVE_RSA_SET0_KEY */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_GET0_CRT_PARAMS<br>
&gt; &gt; +-void RSA_get0_crt_params(const RSA *r, const BIGNUM **dmp1, con=
st BIGNUM **dmq1,<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 const BIGNUM **iqmp);<br>
&gt; &gt; +-#endif /* HAVE_RSA_GET0_CRT_PARAMS */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_SET0_CRT_PARAMS<br>
&gt; &gt; +-int RSA_set0_crt_params(RSA *r, BIGNUM *dmp1, BIGNUM *dmq1, BIG=
NUM *iqmp);<br>
&gt; &gt; +-#endif /* HAVE_RSA_SET0_CRT_PARAMS */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_GET0_FACTORS<br>
&gt; &gt; +-void RSA_get0_factors(const RSA *r, const BIGNUM **p, const BIG=
NUM **q);<br>
&gt; &gt; +-#endif /* HAVE_RSA_GET0_FACTORS */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_SET0_FACTORS<br>
&gt; &gt; +-int RSA_set0_factors(RSA *r, BIGNUM *p, BIGNUM *q);<br>
&gt; &gt; +-#endif /* HAVE_RSA_SET0_FACTORS */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef DSA_SIG_GET0<br>
&gt; &gt; +-void DSA_SIG_get0(const DSA_SIG *sig, const BIGNUM **pr, const =
BIGNUM **ps);<br>
&gt; &gt; +-#endif /* DSA_SIG_GET0 */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef DSA_SIG_SET0<br>
&gt; &gt; +-int DSA_SIG_set0(DSA_SIG *sig, BIGNUM *r, BIGNUM *s);<br>
&gt; &gt; +-#endif /* DSA_SIG_SET0 */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifdef OPENSSL_HAS_ECC<br>
&gt; &gt; +-#ifndef HAVE_ECDSA_SIG_GET0<br>
&gt; &gt; +-void ECDSA_SIG_get0(const ECDSA_SIG *sig, const BIGNUM **pr, co=
nst BIGNUM **ps);<br>
&gt; &gt; +-#endif /* HAVE_ECDSA_SIG_GET0 */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_ECDSA_SIG_SET0<br>
&gt; &gt; +-int ECDSA_SIG_set0(ECDSA_SIG *sig, BIGNUM *r, BIGNUM *s);<br>
&gt; &gt; +-#endif /* HAVE_ECDSA_SIG_SET0 */<br>
&gt; &gt; +-#endif /* OPENSSL_HAS_ECC */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_DH_GET0_PQG<br>
&gt; &gt; +-void DH_get0_pqg(const DH *dh, const BIGNUM **p, const BIGNUM *=
*q,<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 const BIGNUM **g);<br>
&gt; &gt; +-#endif /* HAVE_DH_GET0_PQG */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_DH_SET0_PQG<br>
&gt; &gt; +-int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g);<br>
&gt; &gt; +-#endif /* HAVE_DH_SET0_PQG */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_DH_GET0_KEY<br>
&gt; &gt; +-void DH_get0_key(const DH *dh, const BIGNUM **pub_key, const BI=
GNUM **priv_key);<br>
&gt; &gt; +-#endif /* HAVE_DH_GET0_KEY */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_DH_SET0_KEY<br>
&gt; &gt; +-int DH_set0_key(DH *dh, BIGNUM *pub_key, BIGNUM *priv_key);<br>
&gt; &gt; +-#endif /* HAVE_DH_SET0_KEY */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_DH_SET_LENGTH<br>
&gt; &gt; +-int DH_set_length(DH *dh, long length);<br>
&gt; &gt; +-#endif /* HAVE_DH_SET_LENGTH */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_METH_FREE<br>
&gt; &gt; +-void RSA_meth_free(RSA_METHOD *meth);<br>
&gt; &gt; +-#endif /* HAVE_RSA_METH_FREE */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_METH_DUP<br>
&gt; &gt; +-RSA_METHOD *RSA_meth_dup(const RSA_METHOD *meth);<br>
&gt; &gt; +-#endif /* HAVE_RSA_METH_DUP */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_METH_SET1_NAME<br>
&gt; &gt; +-int RSA_meth_set1_name(RSA_METHOD *meth, const char *name);<br>
&gt; &gt; +-#endif /* HAVE_RSA_METH_SET1_NAME */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_METH_GET_FINISH<br>
&gt; &gt; +-int (*RSA_meth_get_finish(const RSA_METHOD *meth))(RSA *rsa);<b=
r>
&gt; &gt; +-#endif /* HAVE_RSA_METH_GET_FINISH */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_METH_SET_PRIV_ENC<br>
&gt; &gt; +-int RSA_meth_set_priv_enc(RSA_METHOD *meth, int (*priv_enc)(int=
 flen,<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 const unsigned char *from, unsigned char *to=
, RSA *rsa, int padding));<br>
&gt; &gt; +-#endif /* HAVE_RSA_METH_SET_PRIV_ENC */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_METH_SET_PRIV_DEC<br>
&gt; &gt; +-int RSA_meth_set_priv_dec(RSA_METHOD *meth, int (*priv_dec)(int=
 flen,<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0 const unsigned char *from, unsigned char *to=
, RSA *rsa, int padding));<br>
&gt; &gt; +-#endif /* HAVE_RSA_METH_SET_PRIV_DEC */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_RSA_METH_SET_FINISH<br>
&gt; &gt; +-int RSA_meth_set_finish(RSA_METHOD *meth, int (*finish)(RSA *rs=
a));<br>
&gt; &gt; +-#endif /* HAVE_RSA_METH_SET_FINISH */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_EVP_PKEY_GET0_RSA<br>
&gt; &gt; +-RSA *EVP_PKEY_get0_RSA(EVP_PKEY *pkey);<br>
&gt; &gt; +-#endif /* HAVE_EVP_PKEY_GET0_RSA */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_EVP_MD_CTX_new<br>
&gt; &gt; +-EVP_MD_CTX *EVP_MD_CTX_new(void);<br>
&gt; &gt; +-#endif /* HAVE_EVP_MD_CTX_new */<br>
&gt; &gt; +-<br>
&gt; &gt; +-#ifndef HAVE_EVP_MD_CTX_free<br>
&gt; &gt; +-void EVP_MD_CTX_free(EVP_MD_CTX *ctx);<br>
&gt; &gt; +-#endif /* HAVE_EVP_MD_CTX_free */<br>
&gt; &gt; +-<br>
&gt; &gt; + #endif /* WITH_OPENSSL */<br>
&gt; &gt; + #endif /* _OPENSSL_COMPAT_H */<br>
&gt; &gt; diff --git a/meta/recipes-connectivity/openssh/<a href=3D"http://=
openssh_8.9p1.bb" target=3D"_blank">openssh_8.9p1.bb</a> b/meta/recipes-con=
nectivity/openssh/<a href=3D"http://openssh_8.9p1.bb" target=3D"_blank">ope=
nssh_8.9p1.bb</a><br>
&gt; &gt; index 6057d055f4..1d53c2488b 100644<br>
&gt; &gt; --- a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh=
_8.9p1.bb" target=3D"_blank">openssh_8.9p1.bb</a><br>
&gt; &gt; +++ b/meta/recipes-connectivity/openssh/<a href=3D"http://openssh=
_8.9p1.bb" target=3D"_blank">openssh_8.9p1.bb</a><br>
&gt; &gt; @@ -26,6 +26,7 @@ SRC_URI =3D &quot;<a></a><a href=3D"https://apc=
01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fftp.openbsd.org%2Fp=
ub%2FOpenBSD%2FOpenSSH%2Fportable%2Fopenssh-%24&amp;data=3D05%7C01%7CRanjit=
sinh.Rathod%40kpit.com%7Cd788d3aa157742dfacb008db61a20d08%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C638211120911246208%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C=
%7C&amp;sdata=3DdDzVG6aYgMYab04aGD%2F6l6tLxk2tzcSndFcqwlT%2FRg0%3D&amp;rese=
rved=3D0%7BPV%7D.tar" target=3D"_blank">https://apc01.safelinks.protection.=
outlook.com/?url=3Dhttp%3A%2F%2Fftp.openbsd.org%2Fpub%2FOpenBSD%2FOpenSSH%2=
Fportable%2Fopenssh-%24&amp;data=3D05%7C01%7CRanjitsinh.Rathod%40kpit.com%7=
Cd788d3aa157742dfacb008db61a20d08%7C3539451eb46e4a26a242ff61502855c7%7C0%7C=
0%7C638211120911246208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi=
V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DdDzVG6aY=
gMYab04aGD%2F6l6tLxk2tzcSndFcqwlT%2FRg0%3D&amp;reserved=3D0{PV}.tar</a><br>
&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 <a>file://add-test-support-for-busybox.patch</a> \<br>
&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 <a>file://f107467179428a0e3ea9e4aa9738ac12ff02822d.patch</a> \<br>
&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 <a>
file://0001-Default-to-not-using-sandbox-when-cross-compiling.patch</a> \<b=
r>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>=
file://7280401bdd77ca54be6867a154cc01e0d72612e0.patch</a> \<br>
&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 &quot;<br>
&gt; &gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;fd497654b7ab1686dac672fb83dfb4=
ba4096e8b5ffcdaccd262380ae58bec5e7&quot;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; 2.17.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#181902): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/message/181902" target=3D"_blank">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F181902&amp;data=3D05%7C=
01%7CRanjitsinh.Rathod%40kpit.com%7Cd788d3aa157742dfacb008db61a20d08%7C3539=
451eb46e4a26a242ff61502855c7%7C0%7C0%7C638211120911246208%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7=
C3000%7C%7C%7C&amp;sdata=3D3B6FWTx0mX6a%2F14mRs3CqIFrko671tih13RGrDhjfFc%3D=
&amp;reserved=3D0</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/992=
15252/1686489" target=3D"_blank">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fmt%2F99215252%2F1686489&amp;data=3D05%7C01%7CRanjitsinh.R=
athod%40kpit.com%7Cd788d3aa157742dfacb008db61a20d08%7C3539451eb46e4a26a242f=
f61502855c7%7C0%7C0%7C638211120911246208%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&am=
p;sdata=3DwYwpf8EzfQo3bpSknW9TQF%2FbwKQcwgcGVrbnzT0%2Bcbc%3D&amp;reserved=
=3D0</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedde=
d.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/unsub" target=3D"_blank">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Funsub&amp;data=3D05%7C01%7CRanjit=
sinh.Rathod%40kpit.com%7Cd788d3aa157742dfacb008db61a20d08%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C638211120911246208%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C=
%7C&amp;sdata=3DEFlXzS8E9JdB5UV%2BHvW8sYJLH2BEn6Jc%2BAHB5iB8cUs%3D&amp;rese=
rved=3D0</a>
 [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@=
gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
&gt; This message contains information that may be privileged or confidenti=
al and is the property of the KPIT Technologies Ltd. It is intended only fo=
r the person to whom it is addressed. If you are not the intended recipient=
, you are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</div>

</div></blockquote></div>

--0000000000000143de05fcf95189--

--0000000000000143df05fcf9518a
Content-Type: image/png; name="Outlook-zvjvofhy.png"
Content-Disposition: inline; filename="Outlook-zvjvofhy.png"
Content-Transfer-Encoding: base64
Content-ID: <18870f5c1ed4d4ea0eb1>
X-Attachment-Id: 18870f5c1ed4d4ea0eb1

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
t73vjsD/DzX/H827ae66AAAAAElFTkSuQmCC
--0000000000000143df05fcf9518a--

