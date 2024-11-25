Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BC9E668A2
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 10:46:12 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.16094.1732531563020215534
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 02:46:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hzf1iSfw;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6d4531d1309so22722716d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 02:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732531562; x=1733136362; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KKF9HpmwdmfJCE/gnnxFjk2wcT0f8yw+KFv8pjaDlA=;
        b=hzf1iSfwFGHfgKvRSTH2Lp3EyuegfoGhSOpMR0pg7LtOM1ZzVpGRoTQ1/raZXfxsX5
         fk7CQXv2ggGoyAE1Y90K1z5smWcru9+uVnVfRGK7orc7Tre9I6oC8IrrjvbURNveWN5k
         wPGmhUNDD8xL3Z0Cch+wcxVa1TWX5ntEaMUCVfwAS+hKE4Ae/tXJc3bKX95FB1R0+UtV
         1CJx9VmFFS7z75roiEqS3SUVU0vHYbYfiwOmaqC0E4MvHHQilXAH4wZW0MVTzYNw4k85
         Lxrfha5CnWzOV33WLrV0FuSxWVLJKggHhUW13ncBX7n2xFBMclXxlr+t/ZTrdDLJwoTB
         s9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732531562; x=1733136362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1KKF9HpmwdmfJCE/gnnxFjk2wcT0f8yw+KFv8pjaDlA=;
        b=AQYMWYpW02sgOfrZ/76uBL3jCoumW8B5LjmZU8AqopogDnQVvYd6ZjuijkHJPAlEN0
         rR3csGTuuHj63ldi7VY0GeHRLSATO7Sx+CY9BTENg8ZwEoOjm4V/CHurBd2hlW/5/y7K
         NUjR/pqh5yd0pjRjKffpYeiUoQIPKB1MTNadAMIJ6Rza4Vs3TFiLdn11wMMCuYo7wGaJ
         pYP0031K/22y3IQ8WRQOPtZP1T0+tu6hZ3Ey4zKns0l93Jx9iO+1ew+c8bjj9Qcd486K
         pZuYjftxOPUU4kv8PF+IehIuUo83oz73myKHu0gyteUcNLunHzV4j0a8x2sy98UGtlcx
         g2HA==
X-Gm-Message-State: AOJu0Yxs9BQrT31CZtSQGQPl7JnPOPfuan1Rfd9TJunrS7RliRkP7cvl
	0ROa/CCxg3Wc59fQ3P0KjRnyc4qOwgcmjyiquuWr6Ic3wGC0I00sX+xcgRUbv6l0/LaGxMzVYit
	mcbd95sW3RvwDWifBymRxFc7Nub4e4g==
X-Gm-Gg: ASbGnctPE1BEHbXxptKb6PPl/WS9fdkbreHZ+9BRjZ2kuvu4A985dNLfzKCw1dFifUy
	zUBj0AucEFlrJqR6iie+Qxt3QqubUX9TpB9u9Di1An8K1uH2jB5/n8AlrAoJp+UHI9A==
X-Google-Smtp-Source: AGHT+IHtsXZ8qYGtK62IQy18qwtX/jqXXSlWta/J+DDoE3R9uhWrnXsANfvhJxtwW/it80xB5bOqByddROzAN60zZHc=
X-Received: by 2002:a05:6214:cc4:b0:6d4:1d6f:8fb9 with SMTP id
 6a1803df08f44-6d451362880mr251073166d6.47.1732531562087; Mon, 25 Nov 2024
 02:46:02 -0800 (PST)
MIME-Version: 1.0
References: <20241124162328.702209-1-gudni.m.g@gmail.com> <5971.1732465555239353230@lists.openembedded.org>
In-Reply-To: <5971.1732465555239353230@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 25 Nov 2024 11:45:51 +0100
Message-ID: <CANNYZj_C_zs7-j7W-y29sM7kxd3+6ApW-i=2Mhc2vXYZMyhXyg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-rdflib: drop python3-isodate from RDEPENDS
To: gudni.m.g@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 10:46:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207732

Perhaps we can move it to meta-python then? Typically oe-core should
not be carrying recipes without consumers (unless those recipes are
for 'core' embedded functionality).

Alex

On Sun, 24 Nov 2024 at 17:26, Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Note: I don't see any recipes in openembedded-core which depend on python=
3-isodate after this commit.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207711): https://lists.openembedded.org/g/openembedde=
d-core/message/207711
> Mute This Topic: https://lists.openembedded.org/mt/109756524/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

