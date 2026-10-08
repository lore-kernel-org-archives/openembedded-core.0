Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DEA2CA600D
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 19:59:36 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3384.1791489566310501056
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 12:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=NgOaT8zi;
 spf=pass (domain: est.tech, ip: 40.107.159.57, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EbFZqXujL80J6M7rtYikHOTMS5RPURA2Xzgk7b2bhz+z3/OHdi3ua0p/G0+Xwk4XBnXDzb24oHC+utzXUNUQW1xoPw0oxpqTGH69thNdOPmwzUg14vwC0+Qyn9cKTKx6OCI7EwQhVa7urqHyN9QYda6qV/W8upEJVRhAuAaiOWswcGd4zkCNgOwUXs1Yygx++JeHwRukNFMRZ6hviHASyLVvnD3CsCGMpn/OjPDogfl3Pgdzvmz+CCwsdsqmLOiEOoa60DyH0SzzcFwNL0Y3cyD9kgI96a8WDn3IBTyJRvnaVYMsgFFGH+3eLElGrlZxsXqbGDneeu6xyGv7DDEoMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8tEkHDRYPMYnKYUqdXDW221ZC43E1BVmfuzpr4jsks=;
 b=ceu2CGDUFrZY7o16Cw3Ysgy2Ca5AL83b//Td820vGkOsLINUO/E2TEJ2v7NR335V3NA+9sifs/bkksD3udCtku8QvKa1pgHV/AUq3T1+ib1YCG041Mu9cnCqG4vxI67BifHU2HdhTDVVTX34U5mDTFfAstxOikZnaZiYTSTc0MMZ7wTkmlr7ECqi55eC/JbWzIyW0R8ERSkV5mEPz5E76NcziUpboIf9qWQ3UVbBXIZLkRHdF+5BVJyTvNBZIedVqNDKXWdM5SrFEvMF1K9Hrc5jy9E/ylSXwuCVYl7GnfRqyTz/zI9OBrKaVKpHfsvSZxFYjjXjmbaqN4ppDQUVaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8tEkHDRYPMYnKYUqdXDW221ZC43E1BVmfuzpr4jsks=;
 b=NgOaT8zi2le7IlKyvRX5uzKp2VpcvnO1G4e7dL0F9MGl1ZxHO3meVZ/grxrJKfywb4bf41mJLl8w1QmFgUj3UWa1Q1p4VbINQskAiQttgWwew/pzzkpzub80Si4BrBugDNyhmKEl2L73r4v6wzUnBmbx4sh2MVnj58jwssGEyOKA0CO26tYEIp+x5fgfAvhJm5fWG/CrAuTzrdNKK1vRzo3xdTMdp+ymxn29TfLp9SheVGT+D2tkGeJ1XYJlLKMHjtqzK6QMPfBDpMchfXIj4/W92pZeMi0ViGGRfx63Oi64TkDYRR4zO2TUjK3HBA4hyEe21FDf9YHdZo37bJlgqA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB4P189MB3118.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5dc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:59:26 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 19:59:26 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] powertop: Update BUGTRACKER
Date: Thu,  8 Oct 2026 21:59:16 +0200
Message-ID: <20261008195917.22382-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261008195917.22382-1-jaipaul.cheernam@est.tech>
References: <20261008195917.22382-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR06CA0005.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB4P189MB3118:EE_
X-MS-Office365-Filtering-Correlation-Id: a10c157d-4135-4d74-24ab-08df2576a7c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|260925022911599003|56012099006|11063799006|260925021911599003|260925021311599003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	l91IEAMvngopjS2ZHKAA+GPNOJ+vlDvVH3PQE2hBzUOYv59U9oSIZvbyPvNPEOgLBUmpYZnZ9Xtut1uO91LPOEAa1qDuG8HN516MM2gE86GI5RajbdybtNSP1KViXm0Km/DZjc3MhVEk4gL1DODdCQOMKWfGmLQnsS8tDroKLsvYT0SBc20sTBfKoLONr+uBXP13y0S0VGdnKxZ6rgOiS6+Rm5kZmvgcy2iQO7QzmphIpdk0keWqzrkEVHJj+L160PLiKXbTDqqHgznAkf7oRTjWq5U2KD/MHll+EWHTMnZS13pb7GBbseMLQZHlGzDmwy5U/77NU2dTTqFmGMm1GC9d/D66DlH5caiQLCzy+E3+DODeTGSBtoTpQLe7lHZmSkYwy4gdWQtoJ9zi/xfKMqUrG+P8DRksxDzp6/HZ84QmuZ4Lq5MItl8ySc2Cb6g39OMMZzeub956ucCcuNmGoVYlIstfo/Gcj3fBTO7UE36LwuXZt0mvhG2RHWwmhoYehFyyZ1vQ2lflfkC0JHgVH8OOvVhA7txDBlaCqCN7pNq0p4r+9cPz70zNe1FS5BhPFgCNcKQ7mWcHZe+SXEWYPmG+vaI9owW6Znh8z+/hux0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(260925022911599003)(56012099006)(11063799006)(260925021911599003)(260925021311599003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Sf5KAOSA0tJrS2w9Lk35BaV5R7l/KXY2f5EyBrCxYkOt6qMdWCRVOYBUC6v8?=
 =?us-ascii?Q?6bTlzTZqwMNhVSdeo5I5iGOocllApOqzgFYf19pwh3/pd6JNbInBvScPnuAS?=
 =?us-ascii?Q?KSlaE4z0MyQ6S+8uhrYH1wO+6vo/XUVtaGaS3+FYDld7gSNQQN64e2mrz0EE?=
 =?us-ascii?Q?FjAIHZpo6Z3lspAzNnBZ9Ioatcul8RtRWopBPARLUAEcrWJVi2Z6bol2UI5/?=
 =?us-ascii?Q?PO8o/NkLdwk83sTS5rUIK9CKx/CDnB8NWq7uWkEyepeFmIiJF0Qkx0Nf6YYD?=
 =?us-ascii?Q?nz1n0Nqd6HYQeLDZG8ImoQX22GekvtgCaDAKKwaBmBeX6ehJAL7DmD6Bn0PL?=
 =?us-ascii?Q?lEYiR+b6GMDSOBiOZaYICpL1CiQK1QL+SPdyGgjche5Iw7nvWEQfMXNdfn2F?=
 =?us-ascii?Q?aFUCJ3eS/FA880W+WeU3JAD/9GoG+mH0xtgvPRZocat1Uafus/p4LLw1Snlf?=
 =?us-ascii?Q?vMiMgWSiXVHbn+J3ocmniRWX/WfJ3gR0VAHAygYzp+qr1QqbPXtMdEj9RXUc?=
 =?us-ascii?Q?g34cufXQnKDpSUGui8CWF4dqMHCe72MRDUUapTDokRYv0ss05oEmUDQb8Tn0?=
 =?us-ascii?Q?mR92XdBpXFWy6rNryqnCK4gr3Ig66wWZ0gVCL1I1+JkwXBs7MFEulLatVuRL?=
 =?us-ascii?Q?c4PZzpGsnE5quqw6OjoT/PGbqb4BUh9pXFcjVe5delCYJXYnhG65Jq3Mjogw?=
 =?us-ascii?Q?HEthb+3XkZSkCIG/eVn7Np8atYG2WbXkauVuu3z8pIQcJ9Iu5CaDtFpZNlsL?=
 =?us-ascii?Q?XCAxJYrvBVXNsU4kJhLLlOJUJby3gGTvCMuzTHoXui52puJt5GwvA3m+8LTR?=
 =?us-ascii?Q?/Mwg02w6LBvJzfHUF0V85ONMY30IN/TLewj9YcoWj1S2Xxk8WGbUyghfAKdT?=
 =?us-ascii?Q?wv2Ie+C10s1VfvM2c7xp9TXkLriivAuO62uF6VuuuGUrOFXrTeTgrZxX6dJE?=
 =?us-ascii?Q?82ypp3PpxRyHvf8f2dyQLs0fcHbxmC/6rPQSuYs9T56vfX7AJDr4mm/EczkU?=
 =?us-ascii?Q?vo0Q8u/NX9p8pGJTyrkVnfLivw7J7U1fKEc85T9vVRqfxKWlY6UJQc0sDqIi?=
 =?us-ascii?Q?vd2btQtSm+KP3vDLzKnkOazFSb7AIjXB96xAkpiJin1rKa5/ITnpN2ENv6OG?=
 =?us-ascii?Q?nsj2vbRaRGcO3Z7T16/gXAWExPQ0Y1UTRAPWeIU9bPogVXjPYDRNP1Ua9zCl?=
 =?us-ascii?Q?crvBYS2Browt4PNMMbEf1WZqbPDbkgFg887iH3CRPJRiZRt188StmEG9Kgr0?=
 =?us-ascii?Q?kDY0jxxqc4EQ7TkaI85K0dJrfjG5YQUTMGmDbsOL4cLWFeWCfJQaBUsR2qBd?=
 =?us-ascii?Q?SXUcbVgOR7EW2DX26lVEaYxKlbzivbHR/SzchjDnt2Sj7rryzz7Ic6D+rTH2?=
 =?us-ascii?Q?BXJgWDdpzqEd3bYsLmvj40ec8xIAbmjQxu0iHkwWNNgb0/Ooiudo0M38ete0?=
 =?us-ascii?Q?sKItV6wC67XjWGvGLQmFCU3xDO0Qni0dC+BdvXB4fENvyr5vyaPHqFAkJ+vv?=
 =?us-ascii?Q?ZOgwlvGRfedb4J6QmtUbKOh1dlkTSymjrRk3T6uvkVPWAc3aSpVa+HH25RHd?=
 =?us-ascii?Q?gTVa2xqVK6fwWAGGZTRIIgShfYhxBZjkNIQINPi0tHQQab7sXyEeN9bXQlOA?=
 =?us-ascii?Q?vAtbRZRO/PDh+Ftm03sJ5ZPcmGOp3Fb8R8SfGun4yWLvfb3pn8LmkzCGfKcu?=
 =?us-ascii?Q?AzC1O7gjhjxFN8HX9MWWIkwAqHWLb0z/vbN+vnY+m9ZaQUuWQ14tkjgl8R9N?=
 =?us-ascii?Q?PgitBs8rBC+vgl7M9FHXQv7WD5o3k+g=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a10c157d-4135-4d74-24ab-08df2576a7c3
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:59:26.1575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KEaHQEDgOkbOndm7HGenfv928HIdDXsMwP/UWREMezkCqykz8urBjTouEwW2Ge0o3zkVmQURQSyp1uTqLfAqQMtUvzfcih9yGlEWzkrXCvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB3118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 19:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247446

- update bugtracker URL to github

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-kernel/powertop/powertop_2.16.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/powertop/powertop_2.16.1.bb b/meta/recipes=
-kernel/powertop/powertop_2.16.1.bb
index 0d9b8ec15d..3233828815 100644
--- a/meta/recipes-kernel/powertop/powertop_2.16.1.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.16.1.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Power usage tool"
 DESCRIPTION =3D "Linux tool to diagnose issues with power consumption and =
power management."
 HOMEPAGE =3D "https://github.com/fenrus75/powertop"
-BUGTRACKER =3D "https://app.devzing.com/powertopbugs/bugzilla"
+BUGTRACKER =3D "https://github.com/fenrus75/powertop/issues"
 DEPENDS =3D "ncurses libnl pciutils libtracefs"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7=
e"

