Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93BBACCD183
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 10:03:04 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.22106.1760868179937507289
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Oct 2025 03:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zgqAQ/1L;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D4F724E411A3
	for <openembedded-core@lists.openembedded.org>; Sun, 19 Oct 2025 10:02:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8EA21606D5;
	Sun, 19 Oct 2025 10:02:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29583102F238D;
	Sun, 19 Oct 2025 12:02:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760868173; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+r9QeDIfP9SRKgv1guGgg/SnxnklZxFQ2cW0Egsn1jk=;
	b=zgqAQ/1Lv6G4GKPPF9SkLm7sMMjAYTmt8ENFOplecXK0KI7IFpRRxDs0FLWyEl84uiRZiL
	le+OhRJwWstJHG6G7fQv9tJ/We236MQJnNJ6CtLxMx7qLu5or69ir4PWJUqqp6ZyzneYwW
	SYEBI2HMKUCG9OIsGMKweS4BajhysJfMAQoyX0lHX7P2pwTtSVkIPVofUFtp0Fh7w9xire
	j3xvr41EzAaLGzUB2xb9H5Oda8spJxVEZPPGnxPpuVfXsyK+lTB71aAgsCvoJtBXbqzxPv
	UdJN/HxUVwH5iM1gT0Vf7OKhylRjDroxcVS/1StmDNHN4azBnP3ahINTbgJYPw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Oct 2025 12:02:47 +0200
Message-Id: <DDM7O4JOPS0Y.1YQP1AS47WNL7@bootlin.com>
Subject: Re: [PATCH 1/1] Fstab: Fix xattrs not being maintained on fstab
 file when using wic fstab update funtionalities
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <dani.barra25@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <DDFITTM4J8SO.13FKL48ZAQCD0@bootlin.com>
 <20251017111210.501333-1-dani.barra25@gmail.com>
 <20251017111210.501333-2-dani.barra25@gmail.com>
In-Reply-To: <20251017111210.501333-2-dani.barra25@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Oct 2025 10:03:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225079

On Fri Oct 17, 2025 at 1:04 PM CEST, dani.barra25 wrote:
> From: Daniel Andrade <dani.barra25@gmail.com>
>
> The wic fstab generation capability was removing the xattrs of the /etc/f=
stab, possibly rendering the produced image unusable in some case (e.g.: SE=
Linux enforced on a read-only rootfs).
> The file appears as unlabeled no matter the fstype chosen.
> To bypass this, some late procedures done on ext* and msdos fstype have b=
een removed and all the fstab logic was passed to rootfs.py.
> On this one, the idea is to still use the install command, but in this ca=
se, executed outside the pseudo environment. After the file as sucessfully =
been place, the idea was to check again for inconsistencies
> in the database (now the fstab inode is different) and force it to rebuil=
d with the correct inode, ensure fstab inode is correctly set on all the ta=
bles, including the xattrs one.
>
> Signed-off-by: Daniel Andrade <dani.barra25@gmail.com>
> ---

Hi Daniel,

Thanks for the new version. It looks like this one is now breaking
wic.Wic.test_exclude_path and wic.Wic.test_include_path tests:

2025-10-19 07:55:18,010 - oe-selftest - INFO - wic.Wic.test_exclude_path (s=
ubunit.RemotedTestCase)
2025-10-19 07:55:18,011 - oe-selftest - INFO -  ... FAIL
...
AssertionError: Command 'wic create temp.wks -e core-image-minimal -o /srv/=
pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3133304/wic-tmp' r=
eturned non-zero exit status 1:
...
ERROR: _exec_cmd: export PATH=3D/srv/pokybuild/yocto-worker/oe-selftest-deb=
ian/build/build-st-3133304/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/reci=
pe-sysroot-native/sbin:/srv/pokybuild/yocto-worker/oe-selftest-debian/build=
/build-st-3133304/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroo=
t-native/usr/sbin:/srv/pokybuild/yocto-worker/oe-selftest-debian/build/buil=
d-st-3133304/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-nat=
ive/usr/bin:/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3=
133304/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/us=
r/bin/x86_64-poky-linux:/srv/pokybuild/yocto-worker/oe-selftest-debian/buil=
d/build-st-3133304/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysro=
ot-native/bin:/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st=
-3133304/tmp/hosttools:$PATH;export PSEUDO_PREFIX=3D/srv/pokybuild/yocto-wo=
rker/oe-selftest-debian/build/build-st-3133304/tmp/work/x86-64-v3-poky-linu=
x/wic-tools/1.0/recipe-sysroot-native/usr;export PSEUDO_LOCALSTATEDIR=3D/sr=
v/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3133304/wic-tmp/=
tmp.wic.dhlnwwia/pseudo1;export PSEUDO_PASSWD=3D/srv/pokybuild/yocto-worker=
/oe-selftest-debian/build/build-st-3133304/wic-tmp/tmp.wic.dhlnwwia/rootfs1=
;export PSEUDO_NOSYMLINKEXP=3D1;/srv/pokybuild/yocto-worker/oe-selftest-deb=
ian/build/build-st-3133304/tmp/sysroots-components/x86_64/pseudo-native/usr=
/bin/pseudo  -B  returned '1' instead of 0
output: PRAGMA journal_mode =3D OFF;: database is locked
PRAGMA synchronous =3D OFF;: database is locked
Failed: database is locked
Error getting 'logs.db' database.
PRAGMA journal_mode =3D OFF;: database is locked
PRAGMA synchronous =3D OFF;: database is locked
Failed: database is locked
Error getting 'files.db' database.
error during load from disk: database is locked
pdb_files: database error.
Couldn't start file list, can't scan.
db cleanup for server shutdown, 07:55:17.956
memory-to-file backup complete, 07:55:17.956.
db cleanup finished, 07:55:17.956
considering table files
considering table xattrs
considering table migrations

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2574

Can you have a look at these errors?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


