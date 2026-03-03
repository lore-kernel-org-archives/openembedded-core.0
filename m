Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC34EDEBE9
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 19:11:53 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.590.1772565106932922457
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 11:11:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wBecuyLs;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 65046C40FB0
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 19:12:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7949E5FF29;
	Tue,  3 Mar 2026 19:11:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EAA26103694DA;
	Tue,  3 Mar 2026 20:11:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772565103; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oG8UZ27XS38lkEr6bZrChWo5E6HMYFg1CvsjZcDmSx4=;
	b=wBecuyLsJybJ4fdh3JakmlWJ37eiQPkmmhRNUCdfZgd+vB89W9Fo50AzplpXFE7YE6K4jy
	lp1YhSbW+ktojpk6v36v8QtuAmjGJ9WR2i8PeuIYd+XrFbCsEQllxzdTzZRZlP1j4AZwMJ
	opRd4NNjWv//jpr35MLNLTaCPYNTrUpIr3rVDXCqHOI32jCipBgnH8vS6Qxki3eNCoGSrr
	pQkyg+ogmigg43txeaSt1GD3kz0/cgUpIkveZn1j8tfoLGZJhJ9l6aVEDYVS4oeST1xZFw
	oV4wxPyBk3iMfB9VgH5O0qOJRcosHsTz4tgu/nJ66+5pEwy6D4Fsue36hL7t0g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 20:11:39 +0100
Message-Id: <DGTDVX11DXL7.3SS36BY5FSO6O@bootlin.com>
Subject: Re: [OE-core] [PATCH 14/19] python3-setuptools: upgrade 80.9.0 ->
 82.0.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <hongxu.jia@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
 <20260303065640.2541884-14-hongxu.jia@windriver.com>
In-Reply-To: <20260303065640.2541884-14-hongxu.jia@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 19:11:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232334

On Tue Mar 3, 2026 at 7:56 AM CET, hongxu via lists.openembedded.org wrote:
> History v82.0.0 [1]:
>
> Deprecations and Removals
> - pkg_resources has been removed from Setuptools. Most common uses of pkg=
_resources have
>   been superseded by the importlib.resources and importlib.metadata proje=
cts. Projects
>   and environments relying on pkg_resources for namespace packages or oth=
er behavior
>   should depend on older versions of setuptools. (#3085)
>
> [1] https://setuptools.pypa.io/en/stable/history.html#v82-0-0
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---

Hi Hongxu,

Thanks for the upgrade.

We get some fails on the autobuilder, that are probably related to this
change. Error message is not always the same, but it refers either to
setuptools or pkg-resources.

ERROR: buildtools-tarball-1.0-r0 do_populate_sdk: Could not invoke dnf.
...
--> Starting dependency resolution
--> Finished dependency resolution
Error:
 Problem 1: conflicting requests
  - nothing provides nativesdk-python3-pkg-resources needed by nativesdk-py=
thon3-setuptools-82.0.0-r0.x86_64_nativesdk from oe-repo
 Problem 2: package nativesdk-python3-pip-26.0.1-r0.x86_64_nativesdk from o=
e-repo requires nativesdk-python3-setuptools, but none of the providers can=
 be installed
  - conflicting requests
  - nothing provides nativesdk-python3-pkg-resources needed by nativesdk-py=
thon3-setuptools-82.0.0-r0.x86_64_nativesdk from oe-repo
(try to add '--skip-broken' to skip uninstallable packages)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/99/builds/3270
https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/3264

ERROR: core-image-sato-1.0-r0 do_populate_sdk: Could not invoke dnf.
...
--> Starting dependency resolution
--> Finished dependency resolution
Error:
 Problem: package nativesdk-packagegroup-sdk-host-1.0-r0.x86_64_nativesdk f=
rom oe-repo requires nativesdk-meson, but none of the providers can be inst=
alled
  - conflicting requests
  - nothing provides nativesdk-python3-pkg-resources needed by nativesdk-me=
son-1.10.1-r0.x86_64_nativesdk from oe-repo
(try to add '--skip-broken' to skip uninstallable packages)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3299
https://autobuilder.yoctoproject.org/valkyrie/#/builders/8/builds/3314
https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/3302

Can you have a look at these please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


