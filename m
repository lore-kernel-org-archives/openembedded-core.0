Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 28BEB76DF8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 01:51:32 +0000 (UTC)
Received: by padhk3 with SMTP id hk3so35064788pad.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 18:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=c1PNOB2wmHY6lp4ImqKSNPtMomyAsL10V1bPP4DxaP8=;
	b=g6+IvUVvwAr88JzfV6Xv+8Z31yo88002AhNMWek5odv/3nbnIYKKtp28a+ie0FbpW9
	wT4OIsr9Epzkcg1fPkVejh4ldcu1R4NX5wJkOgpTozhOsWSBEitoQESNhFekdrm6Wj/T
	ebPwgIlHnZmsFSDgZD/wy4Jp9J1PggG6JtmwZJD84TNvvjoe7n3+BhJ2UqccOP7cSlR/
	aSqwN2rs9xaIhHCgcS0UAznW7z0F8xcDnwUxlSZe7y2PFa46rpxViCtZCNa4hiKcm4S8
	GdKeztXkLCDMwwNz3uxLwT47O3QygyK8+Wrk5MYVzZng9GrZ1t4Ll1LMBDZGwpDJktRv
	5fdg==
X-Received: by 10.66.235.226 with SMTP id up2mr4071719pac.89.1442541092046;
	Thu, 17 Sep 2015 18:51:32 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:1079:2f51:a2f9:e171?
	([2601:646:8601:4580:1079:2f51:a2f9:e171])
	by smtp.gmail.com with ESMTPSA id
	yk5sm5690053pab.31.2015.09.17.18.51.31
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Sep 2015 18:51:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <201509180348.30142.marex@denx.de>
Date: Thu, 17 Sep 2015 18:51:30 -0700
Message-Id: <D2512C01-1DA3-4423-8E4E-D91FEEB4F694@gmail.com>
References: <1442500317-9064-1-git-send-email-marex@denx.de>
	<201509180341.43070.marex@denx.de>
	<B830C8CE-354B-428D-81E5-440EF548A557@gmail.com>
	<201509180348.30142.marex@denx.de>
To: Marek Vasut <marex@denx.de>
X-Mailer: Apple Mail (2.3094)
Cc: lftan@altera.com, waltergoossens@home.nl,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 18 Sep 2015 01:51:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Sep 17, 2015, at 6:48 PM, Marek Vasut <marex@denx.de> wrote:
>=20
> On Friday, September 18, 2015 at 03:43:50 AM, Khem Raj wrote:
>>> On Sep 17, 2015, at 6:41 PM, Marek Vasut <marex@denx.de> wrote:
>>>=20
>>> On Friday, September 18, 2015 at 03:40:11 AM, Khem Raj wrote:
>>>=20
>>> Hi!
>>>=20
>>>>> On Sep 17, 2015, at 7:31 AM, Marek Vasut <marex@denx.de> wrote:
>>>>>=20
>>>>> Make nios2 kernel depend on libgcc.
>>>>>=20
>>>>> In arch/nios2/Makefile, it adds LIBGCC to libs-y:
>>>>>=20
>>>>> LIBGCC          :=3D $(shell $(CC) $(KBUILD_CFLAGS)
>>>>> -print-libgcc-file-name) libs-y          +=3D $(LIBGCC)
>>>>>=20
>>>>> In file Makefile in top directory, libs-y is assigned to to var
>>>>> KBUILD_VMLINUX_MAIN. It uses script link-vmlinux.sh to link =
vmlinux.o,
>>>>> and when execute function vmlinux_link() in link-vmlinux.sh,
>>>>> KBUILD_VMLINUX_MAIN is passed to ${LD}.
>>>>>=20
>>>>> If build without libgcc, the value of LIBGCC is just libgcc.a =
without
>>>>>=20
>>>>> parent directory. linux-yocto fails to build:
>>>>> |   LD      vmlinux.o
>>>>> |=20
>>>>> | nios2-poky-linux-ld.bfd: cannot find libgcc.a: No such file or
>>>>> | directory
>>>>>=20
>>>>> Add libgcc to nios2 kernel dependency.
>>>>>=20
>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>>> ---
>>>>> meta/recipes-kernel/linux/linux-yocto.inc | 4 ++++
>>>>> 1 file changed, 4 insertions(+)
>>>>>=20
>>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>>>>> b/meta/recipes-kernel/linux/linux-yocto.inc index 3b41a61..81ffa24
>>>>> 100644
>>>>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>>>>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>>>>> @@ -11,6 +11,10 @@ DEPENDS_append_aarch64 =3D " libgcc"
>>>>> KERNEL_CC_append_aarch64 =3D " ${TOOLCHAIN_OPTIONS}"
>>>>> KERNEL_LD_append_aarch64 =3D " ${TOOLCHAIN_OPTIONS}"
>>>>>=20
>>>>> +DEPENDS_append_nios2 =3D " libgcc"
>>>>> +KERNEL_CC_append_nios2 =3D " ${TOOLCHAIN_OPTIONS}"
>>>>> +KERNEL_LD_append_nios2 =3D " ${TOOLCHAIN_OPTIONS}=E2=80=9D
>>>>=20
>>>> Please try bitbake virtual/kernel build from scratch with this =
change.
>>>=20
>>> What do you mean, does it break anything or what should I expect ?
>>=20
>> I am not sure if there is a race, with this dependency between libgcc =
and
>> gcc-cross hopefully there is not but this will prove it.
>=20
> Wouldn't arm64 explode in the same way then ? I'll set up the build =
shortly.
>=20

yes it would



