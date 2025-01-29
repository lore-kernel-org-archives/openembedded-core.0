Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C60F3C0218F
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 10:54:35 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.10030.1738148066419932524
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 02:54:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XTFqHJ21;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6d8ece4937fso58605276d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 02:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738148065; x=1738752865; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wi2JhKb8OEltS+JYZ7tqHSQB/gTz1WsLKFQtP2iWga4=;
        b=XTFqHJ21HwCppgWAXquN8sLko06E1RlLVR6ItfBuYSLPGb7WMOvRfgVHhasww3g5nn
         sPCPDzLrlxQqBPQWcSVj82YvCIwZiqfd+WiT4Q4bFYMpvvMeQz2iNh1Norg2rr1Ix5iA
         wRWAQ3aW4p+ved9zmPBvHqOca8O6xdnUNFpEYoHGhamMmfnjJQscfNETY4PhjZxEW55y
         eMzGv+MZq1C3xXNQsGHGr3mFrykoaDwQji/pzm+yVBXnWg4TN02Da15dhPyRSDMsc8RJ
         wlasf6BtObaugew2Yj/fb6RV2uuA5hVWoxD5xBREDaKR0becqLON7IddqZ2/R5P5jtwy
         sMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738148065; x=1738752865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wi2JhKb8OEltS+JYZ7tqHSQB/gTz1WsLKFQtP2iWga4=;
        b=rEUFO0q4le6WS8TaG9xJLTQ97xaCirySypYaNDO3t+DBofHsrOHYxJvU5BbMo5LP5a
         jmGpw197cUiHK1JZBlwbTaPYJ0n/Ywc07zEPFOiSRPc82ICHV8UqQfWRlGe8g5iH3kXG
         bMw9wa7XESoBfrmY7PW5EBnRQHKJliVcpSbxQHMFcdbOdHo12ugcOSRa2VOJYUxs5l3G
         QLKYO5WwBAf6B3Qj7tg1LgU/ed5WmLZUeyqyG2YbqaRgDgN3TZwPLGfHJylAMB+ELyLW
         Qcd+Phc1kwB+uMtVofqWb7s3ziBS7PAWaFX5gGFMdXwvCc9NShY40zt4jVO9x8epLKIE
         6Zgw==
X-Gm-Message-State: AOJu0Yx7o1dXnfUa3SvFPj4RhVKgVkwwPnX5BL2Q8Y180+Gx7twxM79g
	l7FvuMi9QYFMxkqth7OyyFX3OeyPc6T21D8KTUcmt0tUmZn3G1xVhy1Vm1mk2HV1qNwsqksQvTr
	K3ZVgJEGqDpdMkvJm+R9Xiu2QyOukrA==
X-Gm-Gg: ASbGncsRErTAXms2c0asteoftnIJJcx04pXMhWPdMlt9tm1UkvfeigMVIBdw1nTK4Zp
	1OYkonl4TdmI1zC/6RzwPUPqHbAy2FuacoRWy6k95WxvAfIGx7s0y5cgW17xhlEhd4yKdTEmXvD
	IPX8Jwm6AZcNxMZ1FJ5XG8AU9ooTD57FU=
X-Google-Smtp-Source: AGHT+IEFs4ZzT45zB71pjiNW81lyghcWqP9HcNLtpCUjJpTZ841aMlndswmrRHCKt57up9Lu1rzamLRYeFkGtyJW9TE=
X-Received: by 2002:a05:6214:5683:b0:6d8:ab7e:e54f with SMTP id
 6a1803df08f44-6e243ca764fmr49569516d6.34.1738148065489; Wed, 29 Jan 2025
 02:54:25 -0800 (PST)
MIME-Version: 1.0
References: <20250129080902.1863054-1-zboszor@gmail.com> <20250129080902.1863054-3-zboszor@gmail.com>
 <CANNYZj_hHHtuSfGMnwhCgDGg7YHzw2p4f4N-oCsHaMTVFviqYQ@mail.gmail.com> <49acf429-6b94-4d18-93e4-f5dcdcdd7985@gmail.com>
In-Reply-To: <49acf429-6b94-4d18-93e4-f5dcdcdd7985@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Jan 2025 11:54:14 +0100
X-Gm-Features: AWEUYZkAwcv6IlPwEgNeTNQy3Gw2DYripBWQhzpulf6GF9w_vfEXl1eZvmQcGow
Message-ID: <CANNYZj9S2mODwe5iCG5yu9fFc=n3jK_isckZNmBesUTNNE_9_A@mail.gmail.com>
Subject: Re: [OE-core][PATCH 3/3] rpm: Automatically enable using rpm-sequoia
 for signed packages
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 10:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210369

On Wed, 29 Jan 2025 at 11:34, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:
> > You also need to re-enable the signing test in
> > meta/lib/oeqa/selftest/cases/signing.py and check that is passes.
>
> How can I execute this selftest? Preferably standalone?

Run 'oe-selftest -l' to get a list, and find it there, then use
'oe-selftest -r'.

Alex

