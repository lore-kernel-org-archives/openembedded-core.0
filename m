Return-Path: <anna-lena.marx@inovex.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47034C61DA4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 15:11:05 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.35995.1678115460536007624
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 07:11:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@inovex.de header.s=google header.b=hScjiMzs;
 spf=pass (domain: inovex.de, ip: 209.85.208.48, mailfrom: anna-lena.marx@inovex.de)
Received: by mail-ed1-f48.google.com with SMTP id o12so39876013edb.9
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 07:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inovex.de; s=google; t=1678115459;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wWRATI+7JU2tZi0m17iO3olX/99H00UUK0puiOgvb24=;
        b=hScjiMzs2TmvIv0ZHZJj6lKs9YkqFKhvt9xa8DZs26gK5OxDJrwl00txpAJPj5eUaQ
         QjBR+Xv+oIiDQd0P4NVZarJiwRVH4g1i3qvCXSIChRDU/bwyRBOZfDMU+ssTL0HxGO93
         6lFa8I9tYz+nR3+QsRUlaAjQipBwQP66nX1nGU5DJpekHPvY/pvU89fchXl5e4ay0Wu+
         Epi78S8iJ9DSYHjPMGvNeXWZVf/t1CDzHlNNL4UhpiwS/V6iArHMq0imDFwumtRrPWIX
         uyywniMZrZzTZsSFnAWO/JGxH5bU7s4jqrukJ4KiWlSSZkqxNohDIJ1bK/vpYA6jQkyk
         WChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678115459;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWRATI+7JU2tZi0m17iO3olX/99H00UUK0puiOgvb24=;
        b=XUzE5U8P58hAgzxeGw2f99hUVg0Rl/XHCZuyKilTx9RTixHJXzbci4t/7xadZgD/6b
         bqZvTrm+I2GWOMbWgL0gfwQ2/NRqqQBD4k9yzP4jI3w3tlVAAX7DR4hP6PbLNhSiN/lo
         DL79ZHj4gb4lfmFPSyRGLwPv90psZD8JbpowQA32lXG65cCsADfNKhHY52XXvynVlQtj
         V7RM6tzJxm7LuCspmO25u59YCjuejIOhp7jxBdTmH1Wlui2boCBiCcEaE8MWFu0GyCqP
         UEsusfgapYOdS+htDMzj5gByUB51f5ipt9IzbVsfHWDB8scOZBE94g+9J1NuvJGE6zsH
         lrHg==
X-Gm-Message-State: AO0yUKU9SF+ov774HcbSKVSx+YinwP/NZiw+HfCqohqjfddk7pUc9m82
	EnVE60oXE8iBnJh0oM0R0QiZwPjKR6oLE/p2aNfvZQ==
X-Google-Smtp-Source: AK7set9TmHX59s/qOAVufpSumstB8Anm9K6PcLl19AoBHanuQIKpismQdAwHrU4naPnfFf0+3dJwOaeDAxInJIo3i/8=
X-Received: by 2002:a17:907:724f:b0:8b1:3c31:efe6 with SMTP id
 ds15-20020a170907724f00b008b13c31efe6mr8916910ejc.3.1678115458769; Mon, 06
 Mar 2023 07:10:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677593618.git.anna-lena.marx@inovex.de>
 <d6eaaa6541a496112bfbd82401bf94d031741e59.1677593618.git.anna-lena.marx@inovex.de>
 <Y/4b0dLAaxLcHKSc@mail.local> <CABFt5okSFyMcjJ506pgdu9jD00AFZco2XhNKQCRXUh8nQ_zPBA@mail.gmail.com>
 <CANNYZj_a4PrXBZHU_2y8=dXumVsV2Zz2PtNTL9aRG94sRkEeZw@mail.gmail.com>
In-Reply-To: <CANNYZj_a4PrXBZHU_2y8=dXumVsV2Zz2PtNTL9aRG94sRkEeZw@mail.gmail.com>
From: Anna-Lena Marx <anna-lena.marx@inovex.de>
Date: Mon, 6 Mar 2023 16:10:47 +0100
Message-ID: <CABFt5onpZJo6+cwDiX6JniYQfSXtO1ebSwR_9w-NL8Wb9h1JcQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/1] wic: Add support for F2FS in WIC rootfs plugin
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cffcc705f63cb3d0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 15:11:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178073

--000000000000cffcc705f63cb3d0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
moving the support or the tests to meta-filesystems does not make sense to
me.
Wic is located in oe-core, move support and tests would not really work at
all and create another dependency.
It may be an option to move f2fs from meta-filesystems to
meta/recipes-devtools where e.g. btrfs, dosfs tools and erofs are located.
Otherwise, allowing it without tests would be an option, but that's not
ideal either.
On the other hand is there merged support for some filesystems in wic
without matching tests.

-- Anna



Am Mi., 1. M=C3=A4rz 2023 um 17:25 Uhr schrieb Alexander Kanavin <
alex.kanavin@gmail.com>:

> If f2fs support requires recipes that are not available in oe-core, is
> it possible to add that support (and tests) to the layer that has the
> needed recipes, e.g. meta-filesystems? In general, we try to avoid
> having things in oe-core that cannot be tested without adding other
> layers.
>
> Alex
>
> On Wed, 1 Mar 2023 at 15:37, Anna-Lena Marx via lists.openembedded.org
> <anna-lena.marx=3Dinovex.de@lists.openembedded.org> wrote:
> >
> > Hi,
> >
> > took me a while to reproduce the failure locally.
> > It's because meta-oe and meta-filesystems are not as default included i=
n
> the bblayers.conf used for oe-selftest.
> >
> > I don't want to touch bblayers and I think this is not intended as it
> would be the same for e.g. erofs for which no test case was added.
> > Alexander Kanavin pointed me on the poky mailing list to these tests an=
d
> in fact, it's good to have them in general.
> > So what's the preferred way for oe-core?
> > Leave the tests and add the dependencies (for the specific tests) or
> just remove the test cases?
> >
> > -- Anna
> >
> >
> >
> >
> > Am Di., 28. Feb. 2023 um 16:20 Uhr schrieb Alexandre Belloni <
> alexandre.belloni@bootlin.com>:
> >>
> >> Hello,
> >>
> >> this failed on the autobuilders:
> >>
> >> ERROR: Nothing PROVIDES 'f2fs-tools-native' (but
> /home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-sato/images/
> core-image-sato.bb,
> /home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-sato/images/
> core-image-sato-sdk.bb,
> /home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-core/images/
> core-image-minimal.bb,
> /home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-core/images/
> core-image-minimal-dev.bb,
> /home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-core/images/
> core-image-ptest-all.bb DEPENDS on or otherwise requires it). Close
> matches:
> >>   btrfs-tools-native
> >>   dosfstools-native
> >>   spirv-tools-native
> >>
> >>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/6790/st=
eps/11/logs/stdio
> >>
> >> On 28/02/2023 16:00:58+0100, Anna-Lena Marx via lists.openembedded.org
> wrote:
> >> > Building F2FS rootfs is supported in Yocto/OpenEmbedded -
> >> > see image_types.bbclass, but not in WIC.
> >> > This adds it as a nice convenience feature.
> >> >
> >> > F2FS needs a minimum size of ~500M to operate correctly due to
> >> > an overprovision functionality.
> >> >
> >> > Signed-off-by: Anna-Lena Marx <anna-lena.marx@inovex.de>
> >> > ---
> >> >  meta/classes-recipe/image_types_wic.bbclass |  2 +-
> >> >  meta/lib/oeqa/selftest/cases/wic.py         |  2 ++
> >> >  meta/recipes-core/meta/wic-tools.bb         |  2 +-
> >> >  scripts/lib/wic/help.py                     |  1 +
> >> >  scripts/lib/wic/ksparser.py                 |  2 +-
> >> >  scripts/lib/wic/misc.py                     |  1 +
> >> >  scripts/lib/wic/partition.py                | 32
> ++++++++++++++++++++-
> >> >  7 files changed, 38 insertions(+), 4 deletions(-)
> >> >
> >> > diff --git a/meta/classes-recipe/image_types_wic.bbclass
> b/meta/classes-recipe/image_types_wic.bbclass
> >> > index c339b9bdfb..8ae5ecca4d 100644
> >> > --- a/meta/classes-recipe/image_types_wic.bbclass
> >> > +++ b/meta/classes-recipe/image_types_wic.bbclass
> >> > @@ -89,7 +89,7 @@ do_image_wic[recrdeptask] +=3D "do_deploy"
> >> >  do_image_wic[deptask] +=3D "do_image_complete"
> >> >
> >> >  WKS_FILE_DEPENDS_DEFAULT =3D '${@bb.utils.contains_any("BUILD_ARCH"=
, [
> 'x86_64', 'i686' ], "syslinux-native", "",d)}'
> >> > -WKS_FILE_DEPENDS_DEFAULT +=3D "bmap-tools-native cdrtools-native
> btrfs-tools-native squashfs-tools-native e2fsprogs-native
> erofs-utils-native"
> >> > +WKS_FILE_DEPENDS_DEFAULT +=3D "bmap-tools-native cdrtools-native
> btrfs-tools-native squashfs-tools-native e2fsprogs-native
> erofs-utils-native f2fs-tools-native"
> >> >  # Unified kernel images need objcopy
> >> >  WKS_FILE_DEPENDS_DEFAULT +=3D
> "virtual/${MLPREFIX}${TARGET_PREFIX}binutils"
> >> >  WKS_FILE_DEPENDS_BOOTLOADERS =3D ""
> >> > diff --git a/meta/lib/oeqa/selftest/cases/wic.py
> b/meta/lib/oeqa/selftest/cases/wic.py
> >> > index ca1abb970a..5e255e35c7 100644
> >> > --- a/meta/lib/oeqa/selftest/cases/wic.py
> >> > +++ b/meta/lib/oeqa/selftest/cases/wic.py
> >> > @@ -1188,6 +1188,7 @@ class Wic2(WicTestCase):
> >> >          with NamedTemporaryFile("w", suffix=3D".wks") as wks:
> >> >              wks.writelines(['part ext2   --fstype ext2     --source
> rootfs\n',
> >> >                              'part btrfs  --fstype btrfs    --source
> rootfs --size 40M\n',
> >> > +                            'part f2fs   --fstype f2fs     --source
> rootfs --size 50M\n',
> >> >                              'part squash --fstype squashfs --source
> rootfs\n',
> >> >                              'part swap   --fstype swap --size 1M\n'=
,
> >> >                              'part emptyvfat   --fstype vfat   --siz=
e
> 1M\n',
> >> > @@ -1258,6 +1259,7 @@ class Wic2(WicTestCase):
> >> >              wks.writelines(
> >> >                  ['part ext2   --fstype ext2     --source rootfs
> --mkfs-extraopts "-D -F -i 8192"\n',
> >> >                   "part btrfs  --fstype btrfs    --source rootfs
> --size 40M --mkfs-extraopts=3D'--quiet'\n",
> >> > +                 "part f2fs   --fstype f2fs     --source rootfs
> --size 50M --mkfs-extraopts=3D'-O extra_attr -o 20'\n",
> >> >                   'part squash --fstype squashfs --source rootfs
> --mkfs-extraopts "-no-sparse -b 4096"\n',
> >> >                   'part emptyvfat   --fstype vfat   --size 1M
> --mkfs-extraopts "-S 1024 -s 64"\n',
> >> >                   'part emptymsdos  --fstype msdos  --size 1M
> --mkfs-extraopts "-S 1024 -s 64"\n',
> >> > diff --git a/meta/recipes-core/meta/wic-tools.bb
> b/meta/recipes-core/meta/wic-tools.bb
> >> > index 9282d36a4d..d30ce66b56 100644
> >> > --- a/meta/recipes-core/meta/wic-tools.bb
> >> > +++ b/meta/recipes-core/meta/wic-tools.bb
> >> > @@ -7,7 +7,7 @@ DEPENDS =3D "\
> >> >             mtools-native bmap-tools-native grub-native
> cdrtools-native \
> >> >             btrfs-tools-native squashfs-tools-native pseudo-native \
> >> >             e2fsprogs-native util-linux-native tar-native
> erofs-utils-native \
> >> > -           virtual/${TARGET_PREFIX}binutils \
> >> > +           f2fs-tools-native virtual/${TARGET_PREFIX}binutils \
> >> >             "
> >> >  DEPENDS:append:x86 =3D " syslinux-native syslinux grub-efi
> systemd-boot"
> >> >  DEPENDS:append:x86-64 =3D " syslinux-native syslinux grub-efi
> systemd-boot"
> >> > diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> >> > index 73e3380cde..0094065931 100644
> >> > --- a/scripts/lib/wic/help.py
> >> > +++ b/scripts/lib/wic/help.py
> >> > @@ -931,6 +931,7 @@ DESCRIPTION
> >> >               btrfs
> >> >               squashfs
> >> >               erofs
> >> > +             f2fs
> >> >               swap
> >> >
> >> >           --fsoptions: Specifies a free-form string of options to be
> >> > diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.=
py
> >> > index d1e546b12d..e10ce6581d 100644
> >> > --- a/scripts/lib/wic/ksparser.py
> >> > +++ b/scripts/lib/wic/ksparser.py
> >> > @@ -159,7 +159,7 @@ class KickStart():
> >> >          part.add_argument('--fstype', default=3D'vfat',
> >> >                            choices=3D('ext2', 'ext3', 'ext4', 'btrfs=
',
> >> >                                     'squashfs', 'vfat', 'msdos',
> 'erofs',
> >> > -                                   'swap', 'none'))
> >> > +                                   'f2fs', 'swap', 'none'))
> >> >          part.add_argument('--mkfs-extraopts', default=3D'')
> >> >          part.add_argument('--label')
> >> >          part.add_argument('--use-label', action=3D'store_true')
> >> > diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
> >> > index 2b90821b30..dc84a37423 100644
> >> > --- a/scripts/lib/wic/misc.py
> >> > +++ b/scripts/lib/wic/misc.py
> >> > @@ -41,6 +41,7 @@ NATIVE_RECIPES =3D {"bmaptool": "bmap-tools",
> >> >                    "mkfs.ext3": "e2fsprogs",
> >> >                    "mkfs.ext4": "e2fsprogs",
> >> >                    "mkfs.vfat": "dosfstools",
> >> > +                  "mkfs.f2fs": "f2fs-tools",
> >> >                    "mksquashfs": "squashfs-tools",
> >> >                    "mkswap": "util-linux",
> >> >                    "mmd": "mtools",
> >> > diff --git a/scripts/lib/wic/partition.py
> b/scripts/lib/wic/partition.py
> >> > index 382afa44bc..6adcaa041f 100644
> >> > --- a/scripts/lib/wic/partition.py
> >> > +++ b/scripts/lib/wic/partition.py
> >> > @@ -208,7 +208,7 @@ class Partition():
> >> >          Prepare content for a rootfs partition i.e. create a
> partition
> >> >          and fill it from a /rootfs dir.
> >> >
> >> > -        Currently handles ext2/3/4, btrfs, vfat and squashfs.
> >> > +        Currently handles ext2/3/4, btrfs, vfat, squashfs and f2fs.
> >> >          """
> >> >
> >> >          rootfs =3D "%s/rootfs_%s.%s.%s" % (cr_workdir, self.label,
> >> > @@ -351,6 +351,36 @@ class Partition():
> >> >               self.mkfs_extraopts, self.fsuuid, rootfs)
> >> >          exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=3Dpseudo)
> >> >
> >> > +    def prepare_rootfs_f2fs(self, rootfs, cr_workdir, oe_builddir,
> rootfs_dir,
> >> > +                            native_sysroot, pseudo):
> >> > +        """
> >> > +        Prepare content for a f2fs rootfs partition.
> >> > +        """
> >> > +        du_cmd =3D "du -ks %s" % rootfs_dir
> >> > +        out =3D exec_cmd(du_cmd)
> >> > +        actual_rootfs_size =3D int(out.split()[0])
> >> > +
> >> > +        min_f2fs_size =3D 524288
> >> > +        rootfs_size =3D self.get_rootfs_size(actual_rootfs_size)
> >> > +        if rootfs_size < min_f2fs_size:
> >> > +            rootfs_size =3D min_f2fs_size
> >> > +
> >> > +        with open(rootfs, 'w') as sparse:
> >> > +            os.ftruncate(sparse.fileno(), rootfs_size * 1024)
> >> > +
> >> > +        extraopts =3D self.mkfs_extraopts or "-O
> extra_attr,compression"
> >> > +
> >> > +        label_str =3D ""
> >> > +        if self.label:
> >> > +            label_str =3D "-l %s" % self.label
> >> > +
> >> > +        mkfs_f2fs_cmd =3D "mkfs.f2fs %s %s %s" % \
> >> > +                        (label_str, extraopts, rootfs)
> >> > +        exec_native_cmd(mkfs_f2fs_cmd, native_sysroot, pseudo=3Dpse=
udo)
> >> > +
> >> > +        sload_f2fs_cmd =3D "sload.f2fs -f %s %s" % (rootfs_dir, roo=
tfs)
> >> > +        exec_native_cmd(sload_f2fs_cmd, native_sysroot,
> pseudo=3Dpseudo)
> >> > +
> >> >      def prepare_rootfs_msdos(self, rootfs, cr_workdir, oe_builddir,
> rootfs_dir,
> >> >                               native_sysroot, pseudo):
> >> >          """
> >> > --
> >> > 2.39.2
> >> >
> >>
> >> >
> >> >
> >> >
> >>
> >>
> >> --
> >> Alexandre Belloni, co-owner and COO, Bootlin
> >> Embedded Linux and Kernel engineering
> >> https://bootlin.com
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#177888):
> https://lists.openembedded.org/g/openembedded-core/message/177888
> > Mute This Topic: https://lists.openembedded.org/mt/97291696/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000cffcc705f63cb3d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br>moving the support or the tests to meta-filesystems=
 does not make sense to me.<br>Wic is located in oe-core, move support and =
tests would not really work at all and create another dependency.<br>It may=
 be an option to move f2fs from meta-filesystems to meta/recipes-devtools w=
here e.g. btrfs, dosfs tools and erofs are located.<br>Otherwise, allowing =
it without tests would be an option, but that&#39;s not ideal either.<br>On=
 the=C2=A0other hand is there merged support for some filesystems in wic wi=
thout matching tests.<div><br></div><div>-- Anna<br clear=3D"all"><div><div=
 dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><=
div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=
=3D"ltr"><pre cols=3D"72"></pre><div><br></div></div></div></div></div></di=
v></div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Am Mi., 1. M=C3=A4rz 2023 um 17:25=C2=A0Uhr schrieb Ale=
xander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@g=
mail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">If f2fs support requires recipes that are not available in oe-core, is<br=
>
it possible to add that support (and tests) to the layer that has the<br>
needed recipes, e.g. meta-filesystems? In general, we try to avoid<br>
having things in oe-core that cannot be tested without adding other<br>
layers.<br>
<br>
Alex<br>
<br>
On Wed, 1 Mar 2023 at 15:37, Anna-Lena Marx via <a href=3D"http://lists.ope=
nembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org<=
/a><br>
&lt;anna-lena.marx=3D<a href=3D"mailto:inovex.de@lists.openembedded.org" ta=
rget=3D"_blank">inovex.de@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; took me a while to reproduce the failure locally.<br>
&gt; It&#39;s because meta-oe and meta-filesystems are not as default inclu=
ded in the bblayers.conf used for oe-selftest.<br>
&gt;<br>
&gt; I don&#39;t want to touch bblayers and I think this is not intended as=
 it would be the same for e.g. erofs for which no test case was added.<br>
&gt; Alexander Kanavin pointed me on the poky mailing list to these tests a=
nd in fact, it&#39;s good to have them in general.<br>
&gt; So what&#39;s the preferred way for oe-core?<br>
&gt; Leave the tests and add the dependencies (for the specific tests) or j=
ust remove the test cases?<br>
&gt;<br>
&gt; -- Anna<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Am Di., 28. Feb. 2023 um 16:20 Uhr schrieb Alexandre Belloni &lt;<a hr=
ef=3D"mailto:alexandre.belloni@bootlin.com" target=3D"_blank">alexandre.bel=
loni@bootlin.com</a>&gt;:<br>
&gt;&gt;<br>
&gt;&gt; Hello,<br>
&gt;&gt;<br>
&gt;&gt; this failed on the autobuilders:<br>
&gt;&gt;<br>
&gt;&gt; ERROR: Nothing PROVIDES &#39;f2fs-tools-native&#39; (but /home/pok=
ybuild/yocto-worker/beaglebone/build/meta/recipes-sato/images/<a href=3D"ht=
tp://core-image-sato.bb" rel=3D"noreferrer" target=3D"_blank">core-image-sa=
to.bb</a>, /home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-sato/=
images/<a href=3D"http://core-image-sato-sdk.bb" rel=3D"noreferrer" target=
=3D"_blank">core-image-sato-sdk.bb</a>, /home/pokybuild/yocto-worker/beagle=
bone/build/meta/recipes-core/images/<a href=3D"http://core-image-minimal.bb=
" rel=3D"noreferrer" target=3D"_blank">core-image-minimal.bb</a>, /home/pok=
ybuild/yocto-worker/beaglebone/build/meta/recipes-core/images/<a href=3D"ht=
tp://core-image-minimal-dev.bb" rel=3D"noreferrer" target=3D"_blank">core-i=
mage-minimal-dev.bb</a>, /home/pokybuild/yocto-worker/beaglebone/build/meta=
/recipes-core/images/<a href=3D"http://core-image-ptest-all.bb" rel=3D"nore=
ferrer" target=3D"_blank">core-image-ptest-all.bb</a> DEPENDS on or otherwi=
se requires it). Close matches:<br>
&gt;&gt;=C2=A0 =C2=A0btrfs-tools-native<br>
&gt;&gt;=C2=A0 =C2=A0dosfstools-native<br>
&gt;&gt;=C2=A0 =C2=A0spirv-tools-native<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders=
/65/builds/6790/steps/11/logs/stdio" rel=3D"noreferrer" target=3D"_blank">h=
ttps://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/6790/steps=
/11/logs/stdio</a><br>
&gt;&gt;<br>
&gt;&gt; On 28/02/2023 16:00:58+0100, Anna-Lena Marx via <a href=3D"http://=
lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembe=
dded.org</a> wrote:<br>
&gt;&gt; &gt; Building F2FS rootfs is supported in Yocto/OpenEmbedded -<br>
&gt;&gt; &gt; see image_types.bbclass, but not in WIC.<br>
&gt;&gt; &gt; This adds it as a nice convenience feature.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; F2FS needs a minimum size of ~500M to operate correctly due t=
o<br>
&gt;&gt; &gt; an overprovision functionality.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Anna-Lena Marx &lt;<a href=3D"mailto:anna-lena=
.marx@inovex.de" target=3D"_blank">anna-lena.marx@inovex.de</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 meta/classes-recipe/image_types_wic.bbclass |=C2=A0 2 +=
-<br>
&gt;&gt; &gt;=C2=A0 meta/lib/oeqa/selftest/cases/wic.py=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
&gt;&gt; &gt;=C2=A0 meta/recipes-core/meta/<a href=3D"http://wic-tools.bb" =
rel=3D"noreferrer" target=3D"_blank">wic-tools.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;&gt; &gt;=C2=A0 scripts/lib/wic/help.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;&gt; &gt;=C2=A0 scripts/lib/wic/ksparser.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;&gt; &gt;=C2=A0 scripts/lib/wic/misc.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;&gt; &gt;=C2=A0 scripts/lib/wic/partition.py=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 32 ++++++++++++++++++++-<br>
&gt;&gt; &gt;=C2=A0 7 files changed, 38 insertions(+), 4 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/classes-recipe/image_types_wic.bbclass b/me=
ta/classes-recipe/image_types_wic.bbclass<br>
&gt;&gt; &gt; index c339b9bdfb..8ae5ecca4d 100644<br>
&gt;&gt; &gt; --- a/meta/classes-recipe/image_types_wic.bbclass<br>
&gt;&gt; &gt; +++ b/meta/classes-recipe/image_types_wic.bbclass<br>
&gt;&gt; &gt; @@ -89,7 +89,7 @@ do_image_wic[recrdeptask] +=3D &quot;do_dep=
loy&quot;<br>
&gt;&gt; &gt;=C2=A0 do_image_wic[deptask] +=3D &quot;do_image_complete&quot=
;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 WKS_FILE_DEPENDS_DEFAULT =3D &#39;${@bb.utils.contains_=
any(&quot;BUILD_ARCH&quot;, [ &#39;x86_64&#39;, &#39;i686&#39; ], &quot;sys=
linux-native&quot;, &quot;&quot;,d)}&#39;<br>
&gt;&gt; &gt; -WKS_FILE_DEPENDS_DEFAULT +=3D &quot;bmap-tools-native cdrtoo=
ls-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-u=
tils-native&quot;<br>
&gt;&gt; &gt; +WKS_FILE_DEPENDS_DEFAULT +=3D &quot;bmap-tools-native cdrtoo=
ls-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-u=
tils-native f2fs-tools-native&quot;<br>
&gt;&gt; &gt;=C2=A0 # Unified kernel images need objcopy<br>
&gt;&gt; &gt;=C2=A0 WKS_FILE_DEPENDS_DEFAULT +=3D &quot;virtual/${MLPREFIX}=
${TARGET_PREFIX}binutils&quot;<br>
&gt;&gt; &gt;=C2=A0 WKS_FILE_DEPENDS_BOOTLOADERS =3D &quot;&quot;<br>
&gt;&gt; &gt; diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/o=
eqa/selftest/cases/wic.py<br>
&gt;&gt; &gt; index ca1abb970a..5e255e35c7 100644<br>
&gt;&gt; &gt; --- a/meta/lib/oeqa/selftest/cases/wic.py<br>
&gt;&gt; &gt; +++ b/meta/lib/oeqa/selftest/cases/wic.py<br>
&gt;&gt; &gt; @@ -1188,6 +1188,7 @@ class Wic2(WicTestCase):<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with NamedTemporaryFile(&qu=
ot;w&quot;, suffix=3D&quot;.wks&quot;) as wks:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wks.writeline=
s([&#39;part ext2=C2=A0 =C2=A0--fstype ext2=C2=A0 =C2=A0 =C2=A0--source roo=
tfs\n&#39;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;part btrfs=C2=A0 --fstype b=
trfs=C2=A0 =C2=A0 --source rootfs --size 40M\n&#39;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;part f2fs=C2=A0 =C2=A0--fstype =
f2fs=C2=A0 =C2=A0 =C2=A0--source rootfs --size 50M\n&#39;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;part squash --fstype squash=
fs --source rootfs\n&#39;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;part swap=C2=A0 =C2=A0--fst=
ype swap --size 1M\n&#39;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;part emptyvfat=C2=A0 =C2=A0=
--fstype vfat=C2=A0 =C2=A0--size 1M\n&#39;,<br>
&gt;&gt; &gt; @@ -1258,6 +1259,7 @@ class Wic2(WicTestCase):<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wks.writeline=
s(<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 [&#39;part ext2=C2=A0 =C2=A0--fstype ext2=C2=A0 =C2=A0 =C2=A0--source root=
fs --mkfs-extraopts &quot;-D -F -i 8192&quot;\n&#39;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;part btrfs=C2=A0 --fstype btrfs=C2=A0 =C2=A0 --source rootfs -=
-size 40M --mkfs-extraopts=3D&#39;--quiet&#39;\n&quot;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;part f2fs=C2=A0 =C2=A0--fstype f2fs=C2=A0 =C2=A0 =C2=A0--source ro=
otfs --size 50M --mkfs-extraopts=3D&#39;-O extra_attr -o 20&#39;\n&quot;,<b=
r>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&#39;part squash --fstype squashfs --source rootfs --mkfs-extraopts =
&quot;-no-sparse -b 4096&quot;\n&#39;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&#39;part emptyvfat=C2=A0 =C2=A0--fstype vfat=C2=A0 =C2=A0--size 1M =
--mkfs-extraopts &quot;-S 1024 -s 64&quot;\n&#39;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&#39;part emptymsdos=C2=A0 --fstype msdos=C2=A0 --size 1M --mkfs-ext=
raopts &quot;-S 1024 -s 64&quot;\n&#39;,<br>
&gt;&gt; &gt; diff --git a/meta/recipes-core/meta/<a href=3D"http://wic-too=
ls.bb" rel=3D"noreferrer" target=3D"_blank">wic-tools.bb</a> b/meta/recipes=
-core/meta/<a href=3D"http://wic-tools.bb" rel=3D"noreferrer" target=3D"_bl=
ank">wic-tools.bb</a><br>
&gt;&gt; &gt; index 9282d36a4d..d30ce66b56 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-core/meta/<a href=3D"http://wic-tools.bb" =
rel=3D"noreferrer" target=3D"_blank">wic-tools.bb</a><br>
&gt;&gt; &gt; +++ b/meta/recipes-core/meta/<a href=3D"http://wic-tools.bb" =
rel=3D"noreferrer" target=3D"_blank">wic-tools.bb</a><br>
&gt;&gt; &gt; @@ -7,7 +7,7 @@ DEPENDS =3D &quot;\<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mtools-native =
bmap-tools-native grub-native cdrtools-native \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0btrfs-tools-na=
tive squashfs-tools-native pseudo-native \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e2fsprogs-nati=
ve util-linux-native tar-native erofs-utils-native \<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virtual/${TARGET_PR=
EFIX}binutils \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f2fs-tools-native v=
irtual/${TARGET_PREFIX}binutils \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt; &gt;=C2=A0 DEPENDS:append:x86 =3D &quot; syslinux-native syslinux =
grub-efi systemd-boot&quot;<br>
&gt;&gt; &gt;=C2=A0 DEPENDS:append:x86-64 =3D &quot; syslinux-native syslin=
ux grub-efi systemd-boot&quot;<br>
&gt;&gt; &gt; diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.p=
y<br>
&gt;&gt; &gt; index 73e3380cde..0094065931 100644<br>
&gt;&gt; &gt; --- a/scripts/lib/wic/help.py<br>
&gt;&gt; &gt; +++ b/scripts/lib/wic/help.py<br>
&gt;&gt; &gt; @@ -931,6 +931,7 @@ DESCRIPTION<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0btrfs<b=
r>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0squashf=
s<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0erofs<b=
r>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f2fs<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0swap<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--fsoptions: Specifie=
s a free-form string of options to be<br>
&gt;&gt; &gt; diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ks=
parser.py<br>
&gt;&gt; &gt; index d1e546b12d..e10ce6581d 100644<br>
&gt;&gt; &gt; --- a/scripts/lib/wic/ksparser.py<br>
&gt;&gt; &gt; +++ b/scripts/lib/wic/ksparser.py<br>
&gt;&gt; &gt; @@ -159,7 +159,7 @@ class KickStart():<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 part.add_argument(&#39;--fs=
type&#39;, default=3D&#39;vfat&#39;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 choices=3D(&#39;ext2&#39;, &#39;ext3&#3=
9;, &#39;ext4&#39;, &#39;btrfs&#39;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
squashfs&#39;, &#39;vfat&#39;, &#39;msdos&#39;, &#39;erofs&#39;,<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;swap=
&#39;, &#39;none&#39;))<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;f2fs=
&#39;, &#39;swap&#39;, &#39;none&#39;))<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 part.add_argument(&#39;--mk=
fs-extraopts&#39;, default=3D&#39;&#39;)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 part.add_argument(&#39;--la=
bel&#39;)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 part.add_argument(&#39;--us=
e-label&#39;, action=3D&#39;store_true&#39;)<br>
&gt;&gt; &gt; diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.p=
y<br>
&gt;&gt; &gt; index 2b90821b30..dc84a37423 100644<br>
&gt;&gt; &gt; --- a/scripts/lib/wic/misc.py<br>
&gt;&gt; &gt; +++ b/scripts/lib/wic/misc.py<br>
&gt;&gt; &gt; @@ -41,6 +41,7 @@ NATIVE_RECIPES =3D {&quot;bmaptool&quot;: &=
quot;bmap-tools&quot;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;mkfs.ext3&quot;: &quot;e2fsprogs&quot;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;mkfs.ext4&quot;: &quot;e2fsprogs&quot;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;mkfs.vfat&quot;: &quot;dosfstools&quot;,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;mkfs.f2fs&quot;: &quot;f2fs-tools&quot;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;mksquashfs&quot;: &quot;squashfs-tools&quot;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;mkswap&quot;: &quot;util-linux&quot;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;mmd&quot;: &quot;mtools&quot;,<br>
&gt;&gt; &gt; diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/p=
artition.py<br>
&gt;&gt; &gt; index 382afa44bc..6adcaa041f 100644<br>
&gt;&gt; &gt; --- a/scripts/lib/wic/partition.py<br>
&gt;&gt; &gt; +++ b/scripts/lib/wic/partition.py<br>
&gt;&gt; &gt; @@ -208,7 +208,7 @@ class Partition():<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Prepare content for a rootf=
s partition i.e. create a partition<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and fill it from a /rootfs =
dir.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 Currently handles ext2/3/4, btrf=
s, vfat and squashfs.<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Currently handles ext2/3/4, btrf=
s, vfat, squashfs and f2fs.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rootfs =3D &quot;%s/rootfs_=
%s.%s.%s&quot; % (cr_workdir, self.label,<br>
&gt;&gt; &gt; @@ -351,6 +351,36 @@ class Partition():<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.mk=
fs_extraopts, self.fsuuid, rootfs)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_native_cmd(mkfs_cmd, n=
ative_sysroot, pseudo=3Dpseudo)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 def prepare_rootfs_f2fs(self, rootfs, cr_workd=
ir, oe_builddir, rootfs_dir,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 native_sysroot, pseudo):<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Prepare content for a f2fs rootf=
s partition.<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 du_cmd =3D &quot;du -ks %s&quot;=
 % rootfs_dir<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 out =3D exec_cmd(du_cmd)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 actual_rootfs_size =3D int(out.s=
plit()[0])<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 min_f2fs_size =3D 524288<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rootfs_size =3D self.get_rootfs_=
size(actual_rootfs_size)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if rootfs_size &lt; min_f2fs_siz=
e:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rootfs_size =3D mi=
n_f2fs_size<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(rootfs, &#39;w&#39;) a=
s sparse:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.ftruncate(spars=
e.fileno(), rootfs_size * 1024)<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 extraopts =3D self.mkfs_extraopt=
s or &quot;-O extra_attr,compression&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 label_str =3D &quot;&quot;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.label:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 label_str =3D &quo=
t;-l %s&quot; % self.label<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkfs_f2fs_cmd =3D &quot;mkfs.f2f=
s %s %s %s&quot; % \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (label_str, extraopts, rootfs)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_native_cmd(mkfs_f2fs_cmd, n=
ative_sysroot, pseudo=3Dpseudo)<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sload_f2fs_cmd =3D &quot;sload.f=
2fs -f %s %s&quot; % (rootfs_dir, rootfs)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_native_cmd(sload_f2fs_cmd, =
native_sysroot, pseudo=3Dpseudo)<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 def prepare_rootfs_msdos(self, rootfs, cr=
_workdir, oe_builddir, rootfs_dir,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0native_sysroot, pseudo):<b=
r>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.39.2<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Alexandre Belloni, co-owner and COO, Bootlin<br>
&gt;&gt; Embedded Linux and Kernel engineering<br>
&gt;&gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blan=
k">https://bootlin.com</a><br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#177888): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/177888" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/177888</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97291696=
/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/97291696/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000cffcc705f63cb3d0--

