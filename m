Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22745E63F03
	for <webhook@archiver.kernel.org>; Sun, 15 Feb 2026 16:43:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1627.1771173831011829272
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Feb 2026 08:43:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XXLkNEzw;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 35F324E40DF3
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 16:43:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9035606CD;
	Sun, 15 Feb 2026 16:43:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8FE06102F1D19;
	Sun, 15 Feb 2026 17:43:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771173828; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DFwHET+VsuXvBjevtMcvWoUzHBqZ2xl9cLrQDwJvaN8=;
	b=XXLkNEzww8Li0t3g2/28w89VLuVKUNMtdIIjKNw6AC0bS3MmWLgNjPpYaZLLyFCIZpw9X8
	qLI4nV01+JKi7qwrDCoGSdTvDPIZk13weUtMqgVkAfHfBlPMrZRBAe8bnasvThsg3bUHHF
	J0soB1oGCiZAeVhG2Nk6jXrckqorVo72vT2K8D4yVPclHqzhss30aCtEZ6JGMyvZYxAjmH
	EK6SW7O4tkVgFBdeLcI/Z5foFb0nGVu6waLHNJ7hy10PCiHiIU8Ftz3G00E0i0WSnqyYDT
	HMbIgboZPTJXagoH+sFBbtnZi4eLLrfk1/dq/iAvDb4JWq9GMjWDR7n2RDj7Vw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Feb 2026 17:43:47 +0100
Message-Id: <DGFOPZGGFAZ6.ARG5LGAT1PG1@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 0/4] Disable OpenSSL and
 Python3-cryptography legacy features by default
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <colinmca242@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260211184917.1045939-1-colinmca242@gmail.com>
 <20260213230130.757732-1-colinmca242@gmail.com>
In-Reply-To: <20260213230130.757732-1-colinmca242@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 16:43:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231165

On Sat Feb 14, 2026 at 12:01 AM CET, Colin McAllister via lists.openembedde=
d.org wrote:
> TLS 1.0 and 1.1 have been deprecated by the IETF since 2021, and
> OpenSSL's legacy module contains deprecated and unmaintained components.
> This series disables legacy support by default in both OpenSSL and
> python3-cryptography, requiring users to explicitly opt-in if needed.
>
> The first two patches add packageconfig options to control legacy TLS
> protocol support and the legacy OpenSSL module. The final patch aligns
> python3-cryptography with the new OpenSSL defaults.
>
> Note that the TLS 1.0/1.1 changes replace the existing "no-tls1" and
> "no-tls1_1" packageconfig options with affirmative "tls1" and "tls1_1"
> options that are disabled by default. While less disruptive to enable
> the "no-*" options by default, using affirmative options provides
> consistency with the new "legacy" option and is clearer than having
> default-enabled "no-*" options.
>

Hi Colin,

Thanks for the new version.

I believe we have a new error:

ERROR: core-image-sato-1.0-r0 do_rootfs: Could not invoke dnf. Command '/sr=
v/pokybuild/yocto-worker/multilib/build/build/tmp/work/qemux86_64-poky-linu=
x/core-image-sato/1.0/recipe-sysroot-native/usr/bin/dnf -v --rpmverbosity=
=3Dinfo -y -c /srv/pokybuild/yocto-worker/multilib/build/build/tmp/work/qem=
ux86_64-poky-linux/core-image-sato/1.0/rootfs/etc/dnf/dnf.conf --setopt=3Dr=
eposdir=3D/srv/pokybuild/yocto-worker/multilib/build/build/tmp/work/qemux86=
_64-poky-linux/core-image-sato/1.0/rootfs/etc/yum.repos.d --installroot=3D/=
srv/pokybuild/yocto-worker/multilib/build/build/tmp/work/qemux86_64-poky-li=
nux/core-image-sato/1.0/rootfs --setopt=3Dlogdir=3D/srv/pokybuild/yocto-wor=
ker/multilib/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0=
/temp --repofrompath=3Doe-repo,/srv/pokybuild/yocto-worker/multilib/build/b=
uild/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/oe-rootfs-repo --no=
gpgcheck install dnf packagegroup-base-extended packagegroup-core-boot pack=
agegroup-core-ssh-dropbear packagegroup-core-x11-base packagegroup-core-x11=
-sato pango-module-basic-fc psplash rpm run-postinsts lib32-connman-gnome l=
ib32-pango-module-basic-fc locale-base-c locale-base-en-us locale-base-en-g=
b' returned 1:
...
Error: Transaction test error:
  file /etc/ssl/openssl.cnf conflicts between attempted installs of lib32-o=
penssl-conf-3.5.5-r0.x86 and openssl-conf-3.5.5-r0.x86_64_v3

https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/3170

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


