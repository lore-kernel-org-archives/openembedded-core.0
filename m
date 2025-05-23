Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7E4C3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 09:42:39 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.44379.1747993354230328695
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 02:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nUytYP15;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-550eb498fbbso8525905e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 02:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747993352; x=1748598152; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MZAXUmx64QevPJ9fle/C+c6yP3kFNID4tBgzCvzQIlI=;
        b=nUytYP15S7k0uaUfoDMnOEi/aUHhtCF+D71cCuBmrV+ZcgzH9HbgdlHqiHRu9IelCC
         QClYx+983BedmF51wNLThS9laA7ECVri6ACcqtSHLXf69UIOB5wGzwn3PeGdKiXF8SFM
         V1ZjkzlrNfgpwt6IOGJtYNJCdj+MW5Ot238b9JrVZ0bo37iiIWISdnTTwcojw9ZLzsAC
         fSuPphDV5pjVQXH8Me+Hdf/AkLTU3+b6+F8DJxtwomp6UTOOe9+5dJMaa4pQIswLu2y1
         tCqDegKqJCX+N5R1tVeosCqNxGOraHfZ/6kZIDXDfsmfuygAq7qYfYmMPisYXOzBjHr3
         8Lcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747993352; x=1748598152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZAXUmx64QevPJ9fle/C+c6yP3kFNID4tBgzCvzQIlI=;
        b=lbD7EI5YQgubgNK6+fcd5vbXzTLoFD+1yH1PYipVPOjyhfUP1NM1HOFKAwaQURigbs
         Jb3a8l7m4RIvS7qNi/gQfxmhIBUgrtQq2c3LQWiMUMEU6mc6NUWcQec5cgp1lkv7K60p
         J6G8trbaMau6nkDuPwH2raKPXaT/2Ny660PXlLXAl1//8xWPrhmOFPVWjz8jtPLadb4b
         AfFm4Dd7dXWaiUP+j3YxQKLMB6oI92EZH4ZwAoIecZoXU2f1n+sQtJSqG9RMeV3u44Cn
         xgmMZrQPoQLNr0KvVC37gYLpyKHISonrgK/XBqfgSn3cRlHhM7Z5hV9yA4pIqcabCmas
         J57A==
X-Gm-Message-State: AOJu0Yy7k/pK2lSjL7rv9s3yq33mGoRo0ZQrEsjuYAMyj0yyVUI65TQM
	nBGLo0NBpDP9A9ZH4u9NR4Ved9d765BBWxdmGOJ2kgrV7mTqlfTIw6OPmgPfSl6jIUt2nthRYbr
	KNgW3iF0=
X-Gm-Gg: ASbGncuWyhbs2mbbEE+npzU2mFyNDMXa7jT4kdlhf5l7d6U8b+UChtVfsXQcjZfgBa4
	h63kz88fFtxKugq2j8Gz2skdYbjbuflEE+Dt1AWOwIqeGkgObdrz+2mfitIHHWx2SaHNIv/0OlE
	JsnKR2vXRYDaKWpYZZGd6FZjJ7OIeMc9YJZW+MDK0J6l07OBkdW7ztLvWsEWkDSdzDcitojzaN9
	v33INHCJJgglm+QwHaVt1iKx+Yf4jMW75RjLCDeaJcawjr0/WEyhb+Ggzy9UFjdYpL3jTW5klJa
	hOpgN+UAuYPFkwhqU6BZIiJVFhZW4Oc6Nmygy1+J5h/17wdPprJvmG9kxO3HNrX/aRh4eOdPD74
	z3Wz9CZHSFfXd1gs=
X-Google-Smtp-Source: AGHT+IGJW3v3EPNNGaLpedQoZTYCiebFDPRITzcMRkhMFPt+1/ilssWaStXRZFFwmL6Ix0JUR0dN0g==
X-Received: by 2002:a05:6512:40c7:b0:552:12f7:2cee with SMTP id 2adb3069b0e04-55212f73459mr1177679e87.2.1747993352039;
        Fri, 23 May 2025 02:42:32 -0700 (PDT)
Received: from nuoska (2001-14ba-48e-3a00--183.rev.dnainternet.fi. [2001:14ba:48e:3a00::183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f30329sm3790634e87.65.2025.05.23.02.42.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 02:42:31 -0700 (PDT)
Date: Fri, 23 May 2025 12:42:30 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/3] oeqa selftest uboot.py: add qemu KVM test
 case
Message-ID: <aDBDBgkopuFquYBZ@nuoska>
References: <20250522134116.254270-1-mikko.rapeli@linaro.org>
 <1841DD2A7A0AA7E1.3062@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1841DD2A7A0AA7E1.3062@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 09:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217202

Hi,

On Thu, May 22, 2025 at 04:41:16PM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> Add a test case to boot target system via u-boot
> using qemu with KVM. This was broken recently
> and workaround proposed to u-boot. Test case
> works with genericarm64 and qemuarm64 target machines
> compiled and tested on aarch64 build host with KVM
> support.
> 
> Test execution time with full sstate cache is
> around 170 seconds. qemu boot itself takes just
> a few seconds to full userspace.
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/lib/oeqa/selftest/cases/uboot.py | 55 ++++++++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/uboot.py b/meta/lib/oeqa/selftest/cases/uboot.py
> index 39e48f8bdb..982822b389 100644
> --- a/meta/lib/oeqa/selftest/cases/uboot.py
> +++ b/meta/lib/oeqa/selftest/cases/uboot.py
> @@ -6,8 +6,8 @@
>  #
>  
>  from oeqa.selftest.case import OESelftestTestCase
> -from oeqa.utils.commands import bitbake, runqemu, get_bb_var
> -from oeqa.core.decorator.data import skipIfNotArch
> +from oeqa.utils.commands import bitbake, runqemu, get_bb_var, runCmd
> +from oeqa.core.decorator.data import skipIfNotArch, skipIfNotMachine
>  from oeqa.core.decorator import OETestTag
>  
>  uboot_boot_patterns = {
> @@ -42,3 +42,54 @@ QEMU_USE_KVM = "False"
>              status, output = qemu.run_serial(cmd)
>              self.assertEqual(status, 1, msg=output)
>              self.assertTrue("U-Boot" in output, msg=output)
> +
> +    @skipIfNotArch(['aarch64'])
> +    # Also works on genericarm64 but no way to encode that currently
> +    @skipIfNotMachine('qemuarm64', 'KVM depends that host and target architectures match, e.g. aarch64 and qemuarm64')

On second thought, these are not quite right. I think HOST_ARCH limit
to "aarch64" is ok but will still cause this to run on x86_64 build machines
which will not work. I think I need to add a BUILD_ARCH decorator to limit this to
run on 'aarch64' build host when building 'aarch64' targets. Then
KVM can work.

I'll update the changes.

Cheers,

-Mikko

> +    @OETestTag("runqemu")
> +    def test_boot_uboot_kvm_to_full_target(self):
> +        """
> +        Tests building u-boot and booting it with QEMU and KVM.
> +        Requires working KVM on build host. See "kvm-ok" output.
> +        """
> +
> +        runCmd("kvm-ok")
> +
> +        self.write_config("""
> +QEMU_USE_KVM = "1"
> +
> +# Using u-boot in EFI mode, need ESP partition for grub/systemd-boot/kernel etc
> +IMAGE_FSTYPES:pn-core-image-minimal:append = " wic"
> +
> +# easiest to follow genericarm64 setup with wks file, initrd and EFI loader
> +INITRAMFS_IMAGE="core-image-initramfs-boot"
> +EFI_PROVIDER = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "systemd-boot", "grub-efi", d)}"
> +WKS_FILE = "genericarm64.wks.in"
> +
> +# use wic image with ESP for u-boot, not ext4
> +QB_DEFAULT_FSTYPE = "wic"
> +
> +PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
> +QB_DEFAULT_BIOS = "u-boot.bin"
> +
> +# let u-boot or EFI loader load kernel from ESP
> +QB_DEFAULT_KERNEL = "none"
> +
> +# virt pci, not scsi because support not in u-boot to find ESP
> +QB_DRIVE_TYPE = "vd"
> +# qemu usb causes u-boot reset atm
> +QB_OPT_APPEND = ""
> +""")
> +        bitbake("virtual/bootloader core-image-minimal")
> +
> +        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', "core-image-minimal") or ""
> +        with runqemu('core-image-minimal', ssh=False, runqemuparams='nographic kvm %s' % runqemu_params) as qemu:
> +
> +            # boot to target and login worked, should have been fast with kvm
> +            cmd = "dmesg"
> +            status, output = qemu.run_serial(cmd)
> +            self.assertEqual(status, 1, msg=output)
> +            # Machine is qemu
> +            self.assertTrue("Machine model: linux,dummy-virt" in output, msg=output)
> +            # with KVM enabled
> +            self.assertTrue("KVM: hypervisor services detected" in output, msg=output)
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217107): https://lists.openembedded.org/g/openembedded-core/message/217107
> Mute This Topic: https://lists.openembedded.org/mt/113247084/7159507
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


