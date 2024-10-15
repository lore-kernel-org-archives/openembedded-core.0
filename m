Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1438FCFC27F
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 09:45:50 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.9254.1728985544635199913
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 02:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fJ1n9ZW2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43111cff9d3so38655755e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 02:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728985543; x=1729590343; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2Ogild0N9AFMLOCBG9uFufLfmCdzys4e5O3VG6o1f4=;
        b=fJ1n9ZW2Ab5jGNj+8j7Ejqw8qHo5aWoO4fUCUhvKrJ3vO+0p8pEzpIY+8qBWLfbmGM
         vuplqLqnR0neUO1BEOqA2+kRfINdIzVKFCzW5tInbFRWQjZaz4FKfqwLLd5W+Zcuf75V
         jNjmDX4Q51Y8lzsOBWkJdVmVg+f0rqLE7nW2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728985543; x=1729590343;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B2Ogild0N9AFMLOCBG9uFufLfmCdzys4e5O3VG6o1f4=;
        b=cbCz6gw1jlWybIQP/F5K0MVqwNRn5PzDGMSYOWrKAv9JD2KXEI3MYrOivF64zI/Zqv
         YOgFQosG6DDHS1TGiQ7ktiuu77S6BCXmSQJYCnR4cmGZCSnCBeYhGy3zLaMP6CS+8WXP
         ewn673G7HD6YEoHyy4R4m4I6wBG0dVFyVyMQFvTfPbnhKploVgbRZZamJ/OSwRujN2t8
         Oyk9aV1jwySxYGquEOQ7PCk5bcv+hREVUUT5P21bOzrbY7oXZ3sbZIj2Yql4Fvq6GNB1
         4huhACULuoC8EguHfXaOTG5TjVjuHASavcD38Cl7z1qqhLsHQblczlaLQQd42GgpZgmO
         8s3g==
X-Forwarded-Encrypted: i=1; AJvYcCVk5aeqqKcg9PxA+VECNoTiHLG0du06Oo2QWdsaHRn0yJ58WblcuEMmdf++xSvGpo1Gcg5KzybLHG7SEnTHJj4mcg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyzLPdRbaw5lNQFDU+uT5IJMRckfBYWKbqLdmtc+461g5RdlE62
	UhntqURgS2TAldKxyCwXZ+wEBCWZY/NUe3qfQIi4aRMFTul6pVHiZeKzrb7/xds=
X-Google-Smtp-Source: AGHT+IHiUtxf8x1UdOIqwJYUtJfdQBni3mEVO5J4s/2Ux0q2P6ppxpPvF9yBZiH4AdpmhCCKaGMmYg==
X-Received: by 2002:a05:600c:4f0c:b0:428:1310:b6b5 with SMTP id 5b1f17b1804b1-4311df5883fmr111932405e9.34.1728985542607;
        Tue, 15 Oct 2024 02:45:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:28fa:e6b1:dce2:85c9? ([2001:8b0:aba:5f3c:28fa:e6b1:dce2:85c9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4313f569943sm12370835e9.12.2024.10.15.02.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 02:45:41 -0700 (PDT)
Message-ID: <203f5e226f1a66028f4d1ec3caa62ba0af03002a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v8 0/8] systemd uki support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2024 10:45:40 +0100
In-Reply-To: <Zw4PXRX28-qB8FjT@nuoska>
References: <20241011122044.12222-1-mikko.rapeli@linaro.org>
	 <ebd022b240f4bb6b8e2e2fb8d93a4c9f2ba9492f.camel@linuxfoundation.org>
	 <17FE4B15CF045259.4702@lists.openembedded.org> <Zw4PXRX28-qB8FjT@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 09:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205801

On Tue, 2024-10-15 at 09:44 +0300, Mikko Rapeli wrote:
> Hi,
>=20
> On Mon, Oct 14, 2024 at 01:30:56PM +0300, Mikko Rapeli via lists.openembe=
dded.org wrote:
> > Hi,
> >=20
> > On Sun, Oct 13, 2024 at 08:43:15AM +0100, Richard Purdie wrote:
> > > On Fri, 2024-10-11 at 15:20 +0300, Mikko Rapeli via lists.openembedde=
d.org wrote:
> > > > These changes enable building systemd uki images which combine
> > > > kernel, kernel command line, initrd and possibly signatures to
> > > > a single UEFI binary. This binary can be booted with UEFI firmware
> > > > and systemd-boot. No grub is needed and UEFI firmware and/or
> > > > systemd-boot provide possibilities for boot menus.
> > > > The uki binary can also be signed for UEFI secure boot
> > > > so the secure boot extends from firmware to kernel and initrd.
> > > > Binding secure boot to full userspace is then easier since for exam=
ple
> > > > kernel command line and initrd contain the support needed to mount
> > > > encrypted dm-verity etc partitions, and/or create partitions on dem=
and
> > > > with systemd-repart using device specific TPM devices for encryptio=
n.
> > > >=20
> > > > Tested on qemuarm64-secureboot machine from meta-arm with changes t=
o
> > > > support secure boot. Slightly different configuration tested on
> > > > multiple arm64 System Ready boards with UEFI firmware, real and fir=
mware
> > > > based TPM devices. Tested with ovmf firmware on x86_64 with selftes=
ts but
> > > > without secure boot which seems to be harder to setup in ovmf.
> > > >=20
> > > > Sadly I see two wic selftests, wic.Wic2.test_rawcopy_plugin_qemu an=
d
> > > > wic.Wic2.test_expand_mbr_image, failing when executing all wic self=
tests
> > > > on a build machine with zfs filesystem. Will investigate this furth=
er.
> > > > The issue seems to be in mkfs.ext4 producing broken filesystem, and=
 partially
> > > > in the tests which don't run the correct rootfs file (.ext4 vs .wic=
).
> > > > Will debug this further and it is IMO unrelated to these changes si=
nce
> > > > they reproduce on pure master branch without this series.
> > > >=20
> > > > v8: fixed comments from Ross Burton: debug print from warning to de=
bug,
> > > > =C2=A0=C2=A0=C2=A0 dropped duplicate DISTRO_FEATURE setting for sys=
temd in tests,
> > > > =C2=A0=C2=A0=C2=A0 removed aarch64 comment from tests which are cur=
rently x86 only.
> > > > =C2=A0=C2=A0=C2=A0 Fixed the new aarch64 wic selftest to run on bot=
h genericarm64
> > > > =C2=A0=C2=A0=C2=A0 and qemuarm64 by adding bios, virtio disk driver=
 etc settings
> > > > =C2=A0=C2=A0=C2=A0 for runqemu (already set in genericarm64 but mis=
sing from qemuarm64).
> > > >=20
> > > > v7: add missing "ovmf" to runqemu argument to
> > > > =C2=A0=C2=A0=C2=A0 test_efi_plugin_plain_systemd_boot_qemu_x86 to f=
ix boot hang
> > > >=20
> > > > v6: fixes wic refactoring botch which broken non-uki systemd-boot u=
sage on
> > > > =C2=A0=C2=A0=C2=A0 genericarm64 reported by Ross Burton <Ross.Burto=
n@arm.com>, added
> > > > =C2=A0=C2=A0=C2=A0 selftest to cover this wks usage on x86 and aarc=
h64
> > > >=20
> > > > v5: drop patch "image_types_wic.bbclass: set systemd-boot and os-re=
lease
> > > > =C2=A0=C2=A0=C2=A0 dependency for all archs" since systemd-boot doe=
s not support all
> > > > =C2=A0=C2=A0=C2=A0 architectures
> > > >=20
> > > > v4: handle missing runqemu variable from build config, add
> > > > python3-pefile to fast ptest list
> > > >=20
> > > > v3: rebased, fixed and added more sefltests, removed wic plugin sid=
e uki
> > > > support
> > > >=20
> > > > v2: https://lists.openembedded.org/g/openembedded-core/message/2040=
90
> > > >=20
> > > > Michelle Lin (1):
> > > > =C2=A0 uki.bbclass: add class for building Unified Kernel Images (U=
KI)
> > > >=20
> > > > Mikko Rapeli (7):
> > > > =C2=A0 wic bootimg-efi.py: keep timestamps and add debug prints
> > > > =C2=A0 wic bootimg-efi.py: change UKI support from wic plugin to uk=
i.bbclass
> > > > =C2=A0 oeqa selftest uki.py: add tests for uki.bbclass
> > > > =C2=A0 oeqa selftest efibootpartition.py: add TEST_RUNQEMUPARAMS to=
 runqemu
> > > > =C2=A0 oeqa selftest efibootpartition.py: remove systemd-boot from =
grub-efi
> > > > =C2=A0=C2=A0=C2=A0 test
> > > > =C2=A0 oeqa selftest wic.py: add TEST_RUNQEMUPARAMS to runqemu
> > > > =C2=A0 oeqa selftest wic.py: support UKIs via uki.bbclass
> > > >=20
> > >=20
> > > I'm still seeing failures in CI:
> > >=20
> > > https://valkyrie.yoctoproject.org//#/builders/23/builds/249/steps/14/=
logs/stdio
> > >=20
> > > which is despite setting:
> > >=20
> > > https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3D6211ad=
9210e82a5a8dd157c63752ad332c2f5de6
> > >=20
> > > QEMU_USE_KVM =3D "False"
> > >=20
> > > into the test to ensure it doesn't have the issue the barebox testing
> > > was seeing.
> > >=20
> > > I've sent a patch to try and clean up the lock error.
> > >=20
> > > There is also this:
> > >=20
> > > https://valkyrie.yoctoproject.org//#/builders/76/builds/235
> > > https://valkyrie.yoctoproject.org//#/builders/48/builds/181
> > > https://valkyrie.yoctoproject.org//#/builders/54/builds/230
> > >=20
> > > which is due to the binaries being run "in tree" within the edk2 buil=
d
> > > as well as from the sysroot. This generates two sets of pyc files whi=
ch
> > > then conflict (or not) depending on which host the build ran on and
> > > which pyc files are in sstate.
> > >=20
> > > We're going to have to get this fixed before it can merge, probably b=
y
> > > deleting the pyc files at install unless we can find anything more
> > > elegant.
> >=20
> > Sent an ovmf-native patch separately for this.
>=20
> With ovmf-native change applied to master, can this series be tried again=
?
>=20
> Or are some changes needed?

This handles the pyc issue which is useful as it caused widespread
build failures. The question of the first arm test failure remains :/.

I will run it through testing again though. I'm juggling far too many
failures at the moment, I can't tell what is "good" and what isn't very
easily.

Cheers,

Richard


