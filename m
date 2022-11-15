Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5FFC433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 15:46:17 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web09.7030.1668527172724538528
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 07:46:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A2nAW6Wf;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id b9so18059095ljr.5
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 07:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UyJHqmI32cx7J5r3LQR9T2yLdz8is9llRWY76Vidxio=;
        b=A2nAW6Wfejn69i9YJGJ2ZmYORURjYv4NFUzq/FDHm/4cGA9HfvbykWkvTGRM6f2jfI
         j2BVfb8fFguJmRvmJzc7Nz6q0LBtwL2ZMhTN+bWbG5mIR1tM+CdHVmrAdL0iEqGoefq1
         O1wLrf5yuoZTMXFTCPtS7WJzCeD9KZ31PXgbvSoCMUYoWYm/li9oM45rV+rA4d/vtpAc
         y+8kflc9d3iPww3JOaohrKG9OwFSpXo/yuij63ytXoxv1Csqoqv5aGUz/QCp7TUEXqxV
         vnfBn9xlgRGOwszRbAlH6TkrQuEOkmKZkMoSuHtc+O558PikF4RIAB8aZSLzwBDVlTH3
         yW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UyJHqmI32cx7J5r3LQR9T2yLdz8is9llRWY76Vidxio=;
        b=TfcgAmtMy6wSiav2hGuKH9JSdYtithxy+P/U7Jm1U5utSpo7f77qoeW7S5qsRVgYoW
         0aBpPBMOS3boH00Er7sVmaz/cBRAefAZe1SZr8SYDc3+Je3+CzgnY7mN2xITJznpFcvm
         D2rPvYjWKGP1H/DxBC6o7ALthNf5MSCBqfZ/fOjjwXnSgMZEnwAneBG39Z4rhSv13Z8G
         aBbqhcNGs8OfGuty1xncZ8zbTVX9Xw7TpIVFZQVxYZb4MsjnMLD87zqwZoRNcIPs/ovu
         X+K8P8yy+nWjJTgPZORIfhiT8TIQwgp7eEnCEQYm4Swj9xeU1liBzss/sbUgD5ybQh05
         79Fg==
X-Gm-Message-State: ANoB5plo484PBFdXU9/lM3igOlWdJGqByq5j+xJaSjtdhvOzDnc/BCy/
	IiUQYouzEeNCuKys7NDUoxwjL9P0zf8ypCpd978=
X-Google-Smtp-Source: AA0mqf7NWujJz0s81Ow0wsAyUDq9nOk9Z3IPIUO2idgH5eM2Vsy2yBNnbAxjuSg2Gbbqfs/hylpxPKzKSqiSjxIWVq0=
X-Received: by 2002:a2e:9857:0:b0:277:eba:852 with SMTP id e23-20020a2e9857000000b002770eba0852mr6576008ljj.31.1668527170776;
 Tue, 15 Nov 2022 07:46:10 -0800 (PST)
MIME-Version: 1.0
References: <20221115144031.89678-1-s.zhmylev@yadro.com>
In-Reply-To: <20221115144031.89678-1-s.zhmylev@yadro.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 15 Nov 2022 16:45:59 +0100
Message-ID: <CANNYZj8MFbwyeeQqfbvyU6ZjmgZ_Fu7VbfZWq9iS-imDp0sjkA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] wic: implement bootloader --password
To: Sergey Zhmylev <s.zhmylev@yadro.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 15:46:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173349

Wait, is the password provided through command line?

Alex

On Tue, 15 Nov 2022 at 15:40, Sergey Zhmylev <s.zhmylev@yadro.com> wrote:
>
> From: Sergei Zhmylev <s.zhmylev@yadro.com>
>
> Currently the only way to specify a password for bootloader
> is to supply a complete user-defined bootloader config file
> to the build process.  This patch introduces a --password
> paramenter in order to simplify bootloaders hardening.
>
> Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
> ---
>  scripts/lib/wic/ksparser.py                         |  1 +
>  scripts/lib/wic/plugins/source/bootimg-efi.py       |  6 +++++-
>  scripts/lib/wic/plugins/source/bootimg-pcbios.py    |  7 ++++++-
>  .../lib/wic/plugins/source/isoimage-isohybrid.py    | 13 +++++++++++--
>  4 files changed, 23 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index d1e546b12d..89bc897a5a 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -195,6 +195,7 @@ class KickStart():
>                                  default='msdos')
>          bootloader.add_argument('--timeout', type=int)
>          bootloader.add_argument('--source')
> +        bootloader.add_argument('--password')
>
>          include = subparsers.add_parser('include')
>          include.add_argument('path', type=cannedpathtype)
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
> index 4b00913a70..3d84252796 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -86,7 +86,11 @@ class BootimgEFIPlugin(SourcePlugin):
>              grubefi_conf += "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1\n"
>              grubefi_conf += "default=boot\n"
>              grubefi_conf += "timeout=%s\n" % bootloader.timeout
> -            grubefi_conf += "menuentry '%s'{\n" % (title if title else "boot")
> +            if bootloader.password:
> +                grubefi_conf += "set superusers=\"root\"\n"
> +                grubefi_conf += "export superusers\n"
> +                grubefi_conf += "password root %s\n" % (bootloader.password)
> +            grubefi_conf += "menuentry '%s' %s {\n" % (title if title else "boot", "--unrestricted" if bootloader.password else "")
>
>              kernel = get_bitbake_var("KERNEL_IMAGETYPE")
>              if get_bitbake_var("INITRAMFS_IMAGE_BUNDLE") == "1":
> diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
> index 32e47f1831..cbf4622cf9 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
> @@ -113,8 +113,13 @@ class BootimgPcbiosPlugin(SourcePlugin):
>              syslinux_conf = ""
>              syslinux_conf += "PROMPT 0\n"
>              syslinux_conf += "TIMEOUT " + str(bootloader.timeout) + "\n"
> +            if bootloader.password:
> +                syslinux_conf += "MENU MASTER PASSWD " + str(bootloader.password) + "\n"
> +                syslinux_conf += "ALLOWOPTIONS 0\n"
> +                syslinux_conf += "NOESCAPE 1\n"
> +            else:
> +                syslinux_conf += "ALLOWOPTIONS 1\n"
>              syslinux_conf += "\n"
> -            syslinux_conf += "ALLOWOPTIONS 1\n"
>              syslinux_conf += "SERIAL 0 115200\n"
>              syslinux_conf += "\n"
>              if splashline:
> diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> index 607356ad13..1d5099f954 100644
> --- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> +++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> @@ -63,8 +63,13 @@ class IsoImagePlugin(SourcePlugin):
>          syslinux_conf = ""
>          syslinux_conf += "PROMPT 0\n"
>          syslinux_conf += "TIMEOUT %s \n" % (bootloader.timeout or 10)
> +        if bootloader.password:
> +            syslinux_conf += "MENU MASTER PASSWD " + str(bootloader.password) + "\n"
> +            syslinux_conf += "ALLOWOPTIONS 0\n"
> +            syslinux_conf += "NOESCAPE 1\n"
> +        else:
> +            syslinux_conf += "ALLOWOPTIONS 1\n"
>          syslinux_conf += "\n"
> -        syslinux_conf += "ALLOWOPTIONS 1\n"
>          syslinux_conf += "SERIAL 0 115200\n"
>          syslinux_conf += "\n"
>          if splashline:
> @@ -116,10 +121,14 @@ class IsoImagePlugin(SourcePlugin):
>              grubefi_conf += "--parity=no --stop=1\n"
>              grubefi_conf += "default=boot\n"
>              grubefi_conf += "timeout=%s\n" % (bootloader.timeout or 10)
> +            if bootloader.password:
> +                grubefi_conf += "set superusers=\"root\"\n"
> +                grubefi_conf += "export superusers\n"
> +                grubefi_conf += "password root %s\n" % (bootloader.password)
>              grubefi_conf += "\n"
>              grubefi_conf += "search --set=root --label %s " % part.label
>              grubefi_conf += "\n"
> -            grubefi_conf += "menuentry 'boot'{\n"
> +            grubefi_conf += "menuentry 'boot' %s {\n" % ("--unrestricted" if bootloader.password else "")
>
>              kernel = get_bitbake_var("KERNEL_IMAGETYPE")
>              if get_bitbake_var("INITRAMFS_IMAGE_BUNDLE") == "1":
> --
> 2.37.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173346): https://lists.openembedded.org/g/openembedded-core/message/173346
> Mute This Topic: https://lists.openembedded.org/mt/95043934/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

