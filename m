Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F23E9B248
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 09:53:09 +0000 (UTC)
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16864.1771926780007975422
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 01:53:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=kxGHFgJa;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=qy7XeEVV;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2C07814000F5;
	Tue, 24 Feb 2026 04:52:59 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 24 Feb 2026 04:52:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1771926779; x=1772013179; bh=qQWYowtV1g
	yhK5v+DLkV0CBN8Cbxf4FkWDKEegfqTzs=; b=kxGHFgJaGGFcsi2Z75qE7TqCRT
	xleK/jFcF7cInq5g1ABa+qmIfqjZ63NPzQ2EHlcp+RlVYAHFIfblLVYFhQTCyZEV
	tj3rWxRYTYoEOf3hXvkahGKlqNnbX0ramX9ZgMfxMeIqgIw58BW8uFUt6E1DZAS/
	5p7E2SODQcLHlSkdMXd3f09PAMT/bDYVNS9KoOQpEz4dMeBZeCLI78+SNaHoD6sq
	j+XLNZvAgIaNVYV/a+GOupK7ENMTuwMGLgyK9sfl6mh9ZFQ4qV/rhXko9UcGR1+i
	tF4ap2NgiMSIVm/plSbBz/FUMxC5iXPhn91YRmThQfTtgq8KBGxHpeAwuEPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771926779; x=1772013179; bh=qQWYowtV1gyhK5v+DLkV0CBN8Cbxf4FkWDK
	EegfqTzs=; b=qy7XeEVVU9R9/k1VpEwgl5i2k+gDb1cP05tLIl+kXdB040Z+WWM
	e6DfxubYcC6rCGXSTikuC6+KOZCal+6CKf00BC/LLLQEp60NoBh4pqo/Lv6uJQ3J
	ajISeBJUyeKCJDsrF70Q2u3lkg35sKc+69fxcE1iN7T1dGfPgQBZV0ek2pgpvQbp
	U/5s+5Ie7cPYIFuBRiGj9BNB4P9g1JleoRbTVqmwsDO9sDYc4mSUsuAfj4//dHLB
	qhFJsSuFisyZWBY7D9OwWrJX1PWHn9KnGZAUCLEqasWUpM0NL2cRHpm5ztcZskdI
	ZJv9iD9v542k/4epbG3ziGhShheM2Uwbb+A==
X-ME-Sender: <xms:-nSdadkqtAAlQg0Ex-8oIEaMj1NkZxzcJUtQv_KryPWoB_eNIkiSlg>
    <xme:-nSdae3T1LE9BVsadbdLaC13QrzJToyzQRlA32Ga_czl6GVFZxwO9K9BmZom_qY36
    XTiOJ6WoS5hJNCaUCaj2s0vMW8zIRNyL6UzQNkLlxTx_13d7CHHyqE>
X-ME-Received: <xmr:-nSdaRQgygbZR5l1iPbu1gZKNEgx7Bxxu8JvtbDdNU79ezviSVvj_WPf4kV8GUmOUW4pGk4--utoGOH_jtI7aaNQzTA_s8CFzU3Ffbs81XLY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeelkeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepvdetkeeigfegfeetudffjeegfeejgfefudeuff
    evfeeiffdvleduhfdviedvheegnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghdplhhoghhgvghrrdhinhhfohenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghp
    thhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthifohgvrhhnvghrse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvges
    lhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:-3SdaYvpK48VEWSwEZzXiKm7dLSXhuGgsglbsVAW-FkZUj3-nKJZsA>
    <xmx:-3SdaebPbyncu7HRz0aZBSCt8Hbe4L-TGlDwVSslOY1Gh5kG-oc3Tg>
    <xmx:-3SdaVsUBNNfxcHEES1TWBW50xBz9KzK51Mrt9bC6Ccu6TljnbLF9A>
    <xmx:-3SdaYEffwyV4rkQx7CrzhGALe3G884RuMhdGht0dgGSA1x6p66Zrg>
    <xmx:-3SdaW1_FBDcVhLcE56wcui4z8fJ52xiFjtNPb4ptbG5Z-ua3vVX69ZN>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Feb 2026 04:52:58 -0500 (EST)
Message-ID: <5c5a5fe66c0eddc7a061047ee1c56af9141a1e3f.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v5 01/10] wic: re-implement sector-size support
From: Paul Barker <paul@pbarker.dev>
To: twoerner@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 24 Feb 2026 09:52:55 +0000
In-Reply-To: <20260223215008.2062721-2-twoerner@gmail.com>
References: <20260223215008.2062721-1-twoerner@gmail.com>
	 <20260223215008.2062721-2-twoerner@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-cXUxHo1SOQW8FkC6VKbv"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 09:53:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231756


--=-cXUxHo1SOQW8FkC6VKbv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-02-23 at 16:49 -0500, Trevor Woerner via
lists.openembedded.org wrote:
> The previous implementation to add variable sector-size support:
> - required the variable WIC_SECTOR_SIZE either be defined in a
>   configuration file or be defined in a --vars file
> - this means that every invocation of "wic ls", "wic cp", or "wic rm"
>   needed this variable defined (config or --vars)
> - required the user to create separate *wks files for every sector size
>   they wanted to use
> - required the user to specify the mkfs-extraopts by hand to specify the
>   correct sector size: e.g.
> 	bootloader --ptable gpt
> 	part --fstype ext4 --source rootfs --label rofs-a --mkfs-extraopts "-b 4=
096"
> 	part --fstype ext4 --source rootfs --use-uuid --mkfs-extraopts "-b 4096"
> - specifying --mkfs-extraopts replaces the defaults with the
>   user-supplied values
> - only provided details to support using variable sector-sizes with
>   ext[234] filesystems
> - it would not be possible to generate images with different sector
>   sizes in the same build since the configuration and *wks files would
>   need to change and the build re-run for each size
>=20
> Update the sector-size handling so that:
> - the sector-size will now be provided on the cmdline to the "wic ls",
>   "wic cp", "wic rm", and "wic create" commands: default =3D 512
> - this means the configuration and/or --vars file does not need to be
>   changed in order to perform those operations on images with different
>   sector sizes
> - support is provided implicitly for mkdosfs and ext[234] partitions
> - the user no longer needs to know and supply the sector-size magic in
>   --mkfs-extraopts (thereby clobbering the other defaults)
>=20
> If the --sector-size command-line argument is not given, allow the
> sector-size to be provided via the WIC_SECTOR_SIZE bitbake variable.
> Warn the user whenever the WIC_SECTOR_SIZE bitbake variable is used,
> mention it is deprecated, and suggest the user use the cmdline arg
> instead. If both are given, warn the user that the cmdline argument
> takes precedence.
>=20
> AI-Generated: codex/gpt-5.1-codex-max
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> changes in v5:
> - fix a bug in the case where WIC_SECTOR_SIZE does not exist at all and
>   is not provided neither in the environment nor a config file
>=20
> changes in v4:
> - allow the sector-size to be set from WIC_SECTOR_SIZE (environment or
>   vars file) but mark its use deprecated, suggest the user use the
>   cmdline arg instead; if both are given point out that the cmdline
>   value takes precedence
>=20
> changes in v3:
> - none
>=20
> changes in v2:
> - none

Thanks for the patch! This looks fairly good, just a little tidy up
needed.

> diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest=
/cases/wic.py
> index ecaee5a29144..7ad61fa700f7 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -935,33 +935,22 @@ bootloader --ptable gpt""")
>          finally:
>              os.remove(wks_file)
> =20
> -    def test_wic_sector_size(self):
> -        """Test generation image sector size"""
> -=20
> +    def test_wic_sector_size_cli(self):
> +        """Test sector size handling via CLI option."""
> +
>          oldpath =3D os.environ['PATH']
>          os.environ['PATH'] =3D get_bb_var("PATH", "wic-tools")
> =20
>          try:
> -            # Add WIC_SECTOR_SIZE into config
> -            config =3D 'WIC_SECTOR_SIZE =3D "4096"\n'\
> -                     'WICVARS:append =3D " WIC_SECTOR_SIZE"\n'
> -            self.append_config(config)
>              bitbake('core-image-minimal')
> =20
> -            # Check WIC_SECTOR_SIZE apply to bitbake variable
> -            wic_sector_size_str =3D get_bb_var('WIC_SECTOR_SIZE', 'core-=
image-minimal')
> -            wic_sector_size =3D int(wic_sector_size_str)
> -            self.assertEqual(4096, wic_sector_size)
> -
> -            self.logger.info("Test wic_sector_size: %d \n" % wic_sector_=
size)
> -
>              with NamedTemporaryFile("w", suffix=3D".wks") as wks:
>                  wks.writelines(
>                      ['bootloader --ptable gpt\n',
> -                     'part --fstype ext4 --source rootfs --label rofs-a =
--mkfs-extraopts "-b 4096"\n',
> -                     'part --fstype ext4 --source rootfs --use-uuid --mk=
fs-extraopts "-b 4096"\n'])
> +                     'part --fstype ext4 --source rootfs --label rofs-a\=
n',
> +                     'part --fstype ext4 --source rootfs --use-uuid\n'])
>                  wks.flush()
> -                cmd =3D "wic create %s -e core-image-minimal -o %s" % (w=
ks.name, self.resultdir)
> +                cmd =3D "wic create %s -e core-image-minimal -o %s --sec=
tor-size 4096" % (wks.name, self.resultdir)
>                  runCmd(cmd)
>                  wksname =3D os.path.splitext(os.path.basename(wks.name))=
[0]
>                  images =3D glob(os.path.join(self.resultdir, "%s-*direct=
" % wksname))
> @@ -969,24 +958,18 @@ bootloader --ptable gpt""")
> =20
>              sysroot =3D get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
>              # list partitions
> -            result =3D runCmd("wic ls %s -n %s" % (images[0], sysroot))
> +            result =3D runCmd("wic ls %s -n %s --sector-size 4096" % (im=
ages[0], sysroot))
>              self.assertEqual(3, len(result.output.split('\n')))
> =20
> -            # verify partition size with wic
> -            res =3D runCmd("export PARTED_SECTOR_SIZE=3D%d; parted -m %s=
 unit b p" % (wic_sector_size, images[0]),
> +            # verify partition size with parted output
> +            res =3D runCmd("export PARTED_SECTOR_SIZE=3D%d; parted -m %s=
 unit b p" % (4096, images[0]),
>                           stderr=3Dsubprocess.PIPE)
> =20
> -            # parse parted output which looks like this:
> -            # BYT;\n
> -            # /var/tmp/wic/build/tmpgjzzefdd-202410281021-sda.direct:785=
69472B:file:4096:4096:gpt::;\n
> -            # 1:139264B:39284735B:39145472B:ext4:rofs-a:;\n
> -            # 2:39284736B:78430207B:39145472B:ext4:primary:;\n
>              disk_info =3D res.output.splitlines()[1]
> -            # Check sector sizes
>              sector_size_logical =3D int(disk_info.split(":")[3])
>              sector_size_physical =3D int(disk_info.split(":")[4])
> -            self.assertEqual(wic_sector_size, sector_size_logical, "Logi=
cal sector size is not %d." % wic_sector_size)
> -            self.assertEqual(wic_sector_size, sector_size_physical, "Phy=
sical sector size is not %d." % wic_sector_size)
> +            self.assertEqual(4096, sector_size_logical, "Logical sector =
size is not 4096.")
> +            self.assertEqual(4096, sector_size_physical, "Physical secto=
r size is not 4096.")
> =20
>          finally:
>              os.environ['PATH'] =3D oldpath
> diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
> index 8682ca3176c2..949119edd487 100644
> --- a/scripts/lib/wic/engine.py
> +++ b/scripts/lib/wic/engine.py
> @@ -252,7 +252,7 @@ def debugfs_version_check(debugfs_path, min_ver=3D(1,=
 46, 5)):
> =20
> =20
>  class Disk:
> -    def __init__(self, imagepath, native_sysroot, fstypes=3D('fat', 'ext=
')):
> +    def __init__(self, imagepath, native_sysroot, fstypes=3D('fat', 'ext=
'), sector_size=3D512):
>          self.imagepath =3D imagepath
>          self.native_sysroot =3D native_sysroot
>          self.fstypes =3D fstypes
> @@ -261,16 +261,7 @@ class Disk:
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
> =20
>          # find parted
>          # read paths from $PATH environment variable
> @@ -299,7 +290,7 @@ class Disk:
>          if self._partitions is None:
>              self._partitions =3D OrderedDict()
> =20
> -            if self.sector_size is not None:
> +            if self.sector_size:

Sector size should not always be set as we have a default, this if
condition isn't needed anymore.

>                  out =3D exec_cmd("export PARTED_SECTOR_SIZE=3D%d; %s -sm=
 %s unit B print" % \
>                             (self.sector_size, self.parted, self.imagepat=
h), True)
>              else:
> @@ -340,11 +331,15 @@ class Disk:
>              raise WicError("Partition %s is not in the image" % pnum)
>          part =3D self.partitions[pnum]
>          # check if fstype is supported
> +        # NOTE: parted is unable to identify dos-type partitions with a =
4k sector-size
> +        #       if the type is empty and a non-default sector size is us=
ed, assume 'fat'
> +        #       fdisk identifies them without issue
> +        part_fstype =3D part.fstype if part.fstype or self.sector_size =
=3D=3D 512 else 'fat'

This is difficult to parse. What's the result if part.fstype is None but
self.sector_size is 512?

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
> @@ -615,8 +610,9 @@ class Disk:
>                              label =3D part.get("name")
>                              label_str =3D "-n {}".format(label) if label=
 else ''
> =20
> -                            cmd =3D "{} {} -C {} {}".format(self.mkdosfs=
, label_str, partfname,
> -                                                          part['size'])
> +                            sector_str =3D "-S {}".format(self.sector_si=
ze) if self.sector_size else ''
> +                            cmd =3D "{} {} {} -C {} {}".format(self.mkdo=
sfs, label_str, sector_str, partfname,
> +                                                             part['size'=
])
>                              exec_cmd(cmd)
>                              # copy content from the temporary directory =
to the new partition
>                              cmd =3D "{} -snompi {} {}/* ::".format(self.=
mcopy, partfname, tmpdir)
> @@ -638,14 +634,19 @@ class Disk:
> =20
>  def wic_ls(args, native_sysroot):
>      """List contents of partitioned image or vfat partition."""
> -    disk =3D Disk(args.path.image, native_sysroot)
> +    disk =3D Disk(args.path.image, native_sysroot, sector_size=3Dargs.se=
ctor_size)
>      if not args.path.part:
>          if disk.partitions:
>              print('Num     Start        End          Size      Fstype')
>              for part in disk.partitions.values():
> +                # size values are in bytes from parted; convert to secto=
rs if a custom sector size was requested
> +                display_size =3D part.size
> +                if args.sector_size and args.sector_size !=3D disk._lsec=
tor_size:
> +                    display_size =3D part.size // args.sector_size
>                  print("{:2d}  {:12d} {:12d} {:12d}  {}".format(\
> -                          part.pnum, part.start, part.end,
> -                          part.size, part.fstype))
> +                          part.pnum, part.start // args.sector_size,
> +                          part.end // args.sector_size,
> +                          display_size, part.fstype))

This looks like it could confuse users - is it always clear to the user
whether the output is in bytes or in sectors? Why not leave this always
printing the size in bytes so that there's no confusion?

>      else:
>          path =3D args.path.path or '/'
>          print(disk.dir(args.path.part, path))
> @@ -656,9 +657,9 @@ def wic_cp(args, native_sysroot):
>      partitioned image.
>      """
>      if isinstance(args.dest, str):
> -        disk =3D Disk(args.src.image, native_sysroot)
> +        disk =3D Disk(args.src.image, native_sysroot, sector_size=3Dargs=
.sector_size)
>      else:
> -        disk =3D Disk(args.dest.image, native_sysroot)
> +        disk =3D Disk(args.dest.image, native_sysroot, sector_size=3Darg=
s.sector_size)
>      disk.copy(args.src, args.dest)
> =20
> =20
> @@ -667,7 +668,7 @@ def wic_rm(args, native_sysroot):
>      Remove files or directories from the vfat partition of
>      partitioned image.
>      """
> -    disk =3D Disk(args.path.image, native_sysroot)
> +    disk =3D Disk(args.path.image, native_sysroot, sector_size=3Dargs.se=
ctor_size)
>      disk.remove(args.path.part, args.path.path, args.recursive_delete)
> =20
>  def wic_write(args, native_sysroot):
> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> index 6b49a67de938..5d7c40456a80 100644
> --- a/scripts/lib/wic/help.py
> +++ b/scripts/lib/wic/help.py
> @@ -118,7 +118,7 @@ wic_create_usage =3D """
>   usage: wic create <wks file or image name> [-o <DIRNAME> | --outdir <DI=
RNAME>]
>              [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
>              [-r, --rootfs-dir] [-b, --bootimg-dir]
> -            [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootf=
s]
> +            [-k, --kernel-dir] [-n, --native-sysroot] [--sector-size <by=
tes>] [-f, --build-rootfs]
>              [-c, --compress-with] [-m, --bmap]
> =20
>   This command creates an OpenEmbedded image based on the 'OE kickstart
> @@ -139,13 +139,16 @@ SYNOPSIS
>      wic create <wks file or image name> [-o <DIRNAME> | --outdir <DIRNAM=
E>]
>          [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
>          [-r, --rootfs-dir] [-b, --bootimg-dir]
> -        [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootfs]
> +        [-k, --kernel-dir] [-n, --native-sysroot] [--sector-size <bytes>=
] [-f, --build-rootfs]
>          [-c, --compress-with] [-m, --bmap] [--no-fstab-update]
> =20
>  DESCRIPTION
>      This command creates an OpenEmbedded image based on the 'OE
>      kickstart commands' found in the <wks file>.
> =20
> +    Use the --sector-size option to select the sector size (in bytes)
> +    used for partition layout calculations (default is 512).
> +
>      In order to do this, wic needs to know the locations of the
>      various build artifacts required to build the image.
> =20
> @@ -278,7 +281,7 @@ wic_ls_usage =3D """
> =20
>   List content of a partitioned image
> =20
> - usage: wic ls <image>[:<partition>[<path>]] [--native-sysroot <path>]
> + usage: wic ls <image>[:<partition>[<path>]] [--native-sysroot <path>] [=
--sector-size <bytes>]
> =20
>   This command  outputs either list of image partitions or directory cont=
ents
>   of vfat and ext* partitions.
> @@ -296,7 +299,7 @@ SYNOPSIS
>      wic ls <image>
>      wic ls <image>:<vfat or ext* partition>
>      wic ls <image>:<vfat or ext* partition><path>
> -    wic ls <image>:<vfat or ext* partition><path> --native-sysroot <path=
>
> +    wic ls <image>:<vfat or ext* partition><path> --native-sysroot <path=
> [--sector-size <bytes>]
> =20
>  DESCRIPTION
>      This command lists either partitions of the image or directory conte=
nts
> @@ -336,6 +339,8 @@ DESCRIPTION
> =20
>      The -n option is used to specify the path to the native sysroot
>      containing the tools(parted and mtools) to use.
> +    The --sector-size option sets the sector size used for partition mat=
h
> +    (default is 512 bytes).
> =20
>  """
> =20
> @@ -343,7 +348,7 @@ wic_cp_usage =3D """
> =20
>   Copy files and directories to/from the vfat or ext* partition
> =20
> - usage: wic cp <src> <dest> [--native-sysroot <path>]
> + usage: wic cp <src> <dest> [--native-sysroot <path>] [--sector-size <by=
tes>]
> =20
>   source/destination image in format <image>:<partition>[<path>]
> =20
> @@ -364,7 +369,7 @@ SYNOPSIS
>      wic cp <src> <dest>:<partition>
>      wic cp <src>:<partition> <dest>
>      wic cp <src> <dest-image>:<partition><path>
> -    wic cp <src> <dest-image>:<partition><path> --native-sysroot <path>
> +    wic cp <src> <dest-image>:<partition><path> --native-sysroot <path> =
[--sector-size <bytes>]
> =20
>  DESCRIPTION
>      This command copies files or directories either
> @@ -408,13 +413,15 @@ DESCRIPTION
> =20
>      The -n option is used to specify the path to the native sysroot
>      containing the tools(parted and mtools) to use.
> +    The --sector-size option sets the sector size used for partition mat=
h
> +    (default is 512 bytes).
>  """
> =20
>  wic_rm_usage =3D """
> =20
>   Remove files or directories from the vfat or ext* partitions
> =20
> - usage: wic rm <image>:<partition><path> [--native-sysroot <path>]
> + usage: wic rm <image>:<partition><path> [--native-sysroot <path>] [--se=
ctor-size <bytes>]
> =20
>   This command  removes files or directories from the vfat or ext* partit=
ions of
>   the partitioned image.
> @@ -466,6 +473,8 @@ DESCRIPTION
> =20
>      The -n option is used to specify the path to the native sysroot
>      containing the tools(parted and mtools) to use.
> +    The --sector-size option sets the sector size used for partition mat=
h
> +    (default is 512 bytes).
> =20
>      The -r option is used to remove directories and their contents
>      recursively,this only applies to ext* partition.
> diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
> index 1a7c140fa6c8..310e6367a2ad 100644
> --- a/scripts/lib/wic/misc.py
> +++ b/scripts/lib/wic/misc.py
> @@ -263,4 +263,10 @@ def get_bitbake_var(var, image=3DNone, cache=3DTrue)=
:
>      Provide old get_bitbake_var API by wrapping
>      get_var method of BB_VARS singleton.
>      """
> +    if var =3D=3D "WIC_SECTOR_SIZE":
> +        env_val =3D os.environ.get("WIC_SECTOR_SIZE")
> +        if env_val is not None:
> +            logger.warning("DEPRECATED: Using WIC_SECTOR_SIZE from envir=
onment; prefer --sector-size to avoid surprises.")
> +            return env_val
> +
>      return BB_VARS.get_var(var, image, cache)
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index 8fed686e903e..df6e3271649b 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -65,6 +65,50 @@ class Partition():
> =20
>          self.lineno =3D lineno
>          self.source_file =3D ""
> +        self.sector_size =3D 512
> +
> +    def _mkdosfs_extraopts(self):
> +        """
> +        Build mkdosfs extra options ensuring the CLI sector size is appl=
ied.
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

This section needs a comment to explain what it's doing.

> +
> +    def _mkfs_ext_extraopts(self, base_opts):
> +        """
> +        Build mkfs.ext* extra options ensuring the CLI sector size is ap=
plied.
> +        """
> +        extraopts =3D self.mkfs_extraopts or base_opts
> +        # Only add an explicit block size when a non-default sector size=
 is requested.
> +        if self.sector_size and self.sector_size !=3D 512:

self.sector_size should never be considered false now that we have a
default. So this can just be `if self.sector_size !=3D 512`.

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
> =20
>      def get_extra_block_count(self, current_blocks):
>          """
> @@ -138,6 +182,8 @@ class Partition():
>          Prepare content for individual partitions, depending on
>          partition command parameters.
>          """
> +        # capture the sector size requested on the CLI for mkdosfs invoc=
ations
> +        self.sector_size =3D getattr(creator, 'sector_size', 512) or 512

The third argument to getattr() is a default, so `or 512` is not
required.

>          self.updated_fstab_path =3D updated_fstab_path
>          if self.updated_fstab_path and not (self.fstype.startswith("ext"=
) or self.fstype =3D=3D "msdos"):
>              self.update_fstab_in_rootfs =3D True
> @@ -293,7 +339,7 @@ class Partition():
>          with open(rootfs, 'w') as sparse:
>              os.ftruncate(sparse.fileno(), rootfs_size * 1024)
> =20
> -        extraopts =3D self.mkfs_extraopts or "-F -i 8192"
> +        extraopts =3D self._mkfs_ext_extraopts("-F -i 8192")
> =20
>          # use hash_seed to generate reproducible ext4 images
>          (extraopts, pseudo) =3D self.get_hash_seed_ext4(extraopts, pseud=
o)
> @@ -401,7 +447,7 @@ class Partition():
> =20
>          size_str =3D ""
> =20
> -        extraopts =3D self.mkfs_extraopts or '-S 512'
> +        extraopts =3D self._mkdosfs_extraopts()
> =20
>          dosfs_cmd =3D "mkdosfs %s -i %s %s %s -C %s %d" % \
>                      (label_str, self.fsuuid, size_str, extraopts, rootfs=
,
> @@ -452,7 +498,7 @@ class Partition():
>          with open(rootfs, 'w') as sparse:
>              os.ftruncate(sparse.fileno(), size * 1024)
> =20
> -        extraopts =3D self.mkfs_extraopts or "-i 8192"
> +        extraopts =3D self._mkfs_ext_extraopts("-i 8192")
> =20
>          # use hash_seed to generate reproducible ext4 images
>          (extraopts, pseudo) =3D self.get_hash_seed_ext4(extraopts, None)
> @@ -498,7 +544,7 @@ class Partition():
> =20
>          size_str =3D ""
> =20
> -        extraopts =3D self.mkfs_extraopts or '-S 512'
> +        extraopts =3D self._mkdosfs_extraopts()
> =20
>          dosfs_cmd =3D "mkdosfs %s -i %s %s %s -C %s %d" % \
>                      (label_str, self.fsuuid, extraopts, size_str, rootfs=
,
> @@ -559,4 +605,3 @@ class Partition():
>                      logger.warn("%s Inodes (of size %d) are too small." =
%
>                                  (get_err_str(self), size))
>                  break
> -
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/p=
lugins/imager/direct.py
> index ad922cfbf122..3adc6eee6280 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -67,6 +67,7 @@ class DirectPlugin(ImagerPlugin):
>          self._image =3D None
>          self.ptable_format =3D self.ks.bootloader.ptable
>          self.parts =3D self.ks.partitions
> +        self.sector_size =3D options.sector_size or 512

Check if `or 512` is really needed here.

> =20
>          # as a convenience, set source to the boot partition source
>          # instead of forcing it to be set via bootloader --source
> @@ -78,7 +79,7 @@ class DirectPlugin(ImagerPlugin):
>          image_path =3D self._full_path(self.workdir, self.parts[0].disk,=
 "direct")
>          self._image =3D PartitionedImage(image_path, self.ptable_format,=
 self.ks.bootloader.diskid,
>                                         self.parts, self.native_sysroot,
> -                                       options.extra_space)
> +                                       options.extra_space, self.sector_=
size)
> =20
>      def setup_workdir(self, workdir):
>          if workdir:
> @@ -294,15 +295,13 @@ MBR_OVERHEAD =3D 1
>  # Overhead of the GPT partitioning scheme
>  GPT_OVERHEAD =3D 34
> =20
> -# Size of a sector in bytes
> -SECTOR_SIZE =3D 512
> -
>  class PartitionedImage():
>      """
>      Partitioned image in a file.
>      """
> =20
> -    def __init__(self, path, ptable_format, disk_id, partitions, native_=
sysroot=3DNone, extra_space=3D0):
> +    def __init__(self, path, ptable_format, disk_id, partitions, native_=
sysroot=3DNone, extra_space=3D0,
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

A default is provided in the arguments list so `or 512` is not required.

> =20
>          self.native_sysroot =3D native_sysroot
>          num_real_partitions =3D len([p for p in self.partitions if not p=
.no_table])
> diff --git a/scripts/lib/wic/plugins/source/bootimg_efi.py b/scripts/lib/=
wic/plugins/source/bootimg_efi.py
> index 430b0a4b023a..864d6898fc9d 100644
> --- a/scripts/lib/wic/plugins/source/bootimg_efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg_efi.py
> @@ -415,8 +415,9 @@ class BootimgEFIPlugin(SourcePlugin):
> =20
>          label =3D part.label if part.label else "ESP"
> =20
> -        dosfs_cmd =3D "mkdosfs -v -n %s -i %s -C %s %d" % \
> -                    (label, part.fsuuid, bootimg, blocks)
> +        sector_size =3D getattr(creator, 'sector_size', 512) or 512

The third argument to getattr() is a default, so `or 512` is not
required.

> +        dosfs_cmd =3D "mkdosfs -v -n %s -i %s -S %d -C %s %d" % \
> +                    (label, part.fsuuid, sector_size, bootimg, blocks)
>          exec_native_cmd(dosfs_cmd, native_sysroot)
>          logger.debug("mkdosfs:\n%s" % (str(out)))
> =20
> diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py b/scripts/l=
ib/wic/plugins/source/bootimg_pcbios.py
> index a7cc5d12c620..32edac47fa09 100644
> --- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
> +++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
> @@ -132,7 +132,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
>                  cls._do_prepare_grub(part, cr_workdir, oe_builddir,
>                                  kernel_dir, rootfs_dir, native_sysroot)
>              elif source_params['loader-bios'] =3D=3D 'syslinux':
> -                cls._do_prepare_syslinux(part, cr_workdir, bootimg_dir,
> +                cls._do_prepare_syslinux(part, creator, cr_workdir, boot=
img_dir,
>                                      kernel_dir, native_sysroot)
>              else:
>                  raise WicError("unrecognized bootimg_pcbios loader: %s" =
% source_params['loader-bios'])
> @@ -142,7 +142,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
>          except KeyError:
>              # Required by do_install_disk
>              cls.loader =3D 'syslinux'
> -            cls._do_prepare_syslinux(part, cr_workdir, bootimg_dir,
> +            cls._do_prepare_syslinux(part, creator, cr_workdir, bootimg_=
dir,
>                                  kernel_dir, native_sysroot)
> =20
>      @classmethod
> @@ -240,7 +240,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
>          cfg.close()
> =20
>      @classmethod
> -    def _do_prepare_syslinux(cls, part, cr_workdir, bootimg_dir,
> +    def _do_prepare_syslinux(cls, part, creator, cr_workdir, bootimg_dir=
,
>                               kernel_dir, native_sysroot):
>          """
>          Called to do the actual content population for a partition i.e. =
it
> @@ -292,8 +292,9 @@ class BootimgPcbiosPlugin(SourcePlugin):
> =20
>          label =3D part.label if part.label else "boot"
> =20
> -        dosfs_cmd =3D "mkdosfs -n %s -i %s -S 512 -C %s %d" % \
> -                    (label, part.fsuuid, bootimg, blocks)
> +        sector_size =3D getattr(creator, 'sector_size', 512) or 512

As above.

> +        dosfs_cmd =3D "mkdosfs -n %s -i %s -S %d -C %s %d" % \
> +                    (label, part.fsuuid, sector_size, bootimg, blocks)
>          exec_native_cmd(dosfs_cmd, native_sysroot)
> =20
>          mcopy_cmd =3D "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
> diff --git a/scripts/lib/wic/plugins/source/isoimage_isohybrid.py b/scrip=
ts/lib/wic/plugins/source/isoimage_isohybrid.py
> index fdab188db1f8..9195ef5f3184 100644
> --- a/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
> +++ b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
> @@ -367,8 +367,9 @@ class IsoImagePlugin(SourcePlugin):
> =20
>              esp_label =3D source_params.get('esp_label', 'EFIimg')
> =20
> -            dosfs_cmd =3D 'mkfs.vfat -n \'%s\' -S 512 -C %s %d' \
> -                        % (esp_label, bootimg, blocks)
> +            sector_size =3D getattr(creator, 'sector_size', 512) or 512

As above.

> +            dosfs_cmd =3D "mkfs.vfat -n '%s' -S %d -C %s %d" % \
> +                        (esp_label, sector_size, bootimg, blocks)
>              exec_native_cmd(dosfs_cmd, native_sysroot)
> =20
>              mmd_cmd =3D "mmd -i %s ::/EFI" % bootimg
> diff --git a/scripts/wic b/scripts/wic
> index 9137208f5e8f..7006efe5e76c 100755
> --- a/scripts/wic
> +++ b/scripts/wic
> @@ -103,6 +103,40 @@ class RootfsArgAction(argparse.Action):
>          namespace.__dict__['rootfs_dir'][key] =3D rootfs_dir
> =20
> =20
> +def _apply_sector_size_default(args):
> +    """
> +    Populate args.sector_size.
> +    Prefer --sector-size if given, WIC_SECTOR_SIZE if not, otherwise fal=
l back to 512.
> +    """
> +    if not hasattr(args, "sector_size"):
> +        return
> +
> +    BB_VARS.vars_dir =3D args.vars_dir
> +    try:
> +        tmp_val =3D get_bitbake_var("WIC_SECTOR_SIZE", args.image_name)
> +        if tmp_val:
> +            try:
> +                env_val =3D int(tmp_val)
> +            except ValueError:
> +                raise WicError("Invalid WIC_SECTOR_SIZE value '%s'; plea=
se provide an integer or use --sector-size." % tmp_val)
> +
> +            if args.sector_size is not None:
> +                logger.warning("WIC_SECTOR_SIZE (%d) and --sector-size (=
%d) were both provided; --sector-size used.", env_val, args.sector_size)
> +                logger.warning("DEPRECATED: WIC_SECTOR_SIZE is deprecate=
d and will be removed, use the --sector-size command-line argument instead.=
")
> +                return
> +            else:
> +                logger.warning("WIC_SECTOR_SIZE (%s) provided but --sect=
or-size not provided; use --sector-size to avoid confusion.", env_val)
> +                logger.warning("DEPRECATED: WIC_SECTOR_SIZE is deprecate=
d and will be removed, use the --sector-size command-line argument instead.=
")
> +                args.sector_size =3D env_val
> +                return

You can reduce duplication here. Also, `else` is not needed after a
return statement.

> +    except:
> +        pass
> +
> +    if args.sector_size is not None:
> +        return
> +    args.sector_size =3D 512
> +
> +
>  def wic_create_subcommand(options, usage_str):
>      """
>      Command-line handling for image creation.  The real work is done
> @@ -376,6 +410,8 @@ def wic_init_parser_create(subparser):
>                        default=3D"direct", help=3D"the wic imager plugin"=
)
>      subparser.add_argument("--extra-space", type=3Dint, dest=3D"extra_sp=
ace",
>                        default=3D0, help=3D"additional free disk space to=
 add to the image")
> +    subparser.add_argument("--sector-size", dest=3D"sector_size", type=
=3Dint, default=3DNone,
> +                      help=3D"sector size in bytes (default: 512)")
>      return
> =20
> =20
> @@ -413,6 +449,8 @@ def imgtype(arg):
>  def wic_init_parser_ls(subparser):
>      subparser.add_argument("path", type=3Dimgtype,
>                          help=3D"image spec: <image>[:<vfat partition>[<p=
ath>]]")
> +    subparser.add_argument("--sector-size", dest=3D"sector_size", type=
=3Dint, default=3DNone,
> +                        help=3D"sector size in bytes (default: 512)")
>      subparser.add_argument("-n", "--native-sysroot",
>                          help=3D"path to the native sysroot containing th=
e tools")
>      subparser.add_argument("-e", "--image-name", dest=3D"image_name",
> @@ -433,6 +471,8 @@ def wic_init_parser_cp(subparser):
>                          help=3D"image spec: <image>:<vfat partition>[<pa=
th>] or <file>")
>      subparser.add_argument("dest",
>                          help=3D"image spec: <image>:<vfat partition>[<pa=
th>] or <file>")
> +    subparser.add_argument("--sector-size", dest=3D"sector_size", type=
=3Dint, default=3DNone,
> +                        help=3D"sector size in bytes (default: 512)")
>      subparser.add_argument("-n", "--native-sysroot",
>                          help=3D"path to the native sysroot containing th=
e tools")
>      subparser.add_argument("-e", "--image-name", dest=3D"image_name",
> @@ -445,6 +485,8 @@ def wic_init_parser_cp(subparser):
>  def wic_init_parser_rm(subparser):
>      subparser.add_argument("path", type=3Dimgpathtype,
>                          help=3D"path: <image>:<vfat partition><path>")
> +    subparser.add_argument("--sector-size", dest=3D"sector_size", type=
=3Dint, default=3DNone,
> +                        help=3D"sector size in bytes (default: 512)")
>      subparser.add_argument("-n", "--native-sysroot",
>                          help=3D"path to the native sysroot containing th=
e tools")
>      subparser.add_argument("-r", dest=3D"recursive_delete", action=3D"st=
ore_true", default=3DFalse,
> @@ -569,6 +611,8 @@ def main(argv):
>      if args.debug:
>          logger.setLevel(logging.DEBUG)
> =20
> +    _apply_sector_size_default(args)
> +
>      if "command" in vars(args):
>          if args.command =3D=3D "help":
>              if args.help_topic is None:

Best regards,

--=20
Paul Barker


--=-cXUxHo1SOQW8FkC6VKbv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaZ109xEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bn/IAP9XsqlI3UQIZd+IF2ayacGNLY7c45k8f40U
YQ/hKC9TQAEAk1/GCy4bZVKA1MnVi+XHR8AjDJKsuT1het35rSqXtQA=
=0jQW
-----END PGP SIGNATURE-----

--=-cXUxHo1SOQW8FkC6VKbv--

