Return-Path: <andreas.muetzel@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E48C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 07:18:06 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.168234.1783408683257620617
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 00:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emlix.com header.s=20250930 header.b=A/uplWFA;
 dkim=pass header.i=@emlix.com header.s=20250930 header.b=A/uplWFA;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: andreas.muetzel@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1783408680;
	bh=PodapMtD+A/33xupd72ynXSy0jBZFCyulL58gJlxGIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A/uplWFAhWd0az2rodF0xu510hrratH8IEU1SGdrq1WnadCoc0PCjiRJKF/NGYuaz
	 njQEka0GTFVl7X/U1fStCgPnqZHzSgJ6OnplDaGwV4ImBABu14uJw3tebOyyRdDtm1
	 e040tve6FWf+H5SahA1MM7oVy5C6IW7480D4OTsPg+aTkn2AlEMWLI6vPUfm9hceIT
	 ce85Cq3/tq3+Cr8iQ6ICTZKAzOMkUr+aPW+pPhUDOSfFdVrw9lhhwdZLqeTITks6Gw
	 47ryU1YB0k5dR64XkVegnAQy/h3pMSHavJ+Ji/+AmQroGuLs1gv/08kQtychdbMMOI
	 iZoiODixRZUGQ==
Received: from mx1.emlix.com (localhost [127.0.0.1])
	by mx1.emlix.com (Postfix) with ESMTP id AADD95F7EA
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jul 2026 09:18:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1783408680;
	bh=PodapMtD+A/33xupd72ynXSy0jBZFCyulL58gJlxGIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A/uplWFAhWd0az2rodF0xu510hrratH8IEU1SGdrq1WnadCoc0PCjiRJKF/NGYuaz
	 njQEka0GTFVl7X/U1fStCgPnqZHzSgJ6OnplDaGwV4ImBABu14uJw3tebOyyRdDtm1
	 e040tve6FWf+H5SahA1MM7oVy5C6IW7480D4OTsPg+aTkn2AlEMWLI6vPUfm9hceIT
	 ce85Cq3/tq3+Cr8iQ6ICTZKAzOMkUr+aPW+pPhUDOSfFdVrw9lhhwdZLqeTITks6Gw
	 47ryU1YB0k5dR64XkVegnAQy/h3pMSHavJ+Ji/+AmQroGuLs1gv/08kQtychdbMMOI
	 iZoiODixRZUGQ==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 920C95F7AD
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jul 2026 09:18:00 +0200 (CEST)
From: Andreas =?UTF-8?B?TcO8dHplbA==?= <andreas.muetzel@emlix.com>
To: openembedded-core@lists.openembedded.org
Cc: andreas.muetzel@emlix.com
Subject: 
 Re: [OE-core] [PATCH] cml1: use KCONFIG_CONFIG_ROOTDIR in savedefconfig
Date: Tue, 07 Jul 2026 09:18:00 +0200
Message-ID: <HfyZSZHVQWmzWbpfFk-PaA@emlix.com>
In-Reply-To: <18BFEF9C90F3D1A4.1336494@lists.openembedded.org>
References: <18BFEF9C90F3D1A4.1336494@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 07:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240362

On Tuesday, 7 July 2026 08:56:31 CEST Andreas M=C3=BCtzel via lists.openemb=
edded.org wrote:
> For example, in U-Boot with the new configuration flow from wrynose and
> configs defined using the UBOOT_CONFIG_* variables, the project sources
> and configs will be located in a subdirectory of ${B}. This will result
> in the following error when running do_savedefconfig:
> make: *** No rule to make target 'savedefconfig'.  Stop.

Sorry, I missed one part in the description: This only fixes it for the cas=
e of one single UBOOT_CONFIG
being built. When UBOOT_CONFIG contains multiple active entries, uboot-conf=
ig.bbclass will not
set KCONFIG_CONFIG_ROOTDIR (and also set KCONFIG_CONFIG_ENABLE_MENUCONFIG t=
o false).

But in those cases, do_showconfig is broken as well. It will show ${B}/.con=
fig as the config path,
but that path does not exist and the real configs will be in ${B}/<config>/=
=2Econfig.

So I'm not sure whether my patch should be applied - it fixes the task for =
one case and does not
break any others that I tested (e.g. the kernel), but some problems remain =
in the "interactive" tasks
of the config handling.

Best regards,
Andreas

=2D-=20
emlix GmbH
Headquarters: Berliner Str. 12, 37073 G=C3=B6ttingen, Germany
Phone +49 (0)551 30664-0, e-mail info@emlix.com
District Court of G=C3=B6ttingen, Registry Number HR B 3160
Managing Directors: Heike Jordan, Dr. Uwe Kracke
VAT ID No. DE 205 198 055
Office Berlin: Panoramastr. 1, 10178 Berlin, Germany
Office Bonn: Bachstr. 6, 53115 Bonn, Germany
Office M=C3=BCnchen: Am Knie 16, 81241 M=C3=BCnchen, Germany
http://www.emlix.com

emlix - your embedded Linux partner



