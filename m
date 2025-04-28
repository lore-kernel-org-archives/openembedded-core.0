Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE0CC369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 13:43:19 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.56])
 by mx.groups.io with SMTP id smtpd.web11.48613.1745847796599456883
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 06:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=d9aNrqnP;
 spf=pass (domain: ericsson.com, ip: 52.101.72.56, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtEQ+bQue7xhUHT14I1zTceU1dGnHEDpWYXwDyMxjCAumR8rA+l1Zdt+QPG/5raQkYEBHdmQrCHfPP+X1a86EQ1ghvR5iHyXzTYv8b9VGA44PFntgLfHAWflZmik1ezEZjCxU4ilkzIwXhk+9heViZOQLmEunG9PDLaPhC0ZaSRy+KM+Ss9JcxlCNIcyxiqSvu7VqD9DelfGhUKTK3jEylQ+p0pDdciAqwO/DijnhbMl3h8vTA6Z7IyAE2DxYEywAm5iEVH2cRtMhhfhQhMRuDJVw3IQ2CjyBh8Wmku42ee2QUcT3LMIdo5R5jPoykRdNwnZQ3o13NKFfLjMJlupNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=piIyb8mYVEkqAsZrvQpXzlmGF86/o2P+/rFkuAjS00o=;
 b=m63dHB7XvKOQpaFvpuRviG571uQoHZDkQJmbbOWbwUbstS6Z0MjVWjpLrGOGXI9/gv8axVBVBlAuFTHMuYROAn/k5qmneTwcLP2yh3/bNVzTFRlGH+em4tzS/OauLm2FTrWwa8mHMUg+AXwNUKm3iCjnpxIRlZnE6X2CUsHdmORxiSKF8A0LCkBqX9+KOggtqeEkloDvn+OIc94057NnnIMbFOJF9R19pGy2usdsJOLGzYVuze8EuQ0o+2d5zIkNwVHLiyvfQ9+TLPTNcH7wXUAJNNSCbls/LJB3W/yQTZbzRPRVsQ7IWjnxzSf/HGv947OkujuZzz25wo3690TF9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=arm.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piIyb8mYVEkqAsZrvQpXzlmGF86/o2P+/rFkuAjS00o=;
 b=d9aNrqnPJn6BMJmt1Ver0ntiIbZMZgE0SkLVcLpeybWHmFDZdbWoz2NVIMKMvE/z3c5TpXFiWcqr9ejo0F/0g9Rtai6vsN+pTgXwJMko2yQir92gJ/+bOavoRDLM1Cka35g+bcKSlq70V43sBwXABSheL6gNDSops8nwjwNPAmMubZwpsIvHm/v39TV2jPQqjfiJkZn2zKuEyov36WqgYITfjq7+cjFLC6Gv+SwJZ2L03KSxgMfNNR72FsrQVSpY3lHZQIIngiTSfipqr1hNk1JaytfLlA/lyJqc8Uvt8deX0ZVzpAUalpIkUSv7cIXw5ap5T7/D+W3U9l2Nix/Yxw==
Received: from DU7P190CA0020.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::34)
 by PAWPR07MB10010.eurprd07.prod.outlook.com (2603:10a6:102:38e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Mon, 28 Apr
 2025 13:43:12 +0000
Received: from DU6PEPF0000B61E.eurprd02.prod.outlook.com
 (2603:10a6:10:550:cafe::1b) by DU7P190CA0020.outlook.office365.com
 (2603:10a6:10:550::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Mon,
 28 Apr 2025 13:43:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU6PEPF0000B61E.mail.protection.outlook.com (10.167.8.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33 via Frontend Transport; Mon, 28 Apr 2025 13:43:12 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 15:42:27 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id A9D84402061E;
	Mon, 28 Apr 2025 15:42:26 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 9594670E75F2; Mon, 28 Apr 2025 15:42:26 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <rybczynska@gmail.com>, <steve@sakoman.com>, <Peter.Marko@siemens.com>,
	<ross.burton@arm.com>, <skandigraun@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>, Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v2 4/6] cve-check: move message outsite check_cves and sort
Date: Mon, 28 Apr 2025 15:42:03 +0200
Message-ID: <20250428134205.900354-5-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250428134205.900354-1-daniel.turull@ericsson.com>
References: <20250428134205.900354-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61E:EE_|PAWPR07MB10010:EE_
X-MS-Office365-Filtering-Correlation-Id: acfb690d-7ddb-4065-c706-08dd865a9ee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zCLFGvlZ2nhVpujsQaiqny7arRV4DFSnI2+a+oGkASrKccsb5sBM4Str9b+L?=
 =?us-ascii?Q?mgnOO4irj/6Q34QkUL51VOMEX54G+Dp+Q777Q7RZ9CRxsXwAZ8Ssbq4c0izw?=
 =?us-ascii?Q?7V7aDB61jgv6FlMdoeFqzRhyLQn7nIeTETMEuAXISVaBEDjfwNIy6rIBgfHp?=
 =?us-ascii?Q?R6xPLte3qVBB2NOol3Im1fVyW4LYin4SWsg55a5hlPJRcVid69/gGRon++uD?=
 =?us-ascii?Q?xvyDjQANmw3VLd65YZzzq87aAJCwJVTVTl49KrBpNHLgttCrbgecpJw0D60w?=
 =?us-ascii?Q?YJSe3hO+/GKLgeCL0iS3yEiy2tXIdqrqxZNa5nWLTavoDLJwp5gwQvHBMsXi?=
 =?us-ascii?Q?kRa+RMfxAi4b0W+9XHGgwo/p9oU+UPbjS/ykGwnlbsU/4eN91lni4i41Cfqx?=
 =?us-ascii?Q?BhdF4P9WXMw6GQf9aPalV+bkLVuAyKJi0ypGzbVPK1g0/SP/lNPu1MkmeheI?=
 =?us-ascii?Q?DadtreENBtQWAyW0/O1Ak10lE7hkfoVZPlrZK0Qo4sz+aF00yVA7LNZZILrS?=
 =?us-ascii?Q?P1XJrwRLBpczg55sbTeKsj8PWAMAMycXyTxly8Nwql1e2f5DA7ydy4ZbUEmS?=
 =?us-ascii?Q?nFUh+eD6q+aYbH6owNz0sx1Ucs8AvX/MR0ZupyARi1NDWxNZFvl9ef6fEFF+?=
 =?us-ascii?Q?xfnoWK0USJa+Gfn5rCJHMxKqeOBvKw3PH4aWTkMGBTNOqagTCVaDt4rg508s?=
 =?us-ascii?Q?m2GwPB04N2YQ5B4NI+VYfv4RcXndP7aRkGmOCEczEOswVZNSSkMiZ5jZK/fb?=
 =?us-ascii?Q?+gIIeXVyWwyFHMYqaqPx/jWZdsCB96HyPlaHYsYUGCm/fG6SWp9RuRNr4/Um?=
 =?us-ascii?Q?z4KVqsQEMYNwXUrLI8nGUeSTN+oxnGxRnpuWFfA0gdoG5dWaIxOVfB63dh40?=
 =?us-ascii?Q?+TryeZSpyLfx+LAVFQdMPGxFrTyeT2leGZbavKClGA5Wzbs12PuxeN69qOLc?=
 =?us-ascii?Q?DwxKNI/EbmPSMAz1VzLL1anmF0gVYg6ZUOiz/rsjUrFYaWytZ8bY7FZRN69r?=
 =?us-ascii?Q?IRwPf8qgP677j36l3xvdLgMYodWx3zfv/b4/qXe0ynyGkTRkF8p4CNZEVI9J?=
 =?us-ascii?Q?WyWKwLyOyKdaylgGotFAl436aMJiSpqz5XpUr/5mpdLuo0X4p3GujMcLYLlu?=
 =?us-ascii?Q?wb4QoHpFnWMZA28CI8CLZExj4IberDBaInAq08ANuAyeCipmMFL1G+6uWUKT?=
 =?us-ascii?Q?F1i56Mi/dd/XZSc2D3rzX0SzNNHOSBXwkZgv80FfqwOSVkTJ0pMEYhnbPjog?=
 =?us-ascii?Q?q7jR38lrHVfl9LKzFgYsAtDuzUYCtMs7dAhne2EtrulX79/g4mrYPq6c8d/v?=
 =?us-ascii?Q?GGVkt9KcNG+lwbH6ilXRdfFTTDx6K1rq3U/VSfjjoesAv6clWJ/JHrtiWlUC?=
 =?us-ascii?Q?3mHdqlszaXh7ughcSqs46RaDWV+s1FfttDZQVIteGb8QPsKCTGdgDJIGfixB?=
 =?us-ascii?Q?/dHApJs/+1FQ7snctaqnYEbaPa5VC5sVeTPIUkENS6ndCTu/cQmJihb+VhUx?=
 =?us-ascii?Q?FZo93UcYX+i6nerkQ5rC6+1sBoUEi1sFaF3d?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 13:43:12.6631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acfb690d-7ddb-4065-c706-08dd865a9ee5
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR07MB10010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 13:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215606

From: Daniel Turull <daniel.turull@ericsson.com>

When adding corrections from multiple sources of CVEs, the
message showing standing CVES should be at the end. Also sort them.

CC: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/classes/cve-check.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index 86ddfaae5f..12159a98d2 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -173,6 +173,12 @@ python do_cve_check () {
             if len(cve_data) or (d.getVar("CVE_CHECK_COVERAGE") =3D=3D "1"=
 and status):
                 get_cve_info(d, cve_data)
                 cve_write_data(d, cve_data, status)
+
+            if d.getVar("CVE_CHECK_SHOW_WARNINGS") =3D=3D "1":
+                unpatched_cves =3D [cve for cve in cve_data if cve_data[cv=
e]["abbrev-status"] =3D=3D "Unpatched"]
+                if unpatched_cves:
+                    bb.warn("Found unpatched CVE (%s)" % " ".join(sorted(u=
npatched_cves)))
+
         else:
             bb.note("No CVE database found, skipping CVE check")
=20
@@ -422,10 +428,6 @@ def check_cves(d, cve_data):
     if not cves_in_recipe:
         bb.note("No CVE records for products in recipe %s" % (pn))
=20
-    if d.getVar("CVE_CHECK_SHOW_WARNINGS") =3D=3D "1":
-        unpatched_cves =3D [cve for cve in cve_data if cve_data[cve]["abbr=
ev-status"] =3D=3D "Unpatched"]
-        if unpatched_cves:
-            bb.warn("Found unpatched CVE (%s)" % " ".join(unpatched_cves))
=20
     return (cve_data, cves_status)
=20

