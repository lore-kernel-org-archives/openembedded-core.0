Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB90BC5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 11:12:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16684.1786619548860417092
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 04:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=duffh1Zm;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 849A71A15D4;
	Thu, 13 Aug 2026 11:12:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 50A45602B8;
	Thu, 13 Aug 2026 11:12:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 32AF511C4DDD2;
	Thu, 13 Aug 2026 13:12:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786619545; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xrnB4a+Ur0BFa9GN+ycexcSNfEfrvBWCyNkko7Jagxw=;
	b=duffh1ZmeobgYhn+hhXUhnVg0bRnKgpPPCaHJFWNg4TpXW9H8Hzzb5fbsZuOQjeUzCL2vn
	mnNd1RN1Pu3SPCP5aQjeuN+GkGycjDyJnOl5dHWF8cZYH7mWVeqVz55ikEi3wY1w7Bs5Hi
	FGIaYe/8h6rqRgw5QGfNeYCasiD257YEQMVBh5CC1dqeLoRwAqDrgTPGhjhPhbN/5uEZpb
	ilDAdn4ngahHXOujFWNhNCf7gZrLMFzf98zdsc6XWpaK1hxDTdUPTm84ve4iZHbOg0ZxJf
	l6imMvxB0R2/efViiLFf7LXSWrYl6qBErEpY+cRCzzYqFzhwgeOt6uyhUa0FJw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Aug 2026 13:12:21 +0200
Message-Id: <DKNRRQM7Q3FN.34QV9VN15JGBS@bootlin.com>
Subject: Re: [PATCH v14 00/10] rpm: 4.20.1 -> 6.0.2
Cc: <alex.kanavin@gmail.com>, <mattware@cisco.com>, <esparlin@cisco.com>,
 <peter.marko@siemens.com>, <randy.macleod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Sumanth Gavini" <sumanth.gavini@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260812234900.866436-1-sumanth.gavini@windriver.com>
In-Reply-To: <20260812234900.866436-1-sumanth.gavini@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 11:12:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243348

On Thu Aug 13, 2026 at 1:48 AM CEST, Sumanth Gavini wrote:
> * V14:
>     - Dropped "rpm: filter /usr/bin/pkg-config from RPM auto-generated Re=
quires"
>     (pkgconfigdeps.sh patch). Per Ross Burton's review, instead of suppre=
ssing
>     the /usr/bin/pkg-config emission, added:
>       RPROVIDES:${PN} +=3D "pkgconfig /usr/bin/pkg-config"
>     to the pkgconf recipe so it satisfies the auto-generated Requires wit=
hout
>     modifying the upstream rpm script.
>
>    - Removed /usr/bin/pkg-config from nativesdk-sdk-provides-dummy.bb.
>      RPM 6's internal dependency generator auto-detects file-level Provid=
es
>      from installed files, so nativesdk-pkgconf already provides
>      /usr/bin/pkg-config via the wrapper script it installs. Keeping the
>      dummy entry caused a DNF conflict during do_populate_sdk:
>        nativesdk-sdk-provides-dummy conflicts with /usr/bin/pkg-config
>        provided by nativesdk-pkgconf
>
>    - Added "libarchive: Disable RPM filter auto-bidding" (0005 patch).
>      With both the RPM filter and RPM format reader registered, the filte=
r
>      intercepted RPM files first and failed to parse RPM 6 packages
>      (debuginfod scanning still failed after the 0004 patch). Disabling t=
he
>      filter's automatic bidding lets the format reader handle RPM files,
>      while archive_read_append_filter(ARCHIVE_FILTER_RPM) still works
>      explicitly, keeping test_read_append_rpm_filter passing.
>
>    - Updated 0004-Convert-RPM-reader-into-a-proper-format.patch to includ=
e
>      the test_read_format_huge_rpm.c changes from upstream PR #2846. This
>      test now correctly exercises the format reader instead of the filter=
.
> =20
>    - Updated patches 7,9 and 10 for the latest master changes; no code=20
>      changes; removed upstream modifications  =20
>
>    Tests verified:
>      - oe-selftest -r debuginfod.Debuginfod.test_debuginfod_qemu
>      - oe-selftest -r debuginfod.Debuginfod.test_debuginfod_native
>      - oe-selftest -r sdk.SDKTests.test_sdk_manifests
>      - oe-selftest -r sdk.SDKTests.test_sdk_runqemu
>      - bitbake core-image-ptest-libarchive:do_testimage
>      - bitbake core-image-sato -c populate_sdk
>      - bitbake core-image-sato-sdk:do_rootfs
>

Hi Sumanth,

We again have some pkgconfig errors. I suspect it's the same issue as
for the previous series: the generated recipe signatures are the same as
before, so we are re-using old data from the sstate-cache.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/4439
https://autobuilder.yoctoproject.org/valkyrie/#/builders/8/builds/4413

I also note a new failure:

Error:
 Problem 1: conflicting requests
  - nothing provides /usr/bin/pkg-config needed by acl-dev-2.4.0-r0.cortexa=
57 from oe-repo
 Problem 2: conflicting requests
  - nothing provides /usr/bin/pkg-config needed by eudev-dev-3.2.14-r0.cort=
exa57 from oe-repo
 Problem 3: conflicting requests
  - nothing provides /usr/bin/pkg-config needed by kmod-dev-34.2-r0.cortexa=
57 from oe-repo
 Problem 4: conflicting requests
  - nothing provides /usr/bin/pkg-config needed by libz-dev-1.3.2-r0.cortex=
a57 from oe-repo
 Problem 5: conflicting requests
  - nothing provides /usr/bin/pkg-config needed by openssl-dev-3.5.7-r0.cor=
texa57 from oe-repo
 Problem 6: conflicting requests
  - nothing provides /usr/bin/pkg-config needed by util-linux-dev-2.42.2-r0=
.cortexa57 from oe-repo
 Problem 7: conflicting requests
  - nothing provides /usr/bin/pkg-config needed by xz-dev-5.8.3-r0.cortexa5=
7 from oe-repo
(try to add '--skip-broken' to skip uninstallable packages or '--setopt=3Do=
ptional_metadata_types=3Dfilelists' to load additional filelists metadata)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/4371
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4269
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4286
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/942

As usual, the detailed configuration can be found in the "Write config"
step.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


