Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76758CAC5AC
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 07:07:29 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.11764.1758870439572815821
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 00:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=scDvYczd;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 16205C003F8
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 07:07:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69568606B5;
	Fri, 26 Sep 2025 07:07:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1E45E102F1866;
	Fri, 26 Sep 2025 09:07:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758870437; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Bm4He4Jc81XM+FCAQ6XQUln9ok1MPBnjyEbNyf6lBYU=;
	b=scDvYczdVJ+CiX6uZXaV3SYXHt4KVancsE4L7RAfIn5rVTb+1LPg788ZyhV+7ji6cDpudc
	gXaFqK5E2xOYil7WTWMiTtx+OXOaADcUXX+fdHrJqlvffdxDjULJ0Sgbu0KMlRv+ar9Dsx
	W2UZXy/QC8RuT1rphtwYf1c8xfreqzuniODT1kur03HYp8enPovclUY4vXZjwW4yaUkoac
	M/ovDL8lrkHsg4yD0NxWV23UaQe1nTCX1YBuD1uhsPM0z81/vyVCr86dQl30RekyaFRiGE
	dDuWNySxGXby1kzTEn11QV21XsqnPBKaWiMaHBGOz2LY29qEm8XU56vz2HPEig==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Sep 2025 09:07:14 +0200
Message-Id: <DD2JJ724R1PO.1U4C3FCFCKWPM@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 0/1] wic: extra partition plugin
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <pierre-loup.gosse@smile.fr>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250925072203.3490596-1-pierre-loup.gosse@smile.fr>
In-Reply-To: <20250925072203.3490596-1-pierre-loup.gosse@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 07:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224054

On Thu Sep 25, 2025 at 9:22 AM CEST, Pierre-loup GOSSE via lists.openembedd=
ed.org wrote:
> From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
>
> Some files are not part of the root filesystem and must be installed in a
> separate partition. This is already handled for boot files by the
> bootimg_partition plugin and its IMAGE_BOOT_FILES BitBake variable.
>
> This patch introduces a similar approach for generic "extra" files. A new
> extra_partition plugin is added, which populates a partition with files
> listed in the new IMAGE_EXTRA_FILES BitBake variable. Like the
> bootimg_partition plugin, files should be deployed to the DEPLOY_DIR_IMAG=
E
> directory.
>
> The plugin supports:
>  - Glob pattern matching for file selection.
>  - File renaming.
>  - Suffixes to specify the target partition (by label, UUID, or partname)=
,
>    enabling multiple extra partitions to coexist, similar to the
>    bootimg_partition plugin.
>
> For example, with the following (simplified) wks file:
>   part / --source extra_partition --fstype=3Dext4 --label foo --size 5M
>   part / --source extra_partition --fstype=3Dext4 --uuid e7d0824e-cda3-4b=
ed-9f54-9ef5312d105d --size 5M
>   part / --source extra_partition --fstype=3Dext4 --label bar --size 5M
>
> And this configuration:
>   IMAGE_EXTRA_FILES_label-foo =3D "bar.conf;foo.conf"
>   IMAGE_EXTRA_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d =3D "bar.co=
nf;foobar.conf"
>   IMAGE_EXTRA_FILES =3D "foo/*"
>   WICVARS:append =3D "\
>       IMAGE_EXTRA_FILES_label-foo \
>       IMAGE_EXTRA_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d \
>   "
>
> The file bar.conf is installed as foo.conf in the first partition, as
> foobar.conf in the second partition, and the last partition installs all
> files from the foo directory.
>
> Pierre-Loup GOSSE (1):
>   wic: extra partition plugin
>
>  meta/classes-recipe/image_types_wic.bbclass   |   1 +
>  meta/lib/oeqa/selftest/cases/wic.py           |  41 ++++++
>  .../lib/wic/plugins/source/extra_partition.py | 134 ++++++++++++++++++
>  3 files changed, 176 insertions(+)
>  create mode 100644 scripts/lib/wic/plugins/source/extra_partition.py

Hi Pierre-Loup,

Thanks for your patch.

It looks like this is breaking the wic.Wic2.test_image_env selftest:

2025-09-25 18:08:01,857 - oe-selftest - INFO - 9: 80/93 623/638 (54.59s) (0=
 failed) (wic.Wic2.test_image_env)
2025-09-25 18:08:01,858 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/selftest/cases/wic.py", line 1030, in test_image_env
    self.assertTrue(var in content, "%s is not in .env file" % var)
    ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/unittest/case.py", line 744, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true : IMAGE_EXTRA_FILES is not in .env file
...
2025-09-25 18:18:17,328 - oe-selftest - INFO - RESULTS - wic.Wic2.test_imag=
e_env: FAILED (54.59s)

Can you make sure the test passes?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


