Return-Path: <haokexin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FBD5C54E4A
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 13:35:47 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.21924.1709904945695128729
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Mar 2024 05:35:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HVqcvuVf;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: haokexin@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e4d48a5823so643892b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 05:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709904945; x=1710509745; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uGe07jrwMUadA2MES/uNNcH+g7i6N8nf9MnchH2nEy8=;
        b=HVqcvuVfkg0Ovck4cCh9K4h2aBYvv0NFxFsPCVEPOHUFsNWHXmpGnbYLsAxQO0zmf8
         55RlakOKBtDRib6e8tbUuXGnWZJnDcCo23EyASF/pP+iPRZ/ykLhdR6dyuHkn1ztAyKF
         5RdURViqyf+m7FZe5bMCFfh2wJDXd8JvH8OFyS3iuiyY0dh7PjWz4C8iYlGmLycN2rE2
         hg6qH/VVrmL+OkbqYm5fQxio5eshEfszCuJr0RGNOyxwgDcux8zkpILy81GSNZ5Xwqhh
         j4w/Nl2BvxwRz/nMVvklIK4zSNcamYut58H/yjq+iUbVTtUNk5bp6dIGiy274Zqi7At3
         a0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709904945; x=1710509745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGe07jrwMUadA2MES/uNNcH+g7i6N8nf9MnchH2nEy8=;
        b=eCdgI9GBRj7Psglf8JbC/wxys8bPxrAO+aTpKHkKt+4e5rJrSvyya1Rkib1BUear13
         +nUM2qwO/XHVzCK/R83kKbpjqt2UNwFrOi4+vPfuT/6+zlucAxrd/ImxxeZY0BehDrYT
         JJ4hmSMofM6Y7qbyg0P01AyIRJkg8gLBx72AZHg7UkkFy2WalFfAg3LCif8/iiEUWhQs
         wlAiWpxi/kpmNjMyN8xHpkH2bbESBUuGmz6IlYCiUblQadB3hLArhx7jkhoVu3fKIRwC
         HCkOAZTrQ5ME5G+iBF35viLJ+r206Gq/bbG9kNimPoBbAxkR/allMr68wGTjgfhP2rHv
         my4w==
X-Forwarded-Encrypted: i=1; AJvYcCX5AZjoyhXo6I7BzqqjAQ8qF1fBXk8kTykLONkaxGJyNDaFnUx4WmJxxMmxWfSaw6ri1IwZklept1PN6HD4vttbay8Otl+6s7fNitMDMF/1YYv2Nu6ZffuW
X-Gm-Message-State: AOJu0YzoaeNy0wYCB+dBXsMWX535JwI0XTrRak4JXRACS5ZuxHm4eWiZ
	JIK492ro6qfKFHeecwEpl+XxcAjy22tdoJo2RrfCyZeQgS7c5FFeFTJBZcsoYKc=
X-Google-Smtp-Source: AGHT+IFvVi3JSTdtt+jSmNokiE1KSyiItrcebAOjMgpVM5mB/aPKFSCms8KC1GU9HhSEqwluDdKkug==
X-Received: by 2002:aa7:8d83:0:b0:6e4:fddf:c1d9 with SMTP id i3-20020aa78d83000000b006e4fddfc1d9mr17197363pfr.27.1709904944538;
        Fri, 08 Mar 2024 05:35:44 -0800 (PST)
Received: from pek-khao-d3 (unknown-105-121.windriver.com. [147.11.105.121])
        by smtp.gmail.com with ESMTPSA id j8-20020a62e908000000b006e48e64ef54sm9848670pfh.173.2024.03.08.05.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 05:35:43 -0800 (PST)
Date: Fri, 8 Mar 2024 21:35:39 +0800
From: Kevin Hao <haokexin@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/3] linux-yocto: for-test-only: fix parted
 ptest
Message-ID: <ZesUK4JntnaikkPb@pek-khao-d3>
References: <20240307193409.987235-1-bruce.ashfield@gmail.com>
 <CAOSpxdaskMSouQhV_FmfS==CnfQ5zikQQ4QwwA3RzqtM6dzrLg@mail.gmail.com>
 <CADkTA4NM7zk6kpWe3BENz2a4Fjqwkx+ECqbu6tvsoktHWC45RA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4N6m5BBvtfhI7pTe"
Content-Disposition: inline
In-Reply-To: <CADkTA4NM7zk6kpWe3BENz2a4Fjqwkx+ECqbu6tvsoktHWC45RA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 13:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196850


--4N6m5BBvtfhI7pTe
Content-Type: multipart/mixed; boundary="SLs9YoCyBVJuuaxG"
Content-Disposition: inline


--SLs9YoCyBVJuuaxG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2024 at 06:13:35PM -0500, Bruce Ashfield wrote:
> Adding Kevin,
>=20
> I'm not going to be able to debug this more for a week or so.
>=20
> The alternate ways to fix it would be to try that ubuntu patch (fixed
> for our tree), and / or see what else needs
> to be cherry picked to -stable to fix util-linux. It is likely just a
> return code difference to userspace when
> resizing is being done.
>=20
> Kevin: I'm not sure if Wind River is seeing this, but you might want to l=
ook
> into those ptests and see if they pass on your end.

A silly question, which branch are these three patches supposed to apply to?
I have tried the kirkstone branch, but it seems that they can't apply clean=
ly.
I also tried to manually apply the two kernel patches to the latest
linux-yocto/v5.15/standard/base branch, but they also can't be applied clea=
nly.
Am I miss something?

On the latest linux-yocto/v5.15/standard/base kernel, the parted ptest
does have three failures. Then I have tried the ubuntu kernel patch [1] whi=
ch is
mentioned in the previous discussion about this issue. This patch can apply=
 to
the linux-yocto/v5.15/standard/base cleanly and it indeed resolve the parted
failures, and I also don't find util-linux ptest failure after applying this
patch. I attached my logs.

[1] https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/jamm=
y/commit/?h=3Dmaster-next--2024.03.04-1&id=3Dc3032b60ff7b3948325b8f2bd688b9=
a74be3cfb9

Thanks,
Kevin

--SLs9YoCyBVJuuaxG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="parted.log"

START: ptest-runner
2024-03-08T13:02
BEGIN: /usr/lib/parted/ptest
make: Entering directory '/usr/lib/parted/ptest/tests'
PASS: help-version.sh
PASS: t0000-basic.sh
PASS: t0001-tiny.sh
PASS: t0010-script-no-ctrl-chars.sh
PASS: t0100-print.sh
PASS: t0101-print-empty.sh
PASS: t0200-gpt.sh
PASS: t0201-gpt.sh
PASS: t0202-gpt-pmbr.sh
PASS: t0203-gpt-tiny-device-abort.sh
PASS: t0203-gpt-shortened-device-primary-valid.sh
PASS: t0203-gpt-create-on-min-sized-device.sh
PASS: t0205-gpt-list-clobbers-pmbr.sh
PASS: t0206-gpt-print-with-corrupt-primary-clobbers-pmbr.sh
PASS: t0207-IEC-binary-notation.sh
PASS: t0208-mkpart-end-in-IEC.sh
PASS: t0209-gpt-pmbr_boot.sh
t0210-gpt-resized-partition-entry-array.sh: skipped test: this test requires Perl's Digest::CRC module
SKIP: t0210-gpt-resized-partition-entry-array.sh
t0211-gpt-rewrite-header.sh: skipped test: this test requires Perl's Digest::CRC module
SKIP: t0211-gpt-rewrite-header.sh
PASS: t0212-gpt-many-partitions.sh
PASS: t0213-mkpart-start-negative.sh
PASS: t0220-gpt-msftres.sh
PASS: t0250-gpt.sh
PASS: t0251-gpt-unicode.sh
PASS: t0280-gpt-corrupt.sh
PASS: t0281-gpt-grow.sh
PASS: t0282-gpt-move-backup.sh
PASS: t0283-overlap-partitions.sh
PASS: t0300-dos-on-gpt.sh
PASS: t0301-overwrite-gpt-pmbr.sh
PASS: t0350-mac-PT-increases-sector-size.sh
PASS: t0400-loop-clobber-infloop.sh
PASS: t0500-dup-clobber.sh
PASS: t0501-duplicate.sh
t1100-busy-label.sh: skipped test: you lack the scsi_debug kernel module
SKIP: t1100-busy-label.sh
t1101-busy-partition.sh: skipped test: you lack the scsi_debug kernel module
SKIP: t1101-busy-partition.sh
t1102-loop-label.sh: skipped test: you lack the scsi_debug kernel module
SKIP: t1102-loop-label.sh
PASS: t1104-remove-and-add-partition.sh
: no xfs support
: no nilfs2 support
: no ntfs support
: no hfsplus support
: no udf support
: no f2fs support
PASS: t1700-probe-fs.sh
t1701-rescue-fs.sh: skipped test: you lack the scsi_debug kernel module
SKIP: t1701-rescue-fs.sh
PASS: t2200-dos-label-recog.sh
PASS: t2201-pc98-label-recog.sh
PASS: t2300-dos-label-extended-bootcode.sh
t2310-dos-extended-2-sector-min-offset.sh: skipped test: you lack the scsi_debug kernel module
SKIP: t2310-dos-extended-2-sector-min-offset.sh
t2320-dos-extended-noclobber.sh: skipped test: you lack the scsi_debug kernel module
SKIP: t2320-dos-extended-noclobber.sh
PASS: t2400-dos-hfs-partition-type.sh
PASS: t2410-dos-udf-partition-type.sh
PASS: t2500-probe-corrupt-hfs.sh
t3000-resize-fs.sh: skipped test: mkfs.hfs: command not found
SKIP: t3000-resize-fs.sh
t3200-resize-partition.sh: skipped test: you lack the scsi_debug kernel module
SKIP: t3200-resize-partition.sh
t3200-type-change.sh: skipped test: you lack the scsi_debug kernel module
SKIP: t3200-type-change.sh
PASS: t3300-palo-prep.sh
PASS: t3310-flags.sh
PASS: t3400-whole-disk-FAT-partition.sh
PASS: t4000-sun-raid-type.sh
PASS: t4001-sun-vtoc.sh
t4100-msdos-partition-limits.sh: skipped test: this test requires XFS support
SKIP: t4100-msdos-partition-limits.sh
t4100-dvh-partition-limits.sh: skipped test: this test requires XFS support
SKIP: t4100-dvh-partition-limits.sh
PASS: t4100-msdos-starting-sector.sh
t4200-partprobe.sh: skipped test: This test requires an erasable device and you have not properly set the $DEVICE_TO_ERASE and $DEVICE_TO_ERASE_SIZE envvars.
SKIP: t4200-partprobe.sh
PASS: t4300-nilfs2-tiny.sh
PASS: t4301-nilfs2-badsb2.sh
PASS: t4302-nilfs2-lessbadsb2.sh
PASS: t5000-tags.sh
t6000-dm.sh: skipped test: no device-mapper support
SKIP: t6000-dm.sh
t6001-psep.sh: skipped test: no device-mapper support
SKIP: t6001-psep.sh
t6002-dm-busy.sh: skipped test: no device-mapper support
SKIP: t6002-dm-busy.sh
t6003-dm-hide.sh: skipped test: no device-mapper support
SKIP: t6003-dm-hide.sh
t6004-dm-many-partitions.sh: skipped test: no device-mapper support
SKIP: t6004-dm-many-partitions.sh
t6005-dm-uuid.sh: skipped test: no device-mapper support
SKIP: t6005-dm-uuid.sh
t6006-dm-512b-sectors.sh: skipped test: you lack the scsi_debug kernel module
SKIP: t6006-dm-512b-sectors.sh
t6100-mdraid-partitions.sh: skipped test: you lack the scsi_debug kernel module
SKIP: t6100-mdraid-partitions.sh
PASS: t7000-scripting.sh
PASS: t8000-loop.sh
PASS: t8001-loop-blkpg.sh
t9010-big-sector.sh: skipped test: you lack the scsi_debug kernel module
SKIP: t9010-big-sector.sh
t9020-alignment.sh: skipped test: you lack the scsi_debug kernel module
SKIP: t9020-alignment.sh
PASS: t9021-maxima.sh
PASS: t9022-one-unit-snap.sh
PASS: t9023-value-lt-one.sh
t9030-align-check.sh: skipped test: you lack the scsi_debug kernel module
SKIP: t9030-align-check.sh
t9040-many-partitions.sh: skipped test: you lack the scsi_debug kernel module
SKIP: t9040-many-partitions.sh
t9041-undetected-in-use-16th-partition.sh: skipped test: you lack the scsi_debug kernel module
SKIP: t9041-undetected-in-use-16th-partition.sh
t9042-dos-partition-limit.sh: skipped test: you lack the scsi_debug kernel module
SKIP: t9042-dos-partition-limit.sh
PASS: t9050-partition-table-types.sh
============================================================================
Testsuite summary for GNU parted 3.4
============================================================================
# TOTAL: 85
# PASS:  57
# SKIP:  28
# XFAIL: 0
# FAIL:  0
# XPASS: 0
# ERROR: 0
============================================================================
make: Leaving directory '/usr/lib/parted/ptest/tests'
DURATION: 11
END: /usr/lib/parted/ptest
2024-03-08T13:02
STOP: ptest-runner
TOTAL: 1 FAIL: 0

--SLs9YoCyBVJuuaxG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="util-linux.log"
Content-Transfer-Encoding: quoted-printable

START: ptest-runner
2024-03-08T13:03
BEGIN: /usr/lib/util-linux/ptest
Stopping udevd
=2E/tests/run.sh: line 169: /usr/lib/util-linux/ptest/tests/../meson.conf: =
No such file or directory

-------------------- util-linux regression tests --------------------

                    For development purpose only.                   =20
                 Don't execute on production system!                =20

       kernel: 5.15.150-yocto-standard+         =20

      options: --use-system-commands \
               --parsable \
               --show-diff \
               --srcdir=3D/usr/lib/util-linux/ptest/tests/.. \
               --builddir=3D/usr/lib/util-linux/ptest/tests/..

PASS:        bitops: swap bytes                                  =20
PASS:    blkdiscard: offsets                                     =20
SKIP:         blkid: DM error                                      (missing=
 in PATH: dmsetup)
PASS:         blkid: superblocks probing: [01] adaptec-raid      =20
PASS:         blkid: superblocks probing: [02] bcache-B          =20
PASS:         blkid: superblocks probing: [03] bcache-C          =20
PASS:         blkid: superblocks probing: [04] befs              =20
PASS:         blkid: superblocks probing: [05] bfs               =20
PASS:         blkid: superblocks probing: [06] bluestore         =20
PASS:         blkid: superblocks probing: [07] cramfs            =20
PASS:         blkid: superblocks probing: [08] ddf-raid          =20
PASS:         blkid: superblocks probing: [09] drbd-v08          =20
PASS:         blkid: superblocks probing: [10] drbd-v09          =20
PASS:         blkid: superblocks probing: [11] drbdmanage-control-volume
PASS:         blkid: superblocks probing: [12] erofs             =20
PASS:         blkid: superblocks probing: [13] exfat             =20
PASS:         blkid: superblocks probing: [14] ext2              =20
PASS:         blkid: superblocks probing: [15] ext3              =20
PASS:         blkid: superblocks probing: [16] f2fs              =20
PASS:         blkid: superblocks probing: [17] fat               =20
PASS:         blkid: superblocks probing: [18] fat16_noheads     =20
PASS:         blkid: superblocks probing: [19] fat32_cp850_O_tilde
PASS:         blkid: superblocks probing: [20] fat32_label_64MB  =20
PASS:         blkid: superblocks probing: [21] fat32_mkdosfs_label1
PASS:         blkid: superblocks probing: [22] fat32_mkdosfs_label1_dosfsla=
bel_NO_NAME
PASS:         blkid: superblocks probing: [23] fat32_mkdosfs_label1_dosfsla=
bel_empty
PASS:         blkid: superblocks probing: [24] fat32_mkdosfs_label1_dosfsla=
bel_label2
PASS:         blkid: superblocks probing: [25] fat32_mkdosfs_label1_mlabel_=
NO_NAME
PASS:         blkid: superblocks probing: [26] fat32_mkdosfs_label1_mlabel_=
erase
PASS:         blkid: superblocks probing: [27] fat32_mkdosfs_label1_xp_erase
PASS:         blkid: superblocks probing: [28] fat32_mkdosfs_label1_xp_labe=
l2
PASS:         blkid: superblocks probing: [29] fat32_mkdosfs_none=20
PASS:         blkid: superblocks probing: [30] fat32_mkdosfs_none_dosfslabe=
l_NO_NAME
PASS:         blkid: superblocks probing: [31] fat32_mkdosfs_none_dosfslabe=
l_label1
PASS:         blkid: superblocks probing: [32] fat32_mkdosfs_none_dosfslabe=
l_label1_xp_label2
PASS:         blkid: superblocks probing: [33] fat32_mkdosfs_none_xp_label1
PASS:         blkid: superblocks probing: [34] fat32_mkdosfs_none_xp_label1=
_dosfslabel_label2
PASS:         blkid: superblocks probing: [35] fat32_xp_label1   =20
PASS:         blkid: superblocks probing: [36] fat32_xp_none     =20
PASS:         blkid: superblocks probing: [37] fat32_xp_none_dosfslabel_lab=
el1
PASS:         blkid: superblocks probing: [38] fat32_xp_none_mlabel_label1
PASS:         blkid: superblocks probing: [39] gfs2              =20
PASS:         blkid: superblocks probing: [40] hfs               =20
PASS:         blkid: superblocks probing: [41] hfsplus           =20
PASS:         blkid: superblocks probing: [42] hpfs              =20
PASS:         blkid: superblocks probing: [43] hpt37x-raid       =20
PASS:         blkid: superblocks probing: [44] hpt45x-raid       =20
PASS:         blkid: superblocks probing: [45] iso-different-iso-joliet-lab=
el
PASS:         blkid: superblocks probing: [46] iso-joliet        =20
PASS:         blkid: superblocks probing: [47] iso-multi-genisoimage-0
PASS:         blkid: superblocks probing: [48] iso-multi-genisoimage-174
PASS:         blkid: superblocks probing: [49] iso-multi-genisoimage-348
PASS:         blkid: superblocks probing: [50] iso-rr-joliet     =20
PASS:         blkid: superblocks probing: [51] iso-unicode-long-label
PASS:         blkid: superblocks probing: [52] iso               =20
PASS:         blkid: superblocks probing: [53] isw-raid          =20
PASS:         blkid: superblocks probing: [54] jbd               =20
PASS:         blkid: superblocks probing: [55] jfs               =20
PASS:         blkid: superblocks probing: [56] jmicron-raid      =20
PASS:         blkid: superblocks probing: [57] lsi-raid          =20
PASS:         blkid: superblocks probing: [58] luks1             =20
PASS:         blkid: superblocks probing: [59] luks2             =20
PASS:         blkid: superblocks probing: [60] lvm2              =20
PASS:         blkid: superblocks probing: [61] mdraid            =20
PASS:         blkid: superblocks probing: [62] minix-BE          =20
PASS:         blkid: superblocks probing: [63] minix-LE          =20
PASS:         blkid: superblocks probing: [64] mpool             =20
PASS:         blkid: superblocks probing: [65] netware           =20
PASS:         blkid: superblocks probing: [66] nilfs2            =20
PASS:         blkid: superblocks probing: [67] ntfs              =20
PASS:         blkid: superblocks probing: [68] nvidia-raid       =20
PASS:         blkid: superblocks probing: [69] ocfs2             =20
PASS:         blkid: superblocks probing: [70] promise-raid      =20
PASS:         blkid: superblocks probing: [71] reiser3           =20
PASS:         blkid: superblocks probing: [72] reiser4           =20
PASS:         blkid: superblocks probing: [73] romfs             =20
PASS:         blkid: superblocks probing: [74] silicon-raid      =20
PASS:         blkid: superblocks probing: [75] small-fat32       =20
PASS:         blkid: superblocks probing: [76] swap0             =20
PASS:         blkid: superblocks probing: [77] swap1             =20
PASS:         blkid: superblocks probing: [78] tuxonice          =20
PASS:         blkid: superblocks probing: [79] ubi               =20
PASS:         blkid: superblocks probing: [80] ubifs             =20
PASS:         blkid: superblocks probing: [81] udf-bdr-2.60-nero =20
PASS:         blkid: superblocks probing: [82] udf-cd-mkudfiso-20100208
PASS:         blkid: superblocks probing: [83] udf-cd-nero-6     =20
PASS:         blkid: superblocks probing: [84] udf-hdd-macosx-2.60-4096
PASS:         blkid: superblocks probing: [85] udf-hdd-mkudffs-1.0.0-1
PASS:         blkid: superblocks probing: [86] udf-hdd-mkudffs-1.0.0-2
PASS:         blkid: superblocks probing: [87] udf-hdd-mkudffs-1.3-1
PASS:         blkid: superblocks probing: [88] udf-hdd-mkudffs-1.3-2
PASS:         blkid: superblocks probing: [89] udf-hdd-mkudffs-1.3-3
PASS:         blkid: superblocks probing: [90] udf-hdd-mkudffs-1.3-4
PASS:         blkid: superblocks probing: [91] udf-hdd-mkudffs-1.3-5
PASS:         blkid: superblocks probing: [92] udf-hdd-mkudffs-1.3-6
PASS:         blkid: superblocks probing: [93] udf-hdd-mkudffs-1.3-7
PASS:         blkid: superblocks probing: [94] udf-hdd-mkudffs-1.3-8
PASS:         blkid: superblocks probing: [95] udf-hdd-mkudffs-2.2
PASS:         blkid: superblocks probing: [96] udf-hdd-udfclient-0.7.5
PASS:         blkid: superblocks probing: [97] udf-hdd-udfclient-0.7.7
PASS:         blkid: superblocks probing: [98] udf-hdd-win7      =20
PASS:         blkid: superblocks probing: [99] udf-multi-mkudffs-0
PASS:         blkid: superblocks probing: [100] udf-multi-mkudffs-320
PASS:         blkid: superblocks probing: [101] udf-multi-mkudffs-640
PASS:         blkid: superblocks probing: [102] udf-multi-genisoimage-0
PASS:         blkid: superblocks probing: [103] udf-multi-genisoimage-417
PASS:         blkid: superblocks probing: [104] udf-multi-genisoimage-834
PASS:         blkid: superblocks probing: [105] udf              =20
PASS:         blkid: superblocks probing: [106] ufs              =20
PASS:         blkid: superblocks probing: [107] vdo              =20
PASS:         blkid: superblocks probing: [108] via-raid         =20
PASS:         blkid: superblocks probing: [109] vmfs             =20
PASS:         blkid: superblocks probing: [110] vmfs_volume      =20
PASS:         blkid: superblocks probing: [111] xfs-log          =20
PASS:         blkid: superblocks probing: [112] xfs-v5           =20
PASS:         blkid: superblocks probing: [113] xfs              =20
PASS:         blkid: superblocks probing: [114] zfs              =20
PASS:         blkid: superblocks probing: [115] zonefs           =20
        blkid: superblocks probing                           ... OK (all 11=
5 sub-tests PASSED)
PASS:         blkid: partitions probing: [01] atari-primary      =20
PASS:         blkid: partitions probing: [02] atari-xgm          =20
PASS:         blkid: partitions probing: [03] bsd                =20
PASS:         blkid: partitions probing: [04] dos+bsd            =20
PASS:         blkid: partitions probing: [05] gpt                =20
PASS:         blkid: partitions probing: [06] sgi                =20
PASS:         blkid: partitions probing: [07] sun                =20
        blkid: partitions probing                            ... OK (all 7 =
sub-tests PASSED)
        blkid: MD raid0 (whole-disks)                        ... KNOWN FAIL=
ED (blkid/md-raid0-whole)
SKIP:         blkid: MD raid1 (last partition)                     (missing=
 scsi_debug module (dry-run))
        blkid: MD raid1 (whole-disks)                        ... KNOWN FAIL=
ED (blkid/md-raid1-whole)
SKIP:     build-sys: config                                        (optiona=
l)
PASS:           cal: Year 2147483646: [01] 1m-month              =20
PASS:           cal: Year 2147483646: [02] 1s-month              =20
PASS:           cal: Year 2147483646: [03] 1mj-month             =20
PASS:           cal: Year 2147483646: [04] 1sj-month             =20
PASS:           cal: Year 2147483646: [05] 3m-month              =20
PASS:           cal: Year 2147483646: [06] 3s-month              =20
PASS:           cal: Year 2147483646: [07] 3mj-month             =20
PASS:           cal: Year 2147483646: [08] 3sj-month             =20
PASS:           cal: Year 2147483646: [09] 1m-year               =20
PASS:           cal: Year 2147483646: [10] 1s-year               =20
PASS:           cal: Year 2147483646: [11] 1mj-year              =20
PASS:           cal: Year 2147483646: [12] 1sj-year              =20
PASS:           cal: Year 2147483646: [13] 1mw-month             =20
PASS:           cal: Year 2147483646: [14] 1sw-month             =20
PASS:           cal: Year 2147483646: [15] 1mjw-month            =20
PASS:           cal: Year 2147483646: [16] 1sjw-month            =20
PASS:           cal: Year 2147483646: [17] 3mw-month             =20
PASS:           cal: Year 2147483646: [18] 3sw-month             =20
PASS:           cal: Year 2147483646: [19] 3mjw-month            =20
PASS:           cal: Year 2147483646: [20] 3sjw-month            =20
PASS:           cal: Year 2147483646: [21] 1mw-year              =20
PASS:           cal: Year 2147483646: [22] 1sw-year              =20
PASS:           cal: Year 2147483646: [23] 1mjw-year             =20
PASS:           cal: Year 2147483646: [24] 1sjw-year             =20
          cal: Year 2147483646                               ... OK (all 24=
 sub-tests PASSED)
PASS:           cal: color                                       =20
PASS:           cal: color with week numbers                     =20
PASS:           cal: January 1753: [01] m3w                      =20
PASS:           cal: January 1753: [02] 3w                       =20
          cal: January 1753                                  ... OK (all 2 =
sub-tests PASSED)
PASS:           cal: month: [01] 1m                              =20
PASS:           cal: month: [02] 1s                              =20
PASS:           cal: month: [03] 1mj                             =20
PASS:           cal: month: [04] 1sj                             =20
PASS:           cal: month: [05] 1mw                             =20
PASS:           cal: month: [06] 1sw                             =20
PASS:           cal: month: [07] 1mjw                            =20
PASS:           cal: month: [08] 1sjw                            =20
PASS:           cal: month: [09] 3m                              =20
PASS:           cal: month: [10] 3s                              =20
PASS:           cal: month: [11] 3mj                             =20
PASS:           cal: month: [12] 3sj                             =20
PASS:           cal: month: [13] 3mw                             =20
PASS:           cal: month: [14] 3sw                             =20
PASS:           cal: month: [15] 3mjw                            =20
PASS:           cal: month: [16] 3sjw                            =20
PASS:           cal: month: [17] Sn3                             =20
PASS:           cal: month: [18] Sn21                            =20
PASS:           cal: month: [19] Sn51                            =20
PASS:           cal: month: [20] Sn201                           =20
          cal: month                                         ... OK (all 20=
 sub-tests PASSED)
PASS:           cal: September 1752: [01] 1mw-month              =20
PASS:           cal: September 1752: [02] 1sw-month              =20
PASS:           cal: September 1752: [03] 1mjw-month             =20
PASS:           cal: September 1752: [04] 1sjw-month             =20
PASS:           cal: September 1752: [05] 3mw-month              =20
PASS:           cal: September 1752: [06] 3sw-month              =20
PASS:           cal: September 1752: [07] 3mjw-month             =20
PASS:           cal: September 1752: [08] 3sjw-month             =20
PASS:           cal: September 1752: [09] 1mw-year               =20
PASS:           cal: September 1752: [10] 1sw-year               =20
PASS:           cal: September 1752: [11] 1mjw-year              =20
PASS:           cal: September 1752: [12] 1sjw-year              =20
PASS:           cal: September 1752: [13] week-iso               =20
PASS:           cal: September 1752: [14] 1m-month               =20
PASS:           cal: September 1752: [15] 1s-month               =20
PASS:           cal: September 1752: [16] 1mj-month              =20
PASS:           cal: September 1752: [17] 1sj-month              =20
PASS:           cal: September 1752: [18] 3m-month               =20
PASS:           cal: September 1752: [19] 3s-month               =20
PASS:           cal: September 1752: [20] 3mj-month              =20
PASS:           cal: September 1752: [21] 3sj-month              =20
PASS:           cal: September 1752: [22] 1m-year                =20
PASS:           cal: September 1752: [23] 1s-year                =20
PASS:           cal: September 1752: [24] 1mj-year               =20
PASS:           cal: September 1752: [25] 1sj-year               =20
          cal: September 1752                                ... OK (all 25=
 sub-tests PASSED)
PASS:           cal: vertical: [01] 1mv                          =20
PASS:           cal: vertical: [02] 1sv                          =20
PASS:           cal: vertical: [03] 1mjv                         =20
PASS:           cal: vertical: [04] 1sjv                         =20
PASS:           cal: vertical: [05] 1mwv                         =20
PASS:           cal: vertical: [06] 1swv                         =20
PASS:           cal: vertical: [07] 1mjwv                        =20
PASS:           cal: vertical: [08] 1sjwv                        =20
PASS:           cal: vertical: [09] 3mv                          =20
PASS:           cal: vertical: [10] 3sv                          =20
PASS:           cal: vertical: [11] 3mjv                         =20
PASS:           cal: vertical: [12] 3sjv                         =20
PASS:           cal: vertical: [13] 3mwv                         =20
PASS:           cal: vertical: [14] 3swv                         =20
PASS:           cal: vertical: [15] 3mjwv                        =20
PASS:           cal: vertical: [16] 3sjwv                        =20
PASS:           cal: vertical: [17] vSn3                         =20
PASS:           cal: vertical: [18] vSn21                        =20
PASS:           cal: vertical: [19] vSn51                        =20
PASS:           cal: vertical: [20] vSn201                       =20
          cal: vertical                                      ... OK (all 20=
 sub-tests PASSED)
PASS:           cal: week number given as argument: [01] 3m-week40
PASS:           cal: week number given as argument: [02] 3s-week40
PASS:           cal: week number given as argument: [03] 3mj-week40
PASS:           cal: week number given as argument: [04] 3sj-week40
PASS:           cal: week number given as argument: [05] m-week40=20
PASS:           cal: week number given as argument: [06] s-week40=20
PASS:           cal: week number given as argument: [07] mj-week40
PASS:           cal: week number given as argument: [08] sj-week40
PASS:           cal: week number given as argument: [09] 3m-week40-color
PASS:           cal: week number given as argument: [10] 3mj-week40-color
PASS:           cal: week number given as argument: [11] 1m-week53
PASS:           cal: week number given as argument: [12] 1mj-week53
PASS:           cal: week number given as argument: [13] 3m-week53-color
PASS:           cal: week number given as argument: [14] 1m-week53-color
PASS:           cal: week number given as argument: [15] 1mj-week53-color
PASS:           cal: week number given as argument: [16] 3s-week54-color
PASS:           cal: week number given as argument: [17] 3m-week52-color
          cal: week number given as argument                 ... OK (all 17=
 sub-tests PASSED)
PASS:           cal: week number corner cases: [01] ymw          =20
PASS:           cal: week number corner cases: [02] ysw          =20
PASS:           cal: week number corner cases: [03] ymjw         =20
PASS:           cal: week number corner cases: [04] ysjw         =20
PASS:           cal: week number corner cases: [05] 3mw          =20
PASS:           cal: week number corner cases: [06] 3sw          =20
PASS:           cal: week number corner cases: [07] 3mjw         =20
PASS:           cal: week number corner cases: [08] 3sjw         =20
          cal: week number corner cases                      ... OK (all 8 =
sub-tests PASSED)
PASS:           cal: year: [01] ym                               =20
PASS:           cal: year: [02] ys                               =20
PASS:           cal: year: [03] ymj                              =20
PASS:           cal: year: [04] ysj                              =20
PASS:           cal: year: [05] ymw                              =20
PASS:           cal: year: [06] ysw                              =20
PASS:           cal: year: [07] ymjw                             =20
PASS:           cal: year: [08] ysjw                             =20
          cal: year                                          ... OK (all 8 =
sub-tests PASSED)
PASS:           col: io effects                                  =20
PASS:           col: multibyte input: [01] valid                 =20
PASS:           col: multibyte input: [02] invalid               =20
          col: multibyte input                               ... OK (all 2 =
sub-tests PASSED)
PASS:           col: newline handling                            =20
PASS:           col: options                                     =20
PASS:        colcrt: functional: [01] no-options                 =20
PASS:        colcrt: functional: [02] no-underlining             =20
PASS:        colcrt: functional: [03] half-lines                 =20
PASS:        colcrt: functional: [04] short-options              =20
       colcrt: functional                                    ... OK (all 4 =
sub-tests PASSED)
PASS:        colcrt: regressions: [01] crash1                    =20
PASS:        colcrt: regressions: [02] crash2                    =20
PASS:        colcrt: regressions: [03] hang1                     =20
       colcrt: regressions                                   ... OK (all 3 =
sub-tests PASSED)
PASS:         colrm: basic check                                 =20
PASS:        column: columnate: [01] fill-cols-80                =20
PASS:        column: columnate: [02] fill-cols-50                =20
PASS:        column: columnate: [03] fill-cols-250               =20
PASS:        column: columnate: [04] fill-rows-80                =20
PASS:        column: columnate: [05] fill-rows-50                =20
PASS:        column: columnate: [06] fill-rows-250               =20
       column: columnate                                     ... OK (all 6 =
sub-tests PASSED)
PASS:        column: invalid multibyte                           =20
PASS:        column: multiple files                              =20
PASS:        column: table: [01] default                         =20
PASS:        column: table: [02] output-separator                =20
PASS:        column: table: [03] input-separator                 =20
PASS:        column: table: [04] input-separator-space           =20
PASS:        column: table: [05] empty-lines                     =20
PASS:        column: table: [06] noempty-lines                   =20
PASS:        column: table: [07] long                            =20
PASS:        column: table: [08] hide                            =20
PASS:        column: table: [09] headers                         =20
PASS:        column: table: [10] truncate                        =20
PASS:        column: table: [11] right                           =20
PASS:        column: table: [12] wrap                            =20
PASS:        column: table: [13] order                           =20
PASS:        column: table: [14] tree                            =20
PASS:        column: table: [15] empty-column                    =20
PASS:        column: table: [16] empty-column-at-eol             =20
PASS:        column: table: [17] empty-column-at-eol2            =20
       column: table                                         ... OK (all 17=
 sub-tests PASSED)
SKIP:        cramfs: mkfs doubles                                  (mount: =
/usr/lib/util-linux/ptest/tests/output/cramfs/doubles-mnt: unknown filesyst=
em type 'cramfs'.)
PASS:        cramfs: fsck bad header: [01] nopad-4K-be           =20
PASS:        cramfs: fsck bad header: [02] nopad-4K-le           =20
PASS:        cramfs: fsck bad header: [03] pad-4K-be             =20
PASS:        cramfs: fsck bad header: [04] pad-4K-le             =20
PASS:        cramfs: fsck bad header: [05] pad-64K-be            =20
PASS:        cramfs: fsck bad header: [06] pad-64K-le            =20
       cramfs: fsck bad header                               ... OK (all 6 =
sub-tests PASSED)
PASS:        cramfs: fsck endianness                             =20
SKIP:        cramfs: mkfs checksums                                (mount: =
/usr/lib/util-linux/ptest/tests/output/cramfs/mkfs-mnt: unknown filesystem =
type 'cramfs'.)
PASS:        cramfs: mkfs endianness                             =20
PASS:         dmesg: colors                                      =20
PASS:         dmesg: levels                                      =20
PASS:         dmesg: decode                                      =20
PASS:         dmesg: delta                                       =20
PASS:         dmesg: facilities                                  =20
PASS:         dmesg: indentation                                 =20
SKIP:         eject: umount: [01] by-disk                          (missing=
 scsi_debug module (dry-run))
SKIP:         fdisk: align 512/4K                                  (missing=
 scsi_debug module (dry-run))
SKIP:         fdisk: align 512/4K +alignment_offset                (missing=
 scsi_debug module (dry-run))
SKIP:         fdisk: align 512/4K +MD                              (missing=
 scsi_debug module (dry-run))
PASS:         fdisk: align 512/512                               =20
SKIP:         fdisk: align 512/512 +topology                       (missing=
 scsi_debug module (dry-run))
PASS:         fdisk: nested BSD                                  =20
PASS:         fdisk: GPT                                         =20
PASS:         fdisk: gpt-resize                                  =20
PASS:         fdisk: MBR - id                                    =20
PASS:         fdisk: MBR - dos mode                              =20
PASS:         fdisk: MBR - non-dos mode: [01] empty-pt           =20
PASS:         fdisk: MBR - non-dos mode: [02] 1st-primary        =20
PASS:         fdisk: MBR - non-dos mode: [03] 1st-active         =20
PASS:         fdisk: MBR - non-dos mode: [04] 1st-primary-recreate
PASS:         fdisk: MBR - non-dos mode: [05] 2nd-primary        =20
PASS:         fdisk: MBR - non-dos mode: [06] extended           =20
PASS:         fdisk: MBR - non-dos mode: [07] logical            =20
PASS:         fdisk: MBR - non-dos mode: [08] logical-delete     =20
PASS:         fdisk: MBR - non-dos mode: [09] logical-recreate   =20
PASS:         fdisk: MBR - non-dos mode: [10] 1st-primary-delete =20
PASS:         fdisk: MBR - non-dos mode: [11] 1nd-primary-delete =20
PASS:         fdisk: MBR - non-dos mode: [12] extended-delete    =20
PASS:         fdisk: MBR - non-dos mode: [13] first-sector-at-end=20
        fdisk: MBR - non-dos mode                            ... OK (all 13=
 sub-tests PASSED)
PASS:         fdisk: MBR - sort                                  =20
PASS:         fdisk: invalid input tests                         =20
PASS:         fdisk: sunlabel tests                              =20
PASS:       fincore: count file contents in core                 =20
PASS:       findmnt: filter: [01] types                          =20
PASS:       findmnt: filter: [02] types-multi                    =20
PASS:       findmnt: filter: [03] types-neg                      =20
PASS:       findmnt: filter: [04] options                        =20
PASS:       findmnt: filter: [05] options-name                   =20
PASS:       findmnt: filter: [06] options-nameval                =20
PASS:       findmnt: filter: [07] options-nameval-neg            =20
PASS:       findmnt: filter: [08] options-nameval-multi          =20
PASS:       findmnt: filter: [09] options-neg                    =20
PASS:       findmnt: filter: [10] options-no                     =20
PASS:       findmnt: filter: [11] options-no-multi               =20
      findmnt: filter                                        ... OK (all 11=
 sub-tests PASSED)
PASS:       findmnt: outputs: [01] default                       =20
PASS:       findmnt: outputs: [02] kernel                        =20
PASS:       findmnt: outputs: [03] force-tree                    =20
PASS:       findmnt: outputs: [04] submounts                     =20
PASS:       findmnt: outputs: [05] messy-mountinfo               =20
      findmnt: outputs                                       ... OK (all 5 =
sub-tests PASSED)
PASS:       findmnt: target: [01] root                           =20
PASS:       findmnt: target: [02] non-root                       =20
      findmnt: target                                        ... OK (all 2 =
sub-tests PASSED)
PASS:          fsck: is mounted                                  =20
SKIP:       fuzzers: test_fdisk_script_fuzz                        (test_fd=
isk_script_fuzz not found)
SKIP:       fuzzers: test_last_fuzz                                (test_la=
st_fuzz not found)
SKIP:       fuzzers: test_mount_fuzz                               (test_mo=
unt_fuzz not found)
PASS:        getopt: basic                                       =20
PASS:        getopt: options: [01] alternative_option_clash      =20
PASS:        getopt: options: [02] alternative_option_long       =20
PASS:        getopt: options: [03] alternative_option_short      =20
PASS:        getopt: options: [04] invalid_getopt_option         =20
PASS:        getopt: options: [05] invocation_model_one          =20
PASS:        getopt: options: [06] invocation_model_three_as_one =20
PASS:        getopt: options: [07] invocation_model_two_as_one   =20
PASS:        getopt: options: [08] invocation_without_parameters =20
PASS:        getopt: options: [09] long_option_ambiguous_1       =20
PASS:        getopt: options: [10] longopts                      =20
PASS:        getopt: options: [11] name_option_long              =20
PASS:        getopt: options: [12] name_option_short             =20
PASS:        getopt: options: [13] quiet_option_long             =20
PASS:        getopt: options: [14] quiet_option_short            =20
PASS:        getopt: options: [15] quiet_output_option_long      =20
PASS:        getopt: options: [16] quiet_output_option_short     =20
PASS:        getopt: options: [17] same_long_short_options       =20
PASS:        getopt: options: [18] test_for_enhanced_getopt      =20
PASS:        getopt: options: [19] unknown_options               =20
PASS:        getopt: options: [20] unquoted_option_bash          =20
PASS:        getopt: options: [21] unquoted_option_tcsh          =20
PASS:        getopt: options: [22] weird_quoting_bash            =20
PASS:        getopt: options: [23] weird_quoting_tcsh            =20
PASS:        getopt: options: [24] compatible                    =20
PASS:        getopt: options: [25] sh                            =20
PASS:        getopt: options: [26] csh                           =20
PASS:        getopt: options: [27] no-arguments                  =20
PASS:        getopt: options: [28] posix_correctly               =20
PASS:        getopt: options: [29] non-option                    =20
       getopt: options                                       ... OK (all 29=
 sub-tests PASSED)
PASS:      hardlink: options: [01] orig                          =20
PASS:      hardlink: options: [02] dryrun                        =20
PASS:      hardlink: options: [03] nargs                         =20
PASS:      hardlink: options: [04] regex-escapes                 =20
PASS:      hardlink: options: [05] content                       =20
     hardlink: options                                       ... OK (all 5 =
sub-tests PASSED)
PASS:       hexdump: format-strings: [01] empty-format           =20
PASS:       hexdump: format-strings: [02] 1b_octal               =20
PASS:       hexdump: format-strings: [03] 1b_char                =20
PASS:       hexdump: format-strings: [04] canon                  =20
PASS:       hexdump: format-strings: [05] 2b_dec                 =20
PASS:       hexdump: format-strings: [06] 2b_octal               =20
PASS:       hexdump: format-strings: [07] 2b_hex                 =20
      hexdump: format-strings                                ... OK (all 7 =
sub-tests PASSED)
PASS:       hexdump: highlighting: [01] 1b_octal-1               =20
PASS:       hexdump: highlighting: [02] 1b_octal-2               =20
PASS:       hexdump: highlighting: [03] 1b_octal-3               =20
PASS:       hexdump: highlighting: [04] 1b_octal-4               =20
PASS:       hexdump: highlighting: [05] 1b_octal-5               =20
PASS:       hexdump: highlighting: [06] 1b_octal-6               =20
PASS:       hexdump: highlighting: [07] 1b_octal-7               =20
PASS:       hexdump: highlighting: [08] 1b_octal-8               =20
PASS:       hexdump: highlighting: [09] 1b_octal-9               =20
PASS:       hexdump: highlighting: [10] 1b_char-1                =20
PASS:       hexdump: highlighting: [11] 1b_char-2                =20
PASS:       hexdump: highlighting: [12] 1b_char-3                =20
PASS:       hexdump: highlighting: [13] canon-1                  =20
PASS:       hexdump: highlighting: [14] canon-2                  =20
PASS:       hexdump: highlighting: [15] 2b_dec-1                 =20
PASS:       hexdump: highlighting: [16] 2b_dec-2                 =20
PASS:       hexdump: highlighting: [17] 2b_dec-3                 =20
PASS:       hexdump: highlighting: [18] 2b_dec-4                 =20
PASS:       hexdump: highlighting: [19] 2b_dec-5                 =20
PASS:       hexdump: highlighting: [20] 2b_dec-6                 =20
PASS:       hexdump: highlighting: [21] 2b_dec-7                 =20
PASS:       hexdump: highlighting: [22] 2b_dec-8                 =20
PASS:       hexdump: highlighting: [23] 4b_dec-1                 =20
PASS:       hexdump: highlighting: [24] 4b_dec-2                 =20
PASS:       hexdump: highlighting: [25] 4b_dec-3                 =20
PASS:       hexdump: highlighting: [26] 4b_dec-4                 =20
PASS:       hexdump: highlighting: [27] 4b_dec-5                 =20
PASS:       hexdump: highlighting: [28] 4b_dec-6                 =20
PASS:       hexdump: highlighting: [29] 4b_dec-7                 =20
      hexdump: highlighting                                  ... OK (all 29=
 sub-tests PASSED)
SKIP:       hwclock: system to hw                                  (missing=
 in PATH: sntp)
PASS:          ipcs: headers                                     =20
PASS:          ipcs: limits overflow                             =20
PASS:          ipcs: basic limits                                =20
PASS:          ipcs: mk-rm-msg                                   =20
PASS:          ipcs: mk-rm-sem                                   =20
PASS:          ipcs: mk-rm-shm                                   =20
PASS:       isosize: print-size: [01] default_output             =20
PASS:       isosize: print-size: [02] sector_output              =20
PASS:       isosize: print-size: [03] divisor_output             =20
      isosize: print-size                                    ... OK (all 3 =
sub-tests PASSED)
PASS:          kill: all_processes                               =20
PASS:          kill: name_to_number                              =20
PASS:          kill: options                                     =20
PASS:          kill: print_pid                                   =20
PASS:          kill: queue                                       =20
SKIP:      libfdisk: GPT                                           (test_fd=
isk_gpt not found)
PASS:      libfdisk: mkpart: [01] mbr                            =20
PASS:      libfdisk: mkpart: [02] mbr-logic                      =20
PASS:      libfdisk: mkpart: [03] mbr-nopartno                   =20
PASS:      libfdisk: mkpart: [04] gpt                            =20
     libfdisk: mkpart                                        ... OK (all 4 =
sub-tests PASSED)
PASS:      libfdisk: mkpart-full: [01] mbr-primary               =20
PASS:      libfdisk: mkpart-full: [02] mbr-primary-nopartno      =20
PASS:      libfdisk: mkpart-full: [03] mbr-err-primary           =20
PASS:      libfdisk: mkpart-full: [04] mbr-err-nospace           =20
PASS:      libfdisk: mkpart-full: [05] mbr-logical               =20
PASS:      libfdisk: mkpart-full: [06] mbr-nopartno              =20
PASS:      libfdisk: mkpart-full: [07] mbr-err-logical           =20
PASS:      libfdisk: mkpart-full: [08] mbr-space-gap             =20
PASS:      libfdisk: mkpart-full: [09] gpt                       =20
PASS:      libfdisk: mkpart-full: [10] gpt-nopartno              =20
PASS:      libfdisk: mkpart-full: [11] gpt-err-overlap           =20
PASS:      libfdisk: mkpart-full: [12] gpt-partno-gap            =20
PASS:      libfdisk: mkpart-full: [13] gpt-space-gap             =20
     libfdisk: mkpart-full                                   ... OK (all 13=
 sub-tests PASSED)
SKIP:      libmount: context                                       (test no=
t compiled)
SKIP:      libmount: context-py                                    (pylibmo=
unt not compiled)
SKIP:      libmount: context (utab)                                (test no=
t compiled)
SKIP:      libmount: context-py (utab)                             (pylibmo=
unt not compiled)
SKIP:      libmount: debugging                                     (test no=
t compiled)
SKIP:      libmount: lock                                          (optiona=
l)
PASS:      libmount: losetup-loop: [01] file                     =20
PASS:      libmount: losetup-loop: [02] file-o-loop              =20
PASS:      libmount: losetup-loop: [03] dev-loop                 =20
PASS:      libmount: losetup-loop: [04] o-loop-val               =20
PASS:      libmount: losetup-loop: [05] reuse                    =20
PASS:      libmount: losetup-loop: [06] conflict                 =20
PASS:      libmount: losetup-loop: [07] o-loop-val-initialized   =20
PASS:      libmount: losetup-loop: [08] o-loop-val-conflict      =20
     libmount: losetup-loop                                  ... OK (all 8 =
sub-tests PASSED)
PASS:      libmount: loop overlay                                =20
SKIP:      libmount: options string                                (test no=
t compiled)
SKIP:      libmount: table diffs                                   (test no=
t compiled)
SKIP:      libmount: tab files                                     (test no=
t compiled)
SKIP:      libmount: tab files-py                                  (pylibmo=
unt not compiled)
SKIP:      libmount: tags                                          (test no=
t compiled)
SKIP:      libmount: tags-py                                       (pylibmo=
unt not compiled)
SKIP:      libmount: tab update                                    (test no=
t compiled)
SKIP:      libmount: tab update-py                                 (pylibmo=
unt not compiled)
SKIP:      libmount: utils                                         (test no=
t compiled)
PASS:  libsmartcols: fromfile: [01] tree                         =20
PASS:  libsmartcols: fromfile: [02] tree-json                    =20
PASS:  libsmartcols: fromfile: [03] tree-middle                  =20
PASS:  libsmartcols: fromfile: [04] tree-end                     =20
PASS:  libsmartcols: fromfile: [05] trunc                        =20
PASS:  libsmartcols: fromfile: [06] right                        =20
PASS:  libsmartcols: fromfile: [07] right-maxout                 =20
PASS:  libsmartcols: fromfile: [08] padding-default              =20
PASS:  libsmartcols: fromfile: [09] padding-maxout               =20
PASS:  libsmartcols: fromfile: [10] padding-minout               =20
PASS:  libsmartcols: fromfile: [11] strictwidth                  =20
PASS:  libsmartcols: fromfile: [12] noextremes                   =20
PASS:  libsmartcols: fromfile: [13] hidden                       =20
PASS:  libsmartcols: fromfile: [14] wrap                         =20
PASS:  libsmartcols: fromfile: [15] wrap-tree                    =20
PASS:  libsmartcols: fromfile: [16] wrapnl                       =20
PASS:  libsmartcols: fromfile: [17] wrapnl-tree                  =20
PASS:  libsmartcols: fromfile: [18] raw                          =20
PASS:  libsmartcols: fromfile: [19] export                       =20
PASS:  libsmartcols: fromfile: [20] column-separator             =20
 libsmartcols: fromfile                                      ... OK (all 20=
 sub-tests PASSED)
PASS:  libsmartcols: title                                       =20
PASS:        logger: errors: [01] kern_priority                  =20
PASS:        logger: errors: [02] kern_priority_numeric          =20
PASS:        logger: errors: [03] invalid_prio                   =20
PASS:        logger: errors: [04] rfc5424_exceed_size            =20
PASS:        logger: errors: [05] id_with_space                  =20
PASS:        logger: errors: [06] tag_with_space                 =20
PASS:        logger: errors: [07] tcp                            =20
PASS:        logger: errors: [08] multi-line                     =20
PASS:        logger: errors: [09] rfc5424_msgid_with_space       =20
PASS:        logger: errors: [10] invalid_socket                 =20
PASS:        logger: errors: [11] check_socket                   =20
       logger: errors                                        ... OK (all 11=
 sub-tests PASSED)
PASS:        logger: formats: [01] rfc3164                       =20
PASS:        logger: formats: [02] rfc5424_simple                =20
PASS:        logger: formats: [03] rfc5424_notime                =20
PASS:        logger: formats: [04] rfc5424_nohost                =20
PASS:        logger: formats: [05] rfc5424_msgid                 =20
PASS:        logger: formats: [06] octet_counting                =20
PASS:        logger: formats: [07] priorities                    =20
PASS:        logger: formats: [08] check_socket                  =20
       logger: formats                                       ... OK (all 8 =
sub-tests PASSED)
SKIP:        logger: journald                                      (unsuppo=
rted)
PASS:        logger: options: [01] simple                        =20
PASS:        logger: options: [02] log_pid                       =20
PASS:        logger: options: [03] log_pid_long                  =20
PASS:        logger: options: [04] log_pid_define                =20
PASS:        logger: options: [05] log_pid_no_arg                =20
PASS:        logger: options: [06] input_file_simple             =20
PASS:        logger: options: [07] input_file_empty_line         =20
PASS:        logger: options: [08] input_file_skip_empty         =20
PASS:        logger: options: [09] input_file_prio_prefix        =20
PASS:        logger: options: [10] check_socket                  =20
       logger: options                                       ... OK (all 10=
 sub-tests PASSED)
PASS:         login: islocal                                     =20
PASS:         login: defs                                        =20
PASS:          look: separator                                   =20
PASS:       losetup: losetup: [01] file-show                     =20
PASS:       losetup: losetup: [02] file-offset                   =20
PASS:       losetup: losetup: [03] file-sizelimit                =20
PASS:       losetup: losetup: [04] file-section                  =20
      losetup: losetup                                       ... OK (all 4 =
sub-tests PASSED)
SKIP:       losetup: losetup-blkdev                                (missing=
 scsi_debug module (dry-run))
SKIP:       losetup: losetup-loop                                  (missing=
 scsi_debug module (dry-run))
PASS:         lsblk: lsblk: [01] simple-lvm-basic                =20
PASS:         lsblk: lsblk: [02] simple-lvm-discard              =20
PASS:         lsblk: lsblk: [03] simple-lvm-rw                   =20
PASS:         lsblk: lsblk: [04] simple-lvm-state                =20
PASS:         lsblk: lsblk: [05] simple-lvm-topo                 =20
PASS:         lsblk: lsblk: [06] simple-lvm-vendor               =20
PASS:         lsblk: lsblk: [07] simple-lvm-zone                 =20
PASS:         lsblk: lsblk: [08] simple-nvme-basic               =20
PASS:         lsblk: lsblk: [09] simple-nvme-discard             =20
PASS:         lsblk: lsblk: [10] simple-nvme-rw                  =20
PASS:         lsblk: lsblk: [11] simple-nvme-state               =20
PASS:         lsblk: lsblk: [12] simple-nvme-topo                =20
PASS:         lsblk: lsblk: [13] simple-nvme-vendor              =20
PASS:         lsblk: lsblk: [14] simple-nvme-zone                =20
        lsblk: lsblk                                         ... OK (all 14=
 sub-tests PASSED)
PASS:         lscpu: lscpu: [01] armv7                           =20
PASS:         lscpu: lscpu: [02] ppc-qemu                        =20
PASS:         lscpu: lscpu: [03] ppc64-POWER7-64cpu              =20
PASS:         lscpu: lscpu: [04] ppc64-POWER7                    =20
PASS:         lscpu: lscpu: [05] s390-kvm                        =20
PASS:         lscpu: lscpu: [06] s390-lpar-drawer                =20
PASS:         lscpu: lscpu: [07] s390-lpar                       =20
PASS:         lscpu: lscpu: [08] s390-nested-virt                =20
PASS:         lscpu: lscpu: [09] s390-zvm                        =20
PASS:         lscpu: lscpu: [10] sparc64                         =20
PASS:         lscpu: lscpu: [11] vbox-win                        =20
PASS:         lscpu: lscpu: [12] vmware_fpe                      =20
PASS:         lscpu: lscpu: [13] x86_64-64cpu                    =20
PASS:         lscpu: lscpu: [14] x86_64-dell_e4310               =20
PASS:         lscpu: lscpu: [15] x86_64-epyc_7451                =20
        lscpu: lscpu                                         ... OK (all 15=
 sub-tests PASSED)
PASS:         lsmem: lsmem: [01] s390-zvm-6g                     =20
PASS:         lsmem: lsmem: [02] x86_64-16g                      =20
        lsmem: lsmem                                         ... OK (all 2 =
sub-tests PASSED)
PASS:          lsns: ownership and hierarchy                     =20
Error: Unknown device type.
SKIP:          lsns: NETNSID compare to ip-link                    (failed =
to initialize)
PASS:          lsns: NSFS for ip-netns-add                       =20
PASS:           md5: md5                                         =20
SKIP:         minix: mkfs fsck                                     (missing=
 in PATH: mkfs.minix)
SKIP:         minix: fsck images                                   (missing=
 in PATH: fsck.minix)
SKIP:         minix: mkfs mount                                    (missing=
 in PATH: mkfs.minix)
PASS:          misc: fallocate                                   =20
PASS:          misc: flock: [01] non-block                       =20
PASS:          misc: flock: [02] no-fork                         =20
PASS:          misc: flock: [03] shared                          =20
PASS:          misc: flock: [04] exclusive                       =20
PASS:          misc: flock: [05] timeout                         =20
         misc: flock: [06] time-check                        ... OK (diff 3=
 sec)
         misc: flock                                         ... OK (all 6 =
sub-tests PASSED)
PASS:          misc: ionice                                      =20
SKIP:          misc: line                                          (missing=
 in PATH: line)
PASS:          misc: mbsencode: [01] safe-ascii                  =20
PASS:          misc: mbsencode: [02] invalid-ascii               =20
         misc: mbsencode: [03] safe-utf8                     ... KNOWN FAIL=
ED (misc/mbsencode-safe-utf8)
         misc: mbsencode: [04] invalid-utf8                  ... KNOWN FAIL=
ED (misc/mbsencode-invalid-utf8)
         misc: mbsencode                                     ... KNOWN FAIL=
ED (2 from 4 sub-tests)
PASS:          misc: mcookie                                     =20
PASS:          misc: mountpoint: [01] default                    =20
PASS:          misc: mountpoint: [02] nofollow                   =20
PASS:          misc: mountpoint: [03] mutually-exclusive         =20
         misc: mountpoint                                    ... OK (all 3 =
sub-tests PASSED)
PASS:          misc: rev                                         =20
PASS:          misc: setarch: [01] options                       =20
PASS:          misc: setarch: [02] uname26                       =20
PASS:          misc: setarch: [03] uname26-version               =20
         misc: setarch                                       ... OK (all 3 =
sub-tests PASSED)
PASS:          misc: setsid                                      =20
PASS:          misc: strtosize                                   =20
PASS:          misc: swaplabel                                   =20
PASS:          misc: whereis                                     =20
PASS:          more: regexp                                      =20
PASS:          more: squeeze                                     =20
PASS:         mount: by devname                                  =20
PASS:         mount: fs lists: [01] one-type                     =20
PASS:         mount: fs lists: [02] more-types                   =20
PASS:         mount: fs lists: [03] more-types-fstab             =20
PASS:         mount: fs lists: [04] type-pattern                 =20
PASS:         mount: fs lists: [05] type-pattern-neg             =20
        mount: fs lists                                      ... OK (all 5 =
sub-tests PASSED)
SKIP:         mount: all (fstab)                                   (missing=
 scsi_debug module (dry-run))
PASS:         mount: broken fstab: [01] mount                    =20
PASS:         mount: broken fstab: [02] mount-all                =20
        mount: broken fstab                                  ... OK (all 2 =
sub-tests PASSED)
PASS:         mount: btrfs (fstab): [01] btrfs                   =20
PASS:         mount: btrfs (fstab): [02] auto                    =20
        mount: btrfs (fstab)                                 ... OK (all 2 =
sub-tests PASSED)
PASS:         mount: by devname (fstab)                          =20
PASS:         mount: by devname (fstab label)                    =20
PASS:         mount: by devname (fstab uuid)                     =20
PASS:         mount: by label (fstab)                            =20
PASS:         mount: by label (fstab devname)                    =20
PASS:         mount: by label (fstab uuid)                       =20
PASS:         mount: loop (fstab)                                =20
PASS:         mount: none                                        =20
PASS:         mount: by devname (fstab symlink)                  =20
PASS:         mount: by uuid (fstab)                             =20
PASS:         mount: by uuid (fstab devname)                     =20
PASS:         mount: by uuid (fstab label)                       =20
PASS:         mount: by label                                    =20
PASS:         mount: move                                        =20
PASS:         mount: regular file                                =20
PASS:         mount: remount                                     =20
SKIP:         mount: rlimit-fsize                                  (mtab un=
supported)
PASS:         mount: shared-subtree: [01] make-shared            =20
PASS:         mount: shared-subtree: [02] make-private           =20
PASS:         mount: shared-subtree: [03] make-unbindable        =20
PASS:         mount: shared-subtree: [04] bind-shared            =20
PASS:         mount: shared-subtree: [05] mount-private          =20
PASS:         mount: shared-subtree: [06] mount-private-ro       =20
        mount: shared-subtree                                ... OK (all 6 =
sub-tests PASSED)
PASS:         mount: call mount.<type>                           =20
SKIP:         mount: umount-all-targets                            (missing=
 scsi_debug module (dry-run))
SKIP:         mount: umount-recursive                              (missing=
 scsi_debug module (dry-run))
PASS:         mount: by uuid                                     =20
PASS:         namei: basic functionality                         =20
SKIP:         partx: partitions probing                            (missing=
 scsi_debug module (dry-run))
PASS:         partx: show images: [01] atari-primary             =20
PASS:         partx: show images: [02] atari-xgm                 =20
PASS:         partx: show images: [03] bsd                       =20
PASS:         partx: show images: [04] dos+bsd                   =20
PASS:         partx: show images: [05] gpt                       =20
PASS:         partx: show images: [06] sgi                       =20
PASS:         partx: show images: [07] sun                       =20
        partx: show images                                   ... OK (all 7 =
sub-tests PASSED)
SKIP:         paths: built-in                                      (optiona=
l)
PASS:        rename: basic check                                 =20
PASS:        rename: exit codes                                  =20
PASS:        rename: overwrite                                   =20
PASS:        rename: subdir check                                =20
PASS:        rename: symlink check                               =20
PASS:    schedutils: chrt: [01] fifo                             =20
PASS:    schedutils: chrt: [02] batch                            =20
PASS:    schedutils: chrt: [03] other                            =20
PASS:    schedutils: chrt: [04] rr                               =20
PASS:    schedutils: chrt: [05] idle                             =20
chrt: failed to set pid 0's policy: Invalid argument
chrt: failed to set pid 0's policy: Invalid argument
chrt: failed to set pid 0's policy: Invalid argument
   schedutils: chrt: [06] deadline                           ... KNOWN FAIL=
ED (schedutils/chrt-deadline)
Supported policies:
SCHED_OTHER min/max priority	: 0/0
SCHED_FIFO min/max priority	: 1/99
SCHED_RR min/max priority	: 1/99
SCHED_BATCH min/max priority	: 0/0
SCHED_IDLE min/max priority	: 0/0
SCHED_DEADLINE min/max priority	: 0/0
   schedutils: chrt                                          ... KNOWN FAIL=
ED (1 from 6 sub-tests)
PASS:    schedutils: chrt-non-user: [01] batch-vs-nice           =20
   schedutils: chrt-non-user                                 ... OK (all 1 =
sub-tests PASSED)
PASS:    schedutils: cpuset                                      =20
PASS:        script: buffering race                              =20
PASS:        script: options: [01] append                        =20
PASS:        script: options: [02] force                         =20
PASS:        script: options: [03] quiet                         =20
PASS:        script: options: [04] return                        =20
PASS:        script: options: [05] size                          =20
       script: options                                       ... OK (all 5 =
sub-tests PASSED)
PASS:        script: race conditions                             =20
PASS:        script: replay: [01] basic                          =20
PASS:        script: replay: [02] output                         =20
PASS:        script: replay: [03] input                          =20
PASS:        script: replay: [04] live                           =20
       script: replay                                        ... OK (all 4 =
sub-tests PASSED)
SKIP:        sfdisk: MBR                                           (missing=
 scsi_debug module (dry-run))
SKIP:        sfdisk: script                                        (missing=
 scsi_debug module (dry-run))
SKIP:        sfdisk: GPT                                           (missing=
 scsi_debug module (dry-run))
SKIP:        sfdisk: movedata                                      (missing=
 scsi_debug module (dry-run))
SKIP:        sfdisk: resize                                        (missing=
 scsi_debug module (dry-run))
SKIP:        sfdisk: script                                        (missing=
 scsi_debug module (dry-run))
SKIP:        sfdisk: wipe                                          (missing=
 scsi_debug module (dry-run))
PASS:          sha1: sha1                                        =20
PASS:        swapon: by devname                                  =20
PASS:        swapon: fix page size                               =20
PASS:        swapon: fix signature                               =20
PASS:        swapon: by label                                    =20
PASS:        swapon: by uuid                                     =20
           ul: basic tests                                   ... KNOWN FAIL=
ED (ul/basic)
           ul: ul                                            ... KNOWN FAIL=
ED (ul/ul)
PASS:          utmp: last: [01] nodns                            =20
         utmp: last                                          ... OK (all 1 =
sub-tests PASSED)
PASS:          utmp: last ipv6: [01] nodns                       =20
         utmp: last ipv6                                     ... OK (all 1 =
sub-tests PASSED)
PASS:          utmp: circle                                      =20
PASS:          utmp: subsecond                                   =20
PASS:          utmp: to binary                                   =20
PASS:          utmp: IPv6 to binary                              =20
PASS:          utmp: to text                                     =20
PASS:          utmp: IPv6 to text                                =20
PASS:          uuid: namespace                                   =20
PASS:          uuid: oids                                        =20
PASS:          uuid: uuid_parser                                 =20
PASS:          uuid: uuidd                                       =20
PASS:          uuid: uuidgen                                     =20
PASS:          uuid: uuidparse                                   =20
SKIP:        wipefs: wipefs                                        (missing=
 scsi_debug module (dry-run))

---------------------------------------------------------------------
  All 212 tests PASSED
---------------------------------------------------------------------
Starting udev
DURATION: 72
END: /usr/lib/util-linux/ptest
2024-03-08T13:04
STOP: ptest-runner
TOTAL: 1 FAIL: 0

--SLs9YoCyBVJuuaxG--

--4N6m5BBvtfhI7pTe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEHc6qFoLCZqgJD98Zk1jtMN6usXEFAmXrFCsACgkQk1jtMN6u
sXGdYAgAhMrT1mH6QV1wQaRSKyqI/cfZxLX4XA0KCf0rFxrmTR0qhPLVx+yXy8yr
UV0vnGlK7qckLVFalkJsAonMOvbYGvKS1V3Va7Vp835y/9uwy8Wpj3Hhw1a206F/
39nZyjbvEEnbHYohxyJ5psuAcVag9WmUDDgOHFBERiNU+uF696rU9G7HRyu2Hyfa
5vmVl9ZKHiO/CjotvtpwhW4iCGnMc5duk5bSpWBUp3PFbnicwpJU/BNGkxNyReUA
y/Lu0pMQc1jszQ9LHpycAkvVTg+RxxktCI5NClSa6Iz7onshsMHwoNbfTm9S28YE
yPcoVSJgHmeuRlFMorAK+KVmIYB7OA==
=E7YU
-----END PGP SIGNATURE-----

--4N6m5BBvtfhI7pTe--

