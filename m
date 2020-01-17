Return-Path: <maxim.uvarov@linaro.org>
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
	[209.85.219.175])
	by mail.openembedded.org (Postfix) with ESMTP id 283386B07F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 09:49:50 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id q190so5911186ybq.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 01:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=0Qw6s+my5NkXMUbTelS9oayO/MOJCUPCCVT0TXEQRh8=;
	b=EhFF7YnVPcpZTJyej+rh0wnqF9QlFJ0HAlfQmql10O288MwHPChcTf38TmRzkVgw9o
	ijLFk8eFT8Geyj+McGV9fpuAq9jMLx6/Jgn6pzWA+fPG/Ga7xhOcesrLnAoYZg1KUqrP
	S6cTG2zazk7Bv7v85PFm2S85RJ5VH24hh8uDFgJpbiTloqJZU5XS37/JCPJHwfK6+kG5
	98SvWG7SFOrMuzLb+kfcVdwxyR3YO9P8wyOrVZlLNanvlCROHz+676numu+UetXNRqww
	rGVlD84J8549kzv0tzGMkTFA/4zM7Sz1QWpcfCiPRMw4o8r+7srd78qMJMJgyS+R8o7R
	noow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=0Qw6s+my5NkXMUbTelS9oayO/MOJCUPCCVT0TXEQRh8=;
	b=Az1S5Z1V5+BnNjwx5jgnZdrAh9HSgtOgigdu7XrRirK2CuLXQ2wkCGoxiiANmXf4I7
	kfL9bHD+seXdiPc0kjMNL4sfUhkAOOIEtr25QzYvP9XWQ1LS/w2wzm+zb/gQHUn49Zw/
	dTgL2BJz7+3zxz00qneWX5NWNKjKvIuUnrjKEz3qZhe9+qk8+/2Lf1B4NWrZmPAkS+Dh
	XzFrJ+BMdIScwYM2FyDRFOAkl0QtACGDdZXb6RtiYRzM44O56LuPE6byVeMI4w6TQnaE
	t32q+e/vMXWVUPMcqzdwsaTp4/q/LedaNEQbO1v/f7iEQvE5EO1cMYSsUYw0FiolZN3X
	kIyw==
X-Gm-Message-State: APjAAAVFy1QFBFHaxRa/EdgvHqnZ+U/moPKZ59FMqNWdRQX9KbGLnr1x
	yTlRuCElYamZswqwjEBpdP8DtCUQpbuEnCUnBqlEuSr0
X-Google-Smtp-Source: APXvYqzrPbczWM6KGGrKH33+ZA7Zfrsj/8ibeW52mqt0lyxVbf+2hoE7Y+qsiH4SWZAS6sDCWWqu68E0pNe735BYqvs=
X-Received: by 2002:a25:7601:: with SMTP id r1mr26185798ybc.187.1579254591677; 
	Fri, 17 Jan 2020 01:49:51 -0800 (PST)
MIME-Version: 1.0
References: <20200113201438.4640-1-maxim.uvarov@linaro.org>
In-Reply-To: <20200113201438.4640-1-maxim.uvarov@linaro.org>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Fri, 17 Jan 2020 12:49:40 +0300
Message-ID: <CAD8XO3bejNi55v9OZK4bd2M91FErmhE_US-VbVz9omGvegpbXg@mail.gmail.com>
To: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] wic: add UEFI kernel as UEFI stub
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
X-List-Received-Date: Fri, 17 Jan 2020 09:49:51 -0000
Content-Type: text/plain; charset="UTF-8"

ping.

On Mon, 13 Jan 2020 at 23:14, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> Linux kernel can be compiled as UEFI stub and loaded directly
> with UEFI firmware without grub or other UEFI shell.
>
> Tested with wic file:
> bootloader  --ptable gpt --timeout=0  --append="rootwait"
> part /boot --source bootimg-efi --sourceparams="loader=uefi-kernel" \
>  --ondisk sda  --fstype=vfat --label bootfs \
>   --active --align 1024 --use-uuid
> part / --source rootfs --fstype=ext4 --label rootfs \
>   --align 1024 --exclude-path boot/ --use-label
> The same wic file for armv7, armv8 and x86_64.
>
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> ---
>  v2: - use loader=uefi-kernel.
>      - remove missed from debug WicError().
>      - correct error message.
>
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
> index 2cfdc10ecd..8d47ea55eb 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -13,6 +13,7 @@
>  import logging
>  import os
>  import shutil
> +import re
>
>  from wic import WicError
>  from wic.engine import get_custom_config
> @@ -204,6 +205,8 @@ class BootimgEFIPlugin(SourcePlugin):
>                  cls.do_configure_grubefi(hdddir, creator, cr_workdir, source_params)
>              elif source_params['loader'] == 'systemd-boot':
>                  cls.do_configure_systemdboot(hdddir, creator, cr_workdir, source_params)
> +            elif source_params['loader'] == 'uefi-kernel':
> +                return
>              else:
>                  raise WicError("unrecognized bootimg-efi loader: %s" % source_params['loader'])
>          except KeyError:
> @@ -252,6 +255,28 @@ class BootimgEFIPlugin(SourcePlugin):
>                  for mod in [x for x in os.listdir(kernel_dir) if x.startswith("systemd-")]:
>                      cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[8:])
>                      exec_cmd(cp_cmd, True)
> +            elif source_params['loader'] == 'uefi-kernel':
> +                kernel = get_bitbake_var("KERNEL_IMAGETYPE")
> +                if not kernel:
> +                    raise WicError("Empty KERNEL_IMAGETYPE %s\n" % target)
> +                target = get_bitbake_var("TARGET_SYS")
> +                if not target:
> +                    raise WicError("Unknown arch (TARGET_SYS) %s\n" % target)
> +
> +                if re.match("x86_64", target):
> +                    kernel_efi_image = "bootx64.efi"
> +                elif re.match('i.86', target):
> +                    kernel_efi_image = "bootia32.efi"
> +                elif re.match('aarch64', target):
> +                    kernel_efi_image = "bootaa64.efi"
> +                elif re.match('arm', target):
> +                    kernel_efi_image = "bootarm.efi"
> +                else:
> +                    raise WicError("UEFI stub kernel is incompatible with target %s" % target)
> +
> +                for mod in [x for x in os.listdir(kernel_dir) if x.startswith(kernel)]:
> +                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, kernel_efi_image)
> +                    exec_cmd(cp_cmd, True)
>              else:
>                  raise WicError("unrecognized bootimg-efi loader: %s" %
>                                 source_params['loader'])
> --
> 2.17.1
>

