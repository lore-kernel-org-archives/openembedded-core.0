Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17952C56203
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 14:11:57 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17285.1785852710341285836
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 07:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=PN3bdtlD;
 spf=pass (domain: ericsson.com, ip: 40.107.130.50, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xO65EJJAp4z4zaYbrg/WgMeqWO9a1X2SUasGPSt+l0SOLKA9AbTNg39XzO0+CGYlYb3Tfyiku79flG6aKw965bmSm5B6caMHJJFKDUXyZoUdimyq37WmSWmtk5eu2EzLeXCPoRTNJebmLnmtfodxCIEbBR8MKNzosyEENrMm4lHQiu7xVh5awAesP7yykMZLeKuH21vF9gNbykyVVOu6IB+lQO1RDnGHsw+NUNX4/HBCI5qBeLsYVaF1lDw89bDIUwtAGIY+DXeW1tWamHigdXqImi11FTcy3+03KQEC37y9Nxt3tXCPVppc8V4vUk1ZvfcAfT/WYbP7oMI4wvvfpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYNP+Gg3QNh4jq4Es9yOPal6PfzzHs33TBR7YKylcVE=;
 b=BjBwt2kLY8pY1znz87NQmg/67Fdf5ks+AYG7VRYKkOEZ9Kfn1wIC27LXj8bhTrghi7R7VLE5iuU1dZ6KKQWUNIvMyiDIEc0S8DzyKoi7twLBljih9O8/Z4X6TiQqmA2E3lQCuZkT9mkphYvP8qU1EB+e4WjF84HJLT+RapA3Hd649hgWvuwYktWO3DNbiS8/8p0IgzbD2Kz5WPnpYinlheRDzqeycLluyrWTCUvWyKYXZ+WoJeiaQdmPpLrJ9iMRnYncc4JSWw8M55CGnnReFMS3/oqgaqqqL46HmwJk4J2v5x+HDF58SEUW99jZUIbvypmfJp6pUXTIY64NBCvAVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYNP+Gg3QNh4jq4Es9yOPal6PfzzHs33TBR7YKylcVE=;
 b=PN3bdtlDQW5OjgPN6BkexWXvWBGtfjTBXP2GMk+G3BNSfoASLF9oBbuVwP6Mye6ZYn7IwajsDU7uv95FRXJ9+9bP6I2BMnhPu5aPQ2HfPU2q8m0yDrC1Y65XdxdbTbIshojlWOJe8onXOLXSh1zZAc+PMJqi/t9U0ZRGCNwtzGQv8iULfV3QjE/j6rTE3Lrwx0sKUxZC5p/yjVN6snERNPJ+7kCwJnS3d7no2raGh8+ecfwcig4tPsMfTmY+g+y8WlB5RJO1DQzHani+0/JN/0rJZOcc1LO3PtopCsekViRYefAwS0KNQjaOia5WlJjI4kXzBldbEZE2a+s9hMaKQQ==
Received: from DU7P191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::32)
 by DB9PR07MB12367.eurprd07.prod.outlook.com (2603:10a6:10:614::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 14:11:45 +0000
Received: from DU2PEPF00028D06.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::27) by DU7P191CA0007.outlook.office365.com
 (2603:10a6:10:54e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Tue, 4
 Aug 2026 14:11:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU2PEPF00028D06.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 14:11:45 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 4 Aug 2026 16:11:44 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 6F4EB4020B40;
	Tue,  4 Aug 2026 16:11:43 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 3F48F700DF49; Tue,  4 Aug 2026 16:11:43 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <elin-upstream@mailman.lmera.ericsson.se>,
	<openembedded-core@lists.openembedded.org>
CC: <richard.purdie@linuxfoundation.org>, <paul@pbarker.dev>,
	<Randy.MacLeod@windriver.com>, <alex.kanavin@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 1/7] libxml2: inherit upstream-stable-release-point
Date: Tue, 4 Aug 2026 16:11:29 +0200
Message-ID: <20260804141135.3779287-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804141135.3779287-1-daniel.turull@ericsson.com>
References: <20260804141135.3779287-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D06:EE_|DB9PR07MB12367:EE_
X-MS-Office365-Filtering-Correlation-Id: 6117a2db-eabc-4839-6565-08def23250e2
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|13003099007|10067099003|56012099006|22082099003|18002099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	cDwU0MHK6jsYFUcW22FzDGgWOIvjSRmKqDvjK7iMgFrWrC4fWkuQpk2MVLJltqhYySnzMfPfuaKU0bod8449zbbQA3Py9R0eDVF8QdOt0oe3bH6rDTpSxLkL5OOMor0m11TvIE9GiXWd9K2NRA3U2bpsP+URdlS5AYMLvPXFBt5pXrpXY5Mv3czOwScoYbX/1tzKq43CDGuT5ksebTTN4qwGr4Sp4mhcwE4DI7EDVDv6Fjo2PUrLqc0pFoKG+GdXFnQGOZj458LEQOImymH0KYGwLpDqc+O/EJzEbw8NSWpukDB9covNJi+Yp8YELLAjrpC6/eatvG2BxWzfiHoG+V/HsRu5U7ATVa5ZifO/jPbl97QLGcZYnSQEa45Nmhb3XSQHnP3R07Ei494li58dKV3kZPixK3/qJA86TFMhKsdfrkJQirHWH/l4TM3JLOE0BRLtU7DxCGgQobpAgT+5wTVcw7FktUxBmNcbggz/lh1oTAA+MazCejLxowDhghVaS6MaWbd3a5YlH7+XYltYfKlzWeBdddtlf2x2mZDDabso4ziUOzOO6r/bMPHBBLAIx+6sfu5WNAED4yO6O9LQ35kB2CvlZQxpX8/VaAWew8FOAtRL352ghOxhMpYL4n2uc8K5bbb9t41NLxScWYFYZQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(13003099007)(10067099003)(56012099006)(22082099003)(18002099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rClal4EIYuux4mQb9z0H2IAGbrtuUi1tumSeNAAwsGblo+c64EE4axrl+E6qdmoA3GwxgDcw5LVUul1znk3Cvxfj0qw4l1u8BUyiAdZ17bsAAPo4xeocfeBKH9DL1yLfENjNWYfDtUMmJKbG1dLDPggSHJg56KXFe2aMKYmYuJaLG95jPos26YUIGSllMlMRmPfW3ceUEpflTshPvPg1Lmq64lhJfBn5XOmQVXf2wK9HZbQvmNVd+fzG6Iqt17lMqzwnTbbCfOpI8nwPPEvA8c4qSEb+2kheK0PimdTUQXFfJ99sPUlk26Oj2jm2SeV30dzP4T5ktJOO7KxCPt76pFInDi6R4HUUrgDxJuSOqSzhWe/adtUQEh611gz5YT98A1+AVtG4s6k8HHrwhjrmXcGgSrPVSQsLtREcM9a8BCDsM3Eh56CriXym5lyoAkvt
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 14:11:45.1693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6117a2db-eabc-4839-6565-08def23250e2
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB12367
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 14:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242766

From: Daniel Turull <daniel.turull@ericsson.com>

libxml2 maintains per-minor stable branches (2.9 through 2.15) that take
only bug-fix micro releases, and releases from several of them in
parallel: 2.13.9 and 2.14.6 went out the same day, after 2.14.5 was
already out. So upgrades within a major.minor are stable point upgrades
per the OE-Core stable release policy (ref-manual, "Stable Point Release
Upgrades").

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-=
point-release-upgrades
  https://gitlab.gnome.org/GNOME/libxml2/-/tree/2.15

Checked the last three point releases. 2.15.3 (Apr 15 2026) is five
security fixes plus an "Improvements" section that is also entirely fixes,
and 2.15.1 (Oct 16 2025) is security, regression and build fixes. 2.15.2
(Mar 03 2026) is five CVE fixes plus one addition, a --xpath0 option
confined to the xmllint command-line tool.

A public-header diff across the three shows zero added, removed or changed
libxml2.so declarations, so the library API and ABI are unaffected by that
addition.

Already tracked this way on the OE stable branches, counting only bumps
since each branch forked: kirkstone picked up 2.9.14, scarthgap 2.12.5 ->
2.12.10.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/recipes-core/libxml/libxml2_2.15.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.15.3.bb b/meta/recipes-core=
/libxml/libxml2_2.15.3.bb
index 369f27ad2b..8b0ba29412 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.3.bb
@@ -31,6 +31,10 @@ BINCONFIG =3D "${bindir}/xml2-config"
=20
 inherit autotools pkgconfig binconfig-disabled ptest
=20
+# libxml2 publishes bugfix/security-only micro releases on its per-minor
+# release branches.
+inherit upstream-stable-release-point
+
 LDFLAGS:append:riscv64 =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is=
-lld ptest', ' -fuse-ld=3Dbfd', '', d)}"
=20
 RDEPENDS:${PN}-ptest +=3D "locale-base-en-us"

