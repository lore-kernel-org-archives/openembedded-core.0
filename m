Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E65D3B9A2
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 15:17:33 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.48455.1732634252188587607
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 07:17:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dBaAq+N4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38241435528so3755830f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 07:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732634250; x=1733239050; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u6FaO1zR0xsuL7znsZWr3S2s9a/3dVeK2cM+NQiFvG0=;
        b=dBaAq+N4PlRsiGbepPrfl29tS4WRKOuz0b+/r5DqeincbSCZ2fFyk61C+cIi4/l2Y4
         81hWTCo0BybqrMAH3YtFaRCJCpTc6WyP7Bhk9yRvlL4pa5KnigxIKrRKuiukRj7lAV5Z
         fShQBovaPG9bf19YOqlEqOgPnsWvjDLyDSMa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732634250; x=1733239050;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u6FaO1zR0xsuL7znsZWr3S2s9a/3dVeK2cM+NQiFvG0=;
        b=Oew9nPdNPE2N0Qy1sEFtlPb9IamUN++Q3K9XaJlA0Ye32deQU1zVMIUMT+QPA44zYR
         X3gXsfB2gyWnRPh5BICDtzBnoBscdLaOGDdS6f6CC3TtBn38tF63GRAh7AUGEqRqM+Dm
         uthOTSwlITqqBdMa9xUeNKXlCVLieCTmkEnMgv0Ao5HvtIWGHZjPwtbN4TtWcJ7XitLM
         Wiz6EYgfJm+53aph2d+w77ASvL6Ipc4qz9ypuo+puE+Dt3RdYUuOAboR0QEX2bNLQCsI
         3vCMPRm6AfFCDp1zKZqaWJOeNeXD3L6yRGZ92VoMMr4jswuhV9NW9TeRd4XdvDSSDDYm
         0fuA==
X-Forwarded-Encrypted: i=1; AJvYcCX2dXk7uwXTLCadPJtRMwH70J4rvTcIAI3a2ZFjuN/lrrGJEj2Q/ltlHvYFDdcI10SMhHM07h8BUX2rgQvCeXF/WA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwTQNXzdwHgqMbmRmj2LDiMWqPKDnJqNd8LdU8mpf1+DakKyBmj
	rocnq4+OzGzFmpkRHd/2OFT70NskkZTXinTnklQc1KFcM9XoEk+MX8VSRuwpioXQ/bFPt6ozPlN
	D
X-Gm-Gg: ASbGncsL5+YcW13LqXaIAxM13KeejQVKrUIQgAPZxJOjfVBLB37ssSfucxo/Pk9b24W
	5Tiwt0PzGHPij5VwS9+SmXlQ+pIRpnE0xAQzu2/R0oq2LIjh8e2MxTryKwxJi3NfIRZc9mysLic
	PyZzbGm+iTH/i8d3rsAjCNVSJW1jJzuyiXeRZNeK/Zxfh5xvzBI8EcR7LppMnxbPgOJDVI6+vbk
	+q0OmpoE9MRnRb33wvTeZmZgY02TdX/lubXXQ3R+GbixhDlNdE+9wQNrib3eeEqjHmUJbpDc9oJ
	lqNYMvpt+Qf3bdjNbYh71+Tyr4V4a4CMh/Q7kFU=
X-Google-Smtp-Source: AGHT+IGVJm7Ajj/gntSV32dge/9fBClnm/xJ0DgZwdxFpRpiFG/QxrtWv2hPOQeuSBW2ChrGWGyeKA==
X-Received: by 2002:a05:6000:1866:b0:382:4a7b:ba7b with SMTP id ffacd0b85a97d-38260be5230mr16729875f8f.48.1732634250130;
        Tue, 26 Nov 2024 07:17:30 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:cd02:66d6:ae48:875b? ([2001:8b0:aba:5f3c:cd02:66d6:ae48:875b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fb3134bsm13508162f8f.58.2024.11.26.07.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 07:17:29 -0800 (PST)
Message-ID: <9e0471e0cb28468e73c2b6cbffc1e511ae156fe7.camel@linuxfoundation.org>
Subject: Re: [OE-core] rust: Updating to v1.81.0 gives errors for multiple
 shlibs in do_package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yash.Shinde@windriver.com, Patches and discussions about the oe-core
 layer <openembedded-core@lists.openembedded.org>
Cc: "MacLeod, Randy" <randy.macleod@windriver.com>, "Kokkonda, Sundeep"	
 <Sundeep.Kokkonda@windriver.com>, Naveen Gowda
 <Naveen.Gowda@windriver.com>, 	deepesh.varatharajan@windriver.com
Date: Tue, 26 Nov 2024 15:17:28 +0000
In-Reply-To: <8848f492-0527-4db5-80eb-c7b49ab05b61@windriver.com>
References: <8848f492-0527-4db5-80eb-c7b49ab05b61@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 15:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207860

On Tue, 2024-11-26 at 18:05 +0530, Yash Shinde via lists.openembedded.org w=
rote:
> =C2=A0While updating rust to v1.81.0, "bitbake rust" fails as follows:
> =C2=A0=C2=A0ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib provid=
ers for libstd-20c3de2d9292cd03.so: rust, rust (used by files: /poky/rust81=
/build/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin=
/rustfmt)
> =C2=A0ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers fo=
r libstd-20c3de2d9292cd03.so: rust, rust (used by files: /poky/rust81/build=
/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/rustd=
oc)
> =C2=A0ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers fo=
r libstd-20c3de2d9292cd03.so: rust, rust (used by files: /poky/rust81/build=
/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/rustc=
)
> =C2=A0ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers fo=
r libstd-20c3de2d9292cd03.so: rust, rust (used by files: /poky/rust81/build=
/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/clipp=
y-driver)
> =C2=A0ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers fo=
r libstd-20c3de2d9292cd03.so: rust, rust (used by files: /poky/rust81/build=
/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/lib/libru=
stc_driver-fc36770e343ef852.so)
> =C2=A0ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers fo=
r libstd-20c3de2d9292cd03.so: rust, rust (used by files: /poky/rust81/build=
/tmp/work/core2-64-poky-linux/rust/1.81.0/packages-split/rust/usr/bin/cargo=
-clippy)
> =C2=A0=C2=A0This kind of error is very unusual. So we investigated more a=
nd it seems there are multiple shlibs generated for=20
>=20
> =C2=A0rustfmt, rustdoc, rustc, clippy-driver and cargo-clippy packages.
> =C2=A0

> =C2=A0The rust recipe has some do_install tasks separately for these pack=
ages which might cause this error.
>=20
> =C2=A0https://git.openembedded.org/openembedded-core/tree/meta/recipes-de=
vtools/rust/rust_1.80.1.bb?h=3Dmaster#n276 and the lines following it.
> =C2=A0=C2=A0We suspect that the issue may be related to the Rust recipe, =
as we are reinstalling some packages and probably need to remove them.
> =C2=A0We are further investigating and keep posted.
>=20

We shouldn't be shipping multiple copies of libraries and the correct
fix is probably to delete the ones which don't get used. Please check
the binaries still work afterwards!


Cheers,

Richard


