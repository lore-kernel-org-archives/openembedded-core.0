Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D37E8382A
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 19:40:34 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2241.1771270828901583675
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 11:40:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QWfitHNm;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8954c9daaeaso50330066d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 11:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771270828; x=1771875628; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Y/GTVWkUWiiY0pGo2W9lSL4Bhoao9fqVupwriKqw0Q=;
        b=QWfitHNmHQRUKsBthtH1cQJoWUlejZD0hKMou+LMq68/q7+bV9iREgTynBgBlKnExR
         RwYiqHIaOIv0yAxRSU1MN8jYu7O/10AFo9qZVyPulosCNz8oixDbbQ4ll/xmtPPLeVtY
         wHz/UKrF2eXZ0Lix2czWh7e710O5DB5JtyQFh7LfRLjEm/lF8+7sGH280dx4fy1h0aCm
         8Ekzzn/xy4S7fMC9ZuwM+hnp5CIDNtkJ4ZzR7iOukHE4C430FVWnouZU8Vr8YnjQgefA
         abWOYUu66ngsgB1Z3Cs56G2a4UcrF1BRvJo7tjHdxDTdNh2JlCb2kfeOJ/KZa0HvRy4p
         sIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771270828; x=1771875628;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Y/GTVWkUWiiY0pGo2W9lSL4Bhoao9fqVupwriKqw0Q=;
        b=FfcPMp30BObS++o5WMTF1ZhpB9Nwp5cHvlg38qMUvhii5GoNoEdo5QtftIJsN6rY5P
         ODkzBGZfRO/dQaD48qcSLoXIgELDrLvvpyBxtepdifLmc8RdQ62TaTOENsNm6NZeg5Rm
         odO85HlUy+LjJuiAUFENY1tVzbpwMizRRBTswFshJWQNtx01+F/c9dlX/wiGPRmQ1Bz3
         LwN5CMi8OjmmEYPVOu35cD2HxpHYI6TVazFsLwZhy67BHHZLd6WGrwerNjHF15pIe7j3
         19mVJvf8/1LEWgzXaY/C3sAXjrWacySIN6YEstpjSXWXA8JAkjrXAiz29mVy973ndU49
         10tA==
X-Gm-Message-State: AOJu0YwxZ8380qHQKTumDJUoCgHf/dSOMphjjw8hqCPGVYjUHMnFpU9G
	SXTXegFOfWI9BkaQZ/78ZSXSehFbTl7z6+6rdvTvXRVnXexvzMLQVL5e
X-Gm-Gg: AZuq6aJYX+PaSVeECfVkjuqlZClsx4r70BYiCOJSgObm9meYe5hG3+0BeKylc4wiLoW
	TuTyalbHdX4N/h5hhWvRKBQBU4xmj3GXYId0Pd2gDxzJyp4j8d4og2ElhY4l6PJs2EQyUUcVUkC
	1ybnSCYdFM1WoR44Bqj6Jw7jam88gj5trqf1YEeZ6pNRkynKpiCNBw0Uj/DWpnd53T63TaeyHTr
	GByYr0niGD/esHkL/5POPI1RzhQaauHsRY+ibMVydHrljhqV1iv/4gaaVvCoHsqlnU5HJXcfilF
	Kd61vV2LExZcIHT/cb+I9AMDOD8JSwv35EJx+0OlWf4uxAftNW2NPpHiMrXZLy8oMAUV1HkagiQ
	9GJHig/bUycqjMuBOUtdavnqr7uNCEYrs3Bf5ygD6BjF9gYpheN5y/BZ7fWcMzgSmJ0V/K+dhTv
	G5BN8Fr+x3jR0QfC0y3TWwvOPdcQO/aW8ZEjRMpijWXbEOVRQXXZW+KIKlevC1dFD9tA==
X-Received: by 2002:ad4:5c6a:0:b0:888:3d3b:c9f8 with SMTP id 6a1803df08f44-897349171dbmr180024616d6.32.1771270827429;
        Mon, 16 Feb 2026 11:40:27 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506b275d59fsm75977231cf.32.2026.02.16.11.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 11:40:26 -0800 (PST)
Date: Mon, 16 Feb 2026 14:40:23 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 1/2] wic: re-implement sector-size support
Message-ID: <aZNyp2WYqkGl3Jy-@localhost.localdomain>
References: <20260216023159.1307348-1-twoerner@gmail.com>
 <CADkTA4P6F67uqO5mYiArpEMXoBzp8qW2RcukWcQE_1NGJM9EWQ@mail.gmail.com>
 <aZM5vb4p6WmBcMbV@localhost.localdomain>
 <CADkTA4PPAJw5CEh+FU=R5iwCaxGFp0iWxJkZnUBX_Buo8GYYTg@mail.gmail.com>
 <aZNauW8YV_99eu6K@localhost.localdomain>
 <CADkTA4NZq8B53AZ3fAJcxrwex82bRBFAHYyomA8OGL-oQ=4PEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkTA4NZq8B53AZ3fAJcxrwex82bRBFAHYyomA8OGL-oQ=4PEw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 19:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231220

On Mon 2026-02-16 @ 01:49:22 PM, Bruce Ashfield wrote:
> On Mon, Feb 16, 2026 at 12:58 PM Trevor Woerner <twoerner@gmail.com> wrote:
> 
> > On Mon 2026-02-16 @ 11:01:28 AM, Bruce Ashfield wrote:
> > > On Mon, Feb 16, 2026 at 10:37 AM Trevor Woerner <twoerner@gmail.com>
> > wrote:
> > >
> > > > On Sun 2026-02-15 @ 10:09:03 PM, Bruce Ashfield wrote:
> > > > > On Sun, Feb 15, 2026 at 9:32 PM Trevor Woerner via
> > > > lists.openembedded.org
> > > > > <twoerner=gmail.com@lists.openembedded.org> wrote:
> > > > >
> > > > > > The previous implementation to add variable sector-size support:
> > > > > > - required the variable WIC_SECTOR_SIZE either be defined in a
> > > > > >   configuration file or be defined in a --vars file
> > > > > > - this means that every invocation of "wic ls", "wic cp", or "wic
> > rm"
> > > > > >   needed this variable defined (config or --vars)
> > > > > > - required the user to create separate *wks files for every sector
> > size
> > > > > >   they wanted to use
> > > > > > - required the user to specify the mkfs-extraopts by hand to
> > specify
> > > > the
> > > > > >   correct sector size: e.g.
> > > > > >         bootloader --ptable gpt
> > > > > >         part --fstype ext4 --source rootfs --label rofs-a
> > > > --mkfs-extraopts
> > > > > > "-b 4096"
> > > > > >         part --fstype ext4 --source rootfs --use-uuid
> > --mkfs-extraopts
> > > > "-b
> > > > > > 4096"
> > > > > > - specifying --mkfs-extraopts replaces the defaults with the
> > > > > >   user-supplied values
> > > > > > - only provided details to support using variable sector-sizes with
> > > > > >   ext[234] filesystems
> > > > > > - it would not be possible to generate images with different sector
> > > > > >   sizes in the same build since the configuration and *wks files
> > would
> > > > > >   need to change and the build re-run for each size
> > > > > >
> > > > > > Update the sector-size handling so that:
> > > > > > - the sector-size will now be provided on the cmdline to the "wic
> > ls",
> > > > > >   "wic cp", "wic rm", and "wic create" commands: default = 512
> > > > > > - this means the configuration and/or --vars file does not need to
> > be
> > > > > >   changed in order to perform those operations on images with
> > different
> > > > > >   sector sizes
> > > > > > - support is provided implicitly for mkdosfs and ext[234]
> > partitions
> > > > > > - the user no longer needs to know and supply the sector-size
> > magic in
> > > > > >   --mkfs-extraopts (thereby clobbering the other defaults)
> > > > > >
> > > > >
> > > > > It wasn't clear to me when scanning the patch. For configuration
> > > > > files with a sector size, is it now completely ignored ?
> > > >
> > > > Yes.
> > > >
> > > > While trying to use the existing implementation in actual production
> > > > workflows we found a number of shortcomings that are addressed with
> > this
> > > > update. Additionally, the ultimate goal is to make wic an independent
> > > > utility from oe-core so it can be easily used by external tools
> > > > post-build.
> > > >
> > > > If sector-size is not available on the cmdline, then a --vars file
> > would
> > > > be needed for every simple wic invocation such as "wic cp", "wic ls",
> > > > and "wic rm"... which would be silly. Take a look at the patch I
> > > > submitted a week or so ago to see how the oe-selftests would have to be
> > > > updated to support this.
> > > >
> > > > If sector-size is available both on the cmdline and in a --vars file
> > > > then which one wins? Ultimately having it specified in both places is
> > > > only going to lead to confusion as people will be changing it in one
> > > > place and not realizing it's also defined (and taking precedence) from
> > > > somewhere else. I believe this is currently the case with
> > > > --native-sysroot, which probably needs fixing as well since several
> > > > oe-selftests are trying to use it, but I doubt it is working the way
> > the
> > > > test writers expect.
> > >
> > >
> > > > One parameter specified in one place so a user would not need multiple
> > > > sets of configuration files to perform a simple "wic ls" of images with
> > > > different sector sizes; simply specify it on the cmdline if you want
> > > > something other than 512.
> > > >
> > >
> > > That's not a good migration path. You can't simply throw away
> > > someone's existing configuration and ask them to update to a
> > > new one. I didn't even see an error thrown with migration
> > > instructions.
> > >
> > > There's many different users of things like this, we can't simply
> > > change the interface without some way to migrate.
> >
> > I don't disagree with you entirely.
> >
> > But if the user specifies --sector-size <N> on the cmdline, they will
> > expect the sector-size to be N. If they don't specify this on the
> > cmdline, they would rightfully expect the default of 512 to be used...
> >
> 
> At a thought:
> 
> If they specify it on the command line. use it.
> If they don't specify it on the command line, but there's a variable set
> (the old way), use it and output a message that it was taken from the
> variable.
> If they don't specify it on the command line and no variable is set, use
> the default
> 
> You don't really even need to fully support the variable everywhere, just
> read it once, and then convert it to a command line argument (if there's a
> place to do that, you know the code better than I do, maybe that's not
> possible).
> 
> If someone is migrating to the new way, they can just remove that variable
> once they know things are working.

Perfect! This is what my v4 will do :-)

> 
> Bruce
> 
> 
> 
> >
> >
> > ...unless some configuration file anywhere in their build specifies
> > WIC_SECTOR_SIZE, in which case wic is supposed to use that value?
> >
> > I could print a warning if sector size is set via WIC_SECTOR_SIZE?
> >
> > >
> > > Bruce
> > >
> > >
> > >
> > > >
> > > > > Apologies if I missed where existing configs were used to prime
> > > > > the parameters to the functions.
> > > > >
> > > > > Bruce
> > > > >
> > > > >
> > > > >
> > > > > >
> > > > > > AI-Generated: codex/gpt-5.1-codex-max
> > > > > > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > > > > > ---
> > > > > > changes since v2:
> > > > > > - none
> > > > > >
> > > > > > changes since v1:
> > > > > > - none
> > > > > > ---
> > > > > >  meta/lib/oeqa/selftest/cases/wic.py           | 39 ++++---------
> > > > > >  scripts/lib/wic/engine.py                     | 45 +++++++--------
> > > > > >  scripts/lib/wic/help.py                       | 23 +++++---
> > > > > >  scripts/lib/wic/partition.py                  | 55
> > +++++++++++++++++--
> > > > > >  scripts/lib/wic/plugins/imager/direct.py      | 18 ++----
> > > > > >  scripts/lib/wic/plugins/source/bootimg_efi.py |  5 +-
> > > > > >  .../lib/wic/plugins/source/bootimg_pcbios.py  | 11 ++--
> > > > > >  .../wic/plugins/source/isoimage_isohybrid.py  |  5 +-
> > > > > >  scripts/wic                                   |  8 +++
> > > > > >  9 files changed, 125 insertions(+), 84 deletions(-)
> > > > > >
> > > > > > diff --git a/meta/lib/oeqa/selftest/cases/wic.py
> > > > > > b/meta/lib/oeqa/selftest/cases/wic.py
> > > > > > index ecaee5a29144..7ad61fa700f7 100644
> > > > > > --- a/meta/lib/oeqa/selftest/cases/wic.py
> > > > > > +++ b/meta/lib/oeqa/selftest/cases/wic.py
> > > > > > @@ -935,33 +935,22 @@ bootloader --ptable gpt""")
> > > > > >          finally:
> > > > > >              os.remove(wks_file)
> > > > > >
> > > > > > -    def test_wic_sector_size(self):
> > > > > > -        """Test generation image sector size"""
> > > > > > -
> > > > > > +    def test_wic_sector_size_cli(self):
> > > > > > +        """Test sector size handling via CLI option."""
> > > > > > +
> > > > > >          oldpath = os.environ['PATH']
> > > > > >          os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
> > > > > >
> > > > > >          try:
> > > > > > -            # Add WIC_SECTOR_SIZE into config
> > > > > > -            config = 'WIC_SECTOR_SIZE = "4096"\n'\
> > > > > > -                     'WICVARS:append = " WIC_SECTOR_SIZE"\n'
> > > > > > -            self.append_config(config)
> > > > > >              bitbake('core-image-minimal')
> > > > > >
> > > > > > -            # Check WIC_SECTOR_SIZE apply to bitbake variable
> > > > > > -            wic_sector_size_str = get_bb_var('WIC_SECTOR_SIZE',
> > > > > > 'core-image-minimal')
> > > > > > -            wic_sector_size = int(wic_sector_size_str)
> > > > > > -            self.assertEqual(4096, wic_sector_size)
> > > > > > -
> > > > > > -            self.logger.info("Test wic_sector_size: %d \n" %
> > > > > > wic_sector_size)
> > > > > > -
> > > > > >              with NamedTemporaryFile("w", suffix=".wks") as wks:
> > > > > >                  wks.writelines(
> > > > > >                      ['bootloader --ptable gpt\n',
> > > > > > -                     'part --fstype ext4 --source rootfs --label
> > > > rofs-a
> > > > > > --mkfs-extraopts "-b 4096"\n',
> > > > > > -                     'part --fstype ext4 --source rootfs
> > --use-uuid
> > > > > > --mkfs-extraopts "-b 4096"\n'])
> > > > > > +                     'part --fstype ext4 --source rootfs --label
> > > > > > rofs-a\n',
> > > > > > +                     'part --fstype ext4 --source rootfs
> > > > --use-uuid\n'])
> > > > > >                  wks.flush()
> > > > > > -                cmd = "wic create %s -e core-image-minimal -o %s"
> > % (
> > > > > > wks.name, self.resultdir)
> > > > > > +                cmd = "wic create %s -e core-image-minimal -o %s
> > > > > > --sector-size 4096" % (wks.name, self.resultdir)
> > > > > >                  runCmd(cmd)
> > > > > >                  wksname = os.path.splitext(os.path.basename(
> > wks.name
> > > > ))[0]
> > > > > >                  images = glob(os.path.join(self.resultdir,
> > > > "%s-*direct" %
> > > > > > wksname))
> > > > > > @@ -969,24 +958,18 @@ bootloader --ptable gpt""")
> > > > > >
> > > > > >              sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE',
> > 'wic-tools')
> > > > > >              # list partitions
> > > > > > -            result = runCmd("wic ls %s -n %s" % (images[0],
> > sysroot))
> > > > > > +            result = runCmd("wic ls %s -n %s --sector-size 4096" %
> > > > > > (images[0], sysroot))
> > > > > >              self.assertEqual(3, len(result.output.split('\n')))
> > > > > >
> > > > > > -            # verify partition size with wic
> > > > > > -            res = runCmd("export PARTED_SECTOR_SIZE=%d; parted -m
> > %s
> > > > unit
> > > > > > b p" % (wic_sector_size, images[0]),
> > > > > > +            # verify partition size with parted output
> > > > > > +            res = runCmd("export PARTED_SECTOR_SIZE=%d; parted -m
> > %s
> > > > unit
> > > > > > b p" % (4096, images[0]),
> > > > > >                           stderr=subprocess.PIPE)
> > > > > >
> > > > > > -            # parse parted output which looks like this:
> > > > > > -            # BYT;\n
> > > > > > -            #
> > > > > >
> > > >
> > /var/tmp/wic/build/tmpgjzzefdd-202410281021-sda.direct:78569472B:file:4096:4096:gpt::;\n
> > > > > > -            # 1:139264B:39284735B:39145472B:ext4:rofs-a:;\n
> > > > > > -            # 2:39284736B:78430207B:39145472B:ext4:primary:;\n
> > > > > >              disk_info = res.output.splitlines()[1]
> > > > > > -            # Check sector sizes
> > > > > >              sector_size_logical = int(disk_info.split(":")[3])
> > > > > >              sector_size_physical = int(disk_info.split(":")[4])
> > > > > > -            self.assertEqual(wic_sector_size, sector_size_logical,
> > > > > > "Logical sector size is not %d." % wic_sector_size)
> > > > > > -            self.assertEqual(wic_sector_size,
> > sector_size_physical,
> > > > > > "Physical sector size is not %d." % wic_sector_size)
> > > > > > +            self.assertEqual(4096, sector_size_logical, "Logical
> > > > sector
> > > > > > size is not 4096.")
> > > > > > +            self.assertEqual(4096, sector_size_physical, "Physical
> > > > sector
> > > > > > size is not 4096.")
> > > > > >
> > > > > >          finally:
> > > > > >              os.environ['PATH'] = oldpath
> > > > > > diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
> > > > > > index 9d596be3a723..7753f431f91d 100644
> > > > > > --- a/scripts/lib/wic/engine.py
> > > > > > +++ b/scripts/lib/wic/engine.py
> > > > > > @@ -224,7 +224,7 @@ def wic_list(args, scripts_path):
> > > > > >
> > > > > >
> > > > > >  class Disk:
> > > > > > -    def __init__(self, imagepath, native_sysroot, fstypes=('fat',
> > > > 'ext')):
> > > > > > +    def __init__(self, imagepath, native_sysroot, fstypes=('fat',
> > > > 'ext'),
> > > > > > sector_size=512):
> > > > > >          self.imagepath = imagepath
> > > > > >          self.native_sysroot = native_sysroot
> > > > > >          self.fstypes = fstypes
> > > > > > @@ -233,16 +233,7 @@ class Disk:
> > > > > >          self._lsector_size = None
> > > > > >          self._psector_size = None
> > > > > >          self._ptable_format = None
> > > > > > -
> > > > > > -        # define sector size
> > > > > > -        sector_size_str = get_bitbake_var('WIC_SECTOR_SIZE')
> > > > > > -        if sector_size_str is not None:
> > > > > > -            try:
> > > > > > -                self.sector_size = int(sector_size_str)
> > > > > > -            except ValueError:
> > > > > > -                self.sector_size = None
> > > > > > -        else:
> > > > > > -            self.sector_size = None
> > > > > > +        self.sector_size = sector_size
> > > > > >
> > > > > >          # find parted
> > > > > >          # read paths from $PATH environment variable
> > > > > > @@ -271,7 +262,7 @@ class Disk:
> > > > > >          if self._partitions is None:
> > > > > >              self._partitions = OrderedDict()
> > > > > >
> > > > > > -            if self.sector_size is not None:
> > > > > > +            if self.sector_size:
> > > > > >                  out = exec_cmd("export PARTED_SECTOR_SIZE=%d; %s
> > -sm
> > > > %s
> > > > > > unit B print" % \
> > > > > >                             (self.sector_size, self.parted,
> > > > > > self.imagepath), True)
> > > > > >              else:
> > > > > > @@ -312,11 +303,15 @@ class Disk:
> > > > > >              raise WicError("Partition %s is not in the image" %
> > pnum)
> > > > > >          part = self.partitions[pnum]
> > > > > >          # check if fstype is supported
> > > > > > +        # NOTE: parted is unable to identify dos-type partitions
> > with
> > > > a
> > > > > > 4k sector-size
> > > > > > +        #       if the type is empty and a non-default sector
> > size is
> > > > > > used, assume 'fat'
> > > > > > +        #       fdisk identifies them without issue
> > > > > > +        part_fstype = part.fstype if part.fstype or
> > self.sector_size
> > > > ==
> > > > > > 512 else 'fat'
> > > > > >          for fstype in self.fstypes:
> > > > > > -            if part.fstype.startswith(fstype):
> > > > > > +            if part_fstype.startswith(fstype):
> > > > > >                  break
> > > > > >          else:
> > > > > > -            raise WicError("Not supported fstype:
> > > > {}".format(part.fstype))
> > > > > > +            raise WicError("Not supported fstype:
> > > > {}".format(part_fstype))
> > > > > >          if pnum not in self._partimages:
> > > > > >              tmpf = tempfile.NamedTemporaryFile(prefix="wic-part")
> > > > > >              dst_fname = tmpf.name
> > > > > > @@ -586,8 +581,9 @@ class Disk:
> > > > > >                              label = part.get("name")
> > > > > >                              label_str = "-n {}".format(label) if
> > label
> > > > > > else ''
> > > > > >
> > > > > > -                            cmd = "{} {} -C {}
> > > > {}".format(self.mkdosfs,
> > > > > > label_str, partfname,
> > > > > > -
> > > > part['size'])
> > > > > > +                            sector_str = "-S
> > > > {}".format(self.sector_size)
> > > > > > if self.sector_size else ''
> > > > > > +                            cmd = "{} {} {} -C {}
> > > > > > {}".format(self.mkdosfs, label_str, sector_str, partfname,
> > > > > > +
> > > >  part['size'])
> > > > > >                              exec_cmd(cmd)
> > > > > >                              # copy content from the temporary
> > > > directory
> > > > > > to the new partition
> > > > > >                              cmd = "{} -snompi {} {}/*
> > > > > > ::".format(self.mcopy, partfname, tmpdir)
> > > > > > @@ -609,14 +605,19 @@ class Disk:
> > > > > >
> > > > > >  def wic_ls(args, native_sysroot):
> > > > > >      """List contents of partitioned image or vfat partition."""
> > > > > > -    disk = Disk(args.path.image, native_sysroot)
> > > > > > +    disk = Disk(args.path.image, native_sysroot,
> > > > > > sector_size=args.sector_size)
> > > > > >      if not args.path.part:
> > > > > >          if disk.partitions:
> > > > > >              print('Num     Start        End          Size
> > > > Fstype')
> > > > > >              for part in disk.partitions.values():
> > > > > > +                # size values are in bytes from parted; convert to
> > > > > > sectors if a custom sector size was requested
> > > > > > +                display_size = part.size
> > > > > > +                if args.sector_size and args.sector_size !=
> > > > > > disk._lsector_size:
> > > > > > +                    display_size = part.size // args.sector_size
> > > > > >                  print("{:2d}  {:12d} {:12d} {:12d}  {}".format(\
> > > > > > -                          part.pnum, part.start, part.end,
> > > > > > -                          part.size, part.fstype))
> > > > > > +                          part.pnum, part.start //
> > args.sector_size,
> > > > > > +                          part.end // args.sector_size,
> > > > > > +                          display_size, part.fstype))
> > > > > >      else:
> > > > > >          path = args.path.path or '/'
> > > > > >          print(disk.dir(args.path.part, path))
> > > > > > @@ -627,9 +628,9 @@ def wic_cp(args, native_sysroot):
> > > > > >      partitioned image.
> > > > > >      """
> > > > > >      if isinstance(args.dest, str):
> > > > > > -        disk = Disk(args.src.image, native_sysroot)
> > > > > > +        disk = Disk(args.src.image, native_sysroot,
> > > > > > sector_size=args.sector_size)
> > > > > >      else:
> > > > > > -        disk = Disk(args.dest.image, native_sysroot)
> > > > > > +        disk = Disk(args.dest.image, native_sysroot,
> > > > > > sector_size=args.sector_size)
> > > > > >      disk.copy(args.src, args.dest)
> > > > > >
> > > > > >
> > > > > > @@ -638,7 +639,7 @@ def wic_rm(args, native_sysroot):
> > > > > >      Remove files or directories from the vfat partition of
> > > > > >      partitioned image.
> > > > > >      """
> > > > > > -    disk = Disk(args.path.image, native_sysroot)
> > > > > > +    disk = Disk(args.path.image, native_sysroot,
> > > > > > sector_size=args.sector_size)
> > > > > >      disk.remove(args.path.part, args.path.path,
> > args.recursive_delete)
> > > > > >
> > > > > >  def wic_write(args, native_sysroot):
> > > > > > diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> > > > > > index 6b49a67de938..5d7c40456a80 100644
> > > > > > --- a/scripts/lib/wic/help.py
> > > > > > +++ b/scripts/lib/wic/help.py
> > > > > > @@ -118,7 +118,7 @@ wic_create_usage = """
> > > > > >   usage: wic create <wks file or image name> [-o <DIRNAME> |
> > --outdir
> > > > > > <DIRNAME>]
> > > > > >              [-e | --image-name] [-s, --skip-build-check] [-D,
> > --debug]
> > > > > >              [-r, --rootfs-dir] [-b, --bootimg-dir]
> > > > > > -            [-k, --kernel-dir] [-n, --native-sysroot] [-f,
> > > > --build-rootfs]
> > > > > > +            [-k, --kernel-dir] [-n, --native-sysroot]
> > [--sector-size
> > > > > > <bytes>] [-f, --build-rootfs]
> > > > > >              [-c, --compress-with] [-m, --bmap]
> > > > > >
> > > > > >   This command creates an OpenEmbedded image based on the 'OE
> > kickstart
> > > > > > @@ -139,13 +139,16 @@ SYNOPSIS
> > > > > >      wic create <wks file or image name> [-o <DIRNAME> | --outdir
> > > > > > <DIRNAME>]
> > > > > >          [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
> > > > > >          [-r, --rootfs-dir] [-b, --bootimg-dir]
> > > > > > -        [-k, --kernel-dir] [-n, --native-sysroot] [-f,
> > --build-rootfs]
> > > > > > +        [-k, --kernel-dir] [-n, --native-sysroot] [--sector-size
> > > > <bytes>]
> > > > > > [-f, --build-rootfs]
> > > > > >          [-c, --compress-with] [-m, --bmap] [--no-fstab-update]
> > > > > >
> > > > > >  DESCRIPTION
> > > > > >      This command creates an OpenEmbedded image based on the 'OE
> > > > > >      kickstart commands' found in the <wks file>.
> > > > > >
> > > > > > +    Use the --sector-size option to select the sector size (in
> > bytes)
> > > > > > +    used for partition layout calculations (default is 512).
> > > > > > +
> > > > > >      In order to do this, wic needs to know the locations of the
> > > > > >      various build artifacts required to build the image.
> > > > > >
> > > > > > @@ -278,7 +281,7 @@ wic_ls_usage = """
> > > > > >
> > > > > >   List content of a partitioned image
> > > > > >
> > > > > > - usage: wic ls <image>[:<partition>[<path>]] [--native-sysroot
> > <path>]
> > > > > > + usage: wic ls <image>[:<partition>[<path>]] [--native-sysroot
> > <path>]
> > > > > > [--sector-size <bytes>]
> > > > > >
> > > > > >   This command  outputs either list of image partitions or
> > directory
> > > > > > contents
> > > > > >   of vfat and ext* partitions.
> > > > > > @@ -296,7 +299,7 @@ SYNOPSIS
> > > > > >      wic ls <image>
> > > > > >      wic ls <image>:<vfat or ext* partition>
> > > > > >      wic ls <image>:<vfat or ext* partition><path>
> > > > > > -    wic ls <image>:<vfat or ext* partition><path> --native-sysroot
> > > > <path>
> > > > > > +    wic ls <image>:<vfat or ext* partition><path> --native-sysroot
> > > > <path>
> > > > > > [--sector-size <bytes>]
> > > > > >
> > > > > >  DESCRIPTION
> > > > > >      This command lists either partitions of the image or directory
> > > > > > contents
> > > > > > @@ -336,6 +339,8 @@ DESCRIPTION
> > > > > >
> > > > > >      The -n option is used to specify the path to the native
> > sysroot
> > > > > >      containing the tools(parted and mtools) to use.
> > > > > > +    The --sector-size option sets the sector size used for
> > partition
> > > > math
> > > > > > +    (default is 512 bytes).
> > > > > >
> > > > > >  """
> > > > > >
> > > > > > @@ -343,7 +348,7 @@ wic_cp_usage = """
> > > > > >
> > > > > >   Copy files and directories to/from the vfat or ext* partition
> > > > > >
> > > > > > - usage: wic cp <src> <dest> [--native-sysroot <path>]
> > > > > > + usage: wic cp <src> <dest> [--native-sysroot <path>]
> > [--sector-size
> > > > > > <bytes>]
> > > > > >
> > > > > >   source/destination image in format <image>:<partition>[<path>]
> > > > > >
> > > > > > @@ -364,7 +369,7 @@ SYNOPSIS
> > > > > >      wic cp <src> <dest>:<partition>
> > > > > >      wic cp <src>:<partition> <dest>
> > > > > >      wic cp <src> <dest-image>:<partition><path>
> > > > > > -    wic cp <src> <dest-image>:<partition><path> --native-sysroot
> > > > <path>
> > > > > > +    wic cp <src> <dest-image>:<partition><path> --native-sysroot
> > > > <path>
> > > > > > [--sector-size <bytes>]
> > > > > >
> > > > > >  DESCRIPTION
> > > > > >      This command copies files or directories either
> > > > > > @@ -408,13 +413,15 @@ DESCRIPTION
> > > > > >
> > > > > >      The -n option is used to specify the path to the native
> > sysroot
> > > > > >      containing the tools(parted and mtools) to use.
> > > > > > +    The --sector-size option sets the sector size used for
> > partition
> > > > math
> > > > > > +    (default is 512 bytes).
> > > > > >  """
> > > > > >
> > > > > >  wic_rm_usage = """
> > > > > >
> > > > > >   Remove files or directories from the vfat or ext* partitions
> > > > > >
> > > > > > - usage: wic rm <image>:<partition><path> [--native-sysroot <path>]
> > > > > > + usage: wic rm <image>:<partition><path> [--native-sysroot <path>]
> > > > > > [--sector-size <bytes>]
> > > > > >
> > > > > >   This command  removes files or directories from the vfat or ext*
> > > > > > partitions of
> > > > > >   the partitioned image.
> > > > > > @@ -466,6 +473,8 @@ DESCRIPTION
> > > > > >
> > > > > >      The -n option is used to specify the path to the native
> > sysroot
> > > > > >      containing the tools(parted and mtools) to use.
> > > > > > +    The --sector-size option sets the sector size used for
> > partition
> > > > math
> > > > > > +    (default is 512 bytes).
> > > > > >
> > > > > >      The -r option is used to remove directories and their contents
> > > > > >      recursively,this only applies to ext* partition.
> > > > > > diff --git a/scripts/lib/wic/partition.py
> > > > b/scripts/lib/wic/partition.py
> > > > > > index 8fed686e903e..df6e3271649b 100644
> > > > > > --- a/scripts/lib/wic/partition.py
> > > > > > +++ b/scripts/lib/wic/partition.py
> > > > > > @@ -65,6 +65,50 @@ class Partition():
> > > > > >
> > > > > >          self.lineno = lineno
> > > > > >          self.source_file = ""
> > > > > > +        self.sector_size = 512
> > > > > > +
> > > > > > +    def _mkdosfs_extraopts(self):
> > > > > > +        """
> > > > > > +        Build mkdosfs extra options ensuring the CLI sector size
> > is
> > > > > > applied.
> > > > > > +        """
> > > > > > +        extraopts = self.mkfs_extraopts or ''
> > > > > > +        tokens = []
> > > > > > +        skip_next = False
> > > > > > +        for tok in extraopts.split():
> > > > > > +            if skip_next:
> > > > > > +                skip_next = False
> > > > > > +                continue
> > > > > > +            if tok == '-S':
> > > > > > +                skip_next = True
> > > > > > +                continue
> > > > > > +            if tok.startswith('-S'):
> > > > > > +                continue
> > > > > > +            tokens.append(tok)
> > > > > > +        tokens.extend(['-S', str(self.sector_size)])
> > > > > > +        return ' '.join(tokens).strip()
> > > > > > +
> > > > > > +    def _mkfs_ext_extraopts(self, base_opts):
> > > > > > +        """
> > > > > > +        Build mkfs.ext* extra options ensuring the CLI sector
> > size is
> > > > > > applied.
> > > > > > +        """
> > > > > > +        extraopts = self.mkfs_extraopts or base_opts
> > > > > > +        # Only add an explicit block size when a non-default
> > sector
> > > > size
> > > > > > is requested.
> > > > > > +        if self.sector_size and self.sector_size != 512:
> > > > > > +            tokens = []
> > > > > > +            skip_next = False
> > > > > > +            for tok in extraopts.split():
> > > > > > +                if skip_next:
> > > > > > +                    skip_next = False
> > > > > > +                    continue
> > > > > > +                if tok == '-b':
> > > > > > +                    skip_next = True
> > > > > > +                    continue
> > > > > > +                if tok.startswith('-b'):
> > > > > > +                    continue
> > > > > > +                tokens.append(tok)
> > > > > > +            tokens.extend(['-b', str(self.sector_size)])
> > > > > > +            return ' '.join(tokens).strip()
> > > > > > +        return extraopts
> > > > > >
> > > > > >      def get_extra_block_count(self, current_blocks):
> > > > > >          """
> > > > > > @@ -138,6 +182,8 @@ class Partition():
> > > > > >          Prepare content for individual partitions, depending on
> > > > > >          partition command parameters.
> > > > > >          """
> > > > > > +        # capture the sector size requested on the CLI for mkdosfs
> > > > > > invocations
> > > > > > +        self.sector_size = getattr(creator, 'sector_size', 512)
> > or 512
> > > > > >          self.updated_fstab_path = updated_fstab_path
> > > > > >          if self.updated_fstab_path and not
> > > > (self.fstype.startswith("ext")
> > > > > > or self.fstype == "msdos"):
> > > > > >              self.update_fstab_in_rootfs = True
> > > > > > @@ -293,7 +339,7 @@ class Partition():
> > > > > >          with open(rootfs, 'w') as sparse:
> > > > > >              os.ftruncate(sparse.fileno(), rootfs_size * 1024)
> > > > > >
> > > > > > -        extraopts = self.mkfs_extraopts or "-F -i 8192"
> > > > > > +        extraopts = self._mkfs_ext_extraopts("-F -i 8192")
> > > > > >
> > > > > >          # use hash_seed to generate reproducible ext4 images
> > > > > >          (extraopts, pseudo) = self.get_hash_seed_ext4(extraopts,
> > > > pseudo)
> > > > > > @@ -401,7 +447,7 @@ class Partition():
> > > > > >
> > > > > >          size_str = ""
> > > > > >
> > > > > > -        extraopts = self.mkfs_extraopts or '-S 512'
> > > > > > +        extraopts = self._mkdosfs_extraopts()
> > > > > >
> > > > > >          dosfs_cmd = "mkdosfs %s -i %s %s %s -C %s %d" % \
> > > > > >                      (label_str, self.fsuuid, size_str, extraopts,
> > > > rootfs,
> > > > > > @@ -452,7 +498,7 @@ class Partition():
> > > > > >          with open(rootfs, 'w') as sparse:
> > > > > >              os.ftruncate(sparse.fileno(), size * 1024)
> > > > > >
> > > > > > -        extraopts = self.mkfs_extraopts or "-i 8192"
> > > > > > +        extraopts = self._mkfs_ext_extraopts("-i 8192")
> > > > > >
> > > > > >          # use hash_seed to generate reproducible ext4 images
> > > > > >          (extraopts, pseudo) = self.get_hash_seed_ext4(extraopts,
> > None)
> > > > > > @@ -498,7 +544,7 @@ class Partition():
> > > > > >
> > > > > >          size_str = ""
> > > > > >
> > > > > > -        extraopts = self.mkfs_extraopts or '-S 512'
> > > > > > +        extraopts = self._mkdosfs_extraopts()
> > > > > >
> > > > > >          dosfs_cmd = "mkdosfs %s -i %s %s %s -C %s %d" % \
> > > > > >                      (label_str, self.fsuuid, extraopts, size_str,
> > > > rootfs,
> > > > > > @@ -559,4 +605,3 @@ class Partition():
> > > > > >                      logger.warn("%s Inodes (of size %d) are too
> > > > small." %
> > > > > >                                  (get_err_str(self), size))
> > > > > >                  break
> > > > > > -
> > > > > > diff --git a/scripts/lib/wic/plugins/imager/direct.py
> > > > > > b/scripts/lib/wic/plugins/imager/direct.py
> > > > > > index ad922cfbf122..3adc6eee6280 100644
> > > > > > --- a/scripts/lib/wic/plugins/imager/direct.py
> > > > > > +++ b/scripts/lib/wic/plugins/imager/direct.py
> > > > > > @@ -67,6 +67,7 @@ class DirectPlugin(ImagerPlugin):
> > > > > >          self._image = None
> > > > > >          self.ptable_format = self.ks.bootloader.ptable
> > > > > >          self.parts = self.ks.partitions
> > > > > > +        self.sector_size = options.sector_size or 512
> > > > > >
> > > > > >          # as a convenience, set source to the boot partition
> > source
> > > > > >          # instead of forcing it to be set via bootloader --source
> > > > > > @@ -78,7 +79,7 @@ class DirectPlugin(ImagerPlugin):
> > > > > >          image_path = self._full_path(self.workdir,
> > self.parts[0].disk,
> > > > > > "direct")
> > > > > >          self._image = PartitionedImage(image_path,
> > self.ptable_format,
> > > > > > self.ks.bootloader.diskid,
> > > > > >                                         self.parts,
> > > > self.native_sysroot,
> > > > > > -                                       options.extra_space)
> > > > > > +                                       options.extra_space,
> > > > > > self.sector_size)
> > > > > >
> > > > > >      def setup_workdir(self, workdir):
> > > > > >          if workdir:
> > > > > > @@ -294,15 +295,13 @@ MBR_OVERHEAD = 1
> > > > > >  # Overhead of the GPT partitioning scheme
> > > > > >  GPT_OVERHEAD = 34
> > > > > >
> > > > > > -# Size of a sector in bytes
> > > > > > -SECTOR_SIZE = 512
> > > > > > -
> > > > > >  class PartitionedImage():
> > > > > >      """
> > > > > >      Partitioned image in a file.
> > > > > >      """
> > > > > >
> > > > > > -    def __init__(self, path, ptable_format, disk_id, partitions,
> > > > > > native_sysroot=None, extra_space=0):
> > > > > > +    def __init__(self, path, ptable_format, disk_id, partitions,
> > > > > > native_sysroot=None, extra_space=0,
> > > > > > +                 sector_size=512):
> > > > > >          self.path = path  # Path to the image file
> > > > > >          self.numpart = 0  # Number of allocated partitions
> > > > > >          self.realpart = 0 # Number of partitions in the partition
> > > > table
> > > > > > @@ -332,14 +331,7 @@ class PartitionedImage():
> > > > > >          self.partitions = partitions
> > > > > >          self.partimages = []
> > > > > >          # Size of a sector used in calculations
> > > > > > -        sector_size_str = get_bitbake_var('WIC_SECTOR_SIZE')
> > > > > > -        if sector_size_str is not None:
> > > > > > -            try:
> > > > > > -                self.sector_size = int(sector_size_str)
> > > > > > -            except ValueError:
> > > > > > -                self.sector_size = SECTOR_SIZE
> > > > > > -        else:
> > > > > > -            self.sector_size = SECTOR_SIZE
> > > > > > +        self.sector_size = sector_size or 512
> > > > > >
> > > > > >          self.native_sysroot = native_sysroot
> > > > > >          num_real_partitions = len([p for p in self.partitions if
> > not
> > > > > > p.no_table])
> > > > > > diff --git a/scripts/lib/wic/plugins/source/bootimg_efi.py
> > > > > > b/scripts/lib/wic/plugins/source/bootimg_efi.py
> > > > > > index 430b0a4b023a..864d6898fc9d 100644
> > > > > > --- a/scripts/lib/wic/plugins/source/bootimg_efi.py
> > > > > > +++ b/scripts/lib/wic/plugins/source/bootimg_efi.py
> > > > > > @@ -415,8 +415,9 @@ class BootimgEFIPlugin(SourcePlugin):
> > > > > >
> > > > > >          label = part.label if part.label else "ESP"
> > > > > >
> > > > > > -        dosfs_cmd = "mkdosfs -v -n %s -i %s -C %s %d" % \
> > > > > > -                    (label, part.fsuuid, bootimg, blocks)
> > > > > > +        sector_size = getattr(creator, 'sector_size', 512) or 512
> > > > > > +        dosfs_cmd = "mkdosfs -v -n %s -i %s -S %d -C %s %d" % \
> > > > > > +                    (label, part.fsuuid, sector_size, bootimg,
> > blocks)
> > > > > >          exec_native_cmd(dosfs_cmd, native_sysroot)
> > > > > >          logger.debug("mkdosfs:\n%s" % (str(out)))
> > > > > >
> > > > > > diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
> > > > > > b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
> > > > > > index a7cc5d12c620..32edac47fa09 100644
> > > > > > --- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
> > > > > > +++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
> > > > > > @@ -132,7 +132,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
> > > > > >                  cls._do_prepare_grub(part, cr_workdir,
> > oe_builddir,
> > > > > >                                  kernel_dir, rootfs_dir,
> > > > native_sysroot)
> > > > > >              elif source_params['loader-bios'] == 'syslinux':
> > > > > > -                cls._do_prepare_syslinux(part, cr_workdir,
> > > > bootimg_dir,
> > > > > > +                cls._do_prepare_syslinux(part, creator,
> > cr_workdir,
> > > > > > bootimg_dir,
> > > > > >                                      kernel_dir, native_sysroot)
> > > > > >              else:
> > > > > >                  raise WicError("unrecognized bootimg_pcbios
> > loader:
> > > > %s" %
> > > > > > source_params['loader-bios'])
> > > > > > @@ -142,7 +142,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
> > > > > >          except KeyError:
> > > > > >              # Required by do_install_disk
> > > > > >              cls.loader = 'syslinux'
> > > > > > -            cls._do_prepare_syslinux(part, cr_workdir,
> > bootimg_dir,
> > > > > > +            cls._do_prepare_syslinux(part, creator, cr_workdir,
> > > > > > bootimg_dir,
> > > > > >                                  kernel_dir, native_sysroot)
> > > > > >
> > > > > >      @classmethod
> > > > > > @@ -240,7 +240,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
> > > > > >          cfg.close()
> > > > > >
> > > > > >      @classmethod
> > > > > > -    def _do_prepare_syslinux(cls, part, cr_workdir, bootimg_dir,
> > > > > > +    def _do_prepare_syslinux(cls, part, creator, cr_workdir,
> > > > bootimg_dir,
> > > > > >                               kernel_dir, native_sysroot):
> > > > > >          """
> > > > > >          Called to do the actual content population for a partition
> > > > i.e. it
> > > > > > @@ -292,8 +292,9 @@ class BootimgPcbiosPlugin(SourcePlugin):
> > > > > >
> > > > > >          label = part.label if part.label else "boot"
> > > > > >
> > > > > > -        dosfs_cmd = "mkdosfs -n %s -i %s -S 512 -C %s %d" % \
> > > > > > -                    (label, part.fsuuid, bootimg, blocks)
> > > > > > +        sector_size = getattr(creator, 'sector_size', 512) or 512
> > > > > > +        dosfs_cmd = "mkdosfs -n %s -i %s -S %d -C %s %d" % \
> > > > > > +                    (label, part.fsuuid, sector_size, bootimg,
> > blocks)
> > > > > >          exec_native_cmd(dosfs_cmd, native_sysroot)
> > > > > >
> > > > > >          mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
> > > > > > diff --git a/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
> > > > > > b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
> > > > > > index fdab188db1f8..9195ef5f3184 100644
> > > > > > --- a/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
> > > > > > +++ b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
> > > > > > @@ -367,8 +367,9 @@ class IsoImagePlugin(SourcePlugin):
> > > > > >
> > > > > >              esp_label = source_params.get('esp_label', 'EFIimg')
> > > > > >
> > > > > > -            dosfs_cmd = 'mkfs.vfat -n \'%s\' -S 512 -C %s %d' \
> > > > > > -                        % (esp_label, bootimg, blocks)
> > > > > > +            sector_size = getattr(creator, 'sector_size', 512) or
> > 512
> > > > > > +            dosfs_cmd = "mkfs.vfat -n '%s' -S %d -C %s %d" % \
> > > > > > +                        (esp_label, sector_size, bootimg, blocks)
> > > > > >              exec_native_cmd(dosfs_cmd, native_sysroot)
> > > > > >
> > > > > >              mmd_cmd = "mmd -i %s ::/EFI" % bootimg
> > > > > > diff --git a/scripts/wic b/scripts/wic
> > > > > > index 9137208f5e8f..0cef84ef630c 100755
> > > > > > --- a/scripts/wic
> > > > > > +++ b/scripts/wic
> > > > > > @@ -376,6 +376,8 @@ def wic_init_parser_create(subparser):
> > > > > >                        default="direct", help="the wic imager
> > plugin")
> > > > > >      subparser.add_argument("--extra-space", type=int,
> > > > dest="extra_space",
> > > > > >                        default=0, help="additional free disk space
> > to
> > > > add
> > > > > > to the image")
> > > > > > +    subparser.add_argument("--sector-size", dest="sector_size",
> > > > type=int,
> > > > > > default=512,
> > > > > > +                      help="sector size in bytes (default: 512)")
> > > > > >      return
> > > > > >
> > > > > >
> > > > > > @@ -413,6 +415,8 @@ def imgtype(arg):
> > > > > >  def wic_init_parser_ls(subparser):
> > > > > >      subparser.add_argument("path", type=imgtype,
> > > > > >                          help="image spec: <image>[:<vfat
> > > > > > partition>[<path>]]")
> > > > > > +    subparser.add_argument("--sector-size", dest="sector_size",
> > > > type=int,
> > > > > > default=512,
> > > > > > +                        help="sector size in bytes (default:
> > 512)")
> > > > > >      subparser.add_argument("-n", "--native-sysroot",
> > > > > >                          help="path to the native sysroot
> > containing
> > > > the
> > > > > > tools")
> > > > > >      subparser.add_argument("-e", "--image-name",
> > dest="image_name",
> > > > > > @@ -433,6 +437,8 @@ def wic_init_parser_cp(subparser):
> > > > > >                          help="image spec: <image>:<vfat
> > > > > > partition>[<path>] or <file>")
> > > > > >      subparser.add_argument("dest",
> > > > > >                          help="image spec: <image>:<vfat
> > > > > > partition>[<path>] or <file>")
> > > > > > +    subparser.add_argument("--sector-size", dest="sector_size",
> > > > type=int,
> > > > > > default=512,
> > > > > > +                        help="sector size in bytes (default:
> > 512)")
> > > > > >      subparser.add_argument("-n", "--native-sysroot",
> > > > > >                          help="path to the native sysroot
> > containing
> > > > the
> > > > > > tools")
> > > > > >      subparser.add_argument("-e", "--image-name",
> > dest="image_name",
> > > > > > @@ -445,6 +451,8 @@ def wic_init_parser_cp(subparser):
> > > > > >  def wic_init_parser_rm(subparser):
> > > > > >      subparser.add_argument("path", type=imgpathtype,
> > > > > >                          help="path: <image>:<vfat
> > partition><path>")
> > > > > > +    subparser.add_argument("--sector-size", dest="sector_size",
> > > > type=int,
> > > > > > default=512,
> > > > > > +                        help="sector size in bytes (default:
> > 512)")
> > > > > >      subparser.add_argument("-n", "--native-sysroot",
> > > > > >                          help="path to the native sysroot
> > containing
> > > > the
> > > > > > tools")
> > > > > >      subparser.add_argument("-r", dest="recursive_delete",
> > > > > > action="store_true", default=False,
> > > > > > --
> > > > > > 2.51.0
> > > > > >
> > > > > >
> > > > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > > > > Links: You receive all messages sent to this group.
> > > > > > View/Reply Online (#231176):
> > > > > > https://lists.openembedded.org/g/openembedded-core/message/231176
> > > > > > Mute This Topic:
> > https://lists.openembedded.org/mt/117833550/1050810
> > > > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > > > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub
> > > > [
> > > > > > bruce.ashfield@gmail.com]
> > > > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > > > >
> > > > > >
> > > > >
> > > > > --
> > > > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > > thee
> > > > > at its end
> > > > > - "Use the force Harry" - Gandalf, Star Trek II
> > > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee
> > > at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> >
> 
> 
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II

