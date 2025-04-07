Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87189C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 16:49:42 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.52514.1744044580908619094
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 09:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EHN9G6PD;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso2786120f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744044579; x=1744649379; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mM6FwrNWx0BVQJdjP/O7YdhUBQPwZAwZj/OyyTIZSAo=;
        b=EHN9G6PDA4vIWpSBNuFIwO7qfxHgqr3h2tTHDpQYdNB8owj2Hb5DhX2D943wndMFmo
         t71k4x+HhMEUjlisSTRR5jk1wbSE8nkMcLvVBx4njeGQ8xxAwXr/L7qLt0rN806cRs0r
         fuB6baNUJn7SgAakArFWUR6sUkEno7s3AL2ziMphaW6NtGE16JeXtstnydsO8Op8oJ3B
         Mfnpn66zjtY79kfeXUUS3YBgwToSo81sCIX9WFTDeVK5PM3czKj6wCWsrgwvrYj3DsMT
         bqIaZLePYUicDkDEkCShSKMDCT+qrMacKrnxNv67SXJyHDZOzrJRS/UWsdl4ycUXenRg
         1dNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744044579; x=1744649379;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mM6FwrNWx0BVQJdjP/O7YdhUBQPwZAwZj/OyyTIZSAo=;
        b=s952FalrRQ6zxgKogLb1XNJqcD0Ye1q00QB6if3n+h60T+YvNIv+mj+yppjoEXWeVW
         zmqMb+mzxz0YOU4GQrZwKouMaDx1ZzthE63dERhKyp5nMb0nAWeV1d9xEne4ufBy8x0C
         dCyBr8i+lo7DW+ixc02FIzHXN6qGuzA0P5PnNqEeYUv2TVuzQdBjbC0SxabW013dTSLC
         EbUp8Zq6lauKqkFa9287MauuQjrY9PUDuBKq3wc14b27bqrZyizm7wbb1wsR9jpqbSd3
         RCvALkLwQ//Ac3eGeXbrlPgzRRqO8H0DJI+OAIu8oLZkASzRL/bpAXw2CxxLr7pINex6
         iSKw==
X-Gm-Message-State: AOJu0YziX1gC7im7keM17W/2HDIyxKsFc9jB+72zDM29gr9vD1Dzm5kM
	2tLq9z3wJ9lL48dCa/TYV4RFqO8P40nm2DQf50qwtNE9AKNqFNrVGFiP6A==
X-Gm-Gg: ASbGnct1bwks6oe5hv/n+ghxRF+j4aLw3tXvXcVSd3ohMHUmozFj9eKEmuOZhxs9POg
	T9ixuS6JFyHk+eJYD3hZ9gHJ4ryHEMRaPtnpT8eFJrR4TGONB+kLGZsFwiUB5D1gTCnf47gfBsj
	bhiE5dIOvL99ZVh+F5CwCqy8j0+vfNnblfQXx4/3CKfFpNf6o1i2a8EzWCtFLLo7sHYW/k+NcLl
	3mKD/JkX5ILoA6YnQc3IbqKfZlmgMyiEHEeL5GDXfa5teh9MMF5PDXnnLRAY6K/rGATQYGgTuio
	L2d/4V8dKx95XxMjGy+zpNrozGJuXjwVmTYlnRGRqppfmTlRFdZxWJeqYB9/nYP6aogvf8PbtxA
	cdcoFVHm04d34+bwQrw==
X-Google-Smtp-Source: AGHT+IEE8EB5m9SgC/r/G5CHm0r1998/E4XMjPOGXqp5jEPAw7bPDu1GViTBWmS2WwFh5dOddu+RbQ==
X-Received: by 2002:a05:6000:220d:b0:39c:1159:fe1f with SMTP id ffacd0b85a97d-39d0de3b27amr10677193f8f.32.1744044578816;
        Mon, 07 Apr 2025 09:49:38 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a7064sm12887414f8f.34.2025.04.07.09.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:49:38 -0700 (PDT)
Message-ID: <e054398a9d4d20162f0fe178d4f318a9e9b77801.camel@gmail.com>
Subject: Re: [OE-core][PATCH V2] qemu.bbclass: move to classes/ directory so
 that INHERIT can use it
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 07 Apr 2025 18:49:37 +0200
In-Reply-To: <20250407070827.423672-1-Qi.Chen@windriver.com>
References: <20250407070827.423672-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41app1) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 16:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214465

On Mon, 2025-04-07 at 00:08 -0700, Chen Qi via lists.openembedded.org
wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> The functions in this bbclass make running binaries via qemu user
> mode
> easier. These functions are generally useful, regardless of how this
> bbclass is inherited (via "inherit" or "INHERIT"). So move it to
> classes/
> directory so that these functions could be used by both individual
> recipes
> and other bbclass that are intended to be used via INHERIT.

It depends on the build system used whether Qemu is available or not.
For Meson, for example, it is always available. For CMake there is a
bbclass cmake-qemu.bbclass that allows to make Qemu available for
certain recipes. It could be that such an approach could also make
sense for other build systems.

Regards,
Adrian

>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
> =C2=A0meta/{classes-recipe =3D> classes}/qemu.bbclass | 0
> =C2=A01 file changed, 0 insertions(+), 0 deletions(-)
> =C2=A0rename meta/{classes-recipe =3D> classes}/qemu.bbclass (100%)
>=20
> diff --git a/meta/classes-recipe/qemu.bbclass
> b/meta/classes/qemu.bbclass
> similarity index 100%
> rename from meta/classes-recipe/qemu.bbclass
> rename to meta/classes/qemu.bbclass
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214399):
> https://lists.openembedded.org/g/openembedded-core/message/214399
> Mute This Topic: https://lists.openembedded.org/mt/112128298/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


