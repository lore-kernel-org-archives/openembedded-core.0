Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 801EF7EB0F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 21:12:41 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id d23so5808577qko.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 14:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=o0JLbe5AaLwpHCeYQsMfwQBPA7YfbWSAhXCkDuCfDI0=;
	b=CAeuv2Co/XONXxQSQ2iY22pgPEcgbJtcaRoXYEjViBewktDBQmUhtnzqHoMoe4TOf6
	aeBVja/h5hqikjvkH1UwCWom/EXxGeShc8/Rzp+OyAnGouT0lmPV7d02Yu6E/A+5RU3A
	RJ0pLiW3tmQkddg2cTqvchP+5vGOLSKpF8s50LAMClrM5PAAVNc7ygqBExyejnrvK5FN
	CgazFEmNnMPoOYkMFy7v3THXTzh4V1qatgEgifMzbwTt0edwS0d2cPsZG+O+MzoJ22Pt
	LUMmAUKGMDjfNWt3WMyUJQur2lSP+hPhUNP0sSZ2lXBcCZSOCxpPe8avaDAORpZUdvsN
	9q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o0JLbe5AaLwpHCeYQsMfwQBPA7YfbWSAhXCkDuCfDI0=;
	b=hAcABz8JG2AXlw4G52vAhaPOyTz44Jq4ZDIamXelOVVm7fAXV8f4WMoK09UBBUsoKn
	WR39SIbvnNdHonjFdIWdk6sNb4nJNd74lknhnZHo70AlDHwQFJKW9fWcuu8NF22ZGU9a
	ty0I1+S3kRz2crjiI1uz5fxINKqAHVx/+FofEjKlYQZ76cvLmYkgGs+8M8d7HljxIt5I
	KY0pTiHpr9zK0a+8ark9yUtuMhN30yv3S8r0fB+Vg5h8vL1sqXN7YA3seAjOtYHIRmZz
	1aFmU8op8qZnOjn62mKHJxJBEIErYmhP3h+65EgO5JfzseVr9pGpC47PP5Xv8aybhOf/
	E5sw==
X-Gm-Message-State: APjAAAUbPfR/WCl1R5GigibhHcHsWZfwxu8Yr4Vma3DYhQisLTUdAB66
	HGwNo8dDSSi1uLaPuoOUeBUeM/7u52Rusq+o0j4=
X-Google-Smtp-Source: APXvYqzC+eVZKS1TW4VNfQMoFqk5gzTMw83aCvAZhLk8htGzAj4i1tCGydQkYG+VYaT7yzezQNhgwciERXCUIGi+0qQ=
X-Received: by 2002:a37:a20f:: with SMTP id l15mr28663725qke.212.1566335561792;
	Tue, 20 Aug 2019 14:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190820205917.21297-1-alistair.francis@wdc.com>
	<20190820205917.21297-3-alistair.francis@wdc.com>
In-Reply-To: <20190820205917.21297-3-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Aug 2019 14:12:15 -0700
Message-ID: <CAMKF1sr=QRRJ=8_0=G7PJ3+HWDUAv2k_YtJar_GQjy=ai0ciig@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 3/3] qemuriscv64: Specify the firmware as a bios instead of kernel
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
X-List-Received-Date: Tue, 20 Aug 2019 21:12:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 20, 2019 at 2:03 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Now that we have a -bios option for the RISC-V virt machine in QEMU we
> can pass OpenSBI in via -bios and the kernel in via -kernel. We no
> longer need to pass the kernel in via -device loader so let's remove
> that.
>

have you tried running bitbake -ctestimage with this change ?

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> v2:
>  - Improve the commit message
>
>  meta/conf/machine/include/riscv/qemuriscv.inc | 2 +-
>  meta/conf/machine/qemuriscv64.conf            | 2 --
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
> index 797a27660d..2ebd0a01f2 100644
> --- a/meta/conf/machine/include/riscv/qemuriscv.inc
> +++ b/meta/conf/machine/include/riscv/qemuriscv.inc
> @@ -28,7 +28,7 @@ UBOOT_ENTRYPOINT_riscv64 = "0x80200000"
>  QB_KERNEL_CMDLINE_APPEND = "earlycon=sbi"
>  QB_MEM = "-m 512"
>  QB_MACHINE = "-machine virt"
> -QB_DEFAULT_KERNEL = "fw_jump.elf"
> +QB_DEFAULT_BIOS = "fw_jump.elf"
>  QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
>  QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
>  QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
> diff --git a/meta/conf/machine/qemuriscv64.conf b/meta/conf/machine/qemuriscv64.conf
> index dba8f09e93..99b48b309b 100644
> --- a/meta/conf/machine/qemuriscv64.conf
> +++ b/meta/conf/machine/qemuriscv64.conf
> @@ -4,8 +4,6 @@
>
>  require conf/machine/include/riscv/qemuriscv.inc
>
> -QB_OPT_APPEND += "-show-cursor -monitor null -device loader,file=${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE},addr=0x80200000"
> -
>  EXTRA_IMAGEDEPENDS += "u-boot"
>  UBOOT_MACHINE = "qemu-riscv64_defconfig"
>  UBOOT_ELF = "u-boot"
> --
> 2.22.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

