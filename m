Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6F4D216A6
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 16:01:47 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47077.1764864103139882357
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 08:01:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k3AEJ+Sl;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-88246676008so11073636d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 08:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764864102; x=1765468902; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnAEQCSgLvwsWLLaTi6vSURQai6am5ucH9hJdaSTEcQ=;
        b=k3AEJ+SldbFqKi7qXvRpZUOFct1V0dqbg2d0tulowRuZajQ2Jx/1uHluqu2V8YhZk/
         724uY7u05FbkJurBcM6DdO34Ar7E9QpaAvalskbRmu/UCj/BxH/IUfJTsy6u1RLhoEyP
         MLddVT7ufq5JxggJNcKrhBPcnWI7cMLnyoK+ahFxczSwHxIVmiucCY86cjn1tojdORkx
         lPCY55kaMbaCy0iOeGyV2jjcgglr/5DCOqJX/gyoBqwxbJvYfsI4LxyAhJgwWe09TvTJ
         v/JL0PpkNOunyn7rs1LpZ7Q+ONHtq9HkXwEWWzq/HlzzPMKpJXAXH+1QWWMBgc3JIdgV
         nNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764864102; x=1765468902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rnAEQCSgLvwsWLLaTi6vSURQai6am5ucH9hJdaSTEcQ=;
        b=PxeV5ez/hG4CiQ2SJkwWsxqZWnswrkbGx+Vu8wdYReQFT7xIHZ0MA4i5AkmAw4CYve
         8kRLOeCeyNMha1Al6wP3K9QHyJE3Jp9haXHcNsCbc/MZxVXMovsXL9iKSJN0wQ3dufXe
         tSqrgLGwyebzoB64eQzMt4W22MW1Zwq1F1iDXUrn6h9MbaMu+d5fkbk6n3p8zoGaLKTW
         H4Hpq3ryv1E9Lpmc3b8L3fmvFOY8RShAV6GMQENnqZOflXzSpkMeObf+VgUXMI9TAoxn
         PM4ixgZETJZSHrnfHtKjG37TKXEHodc+WqcN1wXrTzOqxRCa8cbgAVMHhuAHusn6wxUD
         LOxg==
X-Forwarded-Encrypted: i=1; AJvYcCX5zlD9fX/44Dsfr7SvLf+UQZuwQoJWfZw4BqC4XzhoOv/EmBwW6RriOP7VJrV2J2tJHavcTHkWqDEsKCxhUkSuKw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxYKI4mS+Iaiq/2obfzil5PsvLjMsU/imaF+mNpjDV3jtweHg/W
	ay2IXX/vGdFRBL+HL/8urj99zg6BI+WChUzBOA4vyKL9ixMehCi9KRTSsRbL2EDkeSKFfDYKk5W
	ka1LKuUwKB3tGF8t6KU+jsv5Lyn3PZzk=
X-Gm-Gg: ASbGncsxGdWiCBHlBQWgV5DLwx2slP/dmAfQ/2oFHoK2MjGLvoFrn1UKHUObydubj17
	pLW7SaZaSLebR3aXzs9OWM1Xp1BZJEhkkjGkRE4A6E047pnp/k21v0QJPpuYhguTwoSWDHnOLuW
	/fZrVQ3EFlA/DkSEXlxC2j0c14wulVK4Ua3PKsXbEj1l1nxSCXJojzWGuCog7B4uVRU7nXPzjUv
	2OOCJRckUCl6rMjamC01E9mTk9Ft1ql97il5DfHWk+Lv650MCpIXX7w4C8Ft3k3fFVXn5YGAsWm
	wegyB4VtU3Zdl3az2EmIR+UT7y6i1g==
X-Google-Smtp-Source: AGHT+IGRDJQdTA9dz0b4tvoOw0+3ScScK34+P6jkZcZ7llkBCue3XT3vYkErJ+vJ4wSNNA6+keEBbJdSWzcxLU64qvo=
X-Received: by 2002:a05:6214:f01:b0:882:762c:6b84 with SMTP id
 6a1803df08f44-8881953c49bmr105391396d6.35.1764864100313; Thu, 04 Dec 2025
 08:01:40 -0800 (PST)
MIME-Version: 1.0
References: <20251128013628.2187455-1-miaoqing.pan@oss.qualcomm.com>
 <20251128013628.2187455-2-miaoqing.pan@oss.qualcomm.com> <187C300838343AAE.236385@lists.openembedded.org>
 <CANNYZj-41tXqMX2D=bUU2Q8E7=qAC8=5M_3uvMFcmq0aKV_sRA@mail.gmail.com>
 <8d2218a0-3f94-459f-ac2f-8880d356db2b@oss.qualcomm.com> <CANNYZj9J7aNyqi6vxeZr_6viF=gze87JaKJx7-ge_6GokcCLTQ@mail.gmail.com>
 <97ef8fca-f266-4e6a-b94d-469709500c62@oss.qualcomm.com> <CANNYZj-2aJEenGpzSq53fPbYVpLOEvSAiKKGmb4j+heNVhbS3A@mail.gmail.com>
 <a89409ba-8786-42fd-a587-70606fe57f63@oss.qualcomm.com> <aTGthgduOuJaLV-2@anonymous>
In-Reply-To: <aTGthgduOuJaLV-2@anonymous>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 Dec 2025 17:01:29 +0100
X-Gm-Features: AWmQ_bmCmt-3JSy7eIiiv7gshjaMbLCXzzKY3QBR55z0IUyPJt0tkirzE_y-CAc
Message-ID: <CANNYZj_kvZxiuoYu5+Uo1Zs3k36--dexc5FOuaC7mrWA9t0X-w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/4] wpa-supplicant: restore use of packaged defconfig
To: Jouni Malinen <jouni.malinen@oss.qualcomm.com>
Cc: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, openembedded-core@lists.openembedded.org, 
	dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 16:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227299

On Thu, 4 Dec 2025 at 16:49, Jouni Malinen
<jouni.malinen@oss.qualcomm.com> wrote:
>
> On Thu, Dec 04, 2025 at 03:56:06PM +0800, Miaoqing Pan wrote:
> > Jouni, do you think it=E2=80=99s the right time to enable CONFIG_IEEE80=
211BE and
> > CONFIG_OWE in the upstream codebase?
>
> defconfig in upstream is mainly a documentation of the .config file. It
> is not a specific recommendation of how to configure any particular
> build. Each project should consider what are appropriate features for
> their use cases instead of doing this based on what happens to be
> enabled in the defconfig file. In other words, I would store build
> configuration in some other location that is specific to a platform or
> project using wpa_supplicant.

The specific patches that are being proposed for defconfig are these:

https://patchwork.yoctoproject.org/project/oe-core/patch/20251128013628.218=
7455-4-miaoqing.pan@oss.qualcomm.com/
https://patchwork.yoctoproject.org/project/oe-core/patch/20251128013628.218=
7455-5-miaoqing.pan@oss.qualcomm.com/

Is it ok to apply them upstream? They seem like commonly wanted
default features, as of late 2025 (because they're suggested by
Qualcomm as defaults for the yocto project). I also think upstream
defconfig should suggest sensible defaults, and also not claim
something is 'draft' or 'experimental' when it no longer is.

Alex

