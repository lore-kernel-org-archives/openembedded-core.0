Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CB7C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:22:48 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.11105.1747311763235032677
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GQkgJSvD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-442ed8a275fso9688495e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 05:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747311761; x=1747916561; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjXFqpU7FDbsQn2Wp7hiKAhJqhcMXGl1jVIWSodgx9A=;
        b=GQkgJSvDHuVU0ptUM8Z4SoOLpjBA2YmsFMAD0jrXegUnC4z1ioR9/RnmSPpLtE+BTn
         dhMcPuq0d+GpAs/69f8lvlBZvMJ1c+lqkZybHP2LdTZBFXj4Hwc4WgB5dbfVZfcMIzn7
         nlZM+q7NiGkIk5BpdA2Tiv90cbXXeg6kS7vxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747311761; x=1747916561;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tjXFqpU7FDbsQn2Wp7hiKAhJqhcMXGl1jVIWSodgx9A=;
        b=nn8Uc8xN2puLqJupK3MPc9QkCbZqTdN45sqGTEV9xCBcn0r/EG+uXJAdGy7m3QK3K8
         aD+1Rlvno5vShwgqjFfZBukB67v12/qa5MbhWxW89g5OHz3G2Fllch2pI85AhV7nU8Kx
         iIQC8qxtnuFR1p4qimO9UdSOgDbvHUMtNTh0Oixw/mJdWN+Az4ZSiMNAl93BVBzlMZbA
         aENzyuU6yrKThzcL1TlZiuD7QdVxJmB5NEjSF56SQ7c+nZvXp9KwjHhRSzKU89SS67Rx
         5EGXjGbXqgxtvkf/pkJkhhGiz20WPoly6VHTj/1RSoDmbduGtTab1x9Xgdtv8smO5EVo
         lTMg==
X-Forwarded-Encrypted: i=1; AJvYcCX69yKt1dODKbdD0C2y3ltLYBuEzdsK7JKPverxJdexthaK4Dow3rbXtqPm+UG8LDRLc2TrjNq73sVIWBhXPRDgYg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwPHJDQKkEEtBlCs8HmZDiUaCnLMSh3aFn/+QtXalFdEtIHNazb
	teFzhNOOhbJ0ldvbOC/2cx2UGQagWYGBXYD2yQn90YlO/DmCKhrUgYWRoS14DBk=
X-Gm-Gg: ASbGncsE8Cn/6b6km4vr6ntd1vUgPqPW5CVlNZ3WdqrnX8V0qqLopIfq5s/0uRlK9Ts
	U7IQFAoDBM81WddBYNhungR2UqQ2jIBuuR4eG1vU8K7zM/1DWAwBRhRYTD2XxotCT/Kfdzv4rUe
	jYOgq0nhvATH7aJQkDRMQ2rAlgYDI2jSDSAsFFWfS8zktv71/GwRyUSe+e87EPGmtPy366rvs6n
	Sw7SWiCB4nueQOwMOj1PndmJBTembUM6M9tkeFi+wFkogosyXSkp3jw/BqYwyJPc/uHDmNTRSuZ
	Dt4CDDlpnArIekSxQEQGBdN+5MUaTAsrMU7Zr4788iH6zjSU90JhbGNVkeAc0yskFuM8xzo9HHq
	UlMc8H2g0IGHFUUY3o7icKdBsNLjPAsk0pP95tA==
X-Google-Smtp-Source: AGHT+IEqYRYrQ1RIRLR7QHkflypb4bNoj96kDvmSHa5C1hxkwa0iJDqDBZPaBYjq7Y9hUV15sJkUdQ==
X-Received: by 2002:a05:600c:6612:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-442f20e1abdmr91359025e9.10.1747311761419;
        Thu, 15 May 2025 05:22:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7c21:701d:240:45b5? ([2001:8b0:aba:5f3c:7c21:701d:240:45b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3951494sm71246885e9.22.2025.05.15.05.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 05:22:40 -0700 (PDT)
Message-ID: <f5e409fb55000274ac0bcb5f6b56b29102b2135b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] opensbi: Pass CROSS_COMPILE and
 REPRODUCIBLE flags
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 15 May 2025 13:22:39 +0100
In-Reply-To: <20250515083422.113413-1-raj.khem@gmail.com>
References: <20250515083422.113413-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:22:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216574

On Thu, 2025-05-15 at 01:34 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> When using clang pass LLVM=3Dy to makefile so it can select needed bits
> using clang
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: HOST_PREFIX instead of HOST_SYS is needed
>=20
> =C2=A0...lag-for-reprodubility-compiler-flags.patch | 49 ++++++++++++++++=
+++
> =C2=A0meta/recipes-bsp/opensbi/opensbi_1.6.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 8 +--
> =C2=A02 files changed, 54 insertions(+), 3 deletions(-)
> =C2=A0create mode 100644 meta/recipes-bsp/opensbi/opensbi/0001-Makefile-A=
dd-flag-for-reprodubility-compiler-flags.patch

This breaks the builds:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/77

Cheers,

Richard

