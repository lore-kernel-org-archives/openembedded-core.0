Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E88AE81A42
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 16:01:44 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22734.1771257703007222652
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 08:01:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MBCwfY4w;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a8fba3f769so14396055ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 08:01:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771257702; cv=none;
        d=google.com; s=arc-20240605;
        b=DwU5+wZg95AQwglevBXFZ1PRzL4ec78tLXi2QcXIS6ygfZsSELIKO9mvRRv5IQmIwZ
         E6EAe/+gOSX0VfCBpRVQhx0/SacRHZb4ZW1PcVJY6jm8dIP8KekT9puF6Q8uRxGi0bMI
         8Ds+XpU8FL2uDxPifQ7StahR2PvilarJeDqw1/iXYjzYjT5Xj1qYe9/dA7sP6Veml8jR
         0NkNlOWimz/jKtXsSWzhm0yz0BPJkDot4KDcAsPCZBjSEJaG7t3cTFPmXrgjoxNdy+TR
         sadPMH+rcRCpXs89RUXM9517llHMIgQ4SQijSHoAOfa9vtWnUY/bcsi7GP7I5mHSviAB
         DKMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=c3qT5g2jOH59XdNaKzpQwsvNJ8c+utFIAVonZYI15Qc=;
        fh=nhPgn5udHZZYc0XyipP24K4cW+d9np15/Jog/dD3c/M=;
        b=iBexZEokKQ8vinINS1TfvESz7kmxMHOxN2F827G0zM80ueytBsiZ48JGSqds7CNa0y
         8VH5cuwWDfbOoUgByZqH2QxL6zb0y6bGTNCHwlAIwJK/X512TMllJOrcDCLWZ1LxTaT0
         oR/DRqoWhedtN6eSLxvJWA9EpWEo+8q1nM5+bdmLGvXaWHI5SMoJyDvpZv/QI9rB0QNl
         Z/BNEMDxkUTLXgY++lEDTWl3kskwN6YY5B1/JfXcLMpQ8kbjwkHffid/8VGyV54rLJBD
         Wj/EpNhjLxY3Gq0MO7St4PYUIw4hzMHSIgOw1xmk+/jdxMsw+UXZSIxum76UP/8xrDG2
         6fJw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771257702; x=1771862502; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c3qT5g2jOH59XdNaKzpQwsvNJ8c+utFIAVonZYI15Qc=;
        b=MBCwfY4wt0rAK5E/2NSqu4KT/Gd4sp351fOyPje0lbQdliyGRQZQXUj27FNHNm1doG
         0LA6rytENbDEjLy5ENMhMmbEG3IX4bx1vWpth35tUZRFc7v4rKUm9XsWyif9rW8NFaIv
         KBgxfAcchaU1vRNfDDYCdR6jbg9dxi0pMLprcvW7Gx8ql4ZVefvNcv8PAREKAOZgxsqJ
         AIlTd4LTyzqsLshwnMNyjyxheKmDvgGTKm1nk3G4Fb79kvvrASPzgrABpZiOXX9oxKkq
         AnHaP/br/b0lO/Ucx49f5ld7bxcXCINFWXvYYMPh6eJXoWMQiZ4WB+xzLs2RQDMypMm5
         ZDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771257702; x=1771862502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3qT5g2jOH59XdNaKzpQwsvNJ8c+utFIAVonZYI15Qc=;
        b=ktemVBkGqghREz4IZs0gzG9BNJCepKOEkJBEg05ES4v2golsW93Qmca2PgF8jHipXt
         1oW6wANqs6Lyf4mJrAyx2Tj6gZd5WYUsNuzTyAT9owqznbQTUQQ4FhjYJZsDwVql9hUG
         b2zHgdjPhoE+STQL+6il7pBafZGxYftI/+uVUoKf8yxa1AZuca8TBFWTdo6Dj+AVnTA4
         WsAsnCpy9+pC5lo6hgawATvrgvv3cv90ypHhqkyN46Ksf23CGLIqQDMhkO2v0Bt444lL
         bdseHTdTBVAwRldMboqNV7t7DjAeDm3wayTeKyP03bN2McT1/BU2H22F9EV7NfkjHsYx
         B2kw==
X-Gm-Message-State: AOJu0YwhCqivbx4Wq0kj/CVuPqH/LQMx7LCfOsem19vs2Jvjep4kdKL9
	VLl+D3KrwglEPjhdQdCwcAXVPD4JD6vxG6a+GB94vjmUx+QsHhXcpQS+X0hMQZFm8SN8fY/gvey
	wuNhmvIgzeEYGSw/PsXS/bZTMEzj8mq4=
X-Gm-Gg: AZuq6aI8G0XsnUlvsWpzjRnNR2CR08jG7GMvmeV/lHVKn/vKe8tkfcqghstGrj9dleu
	2lRvhdlPGWkAbihCilbhHsX0kk5LA1fAYmguehhaRhab06yP2wecPXOuH/inzljGcUSdOntekvs
	3lT3dHdRK9hF6rqqvT68EVRXxwaq3m6a2q4cJ2/oN6O+e1kf+1djHELF0x3pjhhjveOb3+/BGmb
	XiYUZl/YCe+zY/J1B+0fzsMsha1xnOt/M69RkVXJzukZ43NyypzMND3HKz4qD3dDJT2ar6vH3H+
	bUjxnupZk7a9wdV0Dzl0zUtB1m7T6SaN6oLqSOWf
X-Received: by 2002:a17:90b:2584:b0:339:eff5:ef26 with SMTP id
 98e67ed59e1d1-356aada16d5mr7909162a91.30.1771257700701; Mon, 16 Feb 2026
 08:01:40 -0800 (PST)
MIME-Version: 1.0
References: <20260216023159.1307348-1-twoerner@gmail.com> <CADkTA4P6F67uqO5mYiArpEMXoBzp8qW2RcukWcQE_1NGJM9EWQ@mail.gmail.com>
 <aZM5vb4p6WmBcMbV@localhost.localdomain>
In-Reply-To: <aZM5vb4p6WmBcMbV@localhost.localdomain>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Feb 2026 11:01:28 -0500
X-Gm-Features: AaiRm51r-gDL2uJePzq3Ld-RpH2q6tK_C9RQIUcCUrwJjlMVguobPLmRL7hRtrM
Message-ID: <CADkTA4PPAJw5CEh+FU=R5iwCaxGFp0iWxJkZnUBX_Buo8GYYTg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/2] wic: re-implement sector-size support
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000e5db0064af312eb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 16:01:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231215

--0000000000000e5db0064af312eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2026 at 10:37=E2=80=AFAM Trevor Woerner <twoerner@gmail.com=
> wrote:

> On Sun 2026-02-15 @ 10:09:03 PM, Bruce Ashfield wrote:
> > On Sun, Feb 15, 2026 at 9:32=E2=80=AFPM Trevor Woerner via
> lists.openembedded.org
> > <twoerner=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > > The previous implementation to add variable sector-size support:
> > > - required the variable WIC_SECTOR_SIZE either be defined in a
> > >   configuration file or be defined in a --vars file
> > > - this means that every invocation of "wic ls", "wic cp", or "wic rm"
> > >   needed this variable defined (config or --vars)
> > > - required the user to create separate *wks files for every sector si=
ze
> > >   they wanted to use
> > > - required the user to specify the mkfs-extraopts by hand to specify
> the
> > >   correct sector size: e.g.
> > >         bootloader --ptable gpt
> > >         part --fstype ext4 --source rootfs --label rofs-a
> --mkfs-extraopts
> > > "-b 4096"
> > >         part --fstype ext4 --source rootfs --use-uuid --mkfs-extraopt=
s
> "-b
> > > 4096"
> > > - specifying --mkfs-extraopts replaces the defaults with the
> > >   user-supplied values
> > > - only provided details to support using variable sector-sizes with
> > >   ext[234] filesystems
> > > - it would not be possible to generate images with different sector
> > >   sizes in the same build since the configuration and *wks files woul=
d
> > >   need to change and the build re-run for each size
> > >
> > > Update the sector-size handling so that:
> > > - the sector-size will now be provided on the cmdline to the "wic ls"=
,
> > >   "wic cp", "wic rm", and "wic create" commands: default =3D 512
> > > - this means the configuration and/or --vars file does not need to be
> > >   changed in order to perform those operations on images with differe=
nt
> > >   sector sizes
> > > - support is provided implicitly for mkdosfs and ext[234] partitions
> > > - the user no longer needs to know and supply the sector-size magic i=
n
> > >   --mkfs-extraopts (thereby clobbering the other defaults)
> > >
> >
> > It wasn't clear to me when scanning the patch. For configuration
> > files with a sector size, is it now completely ignored ?
>
> Yes.
>
> While trying to use the existing implementation in actual production
> workflows we found a number of shortcomings that are addressed with this
> update. Additionally, the ultimate goal is to make wic an independent
> utility from oe-core so it can be easily used by external tools
> post-build.
>
> If sector-size is not available on the cmdline, then a --vars file would
> be needed for every simple wic invocation such as "wic cp", "wic ls",
> and "wic rm"... which would be silly. Take a look at the patch I
> submitted a week or so ago to see how the oe-selftests would have to be
> updated to support this.
>
> If sector-size is available both on the cmdline and in a --vars file
> then which one wins? Ultimately having it specified in both places is
> only going to lead to confusion as people will be changing it in one
> place and not realizing it's also defined (and taking precedence) from
> somewhere else. I believe this is currently the case with
> --native-sysroot, which probably needs fixing as well since several
> oe-selftests are trying to use it, but I doubt it is working the way the
> test writers expect.


> One parameter specified in one place so a user would not need multiple
> sets of configuration files to perform a simple "wic ls" of images with
> different sector sizes; simply specify it on the cmdline if you want
> something other than 512.
>

That's not a good migration path. You can't simply throw away
someone's existing configuration and ask them to update to a
new one. I didn't even see an error thrown with migration
instructions.

There's many different users of things like this, we can't simply
change the interface without some way to migrate.

Bruce



>
> > Apologies if I missed where existing configs were used to prime
> > the parameters to the functions.
> >
> > Bruce
> >
> >
> >
> > >
> > > AI-Generated: codex/gpt-5.1-codex-max
> > > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > > ---
> > > changes since v2:
> > > - none
> > >
> > > changes since v1:
> > > - none
> > > ---
> > >  meta/lib/oeqa/selftest/cases/wic.py           | 39 ++++---------
> > >  scripts/lib/wic/engine.py                     | 45 +++++++--------
> > >  scripts/lib/wic/help.py                       | 23 +++++---
> > >  scripts/lib/wic/partition.py                  | 55 +++++++++++++++++=
--
> > >  scripts/lib/wic/plugins/imager/direct.py      | 18 ++----
> > >  scripts/lib/wic/plugins/source/bootimg_efi.py |  5 +-
> > >  .../lib/wic/plugins/source/bootimg_pcbios.py  | 11 ++--
> > >  .../wic/plugins/source/isoimage_isohybrid.py  |  5 +-
> > >  scripts/wic                                   |  8 +++
> > >  9 files changed, 125 insertions(+), 84 deletions(-)
> > >
> > > diff --git a/meta/lib/oeqa/selftest/cases/wic.py
> > > b/meta/lib/oeqa/selftest/cases/wic.py
> > > index ecaee5a29144..7ad61fa700f7 100644
> > > --- a/meta/lib/oeqa/selftest/cases/wic.py
> > > +++ b/meta/lib/oeqa/selftest/cases/wic.py
> > > @@ -935,33 +935,22 @@ bootloader --ptable gpt""")
> > >          finally:
> > >              os.remove(wks_file)
> > >
> > > -    def test_wic_sector_size(self):
> > > -        """Test generation image sector size"""
> > > -
> > > +    def test_wic_sector_size_cli(self):
> > > +        """Test sector size handling via CLI option."""
> > > +
> > >          oldpath =3D os.environ['PATH']
> > >          os.environ['PATH'] =3D get_bb_var("PATH", "wic-tools")
> > >
> > >          try:
> > > -            # Add WIC_SECTOR_SIZE into config
> > > -            config =3D 'WIC_SECTOR_SIZE =3D "4096"\n'\
> > > -                     'WICVARS:append =3D " WIC_SECTOR_SIZE"\n'
> > > -            self.append_config(config)
> > >              bitbake('core-image-minimal')
> > >
> > > -            # Check WIC_SECTOR_SIZE apply to bitbake variable
> > > -            wic_sector_size_str =3D get_bb_var('WIC_SECTOR_SIZE',
> > > 'core-image-minimal')
> > > -            wic_sector_size =3D int(wic_sector_size_str)
> > > -            self.assertEqual(4096, wic_sector_size)
> > > -
> > > -            self.logger.info("Test wic_sector_size: %d \n" %
> > > wic_sector_size)
> > > -
> > >              with NamedTemporaryFile("w", suffix=3D".wks") as wks:
> > >                  wks.writelines(
> > >                      ['bootloader --ptable gpt\n',
> > > -                     'part --fstype ext4 --source rootfs --label
> rofs-a
> > > --mkfs-extraopts "-b 4096"\n',
> > > -                     'part --fstype ext4 --source rootfs --use-uuid
> > > --mkfs-extraopts "-b 4096"\n'])
> > > +                     'part --fstype ext4 --source rootfs --label
> > > rofs-a\n',
> > > +                     'part --fstype ext4 --source rootfs
> --use-uuid\n'])
> > >                  wks.flush()
> > > -                cmd =3D "wic create %s -e core-image-minimal -o %s" =
% (
> > > wks.name, self.resultdir)
> > > +                cmd =3D "wic create %s -e core-image-minimal -o %s
> > > --sector-size 4096" % (wks.name, self.resultdir)
> > >                  runCmd(cmd)
> > >                  wksname =3D os.path.splitext(os.path.basename(wks.na=
me
> ))[0]
> > >                  images =3D glob(os.path.join(self.resultdir,
> "%s-*direct" %
> > > wksname))
> > > @@ -969,24 +958,18 @@ bootloader --ptable gpt""")
> > >
> > >              sysroot =3D get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-too=
ls')
> > >              # list partitions
> > > -            result =3D runCmd("wic ls %s -n %s" % (images[0], sysroo=
t))
> > > +            result =3D runCmd("wic ls %s -n %s --sector-size 4096" %
> > > (images[0], sysroot))
> > >              self.assertEqual(3, len(result.output.split('\n')))
> > >
> > > -            # verify partition size with wic
> > > -            res =3D runCmd("export PARTED_SECTOR_SIZE=3D%d; parted -=
m %s
> unit
> > > b p" % (wic_sector_size, images[0]),
> > > +            # verify partition size with parted output
> > > +            res =3D runCmd("export PARTED_SECTOR_SIZE=3D%d; parted -=
m %s
> unit
> > > b p" % (4096, images[0]),
> > >                           stderr=3Dsubprocess.PIPE)
> > >
> > > -            # parse parted output which looks like this:
> > > -            # BYT;\n
> > > -            #
> > >
> /var/tmp/wic/build/tmpgjzzefdd-202410281021-sda.direct:78569472B:file:409=
6:4096:gpt::;\n
> > > -            # 1:139264B:39284735B:39145472B:ext4:rofs-a:;\n
> > > -            # 2:39284736B:78430207B:39145472B:ext4:primary:;\n
> > >              disk_info =3D res.output.splitlines()[1]
> > > -            # Check sector sizes
> > >              sector_size_logical =3D int(disk_info.split(":")[3])
> > >              sector_size_physical =3D int(disk_info.split(":")[4])
> > > -            self.assertEqual(wic_sector_size, sector_size_logical,
> > > "Logical sector size is not %d." % wic_sector_size)
> > > -            self.assertEqual(wic_sector_size, sector_size_physical,
> > > "Physical sector size is not %d." % wic_sector_size)
> > > +            self.assertEqual(4096, sector_size_logical, "Logical
> sector
> > > size is not 4096.")
> > > +            self.assertEqual(4096, sector_size_physical, "Physical
> sector
> > > size is not 4096.")
> > >
> > >          finally:
> > >              os.environ['PATH'] =3D oldpath
> > > diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
> > > index 9d596be3a723..7753f431f91d 100644
> > > --- a/scripts/lib/wic/engine.py
> > > +++ b/scripts/lib/wic/engine.py
> > > @@ -224,7 +224,7 @@ def wic_list(args, scripts_path):
> > >
> > >
> > >  class Disk:
> > > -    def __init__(self, imagepath, native_sysroot, fstypes=3D('fat',
> 'ext')):
> > > +    def __init__(self, imagepath, native_sysroot, fstypes=3D('fat',
> 'ext'),
> > > sector_size=3D512):
> > >          self.imagepath =3D imagepath
> > >          self.native_sysroot =3D native_sysroot
> > >          self.fstypes =3D fstypes
> > > @@ -233,16 +233,7 @@ class Disk:
> > >          self._lsector_size =3D None
> > >          self._psector_size =3D None
> > >          self._ptable_format =3D None
> > > -
> > > -        # define sector size
> > > -        sector_size_str =3D get_bitbake_var('WIC_SECTOR_SIZE')
> > > -        if sector_size_str is not None:
> > > -            try:
> > > -                self.sector_size =3D int(sector_size_str)
> > > -            except ValueError:
> > > -                self.sector_size =3D None
> > > -        else:
> > > -            self.sector_size =3D None
> > > +        self.sector_size =3D sector_size
> > >
> > >          # find parted
> > >          # read paths from $PATH environment variable
> > > @@ -271,7 +262,7 @@ class Disk:
> > >          if self._partitions is None:
> > >              self._partitions =3D OrderedDict()
> > >
> > > -            if self.sector_size is not None:
> > > +            if self.sector_size:
> > >                  out =3D exec_cmd("export PARTED_SECTOR_SIZE=3D%d; %s=
 -sm
> %s
> > > unit B print" % \
> > >                             (self.sector_size, self.parted,
> > > self.imagepath), True)
> > >              else:
> > > @@ -312,11 +303,15 @@ class Disk:
> > >              raise WicError("Partition %s is not in the image" % pnum=
)
> > >          part =3D self.partitions[pnum]
> > >          # check if fstype is supported
> > > +        # NOTE: parted is unable to identify dos-type partitions wit=
h
> a
> > > 4k sector-size
> > > +        #       if the type is empty and a non-default sector size i=
s
> > > used, assume 'fat'
> > > +        #       fdisk identifies them without issue
> > > +        part_fstype =3D part.fstype if part.fstype or self.sector_si=
ze
> =3D=3D
> > > 512 else 'fat'
> > >          for fstype in self.fstypes:
> > > -            if part.fstype.startswith(fstype):
> > > +            if part_fstype.startswith(fstype):
> > >                  break
> > >          else:
> > > -            raise WicError("Not supported fstype:
> {}".format(part.fstype))
> > > +            raise WicError("Not supported fstype:
> {}".format(part_fstype))
> > >          if pnum not in self._partimages:
> > >              tmpf =3D tempfile.NamedTemporaryFile(prefix=3D"wic-part"=
)
> > >              dst_fname =3D tmpf.name
> > > @@ -586,8 +581,9 @@ class Disk:
> > >                              label =3D part.get("name")
> > >                              label_str =3D "-n {}".format(label) if l=
abel
> > > else ''
> > >
> > > -                            cmd =3D "{} {} -C {}
> {}".format(self.mkdosfs,
> > > label_str, partfname,
> > > -
> part['size'])
> > > +                            sector_str =3D "-S
> {}".format(self.sector_size)
> > > if self.sector_size else ''
> > > +                            cmd =3D "{} {} {} -C {}
> > > {}".format(self.mkdosfs, label_str, sector_str, partfname,
> > > +
>  part['size'])
> > >                              exec_cmd(cmd)
> > >                              # copy content from the temporary
> directory
> > > to the new partition
> > >                              cmd =3D "{} -snompi {} {}/*
> > > ::".format(self.mcopy, partfname, tmpdir)
> > > @@ -609,14 +605,19 @@ class Disk:
> > >
> > >  def wic_ls(args, native_sysroot):
> > >      """List contents of partitioned image or vfat partition."""
> > > -    disk =3D Disk(args.path.image, native_sysroot)
> > > +    disk =3D Disk(args.path.image, native_sysroot,
> > > sector_size=3Dargs.sector_size)
> > >      if not args.path.part:
> > >          if disk.partitions:
> > >              print('Num     Start        End          Size
> Fstype')
> > >              for part in disk.partitions.values():
> > > +                # size values are in bytes from parted; convert to
> > > sectors if a custom sector size was requested
> > > +                display_size =3D part.size
> > > +                if args.sector_size and args.sector_size !=3D
> > > disk._lsector_size:
> > > +                    display_size =3D part.size // args.sector_size
> > >                  print("{:2d}  {:12d} {:12d} {:12d}  {}".format(\
> > > -                          part.pnum, part.start, part.end,
> > > -                          part.size, part.fstype))
> > > +                          part.pnum, part.start // args.sector_size,
> > > +                          part.end // args.sector_size,
> > > +                          display_size, part.fstype))
> > >      else:
> > >          path =3D args.path.path or '/'
> > >          print(disk.dir(args.path.part, path))
> > > @@ -627,9 +628,9 @@ def wic_cp(args, native_sysroot):
> > >      partitioned image.
> > >      """
> > >      if isinstance(args.dest, str):
> > > -        disk =3D Disk(args.src.image, native_sysroot)
> > > +        disk =3D Disk(args.src.image, native_sysroot,
> > > sector_size=3Dargs.sector_size)
> > >      else:
> > > -        disk =3D Disk(args.dest.image, native_sysroot)
> > > +        disk =3D Disk(args.dest.image, native_sysroot,
> > > sector_size=3Dargs.sector_size)
> > >      disk.copy(args.src, args.dest)
> > >
> > >
> > > @@ -638,7 +639,7 @@ def wic_rm(args, native_sysroot):
> > >      Remove files or directories from the vfat partition of
> > >      partitioned image.
> > >      """
> > > -    disk =3D Disk(args.path.image, native_sysroot)
> > > +    disk =3D Disk(args.path.image, native_sysroot,
> > > sector_size=3Dargs.sector_size)
> > >      disk.remove(args.path.part, args.path.path, args.recursive_delet=
e)
> > >
> > >  def wic_write(args, native_sysroot):
> > > diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> > > index 6b49a67de938..5d7c40456a80 100644
> > > --- a/scripts/lib/wic/help.py
> > > +++ b/scripts/lib/wic/help.py
> > > @@ -118,7 +118,7 @@ wic_create_usage =3D """
> > >   usage: wic create <wks file or image name> [-o <DIRNAME> | --outdir
> > > <DIRNAME>]
> > >              [-e | --image-name] [-s, --skip-build-check] [-D, --debu=
g]
> > >              [-r, --rootfs-dir] [-b, --bootimg-dir]
> > > -            [-k, --kernel-dir] [-n, --native-sysroot] [-f,
> --build-rootfs]
> > > +            [-k, --kernel-dir] [-n, --native-sysroot] [--sector-size
> > > <bytes>] [-f, --build-rootfs]
> > >              [-c, --compress-with] [-m, --bmap]
> > >
> > >   This command creates an OpenEmbedded image based on the 'OE kicksta=
rt
> > > @@ -139,13 +139,16 @@ SYNOPSIS
> > >      wic create <wks file or image name> [-o <DIRNAME> | --outdir
> > > <DIRNAME>]
> > >          [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
> > >          [-r, --rootfs-dir] [-b, --bootimg-dir]
> > > -        [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootf=
s]
> > > +        [-k, --kernel-dir] [-n, --native-sysroot] [--sector-size
> <bytes>]
> > > [-f, --build-rootfs]
> > >          [-c, --compress-with] [-m, --bmap] [--no-fstab-update]
> > >
> > >  DESCRIPTION
> > >      This command creates an OpenEmbedded image based on the 'OE
> > >      kickstart commands' found in the <wks file>.
> > >
> > > +    Use the --sector-size option to select the sector size (in bytes=
)
> > > +    used for partition layout calculations (default is 512).
> > > +
> > >      In order to do this, wic needs to know the locations of the
> > >      various build artifacts required to build the image.
> > >
> > > @@ -278,7 +281,7 @@ wic_ls_usage =3D """
> > >
> > >   List content of a partitioned image
> > >
> > > - usage: wic ls <image>[:<partition>[<path>]] [--native-sysroot <path=
>]
> > > + usage: wic ls <image>[:<partition>[<path>]] [--native-sysroot <path=
>]
> > > [--sector-size <bytes>]
> > >
> > >   This command  outputs either list of image partitions or directory
> > > contents
> > >   of vfat and ext* partitions.
> > > @@ -296,7 +299,7 @@ SYNOPSIS
> > >      wic ls <image>
> > >      wic ls <image>:<vfat or ext* partition>
> > >      wic ls <image>:<vfat or ext* partition><path>
> > > -    wic ls <image>:<vfat or ext* partition><path> --native-sysroot
> <path>
> > > +    wic ls <image>:<vfat or ext* partition><path> --native-sysroot
> <path>
> > > [--sector-size <bytes>]
> > >
> > >  DESCRIPTION
> > >      This command lists either partitions of the image or directory
> > > contents
> > > @@ -336,6 +339,8 @@ DESCRIPTION
> > >
> > >      The -n option is used to specify the path to the native sysroot
> > >      containing the tools(parted and mtools) to use.
> > > +    The --sector-size option sets the sector size used for partition
> math
> > > +    (default is 512 bytes).
> > >
> > >  """
> > >
> > > @@ -343,7 +348,7 @@ wic_cp_usage =3D """
> > >
> > >   Copy files and directories to/from the vfat or ext* partition
> > >
> > > - usage: wic cp <src> <dest> [--native-sysroot <path>]
> > > + usage: wic cp <src> <dest> [--native-sysroot <path>] [--sector-size
> > > <bytes>]
> > >
> > >   source/destination image in format <image>:<partition>[<path>]
> > >
> > > @@ -364,7 +369,7 @@ SYNOPSIS
> > >      wic cp <src> <dest>:<partition>
> > >      wic cp <src>:<partition> <dest>
> > >      wic cp <src> <dest-image>:<partition><path>
> > > -    wic cp <src> <dest-image>:<partition><path> --native-sysroot
> <path>
> > > +    wic cp <src> <dest-image>:<partition><path> --native-sysroot
> <path>
> > > [--sector-size <bytes>]
> > >
> > >  DESCRIPTION
> > >      This command copies files or directories either
> > > @@ -408,13 +413,15 @@ DESCRIPTION
> > >
> > >      The -n option is used to specify the path to the native sysroot
> > >      containing the tools(parted and mtools) to use.
> > > +    The --sector-size option sets the sector size used for partition
> math
> > > +    (default is 512 bytes).
> > >  """
> > >
> > >  wic_rm_usage =3D """
> > >
> > >   Remove files or directories from the vfat or ext* partitions
> > >
> > > - usage: wic rm <image>:<partition><path> [--native-sysroot <path>]
> > > + usage: wic rm <image>:<partition><path> [--native-sysroot <path>]
> > > [--sector-size <bytes>]
> > >
> > >   This command  removes files or directories from the vfat or ext*
> > > partitions of
> > >   the partitioned image.
> > > @@ -466,6 +473,8 @@ DESCRIPTION
> > >
> > >      The -n option is used to specify the path to the native sysroot
> > >      containing the tools(parted and mtools) to use.
> > > +    The --sector-size option sets the sector size used for partition
> math
> > > +    (default is 512 bytes).
> > >
> > >      The -r option is used to remove directories and their contents
> > >      recursively,this only applies to ext* partition.
> > > diff --git a/scripts/lib/wic/partition.py
> b/scripts/lib/wic/partition.py
> > > index 8fed686e903e..df6e3271649b 100644
> > > --- a/scripts/lib/wic/partition.py
> > > +++ b/scripts/lib/wic/partition.py
> > > @@ -65,6 +65,50 @@ class Partition():
> > >
> > >          self.lineno =3D lineno
> > >          self.source_file =3D ""
> > > +        self.sector_size =3D 512
> > > +
> > > +    def _mkdosfs_extraopts(self):
> > > +        """
> > > +        Build mkdosfs extra options ensuring the CLI sector size is
> > > applied.
> > > +        """
> > > +        extraopts =3D self.mkfs_extraopts or ''
> > > +        tokens =3D []
> > > +        skip_next =3D False
> > > +        for tok in extraopts.split():
> > > +            if skip_next:
> > > +                skip_next =3D False
> > > +                continue
> > > +            if tok =3D=3D '-S':
> > > +                skip_next =3D True
> > > +                continue
> > > +            if tok.startswith('-S'):
> > > +                continue
> > > +            tokens.append(tok)
> > > +        tokens.extend(['-S', str(self.sector_size)])
> > > +        return ' '.join(tokens).strip()
> > > +
> > > +    def _mkfs_ext_extraopts(self, base_opts):
> > > +        """
> > > +        Build mkfs.ext* extra options ensuring the CLI sector size i=
s
> > > applied.
> > > +        """
> > > +        extraopts =3D self.mkfs_extraopts or base_opts
> > > +        # Only add an explicit block size when a non-default sector
> size
> > > is requested.
> > > +        if self.sector_size and self.sector_size !=3D 512:
> > > +            tokens =3D []
> > > +            skip_next =3D False
> > > +            for tok in extraopts.split():
> > > +                if skip_next:
> > > +                    skip_next =3D False
> > > +                    continue
> > > +                if tok =3D=3D '-b':
> > > +                    skip_next =3D True
> > > +                    continue
> > > +                if tok.startswith('-b'):
> > > +                    continue
> > > +                tokens.append(tok)
> > > +            tokens.extend(['-b', str(self.sector_size)])
> > > +            return ' '.join(tokens).strip()
> > > +        return extraopts
> > >
> > >      def get_extra_block_count(self, current_blocks):
> > >          """
> > > @@ -138,6 +182,8 @@ class Partition():
> > >          Prepare content for individual partitions, depending on
> > >          partition command parameters.
> > >          """
> > > +        # capture the sector size requested on the CLI for mkdosfs
> > > invocations
> > > +        self.sector_size =3D getattr(creator, 'sector_size', 512) or=
 512
> > >          self.updated_fstab_path =3D updated_fstab_path
> > >          if self.updated_fstab_path and not
> (self.fstype.startswith("ext")
> > > or self.fstype =3D=3D "msdos"):
> > >              self.update_fstab_in_rootfs =3D True
> > > @@ -293,7 +339,7 @@ class Partition():
> > >          with open(rootfs, 'w') as sparse:
> > >              os.ftruncate(sparse.fileno(), rootfs_size * 1024)
> > >
> > > -        extraopts =3D self.mkfs_extraopts or "-F -i 8192"
> > > +        extraopts =3D self._mkfs_ext_extraopts("-F -i 8192")
> > >
> > >          # use hash_seed to generate reproducible ext4 images
> > >          (extraopts, pseudo) =3D self.get_hash_seed_ext4(extraopts,
> pseudo)
> > > @@ -401,7 +447,7 @@ class Partition():
> > >
> > >          size_str =3D ""
> > >
> > > -        extraopts =3D self.mkfs_extraopts or '-S 512'
> > > +        extraopts =3D self._mkdosfs_extraopts()
> > >
> > >          dosfs_cmd =3D "mkdosfs %s -i %s %s %s -C %s %d" % \
> > >                      (label_str, self.fsuuid, size_str, extraopts,
> rootfs,
> > > @@ -452,7 +498,7 @@ class Partition():
> > >          with open(rootfs, 'w') as sparse:
> > >              os.ftruncate(sparse.fileno(), size * 1024)
> > >
> > > -        extraopts =3D self.mkfs_extraopts or "-i 8192"
> > > +        extraopts =3D self._mkfs_ext_extraopts("-i 8192")
> > >
> > >          # use hash_seed to generate reproducible ext4 images
> > >          (extraopts, pseudo) =3D self.get_hash_seed_ext4(extraopts, N=
one)
> > > @@ -498,7 +544,7 @@ class Partition():
> > >
> > >          size_str =3D ""
> > >
> > > -        extraopts =3D self.mkfs_extraopts or '-S 512'
> > > +        extraopts =3D self._mkdosfs_extraopts()
> > >
> > >          dosfs_cmd =3D "mkdosfs %s -i %s %s %s -C %s %d" % \
> > >                      (label_str, self.fsuuid, extraopts, size_str,
> rootfs,
> > > @@ -559,4 +605,3 @@ class Partition():
> > >                      logger.warn("%s Inodes (of size %d) are too
> small." %
> > >                                  (get_err_str(self), size))
> > >                  break
> > > -
> > > diff --git a/scripts/lib/wic/plugins/imager/direct.py
> > > b/scripts/lib/wic/plugins/imager/direct.py
> > > index ad922cfbf122..3adc6eee6280 100644
> > > --- a/scripts/lib/wic/plugins/imager/direct.py
> > > +++ b/scripts/lib/wic/plugins/imager/direct.py
> > > @@ -67,6 +67,7 @@ class DirectPlugin(ImagerPlugin):
> > >          self._image =3D None
> > >          self.ptable_format =3D self.ks.bootloader.ptable
> > >          self.parts =3D self.ks.partitions
> > > +        self.sector_size =3D options.sector_size or 512
> > >
> > >          # as a convenience, set source to the boot partition source
> > >          # instead of forcing it to be set via bootloader --source
> > > @@ -78,7 +79,7 @@ class DirectPlugin(ImagerPlugin):
> > >          image_path =3D self._full_path(self.workdir, self.parts[0].d=
isk,
> > > "direct")
> > >          self._image =3D PartitionedImage(image_path, self.ptable_for=
mat,
> > > self.ks.bootloader.diskid,
> > >                                         self.parts,
> self.native_sysroot,
> > > -                                       options.extra_space)
> > > +                                       options.extra_space,
> > > self.sector_size)
> > >
> > >      def setup_workdir(self, workdir):
> > >          if workdir:
> > > @@ -294,15 +295,13 @@ MBR_OVERHEAD =3D 1
> > >  # Overhead of the GPT partitioning scheme
> > >  GPT_OVERHEAD =3D 34
> > >
> > > -# Size of a sector in bytes
> > > -SECTOR_SIZE =3D 512
> > > -
> > >  class PartitionedImage():
> > >      """
> > >      Partitioned image in a file.
> > >      """
> > >
> > > -    def __init__(self, path, ptable_format, disk_id, partitions,
> > > native_sysroot=3DNone, extra_space=3D0):
> > > +    def __init__(self, path, ptable_format, disk_id, partitions,
> > > native_sysroot=3DNone, extra_space=3D0,
> > > +                 sector_size=3D512):
> > >          self.path =3D path  # Path to the image file
> > >          self.numpart =3D 0  # Number of allocated partitions
> > >          self.realpart =3D 0 # Number of partitions in the partition
> table
> > > @@ -332,14 +331,7 @@ class PartitionedImage():
> > >          self.partitions =3D partitions
> > >          self.partimages =3D []
> > >          # Size of a sector used in calculations
> > > -        sector_size_str =3D get_bitbake_var('WIC_SECTOR_SIZE')
> > > -        if sector_size_str is not None:
> > > -            try:
> > > -                self.sector_size =3D int(sector_size_str)
> > > -            except ValueError:
> > > -                self.sector_size =3D SECTOR_SIZE
> > > -        else:
> > > -            self.sector_size =3D SECTOR_SIZE
> > > +        self.sector_size =3D sector_size or 512
> > >
> > >          self.native_sysroot =3D native_sysroot
> > >          num_real_partitions =3D len([p for p in self.partitions if n=
ot
> > > p.no_table])
> > > diff --git a/scripts/lib/wic/plugins/source/bootimg_efi.py
> > > b/scripts/lib/wic/plugins/source/bootimg_efi.py
> > > index 430b0a4b023a..864d6898fc9d 100644
> > > --- a/scripts/lib/wic/plugins/source/bootimg_efi.py
> > > +++ b/scripts/lib/wic/plugins/source/bootimg_efi.py
> > > @@ -415,8 +415,9 @@ class BootimgEFIPlugin(SourcePlugin):
> > >
> > >          label =3D part.label if part.label else "ESP"
> > >
> > > -        dosfs_cmd =3D "mkdosfs -v -n %s -i %s -C %s %d" % \
> > > -                    (label, part.fsuuid, bootimg, blocks)
> > > +        sector_size =3D getattr(creator, 'sector_size', 512) or 512
> > > +        dosfs_cmd =3D "mkdosfs -v -n %s -i %s -S %d -C %s %d" % \
> > > +                    (label, part.fsuuid, sector_size, bootimg, block=
s)
> > >          exec_native_cmd(dosfs_cmd, native_sysroot)
> > >          logger.debug("mkdosfs:\n%s" % (str(out)))
> > >
> > > diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
> > > b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
> > > index a7cc5d12c620..32edac47fa09 100644
> > > --- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
> > > +++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
> > > @@ -132,7 +132,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
> > >                  cls._do_prepare_grub(part, cr_workdir, oe_builddir,
> > >                                  kernel_dir, rootfs_dir,
> native_sysroot)
> > >              elif source_params['loader-bios'] =3D=3D 'syslinux':
> > > -                cls._do_prepare_syslinux(part, cr_workdir,
> bootimg_dir,
> > > +                cls._do_prepare_syslinux(part, creator, cr_workdir,
> > > bootimg_dir,
> > >                                      kernel_dir, native_sysroot)
> > >              else:
> > >                  raise WicError("unrecognized bootimg_pcbios loader:
> %s" %
> > > source_params['loader-bios'])
> > > @@ -142,7 +142,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
> > >          except KeyError:
> > >              # Required by do_install_disk
> > >              cls.loader =3D 'syslinux'
> > > -            cls._do_prepare_syslinux(part, cr_workdir, bootimg_dir,
> > > +            cls._do_prepare_syslinux(part, creator, cr_workdir,
> > > bootimg_dir,
> > >                                  kernel_dir, native_sysroot)
> > >
> > >      @classmethod
> > > @@ -240,7 +240,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
> > >          cfg.close()
> > >
> > >      @classmethod
> > > -    def _do_prepare_syslinux(cls, part, cr_workdir, bootimg_dir,
> > > +    def _do_prepare_syslinux(cls, part, creator, cr_workdir,
> bootimg_dir,
> > >                               kernel_dir, native_sysroot):
> > >          """
> > >          Called to do the actual content population for a partition
> i.e. it
> > > @@ -292,8 +292,9 @@ class BootimgPcbiosPlugin(SourcePlugin):
> > >
> > >          label =3D part.label if part.label else "boot"
> > >
> > > -        dosfs_cmd =3D "mkdosfs -n %s -i %s -S 512 -C %s %d" % \
> > > -                    (label, part.fsuuid, bootimg, blocks)
> > > +        sector_size =3D getattr(creator, 'sector_size', 512) or 512
> > > +        dosfs_cmd =3D "mkdosfs -n %s -i %s -S %d -C %s %d" % \
> > > +                    (label, part.fsuuid, sector_size, bootimg, block=
s)
> > >          exec_native_cmd(dosfs_cmd, native_sysroot)
> > >
> > >          mcopy_cmd =3D "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
> > > diff --git a/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
> > > b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
> > > index fdab188db1f8..9195ef5f3184 100644
> > > --- a/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
> > > +++ b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
> > > @@ -367,8 +367,9 @@ class IsoImagePlugin(SourcePlugin):
> > >
> > >              esp_label =3D source_params.get('esp_label', 'EFIimg')
> > >
> > > -            dosfs_cmd =3D 'mkfs.vfat -n \'%s\' -S 512 -C %s %d' \
> > > -                        % (esp_label, bootimg, blocks)
> > > +            sector_size =3D getattr(creator, 'sector_size', 512) or =
512
> > > +            dosfs_cmd =3D "mkfs.vfat -n '%s' -S %d -C %s %d" % \
> > > +                        (esp_label, sector_size, bootimg, blocks)
> > >              exec_native_cmd(dosfs_cmd, native_sysroot)
> > >
> > >              mmd_cmd =3D "mmd -i %s ::/EFI" % bootimg
> > > diff --git a/scripts/wic b/scripts/wic
> > > index 9137208f5e8f..0cef84ef630c 100755
> > > --- a/scripts/wic
> > > +++ b/scripts/wic
> > > @@ -376,6 +376,8 @@ def wic_init_parser_create(subparser):
> > >                        default=3D"direct", help=3D"the wic imager plu=
gin")
> > >      subparser.add_argument("--extra-space", type=3Dint,
> dest=3D"extra_space",
> > >                        default=3D0, help=3D"additional free disk spac=
e to
> add
> > > to the image")
> > > +    subparser.add_argument("--sector-size", dest=3D"sector_size",
> type=3Dint,
> > > default=3D512,
> > > +                      help=3D"sector size in bytes (default: 512)")
> > >      return
> > >
> > >
> > > @@ -413,6 +415,8 @@ def imgtype(arg):
> > >  def wic_init_parser_ls(subparser):
> > >      subparser.add_argument("path", type=3Dimgtype,
> > >                          help=3D"image spec: <image>[:<vfat
> > > partition>[<path>]]")
> > > +    subparser.add_argument("--sector-size", dest=3D"sector_size",
> type=3Dint,
> > > default=3D512,
> > > +                        help=3D"sector size in bytes (default: 512)"=
)
> > >      subparser.add_argument("-n", "--native-sysroot",
> > >                          help=3D"path to the native sysroot containin=
g
> the
> > > tools")
> > >      subparser.add_argument("-e", "--image-name", dest=3D"image_name"=
,
> > > @@ -433,6 +437,8 @@ def wic_init_parser_cp(subparser):
> > >                          help=3D"image spec: <image>:<vfat
> > > partition>[<path>] or <file>")
> > >      subparser.add_argument("dest",
> > >                          help=3D"image spec: <image>:<vfat
> > > partition>[<path>] or <file>")
> > > +    subparser.add_argument("--sector-size", dest=3D"sector_size",
> type=3Dint,
> > > default=3D512,
> > > +                        help=3D"sector size in bytes (default: 512)"=
)
> > >      subparser.add_argument("-n", "--native-sysroot",
> > >                          help=3D"path to the native sysroot containin=
g
> the
> > > tools")
> > >      subparser.add_argument("-e", "--image-name", dest=3D"image_name"=
,
> > > @@ -445,6 +451,8 @@ def wic_init_parser_cp(subparser):
> > >  def wic_init_parser_rm(subparser):
> > >      subparser.add_argument("path", type=3Dimgpathtype,
> > >                          help=3D"path: <image>:<vfat partition><path>=
")
> > > +    subparser.add_argument("--sector-size", dest=3D"sector_size",
> type=3Dint,
> > > default=3D512,
> > > +                        help=3D"sector size in bytes (default: 512)"=
)
> > >      subparser.add_argument("-n", "--native-sysroot",
> > >                          help=3D"path to the native sysroot containin=
g
> the
> > > tools")
> > >      subparser.add_argument("-r", dest=3D"recursive_delete",
> > > action=3D"store_true", default=3DFalse,
> > > --
> > > 2.51.0
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#231176):
> > > https://lists.openembedded.org/g/openembedded-core/message/231176
> > > Mute This Topic: https://lists.openembedded.org/mt/117833550/1050810
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [
> > > bruce.ashfield@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> > >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee
> > at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000000e5db0064af312eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 16, 2026 at 10:37=
=E2=80=AFAM Trevor Woerner &lt;<a href=3D"mailto:twoerner@gmail.com">twoern=
er@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Sun 2026-02-15 @ 10:09:03 PM, Bruce Ashfield wrote:<br>
&gt; On Sun, Feb 15, 2026 at 9:32=E2=80=AFPM Trevor Woerner via <a href=3D"=
http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.o=
penembedded.org</a><br>
&gt; &lt;twoerner=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; The previous implementation to add variable sector-size support:<=
br>
&gt; &gt; - required the variable WIC_SECTOR_SIZE either be defined in a<br=
>
&gt; &gt;=C2=A0 =C2=A0configuration file or be defined in a --vars file<br>
&gt; &gt; - this means that every invocation of &quot;wic ls&quot;, &quot;w=
ic cp&quot;, or &quot;wic rm&quot;<br>
&gt; &gt;=C2=A0 =C2=A0needed this variable defined (config or --vars)<br>
&gt; &gt; - required the user to create separate *wks files for every secto=
r size<br>
&gt; &gt;=C2=A0 =C2=A0they wanted to use<br>
&gt; &gt; - required the user to specify the mkfs-extraopts by hand to spec=
ify the<br>
&gt; &gt;=C2=A0 =C2=A0correct sector size: e.g.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootloader --ptable gpt<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part --fstype ext4 --source root=
fs --label rofs-a --mkfs-extraopts<br>
&gt; &gt; &quot;-b 4096&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0part --fstype ext4 --source root=
fs --use-uuid --mkfs-extraopts &quot;-b<br>
&gt; &gt; 4096&quot;<br>
&gt; &gt; - specifying --mkfs-extraopts replaces the defaults with the<br>
&gt; &gt;=C2=A0 =C2=A0user-supplied values<br>
&gt; &gt; - only provided details to support using variable sector-sizes wi=
th<br>
&gt; &gt;=C2=A0 =C2=A0ext[234] filesystems<br>
&gt; &gt; - it would not be possible to generate images with different sect=
or<br>
&gt; &gt;=C2=A0 =C2=A0sizes in the same build since the configuration and *=
wks files would<br>
&gt; &gt;=C2=A0 =C2=A0need to change and the build re-run for each size<br>
&gt; &gt;<br>
&gt; &gt; Update the sector-size handling so that:<br>
&gt; &gt; - the sector-size will now be provided on the cmdline to the &quo=
t;wic ls&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0&quot;wic cp&quot;, &quot;wic rm&quot;, and &quot;wic=
 create&quot; commands: default =3D 512<br>
&gt; &gt; - this means the configuration and/or --vars file does not need t=
o be<br>
&gt; &gt;=C2=A0 =C2=A0changed in order to perform those operations on image=
s with different<br>
&gt; &gt;=C2=A0 =C2=A0sector sizes<br>
&gt; &gt; - support is provided implicitly for mkdosfs and ext[234] partiti=
ons<br>
&gt; &gt; - the user no longer needs to know and supply the sector-size mag=
ic in<br>
&gt; &gt;=C2=A0 =C2=A0--mkfs-extraopts (thereby clobbering the other defaul=
ts)<br>
&gt; &gt;<br>
&gt; <br>
&gt; It wasn&#39;t clear to me when scanning the patch. For configuration<b=
r>
&gt; files with a sector size, is it now completely ignored ?<br>
<br>
Yes.<br>
<br>
While trying to use the existing implementation in actual production<br>
workflows we found a number of shortcomings that are addressed with this<br=
>
update. Additionally, the ultimate goal is to make wic an independent<br>
utility from oe-core so it can be easily used by external tools<br>
post-build.<br>
<br>
If sector-size is not available on the cmdline, then a --vars file would<br=
>
be needed for every simple wic invocation such as &quot;wic cp&quot;, &quot=
;wic ls&quot;,<br>
and &quot;wic rm&quot;... which would be silly. Take a look at the patch I<=
br>
submitted a week or so ago to see how the oe-selftests would have to be<br>
updated to support this.<br>
<br>
If sector-size is available both on the cmdline and in a --vars file<br>
then which one wins? Ultimately having it specified in both places is<br>
only going to lead to confusion as people will be changing it in one<br>
place and not realizing it&#39;s also defined (and taking precedence) from<=
br>
somewhere else. I believe this is currently the case with<br>
--native-sysroot, which probably needs fixing as well since several<br>
oe-selftests are trying to use it, but I doubt it is working the way the<br=
>
test writers expect.</blockquote><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
One parameter specified in one place so a user would not need multiple<br>
sets of configuration files to perform a simple &quot;wic ls&quot; of image=
s with<br>
different sector sizes; simply specify it on the cmdline if you want<br>
something other than 512.<br></blockquote><div><br></div><div><div class=3D=
"gmail_default" style=3D"font-size:small">That&#39;s not a good migration p=
ath. You can&#39;t simply throw away</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">someone&#39;s existing configuration and ask them to =
update to a</div><div class=3D"gmail_default" style=3D"font-size:small">new=
 one. I didn&#39;t even see an error thrown with migration=C2=A0</div><div =
class=3D"gmail_default" style=3D"font-size:small">instructions.</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">There&#39;s many different users of =
things like this, we can&#39;t simply</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">change the interface without some way to migrate.</d=
iv><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Br=
uce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; Apologies if I missed where existing configs were used to prime<br>
&gt; the parameters to the functions.<br>
&gt; <br>
&gt; Bruce<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; AI-Generated: codex/gpt-5.1-codex-max<br>
&gt; &gt; Signed-off-by: Trevor Woerner &lt;<a href=3D"mailto:twoerner@gmai=
l.com" target=3D"_blank">twoerner@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; changes since v2:<br>
&gt; &gt; - none<br>
&gt; &gt;<br>
&gt; &gt; changes since v1:<br>
&gt; &gt; - none<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/lib/oeqa/selftest/cases/wic.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 39 ++++---------<br>
&gt; &gt;=C2=A0 scripts/lib/wic/engine.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 45 +++++++--------<br>
&gt; &gt;=C2=A0 scripts/lib/wic/help.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 23 +++++---<br>
&gt; &gt;=C2=A0 scripts/lib/wic/partition.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 55 +++++++++++++++++--<br>
&gt; &gt;=C2=A0 scripts/lib/wic/plugins/imager/direct.py=C2=A0 =C2=A0 =C2=
=A0 | 18 ++----<br>
&gt; &gt;=C2=A0 scripts/lib/wic/plugins/source/bootimg_efi.py |=C2=A0 5 +-<=
br>
&gt; &gt;=C2=A0 .../lib/wic/plugins/source/bootimg_pcbios.py=C2=A0 | 11 ++-=
-<br>
&gt; &gt;=C2=A0 .../wic/plugins/source/isoimage_isohybrid.py=C2=A0 |=C2=A0 =
5 +-<br>
&gt; &gt;=C2=A0 scripts/wic=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 8 +++<br>
&gt; &gt;=C2=A0 9 files changed, 125 insertions(+), 84 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/lib/oeqa/selftest/cases/wic.py<br>
&gt; &gt; b/meta/lib/oeqa/selftest/cases/wic.py<br>
&gt; &gt; index ecaee5a29144..7ad61fa700f7 100644<br>
&gt; &gt; --- a/meta/lib/oeqa/selftest/cases/wic.py<br>
&gt; &gt; +++ b/meta/lib/oeqa/selftest/cases/wic.py<br>
&gt; &gt; @@ -935,33 +935,22 @@ bootloader --ptable gpt&quot;&quot;&quot;)<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 finally:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(wks_fil=
e)<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 def test_wic_sector_size(self):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Test generation im=
age sector size&quot;&quot;&quot;<br>
&gt; &gt; -<br>
&gt; &gt; +=C2=A0 =C2=A0 def test_wic_sector_size_cli(self):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Test sector size h=
andling via CLI option.&quot;&quot;&quot;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oldpath =3D os.environ[&#39;PAT=
H&#39;]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.environ[&#39;PATH&#39;] =3D =
get_bb_var(&quot;PATH&quot;, &quot;wic-tools&quot;)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add WIC_SECTOR_SIZE =
into config<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 config =3D &#39;WIC_SE=
CTOR_SIZE =3D &quot;4096&quot;\n&#39;\<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&#39;WICVARS:append =3D &quot; WIC_SECTOR_SIZE&quot;\n&#39;<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.append_config(con=
fig)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;core=
-image-minimal&#39;)<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check WIC_SECTOR_SIZ=
E apply to bitbake variable<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wic_sector_size_str =
=3D get_bb_var(&#39;WIC_SECTOR_SIZE&#39;,<br>
&gt; &gt; &#39;core-image-minimal&#39;)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wic_sector_size =3D in=
t(wic_sector_size_str)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(4096,=
 wic_sector_size)<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://self=
.logger.info" rel=3D"noreferrer" target=3D"_blank">self.logger.info</a>(&qu=
ot;Test wic_sector_size: %d \n&quot; %<br>
&gt; &gt; wic_sector_size)<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with NamedTempora=
ryFile(&quot;w&quot;, suffix=3D&quot;.wks&quot;) as wks:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wks=
.writelines(<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 [&#39;bootloader --ptable gpt\n&#39;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&#39;part --fstype ext4 --source rootfs --label rofs-a<br>
&gt; &gt; --mkfs-extraopts &quot;-b 4096&quot;\n&#39;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&#39;part --fstype ext4 --source rootfs --use-uuid<br>
&gt; &gt; --mkfs-extraopts &quot;-b 4096&quot;\n&#39;])<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&#39;part --fstype ext4 --source rootfs --label<br>
&gt; &gt; rofs-a\n&#39;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&#39;part --fstype ext4 --source rootfs --use-uuid\n&#39;])<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wks=
.flush()<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D =
&quot;wic create %s -e core-image-minimal -o %s&quot; % (<br>
&gt; &gt; <a href=3D"http://wks.name" rel=3D"noreferrer" target=3D"_blank">=
wks.name</a>, self.resultdir)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D =
&quot;wic create %s -e core-image-minimal -o %s<br>
&gt; &gt; --sector-size 4096&quot; % (<a href=3D"http://wks.name" rel=3D"no=
referrer" target=3D"_blank">wks.name</a>, self.resultdir)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 run=
Cmd(cmd)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wks=
name =3D os.path.splitext(os.path.basename(<a href=3D"http://wks.name" rel=
=3D"noreferrer" target=3D"_blank">wks.name</a>))[0]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ima=
ges =3D glob(os.path.join(self.resultdir, &quot;%s-*direct&quot; %<br>
&gt; &gt; wksname))<br>
&gt; &gt; @@ -969,24 +958,18 @@ bootloader --ptable gpt&quot;&quot;&quot;)<=
br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sysroot =3D get_b=
b_var(&#39;RECIPE_SYSROOT_NATIVE&#39;, &#39;wic-tools&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # list partitions=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D runCmd(&quo=
t;wic ls %s -n %s&quot; % (images[0], sysroot))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D runCmd(&quo=
t;wic ls %s -n %s --sector-size 4096&quot; %<br>
&gt; &gt; (images[0], sysroot))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(=
3, len(result.output.split(&#39;\n&#39;)))<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # verify partition siz=
e with wic<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D runCmd(&quot;e=
xport PARTED_SECTOR_SIZE=3D%d; parted -m %s unit<br>
&gt; &gt; b p&quot; % (wic_sector_size, images[0]),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # verify partition siz=
e with parted output<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D runCmd(&quot;e=
xport PARTED_SECTOR_SIZE=3D%d; parted -m %s unit<br>
&gt; &gt; b p&quot; % (4096, images[0]),<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stderr=3Dsubprocess.PIPE)<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # parse parted output =
which looks like this:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # BYT;\n<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
&gt; &gt; /var/tmp/wic/build/tmpgjzzefdd-202410281021-sda.direct:78569472B:=
file:4096:4096:gpt::;\n<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # 1:139264B:39284735B:=
39145472B:ext4:rofs-a:;\n<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # 2:39284736B:78430207=
B:39145472B:ext4:primary:;\n<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disk_info =3D res=
.output.splitlines()[1]<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check sector sizes<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sector_size_logic=
al =3D int(disk_info.split(&quot;:&quot;)[3])<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sector_size_physi=
cal =3D int(disk_info.split(&quot;:&quot;)[4])<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(wic_s=
ector_size, sector_size_logical,<br>
&gt; &gt; &quot;Logical sector size is not %d.&quot; % wic_sector_size)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(wic_s=
ector_size, sector_size_physical,<br>
&gt; &gt; &quot;Physical sector size is not %d.&quot; % wic_sector_size)<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(4096,=
 sector_size_logical, &quot;Logical sector<br>
&gt; &gt; size is not 4096.&quot;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(4096,=
 sector_size_physical, &quot;Physical sector<br>
&gt; &gt; size is not 4096.&quot;)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 finally:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.environ[&#39;P=
ATH&#39;] =3D oldpath<br>
&gt; &gt; diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.p=
y<br>
&gt; &gt; index 9d596be3a723..7753f431f91d 100644<br>
&gt; &gt; --- a/scripts/lib/wic/engine.py<br>
&gt; &gt; +++ b/scripts/lib/wic/engine.py<br>
&gt; &gt; @@ -224,7 +224,7 @@ def wic_list(args, scripts_path):<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 class Disk:<br>
&gt; &gt; -=C2=A0 =C2=A0 def __init__(self, imagepath, native_sysroot, fsty=
pes=3D(&#39;fat&#39;, &#39;ext&#39;)):<br>
&gt; &gt; +=C2=A0 =C2=A0 def __init__(self, imagepath, native_sysroot, fsty=
pes=3D(&#39;fat&#39;, &#39;ext&#39;),<br>
&gt; &gt; sector_size=3D512):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.imagepath =3D imagepath<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.native_sysroot =3D native_=
sysroot<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.fstypes =3D fstypes<br>
&gt; &gt; @@ -233,16 +233,7 @@ class Disk:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._lsector_size =3D None<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._psector_size =3D None<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._ptable_format =3D None<br=
>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # define sector size<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 sector_size_str =3D get_bitbake_var(=
&#39;WIC_SECTOR_SIZE&#39;)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if sector_size_str is not None:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sec=
tor_size =3D int(sector_size_str)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except ValueError:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sec=
tor_size =3D None<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sector_size =3D N=
one<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sector_size =3D sector_size<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # find parted<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # read paths from $PATH environ=
ment variable<br>
&gt; &gt; @@ -271,7 +262,7 @@ class Disk:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._partitions is None:<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._partitions =
=3D OrderedDict()<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.sector_size is=
 not None:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.sector_size:<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out=
 =3D exec_cmd(&quot;export PARTED_SECTOR_SIZE=3D%d; %s -sm %s<br>
&gt; &gt; unit B print&quot; % \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(self.sector_size, self.parted,<br>
&gt; &gt; self.imagepath), True)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; @@ -312,11 +303,15 @@ class Disk:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise WicError(&q=
uot;Partition %s is not in the image&quot; % pnum)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 part =3D self.partitions[pnum]<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # check if fstype is supported<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # NOTE: parted is unable to identify=
 dos-type partitions with a<br>
&gt; &gt; 4k sector-size<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0if the t=
ype is empty and a non-default sector size is<br>
&gt; &gt; used, assume &#39;fat&#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0fdisk id=
entifies them without issue<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 part_fstype =3D part.fstype if part.=
fstype or self.sector_size =3D=3D<br>
&gt; &gt; 512 else &#39;fat&#39;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for fstype in self.fstypes:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if part.fstype.startsw=
ith(fstype):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if part_fstype.startsw=
ith(fstype):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bre=
ak<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise WicError(&quot;N=
ot supported fstype: {}&quot;.format(part.fstype))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise WicError(&quot;N=
ot supported fstype: {}&quot;.format(part_fstype))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if pnum not in self._partimages=
:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmpf =3D tempfile=
.NamedTemporaryFile(prefix=3D&quot;wic-part&quot;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst_fname =3D <a =
href=3D"http://tmpf.name" rel=3D"noreferrer" target=3D"_blank">tmpf.name</a=
><br>
&gt; &gt; @@ -586,8 +581,9 @@ class Disk:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 label =3D part.get(&quot;name&quot;)=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 label_str =3D &quot;-n {}&quot;.form=
at(label) if label<br>
&gt; &gt; else &#39;&#39;<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;{} {} -C {} {}&quot;.forma=
t(self.mkdosfs,<br>
&gt; &gt; label_str, partfname,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 part[&#3=
9;size&#39;])<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sector_str =3D &quot;-S {}&quot;.format(=
self.sector_size)<br>
&gt; &gt; if self.sector_size else &#39;&#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;{} {} {} -C {}<br>
&gt; &gt; {}&quot;.format(self.mkdosfs, label_str, sector_str, partfname,<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0part[&#39;size&#39;])<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_cmd(cmd)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # copy content from the temporary di=
rectory<br>
&gt; &gt; to the new partition<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;{} -snompi {} {}/*<br>
&gt; &gt; ::&quot;.format(self.mcopy, partfname, tmpdir)<br>
&gt; &gt; @@ -609,14 +605,19 @@ class Disk:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 def wic_ls(args, native_sysroot):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;List contents of partitione=
d image or vfat partition.&quot;&quot;&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 disk =3D Disk(args.path.image, native_sysroot)<br>
&gt; &gt; +=C2=A0 =C2=A0 disk =3D Disk(args.path.image, native_sysroot,<br>
&gt; &gt; sector_size=3Dargs.sector_size)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if not args.path.part:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if disk.partitions:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&#39;Num=C2=
=A0 =C2=A0 =C2=A0Start=C2=A0 =C2=A0 =C2=A0 =C2=A0 End=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Size=C2=A0 =C2=A0 =C2=A0 Fstype&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for part in disk.=
partitions.values():<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # size v=
alues are in bytes from parted; convert to<br>
&gt; &gt; sectors if a custom sector size was requested<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 display_=
size =3D part.size<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if args.=
sector_size and args.sector_size !=3D<br>
&gt; &gt; disk._lsector_size:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 display_size =3D part.size // args.sector_size<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pri=
nt(&quot;{:2d}=C2=A0 {:12d} {:12d} {:12d}=C2=A0 {}&quot;.format(\<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 part.pnum, part.start, part.end,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 part.size, part.fstype))<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 part.pnum, part.start // args.sector_size,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 part.end // args.sector_size,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 display_size, part.fstype))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D args.path.path or &#39=
;/&#39;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(disk.dir(args.path.part, =
path))<br>
&gt; &gt; @@ -627,9 +628,9 @@ def wic_cp(args, native_sysroot):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 partitioned image.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if isinstance(args.dest, str):<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk =3D Disk(args.src.image, native=
_sysroot)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk =3D Disk(args.src.image, native=
_sysroot,<br>
&gt; &gt; sector_size=3Dargs.sector_size)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk =3D Disk(args.dest.image, nativ=
e_sysroot)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk =3D Disk(args.dest.image, nativ=
e_sysroot,<br>
&gt; &gt; sector_size=3Dargs.sector_size)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 disk.copy(args.src, args.dest)<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; @@ -638,7 +639,7 @@ def wic_rm(args, native_sysroot):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 Remove files or directories from the vfat par=
tition of<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 partitioned image.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 disk =3D Disk(args.path.image, native_sysroot)<br>
&gt; &gt; +=C2=A0 =C2=A0 disk =3D Disk(args.path.image, native_sysroot,<br>
&gt; &gt; sector_size=3Dargs.sector_size)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 disk.remove(args.path.part, args.path.path, a=
rgs.recursive_delete)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 def wic_write(args, native_sysroot):<br>
&gt; &gt; diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py<br=
>
&gt; &gt; index 6b49a67de938..5d7c40456a80 100644<br>
&gt; &gt; --- a/scripts/lib/wic/help.py<br>
&gt; &gt; +++ b/scripts/lib/wic/help.py<br>
&gt; &gt; @@ -118,7 +118,7 @@ wic_create_usage =3D &quot;&quot;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0usage: wic create &lt;wks file or image name&gt; [-o =
&lt;DIRNAME&gt; | --outdir<br>
&gt; &gt; &lt;DIRNAME&gt;]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [-e | --image-nam=
e] [-s, --skip-build-check] [-D, --debug]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [-r, --rootfs-dir=
] [-b, --bootimg-dir]<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [-k, --kernel-dir] [-n=
, --native-sysroot] [-f, --build-rootfs]<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [-k, --kernel-dir] [-n=
, --native-sysroot] [--sector-size<br>
&gt; &gt; &lt;bytes&gt;] [-f, --build-rootfs]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [-c, --compress-w=
ith] [-m, --bmap]<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0This command creates an OpenEmbedded image based on t=
he &#39;OE kickstart<br>
&gt; &gt; @@ -139,13 +139,16 @@ SYNOPSIS<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 wic create &lt;wks file or image name&gt; [-o=
 &lt;DIRNAME&gt; | --outdir<br>
&gt; &gt; &lt;DIRNAME&gt;]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [-e | --image-name] [-s, --skip=
-build-check] [-D, --debug]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [-r, --rootfs-dir] [-b, --booti=
mg-dir]<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 [-k, --kernel-dir] [-n, --native-sys=
root] [-f, --build-rootfs]<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [-k, --kernel-dir] [-n, --native-sys=
root] [--sector-size &lt;bytes&gt;]<br>
&gt; &gt; [-f, --build-rootfs]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [-c, --compress-with] [-m, --bm=
ap] [--no-fstab-update]<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 DESCRIPTION<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 This command creates an OpenEmbedded image ba=
sed on the &#39;OE<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 kickstart commands&#39; found in the &lt;wks =
file&gt;.<br>
&gt; &gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 Use the --sector-size option to select the sector =
size (in bytes)<br>
&gt; &gt; +=C2=A0 =C2=A0 used for partition layout calculations (default is=
 512).<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 In order to do this, wic needs to know the lo=
cations of the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 various build artifacts required to build the=
 image.<br>
&gt; &gt;<br>
&gt; &gt; @@ -278,7 +281,7 @@ wic_ls_usage =3D &quot;&quot;&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0List content of a partitioned image<br>
&gt; &gt;<br>
&gt; &gt; - usage: wic ls &lt;image&gt;[:&lt;partition&gt;[&lt;path&gt;]] [=
--native-sysroot &lt;path&gt;]<br>
&gt; &gt; + usage: wic ls &lt;image&gt;[:&lt;partition&gt;[&lt;path&gt;]] [=
--native-sysroot &lt;path&gt;]<br>
&gt; &gt; [--sector-size &lt;bytes&gt;]<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0This command=C2=A0 outputs either list of image parti=
tions or directory<br>
&gt; &gt; contents<br>
&gt; &gt;=C2=A0 =C2=A0of vfat and ext* partitions.<br>
&gt; &gt; @@ -296,7 +299,7 @@ SYNOPSIS<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 wic ls &lt;image&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 wic ls &lt;image&gt;:&lt;vfat or ext* partiti=
on&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 wic ls &lt;image&gt;:&lt;vfat or ext* partiti=
on&gt;&lt;path&gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 wic ls &lt;image&gt;:&lt;vfat or ext* partition&gt=
;&lt;path&gt; --native-sysroot &lt;path&gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 wic ls &lt;image&gt;:&lt;vfat or ext* partition&gt=
;&lt;path&gt; --native-sysroot &lt;path&gt;<br>
&gt; &gt; [--sector-size &lt;bytes&gt;]<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 DESCRIPTION<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 This command lists either partitions of the i=
mage or directory<br>
&gt; &gt; contents<br>
&gt; &gt; @@ -336,6 +339,8 @@ DESCRIPTION<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 The -n option is used to specify the path to =
the native sysroot<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 containing the tools(parted and mtools) to us=
e.<br>
&gt; &gt; +=C2=A0 =C2=A0 The --sector-size option sets the sector size used=
 for partition math<br>
&gt; &gt; +=C2=A0 =C2=A0 (default is 512 bytes).<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 &quot;&quot;&quot;<br>
&gt; &gt;<br>
&gt; &gt; @@ -343,7 +348,7 @@ wic_cp_usage =3D &quot;&quot;&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0Copy files and directories to/from the vfat or ext* p=
artition<br>
&gt; &gt;<br>
&gt; &gt; - usage: wic cp &lt;src&gt; &lt;dest&gt; [--native-sysroot &lt;pa=
th&gt;]<br>
&gt; &gt; + usage: wic cp &lt;src&gt; &lt;dest&gt; [--native-sysroot &lt;pa=
th&gt;] [--sector-size<br>
&gt; &gt; &lt;bytes&gt;]<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0source/destination image in format &lt;image&gt;:&lt;=
partition&gt;[&lt;path&gt;]<br>
&gt; &gt;<br>
&gt; &gt; @@ -364,7 +369,7 @@ SYNOPSIS<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 wic cp &lt;src&gt; &lt;dest&gt;:&lt;partition=
&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 wic cp &lt;src&gt;:&lt;partition&gt; &lt;dest=
&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 wic cp &lt;src&gt; &lt;dest-image&gt;:&lt;par=
tition&gt;&lt;path&gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 wic cp &lt;src&gt; &lt;dest-image&gt;:&lt;partitio=
n&gt;&lt;path&gt; --native-sysroot &lt;path&gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 wic cp &lt;src&gt; &lt;dest-image&gt;:&lt;partitio=
n&gt;&lt;path&gt; --native-sysroot &lt;path&gt;<br>
&gt; &gt; [--sector-size &lt;bytes&gt;]<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 DESCRIPTION<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 This command copies files or directories eith=
er<br>
&gt; &gt; @@ -408,13 +413,15 @@ DESCRIPTION<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 The -n option is used to specify the path to =
the native sysroot<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 containing the tools(parted and mtools) to us=
e.<br>
&gt; &gt; +=C2=A0 =C2=A0 The --sector-size option sets the sector size used=
 for partition math<br>
&gt; &gt; +=C2=A0 =C2=A0 (default is 512 bytes).<br>
&gt; &gt;=C2=A0 &quot;&quot;&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 wic_rm_usage =3D &quot;&quot;&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0Remove files or directories from the vfat or ext* par=
titions<br>
&gt; &gt;<br>
&gt; &gt; - usage: wic rm &lt;image&gt;:&lt;partition&gt;&lt;path&gt; [--na=
tive-sysroot &lt;path&gt;]<br>
&gt; &gt; + usage: wic rm &lt;image&gt;:&lt;partition&gt;&lt;path&gt; [--na=
tive-sysroot &lt;path&gt;]<br>
&gt; &gt; [--sector-size &lt;bytes&gt;]<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0This command=C2=A0 removes files or directories from =
the vfat or ext*<br>
&gt; &gt; partitions of<br>
&gt; &gt;=C2=A0 =C2=A0the partitioned image.<br>
&gt; &gt; @@ -466,6 +473,8 @@ DESCRIPTION<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 The -n option is used to specify the path to =
the native sysroot<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 containing the tools(parted and mtools) to us=
e.<br>
&gt; &gt; +=C2=A0 =C2=A0 The --sector-size option sets the sector size used=
 for partition math<br>
&gt; &gt; +=C2=A0 =C2=A0 (default is 512 bytes).<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 The -r option is used to remove directories a=
nd their contents<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 recursively,this only applies to ext* partiti=
on.<br>
&gt; &gt; diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/parti=
tion.py<br>
&gt; &gt; index 8fed686e903e..df6e3271649b 100644<br>
&gt; &gt; --- a/scripts/lib/wic/partition.py<br>
&gt; &gt; +++ b/scripts/lib/wic/partition.py<br>
&gt; &gt; @@ -65,6 +65,50 @@ class Partition():<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.lineno =3D lineno<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.source_file =3D &quot;&quo=
t;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sector_size =3D 512<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 def _mkdosfs_extraopts(self):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Build mkdosfs extra options ensuring=
 the CLI sector size is<br>
&gt; &gt; applied.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 extraopts =3D self.mkfs_extraopts or=
 &#39;&#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tokens =3D []<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 skip_next =3D False<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for tok in extraopts.split():<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if skip_next:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 skip_nex=
t =3D False<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tok =3D=3D &#39;-S&=
#39;:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 skip_nex=
t =3D True<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tok.startswith(&#39=
;-S&#39;):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tokens.append(tok)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tokens.extend([&#39;-S&#39;, str(sel=
f.sector_size)])<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39; &#39;.join(tokens).stri=
p()<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 def _mkfs_ext_extraopts(self, base_opts):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Build mkfs.ext* extra options ensuri=
ng the CLI sector size is<br>
&gt; &gt; applied.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 extraopts =3D self.mkfs_extraopts or=
 base_opts<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Only add an explicit block size wh=
en a non-default sector size<br>
&gt; &gt; is requested.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.sector_size and self.sector_=
size !=3D 512:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tokens =3D []<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 skip_next =3D False<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for tok in extraopts.s=
plit():<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if skip_=
next:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 skip_next =3D False<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 continue<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tok =
=3D=3D &#39;-b&#39;:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 skip_next =3D True<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 continue<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if tok.s=
tartswith(&#39;-b&#39;):<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 continue<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tokens.a=
ppend(tok)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tokens.extend([&#39;-b=
&#39;, str(self.sector_size)])<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39; &#39;.joi=
n(tokens).strip()<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return extraopts<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 def get_extra_block_count(self, current_block=
s):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; @@ -138,6 +182,8 @@ class Partition():<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Prepare content for individual =
partitions, depending on<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 partition command parameters.<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # capture the sector size requested =
on the CLI for mkdosfs<br>
&gt; &gt; invocations<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sector_size =3D getattr(creator=
, &#39;sector_size&#39;, 512) or 512<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.updated_fstab_path =3D upd=
ated_fstab_path<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.updated_fstab_path and =
not (self.fstype.startswith(&quot;ext&quot;)<br>
&gt; &gt; or self.fstype =3D=3D &quot;msdos&quot;):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.update_fstab=
_in_rootfs =3D True<br>
&gt; &gt; @@ -293,7 +339,7 @@ class Partition():<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(rootfs, &#39;w&#39;) =
as sparse:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.ftruncate(spar=
se.fileno(), rootfs_size * 1024)<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 extraopts =3D self.mkfs_extraopts or=
 &quot;-F -i 8192&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 extraopts =3D self._mkfs_ext_extraop=
ts(&quot;-F -i 8192&quot;)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # use hash_seed to generate rep=
roducible ext4 images<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (extraopts, pseudo) =3D self.ge=
t_hash_seed_ext4(extraopts, pseudo)<br>
&gt; &gt; @@ -401,7 +447,7 @@ class Partition():<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_str =3D &quot;&quot;<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 extraopts =3D self.mkfs_extraopts or=
 &#39;-S 512&#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 extraopts =3D self._mkdosfs_extraopt=
s()<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dosfs_cmd =3D &quot;mkdosfs %s =
-i %s %s %s -C %s %d&quot; % \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (label_str, self.fsuuid, size_str, extraopts, rootfs,<br>
&gt; &gt; @@ -452,7 +498,7 @@ class Partition():<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(rootfs, &#39;w&#39;) =
as sparse:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.ftruncate(spar=
se.fileno(), size * 1024)<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 extraopts =3D self.mkfs_extraopts or=
 &quot;-i 8192&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 extraopts =3D self._mkfs_ext_extraop=
ts(&quot;-i 8192&quot;)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # use hash_seed to generate rep=
roducible ext4 images<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (extraopts, pseudo) =3D self.ge=
t_hash_seed_ext4(extraopts, None)<br>
&gt; &gt; @@ -498,7 +544,7 @@ class Partition():<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_str =3D &quot;&quot;<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 extraopts =3D self.mkfs_extraopts or=
 &#39;-S 512&#39;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 extraopts =3D self._mkdosfs_extraopt=
s()<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dosfs_cmd =3D &quot;mkdosfs %s =
-i %s %s %s -C %s %d&quot; % \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (label_str, self.fsuuid, extraopts, size_str, rootfs,<br>
&gt; &gt; @@ -559,4 +605,3 @@ class Partition():<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 logger.warn(&quot;%s Inodes (of size %d) are too small.&quot; %<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (get_err_str(self), si=
ze))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bre=
ak<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/scripts/lib/wic/plugins/imager/direct.py<br>
&gt; &gt; b/scripts/lib/wic/plugins/imager/direct.py<br>
&gt; &gt; index ad922cfbf122..3adc6eee6280 100644<br>
&gt; &gt; --- a/scripts/lib/wic/plugins/imager/direct.py<br>
&gt; &gt; +++ b/scripts/lib/wic/plugins/imager/direct.py<br>
&gt; &gt; @@ -67,6 +67,7 @@ class DirectPlugin(ImagerPlugin):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._image =3D None<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.ptable_format =3D self.ks.=
bootloader.ptable<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.parts =3D self.ks.partitio=
ns<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sector_size =3D options.sector_=
size or 512<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # as a convenience, set source =
to the boot partition source<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # instead of forcing it to be s=
et via bootloader --source<br>
&gt; &gt; @@ -78,7 +79,7 @@ class DirectPlugin(ImagerPlugin):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 image_path =3D self._full_path(=
self.workdir, self.parts[0].disk,<br>
&gt; &gt; &quot;direct&quot;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._image =3D PartitionedImag=
e(image_path, self.ptable_format,<br>
&gt; &gt; self.ks.bootloader.diskid,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0self.parts, self.native_sysroot,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0options.extra_space)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0options.extra_space,<br>
&gt; &gt; self.sector_size)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 def setup_workdir(self, workdir):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if workdir:<br>
&gt; &gt; @@ -294,15 +295,13 @@ MBR_OVERHEAD =3D 1<br>
&gt; &gt;=C2=A0 # Overhead of the GPT partitioning scheme<br>
&gt; &gt;=C2=A0 GPT_OVERHEAD =3D 34<br>
&gt; &gt;<br>
&gt; &gt; -# Size of a sector in bytes<br>
&gt; &gt; -SECTOR_SIZE =3D 512<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 class PartitionedImage():<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 Partitioned image in a file.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 def __init__(self, path, ptable_format, disk_id, p=
artitions,<br>
&gt; &gt; native_sysroot=3DNone, extra_space=3D0):<br>
&gt; &gt; +=C2=A0 =C2=A0 def __init__(self, path, ptable_format, disk_id, p=
artitions,<br>
&gt; &gt; native_sysroot=3DNone, extra_space=3D0,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0se=
ctor_size=3D512):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.path =3D path=C2=A0 # Path=
 to the image file<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.numpart =3D 0=C2=A0 # Numb=
er of allocated partitions<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.realpart =3D 0 # Number of=
 partitions in the partition table<br>
&gt; &gt; @@ -332,14 +331,7 @@ class PartitionedImage():<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.partitions =3D partitions<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.partimages =3D []<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Size of a sector used in calc=
ulations<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 sector_size_str =3D get_bitbake_var(=
&#39;WIC_SECTOR_SIZE&#39;)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if sector_size_str is not None:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sec=
tor_size =3D int(sector_size_str)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except ValueError:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sec=
tor_size =3D SECTOR_SIZE<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sector_size =3D S=
ECTOR_SIZE<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sector_size =3D sector_size or =
512<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.native_sysroot =3D native_=
sysroot<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_real_partitions =3D len([p =
for p in self.partitions if not<br>
&gt; &gt; p.no_table])<br>
&gt; &gt; diff --git a/scripts/lib/wic/plugins/source/bootimg_efi.py<br>
&gt; &gt; b/scripts/lib/wic/plugins/source/bootimg_efi.py<br>
&gt; &gt; index 430b0a4b023a..864d6898fc9d 100644<br>
&gt; &gt; --- a/scripts/lib/wic/plugins/source/bootimg_efi.py<br>
&gt; &gt; +++ b/scripts/lib/wic/plugins/source/bootimg_efi.py<br>
&gt; &gt; @@ -415,8 +415,9 @@ class BootimgEFIPlugin(SourcePlugin):<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 label =3D part.label if part.la=
bel else &quot;ESP&quot;<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 dosfs_cmd =3D &quot;mkdosfs -v -n %s=
 -i %s -C %s %d&quot; % \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (label, part.fsuuid, bootimg, blocks)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sector_size =3D getattr(creator, &#3=
9;sector_size&#39;, 512) or 512<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dosfs_cmd =3D &quot;mkdosfs -v -n %s=
 -i %s -S %d -C %s %d&quot; % \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (label, part.fsuuid, sector_size, bootimg, blocks)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_native_cmd(dosfs_cmd, nati=
ve_sysroot)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;mkdosfs:\n%s=
&quot; % (str(out)))<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py<br>
&gt; &gt; b/scripts/lib/wic/plugins/source/bootimg_pcbios.py<br>
&gt; &gt; index a7cc5d12c620..32edac47fa09 100644<br>
&gt; &gt; --- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py<br>
&gt; &gt; +++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py<br>
&gt; &gt; @@ -132,7 +132,7 @@ class BootimgPcbiosPlugin(SourcePlugin):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls=
._do_prepare_grub(part, cr_workdir, oe_builddir,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_dir, rootfs_dir=
, native_sysroot)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif source_param=
s[&#39;loader-bios&#39;] =3D=3D &#39;syslinux&#39;:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls._do_=
prepare_syslinux(part, cr_workdir, bootimg_dir,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls._do_=
prepare_syslinux(part, creator, cr_workdir,<br>
&gt; &gt; bootimg_dir,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_d=
ir, native_sysroot)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rai=
se WicError(&quot;unrecognized bootimg_pcbios loader: %s&quot; %<br>
&gt; &gt; source_params[&#39;loader-bios&#39;])<br>
&gt; &gt; @@ -142,7 +142,7 @@ class BootimgPcbiosPlugin(SourcePlugin):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except KeyError:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Required by do_=
install_disk<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls.loader =3D &#=
39;syslinux&#39;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls._do_prepare_syslin=
ux(part, cr_workdir, bootimg_dir,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cls._do_prepare_syslin=
ux(part, creator, cr_workdir,<br>
&gt; &gt; bootimg_dir,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_dir, native_sys=
root)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 @classmethod<br>
&gt; &gt; @@ -240,7 +240,7 @@ class BootimgPcbiosPlugin(SourcePlugin):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfg.close()<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 @classmethod<br>
&gt; &gt; -=C2=A0 =C2=A0 def _do_prepare_syslinux(cls, part, cr_workdir, bo=
otimg_dir,<br>
&gt; &gt; +=C2=A0 =C2=A0 def _do_prepare_syslinux(cls, part, creator, cr_wo=
rkdir, bootimg_dir,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel_dir, native_sysroot):<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Called to do the actual content=
 population for a partition i.e. it<br>
&gt; &gt; @@ -292,8 +292,9 @@ class BootimgPcbiosPlugin(SourcePlugin):<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 label =3D part.label if part.la=
bel else &quot;boot&quot;<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 dosfs_cmd =3D &quot;mkdosfs -n %s -i=
 %s -S 512 -C %s %d&quot; % \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (label, part.fsuuid, bootimg, blocks)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sector_size =3D getattr(creator, &#3=
9;sector_size&#39;, 512) or 512<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dosfs_cmd =3D &quot;mkdosfs -n %s -i=
 %s -S %d -C %s %d&quot; % \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (label, part.fsuuid, sector_size, bootimg, blocks)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_native_cmd(dosfs_cmd, nati=
ve_sysroot)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mcopy_cmd =3D &quot;mcopy -i %s=
 -s %s/* ::/&quot; % (bootimg, hdddir)<br>
&gt; &gt; diff --git a/scripts/lib/wic/plugins/source/isoimage_isohybrid.py=
<br>
&gt; &gt; b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py<br>
&gt; &gt; index fdab188db1f8..9195ef5f3184 100644<br>
&gt; &gt; --- a/scripts/lib/wic/plugins/source/isoimage_isohybrid.py<br>
&gt; &gt; +++ b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py<br>
&gt; &gt; @@ -367,8 +367,9 @@ class IsoImagePlugin(SourcePlugin):<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 esp_label =3D sou=
rce_params.get(&#39;esp_label&#39;, &#39;EFIimg&#39;)<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dosfs_cmd =3D &#39;mkf=
s.vfat -n \&#39;%s\&#39; -S 512 -C %s %d&#39; \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 % (esp_label, bootimg, blocks)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sector_size =3D getatt=
r(creator, &#39;sector_size&#39;, 512) or 512<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dosfs_cmd =3D &quot;mk=
fs.vfat -n &#39;%s&#39; -S %d -C %s %d&quot; % \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (esp_label, sector_size, bootimg, blocks)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_native_cmd(d=
osfs_cmd, native_sysroot)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mmd_cmd =3D &quot=
;mmd -i %s ::/EFI&quot; % bootimg<br>
&gt; &gt; diff --git a/scripts/wic b/scripts/wic<br>
&gt; &gt; index 9137208f5e8f..0cef84ef630c 100755<br>
&gt; &gt; --- a/scripts/wic<br>
&gt; &gt; +++ b/scripts/wic<br>
&gt; &gt; @@ -376,6 +376,8 @@ def wic_init_parser_create(subparser):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 default=3D&quot;direct&quot;, help=3D&quot;the wic imager=
 plugin&quot;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 subparser.add_argument(&quot;--extra-space&qu=
ot;, type=3Dint, dest=3D&quot;extra_space&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 default=3D0, help=3D&quot;additional free disk space to a=
dd<br>
&gt; &gt; to the image&quot;)<br>
&gt; &gt; +=C2=A0 =C2=A0 subparser.add_argument(&quot;--sector-size&quot;, =
dest=3D&quot;sector_size&quot;, type=3Dint,<br>
&gt; &gt; default=3D512,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 help=3D&quot;sector size in bytes (default: 512)&quot;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 return<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; @@ -413,6 +415,8 @@ def imgtype(arg):<br>
&gt; &gt;=C2=A0 def wic_init_parser_ls(subparser):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 subparser.add_argument(&quot;path&quot;, type=
=3Dimgtype,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&quot;image spec: &lt;image&gt;[:&lt;vfat<b=
r>
&gt; &gt; partition&gt;[&lt;path&gt;]]&quot;)<br>
&gt; &gt; +=C2=A0 =C2=A0 subparser.add_argument(&quot;--sector-size&quot;, =
dest=3D&quot;sector_size&quot;, type=3Dint,<br>
&gt; &gt; default=3D512,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 help=3D&quot;sector size in bytes (default: 512)&quot;=
)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 subparser.add_argument(&quot;-n&quot;, &quot;=
--native-sysroot&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&quot;path to the native sysroot containing=
 the<br>
&gt; &gt; tools&quot;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 subparser.add_argument(&quot;-e&quot;, &quot;=
--image-name&quot;, dest=3D&quot;image_name&quot;,<br>
&gt; &gt; @@ -433,6 +437,8 @@ def wic_init_parser_cp(subparser):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&quot;image spec: &lt;image&gt;:&lt;vfat<br=
>
&gt; &gt; partition&gt;[&lt;path&gt;] or &lt;file&gt;&quot;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 subparser.add_argument(&quot;dest&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&quot;image spec: &lt;image&gt;:&lt;vfat<br=
>
&gt; &gt; partition&gt;[&lt;path&gt;] or &lt;file&gt;&quot;)<br>
&gt; &gt; +=C2=A0 =C2=A0 subparser.add_argument(&quot;--sector-size&quot;, =
dest=3D&quot;sector_size&quot;, type=3Dint,<br>
&gt; &gt; default=3D512,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 help=3D&quot;sector size in bytes (default: 512)&quot;=
)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 subparser.add_argument(&quot;-n&quot;, &quot;=
--native-sysroot&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&quot;path to the native sysroot containing=
 the<br>
&gt; &gt; tools&quot;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 subparser.add_argument(&quot;-e&quot;, &quot;=
--image-name&quot;, dest=3D&quot;image_name&quot;,<br>
&gt; &gt; @@ -445,6 +451,8 @@ def wic_init_parser_cp(subparser):<br>
&gt; &gt;=C2=A0 def wic_init_parser_rm(subparser):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 subparser.add_argument(&quot;path&quot;, type=
=3Dimgpathtype,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&quot;path: &lt;image&gt;:&lt;vfat partitio=
n&gt;&lt;path&gt;&quot;)<br>
&gt; &gt; +=C2=A0 =C2=A0 subparser.add_argument(&quot;--sector-size&quot;, =
dest=3D&quot;sector_size&quot;, type=3Dint,<br>
&gt; &gt; default=3D512,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 help=3D&quot;sector size in bytes (default: 512)&quot;=
)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 subparser.add_argument(&quot;-n&quot;, &quot;=
--native-sysroot&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 help=3D&quot;path to the native sysroot containing=
 the<br>
&gt; &gt; tools&quot;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 subparser.add_argument(&quot;-r&quot;, dest=
=3D&quot;recursive_delete&quot;,<br>
&gt; &gt; action=3D&quot;store_true&quot;, default=3DFalse,<br>
&gt; &gt; --<br>
&gt; &gt; 2.51.0<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#231176):<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/mes=
sage/231176" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/message/231176</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117=
833550/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/117833550/1050810</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedde=
d.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-core/unsub</a> [<br>
&gt; &gt; <a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bru=
ce.ashfield@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; <br>
&gt; -- <br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await =
thee<br>
&gt; at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000000e5db0064af312eb--

