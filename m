Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E447BD5CCB7
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 10:10:54 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19149.1765879848740537507
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 02:10:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ri1a5yHG;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D3BEB1A221F
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 10:10:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA58F6071C;
	Tue, 16 Dec 2025 10:10:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0495B11941534;
	Tue, 16 Dec 2025 11:10:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765879843; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xZE+Fv6Iu00iYR+4bTZUdtkTzSu0ku3gWYAtf1odY3A=;
	b=ri1a5yHGakrdMsX/XGdQ/cwC4uvY93lXkmcnbledwlpGgx+BDhBp0VqGcBe7e/0sEm6Y2W
	yoZiDMrWmM3Mminjory1v7BOFHhrDN+hHAhUorZHRvb8HwlrZPXi6QMzWmSOsXf7G7168s
	RHDhZLkPduU3OvHcplYb5cBP/Ii+PG4QhlxDkTOEYSs6aMsO2CzQ5GqpBnQWmF+VA6I/1M
	tXrw31p7QY0Xuu7yCmDfCgFP4XoFgziLxYvcdrDZy2BOInKFgoOP71Nu2/7uzefiQR0vBn
	TKeqzRXmdFN2VazPtAHQKiBNV7fpJfm8qfBhSQcAx7xGSdZrompIOCf42z2I4A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 11:10:42 +0100
Message-Id: <DEZK5SD4CU8M.10ZXMYU1CURDJ@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adam.duskett@amarulasolutions.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 1/7] signing-keys.bb: Fix DISTRO_CODENAME
 truncation
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251215102041.1630567-1-adam.duskett@amarulasolutions.com>
In-Reply-To: <20251215102041.1630567-1-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 10:10:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227941

On Mon Dec 15, 2025 at 11:20 AM CET, Adam Duskett via lists.openembedded.or=
g wrote:
> If DISTRO_CODENAME is not set in the environment, bash quietly
> drops the string resulting in a key such as PACKAGEFEED-GPG-KEY-defaultse=
tup-
>
> However, when python calls self.d.getVar('DISTRO_CODENAME'), the resultin=
g
> string is 'None', leading to a configuration file pointing to a key such
> as PACKAGEFEED-GPG-KEY-defaultsetup-None
>
> Add a default value in signing-keys.bb to set DISTRO_CODENAME to None if
> DISTRO_CODENAME is not set.
>
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---

Hi Adam,

It looks better overall, but we have a QA issue about some files not
shipped:

ERROR: dnf-5.3.0.0-r0 do_package: QA Issue: dnf: Files/directories were ins=
talled but not shipped in any package:
  /usr/lib
  /usr/lib/systemd
  /usr/lib/systemd/system
  /usr/lib/systemd/system/dnf5-makecache.timer
  /usr/lib/systemd/system/dnf5-makecache.service
Please set FILES such that these items are packaged. Alternatively if they =
are unneeded, avoid installing them or delete them within do_install.
dnf: 5 installed and not shipped files. [installed-vs-shipped]
ERROR: dnf-5.3.0.0-r0 do_package: Fatal QA errors were found, failing task.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/2845
https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/2863

Also, it looks like it is generating some errors and some warnings on
do_rootfs:

WARNING: core-image-ptest-libgcrypt-1.0-r0 do_rootfs: [log_check] core-imag=
e-ptest-libgcrypt: found 1 warning message in the logfile:
[log_check] Warning: skipped OpenPGP checks for 57 packages from repository=
: oe-repo

WARNING: core-image-ptest-openssl-1.0-r0 do_rootfs: [log_check] core-image-=
ptest-openssl: found 1 warning message in the logfile:
[log_check] Warning: skipped OpenPGP checks for 865 packages from repositor=
y: oe-repo

ERROR: core-image-ptest-openssl-1.0-r0 do_rootfs: [log_check] core-image-pt=
est-openssl: found 1 error message in the logfile:
[log_check] [642/865] perl-module-test2-plugin-exit 100% |   7.7 MiB/s |   =
7.9 KiB |  00m00s
...
ERROR: core-image-ptest-coreutils-1.0-r0 do_rootfs: [log_check] core-image-=
ptest-coreutils: found 1 error message in the logfile:
[log_check] [649/879] perl-module-test2-plugin-exit 100% |   0.0   B/s |   =
7.9 KiB |  00m00s
...
ERROR: core-image-ptest-libtest-warnings-perl-1.0-r0 do_rootfs: [log_check]=
 core-image-ptest-libtest-warnings-perl: found 1 error message in the logfi=
le:
[log_check] [631/860] perl-module-test2-plugin-exit 100% |   0.0   B/s |   =
7.9 KiB |  00m00s
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2710
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2754
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/837

https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/2886
https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/builds/2935

Can you have a look at these issues?

Thanks,
Mathieu


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


