Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4E6C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 14:42:14 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.23796.1739976125734936643
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 06:42:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DgdrwJd/;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.173, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6f4434b5305so59521627b3.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 06:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739976125; x=1740580925; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4LMJszcts7NgcUGtUOjTJWDeD+LtM2O+8wwlZsKrgw=;
        b=DgdrwJd/wxrY0eEH7c5SkLZIr47wt0YPuP14WIyhleuovbxBRZbPoxrw5cRX4/SL9S
         D6pqb74IQIHZop/wgJQE71dImIVZmGM13sZJWDASytjgfTf9/L04jnOWgOV6TA9410lZ
         oqUTA700pBEcyjC3ful+bjaI7SyNWbaNsHL2JX9VDENtnUgk82XC1YdqwR3hz0EEAvcX
         qqD/+QV5Wr3fWE7Fqis9S/nNsnF4xF5AJWGIc6esYy21s552Xl+09rOiJqD4wW54OCzp
         npWAWy/sWwqw1y6pPmM7wjWf2Qu/u5J5ml2HsS0d+aX/vtv+WZ/pKKY9ODVJrd+3Lixt
         f8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739976125; x=1740580925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4LMJszcts7NgcUGtUOjTJWDeD+LtM2O+8wwlZsKrgw=;
        b=AZKxpE3t/DUy52iYdS+2DzG45QOnuOVlciCEz742h7/J9q6OlD4N4a3FJqMDrIw3Xn
         ThTigpSYTjs+Phvq6uYy+CDOOzroGC2UN9yWmoxI/wZnHaQLn1JcakQwTkAYki+VhRC9
         BadhXsUsLNMj2bWTfXZfCFStio+Y2W7lleWCKTlmgLVXlTG4ttc2a4KedfhO7ddSonsy
         jFYjKKBV+vyg4y/HM4epVltM3AP/ZJUmW/4lHWqoBMzvtTh+gambVpIjNW2mthWyDrz/
         A4HPBJDgQswHPWHq/qj4PGKKDcu+LVYOKDQ0OcGsN3W4XMBXXCPbbIAV2r/2unqRIQU7
         V7zw==
X-Gm-Message-State: AOJu0YwS9eTB9LkkOuJ1p6kjmhkCZOYN/M1QJxvu2hADHQTyJBIehOGB
	iUfvexjLw79HnF5Mq6oUPO4uflP/QuDR8FRMKWJnSxW/4oGoISkxc+Ho/ud0wa3EIMgnB+EzTly
	2V3vsx5rMGHRrs+mEUboncJ3ZaUjUbbE7KdtjXQ==
X-Gm-Gg: ASbGnct6e9SW5wHnHYb9+wLIHqxozuQJgHEgplf1oscQWagW+rj1Bu+7oJF64+Obe+c
	07UKgdCBLAEfhgwh1v18vER4n8Jp9z49TgpDaDWgxXEmDnlygZAdzNc5M0i/X/axLUyrTq/O2U5
	2Y110kUAySVElg2jdzNWIEhEP+WPfe
X-Google-Smtp-Source: AGHT+IFfiTUJsty0rpp4Yrr7GXc2BpbAeQXFk899rv6hqsT2V1t6Qtt8NomX1IXbjjxDaR+VvusKyOAMx4m+v0E7KgQ=
X-Received: by 2002:a05:690c:9217:b0:6fb:91a9:94d9 with SMTP id
 00721157ae682-6fb91a9969emr63252227b3.2.1739976124820; Wed, 19 Feb 2025
 06:42:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1739913090.git.steve@sakoman.com> <a1b322d5dde27461a6b972b051a120ef3c96d204.1739913090.git.steve@sakoman.com>
 <CAMSfU+7yPYaFN_uoJd0wkeehnbnnF1RZVxbviW6p7wwj+ukEdg@mail.gmail.com>
In-Reply-To: <CAMSfU+7yPYaFN_uoJd0wkeehnbnnF1RZVxbviW6p7wwj+ukEdg@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 19 Feb 2025 06:41:53 -0800
X-Gm-Features: AWEUYZkxAE-J55odQ1gJDx2V0KbLoyxhSBpEkkXcr4sW4pjIeDPnYo3HWfvul2s
Message-ID: <CAOSpxdbQgwQ6qOyc8hDd16wtH3g=WS5e6wHzQTw-JpUEsE54NA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 1/7] subversion: ignore CVE-2024-45720
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, 
	Sofiane HAMAM <sofiane.hamam@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 14:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211709

On Wed, Feb 19, 2025 at 12:33=E2=80=AFAM Yoann Congal <yoann.congal@smile.f=
r> wrote:
>
>
>
> Le mar. 18 f=C3=A9vr. 2025 =C3=A0 22:15, Steve Sakoman via lists.openembe=
dded.org <steve=3Dsakoman.com@lists.openembedded.org> a =C3=A9crit :
>>
>> From: Peter Marko <peter.marko@siemens.com>
>>
>> Reference: https://nvd.nist.gov/vuln/detail/CVE-2024-45720
>>
>> This CVE is relevant only for subversion running on Windows.
>>
>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>
>
> Hi Steve,
>
> Sorry to bother you with this but Sofiane Hamam gave its Reviewed-by here=
:
> https://lists.openembedded.org/g/openembedded-core/topic/111147177#msg211=
378
>
> He worked on fixing the CVE but Peter was faster so he gave its reviewed-=
by. It would be nice if that ended up in the repository.

OK, I'll make it so!

Steve

>>  meta/recipes-devtools/subversion/subversion_1.14.3.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/subversion/subversion_1.14.3.bb b/met=
a/recipes-devtools/subversion/subversion_1.14.3.bb
>> index 1ef3d498a5..679228cbb8 100644
>> --- a/meta/recipes-devtools/subversion/subversion_1.14.3.bb
>> +++ b/meta/recipes-devtools/subversion/subversion_1.14.3.bb
>> @@ -19,6 +19,8 @@ inherit autotools pkgconfig gettext python3native
>>
>>  CVE_PRODUCT =3D "apache:subversion"
>>
>> +CVE_STATUS[CVE-2024-45720] =3D "not-applicable-platform: Issue only app=
lies on Windows"
>> +
>>  PACKAGECONFIG ?=3D ""
>>
>>  PACKAGECONFIG[boost] =3D "--with-boost=3D${RECIPE_SYSROOT}${exec_prefix=
},--without-boost,boost"
>> --
>> 2.43.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#211653): https://lists.openembedded.org/g/openembedd=
ed-core/message/211653
>> Mute This Topic: https://lists.openembedded.org/mt/111258880/4316185
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [y=
oann.congal@smile.fr]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>
> --
> Yoann Congal
> Smile ECS - Tech expert

