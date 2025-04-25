Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D00C369D3
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 06:23:26 +0000 (UTC)
Received: from buffalo.tulip.relay.mailchannels.net (buffalo.tulip.relay.mailchannels.net [23.83.218.24])
 by mx.groups.io with SMTP id smtpd.web10.1373.1745562200517817824
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 23:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=mtx/xhJG;
 spf=pass (domain: rootcommit.com, ip: 23.83.218.24, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 12F768A4A05
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 06:23:20 +0000 (UTC)
Received: from nl-srv-smtpout9.hostinger.io (trex-2.trex.outbound.svc.cluster.local [100.109.34.4])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 70D1A8A39D8
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 06:23:19 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1745562199; a=rsa-sha256;
	cv=none;
	b=xsymDw+5PLBtrKkdSUjCkBuq9IcobvM2eaSNgNiyXMMEnBHElu3IoLPBm+amsiaHUrRp1w
	3GqPKwV5nmRIlf5DXovzLtxboRHz8j04briI9irSh8/1f4pECZx3O4MpApJTsbZgU1VpMW
	+YBbs+Dut6LXdlBdwCt/CGxnlo9/1zScmds8l05BlmO/S9lNlG39nxIiwBlsLChARd0v30
	cGmMw/8Ph04zLyoaUcyj3+op7XYAdndSB3NpzUiZHIjGaIrNTapxda/zv4UMs2UlS88Pzu
	Gb2K60fvrdFzqmieltvSFL9GQ041EzX/3yxQOVyxYmY8xprOmwvg9pU3qOMpZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1745562199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=sKdaXIznHPZ6fe500Jd0IWpUBnM8FwsQz7FGwVOVzTo=;
	b=k5m2MaM1FGoQr93HhE/Xtw8/lvOYGSihd8nWxfu6G2uoDWoQUR+gBquheJ9l2OGXFgRSvk
	pWLrpvRH8le51mWu8SHQklQEE81gl2YqpvLOMjO4d0tCoc4CPWvEsdFMtcwiaE36r9xb5e
	mxcTaR6aHP5VFKmfmg6dYNX/lH1FbFwuWyJ9X+rRbbNcilKoK+GbnrwrK0yQOVe4OXYYuX
	heFf4NjXFOwW1tdjCkrkqDvnlUbC97OPlE7qSSTwpUm+xxzZbIc5/STvwL1CWNI8mAZniN
	AKU3dId98F97bdqqkymo+NJcYuS3Ey8T6viMj2UNXJxTFzFYShKtJDWFKgxWFQ==
ARC-Authentication-Results: i=1;
	rspamd-5cfcf5665-5rgk2;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Shade-Average: 604da27824bfd23c_1745562199968_568276821
X-MC-Loop-Signature: 1745562199967:3548151474
X-MC-Ingress-Time: 1745562199967
Received: from nl-srv-smtpout9.hostinger.io (nl-srv-smtpout9.hostinger.io
 [45.87.82.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.109.34.4 (trex/7.0.3);
	Fri, 25 Apr 2025 06:23:19 +0000
Received: from a8.lan (unknown [IPv6:2001:861:4448:6b00:49e:d65c:81ed:4ae2])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4ZkN7n2LNFzGY3Xs;
	Fri, 25 Apr 2025 06:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1745562197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sKdaXIznHPZ6fe500Jd0IWpUBnM8FwsQz7FGwVOVzTo=;
	b=mtx/xhJGIm+osaypfLS2qKGXqFNQIi8zJ25zikktKRMufU3SHGY/Q3jiYST0J+fjAv7WRT
	vwPVXCDNVgBimBR9e1fZWWm9i9Ih5x3aXSMO1neruaA5fSx2eItQlqZplriXHiMFKCJtbJ
	hGn/XL7uW0gUF/ZvmjrA24rQnth2uy7xAgaw/CF2HHnmnyiRsvakaeweK60LYrjrHJu8PO
	qY6tmV9OX7LhVNYFL6uXIxoh5WmEwIeLi4EPu5+1is4O8KWRcnB7It5sT5PHHCkpKTpkiq
	66SxQ2NoT9aBza/R/IQjA00Ewt5thAkpVSRO5jCCaUkuK/kNbRyIXT8YQAr+jg==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH 3/4] alsa-ucm-conf: upgrade 1.2.13 -> 1.2.14
Message-ID: <20250425062251.2825835-3-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250425062251.2825835-1-michael.opdenacker@rootcommit.com>
References: <20250425062251.2825835-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Fri, 25 Apr 2025 06:23:17 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=LJs0Q4W9 c=1 sm=1 tr=0 ts=680b2a55 a=zhjrEmeF1h7dvwADATEXqg==:617 a=xqWC_Br6kY4A:10 a=foHCeV_ZAAAA:8 a=d70CFdQeAAAA:8 a=-OT0PzCFCeIPFwGPqUMA:9 a=h8a9FgHX5U4dIE3jaWyr:22 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfBLbVyDnQOgiV8fLAMaGFfnrZwkZ6DbzaqoZcdx/GaKcoHtc1PYee6rsVOGlMs4/I/YDYK5hfCIlxgIXZvGDOgVR92IB2/4WSi/bc1bZF2h11Hqf6y93 2FIFlB0YcYdSIS0tLPOcz1y0aIdHMr3DnI6IaLtW9zjIKrR9IShW2VOdcLBFkDcHebY/lCzfJg23l9vCuQUO/lmHFJw2wQpEYvH5/DeaLZtHRtW70s0y1tjY iO4ylIgyxNF63isLJ8RuEOUl8OzDq+UxQrQdOs5+gYYGSXfKWeR0JA7DWOYnPW9Vbv1EdzaPVpNfOMkYxvAhNrZBlzZld+Q1u67HfWiWd6I=
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 06:23:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215425

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Changelog:
https://www.alsa-project.org/wiki/Changes_v1.2.13_v1.2.14
Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 .../alsa/{alsa-ucm-conf_1.2.13.bb =3D> alsa-ucm-conf_1.2.14.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.13.bb =3D> alsa-u=
cm-conf_1.2.14.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.13.bb b/meta/=
recipes-multimedia/alsa/alsa-ucm-conf_1.2.14.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.13.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.14.bb
index 1cba08b97a..d9ef831937 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.13.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.14.bb
@@ -8,7 +8,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D20d74d74db9741697903372ad001d=
3b4"
=20
 SRC_URI =3D "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] =3D "4483b6e3983cca08fd326a73fbae449b5036e444fb1a07c0=
dee74b504b7ab5af"
+SRC_URI[sha256sum] =3D "32e9809f592d92b978aa1032e35293c33b8d0f1ec475f937=
022c3ee9a3069c21"
 # Something went wrong at upstream tarballing
=20
 inherit allarch

