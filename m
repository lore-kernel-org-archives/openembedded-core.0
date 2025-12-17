Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02BED65C77
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 16:05:57 +0000 (UTC)
Received: from elephant.ash.relay.mailchannels.net (elephant.ash.relay.mailchannels.net [23.83.222.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18520.1765987552484074120
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 08:05:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=D5hxd1Pr;
 spf=pass (domain: rootcommit.com, ip: 23.83.222.57, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id A5F4F221BC7
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 16:05:51 +0000 (UTC)
Received: from fr-int-smtpout20.hostinger.io (100-109-2-65.trex-nlb.outbound.svc.cluster.local [100.109.2.65])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id EA995220EEC
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 16:05:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765987551;
	b=esSj2OWU193PhLOXPtMRQah1BTMtRWGu4y9nkGqsMc4VI3+FZF0ZdRBif1e8ecw28VUu4R
	QJGjCXSQmBNjtVxenFMprXaMWwM6OAXO7SwhD+3vqfzCMDl7KnX5jMd5NHnITih6wrDFgy
	zEX8OyJQg8R0Hu/4dpgTryGgZszHghyP2Oc26iqeCe1rEKYTjPkhUiEPCAHBQhV+GdJtNT
	sqX+zXZuLoYWJqnm/vaqlaZDTJCslT3fwbEQZJKgyH8Dkjc2DG2x0bAx/pMy0gDxQOpmEl
	9Uk/ufaYlUWTPOc50pyC1nsSndR6fPaZDIQP5a1nSW+OHol7AR+95FelOyvVvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765987551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=gZRzHIJJxgvZaQ71HrwWPrXpNH5bELrgJJsUK1NxgTU=;
	b=VXId2Xu0yloyaz8T3j90BZhUwfA1TLvvUuLHJTeD1Jgp91dFOVkf4BUFJs6NmL0c7bpXKy
	5hfUzF22vQYkM3MBzEwPY4LhC+ZHdxaSDDc5cIWh86LN5XrvQOWOad/5ENj0OpdCZSRTuW
	hP0oZHx4WenwxxdDmj4T6IRKooXoCa1VhCcQBaie1m9nxjDgAWa3/q3grGTdf0oXGRhApt
	c8aTjCzhmd/WZDeUfg4rXFdzzfk6q4QSZGu80P54etMricstDcd8ANw3GPPnFOS/tIzHI1
	P9BJec0eky8mhXXIzjQmVr3IJ8Lk6Mu9QmZ9trYi5kFx3iXrp196yHtodYvQcw==
ARC-Authentication-Results: i=1;
	rspamd-6ccd5b4cc5-jckg8;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Attack-Inform: 7e7258c00d6d4c0c_1765987551499_607658871
X-MC-Loop-Signature: 1765987551498:294714042
X-MC-Ingress-Time: 1765987551498
Received: from fr-int-smtpout20.hostinger.io (fr-int-smtpout20.hostinger.io
 [148.222.54.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.109.2.65 (trex/7.1.3);
	Wed, 17 Dec 2025 16:05:51 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:ea5c:9c0:3076:4dda])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dWdv11FhHz1xsw;
	Wed, 17 Dec 2025 16:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765987549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gZRzHIJJxgvZaQ71HrwWPrXpNH5bELrgJJsUK1NxgTU=;
	b=D5hxd1PrLxFD5wd7Oi3z9rdkXXOyQFOwS+j3yPjv22E53umCMst0SKR4FZrNrv4lAaWfMn
	Ff41O45x6HAjg8BamgQbvpZRjofAcpmihPXmpDFjVM0jUNtNMZMI9R3kD/eQC9lG3XGAZn
	XvBANYNJP/yFEmRRfX1q9GaQE+q6DKeX0EbVAEIV1O49EIaSBz90ksrtyBwLiK+gpPulox
	ZmdZVbadquOkA37+zvjg3Lk7E0OpY6Y57C/fcRFrvtg47WMGcxo3xWssxKPbUG2OOTd7SY
	XmCHIG1qxvA6MmYyr7OUY5so+WDR5fPCIDVtepWT7+0UDyM7ZB+CErmA3khapQ==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH v2 4/5] alsa-ucm-conf: upgrade 1.2.14 -> 1.2.15
Message-ID: <20251217160533.600164-5-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217160533.600164-1-michael.opdenacker@rootcommit.com>
References: <20251217160533.600164-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Wed, 17 Dec 2025 16:05:49 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=B9fr0/tM c=1 sm=1 tr=0 ts=6942d4dd a=MKCPbgLKPPUpDiypvfdhzA==:617 a=xqWC_Br6kY4A:10 a=foHCeV_ZAAAA:8 a=d70CFdQeAAAA:8 a=tDKbSAphMeuHiY91hC4A:9 a=h8a9FgHX5U4dIE3jaWyr:22 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfDWVLJh9PezGY66PZNm96eZh4qE+5y4xoodjUx2zW+L26WMQqWOUoU79XLt1+eKDbN8I036vLm2K+Wlr/K8/axexLjAMPJ2uZ5Y+G1lI6KkRtaKIacat +Ht6aCzjYN0jl8GYBxboqbfouZwQc98hNokwcCqZF7pUw65yjzZR20I7JKeOMEkyrA0goE4YQC7ZuHBdlO+B6bKslQPoOqDwhQOlit5ZyuCo9WG/xVDBgMpi UlMsjsO3hCthIFKiIrWOmln4BIXsDDxSUKh3EzcoYZcBwe/8g6EhzopuDbRSfeIra/Fiq0v9kNf1Il3M/xbMkniKdBt1RFs3x+GbJ1XaJD9wQugfrP5HCHHe ALJU2y+6
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 16:05:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228067

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

