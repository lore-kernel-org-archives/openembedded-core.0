Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060A8C47258
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 06:39:43 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.11155.1706164777528118577
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 22:39:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pp6XbtNu;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-21481a3de56so1520756fac.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 22:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706164776; x=1706769576; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HYiLjOkTsau5rSa67Q1IPlg+KsXNd8fg6Q+CSdEBEQ=;
        b=Pp6XbtNuKr8OoXjv0gSTBkvWCeZ+Y1ox4DmFwz1FEd2kVFiQA3JgcsgAOJRwGQMP1h
         vDVzYcfonsx0anExZ8+CJAjCLAKZlc6ribUzoOPAR9OCvfvm0kCB6E2YRu0n2n7Z8FtX
         h0zayD92VnNUvbLjjuPaBqbBOrbmvdODfbKKN2CslHn04pZ2bje/o9xqaYmsJNu6N01T
         eTxhFhef0bgfKj/DZuL/KCenUcBSwyzFnAR9u4Hme2K3A+nstWMSigvSXsCmzlJ0aegi
         sOTH+wZowFrTJ7O+66BlCyYCKZWh61s7CARxjN1bS/miXSx9TXAO+WJDEFcP7p6dVZ1K
         /+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706164776; x=1706769576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HYiLjOkTsau5rSa67Q1IPlg+KsXNd8fg6Q+CSdEBEQ=;
        b=QkD3e01dex1y9aT+oSLFgK6EZU3Ver+ecztsHtOu6PzYrIzzDykIN6yooKWEfnhYuo
         /wSpM3UFlIgKoTGkiH42PH/JdAIdM51diTpM4eIyEefhSZRkzpDWe+68KG8f4OsT6glD
         P0/WMEuzEIzxD3+1rwmsQ+HWOiQxKdhFSaeWaFkswaxmvvOnnTbVZTKDLqi58it3H6N3
         iVx7O8jWRWmq+hPkvTusRGC775YV+3PCqfA3HHi6DOFOIh0qw6Iwqrgasrev/u0lsNh9
         zZntBiHYD/MwMtTnTTHXcM7fX2zbp9MjwT117UW+dBeIHc/9MSjsH1tHh5udNOEhd5sU
         T/Mg==
X-Gm-Message-State: AOJu0YwOrfmI5EsvGmram2/WQuKJEugz/QjRti+UITZ9R8hrquHNgIRx
	VAU6JTD+S63BO7mBxqd0fmw00cIHC82xd8OuRNPqckUdV3MFl2SuF14KmjQ3WFsXPSNPv0kkYjZ
	6PM3E1QfRCRcqdlz5eava1J394w8NgqFD0cO7DQ==
X-Google-Smtp-Source: AGHT+IF4e5arGxTLbdL8H0Vm8kkxYyqqP768jgez7nh14RGfRr06wGATSW9HkJU7pay2nIf+RCCh5BOXcXxErGw97LE=
X-Received: by 2002:a05:6870:1702:b0:205:fe07:91bf with SMTP id
 h2-20020a056870170200b00205fe0791bfmr442137oae.100.1706164776478; Wed, 24 Jan
 2024 22:39:36 -0800 (PST)
MIME-Version: 1.0
References: <20240117202923.29341-1-simone.p.weiss@posteo.com> <27265.1706163040053354103@lists.openembedded.org>
In-Reply-To: <27265.1706163040053354103@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Jan 2024 22:39:10 -0800
Message-ID: <CAMKF1spANbMeZLQbZ6a3SLutuoW50YRvW3zq+0ZgfCwuuiGVUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] tune-core2: Update qemu cpu to supported model
To: =?UTF-8?B?U2ltb25lIFdlacOf?= <simone.p.weiss@posteo.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 06:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194307

On Wed, Jan 24, 2024 at 10:10=E2=80=AFPM Simone Wei=C3=9F <simone.p.weiss@p=
osteo.com> wrote:
>
> References are now added, as requested in v2. Is more still missing?

We do not send explicit notification on patches being accepted,
Usually we comment on the patch if there is some
improvement needed. So its good to check master branch or master-next
and poky-contrib/abelloni/master-next during staging
for status of the patch

This one is already applied to master see [1]

[1] https://git.yoctoproject.org/poky-contrib/commit/?h=3Dabelloni/master-n=
ext&id=3D97fd704adcfcad439c5e4af390916434da07da98

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194306): https://lists.openembedded.org/g/openembedde=
d-core/message/194306
> Mute This Topic: https://lists.openembedded.org/mt/103794943/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

