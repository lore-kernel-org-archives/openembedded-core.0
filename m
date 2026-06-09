Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C081ACD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 08:16:32 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74429.1780992978527819484
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 01:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EbFCtB4D;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B579FC4FED7
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Jun 2026 08:16:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A61A5FFC1;
	Tue,  9 Jun 2026 08:16:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D24A9106A2A9D;
	Tue,  9 Jun 2026 10:16:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780992975; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xwbV6Ef4aYX5N3iJYkeinIeZYyKkzlwVMp5ENrCeODY=;
	b=EbFCtB4DK0HBGBkwP6FIByI7hFJvSodpr52PH4MbX2MQnFTzWKyveAw0sh4DHFOS6SbBK8
	0dJ4MpUoyuKoAmtyKRRhKl1gUf1qY/cJUk8eypKzcyNe29rLGbDS1zFgJdUnCgeQZuAtOn
	ZVdaD4vMdPHOrTJCVnaDlZUFSPckqpJwoL7Mfy7ewUwVbgQ5Tqklgk77DUyc/xIW3hKntI
	sR9eg7s+N4jCBU9Sv0spcyhB2sMPi7Yrw9kx8BtZsGiQuVvlpRepmSxbZhXjgYYQNJhGH/
	SdDOnY8EhIW4O87u2Rq7xJyDIsK1llRrr/faGYi+XplwsQdU8PhuvAwEp4I6uQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 10:16:13 +0200
Message-Id: <DJ4DBGVTHOHE.3UWS9A74I2JNX@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <xiaozhan.li.cn@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] texinfo: add missing perl module runtime
 dependencies
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260608081230.1144463-1-Xiaozhan.Li.CN@windriver.com>
In-Reply-To: <20260608081230.1144463-1-Xiaozhan.Li.CN@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 08:16:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238273

On Mon Jun 8, 2026 at 10:12 AM CEST, Xiaozhan Li via lists.openembedded.org=
 wrote:
> Some makeinfo commands like makeinfo --version, makeinfo --html fail on t=
arget
> with errors like:Can't locate xxx.pm in @INC
> This is because texinfo's texi2any requires several core Perl modules
> that are split into separate packages in OE. Add the missing modules
> to RDEPENDS so they are pulled into the image automatically.
>
> Signed-off-by: Xiaozhan Li <Xiaozhan.Li.CN@windriver.com>
> ---

Hi,

Thanks for your patch.

It looks like this is breaking some builds on the autobuilder:

ERROR: buildtools-tarball-1.0-r0 do_populate_sdk: Could not invoke dnf. Com=
mand '/srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-na=
tivesdk-pokysdk-linux/buildtools-tarball/1.0/recipe-sysroot-native/usr/bin/=
dnf -v --rpmverbosity=3Dinfo -y -c /srv/pokybuild/yocto-worker/buildtools/b=
uild/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-tarball/1.0/s=
dk/image/etc/dnf/dnf.conf --setopt=3Dreposdir=3D/srv/pokybuild/yocto-worker=
/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-=
tarball/1.0/sdk/image/etc/yum.repos.d --installroot=3D/srv/pokybuild/yocto-=
worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/build=
tools-tarball/1.0/sdk/image --setopt=3Dlogdir=3D/srv/pokybuild/yocto-worker=
/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-=
tarball/1.0/temp --repofrompath=3Doe-repo,/srv/pokybuild/yocto-worker/build=
tools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-tarbal=
l/1.0/oe-sdk-repo --nogpgcheck install nativesdk-buildtools-perl-dummy nati=
vesdk-ca-certificates nativesdk-chrpath nativesdk-git nativesdk-git-perltoo=
ls nativesdk-libacl nativesdk-libnss-nis nativesdk-lz4 nativesdk-make nativ=
esdk-mtools nativesdk-ncurses-terminfo-base nativesdk-patch nativesdk-pigz =
nativesdk-python3 nativesdk-python3-git nativesdk-python3-jinja2 nativesdk-=
python3-pip nativesdk-python3-pyyaml nativesdk-python3-setuptools nativesdk=
-python3-subunit nativesdk-python3-testtools nativesdk-python3-websockets n=
ativesdk-rpcsvc-proto nativesdk-sdk-provides-dummy nativesdk-tar nativesdk-=
texinfo nativesdk-wget nativesdk-zstd' returned 1:
...
Error:
 Problem: package nativesdk-perl-module-locale-5.42.0-r0.x86_64_nativesdk f=
rom oe-repo requires nativesdk-perl-module-config, but none of the provider=
s can be installed
  - package nativesdk-texinfo-7.3-r0.x86_64_nativesdk from oe-repo requires=
 nativesdk-perl-module-locale, but none of the providers can be installed
  - package nativesdk-buildtools-perl-dummy-1.0-r0.buildtools_dummy_natives=
dk from oe-repo conflicts with nativesdk-perl provided by nativesdk-perl-5.=
42.0-r0.x86_64_nativesdk from oe-repo
  - package nativesdk-buildtools-perl-dummy-1.0-r0.buildtools_dummy_natives=
dk from oe-repo conflicts with nativesdk-perl-module-strict provided by nat=
ivesdk-perl-5.42.0-r0.x86_64_nativesdk from oe-repo
  - package nativesdk-buildtools-perl-dummy-1.0-r0.buildtools_dummy_natives=
dk from oe-repo conflicts with nativesdk-perl-module-warnings provided by n=
ativesdk-perl-5.42.0-r0.x86_64_nativesdk from oe-repo
  - package nativesdk-buildtools-perl-dummy-1.0-r0.buildtools_dummy_natives=
dk from oe-repo conflicts with nativesdk-perl-module-vars provided by nativ=
esdk-perl-5.42.0-r0.x86_64_nativesdk from oe-repo
  - package nativesdk-buildtools-perl-dummy-1.0-r0.buildtools_dummy_natives=
dk from oe-repo obsoletes nativesdk-perl provided by nativesdk-perl-5.42.0-=
r0.x86_64_nativesdk from oe-repo
  - conflicting requests
(try to add '--allowerasing' to command line to replace conflicting package=
s or '--skip-broken' to skip uninstallable packages)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/3912
https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/3896
https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/3866

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


