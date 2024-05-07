Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AE7C10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 16:23:47 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.16331.1715099022868398874
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 09:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jJvuZUDB;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-23e78ef3de7so1738200fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 09:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715099022; x=1715703822; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jttZz94o0gWh4yO5G1SadsPOFfQPPn5xwtPu8E7ELVA=;
        b=jJvuZUDBiynFs068+ZuSDRYaIOTQjEG+fJTnLcc71LV/zBoCF0Y4mM5ZolD9tIPOd0
         2YUUlDhrQaB3mimaaVVNa8daJGostQM9RP0+pWOwOX/sA5Q0lhNy0BCyHcCFneKGlSay
         NrLbqceegQtF2yfBNBuQmdxE6/cUsFK0gRvwRMM8r/qvoCQkuEm1tcf0RmiXE4PonvV/
         IX5mFv6qDd0ff9Ut2aMGwdcJeTmCFSu15sgPIUkqkyMoQHA2qdBdY5kP4TAi7QgnCsr9
         owIJEca7ZJcpCtqnJ5l4/lqBdqkF4RpYVIzTj0m0347UcZ5ecOSz7durNmSZTysNVfJ8
         jfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099022; x=1715703822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jttZz94o0gWh4yO5G1SadsPOFfQPPn5xwtPu8E7ELVA=;
        b=gvMaFQv3BDcKygD5FpH+c0tI9GebZC3ngIWxvBkbs/J9SrCUvTQYk8YMuDMj6Mk38A
         z0o1EjVYq2+atv7qQ64le3mxKyc/sS32xjf3St6H8mIctZ83gzcEO1N6sqZ9i6cGIUC0
         Pr8w2shwVBAzk0Av0S5zaggH+hpoV3AGpl/AI5kCnxollyjLNa+9z1FRpL2BmSyUd764
         9Q74fGMT8XYzkA8PN5tITpk1L9aDemowmHF0iIxzcEqCE/JGz1YvWRnF8TyYhR70EUTM
         E3BsGIWajjF5upTG8w4dzTjN05hwZ6V/J7N0TxstC5rSRYKMcp/AYPNnTDAJLChTriC7
         AR0g==
X-Forwarded-Encrypted: i=1; AJvYcCWl6GNS3Lt3aAKso4Y2gNcKenDnkTbyZ+aEpRvALbHRbfOcFq8aFDJHE5/5XLMiAx353iSsiOPJoJ3BKmPbgG5zSzccbF3xTcyOWvKTK5XqmPywNi928gpB
X-Gm-Message-State: AOJu0YzvyUinvZh5SZ2mSGaeWcIxvaz0DAs87iz3MRkHM67oVbqb3hnJ
	VOsyAyMPStOGQWlnAyqvBWnKXtr9mpWHpsISGngacCv9oDsCm+rZBiEaP6D2V1W/3XeIiFFxV6m
	MMi51CDJKkb+cDp+ig6gSfuVksao=
X-Google-Smtp-Source: AGHT+IE75qlu2sYb/ixZZW+fX8+8bJWDgkHv2XaV1c+ocZLbj705cgG5gg4IGKkn7EDRRUuVoZyoey/4XFBP0Rzfqdc=
X-Received: by 2002:a05:6870:8181:b0:220:873d:dbcc with SMTP id
 586e51a60fabf-24098cce9e6mr55776fac.49.1715099022028; Tue, 07 May 2024
 09:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240506110846.125652-1-nikhil.r@kpit.com> <CAApg2=TB81yXyxpt8kEaoHB-SCoJ8753w77FWby2m8Qj-nDEig@mail.gmail.com>
In-Reply-To: <CAApg2=TB81yXyxpt8kEaoHB-SCoJ8753w77FWby2m8Qj-nDEig@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 May 2024 09:23:16 -0700
Message-ID: <CAMKF1sp+htWDnwfzv26+s=7gmHORW5Ux320j=AMyzWxjvi4BcA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] xz: Update LICENSE variable for xz packages
To: rybczynska@gmail.com
Cc: nikhilar2410@gmail.com, OE-core <openembedded-core@lists.openembedded.org>, 
	Bhabu Bindu <bhabu.bindu@kpit.com>, Nikhil R <nikhil.r@kpit.com>, 
	Bhabu Bindu <bindudaniel1996@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 16:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199102

On Mon, May 6, 2024 at 8:33=E2=80=AFAM Marta Rybczynska via
lists.openembedded.org <rybczynska=3Dgmail.com@lists.openembedded.org>
wrote:
>
>
>
> On Mon, 6 May 2024, 13:09 nikhil via lists.openembedded.org, <nikhilar241=
0=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> Update LICENSE defined for xz packages to match the license
>> information provided in the xz COPYING file.
>>
>> The License information from PACKAGERS file of xz mentions
>> packages with lzma files are in public domain.They ask to
>> use GPLv2+, if only it's not possible to mention "PD and GPLv2+".
>>
>> Include PD license with GPLv2 to packages with lzma content:
>> xz-dev package contains lzma header
>> xz-doc package contains lzma man pages
>> xz packages contains lzma binaries
>>
>> Links: https://github.com/tukaani-project/xz/blob/v5.2.6/COPYING
>>        https://github.com/tukaani-project/xz/blob/v5.4.1/PACKAGERS
>>
>> Signed-off-by: Bhabu Bindu <bindudaniel1996@gmail.com>
>> ---
>>  meta/recipes-extended/xz/xz_5.2.6.bb | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-extended/xz/xz_5.2.6.bb b/meta/recipes-extende=
d/xz/xz_5.2.6.bb
>> index 3482622471..33496748bc 100644
>> --- a/meta/recipes-extended/xz/xz_5.2.6.bb
>> +++ b/meta/recipes-extended/xz/xz_5.2.6.bb
>> @@ -9,10 +9,10 @@ SECTION =3D "base"
>>  # libgnu, which appears to be used for DOS builds. So we're left with
>>  # GPL-2.0-or-later and PD.
>>  LICENSE =3D "GPL-2.0-or-later & GPL-3.0-with-autoconf-exception & LGPL-=
2.1-or-later & PD"
>> -LICENSE:${PN} =3D "GPL-2.0-or-later"
>> -LICENSE:${PN}-dev =3D "GPL-2.0-or-later"
>> +LICENSE:${PN} =3D "PD & GPL-2.0-or-later"
>> +LICENSE:${PN}-dev =3D "PD & GPL-2.0-or-later"
>>  LICENSE:${PN}-staticdev =3D "GPL-2.0-or-later"
>> -LICENSE:${PN}-doc =3D "GPL-2.0-or-later"
>> +LICENSE:${PN}-doc =3D "PD & GPL-2.0-or-later"
>>  LICENSE:${PN}-dbg =3D "GPL-2.0-or-later"
>>  LICENSE:${PN}-locale =3D "GPL-2.0-or-later"
>>  LICENSE:liblzma =3D "PD"
>> --
>> 2.25.1
>
>
> I'm not a copyright lawyer, but from what I understand public domain is n=
ot a licence. For a discussion see https://wiki.spdx.org/view/Legal_Team/De=
cisions/Dealing_with_Public_Domain_within_SPDX_Files
>

rather each PD is a license of its own is what I understand.

> The next version of xz will be 0BSD so the statement will change too.
>
> Regards,
> Marta
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199047): https://lists.openembedded.org/g/openembedde=
d-core/message/199047
> Mute This Topic: https://lists.openembedded.org/mt/105937026/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

