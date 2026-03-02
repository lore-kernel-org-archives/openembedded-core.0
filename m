Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AFB3E9B361
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 10:47:14 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157857.1772448430003813731
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 02:47:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Y+p6OK/v;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CA0C8C40F8F
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Mar 2026 10:47:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96FF05FE89;
	Mon,  2 Mar 2026 10:47:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 93A551036954F;
	Mon,  2 Mar 2026 11:47:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772448427; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AP9qWyaeFiAVhAUFnrN0dfSXoxLYpBPYjEVufQiB6aI=;
	b=Y+p6OK/vS3GPrzdkmSeQG63tMRdJccX8saABgNxwGkYYDqWA2rwjwNyVuZYRLTlMOEteFQ
	hGoOe08z7wO4XJXDoZ8UTJrZJaGPaPCzNSKMjqo0zLc4vx3UGSockfjbnWGgdKzJhzyJQn
	YkK/LDx7wKQ3cnMp2DDysCUCoKD8Lm0KQhURTanI6qSq7jtcWWrFGCl47iy9Qhh5mKYRTB
	FYtHGqLuUAtUVm0lJpUh0/M+QLoP+YAub4VOQCFJlFt3itejkPKEWXsOgm693OzWIY/+8a
	mLS84/pndhAijQepHPCdYapErmsjp8GRTYtZUTkQkswFLOh7meHYmT9iHgAYxQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 11:47:01 +0100
Message-Id: <DGS8J02PNADH.2U02U35MT9Z9C@bootlin.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v7 0/7] rpm: 4.20.1 -> 6.0.1
Cc: <alex.kanavin@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <cover.1772367692.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1772367692.git.liezhi.yang@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 10:47:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232193

On Sun Mar 1, 2026 at 1:25 PM CET, liezhi.yang wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
>
> * V7:
>   - Add 0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch:
>     To fix "bitbake core-image-sato -cpopulate_sdk" error on Ubuntu 24.04=
 when
>     pkg-config is installed on host, now the host contamination has been =
fixed,
>     and the patch has been submitted to upstream:
>     https://github.com/rpm-software-management/rpm/pull/4127
>
> * V6
>   - Fix -cpopulate_sdk error when DISTRO =3D "poky"
>
> * V5
>   - Fix RP's comments: Don't hardcode libc6 into package_rpm.bbclass
>   - Use SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} to fix the loop dependencie=
s
>     between /bin/sh and libc.so.=20
>
> * V4
>   - Fix loop dependencies issues for libc6 and busybox
>   - Fix issues for can't find pkg-config files (.pc) on qemux86-64.
>
> * V3
>   - Fix Alexender's comments
>     a) Suppot rpm 6
>     b) Move rpm-setup-autosign to rpm-build
>     c) Remove -DLIBELF_FOUND=3DFalse
>
>   - Fix build for nativesdk-rpm
>
>   - Drop patch for createrepo-c since it has been upgraded (rev:
>     804a238c8a4e86c2bcfb2192d54cb861d5fd32a6)
>
> * V1 & V2
>   - Initial version
>

Hi Robert,

Thanks for the new version, but it looks like we still have some kind of
issue.

ERROR: core-image-sato-1.0-r0 do_populate_sdk: Could not invoke dnf. Comman=
d '/srv/pokybuild/yocto-worker/genericx86/build/build/tmp/work/genericx86-p=
oky-linux/core-image-sato/1.0/recipe-sysroot-native/usr/bin/dnf -v --rpmver=
bosity=3Dinfo -y ...
...
--> Starting dependency resolution
--> Finished dependency resolution
Error:
 Problem 1: conflicting requests
  - nothing provides pkgconfig(gtk+-3.0) needed by libfm-dev-1.3.2-r0.core2=
_32 from oe-repo
 Problem 2: conflicting requests
  - nothing provides pkgconfig(cairo) >=3D 1.10.0 needed by libharfbuzz-dev=
-12.3.2-r0.core2_32 from oe-repo
 Problem 3: conflicting requests
  - nothing provides pkgconfig(cairo) >=3D 1.18.0 needed by librsvg-2-dev-2=
.61.3-r0.core2_32 from oe-repo
  - nothing provides pkgconfig(cairo-gobject) >=3D 1.18.0 needed by librsvg=
-2-dev-2.61.3-r0.core2_32 from oe-repo
  - nothing provides pkgconfig(cairo-png) >=3D 1.18.0 needed by librsvg-2-d=
ev-2.61.3-r0.core2_32 from oe-repo
  - nothing provides pkgconfig(pangocairo) >=3D 1.50.0 needed by librsvg-2-=
dev-2.61.3-r0.core2_32 from oe-repo
  - nothing provides pkgconfig(pangoft2) >=3D 1.50.0 needed by librsvg-2-de=
v-2.61.3-r0.core2_32 from oe-repo
 Problem 4: conflicting requests
  - nothing provides pkgconfig(gtk+-3.0) needed by matchbox-panel-2-dev-2.1=
2-r0.core2_32 from oe-repo
 Problem 5: conflicting requests
  - nothing provides pkgconfig(cairo) >=3D 1.0 needed by vte-dev-0.82.2-r0.=
core2_32 from oe-repo
  - nothing provides pkgconfig(pango) >=3D 1.22.0 needed by vte-dev-0.82.2-=
r0.core2_32 from oe-repo
  - nothing provides pkgconfig(gtk+-3.0) >=3D 3.24.0 needed by vte-dev-0.82=
.2-r0.core2_32 from oe-repo
 Problem 6: package pango-dev-1.57.0-r0.core2_32 from oe-repo requires harf=
buzz-dev, but none of the providers can be installed
  - conflicting requests
  - nothing provides pkgconfig(cairo) >=3D 1.10.0 needed by libharfbuzz-dev=
-12.3.2-r0.core2_32 from oe-repo
 Problem 7: package gtk+3-dev-3.24.51-r0.core2_32 from oe-repo requires pan=
go-dev, but none of the providers can be installed
  - package pango-dev-1.57.0-r0.core2_32 from oe-repo requires harfbuzz-dev=
, but none of the providers can be installed
  - conflicting requests
  - nothing provides pkgconfig(cairo) >=3D 1.10.0 needed by libharfbuzz-dev=
-12.3.2-r0.core2_32 from oe-repo
(try to add '--skip-broken' to skip uninstallable packages)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/3281
https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/3277

ERROR: build-appliance-image-15.0.0-r0 do_rootfs: Could not invoke dnf. Com=
mand '/srv/pokybuild/yocto-worker/build-appliance/build/build/tmp/work/qemu=
x86_64-poky-linux/build-appliance-image/15.0.0/recipe-sysroot-native/usr/bi=
n/dnf -v --rpmverbosity=3Dinfo -y -c /srv/pokybuild/yocto-worker/build-appl=
iance/build/build/tmp/work/qemux86_64-poky-linux/build-appliance-image/15.0=
.0/rootfs/etc/dnf/dnf.conf --setopt=3Dreposdir=3D/srv/pokybuild/yocto-worke=
r/build-appliance/build/build/tmp/work/qemux86_64-poky-linux/build-applianc=
e-image/15.0.0/rootfs/etc/yum.repos.d --installroot=3D/srv/pokybuild/yocto-=
worker/build-appliance/build/build/tmp/work/qemux86_64-poky-linux/build-app=
liance-image/15.0.0/rootfs --setopt=3Dlogdir=3D/srv/pokybuild/yocto-worker/=
build-appliance/build/build/tmp/work/qemux86_64-poky-linux/build-appliance-=
image/15.0.0/temp --repofrompath=3Doe-repo,/srv/pokybuild/yocto-worker/buil=
d-appliance/build/build/tmp/work/qemux86_64-poky-linux/build-appliance-imag=
e/15.0.0/oe-rootfs-repo --nogpgcheck install connman connman-plugin-etherne=
t dhcpcd dnf kernel-dev kernel-devsrc packagegroup-core-boot packagegroup-c=
ore-ssh-openssh packagegroup-core-x11-base packagegroup-self-hosted perl-mi=
sc psplash python3-pip rpm run-postinsts tzdata locale-base-c locale-base-e=
n-us locale-base-en-gb' returned 1:
...
--> Starting dependency resolution
--> Finished dependency resolution
Error:
 Problem: package packagegroup-self-hosted-graphics-1.0-r0.x86_64_v3 from o=
e-repo requires libgl-dev, but none of the providers can be installed
  - package packagegroup-self-hosted-1.0-r0.x86_64_v3 from oe-repo requires=
 packagegroup-self-hosted-graphics, but none of the providers can be instal=
led
  - package libgl-mesa-dev-2:26.0.1-r0.x86_64_v3 from oe-repo requires libd=
rm-dev, but none of the providers can be installed
  - package libgl-mesa-dev-2:26.0.1-r0.x86_64_v3 from oe-repo requires pkgc=
onfig(libdrm) >=3D 2.4.75, but none of the providers can be installed
  - conflicting requests
  - nothing provides pkgconfig(pciaccess) >=3D 0.10 needed by libdrm-dev-2.=
4.131-r0.x86_64_v3 from oe-repo
(try to add '--skip-broken' to skip uninstallable packages)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/78/builds/3303

Can you have a look at these?
Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


