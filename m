Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456FFCD98CC
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 10:39:45 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42538.1781174382450774431
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 03:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=364k5UjY;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso65360565e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 03:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781174381; x=1781779181; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tr61Cfsbb+bOJy1v7HvgLEKQcaJGx5m7xrrD3np5lUo=;
        b=364k5UjYNNoGB7rfzbUaUVVqVk7NKiYc36IXqiQNbwjjrVNjJS++t6QJgRt35GorJq
         yv56nILgE1WjTGr1j8A0myASfc2gpzXAs3zjYjAxgN5Hirum57ENUQesgtT1JJfmA/Aj
         Qnx9tInyv8IKlKqQaj/gZuYm5yto5bmapME88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781174381; x=1781779181;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tr61Cfsbb+bOJy1v7HvgLEKQcaJGx5m7xrrD3np5lUo=;
        b=fCUTDiwy+CwL8We6t4L91MZNCbnL0WXv/21j/cSDEzMzXLYQI5RtPuEyNMCwa+2tyf
         el5AMRQyo9K41qTjuzSDUfePVzNvMdLTkJ5/vnPS15BTU5e3UYZp4NtGp6301/KQQcYc
         J2jppKZ8B7EP4K+v5h9t9v9m7XnFz97tF7Aklu0mkn6BYchDBNFYAVAleu4b/n3DM8UX
         o0TSsLk0VMMt6PgPftDmxobkhdxPCvg3sG0OipURv314o2njeOFcJ2pS9J8G6JuTfDgD
         iWAU0aT5zbD11vOkZdjmegthKXjpIwZAhDIRs9yreZerjTCLtM+5dihrKMVMDW1E39AO
         yNrg==
X-Forwarded-Encrypted: i=1; AFNElJ8GN5FOXDT82dFKhX5YPvLqd5QNzglG1lb1rXHqdk+z15NMpyil183keORC7IasWleruGoHxuvCqXnLIrsV7hlfeg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx4bac+lI1dMf3ekicysfA8vz7u3tzB6PFbe8K6QVWe+UA845as
	b6hdOgqOMo7QymcHOJhiBMeP+hcNTfvkza6LuXPEQUBXY1lElzwCK7Q1XVOcJkVY8EM=
X-Gm-Gg: Acq92OE2MVrwcn81W9Fr77OU5iJKTgf5q4bLUMwnj7wtYlzw4wCrGQBSgvw1fTOPv/S
	7QdYURRBBuaoe2PfOfWlCV7/3zzOrpnyT6/WubPGHLlP7/dV3fvGd9YG0IsVP/udvFdP+t69TZe
	nKnBgABg2ZqGjuJrLx1zuEJexJXockI8IKBCjJ8Tm3nxAyzqDhu3XAE7SvVKyZiLF6Qy83UXjmh
	V9wMupw67pa2Wgwb25LShnB8x1fCx2ISr5F0frU3n1JgEqpA2PD2AhtA1tT4Hy0X4Ww3fIwfeTo
	Ww51q47GFTQrOzladkGe6D5F6olF9GIXJKXlmlIZd21bH7wTBZimZ0WA1NKF1w30O4wUFTpdrce
	Xj0X9GIQJ+5c/7toLC1/KW0H2+kcEAO32b0wxJdQJIY6O0e40d2Q4pp00Ld4Z+c7GBnHrUWkCo0
	7OtAiNP3OAl0QKNd6Byz1VdbiesfyyW88XL2ULfHJfLr2PRWAhMSTOMt7tAE0Efwcshkko7oRbw
	axfbglBG69uN8zg2yzjkwo3dYE=
X-Received: by 2002:a05:600c:a31c:b0:490:d354:bd00 with SMTP id 5b1f17b1804b1-490e56190famr24696865e9.25.1781174380861;
        Thu, 11 Jun 2026 03:39:40 -0700 (PDT)
Received: from localhost (2a01cb001331aa0084744357c26c6744.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8474:4357:c26c:6744])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2ca21f4sm55131325e9.7.2026.06.11.03.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:39:40 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 12:39:40 +0200
Message-Id: <DJ65ME2CV03O.291OM3MDV8SQL@smile.fr>
To: "Paul Barker" <paul@pbarker.dev>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose 18/21] python3: use SKIPPED_TESTS instead of
 test skip patches
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <cover.1781132051.git.yoann.congal@smile.fr>
 <c9df7ab1678751caa8c5195fd366d3058a3cc6fa.1781132051.git.yoann.congal@smile.fr> <ccf309b775b890e94e6cc0d5e8c13ffc4d4218ce.camel@pbarker.dev>
In-Reply-To: <ccf309b775b890e94e6cc0d5e8c13ffc4d4218ce.camel@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 10:39:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238437

On Thu Jun 11, 2026 at 10:58 AM CEST, Paul Barker wrote:
> On Thu, 2026-06-11 at 00:55 +0200, Yoann Congal via
> lists.openembedded.org wrote:
>> From: Trevor Gamblin <tgamblin@baylibre.com>
>>=20
>> Drop all 13 patches carried for skipping various known ptest failures
>> and replace them with usage of the SKIPPED_TESTS variable, which we have
>> started doing in recent commits (e.g. 40b0815dc9). Most but not all of
>> the test skips are due to load variability, distinguish between them by
>> using multiple SKIPPED_TESTS:append blocks with comments taken from the
>> patch files indicating their purpose. This adds 62 lines to the Python 3
>> recipe, but it also means that we no longer have to maintain the patch
>> files across version upgrades, where they often break due to changes in
>> the test modules upstream.
>
> Hi Yoann,
>
> What's the reason for backporting this (and the following patch) to the
> stable branch?

Hello,

Mainly, it was to make future backports easier to hopefully fix the
AB-INTs we have on python (as it would align wrynose & master for the
python recipe). But I admit this is a weak argument. I don't mind
dropping those now and revisit when we have an actual fix to backport.

>
> Best regards,


--=20
Yoann Congal
Smile ECS


