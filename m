Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBDEC5B555
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 21:31:44 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.17])
 by mx.groups.io with SMTP id smtpd.web10.19756.1749159094425485630
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 14:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=oJvR0jZX;
 spf=pass (domain: axis.com, ip: 52.101.66.17, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDp9RqgH8kKxpdeGy5VCF4sqoiaukoUgProYPXxJw5eQPO3zujjQ5jtKsKv9kslNJo9v9bDbqc7rEPfV4InrYoWt+vA5TQxegcYXFA7/bkmR0pMjazqlE4Ds4UN2gIKp07URjBPU44DYr+AXisapF5YFeFnmzIRS+UHQfjQJJXROhhy80ZWR+M+IYOOw9l1GhUd3dqeovLtF4LnDgDQlh+Se9SsVzURTZcjHRHlasCHRCO3uv3D2WpkZRT6+yOzJA5ZURHuZyS0cjp4aHxV9cMRJlMk/T8rtYVJXDN4DSpn7a4za6Lhmt7eFVoogeSQWORl7E3exnqBjMA/RnT3fgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJO6brHjOUP0LzfhPd1bBrAMX8WnbWF/PpdfkrY4O7g=;
 b=l951WDwrponrhRzFlFw0lB7NEhcWKMykjb0zfQEiaC5gg71TW0SM6ganoxiT9/3ELDBNHHVBN+3Po/6vF5IxbIaV8ndKJYVDXNUbXRXGPtoOVZnq72j5Hj7HhmpsSclvDg6KRwfv0kNv7cwBMuGVBW/m2+15M2tNWh2mRoyMjfnMM1umJ8K6O96EXANT/GbDxlWHU2tv/WqmHe3aNUBFrTFgh0xjygw7+4GVRmNfznCDWbjWQoASSWb1K7qNLRBsLQP9h7mCngqvD0PATnviSWGwVluzVTSwMB17HaUJakUDwxt/B8V+1art+0H2IgtMDqB/zsHUf4sGkAoxiI+MKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJO6brHjOUP0LzfhPd1bBrAMX8WnbWF/PpdfkrY4O7g=;
 b=oJvR0jZXBKO1V8XbdQe+vJhV/Fi7Q+QeNH3rCGg1W3pDxt9U7MBD+OF51APeo4OcR76BMst5tmEn7Po6LSgupZNlVZLe0OUqXCNb14GnDqyitnm1xJRvX1GTDP4c5YVqaWrSGz4q3xW5NArq/gNdHQW115Q4XbPPatIutbF1uS0=
Received: from AM0PR02CA0095.eurprd02.prod.outlook.com (2603:10a6:208:154::36)
 by GV1PR02MB8684.eurprd02.prod.outlook.com (2603:10a6:150:90::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 21:31:28 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:208:154:cafe::85) by AM0PR02CA0095.outlook.office365.com
 (2603:10a6:208:154::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.32 via Frontend Transport; Thu,
 5 Jun 2025 21:31:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 21:31:26 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 5 Jun
 2025 23:31:26 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 5 Jun
 2025 23:31:26 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 5 Jun 2025 23:31:26 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 210071497
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Jun 2025 23:31:26 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 17CD81291EB; Thu,  5 Jun 2025 23:31:26 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv3 1/3] util-linux-libuuid: Set LIC_FILES_CHKSUM
Date: Thu, 5 Jun 2025 23:31:19 +0200
Message-ID: <20250605213121.2685855-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A795:EE_|GV1PR02MB8684:EE_
X-MS-Office365-Filtering-Correlation-Id: f5a01df4-46b7-40e0-7e27-08dda47853eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VGAe6354+gEPAMfvLfsoTMj3HVb5N4WM5WuS3Wmg1wb3jfyPxzlx2UDGw4z+?=
 =?us-ascii?Q?c2lsAEezO70vNGh8jgt+2842Qa6+kHIN2Sa0hpcezp6w7jUC84GJockk9PAJ?=
 =?us-ascii?Q?hFvFpK9bhjmO+IcCXt06Sc/z/VNNjgqH7ActEJWdweUjArE+RwPK16um0blq?=
 =?us-ascii?Q?bMDoQrsZuPzMYEAIMbXbEIKzn5DyIStdikDJpwhIol8RYomz5IpkOoo2/5g0?=
 =?us-ascii?Q?Zet9X/2GuVvdF4UdgsEBZBL30p/I1NKgsj081liETtXgvAEsK4aGPfFIP+oP?=
 =?us-ascii?Q?JiSmYjoYfeL0Y1AZwZiqNXyI95BDYeTSecUObRGHsD97I3ubneouxhbCwrmT?=
 =?us-ascii?Q?YIj3ierNj1DE6KfSb6nsl28IWyx7LUdZhA31lxsHn8/kUyE6xTeWKZ7ZLUEt?=
 =?us-ascii?Q?rniqfVllxbOzNb00bZzBdmKGpHQQZnaWPPJ+c9GEmR7K9xejZ4lrLnSLPWyt?=
 =?us-ascii?Q?jMPVZP2Ng4wWi1/l4VfMupLgpl5CBlICX0BU08vQTkWOXRdy/R98oA57uXuF?=
 =?us-ascii?Q?R1awDFIf5I9ynWI757yymsu2fjglhPok7M++Ez2egd4jVhFU8sWy4qWFmYAX?=
 =?us-ascii?Q?EM9igqVEPEPVq4vp+2CB7nIpGeOc8GHsRvTPumtohGSO1COaTLIY+Ucoia2/?=
 =?us-ascii?Q?N9t+R2JcgnsEt0Hq688TsSqUnJzVHBBCYYqSXz2jnmtY9Mu5qK777Q6ilOPg?=
 =?us-ascii?Q?9UH0Fs9KxUDfY7xPO5OOpnIVOydemwupOUGz9lJNPpSxxbz1g0zuH28OtVZe?=
 =?us-ascii?Q?SwazpMXtS2mnl4WoBlj1JY1LRznQ6t73sLCBsgLcqTpi1o5N3nJBWdJ2oZGB?=
 =?us-ascii?Q?IroGJ32sewRPFc9oeYolhvlinhdNvGV5hOq4ObxYga+l+LHw7L8fXsQ9cEcu?=
 =?us-ascii?Q?Jrb7my+UHzeoDVLgsFd2RwBMxKYO18TQdRPNQW8KZZfaA4SBuEBrkRURoZaT?=
 =?us-ascii?Q?weyFd9X5ILDAcPYgrKNO/160092AKNwKl3Im3ZfJWRbmZx+vR15c1t4MhW1Y?=
 =?us-ascii?Q?+LkTNZhLIEEhbaBWcbyREHA+y9WNsIX2iN7prGYzB7QgVwSRiam3FigwiICN?=
 =?us-ascii?Q?FcS0jCFoTu+TcFvwlKZOOslVYVyJkwfGhm5uaWvZiK/ZPtrWSxBUn9ASPefp?=
 =?us-ascii?Q?jOQRxBsrRFLxHTEfOf82SsqGnL17EdWVTMErwHSnopdVyrBNHTOy4t/Alnhc?=
 =?us-ascii?Q?qF0mpp9rwPctElUbbbEkcYqq9kt48kRR6oEfcvhMzYgTIyxVI8YKbFzLjW48?=
 =?us-ascii?Q?ujJI9ARUpnTwKf1Bsuhlcv0DRhnhQipZhbL5wIeAUkkNEA0vFCqjO5qwW3tf?=
 =?us-ascii?Q?bGozJUQ0ToZaxl1Iuuq9caaICYL8DYeU7yscgr6X+5OW5CX8i062VZbAsgHC?=
 =?us-ascii?Q?zVgA385eLnY6cmIKjRHsKvqEEZ2Fx830kBlI3wuzbQT0wtoHUbjPAnVrUGup?=
 =?us-ascii?Q?ZoChwP5uewA8oSQEVfeJDDR5RGNCgWe/lGOI/t3/UBWE7QNZ7KPNMIzWTHdx?=
 =?us-ascii?Q?Ovxn3TgxzFtavYaxVn15SjL2rY4CIoO0cvkY?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 21:31:26.7069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a01df4-46b7-40e0-7e27-08dda47853eb
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8684
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 21:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218085

The license information is not the same as for util-linux, so set it in
the recipe rather than expecting util-linux.inc to set it.

License-Update: See above
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv3: New in v3.

 meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb b/meta=
/recipes-core/util-linux/util-linux-libuuid_2.41.bb
index ec04c1d3843..ad0bfa1d129 100644
--- a/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb
+++ b/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb
@@ -3,6 +3,10 @@
=20
 require util-linux.inc
=20
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://libuuid/COPYING;md5=3D6d2cafc999feb2c2de84d4d=
24b23290c \
+                    file://Documentation/licenses/COPYING.BSD-3-Clause;md5=
=3D58dcd8452651fc8b07d1f65ce07ca8af"
+
 inherit autotools gettext pkgconfig
=20
 S =3D "${WORKDIR}/util-linux-${PV}"
@@ -10,8 +14,6 @@ S =3D "${WORKDIR}/util-linux-${PV}"
 EXTRA_AUTORECONF +=3D "--exclude=3Dgtkdocize"
 EXTRA_OECONF +=3D "--disable-all-programs --enable-libuuid"
=20
-LICENSE =3D "BSD-3-Clause"
-
 do_install:append() {
 	rm -rf ${D}${datadir} ${D}${bindir} ${D}${base_bindir} ${D}${sbindir} ${D=
}${base_sbindir} ${D}${exec_prefix}/sbin
 }

