Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61697CEACDC
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 14:56:20 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.83584.1727794573470709936
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 07:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WjKIuaee;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cc43454d5so41816495e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 07:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727794572; x=1728399372; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bZOFA8QndNrEcHz8M9FCnQmSOIPP1npugHi1HjUEUwM=;
        b=WjKIuaee5mnk5ag9IsY8Y0IafGaZ4fksDY8jWuZ6bggibMH42dBmZEOSxs90ZHh3w1
         4L6Dz2mDU2SGBPSxdkrXYU9RWyUiCyPBdaxjkm6z709nqgaqRqCaTVciCJSMNpsYs2LA
         viKpCaGjuGhcrgb+W+6I0fA9PRxmFHU96h16M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727794572; x=1728399372;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bZOFA8QndNrEcHz8M9FCnQmSOIPP1npugHi1HjUEUwM=;
        b=fu+pEPDIzuCKynMziNPxqaffJBsVMpSmtbdlsBj2h/JGGFWWwK9fzGYHJ8lq7Wxfqk
         PMlcDWPODW8JOhlB+i1L1rXmK9KgqwgHDIdUqAMGE3xr59mQFqMmwZtCN7zdxNkQ8nWS
         hfi026UUe3OAokt58eKVtdowxrsHbhyS7IzlGYV3qE5lJ5vSrXLQ9L7XhPVjjXOONIYr
         GNJgsmVWZP7EL0MEq08JVZ8u3ePRTQkPahizq929Cx9znya55Ybw2JV55HsArxB8vbj8
         +d30R2I/foCidee4x1F5zI3BubIS6xG1+T8wrLcGstcRglvSNH8Meyn6gZAFPhTZR1eG
         vsvw==
X-Forwarded-Encrypted: i=1; AJvYcCVGu1PUhhFpsjZHq22NKdqmXnIfb//wb2YizzAw8gkxi8AuwzmzERQ1VtB8YVNhfcIO/9uAc8CCKKr2ojyPDiQtvw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzkep59W2MOPe4gzwEbiiP0cmfyIX2RPGmPTaaxCVOkEwNsUhzw
	/dC+QeoDdroEVPIcll2MH6kY1FVtXhdRzHi0Yhc9SCTkd5xMbUZHF1Pwc7cYwgA=
X-Google-Smtp-Source: AGHT+IFHRtuou1BuTIhPjyNhRhzKPtKX4ZkBO91rJGqksH6s4HPb9KqGGKWGm2VvRsx5EE5o7aOPSQ==
X-Received: by 2002:a05:600c:c0d:b0:425:80d5:b8b2 with SMTP id 5b1f17b1804b1-42f5843a819mr126665885e9.16.1727794571703;
        Tue, 01 Oct 2024 07:56:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:85a4:e3cc:bdf8:640d? ([2001:8b0:aba:5f3c:85a4:e3cc:bdf8:640d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57de0dfesm133754015e9.11.2024.10.01.07.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:56:11 -0700 (PDT)
Message-ID: <99df937c036d57a532b29851ffe7d0055d35d83f.camel@linuxfoundation.org>
Subject: Re: [yocto] [PATCH v7 0/7] Add barebox bootloader support (and
 testing)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Enrico =?ISO-8859-1?Q?J=F6rns?=
	 <ejo@pengutronix.de>, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, yocto@pengutronix.de
Date: Tue, 01 Oct 2024 15:56:10 +0100
In-Reply-To: <92a6efc1-51a0-4153-b894-581fbe868595@pengutronix.de>
References: <20240919120640.19714-1-ejo@pengutronix.de>
	 <b77f2c6737c330ef9ecce325d50a4aaa25b3e536.camel@linuxfoundation.org>
	 <ee536d88a5b6468b20e37f3daabe4aa63047d1ad.camel@pengutronix.de>
	 <92a6efc1-51a0-4153-b894-581fbe868595@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 14:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205174

On Tue, 2024-10-01 at 16:35 +0200, Ahmad Fatoum wrote:
> Hi,
>=20
> On 20.09.24 12:37, Enrico J=C3=B6rns wrote:
> > Am Donnerstag, dem 19.09.2024 um 21:56 +0100 schrieb Richard Purdie:
> > > This looked better in testing, thanks. There was:
> > >=20
> > > https://valkyrie.yoctoproject.org/#/builders/23/builds/168/steps/14/l=
ogs/stdio
> > >=20
> > > which is from oe-selftest on an ARM server though :/
> >=20
> > Thank you for the test log!>=20
> > I'll try to figure out why it works in my test setup but doesn't in the=
 autobuilder..
> > Not sure if I'll have the chance to reproduce it on an ARM host.
>=20
> I tried reproducing the breakage on a Librecomputer Alta (Cortex-A73/A53)=
 with Debian 12
> for arm64, but without success. Details below.
>=20
> I applied this series on top of commit
>=20
> 4fc8427a6c ("systemd: make home directory readable by systemd-coredump")
>=20
> > Barebox doesn't seem to boot at all (or output is missing) and U-Boot g=
ot stuck.
>=20
> Both barebox' oe-selftest:
>=20
> =C2=A0 a3f@hass:~/poky/build$ oe-selftest -r barebox -v -v -v -K
> =C2=A0 [1] 257856
> =C2=A0 2024-09-27 15:06:52,672 - oe-selftest - INFO - Adding layer librar=
ies:
> =C2=A0 2024-09-27 15:06:52,672 - oe-selftest - INFO -=C2=A0 /home/a3f/pok=
y/meta/lib
> =C2=A0 2024-09-27 15:06:52,673 - oe-selftest - INFO -=C2=A0 /home/a3f/pok=
y/meta-yocto-bsp/lib
> =C2=A0 2024-09-27 15:06:52,674 - oe-selftest - INFO -=C2=A0 /home/a3f/pok=
y/meta-selftest/lib
> =C2=A0 2024-09-27 15:06:52,680 - oe-selftest - INFO - Checking base confi=
guration is valid/parsable
> =C2=A0 NOTE: Starting bitbake server...
> =C2=A0 2024-09-27 15:06:59,982 - oe-selftest - INFO - Adding: "include se=
lftest.inc" in /home/a3f/poky/build-st/conf/local.conf
> =C2=A0 2024-09-27 15:06:59,983 - oe-selftest - INFO - Adding: "include bb=
layers.inc" in bblayers.conf
> =C2=A0 2024-09-27 15:06:59,985 - oe-selftest - INFO - test_boot_barebox (=
barebox.BareboxTest.test_boot_barebox)
> =C2=A0 2024-09-27 15:07:00,024 - oe-selftest - DEBUG - Writing to: /home/=
a3f/poky/build-st/conf/selftest.inc
> =C2=A0=20
> =C2=A0 QB_DEFAULT_KERNEL =3D "barebox-dt-2nd.img"
> =C2=A0 PREFERRED_PROVIDER_virtual/bootloader =3D "barebox"
> =C2=A0=20
> =C2=A0=20
> =C2=A0 2024-09-27 15:23:54,349 - oe-selftest - INFO -=C2=A0 ... ok
> =C2=A0 2024-09-27 15:23:54,357 - oe-selftest - INFO - -------------------=
---------------------------------------------------
> =C2=A0 2024-09-27 15:23:54,358 - oe-selftest - INFO - Ran 1 test in 1019.=
863s
> =C2=A0 2024-09-27 15:23:54,359 - oe-selftest - INFO - OK
> =C2=A0 2024-09-27 15:24:08,447 - oe-selftest - INFO - RESULTS:
> =C2=A0 2024-09-27 15:24:08,450 - oe-selftest - INFO - RESULTS - barebox.B=
areboxTest.test_boot_barebox: PASSED (1014.37s)
> =C2=A0 2024-09-27 15:24:08,513 - oe-selftest - INFO - SUMMARY:
> =C2=A0 2024-09-27 15:24:08,514 - oe-selftest - INFO - oe-selftest () - Ra=
n 1 test in 1019.866s
> =C2=A0 2024-09-27 15:24:08,515 - oe-selftest - INFO - oe-selftest - OK - =
All required tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=
=3D0)
>=20
> and U-Boot's conclude successfully:
>=20
> =C2=A0 a3f@hass:~/poky/build$ oe-selftest -r uboot -v -v -v -K
> =C2=A0 2024-09-30 10:41:21,225 - oe-selftest - INFO - Adding layer librar=
ies:
> =C2=A0 2024-09-30 10:41:21,225 - oe-selftest - INFO -=C2=A0 /home/a3f/pok=
y/meta/lib
> =C2=A0 2024-09-30 10:41:21,225 - oe-selftest - INFO -=C2=A0 /home/a3f/pok=
y/meta-yocto-bsp/lib
> =C2=A0 2024-09-30 10:41:21,226 - oe-selftest - INFO -=C2=A0 /home/a3f/pok=
y/meta-selftest/lib
> =C2=A0 2024-09-30 10:41:21,229 - oe-selftest - INFO - Checking base confi=
guration is valid/parsable
> =C2=A0 NOTE: Starting bitbake server...
> =C2=A0 2024-09-30 10:41:24,120 - oe-selftest - INFO - Adding: "include se=
lftest.inc" in /home/a3f/poky/build-st/conf/local.conf
> =C2=A0 2024-09-30 10:41:24,125 - oe-selftest - INFO - Adding: "include bb=
layers.inc" in bblayers.conf
> =C2=A0 2024-09-30 10:41:24,131 - oe-selftest - INFO - test_boot_uboot (ub=
oot.UBootTest.test_boot_uboot)
> =C2=A0 2024-09-30 10:41:24,214 - oe-selftest - DEBUG - Writing to: /home/=
a3f/poky/build-st/conf/selftest.inc
> =C2=A0=20
> =C2=A0 QB_DEFAULT_BIOS =3D "u-boot.bin"
> =C2=A0 PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot"
> =C2=A0=20
> =C2=A0=20
> =C2=A0 2024-09-30 10:52:59,680 - oe-selftest - INFO -=C2=A0 ... ok
> =C2=A0 2024-09-30 10:52:59,692 - oe-selftest - INFO - -------------------=
---------------------------------------------------
> =C2=A0 2024-09-30 10:52:59,693 - oe-selftest - INFO - Ran 1 test in 696.3=
74s
> =C2=A0 2024-09-30 10:52:59,695 - oe-selftest - INFO - OK
> =C2=A0 2024-09-30 10:53:13,581 - oe-selftest - INFO - RESULTS:
> =C2=A0 2024-09-30 10:53:13,584 - oe-selftest - INFO - RESULTS - uboot.UBo=
otTest.test_boot_uboot: PASSED (695.55s)
> =C2=A0 2024-09-30 10:53:13,647 - oe-selftest - INFO - SUMMARY:
> =C2=A0 2024-09-30 10:53:13,648 - oe-selftest - INFO - oe-selftest () - Ra=
n 1 test in 696.378s
> =C2=A0 2024-09-30 10:53:13,649 - oe-selftest - INFO - oe-selftest - OK - =
All required tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=
=3D0)
>=20
>=20
> > U-Boot log in the failed test says
> >=20
> > > U-Boot 2024.07 (Jul 01 2024 - 18:07:18 +0000)
> > > DRAM:=C2=A0 256 MiB
> > > Core:=C2=A0 51 devices, 14 uclasses, devicetree: board
> > > Flash: 64 MiB
> > > Loading Environment from Flash... *** Warning - bad CRC, using defaul=
t environment
> > > In:=C2=A0=C2=A0=C2=A0 serial,usbkbd
> > > Out:=C2=A0=C2=A0 serial,vidconsole
> > > Err:=C2=A0=C2=A0 serial,vidconsole
> > > Bus xhci_pci: Register 8001040 NbrPorts 8
> > > Starting the controller
> >=20
> > While my successful run goes further:
> >=20
> > > [...]
> > > Starting the controller
> > > USB XHCI 1.00
> > > scanning bus xhci_pci for devices... 3 USB Device(s) found
> > > Net:=C2=A0=C2=A0 eth0: virtio-net#32
> > > ESC[?25h
> > > Hit any key to stop autoboot:=C2=A0 2
> >=20
> > But not sure if this is an issue with USB emulation or something else..=
.
>=20
> My successful run looks identical to yours. barebox start up is also
> successful and uneventful.
>=20
> Note that barebox' XHCI driver doesn't have PCI support unlike U-Boot, so
> if the same issue is affecting both barebox and U-Boot breakage in CI,
> it might not be USB emulation related as barebox doesn't do any
> USB on that platform...
>=20
> Is `selftest -r uboot -v -v -v -K` close enough to what the CI server run=
s
> or should I try something else to reproduce this?

That should have worked. "selftest -r barebox" should also fail.

The config used on the autobuilder for that can be seen here:

https://valkyrie.yoctoproject.org/#/builders/23/builds/168/steps/13/logs/st=
dio

in case the MACHINE value in particular makes a difference.

Cheers,

Richard



