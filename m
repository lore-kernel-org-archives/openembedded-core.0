Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B88C5CFEB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 14:04:13 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19842.1786629849329906987
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 07:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M8NP4rZp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso2899656a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 07:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786629847; x=1787234647; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s51SpwD7qH6GCwH5yc+ZKFTCPumMsbkIOw09r+/Lc+w=;
        b=M8NP4rZps8VlqIQlpox0Uw8AzzKR6ItpqE31aR08Sy8wn2EkBInGMUDxJp2vbzxSlY
         KVxsFj/oyHfisAtXjA0+XSaIX25lnVC4YulskU28KxhUfwIugCa/ouCJw3PzOEzPXsP0
         P21slJWPfSoa18cYYTDtOYQJImEmIh29U7FcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786629847; x=1787234647;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s51SpwD7qH6GCwH5yc+ZKFTCPumMsbkIOw09r+/Lc+w=;
        b=Fk47m769eRsijYaIVaRwOBbx0g6TOFceMhcDeN/vMNbwvhbwqwiK2hYi+jEmDLhObz
         Zs+RWeapYl1nowKfWgEP0T8HZejH/J6npz9pKVrRwkQL/IO9MnWA9qDAiiAXGPtW0Czs
         AdKtQHEXvd+wZV7IGEXe6Ts7JSFC/e/duTIYVfctl/1jTfZa+/ZxDfTc7oS0YLjMC/dz
         uxs+107Ok1lEtv9BqD5GJ1IOPTl5K1NXo8Qire7Ay3ZxmfMaHFtKh8RFBMkFZYWQhDEk
         +dKqaoZHlF/doVELXDOIaHhXINh8KELVAt8WuDxDV/Y1gA/SbKfFI4FSbhT9Nmj+KUsz
         Ekbg==
X-Forwarded-Encrypted: i=1; AHgh+RrEtWX/XhsNnHsDd9n9hk9Uvel0v5Fyi0cASMH6IhqP3Z4spzPWN7wQzoGw0GCfC/sDmukYXNbHqaJXvGJ6izVQ7A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx6vrUz4mVVvv/OrTUI5wX/zk6eNVuQnWPciWMbHGOshAXTkMSP
	0RoBASQInZR7g+leFSSEWPLVKsBbjpObvS8Xs9RvK8ZB7SCx+cR5biO6JY5ds9RgXSM=
X-Gm-Gg: AR+sD13WSSwn8FVVOVmjpuklTr8Kiv//k+PQRnlQSxkDNrHTjo39MEtFtpQU494JR7G
	xdInNdT+Er2mNaROB5TF92ZX8wPrON+zowyGjtbqF48oOl8gBQD4Juuu2Zd4T7mdhngzqZ7qJYD
	Tjyrps4lY8Db2rlPIP0vcFA39c06u+rb0URInX1uASbwlAnp4RqvCIzfu1N1TpFSF1pykc/d9/v
	oY6gh5FeJ6rYOb0uB+CiYtoJfr4k867D7BMpkaD342Ojp2QXuWrmKKKjwal+j5zJx7dYirKgXIG
	O+1JKBp5sj9STR6a4Kpnkn5M8OyGrHWZkcxwqmvlK8xRdvhZgFdw72fF/6BMOMHjBnA5W4UyKec
	IP7lC0rjJMj9AFwm50bpEsOCR8DdK1BHssKa8kLybPUkXPVpPdRaVG8cDzNrFdPIrsMFX+npREo
	3yxLD8APgFb+gCMn5DV/LShGztTU1ZkH0ho4/Dfr39/PvVhzJK+yHtjk2+jF09UYA++sk9rI18G
	1R/Komn8R0Dq9JCBsg9mqvxNTdjEzgu78gwZkmcmEqecdMP7hBgutHk7wYuhc+F
X-Received: by 2002:a05:6402:528e:b0:698:3ce6:767f with SMTP id 4fb4d7f45d1cf-6a3806086e1mr2868419a12.12.1786629847413;
        Thu, 13 Aug 2026 07:04:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e77b:339c:e0c2:6c8d? ([2001:8b0:aba:5f3c:e77b:339c:e0c2:6c8d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a37f7f0d9dsm1015624a12.7.2026.08.13.07.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:04:05 -0700 (PDT)
Message-ID: <50d7d13a895765f87612109f737f012d43ecceb6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] toolchain-scripts, oeqa/sdk: build the
 kernel's host tools with a host pkg-config
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: twoerner@gmail.com, openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, Harish.Sadineni@windriver.com
Date: Thu, 13 Aug 2026 15:04:04 +0100
In-Reply-To: <20260805065718.3497815-3-twoerner@gmail.com>
References: <20260805065718.3497815-1-twoerner@gmail.com>
	 <20260805065718.3497815-3-twoerner@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 14:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243355

On Wed, 2026-08-05 at 02:57 -0400, Trevor Woerner via lists.openembedded.or=
g wrote:
> The SDK environment sets PKG_CONFIG_SYSROOT_DIR, PKG_CONFIG_PATH and
> PKG_CONFIG_LIBDIR so that pkg-config answers for the target. That is
> right for everything built to run there and wrong for a program built to
> run on the SDK host.
>=20
> The kernel build compiles host tools of its own, and objtool asks
> pkg-config where libelf is. It gets the target's include directory,
> compiles a host tool against the target's C library headers, and stops
> on warnings that -Wno-system-headers would otherwise have covered:
>=20
> =C2=A0 usr/include/sys/cdefs.h:486: error: "__attribute_const__" redefine=
d
>=20
> Export a HOSTPKG_CONFIG that undoes those three variables, and pass the
> same value on the make command line when the test builds an external
> module. Both halves are needed: the kernel assigns HOSTPKG_CONFIG with
> '=3D', so only a command line assignment takes effect today, and the
> export is there for kernels that assign it with '?=3D', which is proposed
> in
>=20
> =C2=A0 https://lore.kernel.org/linux-kbuild/20260805055438.3482019-1-twoe=
rner@gmail.com/
>=20
> OE-Core already does the command line half for its own kernel builds, in
> kernel.bbclass.
>=20
> Fixes [YOCTO #16239].
>=20
> AI-Generated: codex/claude-opus 5 (xhigh)
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> =C2=A0meta/classes-recipe/toolchain-scripts.bbclass | 3 +++
> =C2=A0meta/lib/oeqa/sdk/cases/kmod.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 7 +++++--
> =C2=A02 files changed, 8 insertions(+), 2 deletions(-)

The kmod test piece of this is probably ok, as you say, we do that in
the kernel classes. I do note that the kernel class redirects to a pkg-
config wrapper and perhaps the kmod class should match, rather than
doing something different though?

The toolchain piece is a but more of a concern since we're encoding
kernel specific variables into the generic toolchain environment file
and in general we don't want to do recipe specific things there...

Cheers,

Richard

