Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B71BE63F2A
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 03:09:19 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12176.1771211355647963342
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Feb 2026 19:09:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e2cefWyR;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c6dcdc955a1so932863a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 19:09:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771211355; cv=none;
        d=google.com; s=arc-20240605;
        b=JUD5nvDbRw9vk9eaaEPUNF6Y1OhGdDrgX7JEfA/srfakeZUERHgIMrR37BqHCRCgjv
         Mqvx1hF6xFWI/4sOLmoTqHxVl3Qp4GoxIlvfQ58Y1LxChvBOMfBzDXGRIawQwAuRce6H
         Jydd6OswwINcjfebkxgvxvTfRhw41rPtDY5N8gADlDD97M55/Z4ZRsFpCFB2KEuNMQhl
         TDbwtcvd9ndXKNH56WU8qZirGBJhEnR7LnIsjAplK9Rb5VG04LSMyZSk+jkMpyydwDU5
         SdxkDRXvVB/RJX302ojMZ0gXNexo4dyn305dtOLCgI80IK0qUcmDQPyKZ9yioah/qBaC
         Thzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f2/3PQw6KJkScnyk7Uvg3561vQgcH3ZrfdoEPDEkjNA=;
        fh=e6oaJJW7Vw/5SPUz6K7m8kHQjxWNzVk4hrlXRlx+4DY=;
        b=bQ1DDsLZAz2wTkEzQ3b+n6s7R7M5Wd2OBh/VYwd8u//EaCxRjC/x49opFT7PT+LZY6
         ptwiE6wr3ylwIHO1UgMlMAgOUo+2oX13QOen1DtIAitDIiC7d+zi0nlQECO/QMQs63DD
         vsQPEdkVniG+9BrsVu5hEztuC4F4ccvRpP5kUxPtdpT4xeIhjAfGKiTDui4e6WccATzr
         +f7VU/naoSQgqVpQ6Do2OY2DkwdLR3Kz30GIf89tAT3bK/W3R2kiU+7Mtxrgm4SROdFl
         lFGgnS3CjrNZNDjkVyX/CMPtrNC4EuOWUNKoctCxaVkxXSVz+xR66GjBWenU5t5cdBVB
         F0HA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771211355; x=1771816155; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f2/3PQw6KJkScnyk7Uvg3561vQgcH3ZrfdoEPDEkjNA=;
        b=e2cefWyR65Q3DcaRROaFu+or+n1EzmBWWuw5uGJXBDkB3ESisqEZCnWTS/FMBpSYcS
         x8til2Zmi0jKt24SPKlLXmPylWxHNvnyl8Pf7sSF6wmn3kcPoglDpT8oTGm2+vpaEJG8
         cZ3zUyk6vOa+QWM59pdm1NQzk4j2dtS53c4NyhHAmWdgLcOyqdV34QS4HoK+NOD5empG
         aVHc3TXbqxVQYo8um3dag4htEJ4CiKPWna0BaOnR0bEIdNlPB8IsN3RnAZI8uF8aBOJD
         h6sH1UrVd3IzrEWlPRkA+H3jQth468IVvkz+f6AZ4pLqylGf/gcw3RNfQ4N+b2iuzOn5
         MoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771211355; x=1771816155;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2/3PQw6KJkScnyk7Uvg3561vQgcH3ZrfdoEPDEkjNA=;
        b=KCG7kUX7y3WQx6NQiGQsZS8B1pR9djyV1IH+GSzTDoU7M/aeHpfdoQQj9m35Kq/fa7
         sSbRXxj/xGlrYW25ppBL4QSzXuLY/50O4wP6Tpu6GPXHXxsH+Amwf+qQGyVZi+Zj2h2M
         LvARcU5xpkK2ipzVPTZtz0l/0Bk5a1sT+srbKIuCfsA4Wspb53pxN0WvfDvnBeTPpKZP
         tJyvDDpMgalmQX1Jim/fKTH2/mKk+zQyS151UJcVLR4Y3X9eVJlIwDuPNKeepOkHv3sw
         J0+8ENHndKU7W9fIT441cEMGomxB+3IxzOn/UqlAzlaTvuc7yYAlVseYhbEk7wJ9QqD8
         6gDA==
X-Gm-Message-State: AOJu0YznL8DyoxWSedbuU64vQSKZdFf8Z7tpFZxWGq7wu/9VhR26zSne
	5PS3+p20ZtE8qgFBYhn0DZFjyi3jFtFy6iEnLFg77+8uewvWIlPYRdUnQ2MH4nCRXYKHVoorEAI
	0tHjYpElNcRNwYr5kiXvAjtjUbGBr9E/bE1re
X-Gm-Gg: AZuq6aJxUUuExSbGcksP4eO01XnJ18g+OvwPh6jSC8kECpbsrDSjLeWeSi9p5n5Hj/Q
	s25gLARoqxeRcFq3C1B90tRyW6rQACe9Kz9mkbP83QmuuQH52uT9/PMr0+k2+jNjCoOewrAqDjc
	Z1QWtBAGKTMCyoX/0SkDG+seFbvu0iyWO6SC62H75lSPwkkODX+IKztN+vFD3kduKFDPuTbcukX
	GamTv+ve6umQrGACgzGazVJZ1fmmHieqtj7vs2Y9qkyONToSz/eWiD9FzgMaDxmoAwpD8CVzRUg
	7tMtW60AhvNs4V1VXW6opls1MZMH37MOIrVmWroT
X-Received: by 2002:a17:90b:4f8e:b0:356:2eff:deff with SMTP id
 98e67ed59e1d1-356aabbd0dfmr8784276a91.15.1771211354611; Sun, 15 Feb 2026
 19:09:14 -0800 (PST)
MIME-Version: 1.0
References: <20260216023159.1307348-1-twoerner@gmail.com>
In-Reply-To: <20260216023159.1307348-1-twoerner@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 15 Feb 2026 22:09:03 -0500
X-Gm-Features: AaiRm53CXopwFYLxswtf1N7JdF6tZM9BOAnqU27q7hWbgIlaEO3tkUIEyBe0fE0
Message-ID: <CADkTA4P6F67uqO5mYiArpEMXoBzp8qW2RcukWcQE_1NGJM9EWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/2] wic: re-implement sector-size support
To: twoerner@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009d2568064ae847fe"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 03:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231179

--0000000000009d2568064ae847fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 15, 2026 at 9:32=E2=80=AFPM Trevor Woerner via lists.openembedd=
ed.org
<twoerner=3Dgmail.com@lists.openembedded.org> wrote:

> The previous implementation to add variable sector-size support:
> - required the variable WIC_SECTOR_SIZE either be defined in a
>   configuration file or be defined in a --vars file
> - this means that every invocation of "wic ls", "wic cp", or "wic rm"
>   needed this variable defined (config or --vars)
> - required the user to create separate *wks files for every sector size
>   they wanted to use
> - required the user to specify the mkfs-extraopts by hand to specify the
>   correct sector size: e.g.
>         bootloader --ptable gpt
>         part --fstype ext4 --source rootfs --label rofs-a --mkfs-extraopt=
s
> "-b 4096"
>         part --fstype ext4 --source rootfs --use-uuid --mkfs-extraopts "-=
b
> 4096"
> - specifying --mkfs-extraopts replaces the defaults with the
>   user-supplied values
> - only provided details to support using variable sector-sizes with
>   ext[234] filesystems
> - it would not be possible to generate images with different sector
>   sizes in the same build since the configuration and *wks files would
>   need to change and the build re-run for each size
>
> Update the sector-size handling so that:
> - the sector-size will now be provided on the cmdline to the "wic ls",
>   "wic cp", "wic rm", and "wic create" commands: default =3D 512
> - this means the configuration and/or --vars file does not need to be
>   changed in order to perform those operations on images with different
>   sector sizes
> - support is provided implicitly for mkdosfs and ext[234] partitions
> - the user no longer needs to know and supply the sector-size magic in
>   --mkfs-extraopts (thereby clobbering the other defaults)
>

It wasn't clear to me when scanning the patch. For configuration
files with a sector size, is it now completely ignored ?

Apologies if I missed where existing configs were used to prime
the parameters to the functions.

Bruce



>
> AI-Generated: codex/gpt-5.1-codex-max
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> changes since v2:
> - none
>
> changes since v1:
> - none
> ---
>  meta/lib/oeqa/selftest/cases/wic.py           | 39 ++++---------
>  scripts/lib/wic/engine.py                     | 45 +++++++--------
>  scripts/lib/wic/help.py                       | 23 +++++---
>  scripts/lib/wic/partition.py                  | 55 +++++++++++++++++--
>  scripts/lib/wic/plugins/imager/direct.py      | 18 ++----
>  scripts/lib/wic/plugins/source/bootimg_efi.py |  5 +-
>  .../lib/wic/plugins/source/bootimg_pcbios.py  | 11 ++--
>  .../wic/plugins/source/isoimage_isohybrid.py  |  5 +-
>  scripts/wic                                   |  8 +++
>  9 files changed, 125 insertions(+), 84 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py
> b/meta/lib/oeqa/selftest/cases/wic.py
> index ecaee5a29144..7ad61fa700f7 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -935,33 +935,22 @@ bootloader --ptable gpt""")
>          finally:
>              os.remove(wks_file)
>
> -    def test_wic_sector_size(self):
> -        """Test generation image sector size"""
> -
> +    def test_wic_sector_size_cli(self):
> +        """Test sector size handling via CLI option."""
> +
>          oldpath =3D os.environ['PATH']
>          os.environ['PATH'] =3D get_bb_var("PATH", "wic-tools")
>
>          try:
> -            # Add WIC_SECTOR_SIZE into config
> -            config =3D 'WIC_SECTOR_SIZE =3D "4096"\n'\
> -                     'WICVARS:append =3D " WIC_SECTOR_SIZE"\n'
> -            self.append_config(config)
>              bitbake('core-image-minimal')
>
> -            # Check WIC_SECTOR_SIZE apply to bitbake variable
> -            wic_sector_size_str =3D get_bb_var('WIC_SECTOR_SIZE',
> 'core-image-minimal')
> -            wic_sector_size =3D int(wic_sector_size_str)
> -            self.assertEqual(4096, wic_sector_size)
> -
> -            self.logger.info("Test wic_sector_size: %d \n" %
> wic_sector_size)
> -
>              with NamedTemporaryFile("w", suffix=3D".wks") as wks:
>                  wks.writelines(
>                      ['bootloader --ptable gpt\n',
> -                     'part --fstype ext4 --source rootfs --label rofs-a
> --mkfs-extraopts "-b 4096"\n',
> -                     'part --fstype ext4 --source rootfs --use-uuid
> --mkfs-extraopts "-b 4096"\n'])
> +                     'part --fstype ext4 --source rootfs --label
> rofs-a\n',
> +                     'part --fstype ext4 --source rootfs --use-uuid\n'])
>                  wks.flush()
> -                cmd =3D "wic create %s -e core-image-minimal -o %s" % (
> wks.name, self.resultdir)
> +                cmd =3D "wic create %s -e core-image-minimal -o %s
> --sector-size 4096" % (wks.name, self.resultdir)
>                  runCmd(cmd)
>                  wksname =3D os.path.splitext(os.path.basename(wks.name))=
[0]
>                  images =3D glob(os.path.join(self.resultdir, "%s-*direct=
" %
> wksname))
> @@ -969,24 +958,18 @@ bootloader --ptable gpt""")
>
>              sysroot =3D get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
>              # list partitions
> -            result =3D runCmd("wic ls %s -n %s" % (images[0], sysroot))
> +            result =3D runCmd("wic ls %s -n %s --sector-size 4096" %
> (images[0], sysroot))
>              self.assertEqual(3, len(result.output.split('\n')))
>
> -            # verify partition size with wic
> -            res =3D runCmd("export PARTED_SECTOR_SIZE=3D%d; parted -m %s=
 unit
> b p" % (wic_sector_size, images[0]),
> +            # verify partition size with parted output
> +            res =3D runCmd("export PARTED_SECTOR_SIZE=3D%d; parted -m %s=
 unit
> b p" % (4096, images[0]),
>                           stderr=3Dsubprocess.PIPE)
>
> -            # parse parted output which looks like this:
> -            # BYT;\n
> -            #
> /var/tmp/wic/build/tmpgjzzefdd-202410281021-sda.direct:78569472B:file:409=
6:4096:gpt::;\n
> -            # 1:139264B:39284735B:39145472B:ext4:rofs-a:;\n
> -            # 2:39284736B:78430207B:39145472B:ext4:primary:;\n
>              disk_info =3D res.output.splitlines()[1]
> -            # Check sector sizes
>              sector_size_logical =3D int(disk_info.split(":")[3])
>              sector_size_physical =3D int(disk_info.split(":")[4])
> -            self.assertEqual(wic_sector_size, sector_size_logical,
> "Logical sector size is not %d." % wic_sector_size)
> -            self.assertEqual(wic_sector_size, sector_size_physical,
> "Physical sector size is not %d." % wic_sector_size)
> +            self.assertEqual(4096, sector_size_logical, "Logical sector
> size is not 4096.")
> +            self.assertEqual(4096, sector_size_physical, "Physical secto=
r
> size is not 4096.")
>
>          finally:
>              os.environ['PATH'] =3D oldpath
> diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
> index 9d596be3a723..7753f431f91d 100644
> --- a/scripts/lib/wic/engine.py
> +++ b/scripts/lib/wic/engine.py
> @@ -224,7 +224,7 @@ def wic_list(args, scripts_path):
>
>
>  class Disk:
> -    def __init__(self, imagepath, native_sysroot, fstypes=3D('fat', 'ext=
')):
> +    def __init__(self, imagepath, native_sysroot, fstypes=3D('fat', 'ext=
'),
> sector_size=3D512):
>          self.imagepath =3D imagepath
>          self.native_sysroot =3D native_sysroot
>          self.fstypes =3D fstypes
> @@ -233,16 +233,7 @@ class Disk:
>          self._lsector_size =3D None
>          self._psector_size =3D None
>          self._ptable_format =3D None
> -
> -        # define sector size
> -        sector_size_str =3D get_bitbake_var('WIC_SECTOR_SIZE')
> -        if sector_size_str is not None:
> -            try:
> -                self.sector_size =3D int(sector_size_str)
> -            except ValueError:
> -                self.sector_size =3D None
> -        else:
> -            self.sector_size =3D None
> +        self.sector_size =3D sector_size
>
>          # find parted
>          # read paths from $PATH environment variable
> @@ -271,7 +262,7 @@ class Disk:
>          if self._partitions is None:
>              self._partitions =3D OrderedDict()
>
> -            if self.sector_size is not None:
> +            if self.sector_size:
>                  out =3D exec_cmd("export PARTED_SECTOR_SIZE=3D%d; %s -sm=
 %s
> unit B print" % \
>                             (self.sector_size, self.parted,
> self.imagepath), True)
>              else:
> @@ -312,11 +303,15 @@ class Disk:
>              raise WicError("Partition %s is not in the image" % pnum)
>          part =3D self.partitions[pnum]
>          # check if fstype is supported
> +        # NOTE: parted is unable to identify dos-type partitions with a
> 4k sector-size
> +        #       if the type is empty and a non-default sector size is
> used, assume 'fat'
> +        #       fdisk identifies them without issue
> +        part_fstype =3D part.fstype if part.fstype or self.sector_size =
=3D=3D
> 512 else 'fat'
>          for fstype in self.fstypes:
> -            if part.fstype.startswith(fstype):
> +            if part_fstype.startswith(fstype):
>                  break
>          else:
> -            raise WicError("Not supported fstype: {}".format(part.fstype=
))
> +            raise WicError("Not supported fstype: {}".format(part_fstype=
))
>          if pnum not in self._partimages:
>              tmpf =3D tempfile.NamedTemporaryFile(prefix=3D"wic-part")
>              dst_fname =3D tmpf.name
> @@ -586,8 +581,9 @@ class Disk:
>                              label =3D part.get("name")
>                              label_str =3D "-n {}".format(label) if label
> else ''
>
> -                            cmd =3D "{} {} -C {} {}".format(self.mkdosfs=
,
> label_str, partfname,
> -                                                          part['size'])
> +                            sector_str =3D "-S {}".format(self.sector_si=
ze)
> if self.sector_size else ''
> +                            cmd =3D "{} {} {} -C {}
> {}".format(self.mkdosfs, label_str, sector_str, partfname,
> +                                                             part['size'=
])
>                              exec_cmd(cmd)
>                              # copy content from the temporary directory
> to the new partition
>                              cmd =3D "{} -snompi {} {}/*
> ::".format(self.mcopy, partfname, tmpdir)
> @@ -609,14 +605,19 @@ class Disk:
>
>  def wic_ls(args, native_sysroot):
>      """List contents of partitioned image or vfat partition."""
> -    disk =3D Disk(args.path.image, native_sysroot)
> +    disk =3D Disk(args.path.image, native_sysroot,
> sector_size=3Dargs.sector_size)
>      if not args.path.part:
>          if disk.partitions:
>              print('Num     Start        End          Size      Fstype')
>              for part in disk.partitions.values():
> +                # size values are in bytes from parted; convert to
> sectors if a custom sector size was requested
> +                display_size =3D part.size
> +                if args.sector_size and args.sector_size !=3D
> disk._lsector_size:
> +                    display_size =3D part.size // args.sector_size
>                  print("{:2d}  {:12d} {:12d} {:12d}  {}".format(\
> -                          part.pnum, part.start, part.end,
> -                          part.size, part.fstype))
> +                          part.pnum, part.start // args.sector_size,
> +                          part.end // args.sector_size,
> +                          display_size, part.fstype))
>      else:
>          path =3D args.path.path or '/'
>          print(disk.dir(args.path.part, path))
> @@ -627,9 +628,9 @@ def wic_cp(args, native_sysroot):
>      partitioned image.
>      """
>      if isinstance(args.dest, str):
> -        disk =3D Disk(args.src.image, native_sysroot)
> +        disk =3D Disk(args.src.image, native_sysroot,
> sector_size=3Dargs.sector_size)
>      else:
> -        disk =3D Disk(args.dest.image, native_sysroot)
> +        disk =3D Disk(args.dest.image, native_sysroot,
> sector_size=3Dargs.sector_size)
>      disk.copy(args.src, args.dest)
>
>
> @@ -638,7 +639,7 @@ def wic_rm(args, native_sysroot):
>      Remove files or directories from the vfat partition of
>      partitioned image.
>      """
> -    disk =3D Disk(args.path.image, native_sysroot)
> +    disk =3D Disk(args.path.image, native_sysroot,
> sector_size=3Dargs.sector_size)
>      disk.remove(args.path.part, args.path.path, args.recursive_delete)
>
>  def wic_write(args, native_sysroot):
> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> index 6b49a67de938..5d7c40456a80 100644
> --- a/scripts/lib/wic/help.py
> +++ b/scripts/lib/wic/help.py
> @@ -118,7 +118,7 @@ wic_create_usage =3D """
>   usage: wic create <wks file or image name> [-o <DIRNAME> | --outdir
> <DIRNAME>]
>              [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
>              [-r, --rootfs-dir] [-b, --bootimg-dir]
> -            [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootf=
s]
> +            [-k, --kernel-dir] [-n, --native-sysroot] [--sector-size
> <bytes>] [-f, --build-rootfs]
>              [-c, --compress-with] [-m, --bmap]
>
>   This command creates an OpenEmbedded image based on the 'OE kickstart
> @@ -139,13 +139,16 @@ SYNOPSIS
>      wic create <wks file or image name> [-o <DIRNAME> | --outdir
> <DIRNAME>]
>          [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
>          [-r, --rootfs-dir] [-b, --bootimg-dir]
> -        [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootfs]
> +        [-k, --kernel-dir] [-n, --native-sysroot] [--sector-size <bytes>=
]
> [-f, --build-rootfs]
>          [-c, --compress-with] [-m, --bmap] [--no-fstab-update]
>
>  DESCRIPTION
>      This command creates an OpenEmbedded image based on the 'OE
>      kickstart commands' found in the <wks file>.
>
> +    Use the --sector-size option to select the sector size (in bytes)
> +    used for partition layout calculations (default is 512).
> +
>      In order to do this, wic needs to know the locations of the
>      various build artifacts required to build the image.
>
> @@ -278,7 +281,7 @@ wic_ls_usage =3D """
>
>   List content of a partitioned image
>
> - usage: wic ls <image>[:<partition>[<path>]] [--native-sysroot <path>]
> + usage: wic ls <image>[:<partition>[<path>]] [--native-sysroot <path>]
> [--sector-size <bytes>]
>
>   This command  outputs either list of image partitions or directory
> contents
>   of vfat and ext* partitions.
> @@ -296,7 +299,7 @@ SYNOPSIS
>      wic ls <image>
>      wic ls <image>:<vfat or ext* partition>
>      wic ls <image>:<vfat or ext* partition><path>
> -    wic ls <image>:<vfat or ext* partition><path> --native-sysroot <path=
>
> +    wic ls <image>:<vfat or ext* partition><path> --native-sysroot <path=
>
> [--sector-size <bytes>]
>
>  DESCRIPTION
>      This command lists either partitions of the image or directory
> contents
> @@ -336,6 +339,8 @@ DESCRIPTION
>
>      The -n option is used to specify the path to the native sysroot
>      containing the tools(parted and mtools) to use.
> +    The --sector-size option sets the sector size used for partition mat=
h
> +    (default is 512 bytes).
>
>  """
>
> @@ -343,7 +348,7 @@ wic_cp_usage =3D """
>
>   Copy files and directories to/from the vfat or ext* partition
>
> - usage: wic cp <src> <dest> [--native-sysroot <path>]
> + usage: wic cp <src> <dest> [--native-sysroot <path>] [--sector-size
> <bytes>]
>
>   source/destination image in format <image>:<partition>[<path>]
>
> @@ -364,7 +369,7 @@ SYNOPSIS
>      wic cp <src> <dest>:<partition>
>      wic cp <src>:<partition> <dest>
>      wic cp <src> <dest-image>:<partition><path>
> -    wic cp <src> <dest-image>:<partition><path> --native-sysroot <path>
> +    wic cp <src> <dest-image>:<partition><path> --native-sysroot <path>
> [--sector-size <bytes>]
>
>  DESCRIPTION
>      This command copies files or directories either
> @@ -408,13 +413,15 @@ DESCRIPTION
>
>      The -n option is used to specify the path to the native sysroot
>      containing the tools(parted and mtools) to use.
> +    The --sector-size option sets the sector size used for partition mat=
h
> +    (default is 512 bytes).
>  """
>
>  wic_rm_usage =3D """
>
>   Remove files or directories from the vfat or ext* partitions
>
> - usage: wic rm <image>:<partition><path> [--native-sysroot <path>]
> + usage: wic rm <image>:<partition><path> [--native-sysroot <path>]
> [--sector-size <bytes>]
>
>   This command  removes files or directories from the vfat or ext*
> partitions of
>   the partitioned image.
> @@ -466,6 +473,8 @@ DESCRIPTION
>
>      The -n option is used to specify the path to the native sysroot
>      containing the tools(parted and mtools) to use.
> +    The --sector-size option sets the sector size used for partition mat=
h
> +    (default is 512 bytes).
>
>      The -r option is used to remove directories and their contents
>      recursively,this only applies to ext* partition.
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index 8fed686e903e..df6e3271649b 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -65,6 +65,50 @@ class Partition():
>
>          self.lineno =3D lineno
>          self.source_file =3D ""
> +        self.sector_size =3D 512
> +
> +    def _mkdosfs_extraopts(self):
> +        """
> +        Build mkdosfs extra options ensuring the CLI sector size is
> applied.
> +        """
> +        extraopts =3D self.mkfs_extraopts or ''
> +        tokens =3D []
> +        skip_next =3D False
> +        for tok in extraopts.split():
> +            if skip_next:
> +                skip_next =3D False
> +                continue
> +            if tok =3D=3D '-S':
> +                skip_next =3D True
> +                continue
> +            if tok.startswith('-S'):
> +                continue
> +            tokens.append(tok)
> +        tokens.extend(['-S', str(self.sector_size)])
> +        return ' '.join(tokens).strip()
> +
> +    def _mkfs_ext_extraopts(self, base_opts):
> +        """
> +        Build mkfs.ext* extra options ensuring the CLI sector size is
> applied.
> +        """
> +        extraopts =3D self.mkfs_extraopts or base_opts
> +        # Only add an explicit block size when a non-default sector size
> is requested.
> +        if self.sector_size and self.sector_size !=3D 512:
> +            tokens =3D []
> +            skip_next =3D False
> +            for tok in extraopts.split():
> +                if skip_next:
> +                    skip_next =3D False
> +                    continue
> +                if tok =3D=3D '-b':
> +                    skip_next =3D True
> +                    continue
> +                if tok.startswith('-b'):
> +                    continue
> +                tokens.append(tok)
> +            tokens.extend(['-b', str(self.sector_size)])
> +            return ' '.join(tokens).strip()
> +        return extraopts
>
>      def get_extra_block_count(self, current_blocks):
>          """
> @@ -138,6 +182,8 @@ class Partition():
>          Prepare content for individual partitions, depending on
>          partition command parameters.
>          """
> +        # capture the sector size requested on the CLI for mkdosfs
> invocations
> +        self.sector_size =3D getattr(creator, 'sector_size', 512) or 512
>          self.updated_fstab_path =3D updated_fstab_path
>          if self.updated_fstab_path and not (self.fstype.startswith("ext"=
)
> or self.fstype =3D=3D "msdos"):
>              self.update_fstab_in_rootfs =3D True
> @@ -293,7 +339,7 @@ class Partition():
>          with open(rootfs, 'w') as sparse:
>              os.ftruncate(sparse.fileno(), rootfs_size * 1024)
>
> -        extraopts =3D self.mkfs_extraopts or "-F -i 8192"
> +        extraopts =3D self._mkfs_ext_extraopts("-F -i 8192")
>
>          # use hash_seed to generate reproducible ext4 images
>          (extraopts, pseudo) =3D self.get_hash_seed_ext4(extraopts, pseud=
o)
> @@ -401,7 +447,7 @@ class Partition():
>
>          size_str =3D ""
>
> -        extraopts =3D self.mkfs_extraopts or '-S 512'
> +        extraopts =3D self._mkdosfs_extraopts()
>
>          dosfs_cmd =3D "mkdosfs %s -i %s %s %s -C %s %d" % \
>                      (label_str, self.fsuuid, size_str, extraopts, rootfs=
,
> @@ -452,7 +498,7 @@ class Partition():
>          with open(rootfs, 'w') as sparse:
>              os.ftruncate(sparse.fileno(), size * 1024)
>
> -        extraopts =3D self.mkfs_extraopts or "-i 8192"
> +        extraopts =3D self._mkfs_ext_extraopts("-i 8192")
>
>          # use hash_seed to generate reproducible ext4 images
>          (extraopts, pseudo) =3D self.get_hash_seed_ext4(extraopts, None)
> @@ -498,7 +544,7 @@ class Partition():
>
>          size_str =3D ""
>
> -        extraopts =3D self.mkfs_extraopts or '-S 512'
> +        extraopts =3D self._mkdosfs_extraopts()
>
>          dosfs_cmd =3D "mkdosfs %s -i %s %s %s -C %s %d" % \
>                      (label_str, self.fsuuid, extraopts, size_str, rootfs=
,
> @@ -559,4 +605,3 @@ class Partition():
>                      logger.warn("%s Inodes (of size %d) are too small." =
%
>                                  (get_err_str(self), size))
>                  break
> -
> diff --git a/scripts/lib/wic/plugins/imager/direct.py
> b/scripts/lib/wic/plugins/imager/direct.py
> index ad922cfbf122..3adc6eee6280 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -67,6 +67,7 @@ class DirectPlugin(ImagerPlugin):
>          self._image =3D None
>          self.ptable_format =3D self.ks.bootloader.ptable
>          self.parts =3D self.ks.partitions
> +        self.sector_size =3D options.sector_size or 512
>
>          # as a convenience, set source to the boot partition source
>          # instead of forcing it to be set via bootloader --source
> @@ -78,7 +79,7 @@ class DirectPlugin(ImagerPlugin):
>          image_path =3D self._full_path(self.workdir, self.parts[0].disk,
> "direct")
>          self._image =3D PartitionedImage(image_path, self.ptable_format,
> self.ks.bootloader.diskid,
>                                         self.parts, self.native_sysroot,
> -                                       options.extra_space)
> +                                       options.extra_space,
> self.sector_size)
>
>      def setup_workdir(self, workdir):
>          if workdir:
> @@ -294,15 +295,13 @@ MBR_OVERHEAD =3D 1
>  # Overhead of the GPT partitioning scheme
>  GPT_OVERHEAD =3D 34
>
> -# Size of a sector in bytes
> -SECTOR_SIZE =3D 512
> -
>  class PartitionedImage():
>      """
>      Partitioned image in a file.
>      """
>
> -    def __init__(self, path, ptable_format, disk_id, partitions,
> native_sysroot=3DNone, extra_space=3D0):
> +    def __init__(self, path, ptable_format, disk_id, partitions,
> native_sysroot=3DNone, extra_space=3D0,
> +                 sector_size=3D512):
>          self.path =3D path  # Path to the image file
>          self.numpart =3D 0  # Number of allocated partitions
>          self.realpart =3D 0 # Number of partitions in the partition tabl=
e
> @@ -332,14 +331,7 @@ class PartitionedImage():
>          self.partitions =3D partitions
>          self.partimages =3D []
>          # Size of a sector used in calculations
> -        sector_size_str =3D get_bitbake_var('WIC_SECTOR_SIZE')
> -        if sector_size_str is not None:
> -            try:
> -                self.sector_size =3D int(sector_size_str)
> -            except ValueError:
> -                self.sector_size =3D SECTOR_SIZE
> -        else:
> -            self.sector_size =3D SECTOR_SIZE
> +        self.sector_size =3D sector_size or 512
>
>          self.native_sysroot =3D native_sysroot
>          num_real_partitions =3D len([p for p in self.partitions if not
> p.no_table])
> diff --git a/scripts/lib/wic/plugins/source/bootimg_efi.py
> b/scripts/lib/wic/plugins/source/bootimg_efi.py
> index 430b0a4b023a..864d6898fc9d 100644
> --- a/scripts/lib/wic/plugins/source/bootimg_efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg_efi.py
> @@ -415,8 +415,9 @@ class BootimgEFIPlugin(SourcePlugin):
>
>          label =3D part.label if part.label else "ESP"
>
> -        dosfs_cmd =3D "mkdosfs -v -n %s -i %s -C %s %d" % \
> -                    (label, part.fsuuid, bootimg, blocks)
> +        sector_size =3D getattr(creator, 'sector_size', 512) or 512
> +        dosfs_cmd =3D "mkdosfs -v -n %s -i %s -S %d -C %s %d" % \
> +                    (label, part.fsuuid, sector_size, bootimg, blocks)
>          exec_native_cmd(dosfs_cmd, native_sysroot)
>          logger.debug("mkdosfs:\n%s" % (str(out)))
>
> diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
> b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
> index a7cc5d12c620..32edac47fa09 100644
> --- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
> +++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
> @@ -132,7 +132,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
>                  cls._do_prepare_grub(part, cr_workdir, oe_builddir,
>                                  kernel_dir, rootfs_dir, native_sysroot)
>              elif source_params['loader-bios'] =3D=3D 'syslinux':
> -                cls._do_prepare_syslinux(part, cr_workdir, bootimg_dir,
> +                cls._do_prepare_syslinux(part, creator, cr_workdir,
> bootimg_dir,
>                                      kernel_dir, native_sysroot)
>              else:
>                  raise WicError("unrecognized bootimg_pcbios loader: %s" =
%
> source_params['loader-bios'])
> @@ -142,7 +142,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
>          except KeyError:
>              # Required by do_install_disk
>              cls.loader =3D 'syslinux'
> -            cls._do_prepare_syslinux(part, cr_workdir, bootimg_dir,
> +            cls._do_prepare_syslinux(part, creator, cr_workdir,
> bootimg_dir,
>                                  kernel_dir, native_sysroot)
>
>      @classmethod
> @@ -240,7 +240,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
>          cfg.close()
>
>      @classmethod
> -    def _do_prepare_syslinux(cls, part, cr_workdir, bootimg_dir,
> +    def _do_prepare_syslinux(cls, part, creator, cr_workdir, bootimg_dir=
,
>                               kernel_dir, native_sysroot):
>          """
>          Called to do the actual content population for a partition i.e. =
it
> @@ -292,8 +292,9 @@ class BootimgPcbiosPlugin(SourcePlugin):
>
>          label =3D part.label if part.label else "boot"
>
> -        dosfs_cmd =3D "mkdosfs -n %s -i %s -S 512 -C %s %d" % \
> -                    (label, part.fsuuid, bootimg, blocks)
> +        sector_size =3D getattr(creator, 'sector_size', 512) or 512
> +        dosfs_cmd =3D "mkdosfs -n %s -i %s -S %d -C %s %d" % \
> +                    (label, part.fsuuid, sector_size, bootimg, blocks)
>          exec_native_cmd(dosfs_cmd, native_sysroot)
>
>          mcopy_cmd =3D "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
> diff --git a/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
> b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
> index fdab188db1f8..9195ef5f3184 100644
> --- a/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
> +++ b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
> @@ -367,8 +367,9 @@ class IsoImagePlugin(SourcePlugin):
>
>              esp_label =3D source_params.get('esp_label', 'EFIimg')
>
> -            dosfs_cmd =3D 'mkfs.vfat -n \'%s\' -S 512 -C %s %d' \
> -                        % (esp_label, bootimg, blocks)
> +            sector_size =3D getattr(creator, 'sector_size', 512) or 512
> +            dosfs_cmd =3D "mkfs.vfat -n '%s' -S %d -C %s %d" % \
> +                        (esp_label, sector_size, bootimg, blocks)
>              exec_native_cmd(dosfs_cmd, native_sysroot)
>
>              mmd_cmd =3D "mmd -i %s ::/EFI" % bootimg
> diff --git a/scripts/wic b/scripts/wic
> index 9137208f5e8f..0cef84ef630c 100755
> --- a/scripts/wic
> +++ b/scripts/wic
> @@ -376,6 +376,8 @@ def wic_init_parser_create(subparser):
>                        default=3D"direct", help=3D"the wic imager plugin"=
)
>      subparser.add_argument("--extra-space", type=3Dint, dest=3D"extra_sp=
ace",
>                        default=3D0, help=3D"additional free disk space to=
 add
> to the image")
> +    subparser.add_argument("--sector-size", dest=3D"sector_size", type=
=3Dint,
> default=3D512,
> +                      help=3D"sector size in bytes (default: 512)")
>      return
>
>
> @@ -413,6 +415,8 @@ def imgtype(arg):
>  def wic_init_parser_ls(subparser):
>      subparser.add_argument("path", type=3Dimgtype,
>                          help=3D"image spec: <image>[:<vfat
> partition>[<path>]]")
> +    subparser.add_argument("--sector-size", dest=3D"sector_size", type=
=3Dint,
> default=3D512,
> +                        help=3D"sector size in bytes (default: 512)")
>      subparser.add_argument("-n", "--native-sysroot",
>                          help=3D"path to the native sysroot containing th=
e
> tools")
>      subparser.add_argument("-e", "--image-name", dest=3D"image_name",
> @@ -433,6 +437,8 @@ def wic_init_parser_cp(subparser):
>                          help=3D"image spec: <image>:<vfat
> partition>[<path>] or <file>")
>      subparser.add_argument("dest",
>                          help=3D"image spec: <image>:<vfat
> partition>[<path>] or <file>")
> +    subparser.add_argument("--sector-size", dest=3D"sector_size", type=
=3Dint,
> default=3D512,
> +                        help=3D"sector size in bytes (default: 512)")
>      subparser.add_argument("-n", "--native-sysroot",
>                          help=3D"path to the native sysroot containing th=
e
> tools")
>      subparser.add_argument("-e", "--image-name", dest=3D"image_name",
> @@ -445,6 +451,8 @@ def wic_init_parser_cp(subparser):
>  def wic_init_parser_rm(subparser):
>      subparser.add_argument("path", type=3Dimgpathtype,
>                          help=3D"path: <image>:<vfat partition><path>")
> +    subparser.add_argument("--sector-size", dest=3D"sector_size", type=
=3Dint,
> default=3D512,
> +                        help=3D"sector size in bytes (default: 512)")
>      subparser.add_argument("-n", "--native-sysroot",
>                          help=3D"path to the native sysroot containing th=
e
> tools")
>      subparser.add_argument("-r", dest=3D"recursive_delete",
> action=3D"store_true", default=3DFalse,
> --
> 2.51.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#231176):
> https://lists.openembedded.org/g/openembedded-core/message/231176
> Mute This Topic: https://lists.openembedded.org/mt/117833550/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000009d2568064ae847fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 15, 2026 at 9:32=
=E2=80=AFPM Trevor Woerner via <a href=3D"http://lists.openembedded.org">li=
sts.openembedded.org</a> &lt;twoerner=3D<a href=3D"mailto:gmail.com@lists.o=
penembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">The previous implementatio=
n to add variable sector-size support:<br>
- required the variable WIC_SECTOR_SIZE either be defined in a<br>
=C2=A0 configuration file or be defined in a --vars file<br>
- this means that every invocation of &quot;wic ls&quot;, &quot;wic cp&quot=
;, or &quot;wic rm&quot;<br>
=C2=A0 needed this variable defined (config or --vars)<br>
- required the user to create separate *wks files for every sector size<br>
=C2=A0 they wanted to use<br>
- required the user to specify the mkfs-extraopts by hand to specify the<br=
>
=C2=A0 correct sector size: e.g.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bootloader --ptable gpt<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 part --fstype ext4 --source rootfs --label rofs=
-a --mkfs-extraopts &quot;-b 4096&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 part --fstype ext4 --source rootfs --use-uuid -=
-mkfs-extraopts &quot;-b 4096&quot;<br>
- specifying --mkfs-extraopts replaces the defaults with the<br>
=C2=A0 user-supplied values<br>
- only provided details to support using variable sector-sizes with<br>
=C2=A0 ext[234] filesystems<br>
- it would not be possible to generate images with different sector<br>
=C2=A0 sizes in the same build since the configuration and *wks files would=
<br>
=C2=A0 need to change and the build re-run for each size<br>
<br>
Update the sector-size handling so that:<br>
- the sector-size will now be provided on the cmdline to the &quot;wic ls&q=
uot;,<br>
=C2=A0 &quot;wic cp&quot;, &quot;wic rm&quot;, and &quot;wic create&quot; c=
ommands: default =3D 512<br>
- this means the configuration and/or --vars file does not need to be<br>
=C2=A0 changed in order to perform those operations on images with differen=
t<br>
=C2=A0 sector sizes<br>
- support is provided implicitly for mkdosfs and ext[234] partitions<br>
- the user no longer needs to know and supply the sector-size magic in<br>
=C2=A0 --mkfs-extraopts (thereby clobbering the other defaults)<br></blockq=
uote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sm=
all">It wasn&#39;t clear=C2=A0to me when scanning the patch. For configurat=
ion</div><div class=3D"gmail_default" style=3D"font-size:small">files with =
a sector size, is it now completely ignored ?=C2=A0</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">Apologies if I missed where existing configs wer=
e used to prime</div><div class=3D"gmail_default" style=3D"font-size:small"=
>the parameters to the functions.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
AI-Generated: codex/gpt-5.1-codex-max<br>
Signed-off-by: Trevor Woerner &lt;<a href=3D"mailto:twoerner@gmail.com" tar=
get=3D"_blank">twoerner@gmail.com</a>&gt;<br>
---<br>
changes since v2:<br>
- none<br>
<br>
changes since v1:<br>
- none<br>
---<br>
=C2=A0meta/lib/oeqa/selftest/cases/wic.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 39 ++++---------<br>
=C2=A0scripts/lib/wic/engine.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 45 +++++++--------<br>
=C2=A0scripts/lib/wic/help.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 23 +++++---<br>
=C2=A0scripts/lib/wic/partition.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 55 +++++++++++++++++--<br>
=C2=A0scripts/lib/wic/plugins/imager/direct.py=C2=A0 =C2=A0 =C2=A0 | 18 ++-=
---<br>
=C2=A0scripts/lib/wic/plugins/source/bootimg_efi.py |=C2=A0 5 +-<br>
=C2=A0.../lib/wic/plugins/source/bootimg_pcbios.py=C2=A0 | 11 ++--<br>
=C2=A0.../wic/plugins/source/isoimage_isohybrid.py=C2=A0 |=C2=A0 5 +-<br>
=C2=A0scripts/wic=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 8 +++<br>
=C2=A09 files changed, 125 insertions(+), 84 deletions(-)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/c=
ases/wic.py<br>
index ecaee5a29144..7ad61fa700f7 100644<br>
--- a/meta/lib/oeqa/selftest/cases/wic.py<br>
+++ b/meta/lib/oeqa/selftest/cases/wic.py<br>
@@ -935,33 +935,22 @@ bootloader --ptable gpt&quot;&quot;&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0finally:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.remove(wks_file)<br>
<br>
-=C2=A0 =C2=A0 def test_wic_sector_size(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Test generation image sector=
 size&quot;&quot;&quot;<br>
- <br>
+=C2=A0 =C2=A0 def test_wic_sector_size_cli(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Test sector size handling vi=
a CLI option.&quot;&quot;&quot;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oldpath =3D os.environ[&#39;PATH&#39;]<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.environ[&#39;PATH&#39;] =3D get_bb_var=
(&quot;PATH&quot;, &quot;wic-tools&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add WIC_SECTOR_SIZE into confi=
g<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 config =3D &#39;WIC_SECTOR_SIZE =
=3D &quot;4096&quot;\n&#39;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;WICVARS:append =3D &quot; WIC_SECTOR_SIZE&quot;\n&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.append_config(config)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake(&#39;core-image-min=
imal&#39;)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check WIC_SECTOR_SIZE apply to=
 bitbake variable<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wic_sector_size_str =3D get_bb_v=
ar(&#39;WIC_SECTOR_SIZE&#39;, &#39;core-image-minimal&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wic_sector_size =3D int(wic_sect=
or_size_str)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(4096, wic_secto=
r_size)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://self.logger.in=
fo" rel=3D"noreferrer" target=3D"_blank">self.logger.info</a>(&quot;Test wi=
c_sector_size: %d \n&quot; % wic_sector_size)<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with NamedTemporaryFile(&qu=
ot;w&quot;, suffix=3D&quot;.wks&quot;) as wks:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wks.writeline=
s(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0[&#39;bootloader --ptable gpt\n&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;part --fstype ext4 --source rootfs --label rofs-a --mkfs-extraopts =
&quot;-b 4096&quot;\n&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;part --fstype ext4 --source rootfs --use-uuid --mkfs-extraopts &quo=
t;-b 4096&quot;\n&#39;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;part --fstype ext4 --source rootfs --label rofs-a\n&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;part --fstype ext4 --source rootfs --use-uuid\n&#39;])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wks.flush()<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;wic =
create %s -e core-image-minimal -o %s&quot; % (<a href=3D"http://wks.name" =
rel=3D"noreferrer" target=3D"_blank">wks.name</a>, self.resultdir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;wic =
create %s -e core-image-minimal -o %s --sector-size 4096&quot; % (<a href=
=3D"http://wks.name" rel=3D"noreferrer" target=3D"_blank">wks.name</a>, sel=
f.resultdir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0runCmd(cmd)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wksname =3D o=
s.path.splitext(os.path.basename(<a href=3D"http://wks.name" rel=3D"norefer=
rer" target=3D"_blank">wks.name</a>))[0]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0images =3D gl=
ob(os.path.join(self.resultdir, &quot;%s-*direct&quot; % wksname))<br>
@@ -969,24 +958,18 @@ bootloader --ptable gpt&quot;&quot;&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysroot =3D get_bb_var(&#39=
;RECIPE_SYSROOT_NATIVE&#39;, &#39;wic-tools&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# list partitions<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D runCmd(&quot;wic ls %=
s -n %s&quot; % (images[0], sysroot))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D runCmd(&quot;wic ls %=
s -n %s --sector-size 4096&quot; % (images[0], sysroot))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(3, len(res=
ult.output.split(&#39;\n&#39;)))<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # verify partition size with wic=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D runCmd(&quot;export PART=
ED_SECTOR_SIZE=3D%d; parted -m %s unit b p&quot; % (wic_sector_size, images=
[0]),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # verify partition size with par=
ted output<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D runCmd(&quot;export PART=
ED_SECTOR_SIZE=3D%d; parted -m %s unit b p&quot; % (4096, images[0]),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 stderr=3Dsubprocess.PIPE)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # parse parted output which look=
s like this:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # BYT;\n<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # /var/tmp/wic/build/tmpgjzzefdd=
-202410281021-sda.direct:78569472B:file:4096:4096:gpt::;\n<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # 1:139264B:39284735B:39145472B:=
ext4:rofs-a:;\n<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # 2:39284736B:78430207B:39145472=
B:ext4:primary:;\n<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0disk_info =3D res.output.sp=
litlines()[1]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check sector sizes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sector_size_logical =3D int=
(disk_info.split(&quot;:&quot;)[3])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sector_size_physical =3D in=
t(disk_info.split(&quot;:&quot;)[4])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(wic_sector_size=
, sector_size_logical, &quot;Logical sector size is not %d.&quot; % wic_sec=
tor_size)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(wic_sector_size=
, sector_size_physical, &quot;Physical sector size is not %d.&quot; % wic_s=
ector_size)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(4096, sector_si=
ze_logical, &quot;Logical sector size is not 4096.&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(4096, sector_si=
ze_physical, &quot;Physical sector size is not 4096.&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0finally:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.environ[&#39;PATH&#39;] =
=3D oldpath<br>
diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py<br>
index 9d596be3a723..7753f431f91d 100644<br>
--- a/scripts/lib/wic/engine.py<br>
+++ b/scripts/lib/wic/engine.py<br>
@@ -224,7 +224,7 @@ def wic_list(args, scripts_path):<br>
<br>
<br>
=C2=A0class Disk:<br>
-=C2=A0 =C2=A0 def __init__(self, imagepath, native_sysroot, fstypes=3D(&#3=
9;fat&#39;, &#39;ext&#39;)):<br>
+=C2=A0 =C2=A0 def __init__(self, imagepath, native_sysroot, fstypes=3D(&#3=
9;fat&#39;, &#39;ext&#39;), sector_size=3D512):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.imagepath =3D imagepath<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.native_sysroot =3D native_sysroot<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.fstypes =3D fstypes<br>
@@ -233,16 +233,7 @@ class Disk:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._lsector_size =3D None<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._psector_size =3D None<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._ptable_format =3D None<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # define sector size<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sector_size_str =3D get_bitbake_var(&#39;WIC_S=
ECTOR_SIZE&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if sector_size_str is not None:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sector_size =
=3D int(sector_size_str)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except ValueError:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sector_size =
=3D None<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sector_size =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sector_size =3D sector_size<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# find parted<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# read paths from $PATH environment varia=
ble<br>
@@ -271,7 +262,7 @@ class Disk:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self._partitions is None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._partitions =3D Ordere=
dDict()<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.sector_size is not None:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.sector_size:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0out =3D exec_=
cmd(&quot;export PARTED_SECTOR_SIZE=3D%d; %s -sm %s unit B print&quot; % \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (self.sector_size, self.parted, self.imagepath), T=
rue)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
@@ -312,11 +303,15 @@ class Disk:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise WicError(&quot;Partit=
ion %s is not in the image&quot; % pnum)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part =3D self.partitions[pnum]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# check if fstype is supported<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # NOTE: parted is unable to identify dos-type =
partitions with a 4k sector-size<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0if the type is emp=
ty and a non-default sector size is used, assume &#39;fat&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0fdisk identifies t=
hem without issue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 part_fstype =3D part.fstype if part.fstype or =
self.sector_size =3D=3D 512 else &#39;fat&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for fstype in self.fstypes:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if part.fstype.startswith(fstype=
):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if part_fstype.startswith(fstype=
):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise WicError(&quot;Not support=
ed fstype: {}&quot;.format(part.fstype))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise WicError(&quot;Not support=
ed fstype: {}&quot;.format(part_fstype))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if pnum not in self._partimages:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpf =3D tempfile.NamedTemp=
oraryFile(prefix=3D&quot;wic-part&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dst_fname =3D <a href=3D"ht=
tp://tmpf.name" rel=3D"noreferrer" target=3D"_blank">tmpf.name</a><br>
@@ -586,8 +581,9 @@ class Disk:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D part.get(&quot;name&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label_str =3D &quot;-n {}&quot;.format(label=
) if label else &#39;&#39;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;{} {} -C {} {}&quot;.format(self.mkd=
osfs, label_str, partfname,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 part[&#39;size&#39;=
])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 sector_str =3D &quot;-S {}&quot;.format(self.secto=
r_size) if self.sector_size else &#39;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;{} {} {} -C {} {}&quot;.format(self.=
mkdosfs, label_str, sector_str, partfname,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part[&=
#39;size&#39;])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_cmd(cmd)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# copy content from the temporary directory =
to the new partition<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D &quot;{} -snompi {} {}/* ::&quot;.fo=
rmat(self.mcopy, partfname, tmpdir)<br>
@@ -609,14 +605,19 @@ class Disk:<br>
<br>
=C2=A0def wic_ls(args, native_sysroot):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;List contents of partitioned image or=
 vfat partition.&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 disk =3D Disk(args.path.image, native_sysroot)<br>
+=C2=A0 =C2=A0 disk =3D Disk(args.path.image, native_sysroot, sector_size=
=3Dargs.sector_size)<br>
=C2=A0 =C2=A0 =C2=A0if not args.path.part:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if disk.partitions:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(&#39;Num=C2=A0 =C2=A0=
 =C2=A0Start=C2=A0 =C2=A0 =C2=A0 =C2=A0 End=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Size=C2=A0 =C2=A0 =C2=A0 Fstype&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for part in disk.partitions=
.values():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # size values are =
in bytes from parted; convert to sectors if a custom sector size was reques=
ted<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 display_size =3D p=
art.size<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if args.sector_siz=
e and args.sector_size !=3D disk._lsector_size:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disp=
lay_size =3D part.size // args.sector_size<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(&quot;{=
:2d}=C2=A0 {:12d} {:12d} {:12d}=C2=A0 {}&quot;.format(\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 part.pnum, part.start, part.end,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 part.size, part.fstype))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 part.pnum, part.start // args.sector_size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 part.end // args.sector_size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 display_size, part.fstype))<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D args.path.path or &#39;/&#39;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(disk.dir(args.path.part, path))<br>
@@ -627,9 +628,9 @@ def wic_cp(args, native_sysroot):<br>
=C2=A0 =C2=A0 =C2=A0partitioned image.<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0if isinstance(args.dest, str):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk =3D Disk(args.src.image, native_sysroot)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk =3D Disk(args.src.image, native_sysroot, =
sector_size=3Dargs.sector_size)<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk =3D Disk(args.dest.image, native_sysroot)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk =3D Disk(args.dest.image, native_sysroot,=
 sector_size=3Dargs.sector_size)<br>
=C2=A0 =C2=A0 =C2=A0disk.copy(args.src, args.dest)<br>
<br>
<br>
@@ -638,7 +639,7 @@ def wic_rm(args, native_sysroot):<br>
=C2=A0 =C2=A0 =C2=A0Remove files or directories from the vfat partition of<=
br>
=C2=A0 =C2=A0 =C2=A0partitioned image.<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 disk =3D Disk(args.path.image, native_sysroot)<br>
+=C2=A0 =C2=A0 disk =3D Disk(args.path.image, native_sysroot, sector_size=
=3Dargs.sector_size)<br>
=C2=A0 =C2=A0 =C2=A0disk.remove(args.path.part, args.path.path, args.recurs=
ive_delete)<br>
<br>
=C2=A0def wic_write(args, native_sysroot):<br>
diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py<br>
index 6b49a67de938..5d7c40456a80 100644<br>
--- a/scripts/lib/wic/help.py<br>
+++ b/scripts/lib/wic/help.py<br>
@@ -118,7 +118,7 @@ wic_create_usage =3D &quot;&quot;&quot;<br>
=C2=A0 usage: wic create &lt;wks file or image name&gt; [-o &lt;DIRNAME&gt;=
 | --outdir &lt;DIRNAME&gt;]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[-e | --image-name] [-s, --=
skip-build-check] [-D, --debug]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[-r, --rootfs-dir] [-b, --b=
ootimg-dir]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [-k, --kernel-dir] [-n, --native=
-sysroot] [-f, --build-rootfs]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [-k, --kernel-dir] [-n, --native=
-sysroot] [--sector-size &lt;bytes&gt;] [-f, --build-rootfs]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[-c, --compress-with] [-m, =
--bmap]<br>
<br>
=C2=A0 This command creates an OpenEmbedded image based on the &#39;OE kick=
start<br>
@@ -139,13 +139,16 @@ SYNOPSIS<br>
=C2=A0 =C2=A0 =C2=A0wic create &lt;wks file or image name&gt; [-o &lt;DIRNA=
ME&gt; | --outdir &lt;DIRNAME&gt;]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[-e | --image-name] [-s, --skip-build-che=
ck] [-D, --debug]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[-r, --rootfs-dir] [-b, --bootimg-dir]<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 [-k, --kernel-dir] [-n, --native-sysroot] [-f,=
 --build-rootfs]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [-k, --kernel-dir] [-n, --native-sysroot] [--s=
ector-size &lt;bytes&gt;] [-f, --build-rootfs]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[-c, --compress-with] [-m, --bmap] [--no-=
fstab-update]<br>
<br>
=C2=A0DESCRIPTION<br>
=C2=A0 =C2=A0 =C2=A0This command creates an OpenEmbedded image based on the=
 &#39;OE<br>
=C2=A0 =C2=A0 =C2=A0kickstart commands&#39; found in the &lt;wks file&gt;.<=
br>
<br>
+=C2=A0 =C2=A0 Use the --sector-size option to select the sector size (in b=
ytes)<br>
+=C2=A0 =C2=A0 used for partition layout calculations (default is 512).<br>
+<br>
=C2=A0 =C2=A0 =C2=A0In order to do this, wic needs to know the locations of=
 the<br>
=C2=A0 =C2=A0 =C2=A0various build artifacts required to build the image.<br=
>
<br>
@@ -278,7 +281,7 @@ wic_ls_usage =3D &quot;&quot;&quot;<br>
<br>
=C2=A0 List content of a partitioned image<br>
<br>
- usage: wic ls &lt;image&gt;[:&lt;partition&gt;[&lt;path&gt;]] [--native-s=
ysroot &lt;path&gt;]<br>
+ usage: wic ls &lt;image&gt;[:&lt;partition&gt;[&lt;path&gt;]] [--native-s=
ysroot &lt;path&gt;] [--sector-size &lt;bytes&gt;]<br>
<br>
=C2=A0 This command=C2=A0 outputs either list of image partitions or direct=
ory contents<br>
=C2=A0 of vfat and ext* partitions.<br>
@@ -296,7 +299,7 @@ SYNOPSIS<br>
=C2=A0 =C2=A0 =C2=A0wic ls &lt;image&gt;<br>
=C2=A0 =C2=A0 =C2=A0wic ls &lt;image&gt;:&lt;vfat or ext* partition&gt;<br>
=C2=A0 =C2=A0 =C2=A0wic ls &lt;image&gt;:&lt;vfat or ext* partition&gt;&lt;=
path&gt;<br>
-=C2=A0 =C2=A0 wic ls &lt;image&gt;:&lt;vfat or ext* partition&gt;&lt;path&=
gt; --native-sysroot &lt;path&gt;<br>
+=C2=A0 =C2=A0 wic ls &lt;image&gt;:&lt;vfat or ext* partition&gt;&lt;path&=
gt; --native-sysroot &lt;path&gt; [--sector-size &lt;bytes&gt;]<br>
<br>
=C2=A0DESCRIPTION<br>
=C2=A0 =C2=A0 =C2=A0This command lists either partitions of the image or di=
rectory contents<br>
@@ -336,6 +339,8 @@ DESCRIPTION<br>
<br>
=C2=A0 =C2=A0 =C2=A0The -n option is used to specify the path to the native=
 sysroot<br>
=C2=A0 =C2=A0 =C2=A0containing the tools(parted and mtools) to use.<br>
+=C2=A0 =C2=A0 The --sector-size option sets the sector size used for parti=
tion math<br>
+=C2=A0 =C2=A0 (default is 512 bytes).<br>
<br>
=C2=A0&quot;&quot;&quot;<br>
<br>
@@ -343,7 +348,7 @@ wic_cp_usage =3D &quot;&quot;&quot;<br>
<br>
=C2=A0 Copy files and directories to/from the vfat or ext* partition<br>
<br>
- usage: wic cp &lt;src&gt; &lt;dest&gt; [--native-sysroot &lt;path&gt;]<br=
>
+ usage: wic cp &lt;src&gt; &lt;dest&gt; [--native-sysroot &lt;path&gt;] [-=
-sector-size &lt;bytes&gt;]<br>
<br>
=C2=A0 source/destination image in format &lt;image&gt;:&lt;partition&gt;[&=
lt;path&gt;]<br>
<br>
@@ -364,7 +369,7 @@ SYNOPSIS<br>
=C2=A0 =C2=A0 =C2=A0wic cp &lt;src&gt; &lt;dest&gt;:&lt;partition&gt;<br>
=C2=A0 =C2=A0 =C2=A0wic cp &lt;src&gt;:&lt;partition&gt; &lt;dest&gt;<br>
=C2=A0 =C2=A0 =C2=A0wic cp &lt;src&gt; &lt;dest-image&gt;:&lt;partition&gt;=
&lt;path&gt;<br>
-=C2=A0 =C2=A0 wic cp &lt;src&gt; &lt;dest-image&gt;:&lt;partition&gt;&lt;p=
ath&gt; --native-sysroot &lt;path&gt;<br>
+=C2=A0 =C2=A0 wic cp &lt;src&gt; &lt;dest-image&gt;:&lt;partition&gt;&lt;p=
ath&gt; --native-sysroot &lt;path&gt; [--sector-size &lt;bytes&gt;]<br>
<br>
=C2=A0DESCRIPTION<br>
=C2=A0 =C2=A0 =C2=A0This command copies files or directories either<br>
@@ -408,13 +413,15 @@ DESCRIPTION<br>
<br>
=C2=A0 =C2=A0 =C2=A0The -n option is used to specify the path to the native=
 sysroot<br>
=C2=A0 =C2=A0 =C2=A0containing the tools(parted and mtools) to use.<br>
+=C2=A0 =C2=A0 The --sector-size option sets the sector size used for parti=
tion math<br>
+=C2=A0 =C2=A0 (default is 512 bytes).<br>
=C2=A0&quot;&quot;&quot;<br>
<br>
=C2=A0wic_rm_usage =3D &quot;&quot;&quot;<br>
<br>
=C2=A0 Remove files or directories from the vfat or ext* partitions<br>
<br>
- usage: wic rm &lt;image&gt;:&lt;partition&gt;&lt;path&gt; [--native-sysro=
ot &lt;path&gt;]<br>
+ usage: wic rm &lt;image&gt;:&lt;partition&gt;&lt;path&gt; [--native-sysro=
ot &lt;path&gt;] [--sector-size &lt;bytes&gt;]<br>
<br>
=C2=A0 This command=C2=A0 removes files or directories from the vfat or ext=
* partitions of<br>
=C2=A0 the partitioned image.<br>
@@ -466,6 +473,8 @@ DESCRIPTION<br>
<br>
=C2=A0 =C2=A0 =C2=A0The -n option is used to specify the path to the native=
 sysroot<br>
=C2=A0 =C2=A0 =C2=A0containing the tools(parted and mtools) to use.<br>
+=C2=A0 =C2=A0 The --sector-size option sets the sector size used for parti=
tion math<br>
+=C2=A0 =C2=A0 (default is 512 bytes).<br>
<br>
=C2=A0 =C2=A0 =C2=A0The -r option is used to remove directories and their c=
ontents<br>
=C2=A0 =C2=A0 =C2=A0recursively,this only applies to ext* partition.<br>
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py<br=
>
index 8fed686e903e..df6e3271649b 100644<br>
--- a/scripts/lib/wic/partition.py<br>
+++ b/scripts/lib/wic/partition.py<br>
@@ -65,6 +65,50 @@ class Partition():<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.lineno =3D lineno<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.source_file =3D &quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sector_size =3D 512<br>
+<br>
+=C2=A0 =C2=A0 def _mkdosfs_extraopts(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Build mkdosfs extra options ensuring the CLI s=
ector size is applied.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 extraopts =3D self.mkfs_extraopts or &#39;&#39=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tokens =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 skip_next =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for tok in extraopts.split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if skip_next:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 skip_next =3D Fals=
e<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tok =3D=3D &#39;-S&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 skip_next =3D True=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tok.startswith(&#39;-S&#39;):=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tokens.append(tok)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tokens.extend([&#39;-S&#39;, str(self.sector_s=
ize)])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39; &#39;.join(tokens).strip()<br>
+<br>
+=C2=A0 =C2=A0 def _mkfs_ext_extraopts(self, base_opts):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Build mkfs.ext* extra options ensuring the CLI=
 sector size is applied.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 extraopts =3D self.mkfs_extraopts or base_opts=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Only add an explicit block size when a non-d=
efault sector size is requested.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.sector_size and self.sector_size !=3D =
512:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tokens =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 skip_next =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for tok in extraopts.split():<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if skip_next:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 skip=
_next =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tok =3D=3D &#39=
;-b&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 skip=
_next =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tok.startswith(=
&#39;-b&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tokens.append(tok)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tokens.extend([&#39;-b&#39;, str=
(self.sector_size)])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39; &#39;.join(tokens).=
strip()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return extraopts<br>
<br>
=C2=A0 =C2=A0 =C2=A0def get_extra_block_count(self, current_blocks):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
@@ -138,6 +182,8 @@ class Partition():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Prepare content for individual partitions=
, depending on<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition command parameters.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # capture the sector size requested on the CLI=
 for mkdosfs invocations<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sector_size =3D getattr(creator, &#39;sec=
tor_size&#39;, 512) or 512<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.updated_fstab_path =3D updated_fstab=
_path<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.updated_fstab_path and not (self.=
fstype.startswith(&quot;ext&quot;) or self.fstype =3D=3D &quot;msdos&quot;)=
:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.update_fstab_in_rootfs=
 =3D True<br>
@@ -293,7 +339,7 @@ class Partition():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(rootfs, &#39;w&#39;) as sparse:=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.ftruncate(sparse.fileno(=
), rootfs_size * 1024)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 extraopts =3D self.mkfs_extraopts or &quot;-F =
-i 8192&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 extraopts =3D self._mkfs_ext_extraopts(&quot;-=
F -i 8192&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# use hash_seed to generate reproducible =
ext4 images<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(extraopts, pseudo) =3D self.get_hash_see=
d_ext4(extraopts, pseudo)<br>
@@ -401,7 +447,7 @@ class Partition():<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_str =3D &quot;&quot;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 extraopts =3D self.mkfs_extraopts or &#39;-S 5=
12&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 extraopts =3D self._mkdosfs_extraopts()<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dosfs_cmd =3D &quot;mkdosfs %s -i %s %s %=
s -C %s %d&quot; % \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(label_str, self.fsuuid, size_str, extraopts, rootfs,<br>
@@ -452,7 +498,7 @@ class Partition():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(rootfs, &#39;w&#39;) as sparse:=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.ftruncate(sparse.fileno(=
), size * 1024)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 extraopts =3D self.mkfs_extraopts or &quot;-i =
8192&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 extraopts =3D self._mkfs_ext_extraopts(&quot;-=
i 8192&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# use hash_seed to generate reproducible =
ext4 images<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(extraopts, pseudo) =3D self.get_hash_see=
d_ext4(extraopts, None)<br>
@@ -498,7 +544,7 @@ class Partition():<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_str =3D &quot;&quot;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 extraopts =3D self.mkfs_extraopts or &#39;-S 5=
12&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 extraopts =3D self._mkdosfs_extraopts()<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dosfs_cmd =3D &quot;mkdosfs %s -i %s %s %=
s -C %s %d&quot; % \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(label_str, self.fsuuid, extraopts, size_str, rootfs,<br>
@@ -559,4 +605,3 @@ class Partition():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0logger.warn(&quot;%s Inodes (of size %d) are too small.&quot; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(get_err_str(self), size))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
-<br>
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plu=
gins/imager/direct.py<br>
index ad922cfbf122..3adc6eee6280 100644<br>
--- a/scripts/lib/wic/plugins/imager/direct.py<br>
+++ b/scripts/lib/wic/plugins/imager/direct.py<br>
@@ -67,6 +67,7 @@ class DirectPlugin(ImagerPlugin):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._image =3D None<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.ptable_format =3D self.ks.bootloader=
.ptable<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.parts =3D self.ks.partitions<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sector_size =3D options.sector_size or 51=
2<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# as a convenience, set source to the boo=
t partition source<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# instead of forcing it to be set via boo=
tloader --source<br>
@@ -78,7 +79,7 @@ class DirectPlugin(ImagerPlugin):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image_path =3D self._full_path(self.workd=
ir, self.parts[0].disk, &quot;direct&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._image =3D PartitionedImage(image_pa=
th, self.ptable_format, self.ks.bootloader.diskid,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.par=
ts, self.native_sysroot,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options.e=
xtra_space)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options.e=
xtra_space, self.sector_size)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def setup_workdir(self, workdir):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if workdir:<br>
@@ -294,15 +295,13 @@ MBR_OVERHEAD =3D 1<br>
=C2=A0# Overhead of the GPT partitioning scheme<br>
=C2=A0GPT_OVERHEAD =3D 34<br>
<br>
-# Size of a sector in bytes<br>
-SECTOR_SIZE =3D 512<br>
-<br>
=C2=A0class PartitionedImage():<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0Partitioned image in a file.<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
<br>
-=C2=A0 =C2=A0 def __init__(self, path, ptable_format, disk_id, partitions,=
 native_sysroot=3DNone, extra_space=3D0):<br>
+=C2=A0 =C2=A0 def __init__(self, path, ptable_format, disk_id, partitions,=
 native_sysroot=3DNone, extra_space=3D0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sector_size=
=3D512):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.path =3D path=C2=A0 # Path to the im=
age file<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.numpart =3D 0=C2=A0 # Number of allo=
cated partitions<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.realpart =3D 0 # Number of partition=
s in the partition table<br>
@@ -332,14 +331,7 @@ class PartitionedImage():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.partitions =3D partitions<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.partimages =3D []<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Size of a sector used in calculations<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sector_size_str =3D get_bitbake_var(&#39;WIC_S=
ECTOR_SIZE&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if sector_size_str is not None:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sector_size =
=3D int(sector_size_str)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except ValueError:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sector_size =
=3D SECTOR_SIZE<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sector_size =3D SECTOR_SIZE=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sector_size =3D sector_size or 512<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.native_sysroot =3D native_sysroot<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0num_real_partitions =3D len([p for p in s=
elf.partitions if not p.no_table])<br>
diff --git a/scripts/lib/wic/plugins/source/bootimg_efi.py b/scripts/lib/wi=
c/plugins/source/bootimg_efi.py<br>
index 430b0a4b023a..864d6898fc9d 100644<br>
--- a/scripts/lib/wic/plugins/source/bootimg_efi.py<br>
+++ b/scripts/lib/wic/plugins/source/bootimg_efi.py<br>
@@ -415,8 +415,9 @@ class BootimgEFIPlugin(SourcePlugin):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D part.label if part.label else &=
quot;ESP&quot;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dosfs_cmd =3D &quot;mkdosfs -v -n %s -i %s -C =
%s %d&quot; % \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (lab=
el, part.fsuuid, bootimg, blocks)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sector_size =3D getattr(creator, &#39;sector_s=
ize&#39;, 512) or 512<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dosfs_cmd =3D &quot;mkdosfs -v -n %s -i %s -S =
%d -C %s %d&quot; % \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (lab=
el, part.fsuuid, sector_size, bootimg, blocks)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_native_cmd(dosfs_cmd, native_sysroot=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.debug(&quot;mkdosfs:\n%s&quot; % (=
str(out)))<br>
<br>
diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py b/scripts/lib=
/wic/plugins/source/bootimg_pcbios.py<br>
index a7cc5d12c620..32edac47fa09 100644<br>
--- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py<br>
+++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py<br>
@@ -132,7 +132,7 @@ class BootimgPcbiosPlugin(SourcePlugin):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cls._do_prepa=
re_grub(part, cr_workdir, oe_builddir,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel_dir, rootfs_dir, native=
_sysroot)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif source_params[&#39;loa=
der-bios&#39;] =3D=3D &#39;syslinux&#39;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls._do_prepare_sy=
slinux(part, cr_workdir, bootimg_dir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls._do_prepare_sy=
slinux(part, creator, cr_workdir, bootimg_dir,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel_dir, nati=
ve_sysroot)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise WicErro=
r(&quot;unrecognized bootimg_pcbios loader: %s&quot; % source_params[&#39;l=
oader-bios&#39;])<br>
@@ -142,7 +142,7 @@ class BootimgPcbiosPlugin(SourcePlugin):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except KeyError:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Required by do_install_di=
sk<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cls.loader =3D &#39;syslinu=
x&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls._do_prepare_syslinux(part, c=
r_workdir, bootimg_dir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls._do_prepare_syslinux(part, c=
reator, cr_workdir, bootimg_dir,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel_dir, native_sysroot)<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0@classmethod<br>
@@ -240,7 +240,7 @@ class BootimgPcbiosPlugin(SourcePlugin):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cfg.close()<br>
<br>
=C2=A0 =C2=A0 =C2=A0@classmethod<br>
-=C2=A0 =C2=A0 def _do_prepare_syslinux(cls, part, cr_workdir, bootimg_dir,=
<br>
+=C2=A0 =C2=A0 def _do_prepare_syslinux(cls, part, creator, cr_workdir, boo=
timg_dir,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_dir, native_sysroot):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Called to do the actual content populatio=
n for a partition i.e. it<br>
@@ -292,8 +292,9 @@ class BootimgPcbiosPlugin(SourcePlugin):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D part.label if part.label else &=
quot;boot&quot;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dosfs_cmd =3D &quot;mkdosfs -n %s -i %s -S 512=
 -C %s %d&quot; % \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (lab=
el, part.fsuuid, bootimg, blocks)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sector_size =3D getattr(creator, &#39;sector_s=
ize&#39;, 512) or 512<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dosfs_cmd =3D &quot;mkdosfs -n %s -i %s -S %d =
-C %s %d&quot; % \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (lab=
el, part.fsuuid, sector_size, bootimg, blocks)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_native_cmd(dosfs_cmd, native_sysroot=
)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mcopy_cmd =3D &quot;mcopy -i %s -s %s/* :=
:/&quot; % (bootimg, hdddir)<br>
diff --git a/scripts/lib/wic/plugins/source/isoimage_isohybrid.py b/scripts=
/lib/wic/plugins/source/isoimage_isohybrid.py<br>
index fdab188db1f8..9195ef5f3184 100644<br>
--- a/scripts/lib/wic/plugins/source/isoimage_isohybrid.py<br>
+++ b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py<br>
@@ -367,8 +367,9 @@ class IsoImagePlugin(SourcePlugin):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esp_label =3D source_params=
.get(&#39;esp_label&#39;, &#39;EFIimg&#39;)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dosfs_cmd =3D &#39;mkfs.vfat -n =
\&#39;%s\&#39; -S 512 -C %s %d&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 % (esp_label, bootimg, blocks)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sector_size =3D getattr(creator,=
 &#39;sector_size&#39;, 512) or 512<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dosfs_cmd =3D &quot;mkfs.vfat -n=
 &#39;%s&#39; -S %d -C %s %d&quot; % \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (esp_label, sector_size, bootimg, blocks)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_native_cmd(dosfs_cmd, =
native_sysroot)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mmd_cmd =3D &quot;mmd -i %s=
 ::/EFI&quot; % bootimg<br>
diff --git a/scripts/wic b/scripts/wic<br>
index 9137208f5e8f..0cef84ef630c 100755<br>
--- a/scripts/wic<br>
+++ b/scripts/wic<br>
@@ -376,6 +376,8 @@ def wic_init_parser_create(subparser):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0default=3D&quot;direct&quot;, help=3D&quot;the wic imager plugin&=
quot;)<br>
=C2=A0 =C2=A0 =C2=A0subparser.add_argument(&quot;--extra-space&quot;, type=
=3Dint, dest=3D&quot;extra_space&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0default=3D0, help=3D&quot;additional free disk space to add to th=
e image&quot;)<br>
+=C2=A0 =C2=A0 subparser.add_argument(&quot;--sector-size&quot;, dest=3D&qu=
ot;sector_size&quot;, type=3Dint, default=3D512,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 help=3D&quot;sector size in bytes (default: 512)&quot;)<br>
=C2=A0 =C2=A0 =C2=A0return<br>
<br>
<br>
@@ -413,6 +415,8 @@ def imgtype(arg):<br>
=C2=A0def wic_init_parser_ls(subparser):<br>
=C2=A0 =C2=A0 =C2=A0subparser.add_argument(&quot;path&quot;, type=3Dimgtype=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0help=3D&quot;image spec: &lt;image&gt;[:&lt;vfat partition=
&gt;[&lt;path&gt;]]&quot;)<br>
+=C2=A0 =C2=A0 subparser.add_argument(&quot;--sector-size&quot;, dest=3D&qu=
ot;sector_size&quot;, type=3Dint, default=3D512,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 help=3D&quot;sector size in bytes (default: 512)&quot;)<br>
=C2=A0 =C2=A0 =C2=A0subparser.add_argument(&quot;-n&quot;, &quot;--native-s=
ysroot&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0help=3D&quot;path to the native sysroot containing the too=
ls&quot;)<br>
=C2=A0 =C2=A0 =C2=A0subparser.add_argument(&quot;-e&quot;, &quot;--image-na=
me&quot;, dest=3D&quot;image_name&quot;,<br>
@@ -433,6 +437,8 @@ def wic_init_parser_cp(subparser):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0help=3D&quot;image spec: &lt;image&gt;:&lt;vfat partition&=
gt;[&lt;path&gt;] or &lt;file&gt;&quot;)<br>
=C2=A0 =C2=A0 =C2=A0subparser.add_argument(&quot;dest&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0help=3D&quot;image spec: &lt;image&gt;:&lt;vfat partition&=
gt;[&lt;path&gt;] or &lt;file&gt;&quot;)<br>
+=C2=A0 =C2=A0 subparser.add_argument(&quot;--sector-size&quot;, dest=3D&qu=
ot;sector_size&quot;, type=3Dint, default=3D512,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 help=3D&quot;sector size in bytes (default: 512)&quot;)<br>
=C2=A0 =C2=A0 =C2=A0subparser.add_argument(&quot;-n&quot;, &quot;--native-s=
ysroot&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0help=3D&quot;path to the native sysroot containing the too=
ls&quot;)<br>
=C2=A0 =C2=A0 =C2=A0subparser.add_argument(&quot;-e&quot;, &quot;--image-na=
me&quot;, dest=3D&quot;image_name&quot;,<br>
@@ -445,6 +451,8 @@ def wic_init_parser_cp(subparser):<br>
=C2=A0def wic_init_parser_rm(subparser):<br>
=C2=A0 =C2=A0 =C2=A0subparser.add_argument(&quot;path&quot;, type=3Dimgpath=
type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0help=3D&quot;path: &lt;image&gt;:&lt;vfat partition&gt;&lt=
;path&gt;&quot;)<br>
+=C2=A0 =C2=A0 subparser.add_argument(&quot;--sector-size&quot;, dest=3D&qu=
ot;sector_size&quot;, type=3Dint, default=3D512,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 help=3D&quot;sector size in bytes (default: 512)&quot;)<br>
=C2=A0 =C2=A0 =C2=A0subparser.add_argument(&quot;-n&quot;, &quot;--native-s=
ysroot&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0help=3D&quot;path to the native sysroot containing the too=
ls&quot;)<br>
=C2=A0 =C2=A0 =C2=A0subparser.add_argument(&quot;-r&quot;, dest=3D&quot;rec=
ursive_delete&quot;, action=3D&quot;store_true&quot;, default=3DFalse,<br>
-- <br>
2.51.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#231176): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/231176" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/231176</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117833550/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117833550/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000009d2568064ae847fe--

