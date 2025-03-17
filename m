Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93ECAC282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 12:25:39 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.51095.1742214338163044699
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 05:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f30D8Z1x;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39149bccb69so4270541f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 05:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742214336; x=1742819136; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+g8GrU3F2PEWnQ/1dcLK4qNzbZWN/fWnBxiRUyQZEZc=;
        b=f30D8Z1xkHgpR49UzhIZvAQ7YJ21XW4BrnwXPK+Cyk3pSUNdGinNtzsJc0qEndUbrn
         VjxeyQo/gGT742DpxAqlhJIpRCnpnSJVcmbRtchEW+Pt3MnYAtSUFyy0zZDYcL2abLiw
         TyM6ymbDJgc4azw0ShcrkUGkSxGGwrFSC3GiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742214336; x=1742819136;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+g8GrU3F2PEWnQ/1dcLK4qNzbZWN/fWnBxiRUyQZEZc=;
        b=v9pmONh9e7/xL+nZAdqH8Xl2HtQZY8IjMAo6gik0kzrcLd5e07+WrZB/a+oLUymqKo
         dFn2gx024OEcgDOAI5RI6qWP7cGEwdJBpDTg++FE5IPvEUIo3WAT4OddsSV4w9X8bzlV
         60pBIh4+MitiLUy1QwlgnlOZukaoMIvdGy/uadF9X0IYLj3RuJTUjq9GMBTStx1n+QlO
         kcKuH2tjJy6zB5CKHmUF/Vao3IYYd9xI6oHOLqIEEUHd23eHBvNSe2RCzX0/Xf2gIqw+
         b5PvPZcerp/Tg8rFDnk40qImzF8+D5DdsDEzfXiweH20cEByGu8dnIFO9wXzn3BZs/iB
         UzyA==
X-Gm-Message-State: AOJu0YzB0f7P+nAheZRsQfNeu+t0u53Ugj776b54+K4GhXLU5FVeDRqY
	LYFBU//ewctzKdJ+0FdKmBemZjMsGBt/bdO6S8AW/ryIG0ToGNCIZZUOB0tneTw=
X-Gm-Gg: ASbGnctYl1LR8BrbU/3/eDo8DtHSmDTN+APsmnQWcQ5D4+nMqkdOYBwcKhYl0Zb4lxc
	hhq2v6Fv+qc0O4OtJDM06x+2aI1u/Ln1X/71YgrxnhBTdv3cX8YSetsOtgp6cv3/dZDhMnjfvje
	GcDo/w/x6wo87xABKMqs4SbavJtNAU89q17w7LaUm+MWtYYtutoIVVEHYiHQfW4gkAec+GThYbj
	drtI8LBS02X7Bjjow4G3omOsqldUDcFQ1pfH4inXR47bBZpjBwxetYqgAu8Lj+/GwluXsSfupDh
	Qg2wlg8OPhp2MkAYLf4xT0/sWdguxX0z1hmMb50LgdkxCom4vQUXE/D7qCD0BPMpjad00M+qvQA
	HzOUcaXIR5YcTI0sz02ttCZKI5sIzuxaifg==
X-Google-Smtp-Source: AGHT+IGb425RfZI0iMihwvFwzLp9XT+/xLVrEK4gEAa13KJfeP6AqI0u0voMvzoQSPCB+c97k4feIw==
X-Received: by 2002:a5d:6d06:0:b0:391:2ba9:4c59 with SMTP id ffacd0b85a97d-3971e971f44mr13492832f8f.43.1742214336501;
        Mon, 17 Mar 2025 05:25:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eadc:d6a2:789c:c5c2? ([2001:8b0:aba:5f3c:eadc:d6a2:789c:c5c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb3189absm15084156f8f.71.2025.03.17.05.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 05:25:35 -0700 (PDT)
Message-ID: <0adf3080610846855e7ab49f0705004712a018ae.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/6] systemd based initrd and modular kernel
 support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 17 Mar 2025 12:25:35 +0000
In-Reply-To: <Z9gTlqM4WDBVZiSW@nuoska>
References: <20250314111942.304800-1-mikko.rapeli@linaro.org>
	 <d9313e60692d537081323a532bd154493efc5975.camel@linuxfoundation.org>
	 <Z9gTlqM4WDBVZiSW@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 12:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213084

On Mon, 2025-03-17 at 14:20 +0200, Mikko Rapeli wrote:
> Hi,
>=20
> On Mon, Mar 17, 2025 at 11:50:58AM +0000, Richard Purdie wrote:
> > On Fri, 2025-03-14 at 13:19 +0200, Mikko Rapeli via lists.openembedded.=
org wrote:
> > > systemd based initrd supports more security, encryption etc features
> > > than custom shell script ones but oe-core lacks support for it.
> > > Convert core-image-initramfs-boot to create systemd based initrd
> > > if "systemd-initramfs" is set in DISTRO_FEATURES. Includes a test
> > > for this initrd to mount rootfs via Unified Kernel Image uki.py.
> > >=20
> > > Sadly the boot time is really slow, e.g. over 30 seconds with
> > > systemd based initrd. One of the major reasons is the large
> > > amount of kernel modules built into the linux-yocto kernel and
> > > processing of their udev events in userspace. Thus add
> > > kernel-initrd-modules meta package to easily install
> > > subset of all kernel modules to initrd. The subset
> > > supports "mount rootfs from any block device" but
> > > doesn't include graphics, UBS etc support. Without this
> > > generated meta package, initrd recipe needs to manually define
> > > which exact kernel modules to include which breaks if
> > > those modules are built into the kernel. Thus the initrd
> > > becomes machine and kernel config specific and hard to maintain.
> > > With this meta package a generic initrd can be created.
> > >=20
> > > Separate changes to linux-yocto compile a lot more drivers
> > > as modules but they depend on these initrd changes.
> > >=20
> > > Mikko Rapeli (6):
> > > =C2=A0 systemd: use serial-getty-generator on genericarm64
> > > =C2=A0 systemd: enable efi support if in MACHINE_FEATURES too
> > > =C2=A0 uki.bbclass: drop serial console from kernel command line
> > > =C2=A0 kernel.bbclass: add kernel-initrd-modules meta package
> > > =C2=A0 core-image-initramfs-boot: add option to build systemd based i=
nitrd
> > > =C2=A0 oeqa selftest uki.py: add aarch64/arm test with systemd based =
initrd
> > >=20
> > > =C2=A0.../recipes-core/systemd/systemd_%.bbappend=C2=A0=C2=A0 |=C2=A0=
 3 +
> > > =C2=A0.../kernel-module-split.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 46 +++++++++++
> > > =C2=A0meta/classes-recipe/kernel.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +-
> > > =C2=A0meta/classes-recipe/module.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 37 +++++++++
> > > =C2=A0meta/classes-recipe/uki.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > =C2=A0meta/lib/oeqa/selftest/cases/uki.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 76 +++++++++++++++++++
> > > =C2=A0.../images/core-image-initramfs-boot.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 28 ++++++-
> > > =C2=A0meta/recipes-core/systemd/systemd_257.3.bb=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
> > > =C2=A08 files changed, 193 insertions(+), 5 deletions(-)
> > > =C2=A0create mode 100644 meta-yocto-bsp/recipes-core/systemd/systemd_=
%.bbappend
> >=20
> > Unfortunately this series seemed to result in oe-selftest failures on
> > both aarch64 and x86-64:
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1242
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1110=
/steps/14/logs/stdio
>=20
> Thanks, I will investigate these. I ran into various issues when executin=
g
> selftests on my aarch64 build machine.
>=20
> Is the basehash error related to this series or something else?
>=20
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/1782873/raw_inl=
ine
>=20
> stdio: ERROR: When reparsing /tmp/selftest-fetchoxfe4t0p/test.bb:do_check=
uri, the basehash value changed from 84b9e23a83a764e7a5d8a96ee523199e2b1c60=
4f4280a45030e248de0ff52962 to 4123da244f465feffecb2b4fd2b132b64851981ec2fb7=
0bf9445df8b0ea6a69e. The metadata is not deterministic and this needs to be=
 fixed.
> stdio: ERROR: The following commands may help:
> stdio: ERROR: $ bitbake test -cdo_checkuri -Snone
> stdio: ERROR: Then:
> stdio: ERROR: $ bitbake test -cdo_checkuri -Sprintdiff
> stdio: ERROR: When reparsing /tmp/selftest-fetchoxfe4t0p/test.bb:do_fetch=
, the basehash value changed from 6d55d6743729b615749dc016857d7e5f9c884a8b9=
2f0d57f68e743f4910333d3 to fa7d6ea0563b60362418d2a6c5e41a6684183d01ec578b65=
abd0c64a9cfba7cf. The metadata is not deterministic and this needs to be fi=
xed.
> ...
>=20
> There are a lot of these.

I don't remember anything in the branch that would do that. It is
possible these are normal test output and only show up due to the other
failures. The test output shows everything from that execution thread
of selftest (due to the way python unittest parallelism was enabled).

> If there are any boot failures in qemu then I will have a look. The chang=
es were not
> supposed to change existing rootfs or initrd images. The new test in uki.=
py
> may fail on some configurations which I did no manage to test.
> Maybe "uki.bbclass: drop serial console from kernel command line" is brea=
king
> serial console prompt on some machines. I'll try to reproduce.
>=20
> Did the test run contain the linux-yocto changes which build a lot of ker=
nel
> drivers as modules? I don't think that is ready for AB testing yet, hence=
 RFC in
> https://lists.yoctoproject.org/g/linux-yocto/message/14866
> The changes were sent out in-reply-to this thread so it's possible some t=
ool
> picked them up. That could explain shell script based initrd boot error m=
essage:
>=20
> ERROR: There's no '/dev' on rootfs.

Those were not included.

Cheers,

Richard

