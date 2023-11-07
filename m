Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 964AAC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 14:56:24 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.12985.1699368976428166187
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 06:56:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hTrnjLoH;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c50305c5c4so82908861fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 06:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699368974; x=1699973774; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GhgTuzlJINO1OKmW/Oq1kGV5qpHi2+9S02LDuLsLIig=;
        b=hTrnjLoHqbb1e1cdE4HfE5jSsfU3bbI032HE7iEsEpq0OFhnULRekXpRECY0gckcw0
         66+f6ZH4SAnOWQnhFxl3OIoPhOs+kM51qhhnirJ5UEo+XOfwxeC0eO9qCSwfdPmGOZgc
         ocbbiewNvtNyARyh3o4mXSZA5yl1wZitaoFSl28aavpxpO49wlAcxg+6maV7MoBhUHd4
         T/pNWc7PF+BZjBhGMHu45BKEFWXvAOCl0E5oKO4TMwJ2P4vdGMGylU5jL3DZr5otYDCh
         YtqDo5e9nfVjASBYvkKLHmYtkK9WyBXIgFiyRPw2n9d39oa+tkhliXMG/XvFWa6xVpoF
         BfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699368974; x=1699973774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GhgTuzlJINO1OKmW/Oq1kGV5qpHi2+9S02LDuLsLIig=;
        b=mQ+H11vdqudO5mtxT/LGeWiZ/ZYHUIT2nIBll1z/dFYdSfuX65LXUtZJuCjDTEcgxW
         pTzdic+bz5NGFI9gSv9kWAsAjahKxDYLyjVU4Xeu3MhUipA+UB3/B/V6dI0DHy0sNPNa
         eT0VdtY/Ink9hPAvXLy1R6JRJ7JcwUFQDiza/KADTG5/3xg+nz5APrBDPx3s+1vxwyc1
         V+DS1eNCQbHLheftOOU6y6pgNpZuatTEHAmVTfPcMsL8T+/K/FNfs3id8c8K/947qYGU
         fft6aXsYyJiGnn0N7CDpK4Z4eE0hLk6myllazEUZGWPNZUJuA6IstJIwKr9HqDfGApev
         dVPA==
X-Gm-Message-State: AOJu0Yw5T3WuzJOIKgH1GcB9bOt22IDNHBhzgOI767NC2b/s8QoiTnWt
	NNqJAibcq31eFE8F5ztvZG/2yK7QDdIHgROXWqogAthB
X-Google-Smtp-Source: AGHT+IGy59buYtJKUB/zd6XbrPW/UoVZQna/OqVixG5uvegwLBQ8RWIs8RT4YWhgtIIVzpS4unaJNkZwkKGZRpQBomg=
X-Received: by 2002:a2e:be9a:0:b0:2c7:1c15:3909 with SMTP id
 a26-20020a2ebe9a000000b002c71c153909mr6860817ljr.13.1699368974266; Tue, 07
 Nov 2023 06:56:14 -0800 (PST)
MIME-Version: 1.0
References: <20231107145048.10436-1-andrey.popov@yadro.com>
In-Reply-To: <20231107145048.10436-1-andrey.popov@yadro.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 Nov 2023 15:56:02 +0100
Message-ID: <CANNYZj9yfxMw8EafTd8B-x9=vK1NTAF-NGB8CJqHoaxWsBsD8Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes/image-live: Add support for building
 EFI-bootable ISO images for architectures other than x86 and x86_64
To: Andrey Popov <andrey.popov@yadro.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 14:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190286

This begs the question. Should we drop syslinux usage altogether? It
hasn't been maintained for several years, and is unlikely to become
maintained again.

Alex

On Tue, 7 Nov 2023 at 15:51, Andrey Popov <andrey.popov@yadro.com> wrote:
>
> Since syslinux is only compatible with platforms that use x86-based
> CPUs, this change allows creation of bootable ISO images for other
> EFI-compatible platforms by replacing invocation of the isohybrid
> tool for those platforms with a python script that creates MBR
> partition table with a single entry that points to a bootable
> EFI image placed inside the ISO image.
>
> Signed-off-by: Andrey Popov <andrey.popov@yadro.com>
> ---
>  meta/classes-recipe/image-live.bbclass | 129 ++++++++++++++++++++++---
>  1 file changed, 115 insertions(+), 14 deletions(-)
>
> diff --git a/meta/classes-recipe/image-live.bbclass b/meta/classes-recipe/image-live.bbclass
> index 95dd44a..ac7fc1b 100644
> --- a/meta/classes-recipe/image-live.bbclass
> +++ b/meta/classes-recipe/image-live.bbclass
> @@ -2,15 +2,15 @@
>  #
>  # SPDX-License-Identifier: MIT
>
> -# Creates a bootable image using syslinux, your kernel and an optional
> +# Creates a bootable image using syslinux (for x86), your kernel and an optional
>  # initrd
>
>  #
>  # End result is two things:
>  #
> -# 1. A .hddimg file which is an msdos filesystem containing syslinux, a kernel,
> -# an initrd and a rootfs image. These can be written to harddisks directly and
> -# also booted on USB flash disks (write them there with dd).
> +# 1. A .hddimg file which is an msdos filesystem containing syslinux (for x86),
> +# a kernel, an initrd and a rootfs image. These can be written to harddisks
> +# directly and also booted on USB flash disks (write them there with dd).
>  #
>  # 2. A CD .iso image
>
> @@ -29,8 +29,10 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
>                          mtools-native:do_populate_sysroot \
>                          cdrtools-native:do_populate_sysroot \
>                          virtual/kernel:do_deploy \
> -                        ${MLPREFIX}syslinux:do_populate_sysroot \
> -                        syslinux-native:do_populate_sysroot \
> +                        ${@d.getVar('MLPREFIX') + 'syslinux:do_populate_sysroot \
> +                           syslinux-native:do_populate_sysroot' if __import__('re').match('i.86', d.getVar('TARGET_ARCH')) or \
> +                                                                   __import__('re').match('x86_64', d.getVar('TARGET_ARCH')) else \
> +                           'xorriso-native:do_populate_sysroot'} \
>                          ${@'%s:do_image_%s' % (d.getVar('PN'), d.getVar('LIVE_ROOTFS_TYPE').replace('-', '_')) if d.getVar('ROOTFS') else ''} \
>                          "
>
> @@ -71,14 +73,92 @@ MKISOFS_OPTIONS = "-no-emul-boot -boot-load-size 4 -boot-info-table"
>  BOOTIMG_VOLUME_ID   ?= "boot"
>  BOOTIMG_EXTRA_SPACE ?= "512"
>
> +def compute_chs(sector_z):
> +    C = int(sector_z / (63 * 255))
> +    H = int((sector_z % (63 * 255)) / 63)
> +    # convert zero-based sector to CHS format
> +    S = int(sector_z % 63) + 1
> +    # munge accord to partition table format
> +    S = (S & 0x3f) | (((C >> 8) & 0x3) << 6)
> +    C = (C & 0xFF)
> +    return (C, H, S)
> +
> +def mk_efi_part_table(iso, start, length):
> +    from struct import pack
> +
> +    # Compute starting and ending CHS addresses for the partition entry.
> +    (s_C, s_H, s_S) = compute_chs(start)
> +    (e_C, e_H, e_S) = compute_chs(start + length - 1)
> +
> +    # Write the 66 byte partition table to bytes 0x1BE through 0x1FF in
> +    # sector 0 of the .ISO.
> +    #
> +    # See the partition table format here:
> +    # http://en.wikipedia.org/wiki/Master_boot_record#Sector_layout
> +    f = open(iso, 'r+b')
> +    f.seek(0x1BE)
> +    f.write(pack("<8BLL48xH", 0x80, s_H, s_S, s_C,
> +                 0xEF, e_H, e_S, e_C, start, length, 0xAA55))
> +    f.close()
> +
> +def runtool(cmdln_or_args):
> +    import subprocess
> +
> +    if isinstance(cmdln_or_args, list):
> +        cmd = cmdln_or_args[0]
> +        shell = False
> +    else:
> +        import shlex
> +        cmd = shlex.split(cmdln_or_args)[0]
> +        shell = True
> +
> +    sout = subprocess.PIPE
> +    serr = subprocess.STDOUT
> +
> +    try:
> +        process = subprocess.Popen(cmdln_or_args, stdout=sout,
> +                                   stderr=serr, shell=shell)
> +        sout, serr = process.communicate()
> +        # combine stdout and stderr, filter None out and decode
> +        out = ''.join([out.decode('utf-8') for out in [sout, serr] if out])
> +    except OSError as err:
> +        bb.fatal("Cannot run command %s: %s" % (cmd, err))
> +
> +    return process.returncode, out
> +
> +def exec_cmd(cmd_and_args):
> +    args = cmd_and_args.split()
> +    ret, out = runtool(args)
> +    out = out.strip()
> +    if ret != 0:
> +        bb.fatal("exec_cmd: %s returned '%s' instead of 0\noutput: %s" % \
> +                 (cmd_and_args, ret, out))
> +    return ret, out
> +
> +def install_efi_part_table(iso_img):
> +    find_efi_img_cmd = "xorriso -indev %s -find /efi.img \
> +                        -name efi.img -exec report_lba --" % iso_img
> +    ret, out = exec_cmd(find_efi_img_cmd)
> +    efi_img_start = -1
> +    efi_img_length = -1
> +    for line in out.split("\n"):
> +        if "File data lba:" in line and "/efi.img" in line:
> +            file_stat = line[14:].split(',')
> +            efi_img_start = int(file_stat[1].strip()) * 4
> +            efi_img_length = int(int(file_stat[3].strip()) / 512)
> +            break
> +    if (efi_img_start < 0) or (efi_img_length < 0):
> +        bb.fatal("Failed to determine /efi.img attributes")
> +    mk_efi_part_table(iso_img, efi_img_start, efi_img_length)
> +
>  populate_live() {
> -    populate_kernel $1
> +       populate_kernel $1
>         if [ -s "${ROOTFS}" ]; then
>                 install -m 0644 ${ROOTFS} $1/rootfs.img
>         fi
>  }
>
> -build_iso() {
> +build_iso_base() {
>         # Only create an ISO if we have an INITRD and the live or iso image type was selected
>         if [ -z "${INITRD}" ] || [ "${@bb.utils.contains_any('IMAGE_FSTYPES', 'live iso', '1', '0', d)}" != "1" ]; then
>                 bbnote "ISO image will not be created."
> @@ -104,11 +184,13 @@ build_iso() {
>         fi
>
>         # EFI only
> -       if [ "${PCBIOS}" != "1" ] && [ "${EFI}" = "1" ] ; then
> -               # Work around bug in isohybrid where it requires isolinux.bin
> -               # In the boot catalog, even though it is not used
> -               mkdir -p ${ISODIR}/${ISOLINUXDIR}
> -               install -m 0644 ${STAGING_DATADIR}/syslinux/isolinux.bin ${ISODIR}${ISOLINUXDIR}
> +       if [ -n "$(echo ${TARGET_ARCH} | grep -e i.86)" ] || [ "${TARGET_ARCH}" = "x86_64" ]; then
> +               if [ "${PCBIOS}" != "1" ] && [ "${EFI}" = "1" ]; then
> +                       # Work around bug in isohybrid where it requires isolinux.bin
> +                       # In the boot catalog, even though it is not used
> +                       mkdir -p ${ISODIR}/${ISOLINUXDIR}
> +                       install -m 0644 ${STAGING_DATADIR}/syslinux/isolinux.bin ${ISODIR}${ISOLINUXDIR}
> +               fi
>         fi
>
>         # We used to have support for zisofs; this is a relic of that
> @@ -128,7 +210,15 @@ build_iso() {
>                 fi
>         fi
>
> -       if [ "${PCBIOS}" = "1" ] && [ "${EFI}" != "1" ] ; then
> +       if [ -z "$(echo ${TARGET_ARCH} | grep -e i.86)" ] && [ "${TARGET_ARCH}" != "x86_64" ]; then
> +               mkisofs -A ${BOOTIMG_VOLUME_ID} -V ${BOOTIMG_VOLUME_ID} \
> +                       -o ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso \
> +                       $mkisofs_compress_opts $mkisofs_iso_level \
> +                       ${ISODIR}
> +               return
> +       fi
> +
> +       if [ "${PCBIOS}" = "1" ] && [ "${EFI}" != "1" ]; then
>                 # PCBIOS only media
>                 mkisofs -V ${BOOTIMG_VOLUME_ID} \
>                         -o ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso \
> @@ -150,6 +240,17 @@ build_iso() {
>         isohybrid $isohybrid_args ${IMGDEPLOYDIR}/${IMAGE_NAME}.iso
>  }
>
> +python build_iso() {
> +    import re
> +
> +    bb.build.exec_func("build_iso_base", d)
> +    target_arch = d.getVar("TARGET_ARCH")
> +    if not re.match("i.86", target_arch) and not re.match("x86_64", target_arch) \
> +       and d.getVar("EFI") == "1":
> +        install_efi_part_table(d.getVar("IMGDEPLOYDIR") + "/" + \
> +                               d.getVar("IMAGE_NAME") + ".iso")
> +}
> +
>  build_fat_img() {
>         FATSOURCEDIR=$1
>         FATIMG=$2
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190285): https://lists.openembedded.org/g/openembedded-core/message/190285
> Mute This Topic: https://lists.openembedded.org/mt/102443878/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

