Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id B8DCF7E64C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 18:42:06 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id 94so4936318uam.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 11:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=URXxT7Bh8Lc+PESNm3NyotbMDTOhCJtarR4fe3Lzhng=;
	b=Ay+iEsuyWvr3ycXwleveZfVfqW5Nwe0+rdLgGYlMZ7GSJ9WmqzqdtnrLUwXAhn4KR9
	DijwkmC6Z5aF52xV693twmJE94V30jB4WUaYDDx+6ZO3MLDr45hxzfRUgwgFE8l/X25g
	SQ/E2D0XhGlhE4nklpYz8ffSgyeIQL12g18hdawOnOG4p3GHfQDgZ3ow/QTtpZkuxAYk
	ES9GHdNXhrGvUZKdKNcnSXh4hi6y94d1TCSP3riufW1F5wSGnEeeORpvaKLRsfZvOhHF
	JvMPPdb9u8it4IBYSTZe4TfZsWshT6UC/ZVi7xOSZ2FTP3brA1doDjipnLTsdLIrlXYb
	aSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=URXxT7Bh8Lc+PESNm3NyotbMDTOhCJtarR4fe3Lzhng=;
	b=nCqUwh+2t01xZ/NTNOtuz8bRvAk5CDSlz5seRnz4uzHhkxysKwFg9r9DYQRBlOYl4K
	rlGGXIgrc8kzEQG9Rq1Xnv3E5L5ol+6lo8N5Y/Q3y9DgpbCTg8CxtOEU3qldlihqleOg
	6kIZtW5ShG3p771tbg4u+vJ18b4LLYB4lagsgtvQ14D6BmR2rKIVBimvb0ytPL0s4Eyp
	VIKhHDnEPaVy+rdZbJ+qnrWFjtzx/7cStXvL6WF1TcZVJkfd+ZCXkP6dd+p4hWbGC+7Z
	TOIuUwC7v5QEypniBWCK8f1W1UXqWz8DM4dHxP0aZZvOPKhpy1M52slYkbCtHeEHdN+p
	A3VA==
X-Gm-Message-State: APjAAAWRjqRonDXCyTdifkSdkHoCWHF0CQX4yJff66rFxujJQ2cMcZZ4
	NkXQrY6jiqCjtgDPiIfaE+JOQGyyVeO5lMbGG0M=
X-Google-Smtp-Source: APXvYqy0Gg6Ncg/xVqE/Ylewj6AhQGh5t0PiSox0IrDTeqTNXOcn50CqusMx6RuQSuoHXULdv7Hz1ZdVd3j5jfFFnh4=
X-Received: by 2002:ab0:7442:: with SMTP id p2mr25945753uaq.92.1560278527440; 
	Tue, 11 Jun 2019 11:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <1560234697-27013-1-git-send-email-chee.yang.lee@intel.com>
In-Reply-To: <1560234697-27013-1-git-send-email-chee.yang.lee@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 11 Jun 2019 11:41:55 -0700
Message-ID: <CAJ86T=Vz+mUmxGFnVPW=9tdA8WNNA+sDxz9tpN=3DC7DTu0P9Q@mail.gmail.com>
To: chee.yang.lee@intel.com
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic/plugins: kernel image refer to KERNEL_IMAGETYPE
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
X-List-Received-Date: Tue, 11 Jun 2019 18:42:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 10, 2019 at 11:31 PM <chee.yang.lee@intel.com> wrote:
> From: Chee Yang Lee <chee.yang.lee@intel.com>
>
> replaced hardcoded kernel image with KERNEL_IMAGETYPE.
> set kernel image to "bzImage" incase KERNEL_IMAGETYPE not set.

A default value for KERNEL_IMAGETYPE is set by default-distrovars.inc,
so if it's not set here then something is mis-configured. Better to
exit with an error in that case rather than try to carry on.

> Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> ---
>  scripts/lib/wic/plugins/source/bootimg-efi.py       | 21 +++++++++++++++------
>  scripts/lib/wic/plugins/source/bootimg-pcbios.py    |  8 ++++++--
>  .../lib/wic/plugins/source/isoimage-isohybrid.py    | 21 ++++++++++++++-------
>  3 files changed, 35 insertions(+), 15 deletions(-)
>
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
> index 70cc1b0..d87db1f 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -71,14 +71,16 @@ class BootimgEFIPlugin(SourcePlugin):
>              grubefi_conf += "timeout=%s\n" % bootloader.timeout
>              grubefi_conf += "menuentry '%s'{\n" % (title if title else "boot")
>
> -            kernel = "/bzImage"
> +            kernel = get_bitbake_var("KERNEL_IMAGETYPE")
> +            if not kernel:
> +                kernel = "bzImage"
>
>              label = source_params.get('label')
>              label_conf = "root=%s" % creator.rootdev
>              if label:
>                  label_conf = "LABEL=%s" % label
>
> -            grubefi_conf += "linux %s %s rootwait %s\n" \
> +            grubefi_conf += "linux /%s %s rootwait %s\n" \
>                  % (kernel, label_conf, bootloader.append)
>
>              if initrd:
> @@ -143,12 +145,15 @@ class BootimgEFIPlugin(SourcePlugin):
>
>          if not custom_cfg:
>              # Create systemd-boot configuration using parameters from wks file
> -            kernel = "/bzImage"
> +            kernel = get_bitbake_var("KERNEL_IMAGETYPE")
> +            if not kernel:
> +                kernel = "bzImage"
> +
>              title = source_params.get('title')
>
>              boot_conf = ""
>              boot_conf += "title %s\n" % (title if title else "boot")
> -            boot_conf += "linux %s\n" % kernel
> +            boot_conf += "linux /%s\n" % kernel
>
>              label = source_params.get('label')
>              label_conf = "LABEL=Boot root=%s" % creator.rootdev
> @@ -209,8 +214,12 @@ class BootimgEFIPlugin(SourcePlugin):
>
>          hdddir = "%s/hdd/boot" % cr_workdir
>
> -        install_cmd = "install -m 0644 %s/bzImage %s/bzImage" % \
> -            (staging_kernel_dir, hdddir)
> +        kernel = get_bitbake_var("KERNEL_IMAGETYPE")
> +        if not kernel:
> +            kernel = "bzImage"
> +
> +        install_cmd = "install -m 0644 %s/%s %s/%s" % \
> +            (staging_kernel_dir, kernel, hdddir, kernel)
>          exec_cmd(install_cmd)
>
>
> diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
> index 6c9f54a..670d347 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
> @@ -149,8 +149,12 @@ class BootimgPcbiosPlugin(SourcePlugin):
>
>          hdddir = "%s/hdd/boot" % cr_workdir
>
> -        cmds = ("install -m 0644 %s/bzImage %s/vmlinuz" %
> -                (staging_kernel_dir, hdddir),
> +        kernel = get_bitbake_var("KERNEL_IMAGETYPE")
> +        if not kernel:
> +            kernel = "bzImage"
> +
> +        cmds = ("install -m 0644 %s/%s %s/vmlinuz" %
> +                (staging_kernel_dir, kernel, hdddir),
>                  "install -m 444 %s/syslinux/ldlinux.sys %s/ldlinux.sys" %
>                  (bootimg_dir, hdddir),
>                  "install -m 0644 %s/syslinux/vesamenu.c32 %s/vesamenu.c32" %
> diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> index 96d07ff..74d6f14 100644
> --- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> +++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> @@ -70,8 +70,10 @@ class IsoImagePlugin(SourcePlugin):
>          syslinux_conf += "DEFAULT boot\n"
>          syslinux_conf += "LABEL boot\n"
>
> -        kernel = "/bzImage"
> -        syslinux_conf += "KERNEL " + kernel + "\n"
> +        kernel = get_bitbake_var("KERNEL_IMAGETYPE")
> +        if not kernel:
> +            kernel = "bzImage"
> +        syslinux_conf += "KERNEL /" + kernel + "\n"
>          syslinux_conf += "APPEND initrd=/initrd LABEL=boot %s\n" \
>                               % bootloader.append
>
> @@ -114,9 +116,11 @@ class IsoImagePlugin(SourcePlugin):
>              grubefi_conf += "\n"
>              grubefi_conf += "menuentry 'boot'{\n"
>
> -            kernel = "/bzImage"
> +            kernel = get_bitbake_var("KERNEL_IMAGETYPE")
> +            if not kernel:
> +                kernel = "bzImage"
>
> -            grubefi_conf += "linux %s rootwait %s\n" \
> +            grubefi_conf += "linux /%s rootwait %s\n" \
>                              % (kernel, bootloader.append)
>              grubefi_conf += "initrd /initrd \n"
>              grubefi_conf += "}\n"
> @@ -268,9 +272,12 @@ class IsoImagePlugin(SourcePlugin):
>          if os.path.isfile("%s/initrd.cpio.gz" % cr_workdir):
>              os.remove("%s/initrd.cpio.gz" % cr_workdir)
>
> -        # Install bzImage
> -        install_cmd = "install -m 0644 %s/bzImage %s/bzImage" % \
> -                      (kernel_dir, isodir)
> +        kernel = get_bitbake_var("KERNEL_IMAGETYPE")
> +        if not kernel:
> +            kernel = "bzImage"
> +
> +        install_cmd = "install -m 0644 %s/%s %s/%s" % \
> +                      (kernel_dir, kernel, isodir, kernel)
>          exec_cmd(install_cmd)
>
>          #Create bootloader for efi boot
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

