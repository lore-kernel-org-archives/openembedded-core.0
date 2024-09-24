Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C03CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 14:04:44 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.14829.1727186682096942626
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 07:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=CPKZ1h0K;
 spf=pass (domain: linaro.org, ip: 209.85.208.170, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f7529203ddso61691311fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 07:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727186680; x=1727791480; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KwCpsAYsQFtGXRjtFp7vokl8oIkS5CVxMDd8R3dntmo=;
        b=CPKZ1h0KQ//XrYRA40gusxrMZFkYZg3lV1DlIsIMP1A3szvi8mngEBT61pyTnHWTE3
         BRh3Sl44txpnXfck7wjfY7+GDUskyr8Lo15ud8cR692aa4ji3RrGWIrc/vIlTfdu2PIk
         yXrfxddCMB+UYIS35/aCF1LPqXN96aylcGkg6oOOzfEcEv2BwH7Ux4AWapeVKefdoCiY
         103bx4MoBdybPqKlH4af6f+C6PJ3oknL7O+0yjJYROuX+f8KEaIM+jzh/7qt1IGyCYOy
         5ev4nxOYnHeadKI2oU0qZobdiELTgvUb/NYOHqp0vi+Uc1sVpzPfGwicEgvEiRT+BB+n
         jyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727186680; x=1727791480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KwCpsAYsQFtGXRjtFp7vokl8oIkS5CVxMDd8R3dntmo=;
        b=UlXQmEAeo30yLpSgA63Szr31rKD294u2JxHtfcQ03YKGO5X14xG1L4/G2A0/mKFv7X
         clVeU2szi0d8222W5dcYUVKWGrPpkLwWkhP7W9ZP8moS5MGBwWQ71rCmIBFiFT1xPArS
         bwAC6Rx1hMlRB9BYQF2qGKGjRQtOS+QbgJyQwhHZRjwdkGJlgHQn4GOd8plVCZfxogST
         lJ9FQcAnzfKKeHlgyKXfJzVTbMaUOIwrI9biWBu2dSfqx0H/YQ8mTxIr8b5Yixe3xZX7
         72A33uZceUP3xkB4tR6t6Ih7ZvZ/b5c5lYwbvDlvwOEM4XPsDW5Gvewinj0L8MfUBIbZ
         xvwQ==
X-Gm-Message-State: AOJu0YxhOnXfSrRgsp7wJikxiTttuz4blCjffg9+/ASHaugZp7tlXfEe
	9LRHiq//8q1FHQZkEydPzZrZMWpRyBgqUYOuz3fCAoi2dhBESEEFtqdvaXsms3M=
X-Google-Smtp-Source: AGHT+IGg2FGVe7ZGVmL7APwJVBor2vyWwURXp4Efwzfj22VJNnu2cWA48kN9tuaN0ln+KJoO4vUVig==
X-Received: by 2002:a2e:70a:0:b0:2f7:900a:3455 with SMTP id 38308e7fff4ca-2f8d0b85bcbmr10491051fa.14.1727186679801;
        Tue, 24 Sep 2024 07:04:39 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d289b6a6sm2505301fa.110.2024.09.24.07.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 07:04:33 -0700 (PDT)
Date: Tue, 24 Sep 2024 17:04:23 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v4 08/12] oeqa selftest uki.py: add tests for
 uki.bbclass
Message-ID: <ZvLG50Wtk9bUO-WF@nuoska>
References: <20240922084128.9648-1-mikko.rapeli@linaro.org>
 <20240922084128.9648-9-mikko.rapeli@linaro.org>
 <CANNYZj_qfDk7zHByaUPWm20znZrhnNeKcdgYNj-DuYGrUb-beg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj_qfDk7zHByaUPWm20znZrhnNeKcdgYNj-DuYGrUb-beg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 14:04:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204862

Hi,

On Mon, Sep 23, 2024 at 09:01:50PM +0200, Alexander Kanavin wrote:
> Can this be folded into wic selftests? Does it need to be in a
> different testsuite to that, and how does it differ to the existing
> wic uki test?

uki.bbclass used by images creates the uki binary with kernel, initrd etc.
It's unrelated to wic which can be used to create the ESP partition for UEFI
bootloader with minimal structure and config for systemd-boot to boot the actual
uki binary.

Thus I think uki.bbclass should have its own testsuite and it's not really
part of wic.

Cheers,

-Mikko

> Alex
> 
> On Sun, 22 Sept 2024 at 10:42, Mikko Rapeli via lists.openembedded.org
> <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> >
> > Tests builds and boots qemu into uki binary with systemd and sysvinit.
> > Due to depedency to x86 specific ovmf UEFI firmware, tests
> > are specific to x86 curently. UEFI firmware for ARM can be generated
> > via qemuarm64-secureboot machine in meta-arm and similar tests
> > on qemu will pass.
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  meta/lib/oeqa/selftest/cases/uki.py           | 138 ++++++++++++++++++
> >  .../wic/canned-wks/efi-uki-bootdisk.wks.in    |   3 +
> >  2 files changed, 141 insertions(+)
> >  create mode 100644 meta/lib/oeqa/selftest/cases/uki.py
> >  create mode 100644 scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/uki.py b/meta/lib/oeqa/selftest/cases/uki.py
> > new file mode 100644
> > index 0000000000..b0e6e52d64
> > --- /dev/null
> > +++ b/meta/lib/oeqa/selftest/cases/uki.py
> > @@ -0,0 +1,138 @@
> > +# Based on runqemu.py test file
> > +#
> > +# Copyright (c) 2017 Wind River Systems, Inc.
> > +#
> > +# SPDX-License-Identifier: MIT
> > +#
> > +
> > +from oeqa.selftest.case import OESelftestTestCase
> > +from oeqa.utils.commands import bitbake, runqemu, get_bb_var
> > +from oeqa.core.decorator.data import skipIfNotArch
> > +from oeqa.core.decorator import OETestTag
> > +import oe.types
> > +
> > +class UkiTest(OESelftestTestCase):
> > +    """Boot Unified Kernel Image (UKI) generated with uki.bbclass on UEFI firmware (omvf/edk2)"""
> > +
> > +    @skipIfNotArch(['i586', 'i686', 'x86_64'])
> > +    @OETestTag("runqemu")
> > +    def test_uki_boot_systemd(self):
> > +        """Build and boot into UEFI firmware (omvf/edk2), systemd-boot, initrd without systemd, rootfs with systemd"""
> > +        image = "core-image-minimal"
> > +        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', image) or ""
> > +        cmd = "runqemu %s nographic serial wic ovmf" % (runqemu_params)
> > +        if oe.types.qemu_use_kvm(self.td.get('QEMU_USE_KVM', 0), self.td["TARGET_ARCH"]):
> > +            cmd += " kvm"
> > +
> > +        self.write_config("""
> > +# efi firmware must load systemd-boot, not grub
> > +EFI_PROVIDER = "systemd-boot"
> > +
> > +# image format must be wic, needs esp partition for firmware etc
> > +IMAGE_FSTYPES:pn-%s:append = " wic"
> > +WKS_FILE = "efi-uki-bootdisk.wks.in"
> > +
> > +# efi, uki and systemd features must be enabled
> > +INIT_MANAGER = "systemd"
> > +MACHINE_FEATURES:append = " efi"
> > +DISTRO_FEATURES:append = " uki"
> > +DISTRO_FEATURES:append = " systemd"
> > +DISTRO_FEATURES_NATIVE:append = " systemd"
> > +IMAGE_CLASSES:append:pn-core-image-minimal = " uki"
> > +
> > +# uki embeds also an initrd
> > +INITRAMFS_IMAGE = "core-image-minimal-initramfs"
> > +
> > +# runqemu must not load kernel separately, it's in the uki
> > +QB_KERNEL_ROOT = ""
> > +QB_DEFAULT_KERNEL = "none"
> > +
> > +# boot command line provided via uki, not via bootloader
> > +UKI_CMDLINE = "rootwait root=LABEL=root console=${KERNEL_CONSOLE}"
> > +""" % (image))
> > +
> > +        uki_filename = get_bb_var('UKI_FILENAME', image)
> > +
> > +        bitbake(image + " ovmf")
> > +        with runqemu(image, ssh=False, launch_cmd=cmd) as qemu:
> > +            self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
> > +
> > +            # Verify from efivars that firmware was:
> > +            # x86_64, qemux86_64 = edk2
> > +            # arm,  = u-boot
> > +            cmd = "echo $( cat /sys/firmware/efi/efivars/LoaderFirmwareInfo-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f ) | grep 'EDK II'"
> > +            status, output = qemu.run_serial(cmd)
> > +            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
> > +
> > +            # Check that systemd-boot was the loader
> > +            cmd = "echo $( cat /sys/firmware/efi/efivars/LoaderInfo-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f ) | grep systemd-boot"
> > +            status, output = qemu.run_serial(cmd)
> > +            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
> > +
> > +            # Check that systemd-stub was used
> > +            cmd = "echo $( cat /sys/firmware/efi/efivars/StubInfo-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f ) | grep systemd-stub"
> > +            status, output = qemu.run_serial(cmd)
> > +            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
> > +
> > +            # Check that the compiled uki file was booted into
> > +            cmd = "echo $( cat /sys/firmware/efi/efivars/LoaderEntrySelected-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f ) | grep '%s'" % (uki_filename)
> > +            status, output = qemu.run_serial(cmd)
> > +            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
> > +
> > +    @skipIfNotArch(['i586', 'i686', 'x86_64'])
> > +    @OETestTag("runqemu")
> > +    def test_uki_sysvinit(self):
> > +        """Build and boot into UEFI firmware (omvf/edk2), systemd-boot, initrd with sysvinit, rootfs with sysvinit"""
> > +        config = """
> > +# efi firmware must load systemd-boot, not grub
> > +EFI_PROVIDER = "systemd-boot"
> > +
> > +# image format must be wic, needs esp partition for firmware etc
> > +IMAGE_FSTYPES:pn-core-image-base:append = " wic"
> > +WKS_FILE = "efi-uki-bootdisk.wks.in"
> > +
> > +# efi, uki and systemd features must be enabled
> > +MACHINE_FEATURES:append = " efi"
> > +DISTRO_FEATURES_NATIVE:append = " systemd"
> > +IMAGE_CLASSES:append:pn-core-image-base = " uki"
> > +
> > +# uki embeds also an initrd, no systemd or udev
> > +INITRAMFS_IMAGE = "core-image-initramfs-boot"
> > +
> > +# runqemu must not load kernel separately, it's in the uki
> > +QB_KERNEL_ROOT = ""
> > +QB_DEFAULT_KERNEL = "none"
> > +
> > +# boot command line provided via uki, not via bootloader
> > +UKI_CMDLINE = "rootwait root=LABEL=root console=${KERNEL_CONSOLE}"
> > +
> > +"""
> > +        self.append_config(config)
> > +        bitbake('core-image-base ovmf')
> > +        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', 'core-image-base') or ""
> > +        uki_filename = get_bb_var('UKI_FILENAME', 'core-image-base')
> > +        self.remove_config(config)
> > +
> > +        with runqemu('core-image-base', ssh=False,
> > +                     runqemuparams='%s slirp nographic ovmf' % (runqemu_params), image_fstype='wic') as qemu:
> > +            # Verify from efivars that firmware was:
> > +            # x86_64, qemux86_64 = edk2
> > +            # arm,  = u-boot
> > +            cmd = "echo $( cat /sys/firmware/efi/efivars/LoaderFirmwareInfo-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f ) | grep 'EDK II'"
> > +            status, output = qemu.run_serial(cmd)
> > +            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
> > +
> > +            # Check that systemd-boot was the loader
> > +            cmd = "echo $( cat /sys/firmware/efi/efivars/LoaderInfo-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f ) | grep systemd-boot"
> > +            status, output = qemu.run_serial(cmd)
> > +            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
> > +
> > +            # Check that systemd-stub was used
> > +            cmd = "echo $( cat /sys/firmware/efi/efivars/StubInfo-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f ) | grep systemd-stub"
> > +            status, output = qemu.run_serial(cmd)
> > +            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
> > +
> > +            # Check that the compiled uki file was booted into
> > +            cmd = "echo $( cat /sys/firmware/efi/efivars/LoaderEntrySelected-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f ) | grep '%s'" % (uki_filename)
> > +            status, output = qemu.run_serial(cmd)
> > +            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
> > diff --git a/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in b/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in
> > new file mode 100644
> > index 0000000000..1ea9c8a845
> > --- /dev/null
> > +++ b/scripts/lib/wic/canned-wks/efi-uki-bootdisk.wks.in
> > @@ -0,0 +1,3 @@
> > +bootloader --ptable gpt --timeout=5
> > +part /boot --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --label boot --active --align 1024 --use-uuid --part-name="ESP" --part-type=C12A7328-F81F-11D2-BA4B-00A0C93EC93B --fixed-size 512M
> > +part / --source rootfs --fstype=ext4 --label root --align 1024 --exclude-path boot/
> > --
> > 2.34.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#204780): https://lists.openembedded.org/g/openembedded-core/message/204780
> > Mute This Topic: https://lists.openembedded.org/mt/108587934/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

