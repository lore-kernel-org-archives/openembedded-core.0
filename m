Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C1A3C531D0
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 05:25:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5141.1785389151903284484
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 22:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=dwJvLEL6;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6577F4E40FFE
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 05:25:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2AC175FFA8;
	Thu, 30 Jul 2026 05:25:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A792511C15671;
	Thu, 30 Jul 2026 07:25:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785389144; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EgarR6uHVYSMgKDQHyi/3xN+ZRf4JeZYPADaAhjvaZ8=;
	b=dwJvLEL6jtt/jzkE9XvfiEbxcfZrJVod+KegLwN2FbeGxVN3rDrGT+672PtQyekgn2cbaK
	vvLzf5KlLoBgeWfGm1NESWd87KhjgilCw1MNTIxll9kOGQ2cCTBhJAolAJ6pS3SVmwAQXP
	NCbwl93NkogpYlmrt2hzMjXaY4ZxuPNKKUB+JHDZ1oz4ajo5ZfMVH9AX4Uq265Zd/+Wkh3
	4EOhkxqA2obtGrxB5mtGAfTo6eLAsCn3G8wUHQsepEmFFck5S67qWn2m6+pSiUg1DP1kcl
	YzCbYGtHEtmfJU+cpNg4GyXYIm/qfMQ0/Fr/bkmDKvhqxkpYaq8SEYHif3PtuQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Jul 2026 07:25:42 +0200
Message-Id: <DKBNMP986EDB.QTHUA2SN0EI0@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 1/5] vcontainer-bbmask.inc: add
 python3-pexpect,-ptyprocess
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <tim.orling@konsulko.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260727000247.1623785-3-tim.orling@konsulko.com>
 <20260729213430.218008-2-tim.orling@konsulko.com>
In-Reply-To: <20260729213430.218008-2-tim.orling@konsulko.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 05:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242311

On Wed Jul 29, 2026 at 11:34 PM CEST, Tim Orling via lists.openembedded.org=
 wrote:
> From: Tim Orling <tim.orling@konsulko.com>
>
> For container-yocto-builder, the container is the "host" and so
> we need the "Build Host Packages" equivalent in [1]. When
> we are building with mc:container-aarch64,-x86-64 multiconfig
> and the vcontainer distro, we need python3-pexpect and its
> dependency python3-ptyprocess to fulfill
> packagegroup-yocto-builder-extras. Otherwise we see a build-time
> error like:
>
> ERROR: Nothing RPROVIDES 'python3-pexpect' (but mc:container-aarch64:
> .../meta-virtualization/recipes-core/packagegroups/packagegroup-yocto-bui=
lder.bb
> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'python3-pexpect' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-pexpect']
> ERROR: Required build target 'packagegroup-yocto-builder' has no buildabl=
e providers.
> Missing or unbuildable dependency chain was: ['packagegroup-yocto-builder=
', 'python3-pexpect']
>
> Remove the layer-wide meta-python BBMASK and allow these
> specific recipes.
>
> Once meta-python is allowed, there was an error for
> meta-oe/dynamic-layers/meta-python which we do not need for the
> above recipes. It can be enabled in the future when needed.
>
> [1] https://docs.yoctoproject.org/brief-yoctoprojectqs/index.html#build-h=
ost-packages
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  conf/distro/include/vcontainer-bbmask.inc | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/conf/distro/include/vcontainer-bbmask.inc b/conf/distro/incl=
ude/vcontainer-bbmask.inc
> index 0c9b8b02..572ebc4a 100644
> --- a/conf/distro/include/vcontainer-bbmask.inc
> +++ b/conf/distro/include/vcontainer-bbmask.inc
> @@ -94,6 +94,9 @@ BBMASK +=3D "meta-openstack/recipes-dbs/postgresql/"
>  BBMASK +=3D "meta-oe/dynamic-layers/networking-layer/recipes-core/"
>  BBMASK +=3D "meta-openstack/recipes-extended/libvirt/"
>  BBMASK +=3D "meta-webserver/recipes-(?!httpd/nginx)"
> +# To satisfy RDEPENDS for packagegroup-yocto-builder-extras in mc:contai=
ner-*
> +BBMASK +=3D "meta-python/recipes-devtools/python/python3-(?!pexpect|ptyp=
rocess)"
> +BBMASK +=3D "meta-oe/dynamic-layers/meta-python/recipes-core/packagegrou=
ps/"
> =20
>  # ----------------------------------------------------------------------=
-----
>  # Entire layers with 0 recipes in the container image dependency graph.
> @@ -101,7 +104,7 @@ BBMASK +=3D "meta-webserver/recipes-(?!httpd/nginx)"
>  # does not warn about zero files matching BBFILE_PATTERN.
>  # ----------------------------------------------------------------------=
-----
>  BBMASK +=3D "meta-filesystems/"
> -BBMASK +=3D "meta-python/"
> +
>  # Warning suppression for these fully-masked layers is in meta-virt-host=
.conf
>  # (BBFILE_PATTERN_IGNORE_EMPTY) because BitBake checks the base datastor=
e,
>  # not per-multiconfig datastores.

Hi Tim,

I believe this is a patch for meta-virtualization, right? And I believe
it's the same for the other patch?
[PATCH v2 5/5] docs: add container-yocto-builder.md

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


