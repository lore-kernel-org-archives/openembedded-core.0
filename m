Return-Path: <rl@karo-electronics.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6922BCD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 14:22:27 +0000 (UTC)
Received: from dd54918.kasserver.com (dd54918.kasserver.com [85.13.167.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26830.1780410141670193444
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 07:22:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@karo-electronics.de header.s=kas202603021246 header.b=mfVvU2eb;
 spf=pass (domain: karo-electronics.de, ip: 85.13.167.58, mailfrom: rl@karo-electronics.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karo-electronics.de;
	s=kas202603021246; t=1780410116;
	bh=KF8bEHhqW9B3DoVS6mICPFntr1iaACbCaBc5Ibw4a4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:From;
	b=mfVvU2eb5It5kaSoHSfhOT6g7vAv//MAUZQ9G9hqxFRnQjiSd2hZ/bZLKqmlLLIXb
	 POf3gXBHoJEeia4/trEdZB0+hLx70Iprc6FrWwFzXuL+srVZOyjTWLRleiOcyxOINX
	 KSm/Kd2eD9x/VOjJgo23ceihKEFIVuy4LSksAf/1oULRkySBu0fGnjpX2HhAKJo5sc
	 WWkqGFY0YE3BkLpwycc/n5FgSTkhL7ci957jJIt717UIrXUBrJ90N5EzSqxm1bsbQE
	 4pF7dC47QSMwonVCOcG9O+2dJ0jgVBnqcbPVOEIqeq5NnS48uiGQdHhThj5fyzOk7X
	 QlXtdDt2p4yzg==
Received: from robin-MS-7E12.ka-ro.local (unknown [89.1.81.74])
	by dd54918.kasserver.com (Postfix) with ESMTPSA id 70BC1772248B;
	Tue,  2 Jun 2026 16:21:56 +0200 (CEST)
From: Robin Lintermann <rl@karo-electronics.de>
To: openembedded-core@lists.openembedded.org
Cc: Robin Lintermann <rl@karo-electronics.de>
Subject: [scarthgap][PATCH 3/5] util-linux: fix 'mount' options in mountall initscript
Date: Tue,  2 Jun 2026 16:21:30 +0200
Message-ID: <20260602142132.976138-3-rl@karo-electronics.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602142132.976138-1-rl@karo-electronics.de>
References: <20260602142132.976138-1-rl@karo-electronics.de>
MIME-Version: 1.0
X-Spamd-Bar: --
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 14:22:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238053

mount -t allows for a 'no'-prefix to exclude a set of fs types from
the call. But the 'no'-prefix applies to the whole list of fs types
given and should not be repeated for each individual type specified.

Signed-off-by: Robin Lintermann <rl@karo-electronics.de>
---
 meta/recipes-core/util-linux/util-linux_2.39.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.39.3.bb b/meta/rec=
ipes-core/util-linux/util-linux_2.39.3.bb
index 12c504e0a2..6f22f13676 100644
--- a/meta/recipes-core/util-linux/util-linux_2.39.3.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.39.3.bb
@@ -194,7 +194,7 @@ do_install () {
         fi
=20
 	install -d ${D}${sysconfdir}/default/
-	echo 'MOUNTALL=3D"-t nonfs,nosmbfs,noncpfs"' > ${D}${sysconfdir}/defaul=
t/mountall
+	echo 'MOUNTALL=3D"-t nonfs,smbfs,ncpfs"' > ${D}${sysconfdir}/default/mo=
untall
=20
 	rm -f ${D}${bindir}/chkdupexe
=20
--=20
2.43.0


