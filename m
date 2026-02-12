Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A02EDF04B
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 06:30:22 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40051.1770877819002181378
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 22:30:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=OeA28S5C;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 96243C23DA6
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 06:30:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 65974606CA;
	Thu, 12 Feb 2026 06:30:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8C1711971155;
	Thu, 12 Feb 2026 07:30:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770877815; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/U0yJJstkgo6bMzdtE/4xTM44EhnfH3fXGHKzumiCD8=;
	b=OeA28S5CQeWTBcZYCBXSHIccOz+lIRAtiImTXuL4nngijPn/6+6TzoTXRaucifMHhqkQ4m
	h9IlOyNjtE2k5CEVca4xUQmeG+ZYQVU3ryz7LYAn93dctg5Tt/sjos7eq5ipDU0m2OXy+0
	9Nwd2XGBk9FsFO3M8yM/hZJT5IjFJy+5xBPm0JCdELw1A+9cyh7TAUbhx506t4J0Go7W1F
	ILxZWJCqmd9OCBenTlFJ/LOC4dIctjOC1n6XbUqqe+Kj2ZMF1vvR0kIXSXo/9rbHNfdz9T
	85rKfqURN0lZHlrRqPl1FWNg1F+Agzegw1yrPQwrBCjLkTvk9kJQz4f6pp2FjQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Feb 2026 07:30:12 +0100
Message-Id: <DGCRSK0PMVJ1.8YL67O3XYVR7@bootlin.com>
Subject: Re: [OE-core] [PATCH v5 1/7] package_rpm.bbclass: Drop external
 dependency generator to support rpm 6
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <cover.1770779786.git.liezhi.yang@windriver.com>
 <c68679d7733198d00209107564aeba2d4fc7301e.1770779786.git.liezhi.yang@windriver.com>
In-Reply-To: <c68679d7733198d00209107564aeba2d4fc7301e.1770779786.git.liezhi.yang@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 06:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231012

On Wed Feb 11, 2026 at 4:20 AM CET, Robert Yang via lists.openembedded.org =
wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
>
> The rpm 6 doesn't support external dependency generator. Oe-core used it =
for
> per file dependency which was saved into pn.requires and pn.provides, but=
 that
> hasn't been used any more since 2012 (rev:
> be40f6d0bb80274366af00461112af65687a4de8), and there were no complains or
> updates in the past 13 years, so just drop it to support rpm 6.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---

Hi Robert,

I've got several build failures while picking this patch. Different
errors, but basically all about dependency issues, like:

ERROR: core-image-sato-1.0-r0 do_populate_sdk: Could not invoke dnf. Comman=
d '/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/genericx8=
6_64-poky-linux/core-image-sato/1.0/recipe-sysroot-native/usr/bin/dnf -v --=
rpmverbosity=3Dinfo -y -c /srv/pokybuild/yocto-worker/genericx86-64/build/b=
uild/tmp/work/genericx86_64-poky-linux/core-image-sato/1.0/sdk/image/etc/dn=
f/dnf.conf --setopt=3Dreposdir=3D/srv/pokybuild/yocto-worker/genericx86-64/=
build/build/tmp/work/genericx86_64-poky-linux/core-image-sato/1.0/sdk/image=
/etc/yum.repos.d --installroot=3D/srv/pokybuild/yocto-worker/genericx86-64/=
build/build/tmp/work/genericx86_64-poky-linux/core-image-sato/1.0/sdk/image=
 --setopt=3Dlogdir=3D/srv/pokybuild/yocto-worker/genericx86-64/build/build/=
tmp/work/genericx86_64-poky-linux/core-image-sato/1.0/temp --repofrompath=
=3Doe-repo,/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/g=
enericx86_64-poky-linux/core-image-sato/1.0/oe-sdk-repo --nogpgcheck instal=
l nativesdk-glib-2.0-utils nativesdk-intltool nativesdk-packagegroup-sdk-ho=
st packagegroup-cross-canadian-genericx86-64 packagegroup-go-cross-canadian=
-genericx86-64 packagegroup-rust-cross-canadian-genericx86-64' returned 1:
DNF version: 4.24.0
cachedir: /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/ge=
nericx86_64-poky-linux/core-image-sato/1.0/sdk/image/var/cache/dnf
Added oe-repo repo from /srv/pokybuild/yocto-worker/genericx86-64/build/bui=
ld/tmp/work/genericx86_64-poky-linux/core-image-sato/1.0/oe-sdk-repo
User-Agent: constructed: 'libdnf (Ubuntu 22.04; generic; Linux.x86_64)'
repo: using cache for: oe-repo
oe-repo: using metadata from Wed 11 Feb 2026 04:44:05 PM UTC.
--> Starting dependency resolution
--> Finished dependency resolution
Error:
 Problem: package nativesdk-wayland-dev-1.24.0-r0.x86_64_nativesdk from oe-=
repo requires /usr/bin/pkg-config, but none of the providers can be install=
ed
  - package nativesdk-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_nativesd=
k from oe-repo conflicts with /bin/sh provided by target-sdk-provides-dummy=
-1.0-r0.sdk_provides_dummy_target from oe-repo
  - package nativesdk-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_nativesd=
k from oe-repo conflicts with /usr/bin/env provided by target-sdk-provides-=
dummy-1.0-r0.sdk_provides_dummy_target from oe-repo
  - package nativesdk-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_nativesd=
k from oe-repo conflicts with /bin/bash provided by target-sdk-provides-dum=
my-1.0-r0.sdk_provides_dummy_target from oe-repo
  - package nativesdk-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_nativesd=
k from oe-repo conflicts with pkgconfig provided by target-sdk-provides-dum=
my-1.0-r0.sdk_provides_dummy_target from oe-repo
  - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target from=
 oe-repo conflicts with /bin/sh provided by nativesdk-sdk-provides-dummy-1.=
0-r0.sdk_provides_dummy_nativesdk from oe-repo
  - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target from=
 oe-repo conflicts with /usr/bin/env provided by nativesdk-sdk-provides-dum=
my-1.0-r0.sdk_provides_dummy_nativesdk from oe-repo
  - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target from=
 oe-repo conflicts with /bin/bash provided by nativesdk-sdk-provides-dummy-=
1.0-r0.sdk_provides_dummy_nativesdk from oe-repo
  - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target from=
 oe-repo conflicts with pkgconfig provided by nativesdk-sdk-provides-dummy-=
1.0-r0.sdk_provides_dummy_nativesdk from oe-repo
  - package nativesdk-packagegroup-sdk-host-1.0-r0.x86_64_nativesdk from oe=
-repo requires nativesdk-wayland-dev, but none of the providers can be inst=
alled
  - package nativesdk-packagegroup-sdk-host-1.0-r0.x86_64_nativesdk from oe=
-repo requires nativesdk-sdk-provides-dummy, but none of the providers can =
be installed
  - conflicting requests
(try to add '--allowerasing' to command line to replace conflicting package=
s or '--skip-broken' to skip uninstallable packages)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3175
https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/3165
https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/3191
https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/3134
...

Can you have a look at these?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


