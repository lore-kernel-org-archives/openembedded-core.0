Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B074BCAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 08:31:40 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.8813.1758184297639419015
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 01:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=qa1VnMAQ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (unknown [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C93EAC00084;
	Thu, 18 Sep 2025 08:31:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 546676062C;
	Thu, 18 Sep 2025 08:31:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2397102F1CBB;
	Thu, 18 Sep 2025 10:31:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758184284; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=pi2dSPa5z0s+I5IMmCrqeynKUUqL6SrCHgScZgFDAGA=;
	b=qa1VnMAQLql5Gsk1IDH/pjO9ia/qjEII0tQwd/zCNrB7VKm5L6Jaunie1IVEKfb0XZf2OG
	0a0IA4/rYbVNPrFocgWoF14kvm0jA1F2rtk+hoQ3+/5OLDQB48na/jri88lU7lRNYyUK7O
	rMkXypnOE5AH/5QbBROv+na+1vl7uD5IxqMNa8QrKuGeME6SJthFmNhHQ397VRzgwvoU63
	65HuWMWOXdIpurG1F3rPpChekdlRv29A/jUBjUY0lADXzRzSoqn13nT0rKmVLIFnom1kG/
	UrBwEXI3HwOYlNlmk9iCQy4nGdWkf0a+UMDd6P95lz5rvLCEcWriVEYzNhkHgQ==
Message-ID: <0c19a1d8-712a-4fcd-aa8c-a994edc2d8ed@bootlin.com>
Date: Thu, 18 Sep 2025 10:31:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] clang: Fix nativesdk build after recipe splits
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
References: <20250918030540.2172994-1-raj.khem@gmail.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20250918030540.2172994-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 08:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223631

Hello, Khem

On 9/18/25 05:05, Khem Raj via lists.openembedded.org wrote:
> Splitting llvm, tblgen into their own recipes means we
> have to ensure nativesdk clang build can find these tools
> in native sysroot, which is would previously build and use
> on its own.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Ross Burton <ross.burton@arm.com>
> ---
>   meta/recipes-devtools/clang/clang_git.bb | 2 ++
>   1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-de=
vtools/clang/clang_git.bb
> index 9e977379325..bcc799f286b 100644
> --- a/meta/recipes-devtools/clang/clang_git.bb
> +++ b/meta/recipes-devtools/clang/clang_git.bb
> @@ -78,6 +78,8 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF \
>  =20
>   EXTRA_OECMAKE:append:class-nativesdk =3D "\
>                     -DCROSS_TOOLCHAIN_FLAGS_NATIVE=3D'-DCMAKE_TOOLCHAIN=
_FILE=3D${WORKDIR}/toolchain-native.cmake' \
> +                  -DLLVM_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/llvm-=
tblgen \
> +                  -DCLANG_TIDY_CONFUSABLE_CHARS_GEN=3D${STAGING_BINDIR=
_NATIVE}/clang-tidy-confusable-chars-gen \
>                     -DCMAKE_RANLIB=3D${STAGING_BINDIR_TOOLCHAIN}/${TARG=
ET_PREFIX}llvm-ranlib \
>                     -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_P=
REFIX}llvm-ar \
>                     -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_P=
REFIX}llvm-nm \
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223625): https://lists.openembedded.org/g/openembed=
ded-core/message/223625
> Mute This Topic: https://lists.openembedded.org/mt/115304299/8026893
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
joaomarcos.costa@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


I spotted this error in the autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2266/s=
teps/12/logs/stdio

Could you please take a look?
Thanks!

--=20
Best regards,
Jo=C3=A3o Marcos Costa

