Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id CB89C75F3A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 01:43:52 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so35140948pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 18:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=32UJmyxC1cfGLJNJQzGII7QIoFMWjYJV5fWskWNuX1M=;
	b=Uh2BT0tpblWV7QWk40Ok8FsC4+/3LpY1jOZ1IlBUhHaA++T2dRunHS/FEGEZsGbogZ
	e3bjQgJDvcSysXFMav61AZTLjtt0KGAy0Im374k8jwUC/d+lPC33Gt+ayc4XFhaHdCtF
	R/iQp4y49BGPWC0c/FDFWq5wuMIUYWOXY5Delbiu8B6kXZx8xsdWnsm1QEZPiW5GYPXM
	axc+Edl10xgqHTQLLn2Dp6tEgJ3DOup74+ws6d5j1goh3VLPPPPEOiIzTK8OFKnAr4ur
	gBqWEiRWGle83Q/FNkIljhAYtrUvUBtJr+PUZfjp18KWUYpwr21fOz5CJpZ1behtNZhl
	YqZQ==
X-Received: by 10.68.69.40 with SMTP id b8mr4156692pbu.84.1442540632436;
	Thu, 17 Sep 2015 18:43:52 -0700 (PDT)
Received: from [192.168.0.4] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by smtp.gmail.com with ESMTPSA id
	lq10sm5681852pab.18.2015.09.17.18.43.51
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Sep 2015 18:43:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <201509180341.43070.marex@denx.de>
Date: Thu, 17 Sep 2015 18:43:50 -0700
Message-Id: <B830C8CE-354B-428D-81E5-440EF548A557@gmail.com>
References: <1442500317-9064-1-git-send-email-marex@denx.de>
	<1442500317-9064-4-git-send-email-marex@denx.de>
	<02670CD0-39E3-4C94-9FB6-CFC19B3AB6E6@gmail.com>
	<201509180341.43070.marex@denx.de>
To: Marek Vasut <marex@denx.de>
X-Mailer: Apple Mail (2.3094)
Cc: lftan@altera.com, waltergoossens@home.nl,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/8] linux-yocto: depend on libgcc for nios2
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
X-List-Received-Date: Fri, 18 Sep 2015 01:43:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Sep 17, 2015, at 6:41 PM, Marek Vasut <marex@denx.de> wrote:
>=20
> On Friday, September 18, 2015 at 03:40:11 AM, Khem Raj wrote:
>=20
> Hi!
>=20
>>> On Sep 17, 2015, at 7:31 AM, Marek Vasut <marex@denx.de> wrote:
>>>=20
>>> Make nios2 kernel depend on libgcc.
>>>=20
>>> In arch/nios2/Makefile, it adds LIBGCC to libs-y:
>>>=20
>>> LIBGCC          :=3D $(shell $(CC) $(KBUILD_CFLAGS)
>>> -print-libgcc-file-name) libs-y          +=3D $(LIBGCC)
>>>=20
>>> In file Makefile in top directory, libs-y is assigned to to var
>>> KBUILD_VMLINUX_MAIN. It uses script link-vmlinux.sh to link =
vmlinux.o,
>>> and when execute function vmlinux_link() in link-vmlinux.sh,
>>> KBUILD_VMLINUX_MAIN is passed to ${LD}.
>>>=20
>>> If build without libgcc, the value of LIBGCC is just libgcc.a =
without
>>>=20
>>> parent directory. linux-yocto fails to build:
>>> |   LD      vmlinux.o
>>> |=20
>>> | nios2-poky-linux-ld.bfd: cannot find libgcc.a: No such file or
>>> | directory
>>>=20
>>> Add libgcc to nios2 kernel dependency.
>>>=20
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> ---
>>> meta/recipes-kernel/linux/linux-yocto.inc | 4 ++++
>>> 1 file changed, 4 insertions(+)
>>>=20
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>>> b/meta/recipes-kernel/linux/linux-yocto.inc index 3b41a61..81ffa24
>>> 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>>> @@ -11,6 +11,10 @@ DEPENDS_append_aarch64 =3D " libgcc"
>>> KERNEL_CC_append_aarch64 =3D " ${TOOLCHAIN_OPTIONS}"
>>> KERNEL_LD_append_aarch64 =3D " ${TOOLCHAIN_OPTIONS}"
>>>=20
>>> +DEPENDS_append_nios2 =3D " libgcc"
>>> +KERNEL_CC_append_nios2 =3D " ${TOOLCHAIN_OPTIONS}"
>>> +KERNEL_LD_append_nios2 =3D " ${TOOLCHAIN_OPTIONS}=E2=80=9D
>>=20
>> Please try bitbake virtual/kernel build from scratch with this =
change.
>=20
> What do you mean, does it break anything or what should I expect ?

I am not sure if there is a race, with this dependency between libgcc =
and gcc-cross
hopefully there is not but this will prove it.=

