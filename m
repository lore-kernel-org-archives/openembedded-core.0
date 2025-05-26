Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D91C54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 09:30:00 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.121])
 by mx.groups.io with SMTP id smtpd.web11.25323.1748251794650781148
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 02:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Xb9GXIff;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.103.121, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lnfmnn8EAminXbACmxR8oY3tSMLZWyPlBszAR4UVFwUK5R11hTxWNB+S4wo1za5x/gAEIGxsRdj1DmMxJKevc5RIWuhW4dOSQtfAeIeDq4TxDOxVFHXmgjoncIeTHfAWJSEJuw+ZQfGHvnfcI0tH2CVc2sDIMhwiD6/GN9+tfe9s1tRDyzqE3yQGbo+aQ2IW8nJ0HYy38MVaf+cf/64oppCnj0VJ7NCxzIpFmDYkMOaQSM3x/QamaTUsYAAJoDNiegS6hbsv8CjSJ2dXpQIxw9ide6b4R8Wgo4V4APuVFwxzTqPTzB2D1d5uSHQHys8b2asC2mT2HW1FGl0YQaxucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZpbgWo/SofcUv2xTfx/aHTZS9qXysn42KE3qVk8agU=;
 b=VzaGtHjvndYqSSdiGTyiFX3catEzbdjOCCSnWSOAVXB/7pbZQXBgNWKsMkg9PzAJTrY28GbD8pRNnG2N6pOBFt+uuKwi2Q3abkBj1gwGL8L2/d6/aJKiqpMJFpqwY4d4YyFt0EGKdokP0BzwjU7uqxgGJwsw+pgPFukvCpp2sbmUfkuWb60V7rr+44wWLYXPVkx5XYRUtVum4EYqri9612bD+40X6LvHnABGhVk7Umfgp2GGBwl4ijASTdVOHtgixuYN9/jQ8LKXCEiF5cFUdxBrdbyN1qEyId5NOwRLVKGXkPxddR/0t/ihtRULKcFAWUg7UrhCv+6X2jZVbFsPQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZpbgWo/SofcUv2xTfx/aHTZS9qXysn42KE3qVk8agU=;
 b=Xb9GXIffe864vSsrWxIfnbtH+ElGyMOO8nOJ73agS/0KUE4oMFXj4Shc+Tl9E5C4wmC5FPQFxWQkJ/wE6iC5xtuQjf+mTY6WL+gQyDB/WQ+YGmr6mDBQyVB6PKgHYMURsn3gTEvrIDgB3rLQV02eHnUlaF+q1trKuaMnhG1Y1LTp3/2JzPEUXfS3Htgn9RJX17EXfstStX+01nRoavqPPlcZzUAp2xmPAi8q0yWIuWr8K0NGMvwuEDTMfCC2Ihmo5l6YPQedWX36F4vjtB7lkCjKQwIsu+i49L+Ge2kTTdaW9YORBjrhs4UwuPmC3fK/ohEcIMWfIRpddwJj2o5Ssw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM8PR06MB6836.eurprd06.prod.outlook.com (2603:10a6:20b:1c7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 09:29:51 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 09:29:51 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 3/3] linux: cve-exclusions: Amend terminology
Date: Mon, 26 May 2025 09:29:27 +0000
Message-ID: <20250526092927.2588577-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250526092927.2588577-1-niko.mauno@vaisala.com>
References: <20250526092927.2588577-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00002BA5.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:6:0:1c) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM8PR06MB6836:EE_
X-MS-Office365-Filtering-Correlation-Id: 3100a2dc-9adf-4167-2d4d-08dd9c37dd7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6TuKMSNzk1+Mky5tsOv+CQiV/qvGkfvN1Op1+o7GJzDSzW7EdiWEkr0c+GNe?=
 =?us-ascii?Q?eGakq7TcVmg1Aiu3vcSsP7GMJYKqc4aWIRnilMdD+3IzrsY5vageavt13vxQ?=
 =?us-ascii?Q?Zm7bCswbp6fw2aXzYe9IqISBKrzwBA0Dr1TsnsJ3HAqbNs0MOf/M5Pkf5OnC?=
 =?us-ascii?Q?dhXF1cg31Y0k1YMYzNRBAcjPkJ9mdvLXkboNdT+N2huB475iCTW/Ln4vc/yQ?=
 =?us-ascii?Q?vStHgCalP//shha0Nq+FkL+3eLaWHrtFxXmxxJqFRfRzIwzmHTTqzDJKuxdv?=
 =?us-ascii?Q?ZgJOhrtLAUECQE3zyydd01AlWhIMPafjaNop0ipxjtKVW4hSdYqmlH+QbtWK?=
 =?us-ascii?Q?/eE8v6uo4uKac6Vw3+Ab6Ibu3kRnTnL0iCRcj87JnHmbJsLJR2tpiXeQWn0O?=
 =?us-ascii?Q?P0O3QczIsL8+QMEtbE3i8aY0AQrxQg+PeqyHOgzT9X1MShm+EJtUYV8qsWPs?=
 =?us-ascii?Q?tatH6wdhg0RfCaxdsuVJMRkkPGBF2gOQCoFltvfr3RqBgIyV7GS+YqcL4rbA?=
 =?us-ascii?Q?R3SpTLGvbUsTDKw77ujptPloDyjBnDiKC6v0vBoliavGIsBBDMdIXndE4Kux?=
 =?us-ascii?Q?KXkVv6wfcLpcYRGk/iX5w34XkFRKPhc0TQ3vpDOtAgOWajgFqypmyPYgA6/P?=
 =?us-ascii?Q?uRSNZl5K7Wk5PtcGZQ8JY1k2P3k9fiT6Ty7JSFFU/dRavbE2SdgiO8nC1RK8?=
 =?us-ascii?Q?BCIv6zhVSM8XAOzJ459gAiDmquz7YhBMo/Qht0rNQZABv5gFZW1r2MMdZJWo?=
 =?us-ascii?Q?Kem3PIVMJnbYNheKGPDBoVZE6BsTYpYTind78+R1/icMgNDom7B29qhzaKhc?=
 =?us-ascii?Q?kqzkNa0eGBememBmANwVpDom6Qs9OX/seeeQ10h2O71jq36Bse9naY+IU+eX?=
 =?us-ascii?Q?4rTIb3+S8tvFCJ7BOUEKzFu8h070kL6fG9DNTq8EtFShdxQSDRhM0tcdgIkz?=
 =?us-ascii?Q?4VDp07EBfxBlo8wex6lPKuSi9xZw2CyXqTCkEr8tBcIZKSk17TsBBv0xsyQo?=
 =?us-ascii?Q?2EpDdbY7wjJXfCmiWuXSfyvCO+FhYjnAR5ecEiShWohUUZEmMz93aGTxlrup?=
 =?us-ascii?Q?SXzBgtgjD3DdazQ/4U31HxU0WI6lxxfMAiZcuJkmR54/KIv88sMrgzy9ipjT?=
 =?us-ascii?Q?isJPd6Ntvj3igka0VWp3g/jylKJ9DuZvqI54EIQcTxguvfKjaI5KYwzO5RuV?=
 =?us-ascii?Q?jSP9e70zi6dbCiUODy/rspBxOij/STyTOgciR28SD+4cTvhRvlecBoR+uifV?=
 =?us-ascii?Q?Q+d8KintadZ3oCW7XPvLarawlp0r+2c65T4HGwq8IMZOMbeUg8Pfn3YjaFUX?=
 =?us-ascii?Q?3rmYgWQMkWMGApQvcI3r4N0dYZwrJhAqXEQE2nXIwmQPkVV6SwVR9ZKRx15a?=
 =?us-ascii?Q?bBCwOVBAa1WjuqSKcLC3PDvsVan2+KImvrvWO5lqO9RpsYCN97aKd8twJxpL?=
 =?us-ascii?Q?+7RaTGAhYY8V02dhXiMRFxRnAN6kq0r+7T1vGFlxz6NEyqrUl4CcHhxKA7EZ?=
 =?us-ascii?Q?js+5T3/N/uOT41E=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1KdZsN0Ux4duu7yyH++n64ngwTDIK2k74HY2M/axgYj8U2aFwIQFUjdZ1IAp?=
 =?us-ascii?Q?D3/vs3Rb3y+GxLpcV0BNDGkqHwtWYVn+IWliBrZxwO4bf+WjpwVREBpox0uN?=
 =?us-ascii?Q?6IB/zLiHWtPKiGXTz31BwOLdFSGX00GC1vdKQAnS3ocSdCBTFQui/jxjZORS?=
 =?us-ascii?Q?qI2eh3Es9/4OwqRbUWhe3/6SYUnx6RiclPgE+XCz2oxSa8qfsmRooR2rS58M?=
 =?us-ascii?Q?9+tADTAyQa/HkHyb5RnbI5V1KgS06qsgsInA/xHHo2W+YehBvGJAIWbZkd+k?=
 =?us-ascii?Q?FLgDlQAqSm+gOwSFYW9KR8zTlccNUNnXyJtKyNCVy9yBEJ0JhKgm4zy4RWjs?=
 =?us-ascii?Q?3jL5bUWZ2dQJkJZy1ArU081yJNTjPHlPrC91pjG6d5zV9uDyV0LoEGNU3Pbd?=
 =?us-ascii?Q?JQBDniOMEzFKTN6rPNRF0FcQDCJzxo/TvW8BCKGtz5cN/N43kYL6glA/66K4?=
 =?us-ascii?Q?m5qdsBuQ2IJLtjhvRyn7mRhBE/ojLNDgF+DExRSOYE496cEeYG8RGLLVj3hK?=
 =?us-ascii?Q?DgNsf2D8ZR7YlcSzWOF3S4Wg77pyC7JU4RlrKJNMva7rtHKOrDNVPds/T4qN?=
 =?us-ascii?Q?clBea22U3HWIr9JPbuitDldnuy9Aa5+X6wVEpacsJ+5HDB9AHtlN/7IINIjR?=
 =?us-ascii?Q?N5YSVU7zaaCVwtMcFnEB0TwGfJBUV/WTqQHBV97UsAps4LCxsmv9h8VOruYV?=
 =?us-ascii?Q?7KIjlL7u35K739T5CXAZKtd+GQ7kVY2cFcoiH3CjBoyK/Yr25g4DGpvmx25T?=
 =?us-ascii?Q?yKthLl1VYLtVmxiv0VpiYR8c/0DFJXOhmo8TEq5MQctf2ZVOXKqHxfduRDvS?=
 =?us-ascii?Q?j6fgoywk1iRUAaJNog6gc/WdI21YrNvPFb/3KQaCLBtUpeBRdA1eXpG8vAsC?=
 =?us-ascii?Q?frEpXub3ceW+23aCz7H2DegIuit7GapvCPSK8Pf5DfwQ/FMHe1XB/Ni4ggnf?=
 =?us-ascii?Q?OBwZ0n/yvJ0j8wRstssAZ+vrecpombex9LOXccp31Vg3Kmv3RnCwa+qepyyg?=
 =?us-ascii?Q?RFSwOUV0gKKEgN8Y8xh6F6D3slNKZQfVnYjERg9e1XLr+C71JtFY0yV61h/1?=
 =?us-ascii?Q?9IUipGlMW/0500E6Wr855M0Nj/yN6Vqt6ghXUJCJNJhmrxKznItcF4eWhvuH?=
 =?us-ascii?Q?RvFzDpspSd2adJqq3HZZ+ecmtLX5+hMGJwbFmV5/2X8TsG6H0BKGFEM/fJFB?=
 =?us-ascii?Q?iDR85HU/HEYqmPmLF7SHTqli8Y36Q7M9wHIkRJJJXlM04OeBbxC43CtxygT5?=
 =?us-ascii?Q?xvWlN/AfDmU3Y/alynJDwu1QLwo5JJ85o3KcynB9stHvcZ5RZ0Gp0vSCZfI8?=
 =?us-ascii?Q?cCAnlk1ADbJVtoA88j5yJbzk99+3xpOs7CJpqy7viMaNlvBhvLEz86Co+mBf?=
 =?us-ascii?Q?D+ayUUwlKJpD+7Y0b3Dob12zkapRt5DgkLBP5+aJvWQTMTKnVK/feZaiVNRS?=
 =?us-ascii?Q?kRcqmr7JWwSVuCOSGxEWo/TBOS6Xjf1FYuZe9G2XFyDht6r+12y0a5vsE27T?=
 =?us-ascii?Q?4BD8v4gqTD3AbvX+MtK+Ttvr5jQlE0K2EI2n4xD8zNdFjD6UPgv5g3HBF3pv?=
 =?us-ascii?Q?62ZYhxuJWVgAuGQFfWdE1P9cNIskOIY9MYPgNQDY4KUXWk42qVJ6lI2CBUM2?=
 =?us-ascii?Q?aw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3100a2dc-9adf-4167-2d4d-08dd9c37dd7b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 09:29:51.1573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yyx0tyt++7lWnGP/U3dixW9aVP7quDvIov9yMmFVGv3F0mMVNaWsc1ZB8RwvsYpPkcmJXnPLI8S4WBT6jhQ/uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB6836
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 09:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217263

Replace the term 'needs backporting' with 'may need backporting' in
generate-cve-exclusions.py when the checked kernel version may or may
not be in the vulnerable version range, thus making backporting
necessary only in the former case.

In tandem we regenerate the content of cve-exclusion_6.12.inc using
https://github.com/CVEProject/cvelistV5.git repository main branch at
git hash b20d0043711588b6409ae3118bc0510ab888c316 to keep the content
in sync with the script.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../linux/cve-exclusion_6.12.inc              | 142 +++++++++---------
 .../linux/generate-cve-exclusions.py          |   2 +-
 2 files changed, 72 insertions(+), 72 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipe=
s-kernel/linux/cve-exclusion_6.12.inc
index c03ad19a3d..120b1b5ef7 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,6 +1,6 @@
=20
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-05-24 12:02:58.590640+00:00 for version 6.12.27
+# Generated at 2025-05-24 12:18:11.126849+00:00 for version 6.12.27
=20
 python check_kernel_cve_status_version() {
     this_version =3D "6.12.27"
@@ -12356,7 +12356,7 @@ CVE_STATUS[CVE-2025-22100] =3D "fixed-version: only=
 affects 6.13 onwards"
=20
 # CVE-2025-22101 needs backporting (fixed from 6.15rc1)
=20
-# CVE-2025-22102 needs backporting (fixed from 6.12.30)
+# CVE-2025-22102 may need backporting (fixed from 6.12.30)
=20
 # CVE-2025-22103 needs backporting (fixed from 6.15rc1)
=20
@@ -12640,7 +12640,7 @@ CVE_STATUS[CVE-2025-37819] =3D "cpe-stable-backport=
: Backported in 6.12.26"
=20
 CVE_STATUS[CVE-2025-37820] =3D "cpe-stable-backport: Backported in 6.12.26=
"
=20
-# CVE-2025-37821 needs backporting (fixed from 6.12.29)
+# CVE-2025-37821 may need backporting (fixed from 6.12.29)
=20
 CVE_STATUS[CVE-2025-37822] =3D "cpe-stable-backport: Backported in 6.12.26=
"
=20
@@ -12776,99 +12776,99 @@ CVE_STATUS[CVE-2025-37888] =3D "cpe-stable-backpo=
rt: Backported in 6.12.26"
=20
 CVE_STATUS[CVE-2025-37889] =3D "cpe-stable-backport: Backported in 6.12.20=
"
=20
-# CVE-2025-37890 needs backporting (fixed from 6.12.28)
+# CVE-2025-37890 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37891 needs backporting (fixed from 6.12.28)
+# CVE-2025-37891 may need backporting (fixed from 6.12.28)
=20
 CVE_STATUS[CVE-2025-37892] =3D "cpe-stable-backport: Backported in 6.12.24=
"
=20
 CVE_STATUS[CVE-2025-37893] =3D "cpe-stable-backport: Backported in 6.12.23=
"
=20
-# CVE-2025-37894 needs backporting (fixed from 6.12.28)
+# CVE-2025-37894 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37895 needs backporting (fixed from 6.12.28)
+# CVE-2025-37895 may need backporting (fixed from 6.12.28)
=20
 CVE_STATUS[CVE-2025-37896] =3D "fixed-version: only affects 6.14 onwards"
=20
-# CVE-2025-37897 needs backporting (fixed from 6.12.28)
+# CVE-2025-37897 may need backporting (fixed from 6.12.28)
=20
 CVE_STATUS[CVE-2025-37898] =3D "fixed-version: only affects 6.13 onwards"
=20
-# CVE-2025-37899 needs backporting (fixed from 6.12.28)
+# CVE-2025-37899 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37900 needs backporting (fixed from 6.12.28)
+# CVE-2025-37900 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37901 needs backporting (fixed from 6.12.28)
+# CVE-2025-37901 may need backporting (fixed from 6.12.28)
=20
 CVE_STATUS[CVE-2025-37902] =3D "fixed-version: only affects 6.15rc5 onward=
s"
=20
-# CVE-2025-37903 needs backporting (fixed from 6.12.28)
+# CVE-2025-37903 may need backporting (fixed from 6.12.28)
=20
 CVE_STATUS[CVE-2025-37904] =3D "fixed-version: only affects 6.13 onwards"
=20
-# CVE-2025-37905 needs backporting (fixed from 6.12.28)
+# CVE-2025-37905 may need backporting (fixed from 6.12.28)
=20
 # CVE-2025-37906 needs backporting (fixed from 6.15rc4)
=20
-# CVE-2025-37907 needs backporting (fixed from 6.12.28)
+# CVE-2025-37907 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37908 needs backporting (fixed from 6.12.28)
+# CVE-2025-37908 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37909 needs backporting (fixed from 6.12.28)
+# CVE-2025-37909 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37910 needs backporting (fixed from 6.12.28)
+# CVE-2025-37910 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37911 needs backporting (fixed from 6.12.28)
+# CVE-2025-37911 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37912 needs backporting (fixed from 6.12.28)
+# CVE-2025-37912 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37913 needs backporting (fixed from 6.12.28)
+# CVE-2025-37913 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37914 needs backporting (fixed from 6.12.28)
+# CVE-2025-37914 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37915 needs backporting (fixed from 6.12.28)
+# CVE-2025-37915 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37916 needs backporting (fixed from 6.12.28)
+# CVE-2025-37916 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37917 needs backporting (fixed from 6.12.28)
+# CVE-2025-37917 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37918 needs backporting (fixed from 6.12.28)
+# CVE-2025-37918 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37919 needs backporting (fixed from 6.12.28)
+# CVE-2025-37919 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37920 needs backporting (fixed from 6.12.28)
+# CVE-2025-37920 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37921 needs backporting (fixed from 6.12.28)
+# CVE-2025-37921 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37922 needs backporting (fixed from 6.12.28)
+# CVE-2025-37922 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37923 needs backporting (fixed from 6.12.28)
+# CVE-2025-37923 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37924 needs backporting (fixed from 6.12.28)
+# CVE-2025-37924 may need backporting (fixed from 6.12.28)
=20
 # CVE-2025-37925 needs backporting (fixed from 6.15rc1)
=20
-# CVE-2025-37926 needs backporting (fixed from 6.12.28)
+# CVE-2025-37926 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37927 needs backporting (fixed from 6.12.28)
+# CVE-2025-37927 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37928 needs backporting (fixed from 6.12.28)
+# CVE-2025-37928 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37929 needs backporting (fixed from 6.12.28)
+# CVE-2025-37929 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37930 needs backporting (fixed from 6.12.28)
+# CVE-2025-37930 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37931 needs backporting (fixed from 6.12.28)
+# CVE-2025-37931 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37932 needs backporting (fixed from 6.12.28)
+# CVE-2025-37932 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37933 needs backporting (fixed from 6.12.28)
+# CVE-2025-37933 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37934 needs backporting (fixed from 6.12.28)
+# CVE-2025-37934 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37935 needs backporting (fixed from 6.12.28)
+# CVE-2025-37935 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37936 needs backporting (fixed from 6.12.28)
+# CVE-2025-37936 may need backporting (fixed from 6.12.28)
=20
 CVE_STATUS[CVE-2025-37937] =3D "cpe-stable-backport: Backported in 6.12.23=
"
=20
@@ -12888,63 +12888,63 @@ CVE_STATUS[CVE-2025-37944] =3D "cpe-stable-backpo=
rt: Backported in 6.12.25"
=20
 CVE_STATUS[CVE-2025-37945] =3D "cpe-stable-backport: Backported in 6.12.24=
"
=20
-# CVE-2025-37946 needs backporting (fixed from 6.12.29)
+# CVE-2025-37946 may need backporting (fixed from 6.12.29)
=20
-# CVE-2025-37947 needs backporting (fixed from 6.12.29)
+# CVE-2025-37947 may need backporting (fixed from 6.12.29)
=20
-# CVE-2025-37948 needs backporting (fixed from 6.12.29)
+# CVE-2025-37948 may need backporting (fixed from 6.12.29)
=20
-# CVE-2025-37949 needs backporting (fixed from 6.12.29)
+# CVE-2025-37949 may need backporting (fixed from 6.12.29)
=20
 CVE_STATUS[CVE-2025-37950] =3D "fixed-version: only affects 6.14 onwards"
=20
-# CVE-2025-37951 needs backporting (fixed from 6.12.29)
+# CVE-2025-37951 may need backporting (fixed from 6.12.29)
=20
-# CVE-2025-37952 needs backporting (fixed from 6.12.29)
+# CVE-2025-37952 may need backporting (fixed from 6.12.29)
=20
-# CVE-2025-37953 needs backporting (fixed from 6.12.29)
+# CVE-2025-37953 may need backporting (fixed from 6.12.29)
=20
-# CVE-2025-37954 needs backporting (fixed from 6.12.29)
+# CVE-2025-37954 may need backporting (fixed from 6.12.29)
=20
-# CVE-2025-37955 needs backporting (fixed from 6.12.29)
+# CVE-2025-37955 may need backporting (fixed from 6.12.29)
=20
-# CVE-2025-37956 needs backporting (fixed from 6.12.29)
+# CVE-2025-37956 may need backporting (fixed from 6.12.29)
=20
-# CVE-2025-37957 needs backporting (fixed from 6.12.29)
+# CVE-2025-37957 may need backporting (fixed from 6.12.29)
=20
-# CVE-2025-37958 needs backporting (fixed from 6.12.29)
+# CVE-2025-37958 may need backporting (fixed from 6.12.29)
=20
-# CVE-2025-37959 needs backporting (fixed from 6.12.29)
+# CVE-2025-37959 may need backporting (fixed from 6.12.29)
=20
-# CVE-2025-37960 needs backporting (fixed from 6.12.29)
+# CVE-2025-37960 may need backporting (fixed from 6.12.29)
=20
-# CVE-2025-37961 needs backporting (fixed from 6.12.29)
+# CVE-2025-37961 may need backporting (fixed from 6.12.29)
=20
-# CVE-2025-37962 needs backporting (fixed from 6.12.29)
+# CVE-2025-37962 may need backporting (fixed from 6.12.29)
=20
-# CVE-2025-37963 needs backporting (fixed from 6.12.29)
+# CVE-2025-37963 may need backporting (fixed from 6.12.29)
=20
-# CVE-2025-37964 needs backporting (fixed from 6.12.29)
+# CVE-2025-37964 may need backporting (fixed from 6.12.29)
=20
-# CVE-2025-37965 needs backporting (fixed from 6.12.29)
+# CVE-2025-37965 may need backporting (fixed from 6.12.29)
=20
 CVE_STATUS[CVE-2025-37966] =3D "fixed-version: only affects 6.13 onwards"
=20
-# CVE-2025-37967 needs backporting (fixed from 6.12.30)
+# CVE-2025-37967 may need backporting (fixed from 6.12.30)
=20
-# CVE-2025-37968 needs backporting (fixed from 6.12.30)
+# CVE-2025-37968 may need backporting (fixed from 6.12.30)
=20
-# CVE-2025-37969 needs backporting (fixed from 6.12.29)
+# CVE-2025-37969 may need backporting (fixed from 6.12.29)
=20
-# CVE-2025-37970 needs backporting (fixed from 6.12.29)
+# CVE-2025-37970 may need backporting (fixed from 6.12.29)
=20
-# CVE-2025-37971 needs backporting (fixed from 6.12.29)
+# CVE-2025-37971 may need backporting (fixed from 6.12.29)
=20
-# CVE-2025-37972 needs backporting (fixed from 6.12.29)
+# CVE-2025-37972 may need backporting (fixed from 6.12.29)
=20
-# CVE-2025-37973 needs backporting (fixed from 6.12.29)
+# CVE-2025-37973 may need backporting (fixed from 6.12.29)
=20
-# CVE-2025-37974 needs backporting (fixed from 6.12.29)
+# CVE-2025-37974 may need backporting (fixed from 6.12.29)
=20
 CVE_STATUS[CVE-2025-37975] =3D "cpe-stable-backport: Backported in 6.12.25=
"
=20
@@ -12976,9 +12976,9 @@ CVE_STATUS[CVE-2025-37988] =3D "cpe-stable-backport=
: Backported in 6.12.26"
=20
 CVE_STATUS[CVE-2025-37989] =3D "cpe-stable-backport: Backported in 6.12.26=
"
=20
-# CVE-2025-37990 needs backporting (fixed from 6.12.28)
+# CVE-2025-37990 may need backporting (fixed from 6.12.28)
=20
-# CVE-2025-37991 needs backporting (fixed from 6.12.28)
+# CVE-2025-37991 may need backporting (fixed from 6.12.28)
=20
 CVE_STATUS[CVE-2025-38049] =3D "cpe-stable-backport: Backported in 6.12.23=
"
=20
diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/re=
cipes-kernel/linux/generate-cve-exclusions.py
index ea59c15a01..b45c2d5702 100755
--- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -141,7 +141,7 @@ do_cve_check[prefuncs] +=3D "check_kernel_cve_status_ve=
rsion"
                         f'CVE_STATUS[{cve}] =3D "cpe-stable-backport: Back=
ported in {backport_ver}"'
                     )
                 else:
-                    print(f"# {cve} needs backporting (fixed from {backpor=
t_ver})")
+                    print(f"# {cve} may need backporting (fixed from {back=
port_ver})")
             else:
                 print(f"# {cve} needs backporting (fixed from {fixed})")
=20
--=20
2.39.5


