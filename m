Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4256DC5AC7C
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 11:39:14 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40831.1786102746848509374
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 04:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=xRs3Mwyj;
 spf=pass (domain: est.tech, ip: 52.101.83.34, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4F1M/S/jZcJxl13kiG4HL/S7ZLueFW3/5vIx2W0T0oHc8aHN+lS2alfEX489uQ14y5Q6BinGd8kap2ESbAstMloB+7kJQD3ufU7RDGEMe7EDNoidR4eOQMONUabF/yfO5cD6D36x4d5eoLOPhD85C1izyRs9QH1vCOlkTATcupV+v0JSTcJX7kL+BCCINshIXt6IyO7gB5pV54cVQ89ObQpyr4kZJILpnfejWnIXX86dKU4IBExsgAdv9mxyerYuilf64W5uo1mE0psFdmVtuGgKIygsgzyT15ughWcnScKCBsGzXtF4jtuO6YwW/Iy/y+AGt9EuybKUlV/ZRBZzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TASbtNngH/64Z35EQ2GQzZ9w/pnItPHm1Is2ab1cAw=;
 b=ytwbxMPPdJopEMHbZZy9dWihvG3WnSe5tyWUWQshmMVZ9vwLu+k9B311CClGW27RnXry3Aj53C9I61+DjsoSwWv4Dt+akn1IkHf28CuRW2iUz1Oyrb/pUX6GIx/YDTai/jd9ZBxPWcIUVVdEz5tBeUXVTrW6r4w9gfBaEEyJXHyylIvFSB/MXuAHZQhY0DHqslj8JBF6wc5cAMPN/q/CO1brpdCEUHSShmXP9tFE2Pp5J3Bw4SMlybaKyXqMq/bLz4svSHPveoVpVGzTj43vme9wRElO6IqSn4ORTTVFqzDpiD5/1hXz1H0WdiegFHvEQ2MHUmofvQyD+sxLG35gjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TASbtNngH/64Z35EQ2GQzZ9w/pnItPHm1Is2ab1cAw=;
 b=xRs3MwyjLKs18Gk5bu1LV8zpwvjhqRaGGg5pgcRiu905cPD/RvdZ2beA2xOZpZ/QGDiIEeZyAoIoOjrkjmMtCZgrQdRIIBC9OAKYjlANYs8chZwCG0imzvgErUBgkXiknfdFg9/NkzqmpIXXXkdrWahx8/kKBFxB5WLFft5Rm9puWzXKmjeJrdpfw/cV42s1sTB84kQdkj/ixvZ4Opsl+d4w//pXOQNTyNLKIef/3DmOx7sg0urEorC4vKNc2wdzHy3A/ypuHQgaGubTj+X6T/qh+y2Nvg+khP/bkt/+puGHGPlWKgNw9m3NtNIsOZY1DcqhCv6uOeLhpqeQlLSYIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA1P189MB3651.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:500::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.8; Fri, 7 Aug 2026
 11:39:04 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Fri, 7 Aug 2026
 11:39:04 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] repo: upgrade 2.65 -> 2.66
Date: Fri,  7 Aug 2026 13:39:01 +0200
Message-ID: <20260807113901.36126-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2P250CA0021.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::26) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA1P189MB3651:EE_
X-MS-Office365-Filtering-Correlation-Id: a5566ac9-0e18-494b-c263-08def4787b7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|3023799007|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	BmwSVeCqasz5+OF3W2FrBqT4KfPePfTal1kkEo9USRcWOYZg3Ov3clMko+7sEX4vxkqNMY7ZwptPiyxDtmeAeTtS9wExhTQSNUK1qusDFGioh7vsgLX33z1UpW+/TmN/RzuSEHI0Acu/6RaMYLR5PnRACbEs61ejLzg5IsvoiZ/7mFaqWvbVrhjzo2hYQWYbbtjex+CQoCLKVKSa/Hcje1pIvIAXoQCOEp2pL8D0dsgEhQKDHJXooPHHL2PR3IW/2f019riuReXQfiIpBcKjPJaIZwW9jt5+kkbFI68klyPMfxXNqFGfhHdnJzgWB7nfHbwK8qexa+j0cHRym+OlGOAS/0jhVAmY1RenlTEJ3BO3GvZlSIpZhbo+eHGxblb9E9Yx1ac4LPF69plfqGCsAfSnGx+EAOmmZVq+a0xuJOZKQ64YH25mwrDafYoakHFELzeOCYQj5f8bLB8/X2lIG7Ale/In1DBse7frlEXFYJBuQn23FtxkfpGqV8HR+sc7eWnub+eflq7AaQ0ANvhfBEcWzmp7SNWBZ7uqFB3KFRQxDU1obEdgwvbO+xf1uCid7yFTKVr2KZ76MQTnDh7pHEu14ZcyMdPrD+qG7lAiTgbag1ZN/a4AlDO4KHyrWokwEQhX+ph3eILECsOKceBHGVy4nCjKKoVqazxR/w/EOFU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Bb+dIZ1QuWZXb7ePkaaf0bQNATay66z9mS3UwqCOeTaA1Px8EqGPy1vIvJWh?=
 =?us-ascii?Q?AxDQdqqpnQecWt/ojy+8K36IAjJVZbVZDF37d6HXI4cs+lfdHsoiL9TVU189?=
 =?us-ascii?Q?twTk4SVaMZhYtMop66BuBsWsots8qZmRR6HJPMAlmix/jkMAa7LNf6s0YEqz?=
 =?us-ascii?Q?GWa2PqW9LaYDMVaIymdH6AQO6RLfzxFOpF0b2rg1sG2LzSaqzkDXhtOZEskk?=
 =?us-ascii?Q?apjUKX4JnqE97g9pGM99SxZH7WnTEH8ps0YBEUO7MCcqF/LTZiChfUWeRUt2?=
 =?us-ascii?Q?EoIrb72boH4aBpI9ZYXi1lAAbH1LJrN9cZMOz3yDDCEGexw3e+vAbOZ6JGWt?=
 =?us-ascii?Q?2SsgVyii2RB+sgx5IsSdPP4IeFgxvCp4Dnw9VCrdNU0ZbsPTFL/9nV1EyS+K?=
 =?us-ascii?Q?p4GknPpF0Z5S+v39GjHocSH1mwsvN4fYsY7gcDpYT7EU527m+V22ay8vPz4z?=
 =?us-ascii?Q?9YsvDVAN7MWGdnhq3MbauzPEnYLlz2upsWbytiypVSXSjuwYvxZlzyE65HuE?=
 =?us-ascii?Q?0p68zTm3VRl0eCfKcnjMjxtvHBAhH1eb4n5UNXoVJqNUDE7rPxQ1tqNANv6M?=
 =?us-ascii?Q?dBsRUZb9aqPsH0CPzz7lAjNCJyikbxOVqX/Ep81TM3+LGe4f3j/tN75yK+C4?=
 =?us-ascii?Q?eJ4pNa/JsUe3ixzd0aJQFNfDlxtWuMBvKM3tuU6zNF8cG/j8CRFESvuZFsYG?=
 =?us-ascii?Q?ev8cL/yoqDk4+h3buiYTgjKAHJbBWy5UhhuLbwgxuUS8W7miJFOjxMPLBKg6?=
 =?us-ascii?Q?o3TeIK+gs1OSNebDxVwn7ghjuVuEnIZXMC50qh2E0Lbr5hBGD/KG3aBLYhaQ?=
 =?us-ascii?Q?Zk9AlFOIkY/XbLVXWhq7bKtmFTXv2E/L5rH0Bn8dwbn3P1vCRP/2V8tU5NXd?=
 =?us-ascii?Q?dKT0HnLDzi6rcJLsfr2yUHkTYdU+iLH++bMFISuAHGJcEp+XbA2c5c52U9Lq?=
 =?us-ascii?Q?MYaSkjcCPNKvsrgMnTEs0BmqyIpIxcz3RR6PHWYckMDgVhi7hf/Yeuu9IL2G?=
 =?us-ascii?Q?WgDjCHSrTD2n2HsLocwo6GgYzXg+SGxxqj59kTOZgIZV/q7VVpNMwEFfLRmZ?=
 =?us-ascii?Q?5oJO6JM2zE4xyLoD2Dn/AuWKtZytzUiPge6pO6msJ5WFn257Qcun7R4rWgf9?=
 =?us-ascii?Q?Rqc+pHGCYvfm+R+PZ+QuNVTDqqyZuVbJOJ13g1oE9b7IVS+Eb66UFF7AZVAY?=
 =?us-ascii?Q?Ff/GBb87eK1lCxazpfB+WtvgFv+Wxu6b6Dgy8X80zkn4eVxCOtu4fnJumEIA?=
 =?us-ascii?Q?KhbmnkqmTOehzRGSsDc0f3LrpS9lqPPt7zorcLKdX3233YuQowViTvxkfY61?=
 =?us-ascii?Q?vSOolCzaHb9Mm7dU3at1B4C97do4uLj6NHdTcsMiW3Tt2VgcGIGSOkAVnBkN?=
 =?us-ascii?Q?fFZtoKnTA1AUajqhy92KsVNDrKSOgab+6ev9BwzLzvN+Sqf5AZBivqHHK/q5?=
 =?us-ascii?Q?uK30x29/u14qkkXVJPtWVdAkWmOyx2du/ObDfmlz2bV+D9iYkBNTsjHpV7H3?=
 =?us-ascii?Q?+WTqygQHQ6nnH2YZWZ15sPGpGoFSNJBO1/XEc78/L4zq71d2WRyD5R33UdWZ?=
 =?us-ascii?Q?jUHL2VAlgle5cKaFIhFTslWnQ7fMEeHdP/dGjPLGmwJzIDQl0j6Y9Z8bR0dM?=
 =?us-ascii?Q?YQHO63RqjajW9W/w+IjQvCxyZhQeyWm7XbdAdNSzlhQd2FOAV32pSfDjyPrP?=
 =?us-ascii?Q?I8KjRFaAC4fSwGemgIgufRCKoIXs+qgt+9kYNt/jOJSvlz00Mic136+TZMCI?=
 =?us-ascii?Q?rs+aELLuug=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a5566ac9-0e18-494b-c263-08def4787b7a
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 11:39:03.9486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4gZEnFgbZmrl54BfVYDt9Z8iBpWxO2OY3TtqgQkCjZc1JnWH1lG2IUFNafTs3rxBLbsDZ8wAAdmfhynMpqfgnH9B0lN8M2vuzn6Ff037nBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3651
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 11:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243009

d9da609 project: preserve -c optimization when revision is a SHA-1
4bec297 command: Respect smart sync override declaratively by default
54fa31c project: derive HEAD fallback from git's own default branch
29b6630 project: make GetHead file-read fallback reftable-aware
0b82311 sync: allow syncing groups with repo sync -g group
06c4f9e git_superproject: don't filter rewritten manifest
dd11303 sync: Deprecate fetch-submodules flag names
eeba6f2 hooks: pass yes flag when available
1729aae project: Skip superproject upstream check for MetaProjects
978adb7 sync: Add CLI flag for globally disabling submodule fetch
0398c67 color: Replace anonymous sentinel with named class
3bb4871 rebase: Resolve revisionExpr to tracking branch for --onto-manifest

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-devtools/repo/{repo_2.65.bb =3D> repo_2.66.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.65.bb =3D> repo_2.66.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.65.bb b/meta/recipes-devtool=
s/repo/repo_2.66.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.65.bb
rename to meta/recipes-devtools/repo/repo_2.66.bb
index 2a235b7ec5..e03cf7f019 100644
--- a/meta/recipes-devtools/repo/repo_2.65.bb
+++ b/meta/recipes-devtools/repo/repo_2.66.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57"
=20
 SRC_URI =3D "git://gerrit.googlesource.com/git-repo.git;protocol=3Dhttps;b=
ranch=3Dmain;tag=3Dv${PV} \
            "
-SRCREV =3D "35bbf701d04de5c6a71937279bc3d16f6ce36808"
+SRCREV =3D "d9da609d8c120bb882a43196a4a6b7f183418304"
=20
 MIRRORS +=3D "git://gerrit.googlesource.com/git-repo.git git://github.com/=
GerritCodeReview/git-repo.git"
=20

