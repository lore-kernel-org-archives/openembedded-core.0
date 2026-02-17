Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58634E68147
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 17:07:08 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17072.1771348021806695290
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 09:07:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MwDKwd92;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-436234ef0f0so3152223f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 09:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771348020; x=1771952820; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eK5EpzWApLMEV07qWagfRyVQVEeTUfmvfOPOPrplkmA=;
        b=MwDKwd92HRO7BrWXZaxQDDgCpMNGJvcAPurkZz5u3EsFtXMeRGGspCK66r4y+Q8FIx
         SFiu6Uvb1L5VVfbLDESilmetf2QVkaRH2Zzl4medTd0YXAmkjUwRJ2ZKNiUNPx5bVIk3
         lelKn7mO0d7ckVnDuBSpuLjDlgCa+r6QgXpBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771348020; x=1771952820;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eK5EpzWApLMEV07qWagfRyVQVEeTUfmvfOPOPrplkmA=;
        b=JSS7uCjUMiXJghqtcv/Lw8Tfq9kKMwD6SjZBhxjVE+wiZbVQScDqPGhqVt8C0erf5o
         8W4RuUMBFr/iFDPv+Sm6+xFZBfBVxaoNCp+2LaLWEUGpMmnyBXRyzp/A7u63xnhGKiAD
         t1alI5nTpfxe6GdJc01+QtQHzJNu9cNkkcZgAOmEL8ECfRMf4pRYvU8O51slnBWZ1OBY
         ahhC1qbwta/LGfRZiHGvaSHTx8FsSa265evQ4QxwuZhiUSIXV4BjY67I/JoyDzTYz65U
         n2J3X+3NVuPsMzM2oY0A+fglnWSpsumkyeTsD7xYB+j0E9BPBiezbmJYDZR5E5ybss0b
         60IA==
X-Forwarded-Encrypted: i=1; AJvYcCVZnF8tA7FbPDYYpV+3H1aoqqEDPJAn4ojA5Wnw6CN+3NJisMij01cDi3es/16QYl032gYyvQaoW7wIfJDZjfn9AQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwXxpZKc4+n0wQjGm7MPSOgO2gDNibQabwlXn1c476xvAkJrtjR
	9yZshnfEmcpvRv++ze8OuRFnYmz6MvnaW6oJmEFISUbUO8mtAauzb1+m06H2UfwoJlk=
X-Gm-Gg: AZuq6aKLDgpdGx6DgZyZpBRDXYnn8TB4y+QqDmIw3vcRJr0F/8Vn4O9a3bMQqDrbr0l
	ZfpQNw+pEP5lTwHRSqDPp3FA83OReZQCo/LEIE75MRjPw9tTEmHe/Iv+SZURlAfGVyAqGoEHSEO
	mKnhLzF1NEyUC7u66iA9v5Eq9mov2RxCKG7ILBt/mynfFHXc6f2xQnPygr8DmlEggdPOBDTRzLG
	pcJFFVbVJ8yJag/9ex6MOosO6Ma1PirSJ2TxMI9M9wZnQ7MYBJkoiKu1u1QerUfcHweygEcdo6S
	opDXvTCB9oNsqQLj4e53GKXWVCKZ5FZEYjt87Um/IjU+lVbbVZEoDXdEnTwCk+RY7pMD8DQjcJ4
	NeyzlPrhXDwMJSqxNL5qaP9JfQexIUcJq00X5nmaY6XLClWp3i4nm56f/1ZsV8eCfzcDqFaFFx2
	bPozKa6hI3eEq5wZj5Ly4VurokInX4Sd2R0YKMW8ZL9uSkMvC0NUkENzjmgS315relop/YktVIV
	Zc8TrCKStbOhx6Be62z9g==
X-Received: by 2002:a05:6000:178b:b0:436:23a2:5e44 with SMTP id ffacd0b85a97d-4379791905bmr26746259f8f.45.1771348019960;
        Tue, 17 Feb 2026 09:06:59 -0800 (PST)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abcda5sm39883515f8f.19.2026.02.17.09.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 09:06:59 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 18:06:59 +0100
Message-Id: <DGHEGU3LY0RB.CZLXYGKHVD29@smile.fr>
To: "Amaury Couderc" <amaury.couderc@est.tech>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] avahi: fixes CVE-2025-68468
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260123103715.32186-1-amaury.couderc@est.tech>
 <DG64E3A1Z773.2J4Y398TR4E3C@smile.fr>
 <AMBP189MB319623FF519A834A108CF3DDF865A@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM> <AMBP189MB319653240811F4F1E57EC999F86DA@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <AMBP189MB319653240811F4F1E57EC999F86DA@AMBP189MB3196.EURP189.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 17:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231264

On Tue Feb 17, 2026 at 3:22 PM CET, Amaury Couderc wrote:
> Hello,
>
> Just a way-of-working question, I have sent the patches to the master and=
 whinlatter branches. Once these ones are accepted and implemented should I=
 resend the scarthgap patches?

Hello,

Good question!

I'm trying to keep the patches pending upstream submission around and
reevaluate periodically.

If you see such patch missing from my patch review request, definitively an=
swer.

You can also answer a patch to signal that it was merged and I will
check that it was not forgotten.

If the master review/merge ended with changes, send the upgraded version
to the stable branches.

Thanks!

>
> Kind Regards,
>
> Amaury
> ________________________________
> From: Amaury Couderc <amaury.couderc@est.tech>
> Sent: Monday, 9 February 2026 15:29
> To: Yoann Congal <yoann.congal@smile.fr>; openembedded-core@lists.openemb=
edded.org <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [scarthgap][PATCH] avahi: fixes CVE-2025-68468
>
> Hello,
>
> Thanks for the heads-up, just sent the patches to master and whinlatter.
>
> Kind Regards,
>
> Amaury
> ________________________________
> From: Yoann Congal <yoann.congal@smile.fr>
> Sent: Wednesday, February 4, 2026 11:53 AM
> To: Amaury Couderc <amaury.couderc@est.tech>; openembedded-core@lists.ope=
nembedded.org <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [scarthgap][PATCH] avahi: fixes CVE-2025-68468
>
> On Fri Jan 23, 2026 at 11:36 AM CET, Amaury Couderc via lists.openembedde=
d.org wrote:
>> From: Amaury Couderc <amaury.couderc@est.tech>
>>
>> avahi: fix DoS bug by removing incorrect assertion
>>
>> Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
>> ---
>>  meta/recipes-connectivity/avahi/avahi_0.8.bb  |  2 +-
>>  .../avahi/files/CVE-2025-68468.patch          | 32 +++++++++++++++++++
>>  2 files changed, 33 insertions(+), 1 deletion(-)
>>  create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68468=
.patch
>
> Hello,
>
> If I'm not mistaken, this patch does not have a master equivalent.
> Please fix CVE-2025-68468 on master and whinlatter (by upgrade or patch)
> and, then, request a backport scarthgap.
>
> Regards,
>
>>
>> diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes=
-connectivity/avahi/avahi_0.8.bb
>> index ffda85c0e7..8f8f4a0d88 100644
>> --- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
>> +++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
>> @@ -37,6 +37,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/avahi-=
${PV}.tar.gz \
>>             file://CVE-2023-38473.patch \
>>             file://CVE-2024-52616.patch \
>>             file://CVE-2024-52615.patch \
>> +           file://CVE-2025-68468.patch \
>>             "
>>
>>  GITHUB_BASE_URI =3D "https://github.com/avahi/avahi/releases/"
>> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch =
b/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
>> new file mode 100644
>> index 0000000000..3635cc8d53
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
>> @@ -0,0 +1,32 @@
>> +From 483f83828cfda965fac914ff1b39c63c256372b2 Mon Sep 17 00:00:00 2001
>> +From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
>> +Date: Sun, 2 Mar 2025 18:06:24 +0100
>> +Subject: [PATCH] core: fix DoS bug by removing incorrect assertion
>> +
>> +Closes https://github.com/avahi/avahi/issues/683
>> +
>> +CVE: CVE-2025-68468
>> +
>> +Upstream-Status: Backport
>> +[https://github.com/avahi/avahi/commit/f66be13d7f31a3ef806d226bf8b67240=
179d309a]
>> +
>> +Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
>> +---
>> + avahi-core/browse.c | 1 -
>> + 1 file changed, 1 deletion(-)
>> +
>> +diff --git a/avahi-core/browse.c b/avahi-core/browse.c
>> +index 86e4432..79595fe 100644
>> +--- a/avahi-core/browse.c
>> ++++ b/avahi-core/browse.c
>> +@@ -295,7 +295,6 @@ static void lookup_multicast_callback(
>> +                 lookup_drop_cname(l, interface, protocol, 0, r);
>> +             else {
>> +                 /* It's a normal record, so let's call the user callba=
ck */
>> +-                assert(avahi_key_equal(b->key, l->key));
>> +
>> +                 b->callback(b, interface, protocol, event, r, flags, b=
->userdata);
>> +             }
>> +--
>> +2.43.0
>> +
>
>
> --
> Yoann Congal
> Smile ECS


--=20
Yoann Congal
Smile ECS


