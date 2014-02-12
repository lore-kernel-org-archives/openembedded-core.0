Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 70C756E89C;
	Wed, 12 Feb 2014 18:20:36 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id un15so9593271pbc.38
	for <multiple recipients>; Wed, 12 Feb 2014 10:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=NCj+IqXdVpdrUtvjQfg0BnjjvYJQybUnC1UaKlJTJmc=;
	b=OGSLXo5nNpSi9V4AXtMHUxU2z7JWLMlu46boFf9TONetSUMpJXqgHmgcPUGELF6jjx
	2R3c9FZA7mSjeOh3YXBihNphGJtlt2auRPCIhrdvnyCmjhV0U8+A8kfSQPVWpzLAdZLe
	L67cGgCkTdiZ2H5AiT3s7k1GdzT+iDPgcRU6n013lNYh3kan5z2qAIJ69tCFkr/kJcoD
	1RIiQdiVZfpCg8Xzj+0EAxQVtSOoGkhwgsyTCvp5FQixIXEy1wzhk4YM4Nk4cTGiM5c5
	e8M8Tk7ANa8gGzOTnva8Cgeuz+FwsuXX/zDBSfA+n/LbLGqaBweTX3g2UTLpo5VoRNup
	ToLA==
X-Received: by 10.68.226.9 with SMTP id ro9mr53347327pbc.72.1392229237073;
	Wed, 12 Feb 2014 10:20:37 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	nv7sm65854090pbc.31.2014.02.12.10.20.35 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Feb 2014 10:20:36 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1392219682.14081.1.camel@ted>
Date: Wed, 12 Feb 2014 10:20:34 -0800
Message-Id: <81756FDA-0EA9-4393-A4F2-0004E8377A7F@gmail.com>
References: <CAMKF1sptnVxCrjm7PAOCtRWzmSsxPv4nc0nUO82jMPQ+BCz9Hg@mail.gmail.com>
	<1392219682.14081.1.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1827)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] eglibc 2.19
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Feb 2014 18:20:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Feb 12, 2014, at 7:41 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2014-02-08 at 08:08 -0800, Khem Raj wrote:
>> Hi all
>>=20
>> I have staged a branch with eglibc 2.19 upgraded recipes here
>>=20
>> =
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/eglibc=
-2.19
>>=20
>> These are not final recipes there may be tweaks needed like adjusting =
SRC_URI
>> later on.
>>=20
>> please help testing it out in your environments and machines
>> I would be happy to help out with issues we find
>=20
> The autobuilder is still going but it found:
>=20
> =
http://autobuilder.yoctoproject.org/main/builders/nightly-fsl-ppc/builds/2=
5/steps/BuildImages/logs/stdio

I could reproduce it.

This seems to be surfaced by a commit in glibc where the  math_ldbl.h =
implementations for ppc were unified. I have for now reverted it via =
patch and pushed to pull branch. however thats not only the one issue =
:(. I am now seeing

| ../sysdeps/powerpc/fpu/fenv_libc.h:48:6: error: impossible constraint =
in 'asm'
|       asm volatile ("mtfsf 0xff,%0" : : "f" (d)); \
|       ^



>=20
> so far.
>=20
> Cheers,
>=20
> Richard
>=20


