Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5F8C83F34
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 10:28:22 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.17993.1752834494970258672
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jul 2025 03:28:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XIAj20sv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a6e8b1fa37so1352640f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 03:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1752834493; x=1753439293; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hdo1puxcFzLko993duJkiwPrmq1ulQjPG0voy597SZo=;
        b=XIAj20svhaFgYEVXLvCzZCaJYKMDHuVEHOrJVAVaNKhzTiP/ddMUKH9ysYQJ6XVYGA
         8oq/N/4K9i7JMCKUDkVAYRaudFYtFVdMSI+juuOXXy9asupTV7bTNo0kD8+EFFfIgqE0
         C8/TllyQK0toeW3cVb+57sIUZyvXCIvhWtnA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752834493; x=1753439293;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hdo1puxcFzLko993duJkiwPrmq1ulQjPG0voy597SZo=;
        b=eHYII1uvpqo9sbDTMQQhVfQIT1+njPBjM4jCAoVXtnk1ct3iMgg+pLEKbi3hbBVZGd
         niSol/1qWQJ5XLA48j6M+N/qnXvkyEgRiANQ19VEK2lEl3+mmoW58korndg0eKOgLn2s
         5VDK260262at3e5sMWkhyau95QI/fltSOF9qpm4TktWEzheS0CiI3nM33751Qg5xCemf
         coX85OMWlvsH+K9Xm00kXlpLkz/Psz22uFs+Ba5aX5qzRTeAYUPSsmqsV63y1iC+SL/c
         ptsuEz1epr45J9/8aIrnA/Lnx/I48dvr4/mrGONDOBHWHyNoSjPMMRtZwp1cj0NBN7Kp
         sDrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGfWLTY/F2zfBqXg6Jfm39//qzTkKDfXdA3+PjETpGtPiIfBNO+JQv9gBg3ihuZU+JkMCi3UPaNk2NWl/LmYvatA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxmIFs1V3NSftNtz9zeJaN/daeO4KRtr20Nau7sHxl9aGJhvtq+
	3+DrpSxymOfvViY2AVtw+b0qvv0nNLHwla/Nf9s3EG7ksPzD4dFgpBzT3xyEdY7LrW4=
X-Gm-Gg: ASbGncvGOtK04mI53rtousEvwVXOI1W5hPQOcs82q715XbVV/r6KasN+Vzpzd/B2B0J
	VOFIJk45wVjor11MQgU3OTSROYrJ8bO2TGc/Pgw2EADHaS7Nk6mCzkuvFU17tlzKcv5DMZzAyzP
	LfGmStS7uID02rS2g+zUxBho3W/E9XvtMNYbzeABpt2uXMpMoZFrxB5orTqxzsUkYHhVh5ajGQc
	fEFPwfNZrw3uAFi+9P2ttkfWe+nxLDY+WXl0+0KLd/bCdnzRbsL3IDIFy84iz7aPtjW1+DeADEa
	syjQ0uxEDdu4aXxWbfO0E/xcwwhkcK3yoWJBKcTWNbgEF+jinS+SiJLr4/vOCTqfRZ8CwQ68SI7
	3KAkQBFbPz4AOg+CmyrZ6SKiEXqmRRwoyC6SJF3ftVu3EeTgwH+O88c/TC/y63a/+/OTyUzBXrf
	9epnPFnA==
X-Google-Smtp-Source: AGHT+IGkt5iS57mCvfXIeOmpDt9QmpCyB9zwMpx5yucoXvqsKxffO+Vnu9uP4FMg8JLOdlDQvShCjA==
X-Received: by 2002:a05:6000:2084:b0:3a5:1c3c:8d8d with SMTP id ffacd0b85a97d-3b60e53b9ebmr8115258f8f.55.1752834493134;
        Fri, 18 Jul 2025 03:28:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b19:5c6:27ed:a530? ([2001:8b0:aba:5f3c:b19:5c6:27ed:a530])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e8026e4sm73797955e9.11.2025.07.18.03.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 03:28:12 -0700 (PDT)
Message-ID: <ab6ce5a5fc2d8a4f10926d10438156b687e98747.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] u-boot: upgrade 2025.04 -> 2025.07
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@gmail.com>
Date: Fri, 18 Jul 2025 11:28:10 +0100
In-Reply-To: <20250718090123.420399-1-mikko.rapeli@linaro.org>
References: <20250718090123.420399-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 10:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220594

On Fri, 2025-07-18 at 12:01 +0300, Mikko Rapeli via lists.openembedded.org =
wrote:
> From: Fabio Estevam <festevam@gmail.com>
>=20
> Upgrade to U-Boot 2025.07. Added patches for build race conditions.
> Removed qemu KVM USB workaround since issue is fixed upstream.
>=20
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0.../u-boot/files/disable_CONFIG_USB.cfg=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 -
> =C2=A0...pts-Makefile.lib-fix-_efi.so-depende.patch | 136 +++++++++++++++=
+++
> =C2=A0...kefile-change-apps-from-always-to-ta.patch |=C2=A0 57 ++++++++
> =C2=A0meta/recipes-bsp/u-boot/u-boot-common.inc=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 8 +-
> =C2=A0...ols_2025.04.bb =3D> u-boot-tools_2025.07.bb} |=C2=A0=C2=A0 0
> =C2=A0.../{u-boot_2025.04.bb =3D> u-boot_2025.07.bb}=C2=A0 |=C2=A0=C2=A0 =
4 +-
> =C2=A06 files changed, 201 insertions(+), 5 deletions(-)
> =C2=A0delete mode 100644 meta/recipes-bsp/u-boot/files/disable_CONFIG_USB=
.cfg
> =C2=A0create mode 100644 meta/recipes-bsp/u-boot/files/v3-0001-Makefile-s=
cripts-Makefile.lib-fix-_efi.so-depende.patch
> =C2=A0create mode 100644 meta/recipes-bsp/u-boot/files/v3-0002-efi_loader=
-Makefile-change-apps-from-always-to-ta.patch
> =C2=A0rename meta/recipes-bsp/u-boot/{u-boot-tools_2025.04.bb =3D> u-boot=
-tools_2025.07.bb} (100%)
> =C2=A0rename meta/recipes-bsp/u-boot/{u-boot_2025.04.bb =3D> u-boot_2025.=
07.bb} (64%)
>=20
> v3: Did not manage to reproduce AB build failures but added delays to mor=
e
> =C2=A0=C2=A0=C2=A0 linker calls which exposed similar issues. Fixed failu=
res with patches
> =C2=A0=C2=A0=C2=A0 which are also submitted upstream.
>=20
> v2: added upstreamed patch to fix build race conditon, removed qemu kvm w=
orkaround
> =C2=A0=C2=A0=C2=A0 fixed upstream. Would be nice to check if builds now p=
ass.
> =C2=A0=C2=A0=C2=A0 https://lists.openembedded.org/g/openembedded-core/mes=
sage/220436
>=20
> v1: https://lists.openembedded.org/g/openembedded-core/message/220004
>=20
> diff --git a/meta/recipes-bsp/u-boot/files/disable_CONFIG_USB.cfg b/meta/=
recipes-bsp/u-boot/files/disable_CONFIG_USB.cfg
> deleted file mode 100644
> index 1d2509982be1..000000000000
> --- a/meta/recipes-bsp/u-boot/files/disable_CONFIG_USB.cfg
> +++ /dev/null
> @@ -1 +0,0 @@
> -# CONFIG_USB is not set
> diff --git a/meta/recipes-bsp/u-boot/files/v3-0001-Makefile-scripts-Makef=
ile.lib-fix-_efi.so-depende.patch b/meta/recipes-bsp/u-boot/files/v3-0001-M=
akefile-scripts-Makefile.lib-fix-_efi.so-depende.patch
> new file mode 100644
> index 000000000000..e8253a67b211
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/files/v3-0001-Makefile-scripts-Makefile.lib=
-fix-_efi.so-depende.patch
> @@ -0,0 +1,136 @@
> +From 2e7c1321bb44cc6af4ee4b1026a52e1a0aa7e336 Mon Sep 17 00:00:00 2001
> +From: Mikko Rapeli <mikko.rapeli@linaro.org>
> +Date: Thu, 10 Jul 2025 14:24:07 +0000
> +Subject: [PATCH v3 1/2] Makefile scripts/Makefile.lib: fix *_efi.so depe=
ndency
> + to PLATFORM_LIBGCC
> +
> +When PLATFORM_LIBGCC was added to linker command it was not
> +added to the dependency of the .so and other rules. Thus a build can
> +try to link *_efi.so files before lib.a from PLATFORM_LIBGCC is availabl=
e.
> +This was seen in yocto autobuilder builds with u-boot 2025.07
> +update, see https://lists.openembedded.org/g/openembedded-core/message/2=
20004
> +
> +https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2914600/raw_in=
line
> +
> +|=C2=A0=C2=A0=C2=A0 rm -f lib/efi_loader/built-in.o; arm-poky-linux-gnue=
abi-ar cDPrsT lib/efi_loader/built-in.o lib/efi_loader/efi_bootmgr.o lib/ef=
i_loader/efi_bootbin.o lib/efi_loader/efi_boottime.o lib/efi_loader/efi_hel=
per.o lib/efi_loader/efi_console.o lib/efi_loader/efi_device_path.o lib/efi=
_loader/efi_device_path_to_text.o lib/efi_loader/efi_device_path_utilities.=
o lib/efi_loader/efi_dt_fixup.o lib/efi_loader/efi_fdt.o lib/efi_loader/efi=
_file.o lib/efi_loader/efi_hii.o lib/efi_loader/efi_hii_config.o lib/efi_lo=
ader/efi_image_loader.o lib/efi_loader/efi_load_options.o lib/efi_loader/ef=
i_memory.o lib/efi_loader/efi_root_node.o lib/efi_loader/efi_runtime.o lib/=
efi_loader/efi_setup.o lib/efi_loader/efi_string.o lib/efi_loader/efi_unico=
de_collation.o lib/efi_loader/efi_var_common.o lib/efi_loader/efi_var_mem.o=
 lib/efi_loader/efi_variable.o lib/efi_loader/efi_var_file.o lib/efi_loader=
/efi_watchdog.o lib/efi_loader/efi_disk.o lib/efi_loader/efi_net.o lib/efi_=
loader/efi_smbios.o lib/efi_loader/efi_load_initrd.o lib/efi_loader/efi_con=
formance.o
> +|=C2=A0=C2=A0 arm-poky-linux-gnueabi-ld.bfd -nostdlib -zexecstack -znoco=
mbreloc -znorelro --no-warn-rwx-segments -L /srv/pokybuild/yocto-worker/oe-=
selftest-armhost/build/build-st-3119200/tmp/work/beaglebone_yocto-poky-linu=
x-gnueabi/u-boot/2025.07/sources/u-boot-2025.07 -T arch/arm/lib/elf_arm_efi=
.lds -shared -Bsymbolic -s lib/efi_loader/helloworld.o lib/efi_loader/efi_c=
rt0.o lib/efi_loader/efi_reloc.o lib/efi_loader/efi_freestanding.o arch/arm=
/lib/lib.a -o lib/efi_loader/helloworld_efi.so
> +| arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.a: No such=
 file or directory
> +| make[3]: *** [scripts/Makefile.lib:512: lib/efi_loader/helloworld_efi.=
so] Error 1
> +
> +The issue is hard to reproduce but this change can artificially trigger =
it:
> +
> +=C2=A0 a/scripts/Makefile.build
> +=C2=A0 b/scripts/Makefile.build
> +@@ -353,7 +353,7 @@ $(modorder-target): $(subdir-ym) FORCE
> + #
> + ifdef lib-target
> + quiet_cmd_link_l_target =3D AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $@
> +-cmd_link_l_target =3D rm -f $@; $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(lib-=
y)
> ++cmd_link_l_target =3D rm -f $@ && echo "HACK, delaying build!" && sleep=
 60 && $(AR) cDPrsT$(KBUILD_ARFLAGS) $@ $(lib-y)
> +

This is not how you solve build races and I've very reluctant to take
patches that look like that, whether submitted to upstream or
otherwise.

Cheers,

Richard

