Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF52E6780F
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 17:43:53 +0000 (UTC)
Received: from bumble.maple.relay.mailchannels.net (bumble.maple.relay.mailchannels.net [23.83.214.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.85011.1766425430260729122
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 09:43:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=q3oIoUjL;
 spf=pass (domain: rootcommit.com, ip: 23.83.214.25, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 9199C8A17B2
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 17:43:49 +0000 (UTC)
Received: from fr-int-smtpout24.hostinger.io (100-108-213-79.trex-nlb.outbound.svc.cluster.local [100.108.213.79])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id E73768A1278
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 17:43:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1766425429;
	b=8DNOzbIm1cJ2anGJhabQEDNDqrWPuA3rizJbs4y3X6KamM0R8syYDEyi/Qh/7fpyLZFCjf
	DTkP3PbXXM+m7xXp07aoSGVuGMmq1NweyV5FVcqrz+j155/OPoyMy+yvCzpK/mxCRFzm8z
	PmuuXeMwcuOsLNWxQyyDQH+NgaLvZ3dx8HFstp5OyXmlrI0zoW4xPjBFh/U6p2Kh8emMoW
	tYdbswQ45RxBLdT0X7EYB5444t/gBgDdo2ET+xY3KAHR8TTTS2FqMhlUe6bU3KmSLzMn01
	Pw0C+tTwji5CbSb3Y1GG85tppTWIflmGgQffvyZN94JUJOR9HCXnpaLeHsu2qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1766425429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=eEYxLYju4z4EVLWNfoShMB5Qgkc7XNa7GF450IS6Q8c=;
	b=DE7QjllCGxhAlID9ClYdahywt/63R6gbs72Nt/lAZkyQyALt32wNx3bB0MyOEo7cx5zC0I
	AiNwsp5wTLq6UiSWLddJv/XsGa9v2ebLAr2Hyf1ddzuewxK4qXLN+iRQbppFF7OuLMXXP4
	zdebX+WLnrtCTeIMCHoamV2bOA93qJSAd1Xhlci9rO2mK+Z0yaVP2pImpZAvYVnmy4oWu8
	Jsvnj8i1eqIXW/utghtfxNks4zVvjvQXe1UZ51ZEH+f3E4QpJpbVMdmIBe3ZYMfHITPD64
	XGsy1HxFGpHJDx99AWMaI1P6frwQeMClwZsFIZlq6ZbJ3g4FkL0lb6e0YyYq2g==
ARC-Authentication-Results: i=1;
	rspamd-55cdcc6c54-pn5fg;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Whispering-Interest: 6a73044f497d0623_1766425429487_3165285015
X-MC-Loop-Signature: 1766425429486:102235005
X-MC-Ingress-Time: 1766425429486
Received: from fr-int-smtpout24.hostinger.io (fr-int-smtpout24.hostinger.io
 [148.222.54.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.213.79 (trex/7.1.3);
	Mon, 22 Dec 2025 17:43:49 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:7586:fd48:8d48:80a0])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dZlql0l3lz1y1S;
	Mon, 22 Dec 2025 17:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1766425427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eEYxLYju4z4EVLWNfoShMB5Qgkc7XNa7GF450IS6Q8c=;
	b=q3oIoUjL2By/8/igYil+6LRjTOtsI3H02Uzlq84JfYRFFdtZeENGMa3sQ5Xte5xwqypvdr
	DZOJbP6Th2qjMcLq+XherZReehmjk1zZym0585clbznG3iXssgxG9W2crduTtuaTeQGnPJ
	MRHZRKIs0vYdUbezO0wjrYPBeGTgi+QSSJOtS4kwg1Y8UU0fz4C2+ztb1vgnZjDXhZqKek
	EDc5X9HYr2wqiOjq7rnAKlvpFJZovX4lC5CSMB/cSvtuHJqLnfzOERzZHc+vqtDkNhd2ru
	OXCvKsdknKD5ebt5xVkr52fa+sHibJzow0EQss1BEcY3Zy2ejD1+9cafGI175w==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH v3 3/5] alsa-tools: upgrade 1.2.14 -> 1.2.15
Message-ID: <20251222174336.1794730-4-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251222174336.1794730-1-michael.opdenacker@rootcommit.com>
References: <20251222174336.1794730-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Mon, 22 Dec 2025 17:43:47 +0000 (UTC)
X-CM-Envelope: MS4xfGqwgvH1VRhmI/g/vVIovIlUbesYMioRrcW+9pfQWLsHtBfuK7LycwAym9IwFD1UU7MVREFuscXYq2nNTNIHSW5VqjXNJYDYrInUXt7JgBJwSe2ITx1S 2ibshJ5ANOVsOlA7W2lg5zgzitT0q34YyduduCi1ZmNHXMiyKK464zlTshEqtFLZJXq7XIPZOChw/GFhLJBRhVnUhU+6NFeOMMiP0bQu8BOl2BXujmyieXoI 7YrCrKyOsKNp4+nf7fw33rDTadjqAyJ/wK0lo5LzaBSiUMe02lRWbPH+4YP7qqDFz9eyPRvMidrp6sC0Edql1UKw3LMLCUXWay707lZr/n2bHFtr6IOGF4hd /6jDR6gy
X-CM-Analysis: v=2.4 cv=NuiDcNdJ c=1 sm=1 tr=0 ts=69498353 a=myaG3V0YOm9nx1Em8mk9ug==:617 a=xqWC_Br6kY4A:10 a=foHCeV_ZAAAA:8 a=d70CFdQeAAAA:8 a=MWf8dILs5OcirjABKMoA:9 a=h8a9FgHX5U4dIE3jaWyr:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 17:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228315

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Upstream changes:
https://www.alsa-project.org/wiki/Changes_v1.2.14_v1.2.15#alsa-tools

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 .../alsa/{alsa-tools_1.2.14.bb =3D> alsa-tools_1.2.15.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.2.14.bb =3D> alsa-tool=
s_1.2.15.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.2.14.bb b/meta/rec=
ipes-multimedia/alsa/alsa-tools_1.2.15.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-tools_1.2.14.bb
rename to meta/recipes-multimedia/alsa/alsa-tools_1.2.15.bb
index 751d9e8a76..1228176fb9 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.2.14.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.2.15.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D "file://hdsploader/COPYING;md5=3D5=
9530bdf33659b29e73d4adb9f9f65
=20
 SRC_URI =3D "https://www.alsa-project.org/files/pub/tools/${BP}.tar.bz2"
=20
-SRC_URI[sha256sum] =3D "faef6fdd39ec79c9a5473dc63aa1b6331bf7664a9d452a0a=
8198cec7016cbc6f"
+SRC_URI[sha256sum] =3D "800498d35233672ef67f4bf74cc6e1d37e1fe70c0540e2d2=
e062f2319e7b5df7"
=20
 inherit autotools-brokensep pkgconfig
 # brokensep as as10k1 (and probably more) fail out of tree

