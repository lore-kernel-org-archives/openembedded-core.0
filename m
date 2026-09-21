Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B3BC982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 08:14:12 +0000 (UTC)
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44508.1789978446806371894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 01:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=dg9CDRYC;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=CqLtYg8e;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 083627A0066;
	Mon, 21 Sep 2026 04:14:06 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 21 Sep 2026 04:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789978445;
	 x=1790064845; bh=SUSCAwbZCtwAHEiJ2sBFG2AHiQM1fnDcjHjSIyuH084=; b=
	dg9CDRYCx3h6XbBTCSIACHa6lF8zzIEbmTOU7kNo9RUUaNvkLyrA7X5eKrcAmLAG
	PuwrAT/7JvUvzceGX2kycEq138QM15mZXkK4BowIZMDA60ZhIIm/kOKJOz/qz/5E
	uROKJ3mXnOJdzyz/roeyHGTXZpdekDsvd+8oPxtQT+6ueu/7XSEr6HmUNNIp1ACq
	SWl8UZfy6dVmB7CDsMbDZsbt1wEVq7QhrJwzwOk1V57R7mTEt9fniYXDTFKTGlhN
	j7XP6JUm9XKsifiXgZH9gZAWM9uiuLBXWUc6kEwFrCKx4tuEZcwgUF5uVgPrEN77
	+NnFg8xS2JUhJ0OworuFXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789978445; x=1790064845; bh=S
	USCAwbZCtwAHEiJ2sBFG2AHiQM1fnDcjHjSIyuH084=; b=CqLtYg8exLE5oxwZm
	i+LsePMXTzKPDrTk8SGiltOoVZVa/dz8YTsn+oKwaIKpNPd4rn7f5YXzac4/LAts
	jp67XjKm2Ylp7p7gPRU3s2J/k9FtQd5vSKvDChfwMnBOjJqVdcuxePwVWL3xsegg
	MGde7wGv+6WvPXWOsdV+kBt5DNI1gqfhixUzM+W87WddEi2Egyte9nwzzP+t1rCY
	BPUOasQKHkqqZgymLiYUYq8xvAaoG65KHn5E0k945NmQD++Ac5jJyZBbJodgLnpb
	IBLuu4NnDBTVOZu3q0r6g/7cy1fFcxOY9GQFa1VeDLWc9yko5lImAibOa9KA57e+
	yJ55Q==
X-ME-Sender: <xms:Teewao50b0jA4rM5Qo_piylnHcWDAVRkZY4yDspAiZAWoCDeDoCUCQ>
    <xme:Teewav7Tp2kQRQt3-sJOGeljinH_w-SLhOAI3pf7lCv6MrM1uq4zG7zcwx3Q2RCiG
    7PSQWhVbCeAkyNxRiDYa7YEZsWIAkLM5fkBOcAOkeF8W7-b0sJzTV-C>
X-ME-Received: <xmr:TeewalFtXKve4stu-oJ1cgjZzrIyOgWjjEJvHV_RyLxJ6D8Wxn9lHuiVxClrLsyLIw5w>
X-ME-Proxy-Cause: dmFkZTGaSDhkiyOs6Ueh7AvpgtGW1YjHfZuwSG4RoEMyJndxBAb/1uCpXwx54Wlv9kXVpc
    8cvSQKPsMVOv8qmZSoN/aqoCSeu4ihb4RlVnw0GVEQ84JBLu1Wxa5xsVHxYwulA4jWCpOZ
    niDJvVUg+mpD4jcckgVX1iHTtuePUfDf9/BksWw3kHUySaEl0Hn/CpolsSOdqPeeT1zvPk
    DYLnzN3rv0PYta6IL5ROOUzEHPz11m3EgApjtg02sV4WRE25XL5wf6M+c477xe7UQeJj82
    fjirp8foMScIl5/3YGxTS2fWBcKRQCt93iDFxSpk/TkII1FjAoO+xc9r03lwQoTdG6sosK
    +3Ch61TnQv8PpBF2v7DyAknbYpOa1QCk48ktZjM1dRjfNpGnMKJwfgYlb1jCD4DFTbAjdy
    lq2yKACdCF3TyO9bTi1Z051XEddKEbeDSIJlqaWKS10jd0dYB6ksdRchtPkb6ASvVHXEIo
    nqf48ls95obTm1FOGW2G4ukqota4yOf/BOpsMiO6zWydfV9QQImavKgi10E9jnX0GYPeLe
    Z0QWK3OVhzL2UQVwRnGNw0usC10gU05jjmuoRT/rEv4sSiVZbG+/IqRPMR/Ggi4mxx010M
    2cGv1ERrGyjOkKnALqd7Q1gbmVv4uSxGpq2T9R61MaS6mra6WMgxjvRNTxbw
X-ME-Proxy: <xmx:TeewaoSaFy3Sf9XiD3VRbSd94wN3MbukHsIZtRPSYPfCqfBTvICBXw>
    <xmx:TeewauvfVTvTcrqVZQ8wPgTLVQsLpi-8080jTi0sGoXTO9F7xWzCqw>
    <xmx:Teewanxk-T7hwf_Rm3uRvGjO-1qj-Q2mYdQKEcbDPCfoe8lKQ8G0ww>
    <xmx:Teewao7jW-Z9rAu4vI2BQgc8I0xYGeh1j5P8Kx7KGC1wj5hIKHdfpw>
    <xmx:TeewasJHhZinbw-GngaAcrm94X2U2Fmjh0xpbJmMtaIPvnmsNrI9Spps>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Sep 2026 04:14:05 -0400 (EDT)
Message-ID: <1234666ea330a4738b3c2bd0c69c163fc2c9f829.camel@pbarker.dev>
Subject: Re: [meson.bbclass] bindgen_clang_arguments lacks C++ include
 paths, breaks C++ bindgen (mesa rusticl)
From: Paul Barker <paul@pbarker.dev>
To: Royyan Zahir <royzah@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 21 Sep 2026 09:14:04 +0100
In-Reply-To: <20260919172851.1564760-1-royzah@gmail.com>
References: <20260919172851.1564760-1-royzah@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 08:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246309

On Sat, 2026-09-19 at 21:28 +0400, Royyan Zahir wrote:
> meson.bbclass builds the bindgen arguments as:
>=20
>     def bindgen_args(d):
>         args =3D '${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --target=3D${TARGET=
_SYS}'
>=20
> TOOLCHAIN_OPTIONS carries --sysroot, which is enough for C headers. It is=
 not
> enough for C++: when clang cross-compiles against a GCC sysroot it does n=
ot
> infer the libstdc++ include directories from --sysroot alone, so any reci=
pe
> running bindgen over a C++ header fails to find the standard library.
>=20
> mesa hits this with PACKAGECONFIG opencl, which turns on gallium-rusticl =
and
> runs bindgen over rusticl_llvm_bindings.hpp with -x c++ -std=3Dc++17:
>=20
>     FAILED: src/gallium/frontends/rusticl/rusticl_llvm_bindings.rs
>     .../recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10:
>         fatal error: 'cassert' file not found
>     Unable to generate bindings: clang diagnosed error
>=20
> Seen on mesa 26.0.5 with oe-core wrynose, aarch64 target, LLVM 22.1.3.
>=20
> The missing arguments are the staged C++ headers:
>=20
>     -I${STAGING_INCDIR}/c++/<version>
>     -I${STAGING_INCDIR}/c++/<version>/${TARGET_SYS}
>=20
> Our downstream workaround appends them to bindgen_clang_arguments in
> meson.cross from a mesa bbappend, which works but is recipe-specific and
> hardcodes a realpath glob over the staged header directory. It also has t=
o run
> after do_prepare_recipe_sysroot, since the glob is empty on a clean build=
.
>=20
> Reporting rather than sending a patch because the right fix is a design c=
all:
> bindgen_args() is generic, so this affects any meson recipe doing C++ bin=
dgen,
> not just mesa. Options seem to be teaching bindgen_args() about the C++ i=
nclude
> paths unconditionally, gating it on whether the recipe does C++ bindgen, =
or
> having clang-native resolve the GCC sysroot properly. A maintainer is bet=
ter
> placed to pick.
>=20
> Happy to test a proposed fix on aarch64.

Hi,

Please could you share enough information to reproduce this build
failure. The bitbake command you ran and the initial output showing
layer versions, DISTRO, etc may be sufficient.

Best regards,

--=20
Paul Barker


