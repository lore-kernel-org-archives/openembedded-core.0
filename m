Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FE2C64ED6
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 16:25:10 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.27266.1677687908570603393
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 08:25:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N0gwE7Dp;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id by8so14561288ljb.7
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 08:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677687907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBnYzcWU9DwgNy10dyvufa0CF6fh4vKyrr0HCi8rHsU=;
        b=N0gwE7DpLbWgHfR1R5Be2YLD39zw4a9T2ctpuKjrGEKzUFalmuHT2En7eUPsbOfrtX
         hGG6Pjyg8Olkxa86geo7GkWrEyZar6IBDCHwvdgGzhVc+02TqHY46NacfAj3A550HHNk
         J44Vk9/dB3kSFQw0FnC25IHcr1+uIJepiQQaasyIDuttXuPjjyS4S7BNSVt3t5Hbmone
         jD7G2hyQZCPKevTZqGHL7P8oRgSGN5lDW05nwnWW3b8/MnGwRfxW57/S1fKzAhxDGrw8
         uPhR3J42RVuI58kVdWA864m5o19/0K60nDoapu2aVBtbl2MPR/wAIirMaMRuh57j02fE
         qs8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677687907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBnYzcWU9DwgNy10dyvufa0CF6fh4vKyrr0HCi8rHsU=;
        b=g/g5s68s1ochGl2jeVJeh4aZzasbCD7Nf2m71/rbOcxXNdS1Eyk/yykMql+eorcutB
         toEMl8fW1TI/jVwzj5824utiLySIyCHgYWYrfzFkX7nNNr58QrLdjj44BkDY+RB8denI
         2vo6F0BRXlxyS8PPRgMAzbM8aydcOETu/LcqkVjVC4gt2BG3KPxABkMVKZ3/H5jNYqR/
         J8uArLalmc+EvYsASSS146JbiHLfki8bvXVaJThYhXTrpqTXz9NWnUcYWgOWD0FL+kjl
         6wsat213cylyy3d+ASFISSEzmhNV4tCIqVY2uNNChpl0xp7ZbL5tKHsmm3UFVioy37Se
         aCBw==
X-Gm-Message-State: AO0yUKX62vU4h0Zill4wT2S5aVVYM0Rr+Nb9b/CXlDdq0GQ8EVZYVOer
	AWr7D2KlMAgM7+9MzYWpTddKt0ophFnQS3WYCOM=
X-Google-Smtp-Source: AK7set/+xoVc4RkLR4iPImx54WUmAwfU8+Rp+cCs5XAsgrL6AfuTCP9Ti+Lq8s9S8Kgp57lk+ueLCJd7yJFeqRF/+wg=
X-Received: by 2002:a05:651c:1307:b0:295:8c06:2501 with SMTP id
 u7-20020a05651c130700b002958c062501mr2234070lja.5.1677687906639; Wed, 01 Mar
 2023 08:25:06 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677593618.git.anna-lena.marx@inovex.de>
 <d6eaaa6541a496112bfbd82401bf94d031741e59.1677593618.git.anna-lena.marx@inovex.de>
 <Y/4b0dLAaxLcHKSc@mail.local> <CABFt5okSFyMcjJ506pgdu9jD00AFZco2XhNKQCRXUh8nQ_zPBA@mail.gmail.com>
In-Reply-To: <CABFt5okSFyMcjJ506pgdu9jD00AFZco2XhNKQCRXUh8nQ_zPBA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 1 Mar 2023 17:24:55 +0100
Message-ID: <CANNYZj_a4PrXBZHU_2y8=dXumVsV2Zz2PtNTL9aRG94sRkEeZw@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/1] wic: Add support for F2FS in WIC rootfs plugin
To: anna-lena.marx@inovex.de
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 16:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177945

If f2fs support requires recipes that are not available in oe-core, is
it possible to add that support (and tests) to the layer that has the
needed recipes, e.g. meta-filesystems? In general, we try to avoid
having things in oe-core that cannot be tested without adding other
layers.

Alex

On Wed, 1 Mar 2023 at 15:37, Anna-Lena Marx via lists.openembedded.org
<anna-lena.marx=3Dinovex.de@lists.openembedded.org> wrote:
>
> Hi,
>
> took me a while to reproduce the failure locally.
> It's because meta-oe and meta-filesystems are not as default included in =
the bblayers.conf used for oe-selftest.
>
> I don't want to touch bblayers and I think this is not intended as it wou=
ld be the same for e.g. erofs for which no test case was added.
> Alexander Kanavin pointed me on the poky mailing list to these tests and =
in fact, it's good to have them in general.
> So what's the preferred way for oe-core?
> Leave the tests and add the dependencies (for the specific tests) or just=
 remove the test cases?
>
> -- Anna
>
>
>
>
> Am Di., 28. Feb. 2023 um 16:20 Uhr schrieb Alexandre Belloni <alexandre.b=
elloni@bootlin.com>:
>>
>> Hello,
>>
>> this failed on the autobuilders:
>>
>> ERROR: Nothing PROVIDES 'f2fs-tools-native' (but /home/pokybuild/yocto-w=
orker/beaglebone/build/meta/recipes-sato/images/core-image-sato.bb, /home/p=
okybuild/yocto-worker/beaglebone/build/meta/recipes-sato/images/core-image-=
sato-sdk.bb, /home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-cor=
e/images/core-image-minimal.bb, /home/pokybuild/yocto-worker/beaglebone/bui=
ld/meta/recipes-core/images/core-image-minimal-dev.bb, /home/pokybuild/yoct=
o-worker/beaglebone/build/meta/recipes-core/images/core-image-ptest-all.bb =
DEPENDS on or otherwise requires it). Close matches:
>>   btrfs-tools-native
>>   dosfstools-native
>>   spirv-tools-native
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/6790/s=
teps/11/logs/stdio
>>
>> On 28/02/2023 16:00:58+0100, Anna-Lena Marx via lists.openembedded.org w=
rote:
>> > Building F2FS rootfs is supported in Yocto/OpenEmbedded -
>> > see image_types.bbclass, but not in WIC.
>> > This adds it as a nice convenience feature.
>> >
>> > F2FS needs a minimum size of ~500M to operate correctly due to
>> > an overprovision functionality.
>> >
>> > Signed-off-by: Anna-Lena Marx <anna-lena.marx@inovex.de>
>> > ---
>> >  meta/classes-recipe/image_types_wic.bbclass |  2 +-
>> >  meta/lib/oeqa/selftest/cases/wic.py         |  2 ++
>> >  meta/recipes-core/meta/wic-tools.bb         |  2 +-
>> >  scripts/lib/wic/help.py                     |  1 +
>> >  scripts/lib/wic/ksparser.py                 |  2 +-
>> >  scripts/lib/wic/misc.py                     |  1 +
>> >  scripts/lib/wic/partition.py                | 32 ++++++++++++++++++++=
-
>> >  7 files changed, 38 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classe=
s-recipe/image_types_wic.bbclass
>> > index c339b9bdfb..8ae5ecca4d 100644
>> > --- a/meta/classes-recipe/image_types_wic.bbclass
>> > +++ b/meta/classes-recipe/image_types_wic.bbclass
>> > @@ -89,7 +89,7 @@ do_image_wic[recrdeptask] +=3D "do_deploy"
>> >  do_image_wic[deptask] +=3D "do_image_complete"
>> >
>> >  WKS_FILE_DEPENDS_DEFAULT =3D '${@bb.utils.contains_any("BUILD_ARCH", =
[ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
>> > -WKS_FILE_DEPENDS_DEFAULT +=3D "bmap-tools-native cdrtools-native btrf=
s-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
>> > +WKS_FILE_DEPENDS_DEFAULT +=3D "bmap-tools-native cdrtools-native btrf=
s-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native f2=
fs-tools-native"
>> >  # Unified kernel images need objcopy
>> >  WKS_FILE_DEPENDS_DEFAULT +=3D "virtual/${MLPREFIX}${TARGET_PREFIX}bin=
utils"
>> >  WKS_FILE_DEPENDS_BOOTLOADERS =3D ""
>> > diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selft=
est/cases/wic.py
>> > index ca1abb970a..5e255e35c7 100644
>> > --- a/meta/lib/oeqa/selftest/cases/wic.py
>> > +++ b/meta/lib/oeqa/selftest/cases/wic.py
>> > @@ -1188,6 +1188,7 @@ class Wic2(WicTestCase):
>> >          with NamedTemporaryFile("w", suffix=3D".wks") as wks:
>> >              wks.writelines(['part ext2   --fstype ext2     --source r=
ootfs\n',
>> >                              'part btrfs  --fstype btrfs    --source r=
ootfs --size 40M\n',
>> > +                            'part f2fs   --fstype f2fs     --source r=
ootfs --size 50M\n',
>> >                              'part squash --fstype squashfs --source r=
ootfs\n',
>> >                              'part swap   --fstype swap --size 1M\n',
>> >                              'part emptyvfat   --fstype vfat   --size =
1M\n',
>> > @@ -1258,6 +1259,7 @@ class Wic2(WicTestCase):
>> >              wks.writelines(
>> >                  ['part ext2   --fstype ext2     --source rootfs --mkf=
s-extraopts "-D -F -i 8192"\n',
>> >                   "part btrfs  --fstype btrfs    --source rootfs --siz=
e 40M --mkfs-extraopts=3D'--quiet'\n",
>> > +                 "part f2fs   --fstype f2fs     --source rootfs --siz=
e 50M --mkfs-extraopts=3D'-O extra_attr -o 20'\n",
>> >                   'part squash --fstype squashfs --source rootfs --mkf=
s-extraopts "-no-sparse -b 4096"\n',
>> >                   'part emptyvfat   --fstype vfat   --size 1M --mkfs-e=
xtraopts "-S 1024 -s 64"\n',
>> >                   'part emptymsdos  --fstype msdos  --size 1M --mkfs-e=
xtraopts "-S 1024 -s 64"\n',
>> > diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/m=
eta/wic-tools.bb
>> > index 9282d36a4d..d30ce66b56 100644
>> > --- a/meta/recipes-core/meta/wic-tools.bb
>> > +++ b/meta/recipes-core/meta/wic-tools.bb
>> > @@ -7,7 +7,7 @@ DEPENDS =3D "\
>> >             mtools-native bmap-tools-native grub-native cdrtools-nativ=
e \
>> >             btrfs-tools-native squashfs-tools-native pseudo-native \
>> >             e2fsprogs-native util-linux-native tar-native erofs-utils-=
native \
>> > -           virtual/${TARGET_PREFIX}binutils \
>> > +           f2fs-tools-native virtual/${TARGET_PREFIX}binutils \
>> >             "
>> >  DEPENDS:append:x86 =3D " syslinux-native syslinux grub-efi systemd-bo=
ot"
>> >  DEPENDS:append:x86-64 =3D " syslinux-native syslinux grub-efi systemd=
-boot"
>> > diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
>> > index 73e3380cde..0094065931 100644
>> > --- a/scripts/lib/wic/help.py
>> > +++ b/scripts/lib/wic/help.py
>> > @@ -931,6 +931,7 @@ DESCRIPTION
>> >               btrfs
>> >               squashfs
>> >               erofs
>> > +             f2fs
>> >               swap
>> >
>> >           --fsoptions: Specifies a free-form string of options to be
>> > diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
>> > index d1e546b12d..e10ce6581d 100644
>> > --- a/scripts/lib/wic/ksparser.py
>> > +++ b/scripts/lib/wic/ksparser.py
>> > @@ -159,7 +159,7 @@ class KickStart():
>> >          part.add_argument('--fstype', default=3D'vfat',
>> >                            choices=3D('ext2', 'ext3', 'ext4', 'btrfs',
>> >                                     'squashfs', 'vfat', 'msdos', 'erof=
s',
>> > -                                   'swap', 'none'))
>> > +                                   'f2fs', 'swap', 'none'))
>> >          part.add_argument('--mkfs-extraopts', default=3D'')
>> >          part.add_argument('--label')
>> >          part.add_argument('--use-label', action=3D'store_true')
>> > diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
>> > index 2b90821b30..dc84a37423 100644
>> > --- a/scripts/lib/wic/misc.py
>> > +++ b/scripts/lib/wic/misc.py
>> > @@ -41,6 +41,7 @@ NATIVE_RECIPES =3D {"bmaptool": "bmap-tools",
>> >                    "mkfs.ext3": "e2fsprogs",
>> >                    "mkfs.ext4": "e2fsprogs",
>> >                    "mkfs.vfat": "dosfstools",
>> > +                  "mkfs.f2fs": "f2fs-tools",
>> >                    "mksquashfs": "squashfs-tools",
>> >                    "mkswap": "util-linux",
>> >                    "mmd": "mtools",
>> > diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.=
py
>> > index 382afa44bc..6adcaa041f 100644
>> > --- a/scripts/lib/wic/partition.py
>> > +++ b/scripts/lib/wic/partition.py
>> > @@ -208,7 +208,7 @@ class Partition():
>> >          Prepare content for a rootfs partition i.e. create a partitio=
n
>> >          and fill it from a /rootfs dir.
>> >
>> > -        Currently handles ext2/3/4, btrfs, vfat and squashfs.
>> > +        Currently handles ext2/3/4, btrfs, vfat, squashfs and f2fs.
>> >          """
>> >
>> >          rootfs =3D "%s/rootfs_%s.%s.%s" % (cr_workdir, self.label,
>> > @@ -351,6 +351,36 @@ class Partition():
>> >               self.mkfs_extraopts, self.fsuuid, rootfs)
>> >          exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=3Dpseudo)
>> >
>> > +    def prepare_rootfs_f2fs(self, rootfs, cr_workdir, oe_builddir, ro=
otfs_dir,
>> > +                            native_sysroot, pseudo):
>> > +        """
>> > +        Prepare content for a f2fs rootfs partition.
>> > +        """
>> > +        du_cmd =3D "du -ks %s" % rootfs_dir
>> > +        out =3D exec_cmd(du_cmd)
>> > +        actual_rootfs_size =3D int(out.split()[0])
>> > +
>> > +        min_f2fs_size =3D 524288
>> > +        rootfs_size =3D self.get_rootfs_size(actual_rootfs_size)
>> > +        if rootfs_size < min_f2fs_size:
>> > +            rootfs_size =3D min_f2fs_size
>> > +
>> > +        with open(rootfs, 'w') as sparse:
>> > +            os.ftruncate(sparse.fileno(), rootfs_size * 1024)
>> > +
>> > +        extraopts =3D self.mkfs_extraopts or "-O extra_attr,compressi=
on"
>> > +
>> > +        label_str =3D ""
>> > +        if self.label:
>> > +            label_str =3D "-l %s" % self.label
>> > +
>> > +        mkfs_f2fs_cmd =3D "mkfs.f2fs %s %s %s" % \
>> > +                        (label_str, extraopts, rootfs)
>> > +        exec_native_cmd(mkfs_f2fs_cmd, native_sysroot, pseudo=3Dpseud=
o)
>> > +
>> > +        sload_f2fs_cmd =3D "sload.f2fs -f %s %s" % (rootfs_dir, rootf=
s)
>> > +        exec_native_cmd(sload_f2fs_cmd, native_sysroot, pseudo=3Dpseu=
do)
>> > +
>> >      def prepare_rootfs_msdos(self, rootfs, cr_workdir, oe_builddir, r=
ootfs_dir,
>> >                               native_sysroot, pseudo):
>> >          """
>> > --
>> > 2.39.2
>> >
>>
>> >
>> >
>> >
>>
>>
>> --
>> Alexandre Belloni, co-owner and COO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177888): https://lists.openembedded.org/g/openembedde=
d-core/message/177888
> Mute This Topic: https://lists.openembedded.org/mt/97291696/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

