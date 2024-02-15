Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA0BC48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 18:50:42 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.524.1708023041136857120
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 10:50:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CoqBV8VJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6e2e452c852so567764a34.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 10:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708023040; x=1708627840; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkTZMyokOiUuliMjQkibzYCJwlS5ECMvfgpGUTJEUS4=;
        b=CoqBV8VJveBBA+QVz/p9qSLef2Tri+z6yNPTZijM7bV/WRbYW8j1pQfELIbcs54+/R
         qGvCfZa/0GBnfUQf9iTnjJ0xGiM3c2nDkpGoRtY2T+11TWaWTaAZYEjH+ge4ppyyt6Ea
         J0AZl6mAqJGW6zEBPJIXV+kr8fb/Xx0ncubbB9Qo4jLsldLZ+J5e0ZkKMhL8yt5NaHQY
         PIDYEU0qxjl2gvbIvWqMy7Qd/JarAKYSP/jDol/+HJ2ap3PLOQ0FAqPcZS4Lz8CwHN26
         pGo4CjjKN1lzOR0wN8xe7XMobnUl81ZkljFk83/k6QwnzDpL0XxAb3YawPHGc29agYMj
         ScTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708023040; x=1708627840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkTZMyokOiUuliMjQkibzYCJwlS5ECMvfgpGUTJEUS4=;
        b=IYB/0wyZRRajBMSzIQAmVhO7w7GqTfDSQeKDzBpOfvGieHhBvLNIZGkyr0KwKxgxDo
         7kDl4BB8cmjROb65+zAIRIl+lQEANGLDVfmCKKCUnItmmcmexpeJUXYMbLCrjF1iXW8s
         h9m2yDqC3KDilh41PhiSeARhjFhbJpk+7ZEnZmY7XoHdYOKUH42ZOb0G36JIzNDCKd2J
         UlJWYlDkUaXch7sXFOm5jNc9+VTkL1QIcDqeSqFKfUReDDQBMo3Zwc70DxrsbvNKO4gG
         Iot/w9sWhbBHHQ6RdiBjo0ddcuDTkQzXpWbIXV3vAzUU66+SncvGlDrrvsbd0ulczeFf
         qGag==
X-Gm-Message-State: AOJu0Yy2w5INKtRh3GBU9N8mTLrvVv5DnmmkxG/7M4D5IkhJIQVBQz9i
	9lrzUBLJmeBZMw/yY3osfzF2idzwdTSkw3B2n35eZxQ72srbIL8tBdrNzNVfjolgbc757ydibDG
	heqyt0T3/5a4Wnp2BVOrpznyPrM8=
X-Google-Smtp-Source: AGHT+IGAbtNnc4qA1eSShYfDjtHFeax8pgxOgCCRXqRJu6hUEDEgPU+OVDHm3sxXDka5APFeh8IhERKf3knRmlPorGQ=
X-Received: by 2002:a05:6871:72c:b0:21e:2e0f:b4ac with SMTP id
 f44-20020a056871072c00b0021e2e0fb4acmr2588590oap.37.1708023040295; Thu, 15
 Feb 2024 10:50:40 -0800 (PST)
MIME-Version: 1.0
References: <PH0PR11MB565801BE2CF2136D644719F9EF4D2@PH0PR11MB5658.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB565801BE2CF2136D644719F9EF4D2@PH0PR11MB5658.namprd11.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Feb 2024 10:50:14 -0800
Message-ID: <CAMKF1soeCkxX3va8rmePt=i=gQm1QDEY10U95__0GVd64yV-Gw@mail.gmail.com>
Subject: Re: [OE-core] gcc: Oe-selftest failures analysis - x86-64
To: Harish.Sadineni@windriver.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>, 
	"Moodalappa, Shivaprasad" <Shivaprasad.Moodalappa@windriver.com>, 
	"Kallapa, Umesh" <Umesh.Kallapa@windriver.com>, "Gowda, Naveen" <Naveen.Gowda@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 18:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195691

On Thu, Feb 15, 2024 at 2:29=E2=80=AFAM Sadineni, Harish via
lists.openembedded.org
<Harish.Sadineni=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Hi all,
>
>
> We are analysing the test failures reported by the autobilder at https://=
autobuilder.yocto.io/pub/non-release/20240204-3/testresults/qemux86-64-tc/t=
estresults.json
> The autobuilder result summary as follows:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> qemux86-64 PTest Result Summary
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -----------------------------------------------------------------------
> Recipe                       | Passed       | Failed    | Skipped  |
> -----------------------------------------------------------------------
> gcc                              | 124420       | 37        | 23809      =
|
> gcc-g++                     | 196231       | 39        | 17314      |
> gcc-libatomic         | 27                 | 1           | 27            =
  |
> gcc-libgomp            | 3407            | 16        | 1981         |
> gcc-libitm                 |   24               | 1           | 24       =
       |
> gcc-libstdc++-v3   | 9705            | 32        | 5464         |
>
>
>
> We started with 'gcc.dg' module failures(13 failues, listed below) report=
ed in https://autobuilder.yocto.io/pub/non-release/20240204-3/testresults/t=
estresult-report.txt.
>     ptestresult.gcc.gcc.dg/analyzer/data-model-4.c (test for excess error=
s)
>     ptestresult.gcc.gcc.dg/analyzer/torture/conftest-1.c   -O0  (test for=
 excess errors)
>     ptestresult.gcc.gcc.dg/analyzer/torture/conftest-1.c   -O1  (test for=
 excess errors)
>     ptestresult.gcc.gcc.dg/analyzer/torture/conftest-1.c   -O2  (test for=
 excess errors)
>     ptestresult.gcc.gcc.dg/analyzer/torture/conftest-1.c   -O2 -flto -fno=
-use-linker-plugin -flto-partition=3Dnone  (test for excess errors)
>     ptestresult.gcc.gcc.dg/analyzer/torture/conftest-1.c   -O3 -g  (test =
for excess errors)
>     ptestresult.gcc.gcc.dg/analyzer/torture/conftest-1.c   -Os  (test for=
 excess errors)

torture tests could be due to limited memory ( RAM ).  how much RAM is
available to qemu ? perhaps try to raise it and see if that helps.

>     ptestresult.gcc.gcc.dg/pr56837.c scan-tree-dump-times optimized "mems=
et ..c, 68, 16384.;" 1
>     ptestresult.gcc.gcc.dg/vect/vect-ifcvt-18.c scan-tree-dump vect "vect=
orized 3 loops"
>     ptestresult.gcc.gcc.dg/vect/vect-simd-clone-10.c (test for excess err=
ors)
>     ptestresult.gcc.gcc.dg/vect/vect-simd-clone-16f.c scan-tree-dump-time=
s vect "[\\n\\r] [^\\n]* =3D foo\\.simdclone" 2
>     ptestresult.gcc.gcc.dg/vect/vect-simd-clone-17f.c scan-tree-dump-time=
s vect "[\\n\\r] [^\\n]* =3D foo\\.simdclone" 2
>     ptestresult.gcc.gcc.dg/vect/vect-simd-clone-18f.c scan-tree-dump-time=
s vect "[\\n\\r] [^\\n]* =3D foo\\.simdclone" 2
>
vect-simd-clone depends on avx runtime I think. so maybe thats the issue he=
re.

>
>
> Out of these, except 'gcc.gcc.dg/vect/vect-simd-clone-10.c' all others ar=
e fialed in gcc upstream.
>
>
> We've analyzed the failed case 'vect-simd-clone-10.c' and find the root c=
ause, it is the bug is in gcc test suite.
>
> GCC Bug raised - https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D113899
>
>
> We are working on other module failures (g++,libatomic...), keep you post=
ed here.
>
>
> Thanks and Regards,
> Harish sadineni
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195507): https://lists.openembedded.org/g/openembedde=
d-core/message/195507
> Mute This Topic: https://lists.openembedded.org/mt/104370247/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

