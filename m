Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F025D65556
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 12:17:26 +0000 (UTC)
Received: from zebra.cherry.relay.mailchannels.net (zebra.cherry.relay.mailchannels.net [23.83.223.195])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13690.1765973842311672665
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 04:17:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=XvKGX+vh;
 spf=pass (domain: rootcommit.com, ip: 23.83.223.195, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id E336E7826ED
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:17:21 +0000 (UTC)
Received: from de-fra-smtpout7.hostinger.io (100-109-39-174.trex-nlb.outbound.svc.cluster.local [100.109.39.174])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 4F88E781C55
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:17:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765973841;
	b=GuwKYww+DNJZWiaDWmN1sYsUXCi6+Eh/sj/bwmiEbb+7wVQcGCLn0cIBIBYVGOi3vuV4ra
	eeZ/UzNaSguBwyo2BE5Wd9fqjbymJMiWv/s+9DFOEzYeEmU6ZhUr/+JS6qX/O9PnCMOxpn
	PehUcFmTHf3b7ok/ZEYGMou8FpuQ/rQqivqxKWHenfRvFoFr6kc9ECIhoikpyE1XtPUZ4d
	WvAtLdO6ZUoty02ZJ0kNuC2vUHAX2tvq24UqLODrD5MkGS5PHO8UM1ErqlxsjrVzneZ4k3
	WxvgyQbuI6t5OAG+O9cyKOrhuz/Gu3L9EDPiZ4D+W/l6oRFscnv4uqMXkC+x8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765973841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=gZRzHIJJxgvZaQ71HrwWPrXpNH5bELrgJJsUK1NxgTU=;
	b=6HPoNJo8ORyziq5i3Uvr5cDkwQufN81TKJsVHBvwn6Y24UFMkJ1JDbJluP0gg7stNwOfQ7
	gYfyi+4YUMMeFtAnLxwXGENWYlxgiGa96A3gAWwzVFXZsGZNE1Zm6vSfCBjtWTW4A3s9jC
	lS0Y3TWef/+Q3XYp1vCV8kDMg6uXgoMajKEwKv2rrEPctwTFfs3JYjRUMXsKVyqAOgqxWR
	WJYCXAZJP5DUMQRq6lJ+iA8k92WbJRKKhoXWlNEfRnLzbX/iCYbBTSiFJZGh3rdqZAdBJw
	ozjOwpEr8oxNTpxs1jAzjL578K+UEvdSbXb8aATw2Cqmx4qCfIomytigCvjBcA==
ARC-Authentication-Results: i=1;
	rspamd-6ccd5b4cc5-9kn48;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Ruddy-Cooperative: 5e7a55591dff16c2_1765973841827_3052032034
X-MC-Loop-Signature: 1765973841826:746972278
X-MC-Ingress-Time: 1765973841826
Received: from de-fra-smtpout7.hostinger.io (de-fra-smtpout7.hostinger.io
 [148.222.55.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.109.39.174 (trex/7.1.3);
	Wed, 17 Dec 2025 12:17:21 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:8e2b:fce5:ec42:f176])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dWXqM331Qz46kp;
	Wed, 17 Dec 2025 12:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765973839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gZRzHIJJxgvZaQ71HrwWPrXpNH5bELrgJJsUK1NxgTU=;
	b=XvKGX+vhN3DLiqhUwKyx5sylkMo4BZ06TjkH4T1jqWsLpRDjzitWNHTDF3prIZslLfe05E
	qnIYydllDEsPksH/++yvvtHWKQ1aCUmheR1Uh6EcmPAhK/u6pNZbPqj6k8r1Nzgc0ZYSuC
	/V48S43O1TuHCDKt9EiqMuk4pQMCneRLMhPfwDDxkwYV6xVwojt6kaSlkTkiFO35c80f4B
	nyKbtyh9XxZl5ukhNyZkHJQtP0AYt9onxFuJ43ix7PlTkktHYf1EqlumiENZDmmPSnnUkW
	FwZEAeYe7Vtetav7ncQb8wpWc/lTVqJGZrtRppq4T9rF1WZKIQ4Dx4+BbcYw5w==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH 4/5] alsa-ucm-conf: upgrade 1.2.14 -> 1.2.15
Message-ID: <20251217121705.391288-5-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217121705.391288-1-michael.opdenacker@rootcommit.com>
References: <20251217121705.391288-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Wed, 17 Dec 2025 12:17:19 +0000 (UTC)
X-CM-Envelope: MS4xfPZwjjFCMqMDT4NEA7My85XTWaX4JP4AR9Kuu5LSXyHCrnzPCLDllji5cC7QLJ5ugG6pUgb26Csvm/ZaV7z0C79hWlg9bLhUFzPEQS66JbUGdUCyvfrf kAr3B7KjVabvpX3tf8wNtCrEsqz1s3SHudbjQ9wR4oRX/XoKsa13XCmCNvNMPoPBu5iLDmi2BViO4FcdE27UoP0dVojRc1pX7Hkz2rig7sphcvrLH6VBBxa9 u9tL5XAwyFX0P/suhKpGqodsAy8YVvh1BvB4bNZ9caMdsnFM98lsziASADNxvcqNu35du2pMdn/Rh81imS7Y+Vr8JibSc7DGhyjFYZl5Pth3S2cf6RnQQV// aWwDtOnW
X-CM-Analysis: v=2.4 cv=etGNzZpX c=1 sm=1 tr=0 ts=69429f4f a=JY/OoRUBqPoXaiLUhbiEKg==:617 a=xqWC_Br6kY4A:10 a=foHCeV_ZAAAA:8 a=d70CFdQeAAAA:8 a=tDKbSAphMeuHiY91hC4A:9 a=h8a9FgHX5U4dIE3jaWyr:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228027

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Upstream changes:
https://www.alsa-project.org/wiki/Changes_v1.2.14_v1.2.15#alsa-ucm-conf

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 .../alsa/{alsa-ucm-conf_1.2.14.bb =3D> alsa-ucm-conf_1.2.15.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.14.bb =3D> alsa-u=
cm-conf_1.2.15.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.14.bb b/meta/=
recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.14.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.bb
index d9ef831937..1eaec98e3b 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.14.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.bb
@@ -8,7 +8,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D20d74d74db9741697903372ad001d=
3b4"
=20
 SRC_URI =3D "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] =3D "32e9809f592d92b978aa1032e35293c33b8d0f1ec475f937=
022c3ee9a3069c21"
+SRC_URI[sha256sum] =3D "5510cb0947a3bb877b5ce218e3ecedd78bfa6643e372346c=
87d93d4844a45ffa"
 # Something went wrong at upstream tarballing
=20
 inherit allarch

