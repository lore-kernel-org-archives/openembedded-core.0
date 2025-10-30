Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB48CCF9F5
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 09:29:05 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.22151.1761816541212468830
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 02:29:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MMIlZgFU;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F23BAC0DAA7;
	Thu, 30 Oct 2025 09:28:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6612E6068C;
	Thu, 30 Oct 2025 09:28:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 64377102F2505;
	Thu, 30 Oct 2025 10:28:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761816538; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xv1p13v1UXt60R+a+2FcChnUvaHpULB1/w60gHBZKVk=;
	b=MMIlZgFUV6B3kqMrMnIna32t7DqxTduJFBPrOL84t9bMSO3+Fg7LuAAQLdePk3IpGpZs9o
	J+f2E0hz2dSathlHOvMUDRDJnP4w5AcyRiOPW2jvGY9bccGvZF7WYJI2NwbwfW7g7fcmR+
	lHhy8r6Q+uAbvNBT/0N4uYCOklP8NKJD6WoWfn3KyckllxbwUAVqn6UUC5CBNxPqtJKiEG
	2FcbCMdHP7qpsfrXTZiO3tFfwhZjXv7KrRzN9Y/SGiycYnV44ShGhwtAphEbUPQUVlFwX2
	Mky0aVv3kD50LiIuvQ6pdHkl2jmK7VfJjKXjncMJa92OzbMbAQmBpg5fZ9wZLQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Oct 2025 10:28:56 +0100
Message-Id: <DDVJU7K6KUXQ.19OJZEVXK2O0@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 1/2] libconfig: import recipe from meta-oe
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <dmitry.baryshkov@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251029233230.2522401-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251029233230.2522401-1-dmitry.baryshkov@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 09:29:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225486

On Thu Oct 30, 2025 at 12:32 AM CET, Dmitry Baryshkov via lists.openembedde=
d.org wrote:
> One of the freedreno tools in the Mesa package depends on libconfig.
> Recipes from other layers also depend on libconfig. It makes sense to
> move libconfig to OE-Core in order to reduce inter-layer dependencies.
>
> Changes between meta-oe and this recipe:
> - Upgraded to 1.8.1
> - Switched to UPSTREAM_CHECK_GITTAGREGEX
> - Switched from autotools-brokensep to autotools
> - Added a patch fixing reproducibility issues
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Hi Dmitry,

Thanks for the new version, but the reproducibility test still fails,
sorry. Same packages IIRC:

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

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2801
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20251030-hmneez8f/=
packages/diff-html/

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


