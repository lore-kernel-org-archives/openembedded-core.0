Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7084CC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 19:19:55 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.6956.1744312790332087308
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 12:19:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GXuV1LOg;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e8f8657f29so9846166d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 12:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744312789; x=1744917589; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+8kgC1rB1Q33Ek6Z0D1eAIEG+ayC9idiFIo52A27+p4=;
        b=GXuV1LOggg5z6Wvm0TKY0NwSDWtKvbkOzAvJgtddbLlPKoc9wMO4bNjkj+oeOlgDur
         cKr4A2vtShfJ9jutkiW299hmwpc8Q28Be4HBSvlCdly+Qjt8AtC7XC+Dxa3pTWTXFhjB
         dUcndSb3gI2Ilhp9h5eCXvLKuDBcMVnYTve8jf9BweCo6E3ZfiMU1UB8Gx99WYBxu4pF
         9wxj6YC2X/WGtm8I9GBp14PqErO0JkFIaD7ni9HzPmTCi7Ves75Sq9cDQtzQdLScc+ci
         RGbtngnfj8degOryWUYCIRFlHl4MjZcvvKHzd9qZkIkebnKS1IFJM7/9Fat8PT1BAsDM
         OrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744312789; x=1744917589;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8kgC1rB1Q33Ek6Z0D1eAIEG+ayC9idiFIo52A27+p4=;
        b=dmNxj4uWfy4NuoMUUZeF0AcmpHwDqMlrEp2WqzdVFSXHvAH3IKh0970K4dThA3snk1
         cmmE83xVl42mfKTd7zA14lBFyHEIuAPRAOlkWxM0+kGSiZ11/h8O/71jkhiOoi8UMhNP
         WxyfgDbmDSQuj/fL6s1dGr+ZGquGLHyyy7IYWT3zLChgg6aXjGa3vEMYaMOJE00oEXNQ
         3P6TQ0kyDwF05NYvx/voQlP6XG30U2YfxhKjTEv/AcWo7nkYPzwCYDixs72Fly154PNV
         s/yqnr/CpM6CNmtEhjQYgy9CC3wP15jp9x/PtHg70gPlZved8UYv9Ysa2cU678CP5WFD
         a9uw==
X-Forwarded-Encrypted: i=1; AJvYcCXz7AHh51Py6h4wsZG/gbk9dLKcFRk8DMOgLFAMQ1Tt3szHwoq/CPUniMiVera79PUG3YPboaeOwXcoBDzNQdR8ow==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw3mVF2Mrg1MT4LtleLWBDNo3OJ/FwIZ/zf1ODsQ8vPWo41+zKB
	+HLnsCuzm6GLXp8+mIbVkHmPbTP9BXq90mBR1XFdkPzVb1BIJBF0PyxyacBwQL+c+l/3nEhWIS8
	rme58wL78Wtr2T6cQ/8rpBFjWtdg=
X-Gm-Gg: ASbGncvuBQfdwpidcpUfxEX4CsHwnvWZMil6RQHSDegH+gW6/eTQ/aZjKQiF0kcat3w
	/g4fsmIuDvOPMYPGxtQf7C16tRIBpzW/42p52m36hXHJiIEF+e7XxIVHV2p20Y2wCtz8cK050NL
	xoVkkrzdgFmdaGE/Jb4ZhFoigpw3Bfc/aPk7PY5tI+sy7cnSTiT7aL7A/3
X-Google-Smtp-Source: AGHT+IEBKyCWndFPlCpKR7kqGQ2GJSGV7pRmO1uz6ewXppvY02lgT7OOzZqDvf4k4Nz+zHxvQzCVmJslcgAaqyacctQ=
X-Received: by 2002:a05:6214:4015:b0:6e6:5e15:d94f with SMTP id
 6a1803df08f44-6f230db21f5mr964586d6.27.1744312789439; Thu, 10 Apr 2025
 12:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org> <f84af1a6585338787539ee5be5826adbe434e8a9.camel@gmail.com>
 <CAC_iWjKTmSEOe6HUcPFUZLaBuA2+6ZwOYaYiqK0_R8KGNPU1Ug@mail.gmail.com>
 <CAC_iWjJTuV=TcNYhSeyybaU8hr-b9sauJiYt3Jo8+wxYC_7eUQ@mail.gmail.com>
 <CANNYZj-ORUDVcfGMBUczC-CQ1LwFZiS=6qToSCZUH2WCVqxGbA@mail.gmail.com> <CAC_iWjKWLoWc3UE0pyvsq9U70xMGaDeWL0NdUsoPm+jvByri4A@mail.gmail.com>
In-Reply-To: <CAC_iWjKWLoWc3UE0pyvsq9U70xMGaDeWL0NdUsoPm+jvByri4A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Apr 2025 21:19:38 +0200
X-Gm-Features: ATxdqUEl3y05OcX2m7IKB0e7VjvCZPgkyZSKsEtLVY7cJ1E4DiZLer1pNu-ZVAU
Message-ID: <CANNYZj87jO6=GrJ+1WTYEZP-LB=2602Pe+oG2xd0+LQXnQR0TQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: adrian.freihofer@gmail.com, Mikko Rapeli <mikko.rapeli@linaro.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 19:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214700

On Thu, 10 Apr 2025 at 19:48, Ilias Apalodimas
<ilias.apalodimas@linaro.org> wrote:
> > But none of the last few messages answer my question. Can I restate it?
> > Is there a physical board that can boot from ESP formatted to something else than FAT?

> Why? The answer basically says that every board with u-boot or EDKII can

What I'm trying to get to is this: there's no working example (in the
shape of yocto BSP layer for instance) or evidence of anyone having
actually done it, ever. If you look at wic's bootimg-efi plugin, it
hardcodes vfat as partition type with no option for anything else. And
this is then used throughout meta-intel and meta-arm wks files, and
likely copied and tweaked into countless other layers. So it is not
exactly reassuring to hear 'but look at the zoo of filesystems that
u-boot supports'.

If I have a board in front of me (for instance, this Thinkpad X13
laptop from 2021 that I'm typing on right now), can I find out what it
can boot from? How?

Alex

