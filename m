Received: from mail.klausen.dk (mail.klausen.dk [157.90.24.29])
 by mx.groups.io with SMTP id smtpd.web12.3394.1631212529554354119
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 11:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@klausen.dk header.s=dkim header.b=rzfW4thY;
 spf=pass (domain: klausen.dk, ip: 157.90.24.29, mailfrom: kristian@klausen.dk)
Date: Thu, 9 Sep 2021 20:35:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
	t=1631212526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RUwsf8pvtCkUuaE6D3zNuCDlc5MEfPZ6GlZeymiG+hU=;
	b=rzfW4thYPKRn9rzjMKn6BQ/BpAJrMn/gmw1+b6J/GWiBVkRj9WoY4Ic7I7UTaaGTE3IypB
	IJP974JXRvKPQK+X8wp7Xe5l1ynPa6lPDniCpAX17bvWubv2ckvo1MK77voWGyYpM45/DQ
	E8WVqShHRs2H4Sb3OqSwkRxuoyZZjU4=
From: "Kristian Klausen" <kristian@klausen.dk>
To: openembedded-core@lists.openembedded.org
Cc: Kristian Klausen <kristian@klausen.dk>
Subject: Re: [PATCH] wic/bootimg-efi: Add option for only installing the bootloader
Message-ID: <20210909183524.k3kdqyfct6c4x6ru@bob>
References: <20210908103604.222498-1-kristian@klausen.dk>
MIME-Version: 1.0
In-Reply-To: <20210908103604.222498-1-kristian@klausen.dk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 08, 2021 at 12:36:04PM +0200, Kristian Klausen wrote:
> systemd-boot supports automatic detection of Unified Kernel Images[1] if
> the are installed into $BOOT/EFI/Linux/ with a .efi extension. In that
> case a boot entry isn't needed nor is the normal kernel as the Unified
> Kernel Image would likely be installed with IMAGE_EFI_BOOT_FILES.
> 
> [1] https://systemd.io/BOOT_LOADER_SPECIFICATION/#type-2-efi-unified-kernel-images

This patch is no longer needed for using a Unified Kernel Image with
systemd-boot with this new patch I sent:
"[PATCH] wic/bootimg-efi: Add Unified Kernel Image option"[1]

It is perhaps still useful tho.

[1] https://lists.openembedded.org/g/openembedded-core/topic/patch_wic_bootimg_efi_add/85490739

> 
> Signed-off-by: Kristian Klausen <kristian@klausen.dk>
> ---
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
> index cdc72543c2..f8aace823d 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -38,6 +38,9 @@ class BootimgEFIPlugin(SourcePlugin):
>          """
>          Create loader-specific (grub-efi) config
>          """
> +        if source_params.get('bootloader-only') == "true":
> +            return
> +
>          configfile = creator.ks.bootloader.configfile
>          custom_cfg = None
>          if configfile:
> @@ -110,6 +113,9 @@ class BootimgEFIPlugin(SourcePlugin):
>          """
>          Create loader-specific systemd-boot/gummiboot config
>          """
> +        if source_params.get('bootloader-only') == "true":
> +            return
> +
>          install_cmd = "install -d %s/loader" % hdddir
>          exec_cmd(install_cmd)
>  
> @@ -288,9 +294,10 @@ class BootimgEFIPlugin(SourcePlugin):
>                  kernel = "%s-%s.bin" % \
>                      (get_bitbake_var("KERNEL_IMAGETYPE"), get_bitbake_var("INITRAMFS_LINK_NAME"))
>  
> -        install_cmd = "install -m 0644 %s/%s %s/%s" % \
> -            (staging_kernel_dir, kernel, hdddir, kernel)
> -        exec_cmd(install_cmd)
> +        if not source_params.get('bootloader-only') == "true":
> +            install_cmd = "install -m 0644 %s/%s %s/%s" % \
> +                (staging_kernel_dir, kernel, hdddir, kernel)
> +            exec_cmd(install_cmd)
>  
>          if get_bitbake_var("IMAGE_EFI_BOOT_FILES"):
>              for src_path, dst_path in cls.install_task:
> -- 
> 2.25.1
> 
