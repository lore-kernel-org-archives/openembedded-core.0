Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03DCDCAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 09:30:21 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.9811.1758187818479699419
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 02:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BYsw13k1;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-571a58b385aso987083e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 02:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758187816; x=1758792616; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0fZU+H8PShJNFYLS9ZxWT5MFQH+PlcU/J3U3YuJzfs=;
        b=BYsw13k1fn0H5NkEzYhCR1mmGkNP875kH13s1e+QaTPhBuAkFeK5yAI7igKPlklK/r
         2Rgv1jgAsh+w3reeIYuNwdXgS6GbxTSOwmzoxxsurUP3WYcnz1h9M12EmqC40cIgRgW5
         Aw50WmJ+Y+opHdNobsc0fv9WRU/ONUQ/A304dznZ+uMXBMPw3vwhOfkDEQeREM8nxOS4
         yZ8Y9+lgkQyOu2B35+BiabhrUa4ntPICkmFUOsG06ok0KOhLVX4HIt+n2hUX3FxmGnJ0
         X6h4YX7O4+cjGFd7h5x0xcCs3FebuANyTCmkNxmqCCUYc93eUmU8TbxvJlN196SKGSuS
         q8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758187816; x=1758792616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0fZU+H8PShJNFYLS9ZxWT5MFQH+PlcU/J3U3YuJzfs=;
        b=EPnyPCfWp5mfo3BEVwWC+5pzu37BDS6gQB9Iw/IILHb2+ffUMYngNv6Fz+4dz5lSjD
         T8IfFTzxVuxYHWJxND8o2Bu41AjlirWcN4nL3oAE8t2xblTct0fcmCeufEIEcxOK7QMu
         POHDCnxAXb3kkpod4aS2HDXonfEXSduQ4kxa2HUpk9B3SVxPFZpQOL+t3yRT7n13x8pt
         BdBnP1+NcvuOC7MsJgHI+j5NQxTQXl7bwbtjDC9kZ3PI93razNoIFsesjGPRRAxT6goD
         De5tIOWRU1630G5UDMpQ1MIaKMpL1caV6Kw10kuimAeAYWmogtIaCFI1G+hxmrsf2aBq
         eumQ==
X-Gm-Message-State: AOJu0YzeM5/c5AVro8gmGi7DbaG27MFJi6zxbD0QmeY9Dnmsvct1hsZC
	tvn97XXPtHcsB5InLb9oYOtBv8tynd6RBjWh54WH0mAdQbWWxQTzwNDnEdC7PxP4tuG+toekBDO
	qbMt4vEqNJn7Mr6eVeCvp6Q68LsAVbvs=
X-Gm-Gg: ASbGncsaDTtRoOVCVAfwguhm2+as9EHEFbubGo26H5xgix2Ca2AojijhpWzv/U06UWn
	8Q5iq8GFPmABO89zYIe55UrSl48LetA/kOINgo23xyLqfL1BSTzYE3P83nqaVHl0FgJGAtaHPyD
	JWPyaOH3PK0xU52b6M4TkSbCZYTe1PH/1Ul+uhwAdLXm5m+FZVDq5Y3zkepXgLryzbtztdN4JX+
	TCRTnGN94s7Bbv1Ft+pDGLBK/bL
X-Google-Smtp-Source: AGHT+IGVatdSqJWmFzTc3RypsEt4jlMgSYJuL3dbZkFZtmR+D/7cVSZm2TGHaOsHzoRG+j/9+GzQITrG8xkVIRe3A/g=
X-Received: by 2002:a05:6512:1320:b0:55f:43ab:b214 with SMTP id
 2adb3069b0e04-5779619ec12mr1575587e87.15.1758187816160; Thu, 18 Sep 2025
 02:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250917131250.2490358-1-martin.jansa@gmail.com> <CAD=4a=UYeUgm743mqWQbZ7N4=B0FO0M5G_PCehy6OVCJ+Vh-PA@mail.gmail.com>
In-Reply-To: <CAD=4a=UYeUgm743mqWQbZ7N4=B0FO0M5G_PCehy6OVCJ+Vh-PA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 18 Sep 2025 11:30:03 +0200
X-Gm-Features: AS18NWAUM4LqyjYLQX6mGFySZy2Yux7-YT6moZL_CJdKZ0q6VfS6fuvQKqF6CH8
Message-ID: <CA+chaQdK6s-=SLo8uyHfCgY4eZkVe3xWw0cZH8hUE_JATSt6oA@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCHv2] sanity.conf: Update minimum
 bitbake version to 2.8.13
To: Ernst Persson <ernstp@gmail.com>
Cc: openembedded-core@lists.openembedded.org, steve@sakoman.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 09:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223633

See the https://lists.openembedded.org/g/bitbake-devel/message/17999
thread, in the end v2 isn't needed and 2.8.1 will be used and the
extra tags will be deleted from bitbake repository. Steve is aware of
that and will surely use the correct version of these patches (bitbake
part is already merged by RP)

On Thu, Sep 18, 2025 at 11:10=E2=80=AFAM Ernst Persson <ernstp@gmail.com> w=
rote:
>
> Why the V2? I think the original "2.8.1" was correct for Scarthgap.
>
> Den ons 17 sep. 2025 kl 15:12 skrev Martin Jansa via lists.openembedded.o=
rg <martin.jansa=3Dgmail.com@lists.openembedded.org>:
>>
>> From: Martin Jansa <martin.jansa@gmail.com>
>>
>> Needed for multiprocessing module in bb used in the next commit.
>>
>> It was added to bitbake in 62be9113d98fccb347c6aa0a10d5c4ee2857f8b6
>> which was backported to 2.8 branch and tagged as 2.8.13
>>
>> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>> ---
>>  meta/conf/sanity.conf | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
>> index d2f56a3fb0..45ff2fc09b 100644
>> --- a/meta/conf/sanity.conf
>> +++ b/meta/conf/sanity.conf
>> @@ -3,7 +3,7 @@
>>  # See sanity.bbclass
>>  #
>>  # Expert users can confirm their sanity with "touch conf/sanity.conf"
>> -BB_MIN_VERSION =3D "2.7.3"
>> +BB_MIN_VERSION =3D "2.8.13"
>>
>>  SANITY_ABIFILE =3D "${TMPDIR}/abi_version"
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#223602): https://lists.openembedded.org/g/openembedd=
ed-core/message/223602
>> Mute This Topic: https://lists.openembedded.org/mt/115290739/4947266
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [e=
rnstp@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

