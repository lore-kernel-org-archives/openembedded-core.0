Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62165C021AE
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:04 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.76])
 by mx.groups.io with SMTP id smtpd.web11.1132.1739286057297610302
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:00:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=inedIyNS;
 spf=pass (domain: weidmueller.com, ip: 52.101.66.76, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qb/T7DkgSZhUej1y6oskzYrfTbusB5D6gaU55wAhjJiEjqKyBD8yCOq61kjXZG0dTX60Zb43teMekgP4bQv5+I7DZRfls9fj+Vwg/Be4Z99H6+Rbl0rAh3EQeQ9ZKsEFBjkJeN+pQ56J8gutOlXoxKiA7E6MCB9PM/PRnK73grySZwiP6ZdkUMtyZkUFh/SQKxP/G3Ids86ok54+uEvLC4yRaJrR3H4kiXLIlKsoimdebk3XUdKWApIN6Hki2B/MAmsn3/YQbYqTfs1f/N104RbIB6WE4KV/p0CrWHwM2VFepHJh4i/NVAA4o6/iDaHXte2/3jCwYJLRUk9sqkwROw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AtXN1ZUzZwvR/+kDUSotb4DmyJklr0t1vZnGhsD6w4=;
 b=MwEwrjtkdFpAjhMUGfVlEu9k70Pj/J0tQ2GZk1sc2uNiwtDNe9ouQkror9hVGdcMajqpMqP3Uzp00xx3SBNQe0KEQpSgKLA1EbVeLfutxOC8rZd3dDAIU2PTN69ehOan9SG7Ps/5XAntMWOmdpF9C3WE8HqrNzgKVX8RdPbB0LHJ1oXtrKA34DiztG0hs/hj8ltFoW9fu3yNz4UGr9Khbd5GvKX7AB3vJnlj4RlyMxjXVgPlp2YnA9E2too7Lb9rahcK58UXwyLTSE1OuQt8YUatb+eJqV+MpGzHbMWPacdX/TV6tRXZRuISBsPe9klbVTxA0aIv+llTMzVU3aJSnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AtXN1ZUzZwvR/+kDUSotb4DmyJklr0t1vZnGhsD6w4=;
 b=inedIyNSlRCQfdY5D85IHZNwMJh4OMx28Um9bGev0lXFha5E5dWaUye9idgCSjwXnn/Z8qlM1BVUXy9+2//9SHyKbFIBkSyHm91n7PEcebOHIciEvkkj+9NW8l3mNsn17pNBpww/RshtueMudxqxBksMKlj31yP+6kaSlEYSMZk3Mfde/rFUxeqEr8ebTgNPLWHIS6cXMRv0Uu7cs/CDkisHJlgtpPe7isoG8V8ScJzl0lrmnF9oZvipSx1Goz49xK6g7u7Ng2oYT5+4nK1aq0xzkWxX9+LVh9i5CUPwXZGitBiUevASGWxO+IGJFYYgeA43B5daIaiL+Oez7wqrwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by DU0PR08MB9396.eurprd08.prod.outlook.com (2603:10a6:10:423::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.20; Tue, 11 Feb
 2025 15:00:50 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:00:50 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 03/30] classes: create-spdx-2.2: use name and version for download dependencies
Date: Tue, 11 Feb 2025 16:00:07 +0100
Message-ID: <20250211150034.18696-4-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|DU0PR08MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: 021bfb48-668f-4e26-15a6-08dd4aacddb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/SwCD31OJa+h8TsSdZF0xsxzTff0D4gCnR5jPdNjzXzZnNjj8y3eHQUhh9qA?=
 =?us-ascii?Q?7z72CJHhDJK0rEoJz7UyK809Pi87PKqXe8vVAnMkT2uRrE4Ja57kzfUcA/xG?=
 =?us-ascii?Q?vW9CINqBBDox6ipjQDSwIq4dMGn0KIVFEwSi0HkqncNob/nYJPRERMNinkKM?=
 =?us-ascii?Q?PclFgp0zr+tIsqAJNXXzeftQLA7c9RI92B15QpkzEb7oCNCnuSMmqHmUW1q0?=
 =?us-ascii?Q?sBafNIMnLVDFyx6Lpv6QI32cq8k4sRXFxDi5cbCLb4le7gDX8yHoVfiaUDIJ?=
 =?us-ascii?Q?P5IyGngDoOgxXOt0jYaoeenZUJoBEw4onlL1diX9oUiXMq9t8qlyS7iNxE8N?=
 =?us-ascii?Q?cFrwxC5+NjHn0XkbrrTmP2OtVgJEwbQexdiCtiUZ5o89PEgw0muQnzjpIZ6a?=
 =?us-ascii?Q?Y3a/b/oZ1BMxH3qYOIy8VD002wMyazgN0icsLtxYOg0HeDLilXdAWy0bqRHm?=
 =?us-ascii?Q?ZE0kJJM9xnTHGmgffADGuWD4nyw4JsUT8nZBA18PYWdUYhuCKZMGVgfpnqZL?=
 =?us-ascii?Q?UMHJfMHrx+m7fsNHkWHxA5YibrzrrYj36pUGb0UyvSB3VU4wyXV6TAQrjb8/?=
 =?us-ascii?Q?8+aLx+Q8evim+jEnTKCDgkWAYDTTJChzJLA6bXvXuIIVBG69UNE12RNlLzQN?=
 =?us-ascii?Q?j1u1JK6iOu8FMHoyMsCKAQwXvs7RnU92rKyBFhoyYO+hDgnK95LQWOLwyLrR?=
 =?us-ascii?Q?ksB3R1cxmWSLN6ddx1J73DAJ9SAY9LhaIu3TSiuBPgP/+dGo3lekxg3EUhjA?=
 =?us-ascii?Q?S6aG+apTTK+EyviVLAW0NYEJWhS9DlAoZHLhNFeVUZ2DyTywj9ELdPJAp16L?=
 =?us-ascii?Q?4BpH084BbBLRHZLEfmz7ha9gUWMDkJE8+ESzvExiJsjits1biru4J7pdaE/5?=
 =?us-ascii?Q?PZhs2/ODAg7n3zrSiTGfhYzeGquY4L3k6ro21r4snqy/FHGOqWBWiek4x6mp?=
 =?us-ascii?Q?2jcXfEX+ItFAilLnc7iOx4GY1eCEp/1uft7cit2akc+/eJ3WYurGOmTNG/Ej?=
 =?us-ascii?Q?Q+5KUpyVnjqLjYbX2VZs/ongACybtfPYeJE+yv2GJgUzY1nO+ypbYfR1teJ0?=
 =?us-ascii?Q?LhiRyVsSsAgqU2h/GVxExDOJrOAIc4JtySoc7xJBqAhQCzFDzTPTSpKPaoJl?=
 =?us-ascii?Q?lvf03rtKRapuSrprg82aer2voMbxDfs+58JiIQxRilosqQ1QrWxujC4My9up?=
 =?us-ascii?Q?YXJgyHteqYV3xA7+p3Ptca/HF/DCApIng+voCpTHCN+F/EWXXCa/+Hlm8jzA?=
 =?us-ascii?Q?SAz3fiswXBCuNxmfySVSDB3NMKRvNB3tRM3yPp0FK33CAHisDxdV332IXW7T?=
 =?us-ascii?Q?+DOJVVn9qWiRIdWu3uvjR6VITmTPturXhgJg2ZUVMlp73jDZ/b3Zi13o8RWf?=
 =?us-ascii?Q?Q4Tc8VE7ffes1iUj2dEdy4IqwvvQ+gY4LwwU/CW0vIS4uJUVOxw9Ovgp7OyI?=
 =?us-ascii?Q?4soAZDHfkM0uAN+zZrwIbni5bSnD4ioY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?guNygFDv3Ra9LCmAs1IzQ+gmTB4OcNO66Dz6Rv/evkxm8hcU/WIK1e6DEUZO?=
 =?us-ascii?Q?2vgKrdn3CYLOqUQz8IZCax+3iBVnQIIcd6S/xXUDxiORuH14b6W2VQzZT0AV?=
 =?us-ascii?Q?ObxVCBlN+ShMtr/g/x9vTJePsWeWpDyt38FJEzX7+GCxT4abtZ7akVIkuSt+?=
 =?us-ascii?Q?O5IJuDTzdqTTER3NIIJ0z6efu8ClKT33toGt5ixwEvgSGFEVTifYzl5F2aUv?=
 =?us-ascii?Q?YnjAhDihXl/PW+/u8Yh5Z/dWbZlYVMx03jjdefhiPDOlvnVYUyqPFjH0uaO2?=
 =?us-ascii?Q?SXyrswkYw9DgoA/Dh6GAFbCd/DiiwApcwDNTy/65L12jgjK5v2697XUHc9/K?=
 =?us-ascii?Q?+TdM0fWGkIK+LCb8kQPKcuxJJIubCrhrpMseW/IS8j/aSEUStQ3n1rxA366C?=
 =?us-ascii?Q?QGnCMKiXXPGfrBgoBSFOnNZ0x8FgxS4+eUWxf8bAJdeozto/3DGGVK1NRBjr?=
 =?us-ascii?Q?bnk4f/za83G74R04ga4jycVsPa8/B3+WdKP7k7uNHIbgrmT8NKJGmB0MWNaR?=
 =?us-ascii?Q?rn9bxiWR8lLGpNVmRujqzKDlq3qMLhp5x7dRO8KPYVXzihQ207gF5+7SOaG6?=
 =?us-ascii?Q?XL1bcCDzmoww/CCoSMbESYHwBQEdD+75Hoq2cIA9Q1aCqnxY38Zus5OglCtd?=
 =?us-ascii?Q?sZ7tB2bg+k8Aqy4joO3eWXv4SHs/TRXhKxgsoZVWoKc6JR558TMjyqebR/Yy?=
 =?us-ascii?Q?lq+i1ZVCLJd2y1rbjbJLSp/zkXv5301cciE/5JtP4/1lmuTIk4Fmqs738gA2?=
 =?us-ascii?Q?7UzdSLB4EgLGfCaUeyvRDBJSFQ1gvXkPA99qE/uCikPeG3sADwe2Ui23RFGw?=
 =?us-ascii?Q?PvnH1XlIGtis9WLQrqAIDKMB4sC0PSZqEJ2kNBUx9xh+OluIHalhHrwn0oOF?=
 =?us-ascii?Q?GI59dn6P/ck7ovkITRgNEVw2uXL1vQ1XcNgCa5shcz93KIF8bdV0AAYHOinq?=
 =?us-ascii?Q?6VSVJJ6MoUDRGE0LWMiUmKdMUvi+KKuphb2jol3upMBtIflFDn9azn8KHtK9?=
 =?us-ascii?Q?NQsdChFU9mj+614+vkLJSlViQ4FkVzEpeKmA1hMrlFsnez6t2K9LKItGQHCQ?=
 =?us-ascii?Q?1RVFWxcNvafDBMUoMzhhV6J4kQtEY4fcBLjQaxuHim1xpIUxb4mrTqwFs0Ra?=
 =?us-ascii?Q?Cs9fqCbm6KX+l3zaujcqf+jIMUKdUJ1fVS/3Z9qXvgpIUwFWNsTwNuo136y3?=
 =?us-ascii?Q?zXsj1deSQYjz1nkBXQfoPuuJk9rq1TpmhSEok5a8Eg1ih5Ty+bG0VYD7hu3V?=
 =?us-ascii?Q?qsDaS0yMpIeqxjV6QZSb4ln/4NzLTrqfNvasFzYog5ehpVLK2x7uj9DOgasv?=
 =?us-ascii?Q?0FZReXIMl5q2pU8bovT58WVQX0W+jiGKkKBlp23sCJwRFzs5WVGF/pGnxPQX?=
 =?us-ascii?Q?se3uwrRe+4U0jSSbqvzooZFqKNXVLQWmTsLLOwm17Y+LnY/RAbIAAEbOvFPC?=
 =?us-ascii?Q?MXp9EZH7odngH38TQuJ/Wx75cavlzVi9AMqNpruBpqVTpQEvf00YbDQNONS9?=
 =?us-ascii?Q?xYk6yTjZrSxFpaMWlstPwVGBviYXEYfuTsHm7ui0CJQOLOzi65RyG1j6EMaJ?=
 =?us-ascii?Q?LiMJlejdDV3e8IoyQxsTawxt8aupxv5X8h8fprpsRD2VZ74nzT5CACA2SoS9?=
 =?us-ascii?Q?hA=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 021bfb48-668f-4e26-15a6-08dd4aacddb9
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:47.3279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UsXyPrgyyvhcRD7uGNwOJ3l3EOneSRQOj0oCoqZ6fs9eV0Ij3MMkN56WnGUPsCmb70vSOcKIZRazmRqSsHXcMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9396
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211131

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Use the name and version parameter from the SRC_URI to determine the
name and version of the download dependency.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes/create-spdx-2.2.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spd=
x-2.2.bbclass
index de993ff5bf..aa195f5aa7 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -358,6 +358,15 @@ def add_download_packages(d, doc, recipe):
             package.name =3D "%s-source-%d" % (d.getVar("PN"), download_id=
x + 1)
             package.SPDXID =3D oe.sbom.get_download_spdxid(d, download_idx=
 + 1)
=20
+            vendor =3D f.parm.get("vendor")
+            if vendor:
+                package_name =3D f.parm.get("name")
+                if package_name:
+                    package.name =3D package_name
+                version =3D f.parm.get("version")
+                if version:
+                    package.versionInfo =3D version
+
             if f.type =3D=3D "file":
                 continue
=20
--=20
2.39.5


