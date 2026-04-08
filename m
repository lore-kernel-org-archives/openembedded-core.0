Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB13E10F9947
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 14:17:39 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.107436.1775657857348048510
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 07:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=nGoT4paA;
 spf=pass (domain: axis.com, ip: 40.107.130.50, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dje9iY55lG88qU2KKt7ZYhorXJxttkH0UXAvEptTEy6LGTh6cNpC3tnL4dkIA+c50XIYmsUHV9iSODZ0vU3bNMEdryAuO5QYam3p0i5DFMqpQf7dqsX1+vbmWL4OtvlAvCcvSu9RiaAvoRNK0VOLBh+CKysgNDoHNGbbN7UEaPqSZ+6Qzu7skvqb4G89J09OLJgmpkPeBjpS1sjx84/C0gd4B0hHAkuo4V2+MBoHmYTWTSZ9Io9s7IN2Yasi5gv+P8xUYLp4zZ9VWDFo0Lg1R23+MAi3OcNdZQ8gCWzlALAgBVuMdYaqMWnewu2yPC0Y6r1/v6ypNmKxq43YxuwxlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZnErWq4/Dx1ZKbeSAaxe7i4Uqf0Ly9C1KYdFXGoey8=;
 b=P2iLro5NwAqrNkmyOSnv/lFhfDbkLnvQyMhTDXUITdMMJ4JNyvOQM+6JSHlgGR49GgBeVNDF+d+gs6HiLP+sU9XlRhGDZUSmVlcqtUEpN9hn15SIPJ1i9rZxXEggNhN16IgxmEoW/SbNFHrNmjuKOXvyCnFfmuXqf2mfeuimAjhKDLj3EPPH6K/Vpv/6SEMZFR2M6ftIqnD2RpkhAlVeKXGveZDhlKZ9IkBKrZZ1OyPkeGSsc3IS8lwyut4+ojhAZ3rE7qCCVtdJJNxHW1CVX6gLwyaVbRpZqDi5fu7jZDeFHLyI2BgV75P/mH4PAaC1tW7HA/6udoojIL7rNQezzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZnErWq4/Dx1ZKbeSAaxe7i4Uqf0Ly9C1KYdFXGoey8=;
 b=nGoT4paAxAKF6NwwZgHbBZjdee4Ueb6lacu7g+Dc/OJ6wek8oXuaNI81F35qA2XEZ9HnN9+auVywBihj3QAWlSsfO1JDacDoe4L3DiWKTH7ryDoBhU38dyM4TEAGCfQ4jToyR1IKSNp0N6NKz3p5mcJU/kcb4gOCAZOOxMrz2wY=
Received: from DUZPR01CA0304.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::6) by AS2PR02MB10430.eurprd02.prod.outlook.com
 (2603:10a6:20b:5e7::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 8 Apr
 2026 14:17:33 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::d4) by DUZPR01CA0304.outlook.office365.com
 (2603:10a6:10:4b7::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 14:17:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 14:17:33 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Wed, 8 Apr
 2026 16:17:26 +0200
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Wed, 8 Apr
 2026 16:17:26 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 8 Apr 2026 16:17:26 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 8C4161FC9
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2026 16:17:26 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 89E1B120831; Wed,  8 Apr 2026 16:17:26 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 06/10] gstreamer1.0-libav: Upgrade 1.28.0 -> 1.28.2
Date: Wed, 8 Apr 2026 16:17:14 +0200
Message-ID: <20260408141719.1086823-7-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408141719.1086823-1-pkj@axis.com>
References: <20260408141719.1086823-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885A:EE_|AS2PR02MB10430:EE_
X-MS-Office365-Filtering-Correlation-Id: dd5d61b3-a7f9-4e96-9095-08de95799396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	A39IdsRra7zorGhEkmhV7NDdcQmbQWVQ5b+IsVMPvjX6zMSs4mDH0sBAqF6J2TbUxRGCN5XyW+mg3bvBB2yInz01XzRqky+ED/a4s4a0hrmfZkJAgXnuLoeXxz7nq6otH0Z7emOpRvSvd3NzHWqt1YGADDhEn3Vsj9g6B3FuORjVN6PghnGrPjaMKt+PwLt7nhPS6uCCzsUevtKJ7OHuaV2CpsQstWRnkVKuppfUVBDhSbT7zlzwUHzVnaM/Nqsh6SXTh/wgilibiUsGo8VqjN3bbI91Xzg1cQC3XO8uEd575gYzrM+ANOsaQTWXc6/h/KWVbierEI8iIJoYe7G9FaQ0CFd6Dev6eOHrcBurlIMeb57oOtSKT16pOldRhKqtX0QYv9Y1l9C7plPBysNgkNwbYicUBVK1LKlioQiKlEvKDOtW6gSoOBlj4E3BJx7SwsqzBT4jj0oRzAPUUpeWMWyfkbkog/GsEARA57h9k6PvEh+rhOFYdsZGFC47sEheoVB98hYzMi7B7Q9fdfSckSe5h0GWJMymyIIXFM63koE6obNJUdxILpMDhlIp2JQcxKg2bW9/Df6pGGeo6DoVahBuRBbRm34238sF0/LmElemImHnjNB4RRZv11cXLEOACLpOE8+CicQwaYs4mceg+UlF7pYvc75vS6TCWx590XkS8KyRd8QXIb2UJoxcC3kQCJWXuJOkmLvqQHeW/sQFgaVgYH4BsCE/NxbEUsnrN7U=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6folwTU2/voKQn1IAJVzQE2AGabp35rcwDq1Zvfa7Hw4tWkPkj4JCmo1c4cFN2YfUDvkBDnKlwpP/LwQuc9YYTxxY79C5Kw7NxYwBhIzc2zEY73HA/vfO6X1kYkKe87oGbgPXSzPjtI781AP27OFcjnuT4ZEibVFLTUvdCDpZmupUWrVVwrsU/qYUpzz3LiuAGaInPVMyvkpQKDNK5O+pM1567YDSw0INwglyySIJrbm1LG5x+SOqnhjD8VJhITtX/IK6Dj1WzX86DilWgzcFeqRKLXGMXVUHHcc4mI/fs+muQMh6G1IfWk2Q8Z4x99cACqEZ7ELYHrAWtQq6DDIJc2eHAm+TqRv7/F67fn11ISLjaA04pidkx92kgdQzWfXN4v/VhcHkWGeI3hV3E6ukrjJ7aYy7MX35xp+dM41ZetJUz1yxcoqA+Fvm87hfm8N
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 14:17:33.2374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd5d61b3-a7f9-4e96-9095-08de95799396
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB10430
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 14:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234848

Changes since 1.28.0
* b2a3b2e: Back to development after 1.28.0
* be2f846: avviddec: Allow stride changes for some decoders
* f0bfd0c: avviddec: Handle field/order changes in mixed interlace mode
* f717c6e: avviddec: Simplify picture_changed helper function
* 0f77771: gst: fix author name: add missing closing angle bracket
* d125725: gst: also adapt author names in the gst_plugins_cache.json
  files
* 92ba6c2: avviddec: Don't increment the AVCodecContext frame counter
* 529e7a6: avauddec: Don't increment the AVCodecContext frame counter
* aa02005: avviddec: Forward any ready video frames on gap events
* 0a6950d: gst-libav: avvidcmp: set colorimetry on AVFrame
* adc82d2: libav: Don't process lines that won't be outputted
* 835da19: modules: Remove NEWS from git which is generated from full
  release notes
* 201b14e: modules: remove RELEASE from git, will be generated from
  template on dist
* 7694a7d: modules: remove subproject README.md from git
* 6376a84: modules: dist common files from monorepo root
* 60c9be9: avviddec: Simplify conditional code in context handling
* b6fbaaf: avviddec: Improve renegotiation debug message
* d94518f: avviddec: Fix handling of mixed interlaced content
* dcb37e2: Release 1.28.1
* 32113a6: Back to development after 1.28.1
* 80cd0ee: avviddec: Refcount codec frame associated with video frame
* 43421c2: Release 1.28.2

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...streamer1.0-libav_1.28.0.bb =3D> gstreamer1.0-libav_1.28.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.28.0.bb =3D=
> gstreamer1.0-libav_1.28.2.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.0.bb=
 b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.2.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.2.bb
index 70dfe3206d..856c883816 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D69333daa044cb7=
7e486cc36129f7a770 \
                     "
=20
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${P=
V}.tar.xz"
-SRC_URI[sha256sum] =3D "e3c93db7da2da3b2374ccc2e7394316f9192460abdea816516=
52791d46ccb8fb"
+SRC_URI[sha256sum] =3D "45ba65535870aa7c026119d2e90b35dc760e1cf6f50bffbfe8=
d71223a3043a4e"
=20
 S =3D "${UNPACKDIR}/gst-libav-${PV}"
=20

