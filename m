Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB84CC71135
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 10:17:00 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.7118.1749809812600216585
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 03:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qel6REIz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so13087875e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 03:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749809810; x=1750414610; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PC141ndKCtH/P0IJ9vFKca2YyC5CmjNTj8gAJbd9WA=;
        b=Qel6REIzhi4voDRW0brVKQF9XpM1lt26LW3D1LyF1zoYJ0T6yy0C7rgarYhHVlRNvX
         4exAzKiRGZVFponOXG0mxJ5OJLMbcV4ku/DPurYWSPRCpJUL8w8Bmb228eIbVf30/O7D
         /0h8rI5/IkP6lXN3azerYcUBX3E06pEWdMxs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749809810; x=1750414610;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/PC141ndKCtH/P0IJ9vFKca2YyC5CmjNTj8gAJbd9WA=;
        b=OXPy7g2WDENgDuYdLJyWPMmIL1/kMR3bqxHHjXEZqaNVW4gIYZovhV+AgqrQkUN5k5
         bm3kxrPVhl1gymIZUZ8Rfw3JRcVWkoaFJ0KwG6ky9vtU0dZim5lyOPmwJjNJ2HvijL1M
         eJu0ADOCr0dQ0cs5V+CH+a/tO7YNBQjgsAgYypCChLOqkhFyfmGAK03B+QtvuQ095oKO
         mfuDyWLbilCB4h+Hie/Bg+e0MjDyh4szPuHzO+Th1XTEv+TOXEeGe/NZZw3dA9nToGXa
         ruTY8lWaJUY9Cs0ppU4YZ5zhd+haWSbquPaPYrqe0GzKt/dLRTfEILt2t64M9QqncXj/
         CJ0Q==
X-Gm-Message-State: AOJu0YyhxsQyQpA3l+S72S8pEh8YWmN77WmMEm9nHWkHg8kibNhzHCB0
	sH8N1O68kAHWrkVDlogha01PTpUfNvFKOZd4mSmMs0UivYemWoLXNdRPFBg8nMBMK9dvPAlmR8s
	1ZnzF2ec=
X-Gm-Gg: ASbGncu0fbZc8+f/HpPab/vcqtWq6RJFH8BbR3xfMDProBiF2hlVIpLomgWtT2sigry
	tHZL9ltXiAhDqKuZtEdodf0bQvuRnPXHdAxvoQ2o3zLj1CyKPGVX0E5LghUlnuoptIjccXIsE62
	gsvgx4fJJpd+6WjcLRpuB5TAoMbhEnBdprC29knKvB55X3/j2d/VmIhq8Ewyf8+XXlYM9Ur3ekB
	XbOw2bJg0zQOxfkMvP2ZciDpwTPnZTqSB6St6nasqHuEL/cu+BNNnl7ilttv3FNX/TdFKi6gIeF
	QBY6WEHR7t5ueexH1/iuGbPQJS6RdGiVTFcAJgbU6Cd41BSUSF4mhuoYPtbwsTYR+v4W7y6ZuEa
	2ik+34qdXmzZ1BN5xX2k68rKimtkWAq1WElcoEjVlfS8uad1+pDY=
X-Google-Smtp-Source: AGHT+IGtXUhvLiYZUUZnuAdMauN7PGvLBsRp8SzS0lx8/Ja/+NEdVBsi88k7ykyAS9RX6Z2xs0Irzg==
X-Received: by 2002:a05:600c:8b57:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-45334ad802amr27148935e9.16.1749809810425;
        Fri, 13 Jun 2025 03:16:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3ba4:44fa:9d9b:3977? ([2001:8b0:aba:5f3c:3ba4:44fa:9d9b:3977])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320580af6sm86924125e9.1.2025.06.13.03.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 03:16:49 -0700 (PDT)
Message-ID: <4491b8dda798fcb9b35f0f5cf3c0744ff7539023.camel@linuxfoundation.org>
Subject: Toolchain selection feedback needed
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Jun 2025 11:16:48 +0100
In-Reply-To: <1848505989743060.25839@lists.openembedded.org>
References: <20250612135955.1413300-1-richard.purdie@linuxfoundation.org>
	 <1848505989743060.25839@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 10:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218587

On Thu, 2025-06-12 at 14:59 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> This implements a toolchain selection mechanism, defaulting to gcc
> as per the existing defaults.
>=20
> Introduce a variable called TOOLCHAIN, which denotes the familiar
> name for toolchain e.g. "gcc" which selects GNU compiler + binutils
> as default C/C++ toolchain or "clang" which will use LLVM/Clang Compiler
>=20
> TOOLCHAIN variable has a global fallback to "gcc" in configuration
> metadata. A distro can switch to using say "clang" as default system
> compiler by defining
>=20
> TOOLCHAIN ?=3D "clang"
>=20
> In local.conf or other distro specific global configuration metadata
>=20
> It is also selectable at recipe scope, since not all packages are
> buildable with either clang or gcc, a recipe can explicitly demand
> a given toolchain e.g. glibc can not be built with clang therefore
> glibc recipe sets.
>=20
> TOOLCHAIN =3D "gcc"

We have a problem with this patch. Initially, Khem was reporting
problems=C2=A0along the lines of setting:

TOOLCHAIN ?=3D "clang"

in local.conf and then gdb-cross-XXX reporting clang in OVERRIDES but
CC being set to gcc. The reason for that is that cross sets CC to
BUILD_CC and we don't change BUILD_CC to match TOOLCHAIN, at least not
yet.

The fix is to force cross recipes to "gcc", at least for now. That
works in most cases with the change in this patch:

> =C2=A0inherit metadata_scm
> =C2=A0
> +TOOLCHAIN ??=3D "gcc"
> +TOOLCHAIN:class-native ??=3D "gcc"
> +TOOLCHAIN:class-cross ??=3D "gcc"
> +TOOLCHAIN:class-crosssdk ??=3D "gcc"
> +TOOLCHAIN:class-nativesdk ??=3D "gcc"
> +
> +inherit toolchain/gcc-native
> +inherit_defer toolchain/${TOOLCHAIN}

except of course that clang-cross sets TOOLCHAIN =3D "clang". With this pat=
ch,=20

$ bitbake-getvar -r clang-cross-x86_64 TOOLCHAIN

shows "gcc". This is because the class-cross override above wins.

I can't see an easy way to keep recipe level TOOLCHAIN overriding
working whilst allowing the user to say "only target recipes", or "only
sdk recipes" or "only native recipes", which are all things we need to
support now, or in the future.

After much thought, I wondered about changing this to:

"""
PREFERRED_TOOLCHAIN_TARGET ??=3D "gcc"
PREFERRED_TOOLCHAIN_NATIVE ??=3D "gcc"
PREFERRED_TOOLCHAIN_SDK ??=3D "gcc"

PREFERRED_TOOLCHAIN =3D "${PREFERRED_TOOLCHAIN_TARGET}"
PREFERRED_TOOLCHAIN:class-native =3D "${PREFERRED_TOOLCHAIN_NATIVE}"
PREFERRED_TOOLCHAIN:class-cross =3D "${PREFERRED_TOOLCHAIN_NATIVE}"
PREFERRED_TOOLCHAIN:class-crosssdk =3D "${PREFERRED_TOOLCHAIN_SDK}"
PREFERRED_TOOLCHAIN:class-nativesdk =3D "${PREFERRED_TOOLCHAIN_SDK}"

TOOLCHAIN ??=3D "${PREFERRED_TOOLCHAIN}"
"""

which is pretty ugly and not an ideal interface, but should at least
allow the user to control the things they want to control.

I'd like to get this code in for M1 so we can start real world
usage/testing and find the issues we no doubt haven't spotted. The
advantage of the above is that it is contained and we can rework it if
we need to, at the cost of changing the user interface.

I guess I'm open to concerns with the above and feedback on whether we
should get this in for M1 or not. We are close, we just need to get the
detail right. I'm not 100% sure we can finish this without more real
world usage/feedback anyway though...

Cheers,

Richard

