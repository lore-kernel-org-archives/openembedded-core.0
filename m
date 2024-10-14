Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF9DCFC53F
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 10:31:05 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.51825.1728901863550738736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 03:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HrqnnQlJ;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539e63c8678so1614481e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 03:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728901862; x=1729506662; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fH1GVUDsMponGnkxKc6RkWHRFMDPFv0PMk4nXbHKldM=;
        b=HrqnnQlJR1O0p/zXkaD6jYsaBe1a8kNCF5KHGF7GZeC6YH95P2wkvwZNhTHuIwl1uq
         TTpFt5tz8B2H/wEc5Jrm5d7KF4bV3a+KkoQDtuDXZr0Y2fZYRiY4NKBYphqGxcGNeLiS
         2eet0BgEkAxkh9gLAoPFMd7/XlkL7QQfuqwNWXRVSy7cHabduk/erMNbeSqVU8Ba6uCF
         WNf8rb2UnWORAIrHLYdN/OY2gT/02rrlTfTzSChAxNN41VRWKTuCnpwgzgGjSYSIPE6Y
         RpkrYJXTlz1a3mT1ZsUh4XKyiKfceiM2qhBRazxbSWbS/DjOLUSMGnvMhYW2BzpZ9WDh
         irNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728901862; x=1729506662;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fH1GVUDsMponGnkxKc6RkWHRFMDPFv0PMk4nXbHKldM=;
        b=J2jOB/mb97DQE76M4JDyPbxFPzmB7i1rH4pCtCAOZhR/LqS44RiQgEgaC7NrF46giF
         nHvzcXJFjKM2mhisVyXIQtb13k+stnFGfWV8aISRK8Uv6iUtlugJSccDr4H6gWcTYDer
         gyVV2EAy0yXQNV0xrUTqtNXTq/zTZwdLBSovctOMEnHPV/Fjw1A6VZQum2/RMzg5TW9X
         39xYVCoYhf6jfigWmLQ1TKAlehSYcxeiW2MsF6LIjXB4Tl1XGZZmYOtA5tuM/ftpf39m
         Kn5+i97yMjXWWXYrkgP45VAi6VTnH490VhXzh5o8WLDUVKed4nZCWeJQpL5ve0lrakHw
         hzmg==
X-Gm-Message-State: AOJu0YziMMWgAH/ZSqoUj0vguLOiyjvwt8qmFAQ6jUabub+9OKDnmvW+
	CjvY59nzp9HbEJtodIzFMB/eX8oBt9TtShAbAjb1z732Cnodpo6FvNuf1JYbAinjAIZYXM3YnKS
	WUH8=
X-Google-Smtp-Source: AGHT+IEAZdMCaMxiFRiT6XzyXLUTGIwNqxG+E+pNOtLnDXr486pSSQQ8mMqZskrf0Xiu2t2TFXOyVg==
X-Received: by 2002:a05:6512:b11:b0:530:e323:b1d0 with SMTP id 2adb3069b0e04-539e54d77bdmr2740787e87.9.1728901861493;
        Mon, 14 Oct 2024 03:31:01 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539f5adf40asm406600e87.6.2024.10.14.03.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 03:30:59 -0700 (PDT)
Date: Mon, 14 Oct 2024 13:30:56 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v8 0/8] systemd uki support
Message-ID: <Zwzy4K-hzNiJcgNz@nuoska>
References: <20241011122044.12222-1-mikko.rapeli@linaro.org>
 <ebd022b240f4bb6b8e2e2fb8d93a4c9f2ba9492f.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ebd022b240f4bb6b8e2e2fb8d93a4c9f2ba9492f.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 10:31:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205741

Hi,

On Sun, Oct 13, 2024 at 08:43:15AM +0100, Richard Purdie wrote:
> On Fri, 2024-10-11 at 15:20 +0300, Mikko Rapeli via lists.openembedded.org wrote:
> > These changes enable building systemd uki images which combine
> > kernel, kernel command line, initrd and possibly signatures to
> > a single UEFI binary. This binary can be booted with UEFI firmware
> > and systemd-boot. No grub is needed and UEFI firmware and/or
> > systemd-boot provide possibilities for boot menus.
> > The uki binary can also be signed for UEFI secure boot
> > so the secure boot extends from firmware to kernel and initrd.
> > Binding secure boot to full userspace is then easier since for example
> > kernel command line and initrd contain the support needed to mount
> > encrypted dm-verity etc partitions, and/or create partitions on demand
> > with systemd-repart using device specific TPM devices for encryption.
> > 
> > Tested on qemuarm64-secureboot machine from meta-arm with changes to
> > support secure boot. Slightly different configuration tested on
> > multiple arm64 System Ready boards with UEFI firmware, real and firmware
> > based TPM devices. Tested with ovmf firmware on x86_64 with selftests but
> > without secure boot which seems to be harder to setup in ovmf.
> > 
> > Sadly I see two wic selftests, wic.Wic2.test_rawcopy_plugin_qemu and
> > wic.Wic2.test_expand_mbr_image, failing when executing all wic selftests
> > on a build machine with zfs filesystem. Will investigate this further.
> > The issue seems to be in mkfs.ext4 producing broken filesystem, and partially
> > in the tests which don't run the correct rootfs file (.ext4 vs .wic).
> > Will debug this further and it is IMO unrelated to these changes since
> > they reproduce on pure master branch without this series.
> > 
> > v8: fixed comments from Ross Burton: debug print from warning to debug,
> > ��� dropped duplicate DISTRO_FEATURE setting for systemd in tests,
> > ��� removed aarch64 comment from tests which are currently x86 only.
> > ��� Fixed the new aarch64 wic selftest to run on both genericarm64
> > ��� and qemuarm64 by adding bios, virtio disk driver etc settings
> > ��� for runqemu (already set in genericarm64 but missing from qemuarm64).
> > 
> > v7: add missing "ovmf" to runqemu argument to
> > ��� test_efi_plugin_plain_systemd_boot_qemu_x86 to fix boot hang
> > 
> > v6: fixes wic refactoring botch which broken non-uki systemd-boot usage on
> > ��� genericarm64 reported by Ross Burton <Ross.Burton@arm.com>, added
> > ��� selftest to cover this wks usage on x86 and aarch64
> > 
> > v5: drop patch "image_types_wic.bbclass: set systemd-boot and os-release
> > ��� dependency for all archs" since systemd-boot does not support all
> > ��� architectures
> > 
> > v4: handle missing runqemu variable from build config, add
> > python3-pefile to fast ptest list
> > 
> > v3: rebased, fixed and added more sefltests, removed wic plugin side uki
> > support
> > 
> > v2: https://lists.openembedded.org/g/openembedded-core/message/204090
> > 
> > Michelle Lin (1):
> > � uki.bbclass: add class for building Unified Kernel Images (UKI)
> > 
> > Mikko Rapeli (7):
> > � wic bootimg-efi.py: keep timestamps and add debug prints
> > � wic bootimg-efi.py: change UKI support from wic plugin to uki.bbclass
> > � oeqa selftest uki.py: add tests for uki.bbclass
> > � oeqa selftest efibootpartition.py: add TEST_RUNQEMUPARAMS to runqemu
> > � oeqa selftest efibootpartition.py: remove systemd-boot from grub-efi
> > ��� test
> > � oeqa selftest wic.py: add TEST_RUNQEMUPARAMS to runqemu
> > � oeqa selftest wic.py: support UKIs via uki.bbclass
> > 
> 
> I'm still seeing failures in CI:
> 
> https://valkyrie.yoctoproject.org//#/builders/23/builds/249/steps/14/logs/stdio
> 
> which is despite setting:
> 
> https://git.yoctoproject.org/poky/commit/?h=master-next&id=6211ad9210e82a5a8dd157c63752ad332c2f5de6
> 
> QEMU_USE_KVM = "False"
> 
> into the test to ensure it doesn't have the issue the barebox testing
> was seeing.
> 
> I've sent a patch to try and clean up the lock error.
> 
> There is also this:
> 
> https://valkyrie.yoctoproject.org//#/builders/76/builds/235
> https://valkyrie.yoctoproject.org//#/builders/48/builds/181
> https://valkyrie.yoctoproject.org//#/builders/54/builds/230
> 
> which is due to the binaries being run "in tree" within the edk2 build
> as well as from the sysroot. This generates two sets of pyc files which
> then conflict (or not) depending on which host the build ran on and
> which pyc files are in sstate.
> 
> We're going to have to get this fixed before it can merge, probably by
> deleting the pyc files at install unless we can find anything more
> elegant.

Sent an ovmf-native patch separately for this.

Cheers,

-Mikko

