Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B908FC61DC2
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 12:06:44 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34557.1787832399048871542
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 05:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=pNhfwXFM;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E5BC71A185F;
	Thu, 27 Aug 2026 12:06:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD8F8602B8;
	Thu, 27 Aug 2026 12:06:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD21A11C7801A;
	Thu, 27 Aug 2026 14:06:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787832391; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HDpqTB/UBWWnMgJ2nNTUSafkfa4Fjf9R94F+1w8+RNc=;
	b=pNhfwXFMwgKve8O2AdkE3r3MvY0SOnN8JMfz6ucuAhGVled/jPLy/Nsdupfs1bYu47NfrG
	lpCgth1Tj6eoeD4aWx++CVvEwmAVMy3U2AcC4QNSx6GLolgGLhbi+9NEjVRguObsBuY9ff
	rCOc6iPnV1Y1R2j03qZ4NTzSZ+1O5G7btUHNKg5tNwoF3Y6OCSz95H2ud+4U600VZTSaIU
	4a/0+imWW3ya9t4tvO6cfBV65d39UXkeE6jQsetec2c73tChcI7gYwJDMCg2atCrQkCAse
	YzrC8y9BC3JnE75XJ2j1Ua1KA3xD3Rykq6btmc6MWV9vFBNrx9DxnAQkaeB//g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 14:06:26 +0200
Message-Id: <DKZPOS2ZANNR.2AZTW1QIJ8MJB@bootlin.com>
Subject: Re: [PATCH v18 00/16] rpm: 4.20.1 -> 6.0.2
Cc: <alex.kanavin@gmail.com>, <mattware@cisco.com>, <esparlin@cisco.com>,
 <peter.marko@siemens.com>, <randy.macleod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Sumanth Gavini" <sumanth.gavini@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
In-Reply-To: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 12:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244482

On Wed Aug 26, 2026 at 11:45 PM CEST, Sumanth Gavini wrote:
> * V18:
>     - patch 01-09: unchanged from v17.
>     - patch 10: split into two patches based on richard comments.
>     - patch 11-14: no code changes; patch numbering updated to 12-15.
>     - Added "package_rpm.bbclass: filter pkgconfig() deps regardless of
>       generator state" (0016 patch). Fixes the reproducibility failure
>       Mathieu reported on v17 (pkgconfig() Provides/Requires differing
>       between reproducibleA/reproducibleB-extended on hicolor-icon-theme-=
dev
>       and others). __pkgconfig_provides/__pkgconfig_requires %{nil}
>       don't reliably suppress RPM 6's generator; adds
>        __requires_exclude/__provides_exclude as an unconditional filter. =
=20
>

Hi Sumanth,

Thanks for the new version.

We still have a reproducibility issue, I believe it's the same as for
the previous version:

2026-08-27 09:37:58,061 - oe-selftest - INFO - Traceback (most recent call =
last):
  File "/srv/pokybuild/yocto-worker/reproducible/build/layers/openembedded-=
core/meta/lib/oeqa/selftest/cases/reproducible.py", line 407, in test_repro=
ducible_builds
    self.fail('\n'.join(fails))
    ~~~~~~~~~^^^^^^^^^^^^^^^^^^
AssertionError: The following rpm packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./noarch/hicolor-icon-theme-dev-0.18-r0.noarch.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./noarch/iso-codes-dev-4.20.1-r0.noarch.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./noarch/wayland-protocols-dev-1.49-r0.noarch.rpm

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4828
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260827-qol4ae7a/=
packages/diff-html/

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


