Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.4174.1587236536478814100
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2020 12:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=E3zYwu0q;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id g13so4949428wrb.8
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2020 12:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=0D6SL0YHe2FKQDqDJHFoWbvgb5E08nnZVnv/Ng4+jJw=;
        b=E3zYwu0qBMFkGOOX5GYZTQRuVveLaw3zsmtSwhqH71s24g8qczVuKI9Dbh4jssrAqY
         FVd59psFU5Rkn3SSQNVKa6p/DC1FCuImjRDS79fkhBYKDPXWlfI8W/DWjSpQtxsxQ+fa
         nhkZIbYjyBcgdJrnA6PHGHu8VrRXxC+Wpo6Mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=0D6SL0YHe2FKQDqDJHFoWbvgb5E08nnZVnv/Ng4+jJw=;
        b=puOBpOncfIsBoxCdIvBoUrczi+/t+6gRKdBRvCLT8AhlfY+XPcOkfZLXx+2TKjqYFY
         bTwE9m2YYjAo2CTspNjby93DFbhlfX++RO0N3D4umA+R++57J0yqBkH4ByaZ6DuoKmCR
         IB2vU+MRtNc7w/RB3DwjdtWonvCdrfFnD2VkN/D41QTWNbDPqN/ZiwAFPDTcJNRKumC3
         ATCHeYr11vS1qApsgyAxvzpLm0jsOyhS7EN32Pkw3AihyRvfaD/I7Eh2IUF/HqXQ0D7E
         fQZGcRBGE09uRuojggzPGjvXBOjqwb7ET8vEuhcAoFrqmKmXyIyJNDm/DDv+2fRKqrAG
         HU6Q==
X-Gm-Message-State: AGi0PuZ9cU2ZPKvTo6Q2TsqmWFHGYp8bxHYZNOfUnmk7JYOk2AeQM2Ic
	P9PXsycIhLXA31/sw6li5hlEag==
X-Google-Smtp-Source: APiQypJgf897XGhpjxMptUvFyWLInUfDoHbxf7Vf+IjTJiJ72Mqyg6JWJrti2xotS5u4Ry1pw37aXg==
X-Received: by 2002:adf:ce0a:: with SMTP id p10mr9825005wrn.89.1587236534962;
        Sat, 18 Apr 2020 12:02:14 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ub1910 ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id y18sm13870395wmc.45.2020.04.18.12.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 12:02:14 -0700 (PDT)
Date: Sat, 18 Apr 2020 20:02:10 +0100
From: "Paul Barker" <pbarker@konsulko.com>
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6 08/10] wic: root: Add an opt. destination on include-path
Message-ID: <20200418200210.4a84c45a@ub1910>
In-Reply-To: <20200414133614.1830058-9-ricardo@ribalda.com>
References: <20200414133614.1830058-1-ricardo@ribalda.com>
 <20200414133614.1830058-9-ricardo@ribalda.com>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Apr 2020 15:36:12 +0200
Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:

> Allow specifying an optional destination to include-path and make the
> option aware of permissions and owners.
> 
> It is very useful for making a partition that contains the rootfs for a
> host and a target Eg:
> 
> / -> Roofs for the host
> /export/ -> Rootfs for the target (which will netboot)
> 
> Although today we support making a partition for "/export" this might
> not be compatible with some upgrade systems, or we might be limited by
> the number of partitions.
> 
> With this patch we can use something like:
> 
> part / --source rootfs --fstype=ext4 --include-path core-image-minimal-mtdutils export/ --include-path hello
> 
> on the .wks file.
> 
> Cc: Paul Barker <pbarker@konsulko.com>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> ---
>  meta/recipes-core/meta/wic-tools.bb      |  2 +-
>  scripts/lib/wic/help.py                  | 20 +++++----
>  scripts/lib/wic/ksparser.py              |  2 +-
>  scripts/lib/wic/plugins/source/rootfs.py | 54 +++++++++++++++++++++++-
>  4 files changed, 66 insertions(+), 12 deletions(-)
> 
> diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
> index 09eb409e87..8aeb942ed2 100644
> --- a/meta/recipes-core/meta/wic-tools.bb
> +++ b/meta/recipes-core/meta/wic-tools.bb
> @@ -6,7 +6,7 @@ DEPENDS = "\
>             parted-native syslinux-native gptfdisk-native dosfstools-native \
>             mtools-native bmap-tools-native grub-efi-native cdrtools-native \
>             btrfs-tools-native squashfs-tools-native pseudo-native \
> -           e2fsprogs-native util-linux-native \
> +           e2fsprogs-native util-linux-native tar-native\
>             "
>  DEPENDS_append_x86 = " syslinux grub-efi systemd-boot"
>  DEPENDS_append_x86-64 = " syslinux grub-efi systemd-boot"
> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> index 62a2a90e79..bd3a2b97df 100644
> --- a/scripts/lib/wic/help.py
> +++ b/scripts/lib/wic/help.py
> @@ -971,14 +971,18 @@ DESCRIPTION
>                           has an effect with the rootfs source plugin.
>  
>           --include-path: This option is specific to wic. It adds the contents
> -                         of the given path to the resulting image. The path is
> -                         relative to the directory in which wic is running not
> -                         the rootfs itself so use of an absolute path is
> -                         recommended. This option is most useful when multiple
> -                         copies of the rootfs are added to an image and it is
> -                         required to add extra content to only one of these
> -                         copies. This option only has an effect with the rootfs
> -                         source plugin.
> +                         of the given path or a rootfs to the resulting image.
> +                         The option contains two fields, the origin and the
> +                         destination. When the origin is a rootfs, it follows
> +                         the same logic as the rootfs-dir argument and the
> +                         permissions and owners are kept. When the origin is a
> +                         path, it is relative to the directory in which wic is
> +                         running not the rootfs itself so use of an absolute
> +                         path is recommended, and the owner and group is set to
> +                         root:root. If no destination is given it is
> +                         automatically set to the root of the rootfs. This
> +                         option only has an effect with the rootfs source
> +                         plugin.
>  
>           --change-directory: This option is specific to wic. It changes to the
>                               given directory before copying the files. This
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index c60869d397..b8befe78e3 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -137,7 +137,7 @@ class KickStart():
>          part.add_argument('--active', action='store_true')
>          part.add_argument('--align', type=int)
>          part.add_argument('--exclude-path', nargs='+')
> -        part.add_argument('--include-path', nargs='+')
> +        part.add_argument('--include-path', nargs='+', action='append')
>          part.add_argument('--change-directory')
>          part.add_argument("--extra-space", type=sizetype)
>          part.add_argument('--fsoptions', dest='fsopts')
> diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
> index 1d21ec2252..9d0666b638 100644
> --- a/scripts/lib/wic/plugins/source/rootfs.py
> +++ b/scripts/lib/wic/plugins/source/rootfs.py
> @@ -17,6 +17,7 @@ import shutil
>  import sys
>  
>  from oe.path import copyhardlinktree
> +from pathlib import Path
>  
>  from wic import WicError
>  from wic.pluginbase import SourcePlugin
> @@ -125,8 +126,57 @@ class RootfsPlugin(SourcePlugin):
>                                                      orig_dir, new_rootfs)
>                  exec_native_cmd(pseudo_cmd, native_sysroot)
>  
> -            for path in part.include_path or []:
> -                copyhardlinktree(path, new_rootfs)
> +            for in_path in part.include_path or []:
> +                #parse arguments
> +                include_path = in_path[0]
> +                if len(in_path) > 2:
> +                    logger.error("'Invalid number of arguments for include-path")
> +                    sys.exit(1)
> +                if len(in_path) == 2:
> +                    path = in_path[1]
> +                else:
> +                    path = None
> +
> +                #pack content
> +                tar_file = os.path.realpath(os.path.join(cr_workdir, "aux.tar"))

Could you explain why you're using tar here either in the commit
message or the comment?

And can we use the line number from the wks in the tarfile name to
match what we elsewhere in this script? If there's multiple lines using
`--include-path` that would let me examine each intermediate tarball if
I need to for debugging (assuming I locally commented out
`os.remove(tar_file)` below).

> +                if os.path.isfile(include_path):
> +                    parent = os.path.dirname(include_path)
> +                    tar_cmd = "tar c --owner=root --group=root -f %s -C %s %s" % (
> +                                tar_file, parent, os.path.relpath(include_path, parent))
> +                    exec_native_cmd(tar_cmd, native_sysroot)
> +                else:
> +                    if include_path in krootfs_dir:
> +                        include_path = krootfs_dir[include_path]
> +                    include_path = cls.__get_rootfs_dir(include_path)
> +                    include_pseudo = os.path.join(include_path, "../pseudo")
> +                    if os.path.lexists(include_pseudo):
> +                        pseudo = cls.__get_pseudo(native_sysroot, include_path,
> +                                                  include_pseudo)
> +                        tar_cmd = "tar cf %s -C %s ." % (tar_file, include_path)
> +                    else:
> +                        pseudo = None
> +                        tar_cmd = "tar c --owner=root --group=root -f %s -C %s ." % (
> +                                tar_file, include_path)
> +                    exec_native_cmd(tar_cmd, native_sysroot, pseudo)
> +
> +                #create destination
> +                if path:
> +                    destination = os.path.realpath(os.path.join(new_rootfs, path))
> +                    if not destination.startswith(new_rootfs):
> +                        logger.error("%s %s" % (destination, new_rootfs))
> +                        sys.exit(1)
> +                    Path(destination).mkdir(parents=True, exist_ok=True)
> +                else:
> +                    destination = new_rootfs
> +
> +                #extract destination
> +                untar_cmd = "tar xf %s -C %s" % (tar_file, destination)
> +                if new_pseudo:
> +                    pseudo = cls.__get_pseudo(native_sysroot, new_rootfs, new_pseudo)
> +                else:
> +                    pseudo = None
> +                exec_native_cmd(untar_cmd, native_sysroot, pseudo)
> +                os.remove(tar_file)
>  
>              for orig_path in part.exclude_path or []:
>                  path = orig_path

-- 
Paul Barker
Konsulko Group
