Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB637C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 16:14:20 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.54944.1703175259440232905
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 08:14:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=curDgQxN;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2043e721daaso27085fac.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 08:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703175259; x=1703780059; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVzoq4TC+a/oCd6gJqim3pwj6T/4dHRDm1x32SPDlmc=;
        b=curDgQxNuGfxL0EOgP/WpFbdDssbKi2peKpwdEaaLcsPKRHSPniahbKsez9xKVxT3a
         2Y6dLrbD6SwrCk1VAzjdxoll10T5VP4SNhTwYFsxCknrdHPwEA7ucubu6iqI3wyfB+Yr
         aWHgTmuI9+U7gLljTzGA8XXMgdMp607rRbYZWrT7/8LVSNhzJXZRT30vFo5ECQX0r1DQ
         WHNmE6xV5AKQ5VJEKZB7gPwPgA1BjpJ7S1P0nKA9lRdxV5FuCdFJfOvgqDe2p9yd3yw1
         CU1P7cyQZdNy9OZ7Tab7wVCD7cmNLUsd0M6RKli98LIePrvs0FFkPwa3aCGIkkhm4h2W
         tfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703175259; x=1703780059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VVzoq4TC+a/oCd6gJqim3pwj6T/4dHRDm1x32SPDlmc=;
        b=DvcVOw2iF6bs6oQm4n9L+vEQ98qSx3Nd+kCB/Hu1Jd4GmqIQsaZBnIhMf5+/0dUkfu
         jSSn+sAejJvNsHptsRtFus2KJAQerewz22Bxvn+C3sV15Bgmv0fcS0EdOjHDdCgSKtyZ
         ycrIXdtG9exToBLAt1cGC/WH7Nq13XTJk1nIM1W7QCyhnWOAyzQ6I5RJ2ViQGcBy4uwS
         1UveXwW5ieSpYy23/Tzn6+ayWHLabFF03cCM+5WygvGebKexyBQgJDLPe1vFWhnikpBc
         bos/Q+OgPmgLUMl9S8GDUhKa9Daytj/sygHf+wzu5VEhSH69Kn6JTEneVfx7G6/nlRu0
         YbUg==
X-Gm-Message-State: AOJu0Yywes3Lx1LveDF5EozUv5tyNVE9F59GdBLSlwGyvtibf0XToOY5
	PhRUUjsV/XVQVy61jZDpqBpy3L+KuW0GGzVfwLU=
X-Google-Smtp-Source: AGHT+IHXvnA3IU+t8GBDa5KLDptgedGy3l9JJRDBYxfxmszXKQXKdRl/594Mx5M2AyQ9L+HOQmUeed5YLtvZxoAN5io=
X-Received: by 2002:a05:6871:2b26:b0:1fa:c88a:e941 with SMTP id
 dr38-20020a0568712b2600b001fac88ae941mr33855oac.15.1703175258671; Thu, 21 Dec
 2023 08:14:18 -0800 (PST)
MIME-Version: 1.0
References: <17A23F37CD7211A7.10836@lists.openembedded.org> <CAHUKmYZ_czf-Zg=Mr5fN9nREnq3iE8VAiLSRS7hOAN7qRcTX5w@mail.gmail.com>
In-Reply-To: <CAHUKmYZ_czf-Zg=Mr5fN9nREnq3iE8VAiLSRS7hOAN7qRcTX5w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Dec 2023 08:13:52 -0800
Message-ID: <CAMKF1sqpj_PCmQ5KRevqiBMxi6up4rdp3xZ-9TwD3fLOAzhouw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v4] kernel.bbclass: make do_symlink_kernelsrc reentrant
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 16:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192838

this fails in linux-variscrite recipe from meta-variscite-bsp

https://snips.sh/f/9klGZxlCRE

On Tue, Dec 19, 2023 at 5:40=E2=80=AFAM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org>
wrote:
>
> Patch v4: use idempotent copy of the files instead of simply skipping the=
 code (see discussion under v2 of the patch).
>
> On Tue, Dec 19, 2023 at 2:38=E2=80=AFPM Etienne Cordonnier via lists.open=
embedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org> wrote:
>>
>> From: Etienne Cordonnier <ecordonnier@snap.com>
>>
>> The function do_symlink_kernsrc is not reentrant in the case where S is =
defined
>> to a non-default value. This causes build-failures e.g. when building li=
nux-yocto, then updating
>> poky to a commit which modifies kernel.bbclass, and then building linux-=
yocto again.
>>
>> Bugzilla: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bugzill=
a.yoctoproject.org_show-5Fbug.cgi-3Fid-3D15325&d=3DDwIDAg&c=3DncDTmphkJTvjI=
DPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m=
67E&m=3DVB1zXAiE9q_CqM9DgoA0BbtloUxpQE_rQ7eqk7HGzBW9KzFu44K9hS1iahsqSuIk&s=
=3D9Cr8vwWgUwwGM5oCO07DB4sO9sQpMCdweS1u8CmZ0Qw&e=3D
>>
>> Tested with a recipe "my-custom-linux" which unpacks sources to a custom=
 ${S} directory
>> and ran symlink_kernsrc several times:
>> $ bitbake -f -c symlink_kernsrc my-custom-linux
>>
>> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>> ---
>>  meta/classes-recipe/kernel.bbclass | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ke=
rnel.bbclass
>> index 9ff37f5c38..42c5519f81 100644
>> --- a/meta/classes-recipe/kernel.bbclass
>> +++ b/meta/classes-recipe/kernel.bbclass
>> @@ -189,11 +189,17 @@ python do_symlink_kernsrc () {
>>              # drop trailing slash, so that os.symlink(kernsrc, s) doesn=
't use s as
>>              # directory name and fail
>>              s =3D s[:-1]
>> -        if d.getVar("EXTERNALSRC"):
>> +        if d.getVar("EXTERNALSRC") and not os.path.islink(s):
>>              # With EXTERNALSRC S will not be wiped so we can symlink to=
 it
>>              os.symlink(s, kernsrc)
>>          else:
>>              import shutil
>> +            # perform idempotent/reentrant copy
>> +            s_copy =3D s + ".orig"
>> +            if not os.path.isdir(s_copy):
>> +                shutil.copytree(s, s_copy)
>> +            bb.utils.remove(s, recurse=3DTrue)
>> +            shutil.copytree(s_copy, s)
>>              shutil.move(s, kernsrc)
>>              os.symlink(kernsrc, s)
>>  }
>> --
>> 2.36.1.vfs.0.0
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192731): https://lists.openembedded.org/g/openembedde=
d-core/message/192731
> Mute This Topic: https://lists.openembedded.org/mt/103262114/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

