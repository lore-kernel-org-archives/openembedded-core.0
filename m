Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE2FFCCD184
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 13:19:14 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.11457.1760188745686115053
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Oct 2025 06:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PctIB7Uf;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9482C1A12BE;
	Sat, 11 Oct 2025 13:19:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69DFD606EC;
	Sat, 11 Oct 2025 13:19:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9D62102F2233;
	Sat, 11 Oct 2025 15:18:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760188742; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pHGebXutyXq5NVidyLwBBgBQAMZYwcGAmC0yRAFsjxY=;
	b=PctIB7UfVb+WJrNZiHb6z0QrCKjsSdg1zKEqy1HIZ1pdt2h0g6D6x32l37c2PmDfhAqAh+
	mvXc9xzhzmL+YAGAl9R7pOrELI+i63I8WD5Vffh9Fu2eOtF2GsLkqXmlI/17SeC+TSW5U5
	onYgL3v+Y/slgJZhtqwog7tHLO/Knd3kdgNsLMA2QgtcTUHdxZvVqjD9hzv/LFgJM4EVyi
	BCoNQ7Neh+RYn6xUG4ij/PaUcMIpu5JlW035Q0l+J4Ooh6KWhVmWJKqHdHYl9yga2MjwUb
	uXpxXZOlND5mJGusYAUXPrMPXvGiWaG/XLyv6Z360eOPZCkMW+kpHbUc4Fn1dg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 11 Oct 2025 15:18:46 +0200
Message-Id: <DDFITTM4J8SO.13FKL48ZAQCD0@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <dani.barra25@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] wic: Content of the temporary updated
 fstab should be copied into the original not replacing it entirely.
Cc: <hongxu.jia@windriver.com>, <trevor.woerner@linaro.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250902190555.7929-1-dani.barra25@gmail.com>
 <20250902190555.7929-2-dani.barra25@gmail.com>
In-Reply-To: <20250902190555.7929-2-dani.barra25@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 13:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224718

On Tue Sep 2, 2025 at 9:05 PM CEST, dani.barra25 via lists.openembedded.org=
 wrote:
> From: Daniel Andrade <dani.barra25@gmail.com>
>
> Fixes [15947]
> The current functionality to update fstab generates a new temporary fstab=
 with the new partition configuration.
> However, this file does not retain any metadata being it a completely new=
 file.
> Because of this, when the rootfs plugin under `poky/scripts/lib/wic/plugi=
ns/source/rootfs.py` copies the file, it overrides the original fstab metad=
ata.
> The patch removes implementation of msdos/ext code for fstab since it is =
not possible to append content without rewriting the file to preserve metad=
ata.
>
> The timestamp applied to fstab is not the same as every other file.
> It seems like the `SOURCE_DATE_EPOCH` variable goes to the fallback times=
tamp SOURCE_DATE_EPOCH_FALLBACK.
> Since that variable is used everywhere, it is not the same value as REPRO=
DUCIBLE_TIMESTAMP_ROOTFS under poky/meta/conf/bitbake.conf that is applied =
in every other file.
>
> Signed-off-by: Daniel Andrade <dani.barra25@gmail.com>
> ---

Hi Daniel,

I finally had a bit of time to have a deeper look at these changes and
at the wic.Wic.test_no_fstab_update test. It turns out the test is
correct and your patch is indeed introducing a regression.

So our first assumption was the test was wrong, as changing the
filesystem resulted in a test fail. But actually, if you change the
filesystem in the wic command file, you also have to change the command
extracting the file from the filesystem. E.g. for squashfs, you need to
replace "debugfs -R cat" with "sqfscat".

Now talking about your patch, my comments below.

> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index bf2c34d594..82d754835c 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -131,7 +131,7 @@ class Partition():
>          partition command parameters.
>          """
>          self.updated_fstab_path =3D updated_fstab_path
> -        if self.updated_fstab_path and not (self.fstype.startswith("ext"=
) or self.fstype =3D=3D "msdos"):
> +        if self.updated_fstab_path:
>              self.update_fstab_in_rootfs =3D True
> =20
>          if not self.source:
> @@ -295,15 +295,6 @@ class Partition():
>              (self.fstype, extraopts, rootfs, label_str, self.fsuuid, roo=
tfs_dir)
>          exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=3Dpseudo)
> =20
> -        if self.updated_fstab_path and self.has_fstab and not self.no_fs=
tab_update:
> -            debugfs_script_path =3D os.path.join(cr_workdir, "debugfs_sc=
ript")
> -            with open(debugfs_script_path, "w") as f:
> -                f.write("cd etc\n")
> -                f.write("rm fstab\n")
> -                f.write("write %s fstab\n" % (self.updated_fstab_path))
> -            debugfs_cmd =3D "debugfs -w -f %s %s" % (debugfs_script_path=
, rootfs)
> -            exec_native_cmd(debugfs_cmd, native_sysroot)
> -
>          mkfs_cmd =3D "fsck.%s -pvfD %s" % (self.fstype, rootfs)
>          exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=3Dpseudo)
> =20
> @@ -400,10 +391,6 @@ class Partition():
>          mcopy_cmd =3D "mcopy -i %s -s %s/* ::/" % (rootfs, rootfs_dir)
>          exec_native_cmd(mcopy_cmd, native_sysroot)
> =20
> -        if self.updated_fstab_path and self.has_fstab and not self.no_fs=
tab_update:
> -            mcopy_cmd =3D "mcopy -m -i %s %s ::/etc/fstab" % (rootfs, se=
lf.updated_fstab_path)
> -            exec_native_cmd(mcopy_cmd, native_sysroot)
> -
>          chmod_cmd =3D "chmod 644 %s" % rootfs
>          exec_cmd(chmod_cmd)
> =20

So you are removing an optimisation on ext and fat filesystems. This
might raise further questions from other reviewers, but if that's
needed, why not.

> diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/p=
lugins/source/rootfs.py
> index e29f3a4c2f..3848af2a91 100644
> --- a/scripts/lib/wic/plugins/source/rootfs.py
> +++ b/scripts/lib/wic/plugins/source/rootfs.py
> @@ -223,8 +223,8 @@ class RootfsPlugin(SourcePlugin):
>              part.has_fstab =3D os.path.exists(os.path.join(new_rootfs, "=
etc/fstab"))
>              if part.update_fstab_in_rootfs and part.has_fstab and not pa=
rt.no_fstab_update:
>                  fstab_path =3D os.path.join(new_rootfs, "etc/fstab")
> -                # Assume that fstab should always be owned by root with =
fixed permissions
> -                install_cmd =3D "install -m 0644 -p %s %s" % (part.updat=
ed_fstab_path, fstab_path)
> +                # We dont want any metadata of the updated fstab, just t=
he one that already existed
> +                install_cmd =3D "cp --no-preserve=3Dall %s %s" % (part.u=
pdated_fstab_path, fstab_path)

Now this is what makes the test fail. So I understand the switch from
install to cp, as it will reuse the same inode instead of creating a new
one. But this is also what causes the test regression.

When creating a filesystem image with a modified fstab, a copy of the
filesystem content is first made, so file modifications only affect this
specific image. But in order to gain time and disk space, this copy is
made using hardlinks: see use of copyhardlinktree() in
do_prepare_partition() from scripts/lib/wic/plugins/source/rootfs.py. So
as cp will keep the same inode, it means you will modify the content on
both the copy and the reference, and so all further generated image.

So I'm sorry, we will have to find another way to implement this change.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


