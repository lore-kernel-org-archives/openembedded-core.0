Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EEE9CFC277
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 13:25:36 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11372.1763731531637690307
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 05:25:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=LFd6eVSP;
 spf=pass (domain: axis.com, ip: 52.101.66.37, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtCdo9pQw6U5tRg5CL20vwaJUJ6huScxghtjqJfgXosq+8fRNc8aSKWk8S9iAnS/EsO0gP3H0Jqlxtzny6eH7s8iKvHk/n+vGSKIoZTZvRUuB6sQZ0yYFaHqf9z4nE9HtjvFOxCAwPHLCfC8ULAFC+vDXWSczKdgC6LKIZgMB6lJIq7amqHVSbnYwVPFg2g0XXSsWZmXGhFli3Ub8qHn0LV4ikn8A/KdnbqD87rW6P2VXELg4N09B4eRBu3V8BmA8EDYid1Hu+H1DTFqej8qF12qw9mS7SpgGCoexQQ3n6Wp5LHnjTKzda15TKQvmR2dgoSw3Jy2dAwehh+mgN3yEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWAbzhjxQk3GfoeDCJGNnqKZcHTemOV22YnhZmg5C+0=;
 b=QWzZJJaRTdK7eZbNkjVWGRnGjOSci1zIAYn7CslTEKdb19uHcX+6TgsD+tOq5Bjmk7egtnWf7qbQIRwOFqzq8EIEzR83sckYdHq8DObOCwxcuxYV33YAD7q4ZUHgr7aCi1JzKmgPIXDLgvH9V6jb1sdRLvdnmwRTLLiWSo6lXhPbWMOM04zjTlByy9HT0xTiv0X96MYE/PKRqo8LBWRuO/pUEKC/tPbNOl5OkSOHyFM451F/mgrRt6pV8LdHkpT1JFyvGDoCNlK1vy/TubhXuE9E++Xg3EtWg3RYxpkx3KQ+HI/jjrfw/PwpWmRwjyhFOjLT8rBjEjzViE2SrbVI/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWAbzhjxQk3GfoeDCJGNnqKZcHTemOV22YnhZmg5C+0=;
 b=LFd6eVSPMA7b/mf+oTHH+5PD9ahFuI8qiFVuNHYzbuyKNWhVWQIvfiKMlSjFYDj+g71XykFdtJtjzb2P7jD4FkgRN8oCOrZc+IhpSKRHVKA2o9LbRhXQhSO0EUFPdy1URB8sztl3Y0/2vasUeIGGerZqqwSOcDKg2sCHg1iiiuE=
Received: from AM0PR02CA0172.eurprd02.prod.outlook.com (2603:10a6:20b:28e::9)
 by DU0PR02MB9634.eurprd02.prod.outlook.com (2603:10a6:10:421::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 13:25:27 +0000
Received: from AMS1EPF0000004D.eurprd04.prod.outlook.com
 (2603:10a6:20b:28e:cafe::ac) by AM0PR02CA0172.outlook.office365.com
 (2603:10a6:20b:28e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Fri,
 21 Nov 2025 13:25:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF0000004D.mail.protection.outlook.com (10.167.16.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 13:25:27 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Fri, 21 Nov
 2025 14:25:26 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Fri, 21 Nov
 2025 14:25:26 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Fri, 21 Nov 2025 14:25:26 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 9FCD932B1
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 14:25:26 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id F39D01200D3; Fri, 21 Nov 2025 14:27:14 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 2/3] configfragments.py: Make list-fragments fail early
Date: Fri, 21 Nov 2025 14:27:11 +0100
Message-ID: <20251121132712.3970921-2-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121132712.3970921-1-pkj@axis.com>
References: <20251121132712.3970921-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004D:EE_|DU0PR02MB9634:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ca1b997-3a94-4d4c-aed5-08de29016f68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tsDDyJPkPYH0xnkHSVlUdcW55jppA4R4a3YisbKGkrb+XQJAkDooBwrgfE0o?=
 =?us-ascii?Q?Q88Jt+LEjK6IuaMToTqwJ1CjcClNS8VriHN+iyYMJTEtRZNuL08D5OPbqCUh?=
 =?us-ascii?Q?v08BzQbkGkEWGaoCcT5qQza6T2i3y/1ifDx9UOucFPif3FmIgCcs/MuwS6ve?=
 =?us-ascii?Q?yaGve4V7Z1MfQFT2rcCS5Zf2Ih/uXqlfH4VJbyVzgl3K0gfb+9/gHLd5unFA?=
 =?us-ascii?Q?kRVnELMnAiDJLCzwFMapJWHzm4dOGfyM3+gOTIDYPWohHsh67NdwJJWVUxij?=
 =?us-ascii?Q?EFOvK+t3LPRux9bnw8J03noCLeimeBxcfGYjWBTI3rQj0FSOXbFo5ABnDx30?=
 =?us-ascii?Q?CIFizUe9weswVdsqkmAZawLj6t7Kee8KNxYhY72TZ94HApjzQ72+JGGOIjWt?=
 =?us-ascii?Q?JIaCDtq8iDGrCM+8xi1VzhVpJGHGi5YQDFeD7z7PXBXdKDzDhD1e0abzH7o4?=
 =?us-ascii?Q?0ajHAGSA31Q6V6qKHsF5Fuo0HPzmvoxFILO0Y0YkfgIX8FiGON9pbl3echpK?=
 =?us-ascii?Q?HkAumoDjXNTiHQ3nG9+V/g0hVjuhb4aoWRP5Do6p2Dbg8/eLrU0+Fg87kqi+?=
 =?us-ascii?Q?fyYc4hfeP0sGW6qnpqR2dsX/dMo3IwZtFQhYxkcl5lWLDgrAOiAPPqybTYyM?=
 =?us-ascii?Q?fZh17exBq/e/QVZcR0aS8avPnO7UnzLPoZl7/5bDCOGbKeKRM7T3zYuHWlFS?=
 =?us-ascii?Q?6nIyvOMIrM5cFo/71gYWpZadlrCgpB+VxNgmhlGMxpkXsP3Im7vbQX3WGehK?=
 =?us-ascii?Q?OU+ro4vhlwOFqogea6u/dS4/Tyi3uvYpydVBeTXR6bnCo/jqIc1j8+vrLnqx?=
 =?us-ascii?Q?Kq4AV48KVxApVuZbVE5r9Sz2y01z4dKIb0bMceyl1zEHQhIIW1D1jVcYjNz9?=
 =?us-ascii?Q?0N1bO9gqm5FmOYuJ4zDcfuue77KTrkKLNRh45Wu6QezxkowkHvMIwRuKkYQZ?=
 =?us-ascii?Q?JFDvzaaQHZQ6R1ah2uO9wufsY+IQzdp5CywQSEIEXZlwzDnPNJOgzsngoYG6?=
 =?us-ascii?Q?w4X3+R+1uprSHUwrEG/8cJvGi4cNiPcs4AmAZ3o3vwygCjdQE746yfI0ZF/c?=
 =?us-ascii?Q?ZZS7TI0quRES6botwJZED9JR0bppqR92ocjrbnMBbKlNtguFXOVa+6bopjPS?=
 =?us-ascii?Q?TUjLwVcHmGJbg4BF1D+6qlJw77Bn/+VF+LY0kcDFG55XNhD5X4b0/zFThqtb?=
 =?us-ascii?Q?nkujuXK6DGwLWBaoNy/led+Zcrwu8FS109VuoxAPtvgJwzHog2Ur/RkCwHfn?=
 =?us-ascii?Q?NuAzCumQavaVGWbqz0wUobIiLNcJa3CqY2XN1RR5oLyuBK3AooTnbQ7J5o0l?=
 =?us-ascii?Q?C3//PucIUIVytI2x3GfOaDyKso6jNUZcLFAW6L9buiC7ih09x41kdEjA1ED1?=
 =?us-ascii?Q?0v6WxJJ3AQCDkKWkZ70zPLCo2g0l67XCM08sqIJu3XjyMreciWHge4054+jD?=
 =?us-ascii?Q?YXz+Gl4Jhg8TvVcTsZ/mPt+g2ISAJsl2TE9ycyve4Pjzhzza4VbNem0JX4jm?=
 =?us-ascii?Q?8v21Fa0OGVNB0MALpVnV00Qy+IY5Lfbt14O1FeOSxuhxHqnOTGNMmDkaxfOl?=
 =?us-ascii?Q?0dz87RrbQovy7dba7HM=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 13:25:27.3627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca1b997-3a94-4d4c-aed5-08de29016f68
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9634
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 13:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226681

If a fragment has not been configured correctly, make list-fragments
fail with an error before it has output information about any built-in
fragments.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: No changes.

 meta/lib/bbconfigbuild/configfragments.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigb=
uild/configfragments.py
index f79e238297..15142ec9f9 100644
--- a/meta/lib/bbconfigbuild/configfragments.py
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -75,11 +75,13 @@ class ConfigFragmentsPlugin(LayerPlugin):
                  print('{}\tSets {} =3D "{}"'.format(f, builtin_dict[prefi=
x], value))
             print('')
=20
+        allfragments =3D self.discover_fragments()
+
         all_enabled_fragments =3D (self.tinfoil.config_data.getVar('OE_FRA=
GMENTS') or "").split()
         all_builtin_fragments =3D (self.tinfoil.config_data.getVar('OE_FRA=
GMENTS_BUILTIN') or "").split()
         print_builtin_fragments(all_builtin_fragments, all_enabled_fragmen=
ts)
=20
-        for layername, layerdata in self.discover_fragments().items():
+        for layername, layerdata in allfragments.items():
             layerdir =3D layerdata['layerdir']
             fragments =3D layerdata['fragments']
             enabled_fragments =3D [f for f in fragments if f['name'] in al=
l_enabled_fragments]

