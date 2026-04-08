Return-Path: <hjenemark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB7DFB518C
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 09:21:01 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.102078.1775640054882378032
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 02:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=domMIp7n;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: hjenemark@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-793fdbb8d3aso63727347b3.3
        for <Openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 02:20:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775640054; cv=none;
        d=google.com; s=arc-20240605;
        b=MCYb83jT474rzC2zQfmxtYE84/cfaJwHvTl0JxYRHU5dFKed+01xKkJRQYYMyredRx
         EdnkXjFwfyBmI2bcrvjovyivpaRue8AVe6MQ2GX9mQSaGsuqveAlc6p9UnH7tmSEQ7W4
         q6htIB7NedfPgpx/moYL/q4V0K2vKmG3iyuy5rZWs84ItnjTCmKiJ4Boqmr8o2UmieG5
         AvYybXbj1P93EsMigoLu8i3kFVdJvVch8JP0oRnjdYJBa7q1q1WAOWQJF5WG6B2DAhXI
         oKIy3/0Vvd8MdfSGAvKugw77GeU6CIgfoFtu6130TQx7uezdaA7j7ofggrr2Mq/6ZND3
         GNeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=wbbIx1q2EcJ4JQ6egH6uNbNWpWXRmanr+iHCoCiHA9U=;
        fh=RPljdeHOx8Yl6b2h7xIAMkoYmtM9H21HK744CATy1Sk=;
        b=lpxJ32kJoVlpP4x0uj3/bV7EzwxfdlGcTa04G3G7/IrVCohAWFLrnxlN1/4tGqILnL
         zROvMEl1tdRF9AApkyJt//9bM+DHBevtuyug7kSFKk67mO/eC2MJ8yfG+CpfNWC9TZ0P
         GSNf0NhJK2cjFFvMCS9AOVUls8quRmZiW9MZ0LlBd200IJxxRhCf98b/T44vpt8MPe3i
         kF0QZMWFNjtyRyU5NYXBYMgjqy8uNU6C3GuCgr1LJTVqN25uKjP+GAdgYvzoXauCzWiy
         ZNKsXPpXoZ+VNUvKlzhyDMVFupgOgX1U/HBSIyCDqZm5B5XRnUG1X8l9si+cuKpraZrR
         LW3A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775640054; x=1776244854; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wbbIx1q2EcJ4JQ6egH6uNbNWpWXRmanr+iHCoCiHA9U=;
        b=domMIp7nmsDdLvB2fSLsCLCMBAlinug3Owe7FugXz17bsQAT64fKFmNgDf8PHfh/AX
         Z++5ijVRqqT3PdhgW+v2DHLFOy9U6LsIbDHaKzMASGHljxgIuFS6KUoAlIuTxeXfThMd
         56QuEAjQSSpZhcroh4T3+81T5V7ECWGUVgvz9qcKEJyLe4ETgTru0T9//z4nbqHdAl6Y
         y0nUSc8tosU8HTEpaolD9tIat8HYWhg4qIorX+5a/2kc9ynr8zeAt8QWpKkEc+Iu7PU1
         p2keGdUTQuOBKVIvaF4JMfPKdxexd3lLdAHnTBeMxkvEavg8O4I6uKC3XukcOKs89rgZ
         YRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775640054; x=1776244854;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wbbIx1q2EcJ4JQ6egH6uNbNWpWXRmanr+iHCoCiHA9U=;
        b=GJxRcYpqkbC/wEvmKjqot9AQ81UVBaZt9tSCENC6LP6r5YglucqcnhY6K1afgdaHtr
         TUbBQgHQVfI34/yBS8c9EMdwrlYGdgzD1j6gK2YiaemSQYjsi437kdxXftlGZzchNdbd
         4rC3asYCVgDejpxC8IbR4zHZ51ceivmMG2SIaCs+jnNKIjQrp5Ds6k3FGLJ1LYy8oZfs
         AEbp4dcgu/tLubJcV9084Szq9rzj9/gh4Hv4IoVTqSLetQ8cygzFAYjfwv60VLEVBros
         NA4lyZDkR60xq2f6fHZHmreeRhsHFtk3Kzm2EdgFBVJybV2UJhYxLuuqIY+jzQtQJnRk
         3H6Q==
X-Gm-Message-State: AOJu0Yy94LPrkg9XpHT1Q2Obi/zcIhnX3TbnqOfsCUCDh/y0IOZOcFAR
	cOTBy4lSJZGx6kS8rKjyxOgH26Vn0T5uLlVqWVOIvVFH+00FzSjyOCy1D4V1pb/7jdOt5A1eTMl
	eqS3GMIXZIiLRlcIBHSns1xq1+tOmfFg/YA==
X-Gm-Gg: AeBDieutsgj9Eg3HItfatgAXr7tZhkkuRANCc1TvFmm/T8wQG9Qr8HSuFioqQPxXR4Y
	9DOuWcQUKjKQ5xCivwSM+tyj92YGOyLd4TUxi3+bRHeN7SBEze96B5gzc40yF/OGLC8LPKVk4Nc
	5Q5xpp9XLi4qgrRVYys0qO8SBhglAwSeZQALxDPrOzKbYurSNVs3HIWz6b4fTiJ1B/JCPXWR0Fw
	aXgAM/6NvYjVgAEpMH9W8NEc/NG9chjz9XKcVNoy/O1htX5M0JI6l3iHXQL9x3tS7gxhnwqbhrB
	1/IPYcsBvicHWVZLuJaHQ9cSyAqs9ttoWr27mK2Amw==
X-Received: by 2002:a05:690c:64c2:b0:798:6c28:dd58 with SMTP id
 00721157ae682-7a4d3ec620bmr210527307b3.24.1775640053537; Wed, 08 Apr 2026
 02:20:53 -0700 (PDT)
MIME-Version: 1.0
From: Hans-Jacob Enemark <hjenemark@gmail.com>
Date: Wed, 8 Apr 2026 11:20:43 +0200
X-Gm-Features: AQROBzDXKwAfE7rM03goRzviBq310MclUqsBZhJAZyMQT6PGBq6bAsaa2iy3GMo
Message-ID: <CAFx0Op0o1LkXfe253sQHJTULuYn1=Tw-BzZqfxSOPx7UNUf_Sw@mail.gmail.com>
Subject: [scarthgap] git tags not present in upstream repo
To: Openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a3e03e064eef6a79"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 09:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234820

--000000000000a3e03e064eef6a79
Content-Type: text/plain; charset="UTF-8"

Hi
In the process of updating a fork of oe-core, I have noticed that series of
tags are present in the fork that I'm managing and not in the upstream repo
at git.openembedded.org/openembedded-core

The latest tags I have that are pointing to the same commit are:
yocto-5.0.11, 2024-04.11-scarthgap, 2024-04.11.

I don't see the last two tags on the upstream repo.

Did you make a cleanup of tags at some point during the last six months or
do I have to find other mirrors to sync my fork to?

Thanks in advance for the answer.

Regards
Hans-Jacob

--000000000000a3e03e064eef6a79
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi<div dir=3D"auto">In the process of updating a fork of =
oe-core, I have noticed that series of tags are present in the fork that I&=
#39;m managing and not in the upstream repo at <a href=3D"http://git.openem=
bedded.org/openembedded-core">git.openembedded.org/openembedded-core</a></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">The latest tags I have tha=
t are pointing to the same commit are: yocto-5.0.11, 2024-04.11-scarthgap, =
2024-04.11.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I don&#39;t =
see the last two tags on the upstream repo.=C2=A0</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Did you make a cleanup of tags at some point duri=
ng the last six months or do I have to find other mirrors to sync my fork t=
o?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks in advance for=
 the answer.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards</di=
v><div dir=3D"auto">Hans-Jacob=C2=A0</div></div>

--000000000000a3e03e064eef6a79--

