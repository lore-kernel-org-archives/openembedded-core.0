Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9AD0CCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 14:59:58 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.7919.1761749992588499633
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 07:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cxp28O6l;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E0D1C4E413C1
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 14:59:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF351606E8;
	Wed, 29 Oct 2025 14:59:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57156117F8220;
	Wed, 29 Oct 2025 15:59:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761749990; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1fLSjBlCMZ+mnEkgPdlz+2PVXpbdkaPe3ViXcGDRN34=;
	b=cxp28O6lHstRumac4XSu7QQXWrb/j2JnKlC32nzNUhmrYGTrl4IEEglRP7uAhOsZAxn/im
	j8xvzLV6vyASy94a/0CzRS4KPhgeojK9CrlFQ8cy5zlm/q8+bksE61/4vH6hKxvpSqE0D7
	6tdwC+b3iXx/1CGTkPEVxaDzikxpFgezEcggJi/esfHS7FgfbiJQc+pnUaVuTWPOY3NdMC
	KYFwkenXZ+26/QghkoOu0KB7oVYVZuV4EynSLHBCQogMTZjG4QPkCqGm/STuvgDeHP8FaP
	KP8UmLI8nRQQwmXYGRlsEBU7NIEno3TI77jCy5Mxwf334ELB/bNclr9LgaKasA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Oct 2025 15:59:48 +0100
Message-Id: <DDUW8ZKZCCUF.23O72DLLZBNAT@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/3] libconfig: import recipe from meta-oe
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <dmitry.baryshkov@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251029002918.3728797-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251029002918.3728797-1-dmitry.baryshkov@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 14:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225457

On Wed Oct 29, 2025 at 1:29 AM CET, Dmitry Baryshkov via lists.openembedded=
.org wrote:
> One of the freedreno tools in the Mesa package depends on libconfig.
> Recipes from other layers also depend on libconfig. It makes sense to
> move libconfig to OE-Core in order to reduce inter-layer dependencies.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Hi Dmitry,

Thanks for your patch.

Sadly, it looks like libconfig is failing the reproducibility test:

AssertionError: The following deb packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/libconfig++15_1.8.1-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/libconfig-dbg_1.8.1-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/libconfig-src_1.8.1-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/libconfig15_1.8.1-r0_amd64.deb

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2797
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20251029-xhw4aiy9/=
packages/diff-html/

Can you have a look at why the builds differ?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


