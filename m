Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C17C54F30
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 09:52:08 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.48197.1748339527589933414
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 02:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XBpdyPXS;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso27895771fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 02:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748339526; x=1748944326; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mjsYreqLN99G/tmz8mTOAxcEBcg5RMo14klQhfGpYi8=;
        b=XBpdyPXSlQdn0NrM6r0QWUJ35aswaVDsovXg5mqQETKXb94rovY4ZmO4wjVTGr2KCQ
         wMkS9/TKLMgvtFhdntUaW8jaB6jvTv5rktivpnyxZiNGohCqvOoAKXKWRimBE5RDNEex
         gM0o3eROhrXXZWdB4T2G++FYzhiyNYMP7TbsNBe0RLsrTgcs1hNvOZUorB1758w3fh39
         ZheE0STFFCRqD+y6wRw2LjdNhJCeL7+PpinBWemSyOxHJH9Ri9wbpAMg0siWrynXfVmA
         2DiAXROLC8AwtYi8UTuvDeRr6o2w/IrCGOUfeq4OFoBynWSoT91a2Zsjw8zhEdHBEmkZ
         NaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748339526; x=1748944326;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mjsYreqLN99G/tmz8mTOAxcEBcg5RMo14klQhfGpYi8=;
        b=RnluY38zh2+C/Q9T5hLSFwO8xTviboer3HMcsOQMXV06igMkzUTdh5SDUny2xSUKRB
         egVp435wwwFP7I1HkS7MMPlzz8o1Y6Tt/9XnQvHZw+s1vSvBReqVT0jMMACr8fdEPSLP
         TVH5RxaZj4vC8JzOlIj3lNKqxTQG1Eq5fIyeywKcRaQtBShXGP9jVplr06C7GRyLMW9d
         dV0D3xuaf2yYKlxqpbWh2zq/TQnUf5aNZga9p/rggePPkP3chXBv5ZoSN+8/SnzlUCXP
         IWC3zCMZ/Bz417DrrH+KGXpWSrAv/eWeD+BOmDuJpK1yindIJg4oi1yT+fB31/+Ft7id
         4dTQ==
X-Gm-Message-State: AOJu0YwAN/Tv6lC453YSXLABaXzCiWKVQ2ojD52Erc2RF84x36Y9tW+R
	mwh3mVdt+XNY4FEcS4KEIetLfY9+H3ZdPr0EkCQvaa17RvcEYaD6JODOR0RHvqoFajY=
X-Gm-Gg: ASbGncuZZDhxjFBwd3B2h1JXPqRV/petq6ZUSgbrSw6wf7g5l4qKz/ptkioLRSbjzhs
	smkXQguxXn1fs2k2yzCiOMMjyWFQkk1WcNtJJMizwq/zf3avTHAHmPGlQ7QaxmnOjuJbes80HD8
	qu2ekyI+sJa4Ux1bQtbs/V7+S+sXOEHqVnoFUvm529Vs4daZqvq27NLGvp9cwhLMOA/HwPjge00
	SSLxARQ1FuL25jYmcUG500lt813caOIQDfZpvcWtg9CmMwvbmk7i7ku1rJd4tufU27YJkqwmK4D
	vo+Hs+xBRwsTf18ys/Xey1pLVNn+y4zWvmFnvSGzFOHgB5LfVpFlwg5Y0UwraewvEODlRXZYZuU
	LIzqh
X-Google-Smtp-Source: AGHT+IG4HvsGOxpiRu+yqO8+KPC8GYZ/LrzRfr6p45nClsfZ12gu+PITZAzF5Nd9TT5kAXjBApXzGw==
X-Received: by 2002:a05:651c:322c:b0:32a:6ccf:a455 with SMTP id 38308e7fff4ca-32a6ccfa4e6mr7129151fa.16.1748339525611;
        Tue, 27 May 2025 02:52:05 -0700 (PDT)
Received: from nuoska (2001-14ba-48e-3a00--183.rev.dnainternet.fi. [2001:14ba:48e:3a00::183])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a5fa03c03sm7039371fa.11.2025.05.27.02.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 02:52:05 -0700 (PDT)
Date: Tue, 27 May 2025 12:52:03 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/3] oeqa selftest uboot.py: add qemu KVM test
 case
Message-ID: <aDWLQ9TgDN4JCoTF@nuoska>
References: <20250522134116.254270-1-mikko.rapeli@linaro.org>
 <20250522134116.254270-3-mikko.rapeli@linaro.org>
 <DA3KGS7N34KS.2QGDJ16MHESOG@bootlin.com>
 <18422DAC420B1606.3062@lists.openembedded.org>
 <aDQqIZgXepLP3xXD@nuoska>
 <DA6QFY5IH472.13Q6AXZPWICCU@bootlin.com>
 <aDVnDQPSPFFeYgYG@nuoska>
 <DA6RW4W11Z6L.1MNI997UJXXB5@bootlin.com>
 <DA6UARJCKY1F.22D63SXC39NBQ@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <DA6UARJCKY1F.22D63SXC39NBQ@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 09:52:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217296

Hi,

On Tue, May 27, 2025 at 11:36:10AM +0200, Mathieu Dubois-Briand wrote:
> On Tue May 27, 2025 at 9:43 AM CEST, Mathieu Dubois-Briand wrote:
> > On Tue May 27, 2025 at 9:17 AM CEST, Mikko Rapeli wrote:
> >> On Tue, May 27, 2025 at 08:34:52AM +0200, Mathieu Dubois-Briand wrote:
> >>> On Mon May 26, 2025 at 10:45 AM CEST, Mikko Rapeli wrote:
> >>> > On Fri, May 23, 2025 at 05:16:58PM +0300, Mikko Rapeli via lists.op=
enembedded.org wrote:
> >>> >
> >>> > I reviewed the runqemu and qemu-system-aarch64 arguments but could =
not see major differences.
> >>> > One difference is that autobuilder runs with tap and I with slirp n=
etworking, but that
> >>> > should not affect rootfs/ESP partition detection in u-boot. I've se=
nt out v4 now.
> >>> > If this still fails on autobuilder, then I'd need know what config =
fragments
> >>> > are applied. I've configured qemuarm64 and genericarm64 with
> >>> > ". oe-init-build-env" and then added TEST_RUNQEMUPARAMS +=3D "slirp"
> >>> > and SANITY_TESTED_DISTROS =3D "" to conf/local.conf. Maybe autobuil=
der
> >>> > scripts add something more.
> >>> >
> >>> > Cheers,
> >>> >
> >>> > -Mikko
> >>>=20
> >>> Hi Mikko,
> >>>=20
> >>> Thanks for the new version, but I confirm it still fails.
> >>>=20
> >>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/17=
72
> >>
> >> Is it possible to grab the full boot log
> >> /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1032659=
/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/testimage/qemu_boot_l=
og.20250526163143 ?
> >>
> >> It was referred in
> >> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2499407/raw_=
inline
> >>
> >
> > The file is gone :(
> >
> > I will launch a new build so I can capture the file.
>=20
> New build. There is also a failure on bitbake selftest here, but it
> seems to be an unrelated intermittent issue.
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1778
>=20
> I believe the file you are looking for is
> /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-932426/tmp=
/work/qemuarm64-poky-linux/core-image-minimal/1.0/testimage/qemu_boot_log.2=
0250527082811.2,
> I'm attaching it to my mail. But I'm not sure there is more data than
> what you already had.
>=20
> I will try to backup the whole build directory once the build is done,
> in the case you need some other file.

Contents of the file is short and show that u-boot failed to find the binar=
ies
needed from ESP or other locations. I had the exact same failure, finally:

U-Boot 2025.04 (Apr 07 2025 - 21:57:55 +0000)

DRAM:  256 MiB
Core:  52 devices, 14 uclasses, devicetree: board
Flash: 64 MiB
Loading Environment from Flash... *** Warning - bad CRC, using default envi=
ronment

In:    serial,usbkbd
Out:   serial,vidconsole
Err:   serial,vidconsole
No USB controllers found
Net:   eth0: virtio-net#32
=1B[?25h
starting USB...
No USB controllers found
Hit any key to stop autoboot:  2 =08=08=08 1 =08=08=08 0=20
Scanning for bootflows in all bootdevs
Seq  Method       State   Uclass    Part  Name                      Filename
---  -----------  ------  --------  ----  ------------------------  -------=
---------
Scanning global bootmeth 'efi_mgr':
=1B7=1B[r=1B[999;999H=1B[6n=1B8Cannot persist EFI variables without system =
partition
Missing TPMv2 device for EFI_TCG_PROTOCOL
  0  efi_mgr      ready   (none)       0  <NULL>                   =20
** Booting bootflow '<NULL>' with efi_mgr
Loading Boot0000 'virtio 0' failed
EFI boot manager: Cannot load any image
Boot failed (err=3D-14)
Scanning bootdev 'fw-cfg@9020000.bootdev':
fatal: no kernel available
No USB controllers found
scanning bus for devices...
Scanning bootdev 'virtio-blk#36.bootdev':
Scanning bootdev 'virtio-net#32.bootdev':
BOOTP broadcast 1
BOOTP broadcast 2
BOOTP broadcast 3
BOOTP broadcast 4
BOOTP broadcast 5
BOOTP broadcast 6
BOOTP broadcast 7
BOOTP broadcast 8
BOOTP broadcast 9
BOOTP broadcast 10
BOOTP broadcast 11
BOOTP broadcast 12
BOOTP broadcast 13
BOOTP broadcast 14
BOOTP broadcast 15
BOOTP broadcast 16
BOOTP broadcast 17

Retry time exceeded; starting again
No more bootdevs
---  -----------  ------  --------  ----  ------------------------  -------=
---------
(1 bootflow, 1 valid)
=3D>=20

So this is the race condition and problem in wic with aarch64 targets where
systemd-boot or grub-efi are not compiled before wic creates
images and missing EFI loader files on the ESP partition
generated by wic don't fail the build. In my case and I suspect
on autobuilder as well, the core-image-minimal-qemuarm64.rootfs.wic is miss=
ing
/efi/boot/bootaa64.efi file which is the expected default on aarch64.
This can be checked in build directory with:

$ wic ls tmp/deploy/images/qemuarm64/core-image-minimal-qemuarm64.rootfs.wi=
c:1/efi/boot/bootaa64.efi

These are fixed in my tree with patches
"image_types_wic.bbclass: depend on grub-efi and systemd-boot on aarch64, s=
ystemd-boot on arm"
https://lists.openembedded.org/g/openembedded-core/topic/112395863#msg215349

and

"wic bootimg-efi.py: fail build if no binaries installed"
https://lists.openembedded.org/g/openembedded-core/topic/112395862#msg215222

The latter fails the build if EFI loader binary is not installed.
The patches have some open review comments on mailing list and I'm
trying to get to fixing them.

Cheers,

-Mikko

