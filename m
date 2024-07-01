Return-Path: <primoz.fiser@norik.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483D9C3065A
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 05:56:02 +0000 (UTC)
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
 by mx.groups.io with SMTP id smtpd.web11.13301.1719813356393151459
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 22:55:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@norik.com header.s=default header.b=psoVX9wO;
 spf=pass (domain: norik.com, ip: 46.19.9.99, mailfrom: primoz.fiser@norik.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=9dEmEO6t7zeTh3S3E6f+JFshe4rb5xEu6xFeFHOSkZA=; b=psoVX9wOWRpP9ZZniJu9ncJXg9
	L1pmyDlhy8Q+DGBoxDuXHygrA8l4b12bkgQrRC447rHkEx05Jc4B8kzGhHKlMfrpViOnPOKfPm9S6
	T7GpYkdcm5xWGa0MTNF/iIkGl6durTxE9slGNCN1xUYj++2Bg3sX3817kgXoS9kE0TkRzPknAgkBU
	DdfjFS7/s7TjS8uA92clsJrNMBjpC4Uc19Twz0KcOckgpQWgQEsWB+vRyaHq+hmLBtB3s1IZsoMnn
	Ekhw19wCuN+z3WogQYFYvnHELrQxfXgPPpVs9Fb+Qco+1Kfe2s3g1gGAAv2lRhMMLmuh/Entuv5Hs
	eWp5QPOA==;
Received: from [89.212.21.243] (port=37874 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1sOA14-00Ddjc-2T;
	Mon, 01 Jul 2024 07:55:54 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: openembedded-core@lists.openembedded.org
Cc: upstream@lists.phytec.de
Subject: [PATCH 0/2] Pulseaudio Y2038 fix
Date: Mon,  1 Jul 2024 07:55:51 +0200
Message-Id: <20240701055553.2851418-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 05:56:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201275

Hi,

these 2 patches fix pulseaudio issues with Y2038 compatibility. And in
turn solve run-time issue with "Stack smashing" as described here [1].

Explanation:

Patch #1: Adds PACKAGECONFIG[oss-output] and hence adds configure flag
"-Doss-output=disabled" by default to pulseaudio. This in turn disables
OSS (Open Sound System) support that has been enabled by default since.
However, please note that OSS has long been deprecated in favor or ALSA
and I think we don't even have support for it in the kernel. Moreover,
even Debian disabled OSS wrapper support for 32-bit ARM machines [2].

Patch #2: Re-adds GLIBC_64BIT_TIME_FLAGS for pulseaudio removed by the
poky time64.inc. This has been disabled since pulseaudio didn't build
with those flags enabled [3]. Now, pulseaudio will be Y2038 compatible.

BR,
Primoz

[1] https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/3783
[2] https://salsa.debian.org/pulseaudio-team/pulseaudio/-/commit/5209c2fc46630722f1aaa3c0bbf88a9f843cd27c
[3] https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/3770

Primoz Fiser (2):
  pulseaudio: Add PACKAGECONFIG for optional OSS support
  pulseaudio: Remove from time64.inc exception list

 meta/conf/distro/include/time64.inc               | 5 -----
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 1 +
 2 files changed, 1 insertion(+), 5 deletions(-)

-- 
2.25.1


