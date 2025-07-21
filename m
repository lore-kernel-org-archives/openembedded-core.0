Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5E9C83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 15:15:24 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.43737.1753110923415821182
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 08:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=idbnB4D+;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.182, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70e5d953c0bso46179507b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 08:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753110922; x=1753715722; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aAsDD5Yq7K369H9dtOuVUehpCRyeP0g3yz6TL4jdJ5g=;
        b=idbnB4D+u1yHTDjojdN+KqHxO1y2pB0Jx3GJVEFXa5+jl9AoxC8bicLgkuIV+wB+RG
         6wd20QIVXIkXAsEOg056lgZKtGn9gQadzJT1OdpQ+maDkJGwxKCuPfTd4fePk0Wyct39
         0kqyc1C9j+vhbGXW6iP6JNIXQBw8JwKfDWXLFarm00DoP0r0SDpfRZJ3leViKY8MJyuV
         q5mka4CBeqsktCI+TZF8rbMz56VmkSKOH5OMF8XdlkUVDI33UZxbXpyGg1GBHp802yrU
         N7JMm3lzwM3jolvlfWsJWdLMBrQYBP8WA6K4gkhIoOUOW/cBGG0uVQfzyiYE831e/G/B
         4WWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753110922; x=1753715722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aAsDD5Yq7K369H9dtOuVUehpCRyeP0g3yz6TL4jdJ5g=;
        b=jLOrTB94gVS+yvohR1xh1OhHcVTfepen6uAXwUtw0T18tsLMlj2OTiTI5+Z9i8R/f8
         QsSdqNLDfhffDYDmTgM7wgONas9ROfVA+I88K5H8FOg6ta+9h96suWXiALb4RDHhJhti
         u8xF6pET8fN63XJOzlkFO9cR2b+KTFL/GxKpi6LbCJrmbjhquymAQTOtfffD8I2Durs6
         6BfETLiki4yondMK7paclAtn2gvdnIHH4MbABW70JjT6Ga4SUwwlwEioKmwKZvCOKP49
         X7+rCjcRXH7PZwKZk54zZofBiQomdZ4xtfWWS9FpQxaBT4QJJMb9/C8Oxi+Q+cxrDHeU
         by5A==
X-Gm-Message-State: AOJu0YzwKFh+nCLmJNnvwggzNYPS8BLM6oDRP0ISUOENIrqwSgx8Q4+D
	Wsd4D0x9jFnfE0iQrSAAbSeRmLlo0nxcPs4E7C7uo1IQYZIbdLLx5sNGnrh67Mdesnemo44ynia
	GV+/1wzNlGg9pahvVnTNQeZIqrd3ky+FImgUrzTrspA==
X-Gm-Gg: ASbGnctZZt8a+zjrCPBlxjB2fde/aLTUi0UJO4hUsJvV9hKcsPq49e2a8ALdJyMe4NL
	7r0HG+SMw0KV0yLWiGbDEgUe2IGc9RVx1d3Ch/T4R3HPfVJZ09sfWS8n5hioQGOEItC161TeyF6
	SD43rGryW41PpUK0f4K9XI1sW1TAZ5ZFAOphFwcqUQvBeKicZOSN/ixtu8iRNDw70mhkJFSD1Zu
	dZkC5QgsFanfLkjLe2CrUl9l4ZCV+NJu9wq4NCbUYgJjb19
X-Google-Smtp-Source: AGHT+IHfOQLtk8fhAExWbZkbAMk440VTe+4lEmGhMRzPhuyFhiva2kIEVeJdR+cpqI6maM9tgk77uJZ0Iik2zBc/xqc=
X-Received: by 2002:a05:690c:600f:b0:70f:751c:2d8a with SMTP id
 00721157ae682-71952158e20mr159140317b3.3.1753110922162; Mon, 21 Jul 2025
 08:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250701103252.6703-1-vanusuri@mvista.com> <CANQUz18dZfkQWXPC9ZgVc-VP86Q3-pPcpHL31K8PbTF7k-17Ng@mail.gmail.com>
In-Reply-To: <CANQUz18dZfkQWXPC9ZgVc-VP86Q3-pPcpHL31K8PbTF7k-17Ng@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 21 Jul 2025 08:15:11 -0700
X-Gm-Features: Ac12FXxiSJ-iLGIDeZIbpx8Re7BHmg9Ws0oeHXlSJgADsZWAbYRazw40WB_qE0s
Message-ID: <CAOSpxdbY5+VfZcxHvpEsQw3GJytp2qg93trwSrT6zbe1hDiDfw@mail.gmail.com>
Subject: Re: [OE-core][master][walnascar][scarthgap][PATCH] xserver-xorg:
 upgrade 21.1.6 -> 21.1.18
To: Vijay Anusuri <vanusuri@mvista.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 15:15:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220700

On Mon, Jul 21, 2025 at 12:16=E2=80=AFAM Vijay Anusuri <vanusuri@mvista.com=
> wrote:
>
> Hi Team,
>
> Any update on this ?

I'll let Richard comment on the status for master branch.

I obviously can't take it for stable branches until it is accepted in maste=
r.

A couple of comments though:

1. a typo in the short log, 21.1.6 should be 21.1.16
2. Sending a patch targeted for master and stable branches greatly
increases the odds that it will get overlooked for the stable
branches.

I use patchworks to track stable branch patches.  When the patch is
accepted in master it gets marked as Accepted.  Unless it is top of
mind for me I am unlikely to notice this change and take the patch for
the stable branches.

Best to send the patch for master first and then send separately for
each stable branch when it has been accepted in master.  This makes
tracking things in patchworks much more reliable!

Steve

>
> Thanks & Regards,
> Vijay
>
> On Tue, Jul 1, 2025 at 4:03=E2=80=AFPM <vanusuri@mvista.com> wrote:
>>
>> From: Vijay Anusuri <vanusuri@mvista.com>
>>
>> xorg-server 21.1.17
>> This release contains the fixes for the issues reported in today's secur=
ity
>> advisory: https://lists.x.org/archives/xorg/2025-June/062055.html
>>
>>    * CVE-2025-49175
>>    * CVE-2025-49176
>>    * CVE-2025-49177
>>    * CVE-2025-49178
>>    * CVE-2025-49179
>>    * CVE-2025-49180
>>
>> Additionally, this release includes a fix for CVE-2022-49737 which was
>> issued after the fix was merged back in 2022 and several other various f=
ixes.
>>
>> Ref: https://lists.x.org/archives/xorg-announce/2025-June/003609.html
>>
>> xorg-server 21.1.18
>> This release contains an additional fix for CVE-2025-49176 from June 17
>> security advisory: https://lists.x.org/archives/xorg/2025-June/062055.ht=
ml
>>
>> Ref: https://lists.x.org/archives/xorg-announce/2025-June/003612.html
>>
>> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> ---
>>  .../{xserver-xorg_21.1.16.bb =3D> xserver-xorg_21.1.18.bb}        | 2 +=
-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.16.bb =3D>=
 xserver-xorg_21.1.18.bb} (92%)
>>
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb =
b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
>> similarity index 92%
>> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
>> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
>> index 38c81f2372..14c45be432 100644
>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.16.bb
>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.18.bb
>> @@ -3,7 +3,7 @@ require xserver-xorg.inc
>>  SRC_URI +=3D "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-=
hardwar.patch \
>>             file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch =
\
>>             "
>> -SRC_URI[sha256sum] =3D "b14a116d2d805debc5b5b2aac505a279e69b217dae2fae2=
dfcb62400471a9970"
>> +SRC_URI[sha256sum] =3D "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0=
f2994deff90116352"
>>
>>  # These extensions are now integrated into the server, so declare the m=
igration
>>  # path for in-place upgrades.
>> --
>> 2.25.1
>>

