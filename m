Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8A8C77B61
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 13:44:59 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web10.20166.1682689497925959496
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 06:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=AwcQS6sX;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: raj.khem@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-42e6ac0cd5aso2792216137.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 06:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682689497; x=1685281497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tqt1WhGpwHBUKiNA1TDM18arTCGg53Ajw5wKONNAlXg=;
        b=AwcQS6sX0OwS5JN/uUSJXUVeYdwNudJgPhG4sHjWJZyYzUA0XgBPcHWyaUWcwNo/I8
         6eYPywWg3A6zA/0Unp+rrbt+SwebhJxUXQmROVGUxSaYUBVOOo7OZ+Ly3FoE6TxulaEm
         SfF8UvFFwDFvxHIcG5/htq8dpk3ztkUl2jioFsK7oWpASMlLTlmOL1C6y4s4Z86RI6jA
         h2WvMvD6M7kzDufxbJ6vK8iU10amRxQrTe0XQLSA/8V74GqMjm/WRytf5mbXWf1C/8G4
         BgW/OMyPOYx67tbeaSFeBaFrDucAuFPXlYVa1vZZvXAXLerH7AMuCuGMhBKwaCJeLfXO
         V4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682689497; x=1685281497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tqt1WhGpwHBUKiNA1TDM18arTCGg53Ajw5wKONNAlXg=;
        b=NmBYET1Uwq5tHL1q9/cPSVtP9UOV6KiYO1SpQ+q8qycu1Hoti9xMAISDmE7GD6WgvI
         kolAejT5odxHFs4FQco/OPbANPDqtBbD9GeRZrnJMKmV4MGsDF8SiQavh1KDohlKcFq5
         MFuKA4Y3HlR07yjLrZG+MaVhZp9awfMTuIBonAOKi20I52YUpwM5GnqMN1TMQl/Cswv8
         7pce4P8hl8HAyDhYqBy6EfZTKR4TyizMf7uOHAEwuFMHn6bcRLxThL2WDoIBTtidzN1j
         SLITriwv+mpc6s61cZHaKMZ5dO2gJZqoBBJmsG4HT6XrfnhY5Z3JVBCN3ORYBuoMLcBJ
         PWVg==
X-Gm-Message-State: AC+VfDzZK9qDNMpAAJVhLtda7Fd2l97mhL9m3IimId0LzFHVIUXRVSoO
	kPOSORCP60G7xVO3VjIcDibuPeJQRLxMBYU6Rrk=
X-Google-Smtp-Source: ACHHUZ5Ye3ax5bibI9JpPGxhPBblnf+OdJEw6LB4jcRTGWTLmdT7rcRguJvfNwu6gGnNOPbL+5Vbcot7aCnaAUEVFAE=
X-Received: by 2002:a05:6102:c4:b0:42e:6a3e:9072 with SMTP id
 u4-20020a05610200c400b0042e6a3e9072mr2426858vsp.25.1682689496886; Fri, 28 Apr
 2023 06:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230428032030.2047920-1-raj.khem@gmail.com> <CA+chaQezVy_zhi-QDsz=PWdqBsSqt7YCO+5mcAHboNFuzc4j5A@mail.gmail.com>
In-Reply-To: <CA+chaQezVy_zhi-QDsz=PWdqBsSqt7YCO+5mcAHboNFuzc4j5A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Apr 2023 06:44:30 -0700
Message-ID: <CAMKF1srA3ofKyn=J+jup_v-H=k2o46XutxukZEknazFKCnPEXQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake.conf: Add -fcanon-prefix-map to DEBUG_PREFIX_MAP
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 13:44:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180528

On Fri, Apr 28, 2023 at 4:18=E2=80=AFAM Martin Jansa <Martin.Jansa@gmail.co=
m> wrote:
>
> Do you already have a follow-up change for meta-clang which seems to be b=
roken by this change?
>
> clang-16: error: unknown argument: '-fcanon-prefix-map'
>
yes
https://github.com/kraj/meta-clang/pull/782

> On Fri, Apr 28, 2023 at 5:20=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
>>
>> This should help canonicalize the relative paths and symlinks
>> during cross compile, -fcanon-prefix-map is newly added in gcc-13+ [1]
>>
>> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108464#c8
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/conf/bitbake.conf | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index d94ffe1df9..453bef37a9 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -644,7 +644,8 @@ EXTRA_OEMAKE:prepend:task-install =3D "${PARALLEL_MA=
KEINST} "
>>  # Optimization flags.
>>  ##################################################################
>>  # Beware: applied last to first
>> -DEBUG_PREFIX_MAP ?=3D "-fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN}=
/${EXTENDPE}${PV}-${PR} \
>> +DEBUG_PREFIX_MAP ?=3D "-fcanon-prefix-map \
>> + -fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR=
} \
>>   -fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR=
} \
>>   -fmacro-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR=
} \
>>   -fdebug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR=
} \
>> --
>> 2.40.1
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180526): https://lists.openembedded.org/g/openembedde=
d-core/message/180526
> Mute This Topic: https://lists.openembedded.org/mt/98551742/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

