Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A4ACD4F24
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 09:52:15 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3949.1778665927526965039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 02:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mbKqImLk;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-90d1f03238bso135479485a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 02:52:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778665926; cv=none;
        d=google.com; s=arc-20240605;
        b=au3LyISmFX1GrUehUZ0MCqSYT/XGYE23lH7AEv0GU7DinWuj9np9UT0Wnqs+zuKxkK
         25D20HVrgowX65KuUZkogFZhjtxZTj/0oGAsp6WWlaepmyTXzEHmbpCxr421BQpg1T5e
         JpUyIfzWNrdjAU6pxV0FadjPujn+ou/FrlD7s+MN19AQ87LxifNY3XdUXXO8T81XVaA9
         ZgpGrzmsl95tnZv9Zf743RtV82iBiwD0nTsH+sGwTKpP8VVkSBceTnKmQ7gSfLK8lnph
         x04DMpCxvxwjmttWsVCTDeT87Lmj7WutiwWIkEPjl6++s+fih9ZxkFFxhdNn+tAndMSL
         nG/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LTL6KbHXAyu4IVPsSRrlAY/LcVrFZFuo7q/KIrJdJlc=;
        fh=1vYK2yYSwFEFyK7ZmbOVhqh8V3nmBHh+IaX5C2wIhyA=;
        b=jgS47EmOGjfTVDAgsmzfi6umMWMnEokTCD1VDN8dcUx+nfPhWZLdCOfvBkz4GmhOd6
         ljxZG6JRPT5jca2JAAx8bSPXgOQt+akz2dykUI7fuUlCtsHnO8q3PgHq4//e1iFQaIUE
         Sm3VdMnPoBGk6sk7B9C45MoBMbA0EXoRkBzgikKbRGPkoEEkpARq01GNcQ/XDB3brn9c
         WTuA4nrU3G8KB5WFdbz7RPbaASLs1bnxRGw88UgKeHGhZOqbUgBJ/C3QFPVQulCWDc4C
         n+BbKK7vwS006nI97JlZJGaQAbTApdVJGD3TySGuiIqlVSbfGycLJTlduseJ9dMXeakJ
         ywoA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778665926; x=1779270726; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTL6KbHXAyu4IVPsSRrlAY/LcVrFZFuo7q/KIrJdJlc=;
        b=mbKqImLkdeZKv/cq+z5JzeP8PIpfuv0wmU3eMUS4KAFllvuEXOZ+v+8Gea4ih0gV/S
         Cld3a3DY/yhCVpoUGaDBxUSgMsvWyqTFbrgTBqgSyrxVrrFgaUuW5rq4uUz6nT7dQFiD
         8yIAUxtVe7Sn072wy4YWiS0+M1G43d7/Wf0CQ2uXvB1jO7aGtnpYeP3uXQLmNcUH46MO
         46voLWYAKlesF+GZORaJZ2GoANexqDdAG8Y2tql1eLhI3SE1VV7nGoPAggCU3SOJIFo2
         MB5l8qA36P2SxmbqwXGvgY60NI8NKkWBAmR0z/IKxRXV2G5Wbhm2dKZ3GMaevt8TkfQa
         hshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778665926; x=1779270726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LTL6KbHXAyu4IVPsSRrlAY/LcVrFZFuo7q/KIrJdJlc=;
        b=XaeB2Cb92mrR4lA/ft+10sGhmaFiDjrn02DQbN5Sg+L4VJLzM5xy5cBDPgPFWTWiJJ
         rAkiteF3ArayJ09SJ6N30E433CO7IKmlWBenCm3VdW9GsK81ZyyTcoEMnie+anv6xLoD
         gBu+5TtY8Y3+PQQU1vIUU6qpuvgoj9PPxF0Md/Nlavug7oLkCxaBoDtAhJX7E9t+nYEh
         cFmz4qpM1TM7CebhzT4wNSSeRk9lOB27IZU6mgg4SO7dqahX26OAl7/m9LsWzbUJmiS6
         uaaRtqt0qAtsbkCkvn6Y7k1faXRJhICW7Q/7qQ1lYMEBlnJWMfjPc+eGxkU53woLFlkf
         Q4pA==
X-Forwarded-Encrypted: i=1; AFNElJ87fM1LPKn9TLuP39VWJk2KRGFzvUFzIPxW1xQoRd10W5w+nt3udPq6aBQBnny3tkASi3SWxqsKJVJP8PPVekcWZA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzglmcWqImvHw/3/LsU9t3RXxzd1XeayMBufMOli2E09Msy74nh
	Ill99BRmN1fUc+tDovjAF50vRkfc9fTcAt7tuSGwLyDUcEMpgiTXz4wZyiHj11f8Rofh1Wo3erq
	F3r5goY8+FabbdIeSxp1u3CyhCbE+dfM=
X-Gm-Gg: Acq92OG0FJS0RjOp053XHflyCNevqb+h5eLzOSeShS3ldYlPGQAbWWDH+/4gQsqp1Xf
	mYruUmc1Fclokr43Lrz+JM00bAlIeEcFL8rT6X7pYEhSVBvHwe1B8suUqQu7WCTb3o7ypZ5PdXA
	7sJlScTd3qjahkOzx/f6J3KOphq2OvPw15emVdzxadGAvsOydHBU+MVvFv3VIBN5W2inlD78++0
	9fm476Luos4Pf9etEiLPX3l6KByOKcNUcMK6PknamG1BmFbAgIRb9CFHy3lPbrrRcz2XW5L5hDZ
	BSieiGiV2vqgCeQnMG13LPB97C43is1E6PkNXwVBjh0y4iUOTueu
X-Received: by 2002:a0c:f00f:0:b0:8ac:b2e1:3793 with SMTP id
 6a1803df08f44-8c7b2ba087fmr34138196d6.25.1778665926438; Wed, 13 May 2026
 02:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260513052334.2271800-1-Qi.Chen@windriver.com>
 <CANNYZj9EA+69R7FCj4WH3MB0q9kCv1HQdCU800uomD0hCt3K2A@mail.gmail.com> <PA3PR07MB10721F47BD61474678F5A4A1E8A062@PA3PR07MB10721.eurprd07.prod.outlook.com>
In-Reply-To: <PA3PR07MB10721F47BD61474678F5A4A1E8A062@PA3PR07MB10721.eurprd07.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 13 May 2026 11:51:55 +0200
X-Gm-Features: AVHnY4I29z_1w8FzoKzrY5FrY-JZ-Qtm7Xa-EAQckt7NvzuI9EHycLnApJ1Wo44
Message-ID: <CANNYZj9RyQrfr3BULHanuaUSsp2WgfTjFEb3tfzvXwfyPYALZQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH V5 1/7] recipeutils: add optional stable_upgrade
 parameter to get_recipe_upgrade_status
To: Daniel Turull <daniel.turull@ericsson.com>
Cc: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"randy.macleod@windriver.com" <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 09:52:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236955

On Wed, 13 May 2026 at 11:44, Daniel Turull <daniel.turull@ericsson.com> wr=
ote:
> I will be presenting in Nice https://github.com/Nordix/meta-binaryaudit/t=
ree/devel which can help also identify more components that are good keepin=
g backward compatibility. I could send the list of components that I have i=
dentified.
>
> Qi, will you request to have this backported to the TSC? Once my devtool =
changelog patch get's merged I was planning to request it as well. Then we =
can have a powerful AUH tool to help to maintain version in LTS verifying b=
ackward compatibility or for selected components.
>

Just in case, I support the backport. The changes to bitbake/core are
not invasive, and they're in relatively 'safe' parts of the code that
aren't used in core workflows (e.g. actual builds aren't affected,
only the version checks and even there it's backwards compatible).

Alex

