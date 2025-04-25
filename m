Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7EFC369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 06:23:16 +0000 (UTC)
Received: from chocolate.cherry.relay.mailchannels.net (chocolate.cherry.relay.mailchannels.net [23.83.223.35])
 by mx.groups.io with SMTP id smtpd.web10.1371.1745562187007769196
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 23:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=X/u/xvw3;
 spf=pass (domain: rootcommit.com, ip: 23.83.223.35, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 5E3BF16269D
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 06:23:06 +0000 (UTC)
Received: from nl-srv-smtpout9.hostinger.io (100-113-55-196.trex-nlb.outbound.svc.cluster.local [100.113.55.196])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 96CC6161096
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 06:23:05 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1745562185; a=rsa-sha256;
	cv=none;
	b=1klZ8/msnx6nksgu+5Oy/JnULqpYEgAYwLntPiX/1DGb9Xqg5tSCNIqjuSDA1rfGn2H/Gj
	DGyq4h8vzhkSbsQHaG6kvuSBFQSgbJd94RzUx/s9IDJJnTQumdRiFGCCjCv1bKh4d2AHnR
	MweONmQLMUEk/QyH+kJl3SGXIPyiITJCelc5z6Es3ND+mFSD2bqpXgACWd3IAqW9BNUCxe
	gvJFG9KZaHe2t7YF4qY/8G8iN9QKcAIXRHgeYbBgROSZs3jdTgwLyAvJUhEc2Gi3TAN6/T
	mq1UJi+lS4MAXUpUjZ1eBkcPImIXCZkIQHqRMx7fxjod5mNSrtyVU1YW5hriRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1745562185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=C+IUeW5qIGdZyWjWI346iK7S0mDA+EbmoAdMQi/P7+o=;
	b=vSRgY6uBh9VweDTraNML9rj0JrKebAf4Mhg15t5Hj/ssmxMRA/FXM1p8MncTaRkCpkEBf1
	R1oiT4DJt565mlhdJuYgIJw5WB/1K0yPNGjgqiTDBpdo81QxlV5eM1WQyzdYGZfv8SGftW
	GVHGoJsW3UmIA/IvS3oQwHrsExWN9VlLrKwCTzcDlUJs2v7cexqHW9RFkkZC8rbziLfBko
	/8kM6R8OV3KUgXYeznrXUmzm9LSn5bxviCzeBNVnQZWofVevwI8kxcxn0k1qplljZLbTyw
	Jr4F3pbbEinyOjRWmvEgepJ3fFSSM1Nd/tzhvb0YtXeGFNIhRVr/3CyMwjl1PA==
ARC-Authentication-Results: i=1;
	rspamd-5cfcf5665-lc7f5;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Bad
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Juvenile-Sponge: 1fa3c01f6dd511f7_1745562186125_2037230913
X-MC-Loop-Signature: 1745562186125:356132322
X-MC-Ingress-Time: 1745562186124
Received: from nl-srv-smtpout9.hostinger.io (nl-srv-smtpout9.hostinger.io
 [45.87.82.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.113.55.196 (trex/7.0.3);
	Fri, 25 Apr 2025 06:23:06 +0000
Received: from a8.lan (unknown [IPv6:2001:861:4448:6b00:49e:d65c:81ed:4ae2])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4ZkN7W2pnSzGY3Xn;
	Fri, 25 Apr 2025 06:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1745562183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=C+IUeW5qIGdZyWjWI346iK7S0mDA+EbmoAdMQi/P7+o=;
	b=X/u/xvw3Myl/AqjTJyt8ZOXOP3n8bZ9g0Ek49HeTaTveNkHEVokVlQQyrr/+gvlL9oquyc
	Q4mEJGmKHl/2OT4xK9eSQ/XgxhPwCREvcH+W6UBxRqtLRzAi/tnobVTzzpNwKUEe5WBDrg
	+WzZJQDvPSwHTUqeFt8hyc4RwQOyaS7ENICg2bFXK3J3yjjq5SmjlstYQh2fa4gy1lMeuG
	udG/WGnOazgFuSIEH+VXLfeuEYAbfRssbRjmFCo9UrZojaXsldVep9pI4b4xFcAIierk6J
	p8cMV0StBh6iP0Jo7fQzYIzfhHSDrYOmo9YL+poutsNm41ool4GcMcMBGiwx4A==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH 1/4] alsa-lib: upgrade 1.2.13 -> 1.2.14
Message-ID: <20250425062251.2825835-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Date: Fri, 25 Apr 2025 06:23:03 +0000 (UTC)
X-CM-Envelope: MS4xfPgvlfqLpPxiJ0kPRK32inbBbchV5OfRIbVaNiFXOq4/Wycji9C2T6OMImr08JdtVGBN+g2dA7/Xu3WQCcG2Pzv/cW1WsBea+S2D10wT34ghyeFtLofx /HJKk6qUbcCHDh9a/hfiHkNSDu8WTNsStOJHiHMGcBjIi2M75XA2i3xx+hTvviYe8hn45oKT7EQkDF+uUdRvjiGbLuGPaKJgnRljvI6CLQweA5cthiaLCbrw huowcIhmD0j1oF4YRVnVMKkD6Y2y/f5yTuwDRPy2/MuxuM+7izzByeSjJOtlhHqurtsdTLshvUZn5o+u1Xmdu+II9o9HgXSe4SP50TT1fvY=
X-CM-Analysis: v=2.4 cv=LJs0Q4W9 c=1 sm=1 tr=0 ts=680b2a47 a=zhjrEmeF1h7dvwADATEXqg==:617 a=xqWC_Br6kY4A:10 a=foHCeV_ZAAAA:8 a=d70CFdQeAAAA:8 a=sI7L8MAiNPx_WVIqdN8A:9 a=h8a9FgHX5U4dIE3jaWyr:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 06:23:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215423

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Changelog:
https://www.alsa-project.org/wiki/Changes_v1.2.13_v1.2.14
Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 .../alsa/{alsa-lib_1.2.13.bb =3D> alsa-lib_1.2.14.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.13.bb =3D> alsa-lib_1.=
2.14.bb} (94%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb b/meta/recip=
es-multimedia/alsa/alsa-lib_1.2.14.bb
similarity index 94%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb
index 4572eff97f..41a42f9ecc 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.13.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b9107=
6e631dd8edb7424769c7 \
                     "
=20
 SRC_URI =3D "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] =3D "8c4ff37553cbe89618e187e4c779f71a9bb2a8b27b91f87e=
d40987cc9233d8f6"
+SRC_URI[sha256sum] =3D "be9c88a0b3604367dd74167a2b754a35e142f670292ae47a=
2fdef27a2ee97a32"
=20
 inherit autotools pkgconfig
=20

