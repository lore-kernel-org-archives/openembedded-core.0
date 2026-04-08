Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19CE105D9A2
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 03:21:30 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.98303.1775618451414543395
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 20:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Fe2NP1Rz;
 spf=pass (domain: axis.com, ip: 40.107.162.50, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tq6n0SEoXyBX7vTkk847xyFH5C7LUkaNe8x1R7Ebs5kQincYvtgJTCYQQsl6Pwe38CdmOkYviTr3Yv/7aW1NU8E1lrDm+dDWA76VafZnxKiW46bYQVQ59rbm08pIkYti6b5VKxZE089wjSHeaB8gPpsioboP0mf17NRfVLh/OVdFTXUYZo+jIPjDdqO7ACjTrWHi9SNp9eR4e4y/oCvfJ5E66+VZKgV6hOEZV+9ed4XFEx5S5ObbiplNBIFVAhLabPuk5RI5hUcvdNZwD5vHHhijb+BvnvOwn0OZPm3eT3p/4AedfWRFjjQR8rVv8B4EmdvBGn1/b7pjTGQsxsrQRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Nw5v/4KGo1oi7XcKUN7sNb3dNf2i1WpwLo+YvEzKQc=;
 b=vmD6VFK6mIe3tnu/N9b3cGi5CruSdbtl+dLtrXPnFAnvHCyshhQ1f1P2jEJKBCJUnKq+9ybqTthr07cnAeBn/RwS1ZYM0ftppox3+Ja+ODMHETRndklAe07zWljvwekvs/wLBTjv2t1j5pNfXMQxlbiTYPGn77LM9TODWdDn1r7NMG3dQeEGIB6uMmf+bFpCaCdsJtOzVfL6Xj6kvRw8TPxTy+A15H96jDKZ7MeaXK1+wZIWbVs9cF9YT7jlEjiXY0C9Lfa/qT4/y3iPGxRDqTVxa/iMAq6xBad56PwlzekIi9LBz/uLOkhRxwTIuDAWFCQga8DjxNpODOZZBF//og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Nw5v/4KGo1oi7XcKUN7sNb3dNf2i1WpwLo+YvEzKQc=;
 b=Fe2NP1RzsieYCpo4tPw+PgBaOI/+Carf4pKT/lqoA316seLvYjZNxz+oVJbExAWKL0wo5Dxpo6yMoRBTLAEESTtJU7o/UzsKEFS541oGXnj18jAbBMN/QiNjeLFq/6lQO4ts6FOtkeVcCjrxhA5ZLQqmErSpRGDhOoO+efZQCBM=
Received: from DU2PR04CA0089.eurprd04.prod.outlook.com (2603:10a6:10:232::34)
 by PA1PPFD3E722C3A.eurprd02.prod.outlook.com (2603:10a6:108:1::260) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.38; Wed, 8 Apr
 2026 03:20:45 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::41) by DU2PR04CA0089.outlook.office365.com
 (2603:10a6:10:232::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Wed,
 8 Apr 2026 03:20:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 03:20:45 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Wed, 8 Apr
 2026 05:20:43 +0200
Received: from se-mail11w.axis.com (10.20.40.11) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Wed, 8 Apr
 2026 05:20:43 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 8 Apr 2026 05:20:43 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 6F0132AD7
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2026 05:20:43 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 6CFD7121DE4; Wed,  8 Apr 2026 05:20:43 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 07/10] gstreamer1.0-plugins-ugly: upgrade 1.26.9 -> 1.28.0
Date: Wed, 8 Apr 2026 05:20:20 +0200
Message-ID: <20260408032023.1810147-7-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408032023.1810147-1-pkj@axis.com>
References: <20260408032023.1810147-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885B:EE_|PA1PPFD3E722C3A:EE_
X-MS-Office365-Filtering-Correlation-Id: 67c5624a-bc29-4170-6771-08de951dd298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	MlJka3b8+O1nQjdFBZ25X3NLK+fOIQNpmFgyzLHKjFplRXoUDljAMa1gLy1rlPxxWWhaYnrAK1cCutQrQVSnZuG/+aySOixC8Eo5ydOv13vJWXcEeNiFtq6OATCc3mrO54hT9e9bwbceRRgAbWs4ao+dqYhTDaCmP7LBt1KnbJEGTl8rKokoeSLfeUFP0NanJ0iE2lcHppOUtlkBkavTVopdiH5eDMTYfmXRE6f3ZLzTWEK7+asZYqM8u4FddmCGONzVPu4M8R9rG8XJN6wFlIEq4fmus9ZEnsvm2fqnokXNyB5OUeWWIP8+DOLzVv4ubBCDb/56iTHXVhh+blCJUGFO2JKk3wT27iViJ4932o7dDZZIalLhnZvm7LVMyyBGVKo6QZiY+rvq5BHLmJvb0rYb+uEUqsFYNV7OZKS+LZKBK9w8BnYzao7dvXhYNZ7q0NizWhok0gRb3YeiNxI6QbH+FDB1nvLjbiEfaeQ96uFozzN2qIf1BzhXoPwB3ahX4z2tNrSAtEu0AUXt0UdEeQjOjhjZwY0+icuRvNKpPdy/Bx/jhvc8hippqDluVoknKbDnMb9OkZrmmFKdbgIfQOMcbHsJZ+50xvKwL86GP7V/nuoYDBL389DwWa1pLfs0GXTz7BK7vd+JSl3iMWJPfC4mG9cwUwt2OorSg39Qve+qG6S1mdYO7Vqloon6xL1FaHZAMRI+Q/q0ViYNlti0Ew==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	FeFHvJ029BiGB1QHaeSOSnZ8FsS5RPdFmOfUz8vbbI/LoNCWqUu9JMhJH2WhJaAFwuFF1OCIMReN+hKoPRiOT417JVgVm7VZL8Vo0DBJCrXdy8W9d6/P45UIOfmTNG8m5EXt4jdM1WpSRgHMHZVMuJQJ2+r/ezd7VXdBQwRjvgW1VRntDzB4OoVhbc2HGJJmOlU4d6ilijFga5FlXhtfMdwePrB79PaPicDzP9Xt3uHRcXXJzDMx87oCWCymzngCfh+HzyzrAHMvDdjqq7trOAMMbpvSh9sAV+xDgOjf2iXwcxoKstYh30aivebHRVrD379jntyimV0RsJ98Y3/d+VEVRobc7Yuv6SGfYcme9aBLWcYgqcBLiz5zTGQbE0jA9svS0wuI1w4dp4QgVsXU9zw9Su1YazERVkV3FKCqb5BqKmmY0NLPuU+XV9QraTv6
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 03:20:45.2501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c5624a-bc29-4170-6771-08de951dd298
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PPFD3E722C3A
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 03:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234802

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: No changes.

 ...ugins-ugly_1.26.9.bb =3D> gstreamer1.0-plugins-ugly_1.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.26.9=
.bb =3D> gstreamer1.0-plugins-ugly_1.28.0.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.=
26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.=
0.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.2=
6.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.=
0.bb
index e04bfcc81b..94fdff5b05 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.28.0.bb
@@ -15,7 +15,7 @@ SRC_URI =3D " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plu=
gins-ugly-${PV}.tar.xz \
             "
=20
-SRC_URI[sha256sum] =3D "184e4c6e765bc463ed806b2263cb9b2aaa3a65415df0a3c22f=
d520d5d1bacb4d"
+SRC_URI[sha256sum] =3D "743f28b93c941e0af385ab193a2150f9f79bc6269adc639f64=
75d984794c217c"
=20
 S =3D "${UNPACKDIR}/gst-plugins-ugly-${PV}"
=20

