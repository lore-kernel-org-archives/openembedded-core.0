Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BFACF9C6F
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 19:02:07 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.2842.1727118124020809324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 12:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QePpiWZj;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53568ffc525so5349480e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 12:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727118122; x=1727722922; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7Lpch2hnrlPpamcB1a0+M6DmWQmCRrdptN8MUxUg6ts=;
        b=QePpiWZjYb9YVQsjQSi3JI/BwBa4WBBteePZ881Lw6bD53P7bcwpnZKFTyVh9jUe+B
         6CZPJFq83Slu33rivcQhqkfNjWNLVS/fA7frsCX1F/RIYu+g38UrN+sVmTSsRUJTJSO3
         X/siXO5d9ym+2CrhI9X3FFFmlXXINiAjh5e2JwftIdmXKeSBCjRE6Z1S8D5CmoBxGKDp
         O0IgHkKabOOQimCnidSFL0gWhwcJljLTz86cABmJ4LC2W16UsBhu9d86hkdfXDkVg5GO
         CWPTj2LCZL7yqDfetDMZwpi8f68lBw5u/6erVhao97UZ4RZRlEiOdv5wThEwlL0AmoHz
         kC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727118122; x=1727722922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Lpch2hnrlPpamcB1a0+M6DmWQmCRrdptN8MUxUg6ts=;
        b=kQgHsT8KN59nodZE0btLdLeIi2IM35wf9yabAshPiwKIpDOCkKLkaTTcBask9NXU/T
         RCVIh2RROIxTDL8SHSSQgRmSln/Gu84Ri2ZO3VQFZLbENvRyacSV6dfVnGk9TS4S7ojd
         YTssN2lBe7XO5k1SfYPV1NcakuYiprJMjegFRTOeoP8uqQMgnB5+uOufhDMZAReRNPPI
         fx3HNS7RbmS2ydVWyNHENBntDsKgBELGVocMwflEs5JG+QMkurGGqSHual/eAhHJ8ZoR
         QLJ4mLQblXABvNfr/ZsRWs/8sdMdOYfdR6OQloZbBKaeLoqVgiKl6GOXKeGGGPA1bjDZ
         F0tQ==
X-Gm-Message-State: AOJu0Ywl5qxaEjPUFGbRfxN/l/LRSTpmrI64I7fcfUD8jdqUJcJVBWRb
	kCWGtYnG2tE1zf9mKfYHGcXDnXawYlbd2KhAjsDo1Hp+nbgp4esvHZ2z0gyPEKurBI01v6A5yD5
	L1ocNBvBUsYgucZ4Ne0WsGYLzTRGpRw==
X-Google-Smtp-Source: AGHT+IER3ZGskRnGi512+6RmuQFt4S19xAuNNUp6/gfSAap8IJ+v4sg7u9/WK2kfay1Conf0Z8Em4MaD9XlexVepE30=
X-Received: by 2002:a05:6512:2210:b0:52c:dbe7:cfd5 with SMTP id
 2adb3069b0e04-536ac2f50d7mr6289337e87.32.1727118121931; Mon, 23 Sep 2024
 12:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240922084128.9648-1-mikko.rapeli@linaro.org> <20240922084128.9648-9-mikko.rapeli@linaro.org>
In-Reply-To: <20240922084128.9648-9-mikko.rapeli@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 Sep 2024 21:01:50 +0200
Message-ID: <CANNYZj_qfDk7zHByaUPWm20znZrhnNeKcdgYNj-DuYGrUb-beg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 08/12] oeqa selftest uki.py: add tests for uki.bbclass
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 19:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204826

Can this be folded into wic selftests? Does it need to be in a
different testsuite to that, and how does it differ to the existing
wic uki test?

Alex

On Sun, 22 Sept 2024 at 10:42, Mikko Rapeli via lists.openembedded.org
<mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
>
> Tests builds and boots qemu into uki binary with systemd and sysvinit.
> Due to depedency to x86 specific ovmf UEFI firmware, tests
> are specific to x86 curently. UEFI firmware for ARM can be generated
> via qemuarm64-secureboot machine in meta-arm and similar tests
> on qemu will pass.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/lib/oeqa/selftest/cases/uki.py           | 138 ++++++++++++++++++
>  .../wic/canned-wks/efi-uki-bootdisk.wks.in    |   3 +
>  2 files changed, 141 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/cases/uki.py
>  create mode 100644 scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in
>
> diff --git a/meta/lib/oeqa/selftest/cases/uki.py b/meta/lib/oeqa/selftest/cases/uki.py
> new file mode 100644
> index 0000000000..b0e6e52d64
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/uki.py
> @@ -0,0 +1,138 @@
> +# Based on runqemu.py test file
> +#
> +# Copyright (c) 2017 Wind River Systems, Inc.
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import bitbake, runqemu, get_bb_var
> +from oeqa.core.decorator.data import skipIfNotArch
> +from oeqa.core.decorator import OETestTag
> +import oe.types
> +
> +class UkiTest(OESelftestTestCase):
> +    """Boot Unified Kernel Image (UKI) generated with uki.bbclass on UEFI firmware (omvf/edk2)"""
> +
> +    @skipIfNotArch(['i586', 'i686', 'x86_64'])
> +    @OETestTag("runqemu")
> +    def test_uki_boot_systemd(self):
> +        """Build and boot into UEFI firmware (omvf/edk2), systemd-boot, initrd without systemd, rootfs with systemd"""
> +        image = "core-image-minimal"
> +        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', image) or ""
> +        cmd = "runqemu %s nographic serial wic ovmf" % (runqemu_params)
> +        if oe.types.qemu_use_kvm(self.td.get('QEMU_USE_KVM', 0), self.td["TARGET_ARCH"]):
> +            cmd += " kvm"
> +
> +        self.write_config("""
> +# efi firmware must load systemd-boot, not grub
> +EFI_PROVIDER = "systemd-boot"
> +
> +# image format must be wic, needs esp partition for firmware etc
> +IMAGE_FSTYPES:pn-%s:append = " wic"
> +WKS_FILE = "efi-uki-bootdisk.wks.in"
> +
> +# efi, uki and systemd features must be enabled
> +INIT_MANAGER = "systemd"
> +MACHINE_FEATURES:append = " efi"
> +DISTRO_FEATURES:append = " uki"
> +DISTRO_FEATURES:append = " systemd"
> +DISTRO_FEATURES_NATIVE:append = " systemd"
> +IMAGE_CLASSES:append:pn-core-image-minimal = " uki"
> +
> +# uki embeds also an initrd
> +INITRAMFS_IMAGE = "core-image-minimal-initramfs"
> +
> +# runqemu must not load kernel separately, it's in the uki
> +QB_KERNEL_ROOT = ""
> +QB_DEFAULT_KERNEL = "none"
> +
> +# boot command line provided via uki, not via bootloader
> +UKI_CMDLINE = "rootwait root=LABEL=root console=${KERNEL_CONSOLE}"
> +""" % (image))
> +
> +        uki_filename = get_bb_var('UKI_FILENAME', image)
> +
> +        bitbake(image + " ovmf")
> +        with runqemu(image, ssh=False, launch_cmd=cmd) as qemu:
> +            self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
> +
> +            # Verify from efivars that firmware was:
> +            # x86_64, qemux86_64 = edk2
> +            # arm,  = u-boot
> +            cmd = "echo $( cat /sys/firmware/efi/efivars/LoaderFirmwareInfo-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f ) | grep 'EDK II'"
> +            status, output = qemu.run_serial(cmd)
> +            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
> +
> +            # Check that systemd-boot was the loader
> +            cmd = "echo $( cat /sys/firmware/efi/efivars/LoaderInfo-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f ) | grep systemd-boot"
> +            status, output = qemu.run_serial(cmd)
> +            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
> +
> +            # Check that systemd-stub was used
> +            cmd = "echo $( cat /sys/firmware/efi/efivars/StubInfo-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f ) | grep systemd-stub"
> +            status, output = qemu.run_serial(cmd)
> +            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
> +
> +            # Check that the compiled uki file was booted into
> +            cmd = "echo $( cat /sys/firmware/efi/efivars/LoaderEntrySelected-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f ) | grep '%s'" % (uki_filename)
> +            status, output = qemu.run_serial(cmd)
> +            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
> +
> +    @skipIfNotArch(['i586', 'i686', 'x86_64'])
> +    @OETestTag("runqemu")
> +    def test_uki_sysvinit(self):
> +        """Build and boot into UEFI firmware (omvf/edk2), systemd-boot, initrd with sysvinit, rootfs with sysvinit"""
> +        config = """
> +# efi firmware must load systemd-boot, not grub
> +EFI_PROVIDER = "systemd-boot"
> +
> +# image format must be wic, needs esp partition for firmware etc
> +IMAGE_FSTYPES:pn-core-image-base:append = " wic"
> +WKS_FILE = "efi-uki-bootdisk.wks.in"
> +
> +# efi, uki and systemd features must be enabled
> +MACHINE_FEATURES:append = " efi"
> +DISTRO_FEATURES_NATIVE:append = " systemd"
> +IMAGE_CLASSES:append:pn-core-image-base = " uki"
> +
> +# uki embeds also an initrd, no systemd or udev
> +INITRAMFS_IMAGE = "core-image-initramfs-boot"
> +
> +# runqemu must not load kernel separately, it's in the uki
> +QB_KERNEL_ROOT = ""
> +QB_DEFAULT_KERNEL = "none"
> +
> +# boot command line provided via uki, not via bootloader
> +UKI_CMDLINE = "rootwait root=LABEL=root console=${KERNEL_CONSOLE}"
> +
> +"""
> +        self.append_config(config)
> +        bitbake('core-image-base ovmf')
> +        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', 'core-image-base') or ""
> +        uki_filename = get_bb_var('UKI_FILENAME', 'core-image-base')
> +        self.remove_config(config)
> +
> +        with runqemu('core-image-base', ssh=False,
> +                     runqemuparams='%s slirp nographic ovmf' % (runqemu_params), image_fstype='wic') as qemu:
> +            # Verify from efivars that firmware was:
> +            # x86_64, qemux86_64 = edk2
> +            # arm,  = u-boot
> +            cmd = "echo $( cat /sys/firmware/efi/efivars/LoaderFirmwareInfo-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f ) | grep 'EDK II'"
> +            status, output = qemu.run_serial(cmd)
> +            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
> +
> +            # Check that systemd-boot was the loader
> +            cmd = "echo $( cat /sys/firmware/efi/efivars/LoaderInfo-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f ) | grep systemd-boot"
> +            status, output = qemu.run_serial(cmd)
> +            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
> +
> +            # Check that systemd-stub was used
> +            cmd = "echo $( cat /sys/firmware/efi/efivars/StubInfo-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f ) | grep systemd-stub"
> +            status, output = qemu.run_serial(cmd)
> +            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
> +
> +            # Check that the compiled uki file was booted into
> +            cmd = "echo $( cat /sys/firmware/efi/efivars/LoaderEntrySelected-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f ) | grep '%s'" % (uki_filename)
> +            status, output = qemu.run_serial(cmd)
> +            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
> diff --git a/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in b/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in
> new file mode 100644
> index 0000000000..1ea9c8a845
> --- /dev/null
> +++ b/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in
> @@ -0,0 +1,3 @@
> +bootloader --ptable gpt --timeout=5
> +part /boot --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --label boot --active --align 1024 --use-uuid --part-name="ESP" --part-type=C12A7328-F81F-11D2-BA4B-00A0C93EC93B --fixed-size 512M
> +part / --source rootfs --fstype=ext4 --label root --align 1024 --exclude-path boot/
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204780): https://lists.openembedded.org/g/openembedded-core/message/204780
> Mute This Topic: https://lists.openembedded.org/mt/108587934/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

