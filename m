Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01432C55179
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 14:38:39 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44632.1785767917724039803
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 07:38:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ns54kcyH;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-9063b380982so33982866d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 07:38:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785767916; cv=none;
        d=google.com; s=arc-20260327;
        b=itNTmNm+yR0rmRYNRfxaOXZmmyK3hK38W5CPWHj0RWeZ+HpnEU63ZJyMLTJNV9ib1J
         L0fU2N43/qITQV5cHZ1O8KmF396isvmBKTWmISpnGj3VyzEqdDLPPbGYuR7v1HrxbLme
         FKLCq0VaPGwtD6A1DFbpPTKzCajqpH0AxORvjAsN1M/VdwSH8azZKmZk0NzYUk6lqkuD
         IK/eO7Rezr6siVyZ5Sip2nMp9NhUmjqEb41snDHpD7cBLV1Q+NnNu+BW78b+5zyLbLYr
         +fy1/PSpp79xbyfEZk6Uslws56NcMtyKXSO+YZ/SGKFbeQa/7Uu3t8uymZqcdzkZlLh3
         DFSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bVHvtK68akCqybGlOGmCh/izX+MQvycb2MKZBrUNBio=;
        fh=fR1nZM3ULSrLo3zdIzFhQ+ONWTuNie4tIQRfCo/FbgA=;
        b=rXpgnk/DFgdc4pd2YJbjF8c6Kz8wL6O30bGABCfE0jvsyNbijdT2hiZ+sdOAkI0BT4
         NDC+z538tghgBFOnxe+qGQGJFG1gdZ8FkKLypRhnIiiLkdezjpIh53Yrz4j24OQcrB9B
         q7SbexFj5LIWfuQUdUB/Fidtvjp1oxZWUUtNmLNuJs4JEXrpvJsaIRM2vpTWe9rtY/bY
         IUuJmarvy2tmGbLbh5DZz9DXqB5jADyLaOihYCXuBTbKArZdY1b3u32YkSH7G75Eelqg
         uEU4IhALeij7nk6luxcdSeZOD128SFwQNaQvwEQTJ2EmUDdEv+tf/EktJKD536l5D4sJ
         QZnw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785767916; x=1786372716; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bVHvtK68akCqybGlOGmCh/izX+MQvycb2MKZBrUNBio=;
        b=Ns54kcyH3CyoFMlQs4uYp8bJkHptePBOg+zot/zwtQnaYTvFcPhSa3PjUt4sDZ2LzW
         i6v/J9+rvK45HSsNHF/PRWgNLb20DaqLKzByrep2qUnHZ6zfS4HFFZCyzcFuQMMygBhb
         yKnKmAT+gLtwQ+KBPh+BDsEmOmJ7oEb5gGX80rO18flWLoaYYKk6jeR2w7R1Zecyp8Tq
         1y3/Lnd7pN7kNVaE60i/Ocu+4Mw5hplTbE6ZI7ucGeBbafoT+d9cEc6rlMrv1yL5yMho
         WrWvasg3SpJKnjWQH8X05QWu3jIukdf01bsfLd80YeKh2WdtRYE3XKmYnBHX/6bELxI5
         MX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767916; x=1786372716;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bVHvtK68akCqybGlOGmCh/izX+MQvycb2MKZBrUNBio=;
        b=Fg3bk8QuEsx290glYZClrldDCv0RrNPTUqScstGjAzIc7bl3621dCSwLYKNDNtDXjt
         K5bbQUGp1lL7WOygUZxSN6m/8ZPOisLJZi6i/8986P4H6wJW6EOUsDNkZcQQLEHsbbHH
         DMAYQXCbDIBjPrgoUSNkIKVkuUWag3/+IYnEmxsa8pI89yMBvpiKCP1qFkDnhkwTYVjx
         vD88dOGiWUZ52YO/yhBD+lehmezqQApMy6Axp7l7DSNGKHJdTxUjhtPc3RYdrrkUPipQ
         oCA0C+G4Dj0IDcNGTW/sn0Quc9OejCNULtBJXrNH7+YHkxniZkn2AAWE7TLlnfFX+s1x
         qP0g==
X-Forwarded-Encrypted: i=1; AHgh+Rq7nO2xUPU1VS6UDpB1O08LuCZaB6EsTXfkMPr42lkLyqIGskliJVSft0SO30R3/ZJLIDAm5UxwRQBhOT5H9ogKVQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzie9glmRluCTn+9MDbX0W2JizespNwc1qZ3ReCATlMc7Bebfcs
	a6fNUXpakqW1peuG8DfXvWQyFO1G0Bm1Jwj+B1qe3naVmd9M6DnYGsbBf/1Y9C1OTBPheLwByS+
	o1uPNHWGllIZwlglRejTY+8JSW/uvrQQ=
X-Gm-Gg: AR+sD11DxEf/XdwlrzPDZEVIzzNNZiblDvMtFgdDRueaLsjmuZkzAjWvpQtcxkGWKyx
	9gacujwAmUOBF+dH8ZaGMVIuxxKoTAMAmfsuMuuNBX6q2VTQktwPQQTgQZWzbR4Jk7sk3PgQMef
	YKH7zX0TAWWpwD0u2B04SCygrsdkA9VVTg7XT+QaG49CDewVXu1RW92Utj5CCCmZnkKDsPPqGEe
	pW0XFOUWnssxMEPrmoSsQIGx/i5rrWZhXXG71TTSCqTxrVJsD6jTpcJ/Tyw5i3UwU7e42ez+ued
	4JwVWLLlhuJRyWGS8xviC3BbOPLsd8IJxwW4JFLE+86npKOI/tvrUwegMEKGhxu7Xaavmpd4n/Q
	jJFE=
X-Received: by 2002:a05:6214:c23:b0:8e0:16f0:28ab with SMTP id
 6a1803df08f44-908495df611mr170184006d6.11.1785767916404; Mon, 03 Aug 2026
 07:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260716061519.765593-1-HimaniRamesh.Barde@windriver.com>
 <20260722101408.3225399-1-HimaniRamesh.Barde@windriver.com>
 <52bcf8634847de61960bb1e33f613abf4d11576f.camel@pbarker.dev>
 <CH3PR11MB8774C3DADBA455D8721EB8198FC82@CH3PR11MB8774.namprd11.prod.outlook.com>
 <CANNYZj_c+CJ+asij_nZoZ3PsZtjL45aGv3nfLnPXooYGO9gJ=Q@mail.gmail.com>
In-Reply-To: <CANNYZj_c+CJ+asij_nZoZ3PsZtjL45aGv3nfLnPXooYGO9gJ=Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Aug 2026 16:38:25 +0200
X-Gm-Features: AUfX_mxBmkyos0L6GqGeOU4piKM9RqvN3AoiyBY2WzSvyKLVIOZs68x3PSC2Rzs
Message-ID: <CANNYZj_29BCC92tXvGX=G2t-G+=abgpEcbWK9Gy4n8wXiuY9=A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] systemd.bbclass: fix service enablement for
 cross-install scenarios
To: HimaniRamesh.Barde@windriver.com
Cc: Paul Barker <paul@pbarker.dev>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>, "Komati, Shiva" <Shiva.Komati@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 14:38:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242656

On Mon, 3 Aug 2026 at 16:36, Alexander Kanavin <alex.kanavin@gmail.com> wrote:

> Using apt/dpkg at runtime on a target system to add or update packages
> is supported. But assembling rootfs from a package repository over the
> network using Debian-specific tools isn't. I'm not sure we should set
> a precedent for it, as there are no tests, and it's just not how yocto
> is meant to be used.

What I meant to say: if you can demonstrate the issue on a target
system in qemu using apt, we can focus on addressing that. But let's
not try to support 'external rootfs assembly' please.

Alex

