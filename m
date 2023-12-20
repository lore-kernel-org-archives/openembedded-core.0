Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF5AC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 18:57:02 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
 by mx.groups.io with SMTP id smtpd.web10.29677.1703098613940938008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 10:56:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xp4Sl3KH;
 spf=pass (domain: gmail.com, ip: 209.85.221.180, mailfrom: raj.khem@gmail.com)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4b6d564a540so7146e0c.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 10:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703098613; x=1703703413; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lg6g+k4NY9tN3QuZdgz+Krsgt9zrax2bVLPbPjpK2A=;
        b=Xp4Sl3KHJG2p+eySFb6UpAbP7xg/GYMfjdxh+Szx7rsyXI0HdHK5LwGURsZ+9ZTEHt
         tqDtgNfhV/xzbbWcvftnwxkH5f89bdZ/p5oN+HAl1xl4wA+yoHBnpFRxVCn6dJNRd7RJ
         G8Hn/YwoZN64zhIESeuqpvz2FeKfns4CjTtsnwqZmo0AFR3vf//TTM+24Ep4VjUXu10b
         Ap8adKheWNH9U6hIlaOc4tVyDRctFHbpdQnt5gw6YuU+tSk0jpH+VUC7Xavi85qJ3L4q
         ZUX0XzLhRUyjq4jK0Lv70vtPINS65IA4Jh0VH9bnQM6Uv4RYieXSjPyFUe2QfUNDBsxN
         pE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703098613; x=1703703413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lg6g+k4NY9tN3QuZdgz+Krsgt9zrax2bVLPbPjpK2A=;
        b=IWLcNLka0Uq3uRq0aTPbxY0hCqWBDHpeNAZznG/bSVG8Tv3PTexdIqU/qpPWP8uwUB
         jJbvINHb1SYzhn3G/RlTn6qv1xAa67tcysSljSNvyS1iShOFuNRR5MTAHFpFTIcJ46c2
         2mPs71ZHpoL3g0CHrBySINxzgq75drzHjU9S72FupVRcvRp7rUHjeNZgwJU0suJXaFm4
         4qLUOXFBChhfSmDDqhmVu7WJFTBbuAhAt3W3D+nQ4uVn1nKPIlzYIajzd7m9scwSN8so
         8Lf4sQNH0hnGObj4SI+pFjxH/XC0yGTN0HL2+cwPVA0ArfYobUj9ZPifXYQarCn53clc
         xlng==
X-Gm-Message-State: AOJu0YzY5dF1Lr06p1ze329Egw1koeEW5fM+eWh0F6jcRd1SPfoCVJik
	AUjEdyuzMZyoW4h/Z3NWFeQ5o25wFIz37ZPNJwI=
X-Google-Smtp-Source: AGHT+IHYZ91cLzWm7SoYE4qyLzH8+tE1q98vB684ux7H3+U6BDe3kdtHYPWiphjaekX0zsptDwPmNgK63VeGZLjoUM0=
X-Received: by 2002:a05:6122:3a02:b0:4b6:e1c5:3607 with SMTP id
 fp2-20020a0561223a0200b004b6e1c53607mr215523vkb.30.1703098612915; Wed, 20 Dec
 2023 10:56:52 -0800 (PST)
MIME-Version: 1.0
References: <DM8PR12MB5430E9851E7C72F05623C0148B96A@DM8PR12MB5430.namprd12.prod.outlook.com>
In-Reply-To: <DM8PR12MB5430E9851E7C72F05623C0148B96A@DM8PR12MB5430.namprd12.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Dec 2023 10:56:26 -0800
Message-ID: <CAMKF1srPC5Gch2s46kx8py6U=DJaYRro5eC4xPJWTT_2TE2pbw@mail.gmail.com>
Subject: Re: [OE-core] weston/wayland: OpenGL vs GLES2
To: chris.laplante@agilent.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 18:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192810

On Wed, Dec 20, 2023 at 10:31=E2=80=AFAM Chris Laplante via
lists.openembedded.org
<chris.laplante=3Dagilent.com@lists.openembedded.org> wrote:
>
> Hi all,
>
>
>
> Just want to check my understanding on something. It seems to me that the=
 Weston having:
>
>
>
> REQUIRED_DISTRO_FEATURES =3D "wayland opengl ${@oe.utils.conditional('VIR=
TUAL-RUNTIME_init_manager', 'systemd', 'pam', '', d)}"
>
>
>
> =E2=80=A6is overly restrictive because =E2=80=98opengl=E2=80=99 implies d=
esktop OpenGL, whereas Weston is perfectly capable of running on gles2. At =
the very least, some other recipes in the system seem to conflate =E2=80=98=
opengl=E2=80=99 with desktop OpenGL.
>
>
>
> For example, meta-oe/recipes-benchmark/glmark2/glmark2_git.bb.
>
>
>
> Is my understanding correct? Am I missing something?

opengl in OE context is usually not the same as desktop GL, it means
the distro needs OpenGL supported from the platform.
It is then accentuated by other things like egl glesv2, glx etc. I
think we could make it a bit better but this is something
that sits in the middle of distro and machine features.

>
>
>
> Thanks,
>
> Chris
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192809): https://lists.openembedded.org/g/openembedde=
d-core/message/192809
> Mute This Topic: https://lists.openembedded.org/mt/103286278/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

