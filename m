Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32D3E67813
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 17:43:53 +0000 (UTC)
Received: from rusty.tulip.relay.mailchannels.net (rusty.tulip.relay.mailchannels.net [23.83.218.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.85015.1766425432213825530
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 09:43:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=A0vKqtHK;
 spf=pass (domain: rootcommit.com, ip: 23.83.218.252, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 93421762AEA
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 17:43:51 +0000 (UTC)
Received: from fr-int-smtpout24.hostinger.io (trex-green-2.trex.outbound.svc.cluster.local [100.108.184.12])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 17CF3762B44
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 17:43:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1766425431;
	b=tBD+21eNkH15Adxj4FXkzCMS6+ap+GkJ+jbdGQU1eTWLKN9VF/+4nSPrNh408wyVnZRkS9
	x0FsgZ6Lhhqhpg/b69TikcwHvfyjs0LT5SFCXLgzxnOGqO2SKYAfYbJgcNTcJjvwX8iG1Y
	w5Cf53qGiaYhPKfMkumiVZ+tM7Y4eaDG82Vok8Afneogw6+jSwrY+biTcVS/Lw2DP1tjpq
	WPlY+yDvS+QmCd8UfZigJ+5V0LQiegHiVGsaX14G5UA0K+b5RLKnOWZwkIg1A+xPE7KG9b
	ZWXxxLpxAo8ZCdRT1uAapUzyYRb/MT1D8JgWsjeZMfH4CyLlUZkrab7y5mXrMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1766425431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=gZRzHIJJxgvZaQ71HrwWPrXpNH5bELrgJJsUK1NxgTU=;
	b=HARq87TTSYtfP+SUQ0bhfQ1nlYQHii7VTrNIoml5CkfEzoN5kYG4tS5iXljlHb6Y80UEKS
	e6QZchwA0mubzcI3OgKuvyjiIT6mTbk6xc0b6Lj8cq7QUoTb/ujUL/oQHAs9mT1stCtUQs
	5mU3iEKYSJw+K/OT7lw2H/87lCC4c9jW2TOCPe3VUMM0vvLsnphQXPKeC40PnARhWkd4YU
	verbARNZagxHogm1VoBhgnYtR9CuWro40hyYbkiwk7nlsrjKvBs8LVPfTx795cOR40SjYV
	Evg1TPwY7/JgnU98J3Qra9UnpX32aiJw69w5IFCz6j1NZ+wL5KVWV8JxVta81Q==
ARC-Authentication-Results: i=1;
	rspamd-55cdcc6c54-tfwjt;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Whispering-Lonely: 6959431a1a3cf33b_1766425431503_3760747111
X-MC-Loop-Signature: 1766425431503:2693185045
X-MC-Ingress-Time: 1766425431502
Received: from fr-int-smtpout24.hostinger.io (fr-int-smtpout24.hostinger.io
 [148.222.54.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.184.12 (trex/7.1.3);
	Mon, 22 Dec 2025 17:43:51 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:7586:fd48:8d48:80a0])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dZlql2TK5z1xtc;
	Mon, 22 Dec 2025 17:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1766425427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gZRzHIJJxgvZaQ71HrwWPrXpNH5bELrgJJsUK1NxgTU=;
	b=A0vKqtHKbnDLoYjsRd1mqIazsriidAm61vtwy8Z7phZk+I2RqGnQ+UEOIjxkYaVVzaxzmq
	loRah4Ql853sTMFFl1XJAAWXJc/M/Xp1eN4owTt1laKvWKZUqi/cZkUoBUchOlHXHNDEZB
	Ok647vDpLfaTkxiXSAFIqXOvza1Ke0tLHmfW7W1ccJAZCQ1Ll2lEt8n5lGBsh+d14rURUH
	ARq1Fq0KS0FYxbHtB/E/CMaF8Y1IEYaBuHAVqRPzEPoVvr/+IK0KjPibtxgldGnLdXKDqA
	LJTfRMKARNdmLQfDrfo6BrEQq+sb0YCv81hWmNq1XdyeVkUyGDwzKxfUDcw7kw==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH v3 4/5] alsa-ucm-conf: upgrade 1.2.14 -> 1.2.15
Message-ID: <20251222174336.1794730-5-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251222174336.1794730-1-michael.opdenacker@rootcommit.com>
References: <20251222174336.1794730-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Mon, 22 Dec 2025 17:43:47 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=B9fr0/tM c=1 sm=1 tr=0 ts=69498353 a=myaG3V0YOm9nx1Em8mk9ug==:617 a=xqWC_Br6kY4A:10 a=foHCeV_ZAAAA:8 a=d70CFdQeAAAA:8 a=tDKbSAphMeuHiY91hC4A:9 a=h8a9FgHX5U4dIE3jaWyr:22 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfJdygYWr7DRxhdu3hmFoXvnjnWqlL6kmP7hMRpf5Bf31OuN35oeiqaFGTW0/3fIZNqElE05nFpfKwm8xXZK4kxJnJkXQ6ofUOJSrNrn8BGjpdvq8Q/9Q I4LA8y9lh/yQ3aVw8uZwjwFl6Dx5Bao9AH/ei8rYyak8XuOxVq0BLu5la0awzjWxN8PLihs2+61UfEgpWaR8GKaSGtYtcLEboVdmYDRMGZMv/XIhv1DYS8hI nYBNfNI/b8xOP2L8obs4S+m/SLFJxt2hXNQ29m6BbsWboeLamKeFKwCgtS4/PVWTMD2lsMmEjmyoChlW0G3i7D7eOI+e4isjnnIpj05K7Di8Yu1SfDGE5a8E 04hQrVtY
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 17:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228319

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

