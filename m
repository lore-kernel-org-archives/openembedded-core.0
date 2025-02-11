Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C014C021BC
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:15 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.137])
 by mx.groups.io with SMTP id smtpd.web11.1143.1739286064813401053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:01:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=d3oFF90i;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.137, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4Eq06PiVpZLHQhM/zYYpaBepwOkdEjHaulqpmk36cBcYkcG/hXS+JU41TQFV5JY2ECCVM5UioLlxC5QsrtRpXQ807iYm4DmKqFtm/0CKChWt+W+Uz8e07mlTjEm/A8Vq3Odj50Syp8y8NcG+NcLdvi7xfb+NoID668/URHgov57Mja8LSLuE0lLaYsbqtQtROugD825qHy8Y7OLK2eG+2IfdHZfe7sJaG1OucLiV6vaQ9UY6P2tAkMqtlM5mrg8tfVWsWOlWQ5eIr2r+s7179dMRkB07p4EW5pLjeRBvPQgmA2LkR+p1i+C602IDbRPVIBGN2dLkl3yXgbvWs69Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aPAcFE2+5ey3l9q0Ajc1gUDndl2IzaZZbgddDYakirY=;
 b=DqRATAlalUzm9QdczNKwWoiMeXiwyvkkxD71nksrI8jCHGgcnmwk/f4RiiyBpfLgmp+do4zzJnJVWWMUbDjkRLBgaQSwVnM5Lu9wiyeOv4rOjb9XcTEdWGQk00fd6yixfdjGekyf0lqanziHi4jKV1LA3ZMxknBLXGbanpp44T1FUK0q5efBxg2COc3BagCQvVLVr5AyepAQq6KsoB6CnA7LecWjHCxgmQeIAc5MdD13mnJq1h4RW+rdqtlpOtF7fNre+SmJ+oCvBJpdINeSauQj1LQpDH8nVkJ1j5cifTKhemKqYXyEIxqU4m8scWbHIMMOCtma25qAjXvcDKgINw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPAcFE2+5ey3l9q0Ajc1gUDndl2IzaZZbgddDYakirY=;
 b=d3oFF90ij9B1h/9qZIwTZbeaFhHJrwgCphUM+oxahItzRZHx7hj7+AjefZgwsKY4DTV6Sxv5tvP8YuWjoz1gOHs62kZmT805wnzqQZuJsY95v9O3MjE3j8ap0O8Lvquu8Aax226c5v7mp/t73aXbqty5TU7ia9Otuzogy2CBiGyrDttvVPpEVkxo37GnzcQ5kFPl3aqwQOksGem7Pezs/TjVURjQm2cd+6tpUZRgxjz0rWH2zXBUPqr1ptlgllgAT4RtZKcCjSc1YiLtqNdPV/QjRPxHk5pKxb/8J+N8rlbmehfJ3OzDjyrB1pmsowbqE6tUErOQP5zqUOKTZsX0Vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by AM7PR08MB5399.eurprd08.prod.outlook.com (2603:10a6:20b:104::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 15:01:03 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:01:03 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 23/30] python3-maturin: mirgrate to vendor cargo class
Date: Tue, 11 Feb 2025 16:00:27 +0100
Message-ID: <20250211150034.18696-23-stefan.herbrechtsmeier-oss@weidmueller.com>
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
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|AM7PR08MB5399:EE_
X-MS-Office365-Filtering-Correlation-Id: 78b5907f-d5f1-48c3-7bf6-08dd4aace39b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HbsxOKi9zFxAVcaW5DZUGXHsMXAwqBYMXE28SKxhUYaWdJyNMTiE5tYpMVH9?=
 =?us-ascii?Q?mUNFmqdlKd/6WXsDfa9+wXS9PE9AjPSeJuG0cbzz1au7XHRM+hnjgN7NFvrb?=
 =?us-ascii?Q?FmtTy+0V3SIbA3vfS5TacQshIGlj5wP1t1EtRtCmrDoHaK+D6UzotJQPR13P?=
 =?us-ascii?Q?985+vKa0XhoN57ZbRy4jVLn3sJEnQx9TvWaJw4d9nP2wV9FYUhSiGMcF20/q?=
 =?us-ascii?Q?h29AD9rt+jPq0FZUMawWy+u5J5hps1Yxb2n3t/u3x9DvFhPQS6EEPyDVhQNJ?=
 =?us-ascii?Q?zRmhzjb8suH4TkNsjfG56Pf9ENj+VYJSSYPQ4VIuSGSk0KJFnqHVkDN/WB/s?=
 =?us-ascii?Q?XCgYNPz+Rb4jejP9WCo1gVHpmKStHKWDm7qSXdnUzESOF7FrAbzx1JfSKPTI?=
 =?us-ascii?Q?ToyBVz5f8jYu/8PqBl4ra7wIygWs7TL+MJDvlZ0JrOuRNCSnhI/tGNtfhbBe?=
 =?us-ascii?Q?Mpnsa2xg/2BIWtjwJ+PIe6PjOD8pZyy17F3oMilHNY/bpu6V1sZymVhKUIH3?=
 =?us-ascii?Q?kkYend+cc7fnjBbXJcg0e0VW1U+0/TwHGeoBFrBWiNq/ixGlSt0AucjG80Bp?=
 =?us-ascii?Q?UnwY2tuNpuSBwuvjms3RztQCifD4icqNBvh8B5XIy1thBr4cqSNeEGFYrwyB?=
 =?us-ascii?Q?hUWaKOhvS7coqNfajoaFJKyDDNCViBR8wTYVJ+4PkXeXICnbElKbhzRyJ75w?=
 =?us-ascii?Q?jz/pIFlWjvlFfP8vI2mwLxNBI70gRPP6uUSxYd0mntavHTQYMJ1agPGD2/o4?=
 =?us-ascii?Q?WtN/yRqM5rzKc263LLbQ3UikRv2UuvuVe7HtZ6sylECVd+IWiy/GoCFAfQg5?=
 =?us-ascii?Q?aCHxK3TqmUYutImSaoEvDZPbVKATmhrpAYTTKf4Cbx5ugHc6yLzzRJxaCqt4?=
 =?us-ascii?Q?komAABQITFgj2WgElSCgIL6o02kyj+30zsoCccgKoi1M7f570mKv6wCNIyRd?=
 =?us-ascii?Q?fCoS9ZUT/eI6dpzJ0QZrtBESH/eg13p2JQPpWsmJ6G/OUxSXByy+CRuEfAJr?=
 =?us-ascii?Q?9bUw2DSGf2TsbdBNRSY2JRnwaInaBmhtfamz7EG6//Ax0mfx4vgviy+sdtvR?=
 =?us-ascii?Q?h8Tkd3Nw6MM+oaqdgbUvouOc0WRC9D1BFrs2+tauvJ57SQkIKsryQuMJIuZm?=
 =?us-ascii?Q?R0+QUi9s8L/Dhfe2z6qH4SC+I/6GCqgeYJy7GAEA4az4l/ABaf4k4o7wnCah?=
 =?us-ascii?Q?v8j42Xwy9jfyJQloHsImc7ZMGzYSzz4IVTzb0KFozTLiCwfGOsLe7l3iM91r?=
 =?us-ascii?Q?dKU+AYyvdnd70DANwpYjdESEzxHP7L+/UcNsTjxDBQbSFsDRfdODMcErapyi?=
 =?us-ascii?Q?JBImcXhyKsSc/CDZxaLPc786XiSUIW02r+mLgNR0BjCl/+sC6Q+kqtk0S3hb?=
 =?us-ascii?Q?/ApWTUMeUyCgRPXfbprkaSoA+SFDInFkjrmNAyqf9eoH+B3J77hESC1tn/Je?=
 =?us-ascii?Q?E6RtjNhUwfFUMAgGfrjvMWP2XI6/GLYC?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:sl;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3X1mvFt/JJOVmOPShtY656OW+8W7mWyDCgl862NBj8x2ifo75oSZYPHjpQHi?=
 =?us-ascii?Q?nrrVpGoEGXrf2+QajeOgl0r0LC+eTXe337Uyh7fQBa9IEIhumnvriaw5viOP?=
 =?us-ascii?Q?rEyHeEQyyUeXbxSDr9zBuW8feQ2ybeYyuYTNfXamzaPOm+yjoq6E9meyN+c7?=
 =?us-ascii?Q?oRNkUkXXk30NLfJn3sKKf+bzooXlpOlFT1AsFbjrTZMRis2zvAJAcYlmf78j?=
 =?us-ascii?Q?bFes3ns0UoYypCulZZqf5XMessU5I7/MCPWom3Nef5IrL+bb1TjsxzAJ9QVQ?=
 =?us-ascii?Q?t7ze8uI4+KcJ6P0fqR7OmRrqfqKymZd+fHyjsfM9+wl3ZbzvHVeeaG2NgA0F?=
 =?us-ascii?Q?4uNg3uRBTSEfm74D3zPKmea0UXKvuNvza64WTXw+3Wqa9ylGxQ9h+txjDmNM?=
 =?us-ascii?Q?aOW94HnODYGnZD4IDn2WZlkRq/b05kOfVpIz6hMRaD//3PehmxfueYb5pfVl?=
 =?us-ascii?Q?h1eKZ1uuK5inoEPU+KebD+J1Gqg5nwbrgzGXtLkB8knIQR9irwH2uJexd15A?=
 =?us-ascii?Q?IAcVCDKV694q4CdMV/LSVtiowAWNf+lL6ZDu61AI9Hq9fEteoTDLxbItn6KF?=
 =?us-ascii?Q?IsxmNvyCMj0KU0bDEmkfgJn0xmrVaftCLSsP7Gb8VYxNSlf2/S7LN0v+Uv0t?=
 =?us-ascii?Q?TCq9yZYqjMfKs6lC3NV8wYpTrE1N96WuUZ0ERRixXcz5yI6mrr8JZ1kRYFFL?=
 =?us-ascii?Q?t+vhYOiKZxwEJmBw20VouNN9wdvn+C/2ltodT3RDote9LLIe78nOb1aydgMH?=
 =?us-ascii?Q?Dp8KxIKFlabzltK7oRoTIRLOBnET9YQTY9fxAdf4U1RnggOhgXyP91ShKqVk?=
 =?us-ascii?Q?n9d8PqZhApKhmPBYpL7SsgjTEaUK8/bDgp820yl1YSFvyMi9mRZ7X6Yb3oFr?=
 =?us-ascii?Q?bGBmaL+Q2AY/paXfzWFltcNGZLqjaO+TLtXuq0b73O3UOEFAKHVe2VfDL5kM?=
 =?us-ascii?Q?uB2UspdwiqtXUUbF1lvAt2sxZL2+m6SltXTau/4X5ZzhvcAuDirXW1vB///G?=
 =?us-ascii?Q?onMEAF8P3oRWpW3MJqlPSN8O9X26tu5tkGYPEEze0PSfQCSpja07avlPrSlm?=
 =?us-ascii?Q?v3TBo/EP8m9C2FqvW0YjkDEsZLiiCRotgqqDu2o8kQMOse4dX3TflZDyqx+5?=
 =?us-ascii?Q?+zsZaxT8eYg86behJucL9KJnJTHQXYDF4pRQpygdjsNMGNlgqkquG4mLEN1Y?=
 =?us-ascii?Q?lBJG5/MWZdutRPdueCVPgQyysjReqfFVnDX6NCUP0px2/8HMZZob9oo71Utg?=
 =?us-ascii?Q?UPxNWuKR10RasDRYUPuoSKdtryhbRY65HjnIcAzNRWxQXbLwE714VXRSs9nD?=
 =?us-ascii?Q?Lj3jrAHRTOsJFOSTZ8y6FFydsy1GodJvyUct+UZqNC98QlHmB9jjIc2b89YX?=
 =?us-ascii?Q?b2nSPEIJq7HPKLtG6xnGIdxqexnEn8Ow9+BCRhFHLFSR/lQduTwCF+7SoSGo?=
 =?us-ascii?Q?Uk8igbG2cs/jD0zAtw+A20Z5LVTIclNTJPFDV2FFFcGo/jtw3EEv+HCeBtdN?=
 =?us-ascii?Q?jTlYKQVaHII1uFqyaGh66ybLatCN8c025OtLrZ+HONQkuSZTuvpPBfQ+CFXP?=
 =?us-ascii?Q?bEqPgnCDlOmSzprn7EZGZsqtt5h5Kg4fNoTXXfyzhP7aoNatu00esXI4+WF6?=
 =?us-ascii?Q?Jw=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b5907f-d5f1-48c3-7bf6-08dd4aace39b
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:57.3809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o46iQwZLRgoZSQ1FXFUGCYB7yJSVg0oNm8YQIhQC3ne7a2YvGQ1L3RPjwf6QJKJGxERKzVmyorraj59r+8j8YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5399
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211148

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 .../python/python3-maturin-crates.inc         | 712 ------------------
 .../python/python3-maturin_1.8.1.bb           |   4 +-
 2 files changed, 1 insertion(+), 715 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-maturin-crates.inc

diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b/meta=
/recipes-devtools/python/python3-maturin-crates.inc
deleted file mode 100644
index abb8fe4a62..0000000000
--- a/meta/recipes-devtools/python/python3-maturin-crates.inc
+++ /dev/null
@@ -1,712 +0,0 @@
-# Autogenerated with 'bitbake -c update_crates python3-maturin'
-
-# from Cargo.lock
-SRC_URI +=3D " \
-    crate://crates.io/adler2/2.0.0 \
-    crate://crates.io/ahash/0.8.11 \
-    crate://crates.io/aho-corasick/1.1.3 \
-    crate://crates.io/allocator-api2/0.2.18 \
-    crate://crates.io/anstream/0.6.14 \
-    crate://crates.io/anstyle/1.0.7 \
-    crate://crates.io/anstyle-parse/0.2.4 \
-    crate://crates.io/anstyle-query/1.1.0 \
-    crate://crates.io/anstyle-wincon/3.0.3 \
-    crate://crates.io/anyhow/1.0.89 \
-    crate://crates.io/arbitrary/1.4.1 \
-    crate://crates.io/autocfg/1.3.0 \
-    crate://crates.io/automod/1.0.14 \
-    crate://crates.io/base64/0.21.7 \
-    crate://crates.io/base64/0.22.1 \
-    crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bitflags/2.5.0 \
-    crate://crates.io/block-buffer/0.10.4 \
-    crate://crates.io/bstr/1.10.0 \
-    crate://crates.io/bumpalo/3.16.0 \
-    crate://crates.io/byteorder/1.5.0 \
-    crate://crates.io/bytes/1.7.1 \
-    crate://crates.io/bytesize/1.3.0 \
-    crate://crates.io/bzip2/0.4.4 \
-    crate://crates.io/bzip2-sys/0.1.11+1.0.8 \
-    crate://crates.io/cab/0.6.0 \
-    crate://crates.io/camino/1.1.9 \
-    crate://crates.io/cargo-config2/0.1.30 \
-    crate://crates.io/cargo-options/0.7.4 \
-    crate://crates.io/cargo-platform/0.1.8 \
-    crate://crates.io/cargo-xwin/0.18.3 \
-    crate://crates.io/cargo-zigbuild/0.19.7 \
-    crate://crates.io/cargo_metadata/0.19.0 \
-    crate://crates.io/cbindgen/0.27.0 \
-    crate://crates.io/cc/1.1.21 \
-    crate://crates.io/cfb/0.10.0 \
-    crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/charset/0.1.5 \
-    crate://crates.io/chumsky/0.9.3 \
-    crate://crates.io/clap/4.5.7 \
-    crate://crates.io/clap_builder/4.5.7 \
-    crate://crates.io/clap_complete/4.5.5 \
-    crate://crates.io/clap_complete_command/0.6.1 \
-    crate://crates.io/clap_complete_nushell/4.5.2 \
-    crate://crates.io/clap_derive/4.5.5 \
-    crate://crates.io/clap_lex/0.7.1 \
-    crate://crates.io/cli-table/0.4.7 \
-    crate://crates.io/colorchoice/1.0.1 \
-    crate://crates.io/configparser/3.1.0 \
-    crate://crates.io/console/0.15.8 \
-    crate://crates.io/content_inspector/0.2.4 \
-    crate://crates.io/core-foundation/0.9.4 \
-    crate://crates.io/core-foundation-sys/0.8.6 \
-    crate://crates.io/cpufeatures/0.2.12 \
-    crate://crates.io/crc/3.2.1 \
-    crate://crates.io/crc-catalog/2.4.0 \
-    crate://crates.io/crc32fast/1.4.2 \
-    crate://crates.io/crossbeam-channel/0.5.13 \
-    crate://crates.io/crossbeam-deque/0.8.5 \
-    crate://crates.io/crossbeam-epoch/0.9.18 \
-    crate://crates.io/crossbeam-utils/0.8.20 \
-    crate://crates.io/crypto-common/0.1.6 \
-    crate://crates.io/data-encoding/2.6.0 \
-    crate://crates.io/deranged/0.3.11 \
-    crate://crates.io/derivative/2.2.0 \
-    crate://crates.io/derive_arbitrary/1.4.1 \
-    crate://crates.io/dialoguer/0.11.0 \
-    crate://crates.io/diff/0.1.13 \
-    crate://crates.io/digest/0.10.7 \
-    crate://crates.io/dirs/5.0.1 \
-    crate://crates.io/dirs-sys/0.4.1 \
-    crate://crates.io/displaydoc/0.2.5 \
-    crate://crates.io/dissimilar/1.0.9 \
-    crate://crates.io/dunce/1.0.5 \
-    crate://crates.io/dyn-clone/1.0.17 \
-    crate://crates.io/either/1.13.0 \
-    crate://crates.io/encode_unicode/0.3.6 \
-    crate://crates.io/encoding_rs/0.8.34 \
-    crate://crates.io/equivalent/1.0.1 \
-    crate://crates.io/errno/0.3.9 \
-    crate://crates.io/expect-test/1.5.0 \
-    crate://crates.io/fastrand/2.1.0 \
-    crate://crates.io/fat-macho/0.4.9 \
-    crate://crates.io/filetime/0.2.23 \
-    crate://crates.io/flate2/1.0.33 \
-    crate://crates.io/fnv/1.0.7 \
-    crate://crates.io/foreign-types/0.3.2 \
-    crate://crates.io/foreign-types-shared/0.1.1 \
-    crate://crates.io/form_urlencoded/1.2.1 \
-    crate://crates.io/fs-err/3.0.0 \
-    crate://crates.io/fs4/0.12.0 \
-    crate://crates.io/futures/0.3.30 \
-    crate://crates.io/futures-channel/0.3.31 \
-    crate://crates.io/futures-core/0.3.31 \
-    crate://crates.io/futures-executor/0.3.30 \
-    crate://crates.io/futures-io/0.3.31 \
-    crate://crates.io/futures-macro/0.3.31 \
-    crate://crates.io/futures-sink/0.3.31 \
-    crate://crates.io/futures-task/0.3.31 \
-    crate://crates.io/futures-timer/3.0.3 \
-    crate://crates.io/futures-util/0.3.31 \
-    crate://crates.io/generic-array/0.14.7 \
-    crate://crates.io/getrandom/0.2.15 \
-    crate://crates.io/glob/0.3.1 \
-    crate://crates.io/globset/0.4.15 \
-    crate://crates.io/goblin/0.9.2 \
-    crate://crates.io/hashbrown/0.14.5 \
-    crate://crates.io/heck/0.4.1 \
-    crate://crates.io/heck/0.5.0 \
-    crate://crates.io/home/0.5.9 \
-    crate://crates.io/humantime/2.1.0 \
-    crate://crates.io/humantime-serde/1.1.1 \
-    crate://crates.io/icu_collections/1.5.0 \
-    crate://crates.io/icu_locid/1.5.0 \
-    crate://crates.io/icu_locid_transform/1.5.0 \
-    crate://crates.io/icu_locid_transform_data/1.5.0 \
-    crate://crates.io/icu_normalizer/1.5.0 \
-    crate://crates.io/icu_normalizer_data/1.5.0 \
-    crate://crates.io/icu_properties/1.5.1 \
-    crate://crates.io/icu_properties_data/1.5.0 \
-    crate://crates.io/icu_provider/1.5.0 \
-    crate://crates.io/icu_provider_macros/1.5.0 \
-    crate://crates.io/idna/1.0.3 \
-    crate://crates.io/idna_adapter/1.2.0 \
-    crate://crates.io/ignore/0.4.23 \
-    crate://crates.io/indexmap/2.5.0 \
-    crate://crates.io/indicatif/0.17.8 \
-    crate://crates.io/indoc/2.0.5 \
-    crate://crates.io/instant/0.1.13 \
-    crate://crates.io/is_terminal_polyfill/1.70.0 \
-    crate://crates.io/itertools/0.12.1 \
-    crate://crates.io/itoa/1.0.11 \
-    crate://crates.io/keyring/2.3.3 \
-    crate://crates.io/lazy_static/1.4.0 \
-    crate://crates.io/lddtree/0.3.7 \
-    crate://crates.io/libc/0.2.158 \
-    crate://crates.io/libmimalloc-sys/0.1.38 \
-    crate://crates.io/libredox/0.1.3 \
-    crate://crates.io/linux-keyutils/0.2.4 \
-    crate://crates.io/linux-raw-sys/0.4.14 \
-    crate://crates.io/litemap/0.7.3 \
-    crate://crates.io/lock_api/0.4.12 \
-    crate://crates.io/lockfree-object-pool/0.1.6 \
-    crate://crates.io/log/0.4.21 \
-    crate://crates.io/lzma-sys/0.1.20 \
-    crate://crates.io/lzxd/0.2.5 \
-    crate://crates.io/mailparse/0.15.0 \
-    crate://crates.io/matchers/0.1.0 \
-    crate://crates.io/memchr/2.7.2 \
-    crate://crates.io/mimalloc/0.1.42 \
-    crate://crates.io/mime/0.3.17 \
-    crate://crates.io/mime_guess/2.0.4 \
-    crate://crates.io/minijinja/2.5.0 \
-    crate://crates.io/minimal-lexical/0.2.1 \
-    crate://crates.io/miniz_oxide/0.8.0 \
-    crate://crates.io/msi/0.8.0 \
-    crate://crates.io/multipart/0.18.0 \
-    crate://crates.io/native-tls/0.2.12 \
-    crate://crates.io/nom/7.1.3 \
-    crate://crates.io/normalize-line-endings/0.3.0 \
-    crate://crates.io/normpath/1.2.0 \
-    crate://crates.io/nu-ansi-term/0.46.0 \
-    crate://crates.io/num-conv/0.1.0 \
-    crate://crates.io/number_prefix/0.4.0 \
-    crate://crates.io/once_cell/1.19.0 \
-    crate://crates.io/openssl/0.10.66 \
-    crate://crates.io/openssl-macros/0.1.1 \
-    crate://crates.io/openssl-probe/0.1.5 \
-    crate://crates.io/openssl-sys/0.9.103 \
-    crate://crates.io/option-ext/0.2.0 \
-    crate://crates.io/os_pipe/1.2.0 \
-    crate://crates.io/overload/0.1.1 \
-    crate://crates.io/parking_lot/0.12.3 \
-    crate://crates.io/parking_lot_core/0.9.10 \
-    crate://crates.io/paste/1.0.15 \
-    crate://crates.io/path-slash/0.2.1 \
-    crate://crates.io/pep440_rs/0.6.6 \
-    crate://crates.io/pep508_rs/0.6.1 \
-    crate://crates.io/percent-encoding/2.3.1 \
-    crate://crates.io/pin-project-lite/0.2.14 \
-    crate://crates.io/pin-utils/0.1.0 \
-    crate://crates.io/pkg-config/0.3.30 \
-    crate://crates.io/plain/0.2.3 \
-    crate://crates.io/platform-info/2.0.3 \
-    crate://crates.io/portable-atomic/1.6.0 \
-    crate://crates.io/powerfmt/0.2.0 \
-    crate://crates.io/ppv-lite86/0.2.17 \
-    crate://crates.io/pretty_assertions/1.4.1 \
-    crate://crates.io/proc-macro-crate/3.1.0 \
-    crate://crates.io/proc-macro2/1.0.85 \
-    crate://crates.io/psm/0.1.21 \
-    crate://crates.io/pyproject-toml/0.11.0 \
-    crate://crates.io/python-pkginfo/0.6.5 \
-    crate://crates.io/quote/1.0.36 \
-    crate://crates.io/quoted_printable/0.5.0 \
-    crate://crates.io/rand/0.8.5 \
-    crate://crates.io/rand_chacha/0.3.1 \
-    crate://crates.io/rand_core/0.6.4 \
-    crate://crates.io/rayon/1.10.0 \
-    crate://crates.io/rayon-core/1.12.1 \
-    crate://crates.io/redox_syscall/0.4.1 \
-    crate://crates.io/redox_syscall/0.5.1 \
-    crate://crates.io/redox_users/0.4.5 \
-    crate://crates.io/regex/1.10.6 \
-    crate://crates.io/regex-automata/0.1.10 \
-    crate://crates.io/regex-automata/0.4.7 \
-    crate://crates.io/regex-syntax/0.6.29 \
-    crate://crates.io/regex-syntax/0.8.4 \
-    crate://crates.io/relative-path/1.9.3 \
-    crate://crates.io/rfc2047-decoder/1.0.6 \
-    crate://crates.io/ring/0.17.8 \
-    crate://crates.io/rstest/0.22.0 \
-    crate://crates.io/rstest_macros/0.22.0 \
-    crate://crates.io/rustc_version/0.4.1 \
-    crate://crates.io/rustflags/0.1.6 \
-    crate://crates.io/rustix/0.38.34 \
-    crate://crates.io/rustls/0.23.19 \
-    crate://crates.io/rustls-pemfile/2.1.3 \
-    crate://crates.io/rustls-pki-types/1.10.0 \
-    crate://crates.io/rustls-webpki/0.102.8 \
-    crate://crates.io/rustversion/1.0.17 \
-    crate://crates.io/ryu/1.0.18 \
-    crate://crates.io/same-file/1.0.6 \
-    crate://crates.io/schannel/0.1.23 \
-    crate://crates.io/schemars/0.8.21 \
-    crate://crates.io/schemars_derive/0.8.21 \
-    crate://crates.io/scopeguard/1.2.0 \
-    crate://crates.io/scroll/0.12.0 \
-    crate://crates.io/scroll_derive/0.12.0 \
-    crate://crates.io/security-framework/2.11.0 \
-    crate://crates.io/security-framework-sys/2.11.0 \
-    crate://crates.io/semver/1.0.23 \
-    crate://crates.io/serde/1.0.216 \
-    crate://crates.io/serde_derive/1.0.216 \
-    crate://crates.io/serde_derive_internals/0.29.1 \
-    crate://crates.io/serde_json/1.0.133 \
-    crate://crates.io/serde_spanned/0.6.6 \
-    crate://crates.io/sha2/0.10.8 \
-    crate://crates.io/sharded-slab/0.1.7 \
-    crate://crates.io/shell-words/1.1.0 \
-    crate://crates.io/shlex/1.3.0 \
-    crate://crates.io/simd-adler32/0.3.7 \
-    crate://crates.io/similar/2.5.0 \
-    crate://crates.io/slab/0.4.9 \
-    crate://crates.io/smallvec/1.13.2 \
-    crate://crates.io/smawk/0.3.2 \
-    crate://crates.io/snapbox/0.6.16 \
-    crate://crates.io/snapbox-macros/0.3.10 \
-    crate://crates.io/socks/0.3.4 \
-    crate://crates.io/spin/0.9.8 \
-    crate://crates.io/stable_deref_trait/1.2.0 \
-    crate://crates.io/stacker/0.1.15 \
-    crate://crates.io/static_assertions/1.1.0 \
-    crate://crates.io/strsim/0.11.1 \
-    crate://crates.io/subtle/2.5.0 \
-    crate://crates.io/syn/1.0.109 \
-    crate://crates.io/syn/2.0.87 \
-    crate://crates.io/synstructure/0.13.1 \
-    crate://crates.io/tar/0.4.43 \
-    crate://crates.io/target-lexicon/0.13.0 \
-    crate://crates.io/tempfile/3.11.0 \
-    crate://crates.io/termcolor/1.4.1 \
-    crate://crates.io/terminal_size/0.3.0 \
-    crate://crates.io/textwrap/0.16.1 \
-    crate://crates.io/thiserror/1.0.64 \
-    crate://crates.io/thiserror/2.0.3 \
-    crate://crates.io/thiserror-impl/1.0.64 \
-    crate://crates.io/thiserror-impl/2.0.3 \
-    crate://crates.io/thread_local/1.1.8 \
-    crate://crates.io/time/0.3.36 \
-    crate://crates.io/time-core/0.1.2 \
-    crate://crates.io/time-macros/0.2.18 \
-    crate://crates.io/tinystr/0.7.6 \
-    crate://crates.io/toml/0.8.15 \
-    crate://crates.io/toml_datetime/0.6.6 \
-    crate://crates.io/toml_edit/0.21.1 \
-    crate://crates.io/toml_edit/0.22.16 \
-    crate://crates.io/tracing/0.1.40 \
-    crate://crates.io/tracing-attributes/0.1.27 \
-    crate://crates.io/tracing-core/0.1.32 \
-    crate://crates.io/tracing-log/0.2.0 \
-    crate://crates.io/tracing-serde/0.1.3 \
-    crate://crates.io/tracing-subscriber/0.3.18 \
-    crate://crates.io/trycmd/0.15.6 \
-    crate://crates.io/twox-hash/1.6.3 \
-    crate://crates.io/typenum/1.17.0 \
-    crate://crates.io/unicase/2.7.0 \
-    crate://crates.io/unicode-ident/1.0.12 \
-    crate://crates.io/unicode-linebreak/0.1.5 \
-    crate://crates.io/unicode-width/0.1.13 \
-    crate://crates.io/unicode-xid/0.2.6 \
-    crate://crates.io/unscanny/0.1.0 \
-    crate://crates.io/untrusted/0.9.0 \
-    crate://crates.io/ureq/2.11.0 \
-    crate://crates.io/url/2.5.4 \
-    crate://crates.io/urlencoding/2.1.3 \
-    crate://crates.io/utf16_iter/1.0.5 \
-    crate://crates.io/utf8_iter/1.0.4 \
-    crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.8.0 \
-    crate://crates.io/valuable/0.1.0 \
-    crate://crates.io/vcpkg/0.2.15 \
-    crate://crates.io/version_check/0.9.4 \
-    crate://crates.io/versions/6.2.0 \
-    crate://crates.io/wait-timeout/0.2.0 \
-    crate://crates.io/walkdir/2.5.0 \
-    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
-    crate://crates.io/webpki-roots/0.26.2 \
-    crate://crates.io/which/7.0.0 \
-    crate://crates.io/wild/2.2.1 \
-    crate://crates.io/winapi/0.3.9 \
-    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi-util/0.1.8 \
-    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
-    crate://crates.io/windows-sys/0.48.0 \
-    crate://crates.io/windows-sys/0.52.0 \
-    crate://crates.io/windows-targets/0.48.5 \
-    crate://crates.io/windows-targets/0.52.6 \
-    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
-    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
-    crate://crates.io/windows_aarch64_msvc/0.48.5 \
-    crate://crates.io/windows_aarch64_msvc/0.52.6 \
-    crate://crates.io/windows_i686_gnu/0.48.5 \
-    crate://crates.io/windows_i686_gnu/0.52.6 \
-    crate://crates.io/windows_i686_gnullvm/0.52.6 \
-    crate://crates.io/windows_i686_msvc/0.48.5 \
-    crate://crates.io/windows_i686_msvc/0.52.6 \
-    crate://crates.io/windows_x86_64_gnu/0.48.5 \
-    crate://crates.io/windows_x86_64_gnu/0.52.6 \
-    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
-    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
-    crate://crates.io/windows_x86_64_msvc/0.48.5 \
-    crate://crates.io/windows_x86_64_msvc/0.52.6 \
-    crate://crates.io/winnow/0.5.40 \
-    crate://crates.io/winnow/0.6.13 \
-    crate://crates.io/winsafe/0.0.19 \
-    crate://crates.io/write16/1.0.0 \
-    crate://crates.io/writeable/0.5.5 \
-    crate://crates.io/xattr/1.3.1 \
-    crate://crates.io/xwin/0.6.5 \
-    crate://crates.io/xz2/0.1.7 \
-    crate://crates.io/yansi/1.0.1 \
-    crate://crates.io/yoke/0.7.4 \
-    crate://crates.io/yoke-derive/0.7.5 \
-    crate://crates.io/zerocopy/0.7.34 \
-    crate://crates.io/zerocopy-derive/0.7.34 \
-    crate://crates.io/zerofrom/0.1.4 \
-    crate://crates.io/zerofrom-derive/0.1.5 \
-    crate://crates.io/zeroize/1.8.1 \
-    crate://crates.io/zerovec/0.10.4 \
-    crate://crates.io/zerovec-derive/0.10.3 \
-    crate://crates.io/zip/2.1.6 \
-    crate://crates.io/zopfli/0.8.1 \
-"
-
-SRC_URI[adler2-2.0.0.sha256sum] =3D "512761e0bb2578dd7380c6baaa0f4ce03e84f=
95e960231d1dec8bf4d7d6e2627"
-SRC_URI[ahash-0.8.11.sha256sum] =3D "e89da841a80418a9b391ebaea17f5c112ffaa=
a96f621d2c285b5174da76b9011"
-SRC_URI[aho-corasick-1.1.3.sha256sum] =3D "8e60d3430d3a69478ad0993f19238d2=
df97c507009a52b3c10addcd7f6bcb916"
-SRC_URI[allocator-api2-0.2.18.sha256sum] =3D "5c6cb57a04249c6480766f7f7cef=
5467412af1490f8d1e243141daddada3264f"
-SRC_URI[anstream-0.6.14.sha256sum] =3D "418c75fa768af9c03be99d17643f93f79b=
bba589895012a80e3452a19ddda15b"
-SRC_URI[anstyle-1.0.7.sha256sum] =3D "038dfcf04a5feb68e9c60b21c9625a54c2c0=
616e79b72b0fd87075a056ae1d1b"
-SRC_URI[anstyle-parse-0.2.4.sha256sum] =3D "c03a11a9034d92058ceb6ee011ce58=
af4a9bf61491aa7e1e59ecd24bd40d22d4"
-SRC_URI[anstyle-query-1.1.0.sha256sum] =3D "ad186efb764318d35165f1758e7dce=
f3b10628e26d41a44bc5550652e6804391"
-SRC_URI[anstyle-wincon-3.0.3.sha256sum] =3D "61a38449feb7068f52bb06c127590=
05cf459ee52bb4adc1d5a7c4322d716fb19"
-SRC_URI[anyhow-1.0.89.sha256sum] =3D "86fdf8605db99b54d3cd748a44c6d04df638=
eb5dafb219b135d0149bd0db01f6"
-SRC_URI[arbitrary-1.4.1.sha256sum] =3D "dde20b3d026af13f561bdd0f15edf01fc7=
34f0dafcedbaf42bba506a9517f223"
-SRC_URI[autocfg-1.3.0.sha256sum] =3D "0c4b4d0bd25bd0b74681c0ad21497610ce1b=
7c91b1022cd21c80c6fbdd9476b0"
-SRC_URI[automod-1.0.14.sha256sum] =3D "edf3ee19dbc0a46d740f6f0926bde8c50f0=
2bdbc7b536842da28f6ac56513a8b"
-SRC_URI[base64-0.21.7.sha256sum] =3D "9d297deb1925b89f2ccc13d7635fa0714f12=
c87adce1c75356b39ca9b7178567"
-SRC_URI[base64-0.22.1.sha256sum] =3D "72b3254f16251a8381aa12e40e3c4d2f0199=
f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[bitflags-1.3.2.sha256sum] =3D "bef38d45163c2f1dde094a7dfd33ccf595c=
92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bitflags-2.5.0.sha256sum] =3D "cf4b9d6a944f767f8e5e0db018570623c85=
f3d925ac718db4e06d0187adb21c1"
-SRC_URI[block-buffer-0.10.4.sha256sum] =3D "3078c7629b62d3f0439517fa394996=
acacc5cbc91c5a20d8c658e77abd503a71"
-SRC_URI[bstr-1.10.0.sha256sum] =3D "40723b8fb387abc38f4f4a37c09073622e41dd=
12327033091ef8950659e6dc0c"
-SRC_URI[bumpalo-3.16.0.sha256sum] =3D "79296716171880943b8470b5f8d03aa55eb=
2e645a4874bdbb28adb49162e012c"
-SRC_URI[byteorder-1.5.0.sha256sum] =3D "1fd0f2584146f6f2ef48085050886acf35=
3beff7305ebd1ae69500e27c67f64b"
-SRC_URI[bytes-1.7.1.sha256sum] =3D "8318a53db07bb3f8dca91a600466bdb3f2eaad=
eedfdbcf02e1accbad9271ba50"
-SRC_URI[bytesize-1.3.0.sha256sum] =3D "a3e368af43e418a04d52505cf3dbc23dda4=
e3407ae2fa99fd0e4f308ce546acc"
-SRC_URI[bzip2-0.4.4.sha256sum] =3D "bdb116a6ef3f6c3698828873ad02c3014b3c85=
cadb88496095628e3ef1e347f8"
-SRC_URI[bzip2-sys-0.1.11+1.0.8.sha256sum] =3D "736a955f3fa7875102d57c82b8c=
ac37ec45224a07fd32d58f9f7a186b6cd4cdc"
-SRC_URI[cab-0.6.0.sha256sum] =3D "171228650e6721d5acc0868a462cd864f49ac5f6=
4e4a42cde270406e64e404d2"
-SRC_URI[camino-1.1.9.sha256sum] =3D "8b96ec4966b5813e2c0507c1f86115c8c5aba=
adc3980879c3424042a02fd1ad3"
-SRC_URI[cargo-config2-0.1.30.sha256sum] =3D "163a7be36509388c7bf7eb492a054=
31df28a2ee519087e287566c11e40d35e33"
-SRC_URI[cargo-options-0.7.4.sha256sum] =3D "f3540247c0a37a76eb324acc238dc6=
17786ea22c43b95da560c82a8f2714321f"
-SRC_URI[cargo-platform-0.1.8.sha256sum] =3D "24b1f0365a6c6bb4020cd05806fd0=
d33c44d38046b8bd7f0e40814b9763cabfc"
-SRC_URI[cargo-xwin-0.18.3.sha256sum] =3D "76ddeb44d5109bca38ed11f0400b0385=
b5ba3fc03e737d188d9b86d784daeb49"
-SRC_URI[cargo-zigbuild-0.19.7.sha256sum] =3D "04cc649328f39bbf1ef92ef75340=
6e1785ff1074941c398e5214b6c74d318a9e"
-SRC_URI[cargo_metadata-0.19.0.sha256sum] =3D "afc309ed89476c8957c50fb818f5=
6fe894db857866c3e163335faa91dc34eb85"
-SRC_URI[cbindgen-0.27.0.sha256sum] =3D "3fce8dd7fcfcbf3a0a87d8f515194b49d6=
135acab73e18bd380d1d93bb1a15eb"
-SRC_URI[cc-1.1.21.sha256sum] =3D "07b1695e2c7e8fc85310cde85aeaab7e3097f593=
c91d209d3f9df76c928100f0"
-SRC_URI[cfb-0.10.0.sha256sum] =3D "d8a4f8e55be323b378facfcf1f06aa97f6ec17c=
f4ac84fb17325093aaf62da41"
-SRC_URI[cfg-if-1.0.0.sha256sum] =3D "baf1de4339761588bc0619e3cbc0120ee582e=
bb74b53b4efbf79117bd2da40fd"
-SRC_URI[charset-0.1.5.sha256sum] =3D "f1f927b07c74ba84c7e5fe4db2baeb3e996a=
b2688992e39ac68ce3220a677c7e"
-SRC_URI[chumsky-0.9.3.sha256sum] =3D "8eebd66744a15ded14960ab4ccdbfb51ad3b=
81f51f3f04a80adac98c985396c9"
-SRC_URI[clap-4.5.7.sha256sum] =3D "5db83dced34638ad474f39f250d7fea9598bdd2=
39eaced1bdf45d597da0f433f"
-SRC_URI[clap_builder-4.5.7.sha256sum] =3D "f7e204572485eb3fbf28f8716121915=
21df159bc3e15a9f5064c66dba3a8c05f"
-SRC_URI[clap_complete-4.5.5.sha256sum] =3D "d2020fa13af48afc65a9a87335bda6=
48309ab3d154cd03c7ff95b378c7ed39c4"
-SRC_URI[clap_complete_command-0.6.1.sha256sum] =3D "da8e198c052315686d3637=
1e8a3c5778b7852fc75cc313e4e11eeb7a644a1b62"
-SRC_URI[clap_complete_nushell-4.5.2.sha256sum] =3D "1accf1b463dee0d3ab2be7=
2591dccdab8bef314958340447c882c4c72acfe2a3"
-SRC_URI[clap_derive-4.5.5.sha256sum] =3D "c780290ccf4fb26629baa7a1081e68ce=
d113f1d3ec302fa5948f1c381ebf06c6"
-SRC_URI[clap_lex-0.7.1.sha256sum] =3D "4b82cf0babdbd58558212896d1a4272303a=
57bdb245c2bf1147185fb45640e70"
-SRC_URI[cli-table-0.4.7.sha256sum] =3D "adfbb116d9e2c4be7011360d0c0bee5657=
12c11e969c9609b25b619366dc379d"
-SRC_URI[colorchoice-1.0.1.sha256sum] =3D "0b6a852b24ab71dffc585bcb46eaf795=
9d175cb865a7152e35b348d1b2960422"
-SRC_URI[configparser-3.1.0.sha256sum] =3D "e57e3272f0190c3f1584272d613719b=
a5fc7df7f4942fe542e63d949cf3a649b"
-SRC_URI[console-0.15.8.sha256sum] =3D "0e1f83fc076bd6dd27517eacdf25fef6c4d=
fe5f1d7448bafaaf3a26f13b5e4eb"
-SRC_URI[content_inspector-0.2.4.sha256sum] =3D "b7bda66e858c683005a53a9a60=
c69a4aca7eeaa45d124526e389f7aec8e62f38"
-SRC_URI[core-foundation-0.9.4.sha256sum] =3D "91e195e091a93c46f7102ec7818a=
2aa394e1e1771c3ab4825963fa03e45afb8f"
-SRC_URI[core-foundation-sys-0.8.6.sha256sum] =3D "06ea2b9bc92be3c2baa9334a=
323ebca2d6f074ff852cd1d7b11064035cd3868f"
-SRC_URI[cpufeatures-0.2.12.sha256sum] =3D "53fe5e26ff1b7aef8bca9c6080520cf=
b8d9333c7568e1829cef191a9723e5504"
-SRC_URI[crc-3.2.1.sha256sum] =3D "69e6e4d7b33a94f0991c26729976b10ebde1d34c=
3ee82408fb536164fa10d636"
-SRC_URI[crc-catalog-2.4.0.sha256sum] =3D "19d374276b40fb8bbdee95aef7c7fa6b=
5316ec764510eb64b8dd0e2ed0d7e7f5"
-SRC_URI[crc32fast-1.4.2.sha256sum] =3D "a97769d94ddab943e4510d138150169a27=
58b5ef3eb191a9ee688de3e23ef7b3"
-SRC_URI[crossbeam-channel-0.5.13.sha256sum] =3D "33480d6946193aa8033910124=
896ca395333cae7e2d1113d1fef6c3272217df2"
-SRC_URI[crossbeam-deque-0.8.5.sha256sum] =3D "613f8cc01fe9cf1a3eb3d7f488fd=
2fa8388403e97039e2f73692932e291a770d"
-SRC_URI[crossbeam-epoch-0.9.18.sha256sum] =3D "5b82ac4a3c2ca9c3460964f020e=
1402edd5753411d7737aa39c3714ad1b5420e"
-SRC_URI[crossbeam-utils-0.8.20.sha256sum] =3D "22ec99545bb0ed0ea7bb9b8e1e9=
122ea386ff8a48c0922e43f36d45ab09e0e80"
-SRC_URI[crypto-common-0.1.6.sha256sum] =3D "1bfb12502f3fc46cca1bb51ac28df9=
d618d813cdc3d2f25b9fe775a34af26bb3"
-SRC_URI[data-encoding-2.6.0.sha256sum] =3D "e8566979429cf69b49a5c740c60791=
108e86440e8be149bbea4fe54d2c32d6e2"
-SRC_URI[deranged-0.3.11.sha256sum] =3D "b42b6fa04a440b495c8b04d0e71b707c58=
5f83cb9cb28cf8cd0d976c315e31b4"
-SRC_URI[derivative-2.2.0.sha256sum] =3D "fcc3dd5e9e9c0b295d6e1e4d811fb6f15=
7d5ffd784b8d202fc62eac8035a770b"
-SRC_URI[derive_arbitrary-1.4.1.sha256sum] =3D "30542c1ad912e0e3d22a1935c29=
0e12e8a29d704a420177a31faad4a601a0800"
-SRC_URI[dialoguer-0.11.0.sha256sum] =3D "658bce805d770f407bc62102fca7c2c64=
ceef2fbcb2b8bd19d2765ce093980de"
-SRC_URI[diff-0.1.13.sha256sum] =3D "56254986775e3233ffa9c4d7d3faaf6d36a2c0=
9d30b20687e9f88bc8bafc16c8"
-SRC_URI[digest-0.10.7.sha256sum] =3D "9ed9a281f7bc9b7576e61468ba615a66a5c8=
cfdff42420a70aa82701a3b1e292"
-SRC_URI[dirs-5.0.1.sha256sum] =3D "44c45a9d03d6676652bcb5e724c7e988de1acad=
23a711b5217ab9cbecbec2225"
-SRC_URI[dirs-sys-0.4.1.sha256sum] =3D "520f05a5cbd335fae5a99ff7a6ab8627577=
660ee5cfd6a94a6a929b52ff0321c"
-SRC_URI[displaydoc-0.2.5.sha256sum] =3D "97369cbbc041bc366949bc74d34658d6c=
da5621039731c6310521892a3a20ae0"
-SRC_URI[dissimilar-1.0.9.sha256sum] =3D "59f8e79d1fbf76bdfbde321e902714bf6=
c49df88a7dda6fc682fc2979226962d"
-SRC_URI[dunce-1.0.5.sha256sum] =3D "92773504d58c093f6de2459af4af33faa518c1=
3451eb8f2b5698ed3d36e7c813"
-SRC_URI[dyn-clone-1.0.17.sha256sum] =3D "0d6ef0072f8a535281e4876be788938b5=
28e9a1d43900b82c2569af7da799125"
-SRC_URI[either-1.13.0.sha256sum] =3D "60b1af1c220855b6ceac025d3f6ecdd2b7c4=
894bfe9cd9bda4fbb4bc7c0d4cf0"
-SRC_URI[encode_unicode-0.3.6.sha256sum] =3D "a357d28ed41a50f9c765dbfe56cbc=
04a64e53e5fc58ba79fbc34c10ef3df831f"
-SRC_URI[encoding_rs-0.8.34.sha256sum] =3D "b45de904aa0b010bce2ab45264d0631=
681847fa7b6f2eaa7dab7619943bc4f59"
-SRC_URI[equivalent-1.0.1.sha256sum] =3D "5443807d6dff69373d433ab9ef5378ad8=
df50ca6298caf15de6e52e24aaf54d5"
-SRC_URI[errno-0.3.9.sha256sum] =3D "534c5cf6194dfab3db3242765c03bbe257cf92=
f22b38f6bc0c58d59108a820ba"
-SRC_URI[expect-test-1.5.0.sha256sum] =3D "9e0be0a561335815e06dab7c62e50353=
134c796e7a6155402a64bcff66b6a5e0"
-SRC_URI[fastrand-2.1.0.sha256sum] =3D "9fc0510504f03c51ada170672ac806f1f10=
5a88aa97a5281117e1ddc3368e51a"
-SRC_URI[fat-macho-0.4.9.sha256sum] =3D "4c9c45caa6c6edfaee4cb3bd84ea9686e1=
15df7f0efb530e15fb466eccb0b345"
-SRC_URI[filetime-0.2.23.sha256sum] =3D "1ee447700ac8aa0b2f2bd7bc4462ad686b=
a06baa6727ac149a2d6277f0d240fd"
-SRC_URI[flate2-1.0.33.sha256sum] =3D "324a1be68054ef05ad64b861cc9eaf1d623d=
2d8cb25b4bf2cb9cdd902b4bf253"
-SRC_URI[fnv-1.0.7.sha256sum] =3D "3f9eec918d3f24069decb9af1554cad7c880e2da=
24a9afd88aca000531ab82c1"
-SRC_URI[foreign-types-0.3.2.sha256sum] =3D "f6f339eb8adc052cd2ca78910fda86=
9aefa38d22d5cb648e6485e4d3fc06f3b1"
-SRC_URI[foreign-types-shared-0.1.1.sha256sum] =3D "00b0228411908ca8685dba7=
fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
-SRC_URI[form_urlencoded-1.2.1.sha256sum] =3D "e13624c2627564efccf4934284bd=
d98cbaa14e79b0b5a141218e507b3a823456"
-SRC_URI[fs-err-3.0.0.sha256sum] =3D "8bb60e7409f34ef959985bc9d9c5ee8f5db24=
ee46ed9775850548021710f807f"
-SRC_URI[fs4-0.12.0.sha256sum] =3D "c29c30684418547d476f0b48e84f4821639119c=
483b1eccd566c8cd0cd05f521"
-SRC_URI[futures-0.3.30.sha256sum] =3D "645c6916888f6cb6350d2550b80fb63e734=
897a8498abe35cfb732b6487804b0"
-SRC_URI[futures-channel-0.3.31.sha256sum] =3D "2dff15bf788c671c1934e366d07=
e30c1814a8ef514e1af724a602e8a2fbe1b10"
-SRC_URI[futures-core-0.3.31.sha256sum] =3D "05f29059c0c2090612e8d742178b05=
80d2dc940c837851ad723096f87af6663e"
-SRC_URI[futures-executor-0.3.30.sha256sum] =3D "a576fc72ae164fca6b9db127ea=
a9a9dda0d61316034f33a0a0d4eda41f02b01d"
-SRC_URI[futures-io-0.3.31.sha256sum] =3D "9e5c1b78ca4aae1ac06c48a526a65576=
0685149f0d465d21f37abfe57ce075c6"
-SRC_URI[futures-macro-0.3.31.sha256sum] =3D "162ee34ebcb7c64a8abebc059ce0f=
ee27c2262618d7b60ed8faf72fef13c3650"
-SRC_URI[futures-sink-0.3.31.sha256sum] =3D "e575fab7d1e0dcb8d0c7bcf9a63ee2=
13816ab51902e6d244a95819acacf1d4f7"
-SRC_URI[futures-task-0.3.31.sha256sum] =3D "f90f7dce0722e95104fcb095585910=
c0977252f286e354b5e3bd38902cd99988"
-SRC_URI[futures-timer-3.0.3.sha256sum] =3D "f288b0a4f20f9a56b5d1da57e2227c=
661b7b16168e2f72365f57b63326e29b24"
-SRC_URI[futures-util-0.3.31.sha256sum] =3D "9fa08315bb612088cc391249efdc3b=
c77536f16c91f6cf495e6fbe85b20a4a81"
-SRC_URI[generic-array-0.14.7.sha256sum] =3D "85649ca51fd72272d7821adaf274a=
d91c288277713d9c18820d8499a7ff69e9a"
-SRC_URI[getrandom-0.2.15.sha256sum] =3D "c4567c8db10ae91089c99af84c68c38da=
3ec2f087c3f82960bcdbf3656b6f4d7"
-SRC_URI[glob-0.3.1.sha256sum] =3D "d2fabcfbdc87f4758337ca535fb41a6d701b656=
93ce38287d856d1674551ec9b"
-SRC_URI[globset-0.4.15.sha256sum] =3D "15f1ce686646e7f1e19bf7d5533fe443a45=
dbfb990e00629110797578b42fb19"
-SRC_URI[goblin-0.9.2.sha256sum] =3D "53ab3f32d1d77146981dea5d6b1e8fe31eedc=
b7013e5e00d6ccd1259a4b4d923"
-SRC_URI[hashbrown-0.14.5.sha256sum] =3D "e5274423e17b7c9fc20b6e7e208532f9b=
19825d82dfd615708b70edd83df41f1"
-SRC_URI[heck-0.4.1.sha256sum] =3D "95505c38b4572b2d910cecb0281560f54b440a1=
9336cbbcb27bf6ce6adc6f5a8"
-SRC_URI[heck-0.5.0.sha256sum] =3D "2304e00983f87ffb38b55b444b5e3b60a884b5d=
30c0fca7d82fe33449bbe55ea"
-SRC_URI[home-0.5.9.sha256sum] =3D "e3d1354bf6b7235cb4a0576c2619fd4ed18183f=
689b12b006a0ee7329eeff9a5"
-SRC_URI[humantime-2.1.0.sha256sum] =3D "9a3a5bfb195931eeb336b2a7b4d761daec=
841b97f947d34394601737a7bba5e4"
-SRC_URI[humantime-serde-1.1.1.sha256sum] =3D "57a3db5ea5923d99402c94e9feb2=
61dc5ee9b4efa158b0315f788cf549cc200c"
-SRC_URI[icu_collections-1.5.0.sha256sum] =3D "db2fa452206ebee18c4b5c2274db=
f1de17008e874b4dc4f0aea9d01ca79e4526"
-SRC_URI[icu_locid-1.5.0.sha256sum] =3D "13acbb8371917fc971be86fc8057c41a64=
b521c184808a698c02acc242dbf637"
-SRC_URI[icu_locid_transform-1.5.0.sha256sum] =3D "01d11ac35de8e40fdeda00d9=
e1e9d92525f3f9d887cdd7aa81d727596788b54e"
-SRC_URI[icu_locid_transform_data-1.5.0.sha256sum] =3D "fdc8ff3388f852bede6=
b579ad4e978ab004f139284d7b28715f773507b946f6e"
-SRC_URI[icu_normalizer-1.5.0.sha256sum] =3D "19ce3e0da2ec68599d193c93d0881=
42efd7f9c5d6fc9b803774855747dc6a84f"
-SRC_URI[icu_normalizer_data-1.5.0.sha256sum] =3D "f8cafbf7aa791e9b22bec55a=
167906f9e1215fd475cd22adfcf660e03e989516"
-SRC_URI[icu_properties-1.5.1.sha256sum] =3D "93d6020766cfc6302c15dbbc9c877=
8c37e62c14427cb7f6e601d849e092aeef5"
-SRC_URI[icu_properties_data-1.5.0.sha256sum] =3D "67a8effbc3dd3e4ba1afa8ad=
918d5684b8868b3b26500753effea8d2eed19569"
-SRC_URI[icu_provider-1.5.0.sha256sum] =3D "6ed421c8a8ef78d3e2dbc98a973be2f=
3770cb42b606e3ab18d6237c4dfde68d9"
-SRC_URI[icu_provider_macros-1.5.0.sha256sum] =3D "1ec89e9337638ecdc08744df=
490b221a7399bf8d164eb52a665454e60e075ad6"
-SRC_URI[idna-1.0.3.sha256sum] =3D "686f825264d630750a544639377bae737628043=
f20d38bbc029e8f29ea968a7e"
-SRC_URI[idna_adapter-1.2.0.sha256sum] =3D "daca1df1c957320b2cf139ac61e7bd6=
4fed304c5040df000a745aa1de3b4ef71"
-SRC_URI[ignore-0.4.23.sha256sum] =3D "6d89fd380afde86567dfba715db065673989=
d6253f42b88179abd3eae47bda4b"
-SRC_URI[indexmap-2.5.0.sha256sum] =3D "68b900aa2f7301e21c36462b170ee99994d=
e34dff39a4a6a528e80e7376d07e5"
-SRC_URI[indicatif-0.17.8.sha256sum] =3D "763a5a8f45087d6bcea4222e7b72c291a=
054edf80e4ef6efd2a4979878c7bea3"
-SRC_URI[indoc-2.0.5.sha256sum] =3D "b248f5224d1d606005e02c97f5aa4e88eeb230=
488bcc03bc9ca4d7991399f2b5"
-SRC_URI[instant-0.1.13.sha256sum] =3D "e0242819d153cba4b4b05a5a8f2a7e9bbf9=
7b6055b2a002b395c96b5ff3c0222"
-SRC_URI[is_terminal_polyfill-1.70.0.sha256sum] =3D "f8478577c03552c21db0e2=
724ffb8986a5ce7af88107e6be5d2ee6e158c12800"
-SRC_URI[itertools-0.12.1.sha256sum] =3D "ba291022dbbd398a455acf126c1e34195=
4079855bc60dfdda641363bd6922569"
-SRC_URI[itoa-1.0.11.sha256sum] =3D "49f1f14873335454500d59611f1cf4a4b0f786=
f9ac11f4312a78e4cf2566695b"
-SRC_URI[keyring-2.3.3.sha256sum] =3D "363387f0019d714aa60cc30ab4fe501a747f=
4c08fc58f069dd14be971bd495a0"
-SRC_URI[lazy_static-1.4.0.sha256sum] =3D "e2abad23fbc42b3700f2f279844dc832=
adb2b2eb069b2df918f455c4e18cc646"
-SRC_URI[lddtree-0.3.7.sha256sum] =3D "e0779ac94bd7b6ab781fa12388dbf79ac45e=
c1fa433e7d25521753be8227b08e"
-SRC_URI[libc-0.2.158.sha256sum] =3D "d8adc4bb1803a324070e64a98ae98f38934d9=
1957a99cfb3a43dcbc01bc56439"
-SRC_URI[libmimalloc-sys-0.1.38.sha256sum] =3D "0e7bb23d733dfcc8af652a78b7b=
f232f0e967710d044732185e561e47c0336b6"
-SRC_URI[libredox-0.1.3.sha256sum] =3D "c0ff37bd590ca25063e35af745c343cb7a0=
271906fb7b37e4813e8f79f00268d"
-SRC_URI[linux-keyutils-0.2.4.sha256sum] =3D "761e49ec5fd8a5a463f9b84e877c3=
73d888935b71c6be78f3767fe2ae6bed18e"
-SRC_URI[linux-raw-sys-0.4.14.sha256sum] =3D "78b3ae25bc7c8c38cec158d1f2757=
ee79e9b3740fbc7ccf0e59e4b08d793fa89"
-SRC_URI[litemap-0.7.3.sha256sum] =3D "643cb0b8d4fcc284004d5fd0d67ccf61dfff=
adb7f75e1e71bc420f4688a3a704"
-SRC_URI[lock_api-0.4.12.sha256sum] =3D "07af8b9cdd281b7915f413fa73f29ebd5d=
55d0d3f0155584dade1ff18cea1b17"
-SRC_URI[lockfree-object-pool-0.1.6.sha256sum] =3D "9374ef4228402d4b7e403e5=
838cb880d9ee663314b0a900d5a6aabf0c213552e"
-SRC_URI[log-0.4.21.sha256sum] =3D "90ed8c1e510134f979dbc4f070f87d4313098b7=
04861a105fe34231c70a3901c"
-SRC_URI[lzma-sys-0.1.20.sha256sum] =3D "5fda04ab3764e6cde78b9974eec4f779ac=
aba7c4e84b36eca3cf77c581b85d27"
-SRC_URI[lzxd-0.2.5.sha256sum] =3D "5de7336a183103429ad66d11d56d8bdc9c4a291=
6f6b85a8f11e5b127bde12001"
-SRC_URI[mailparse-0.15.0.sha256sum] =3D "3da03d5980411a724e8aaf7b61a7b5e38=
6ec55a7fb49ee3d0ff79efc7e5e7c7e"
-SRC_URI[matchers-0.1.0.sha256sum] =3D "8263075bb86c5a1b1427b5ae862e8889656=
f126e9f77c484496e8b47cf5c5558"
-SRC_URI[memchr-2.7.2.sha256sum] =3D "6c8640c5d730cb13ebd907d8d04b52f55ac9a=
2eec55b440c8892f40d56c76c1d"
-SRC_URI[mimalloc-0.1.42.sha256sum] =3D "e9186d86b79b52f4a77af65604b51225e8=
db1d6ee7e3f41aec1e40829c71a176"
-SRC_URI[mime-0.3.17.sha256sum] =3D "6877bb514081ee2a7ff5ef9de3281f14a4dd4b=
ceac4c09388074a6b5df8a139a"
-SRC_URI[mime_guess-2.0.4.sha256sum] =3D "4192263c238a5f0d0c6bfd21f336a313a=
4ce1c450542449ca191bb657b4642ef"
-SRC_URI[minijinja-2.5.0.sha256sum] =3D "2c37e1b517d1dcd0e51dc36c4567b9d5a2=
9262b3ec8da6cb5d35e27a8fb529b5"
-SRC_URI[minimal-lexical-0.2.1.sha256sum] =3D "68354c5c6bd36d73ff3feceb05ef=
a59b6acb7626617f4962be322a825e61f79a"
-SRC_URI[miniz_oxide-0.8.0.sha256sum] =3D "e2d80299ef12ff69b16a84bb182e3b9d=
f68b5a91574d3d4fa6e41b65deec4df1"
-SRC_URI[msi-0.8.0.sha256sum] =3D "4a2332f87a064dea9cce571408c879e0da8dc193=
b3af06a2b3b2604ee4182a32"
-SRC_URI[multipart-0.18.0.sha256sum] =3D "00dec633863867f29cb39df64a397cdf4=
a6354708ddd7759f70c7fb51c5f9182"
-SRC_URI[native-tls-0.2.12.sha256sum] =3D "a8614eb2c83d59d1c8cc974dd3f92019=
8647674a0a035e1af1fa58707e317466"
-SRC_URI[nom-7.1.3.sha256sum] =3D "d273983c5a657a70a3e8f2a01329822f3b8c8172=
b73826411a55751e404a0a4a"
-SRC_URI[normalize-line-endings-0.3.0.sha256sum] =3D "61807f77802ff30975e01=
f4f071c8ba10c022052f98b3294119f3e615d13e5be"
-SRC_URI[normpath-1.2.0.sha256sum] =3D "5831952a9476f2fed74b77d74182fa5ddc4=
d21c72ec45a333b250e3ed0272804"
-SRC_URI[nu-ansi-term-0.46.0.sha256sum] =3D "77a8165726e8236064dbb454592426=
00304b42a5ea24ee2948e18e023bf7ba84"
-SRC_URI[num-conv-0.1.0.sha256sum] =3D "51d515d32fb182ee37cda2ccdcb92950d6a=
3c2893aa280e540671c2cd0f3b1d9"
-SRC_URI[number_prefix-0.4.0.sha256sum] =3D "830b246a0e5f20af87141b25c173cd=
1b609bd7779a4617d6ec582abaf90870f3"
-SRC_URI[once_cell-1.19.0.sha256sum] =3D "3fdb12b2476b595f9358c5161aa467c24=
38859caa136dec86c26fdd2efe17b92"
-SRC_URI[openssl-0.10.66.sha256sum] =3D "9529f4786b70a3e8c61e11179af17ab618=
8ad8d0ded78c5529441ed39d4bd9c1"
-SRC_URI[openssl-macros-0.1.1.sha256sum] =3D "a948666b637a0f465e8564c73e89d=
4dde00d72d4d473cc972f390fc3dcee7d9c"
-SRC_URI[openssl-probe-0.1.5.sha256sum] =3D "ff011a302c396a5197692431fc1948=
019154afc178baf7d8e37367442a4601cf"
-SRC_URI[openssl-sys-0.9.103.sha256sum] =3D "7f9e8deee91df40a943c71b917e587=
4b951d32a802526c85721ce3b776c929d6"
-SRC_URI[option-ext-0.2.0.sha256sum] =3D "04744f49eae99ab78e0d5c0b603ab218f=
515ea8cfe5a456d7629ad883a3b6e7d"
-SRC_URI[os_pipe-1.2.0.sha256sum] =3D "29d73ba8daf8fac13b0501d1abeddcfe21ba=
7401ada61a819144b6c2a4f32209"
-SRC_URI[overload-0.1.1.sha256sum] =3D "b15813163c1d831bf4a13c3610c05c0d03b=
39feb07f7e09fa234dac9b15aaf39"
-SRC_URI[parking_lot-0.12.3.sha256sum] =3D "f1bf18183cf54e8d6059647fc306364=
6a1801cf30896933ec2311622cc4b9a27"
-SRC_URI[parking_lot_core-0.9.10.sha256sum] =3D "1e401f977ab385c9e4e3ab3062=
7d6f26d00e2c73eef317493c4ec6d468726cf8"
-SRC_URI[paste-1.0.15.sha256sum] =3D "57c0d7b74b563b49d38dae00a0c37d4d6de9b=
432382b2892f0574ddcae73fd0a"
-SRC_URI[path-slash-0.2.1.sha256sum] =3D "1e91099d4268b0e11973f036e885d652f=
b0b21fedcf69738c627f94db6a44f42"
-SRC_URI[pep440_rs-0.6.6.sha256sum] =3D "466eada3179c2e069ca897b99006cbb33f=
816290eaeec62464eea907e22ae385"
-SRC_URI[pep508_rs-0.6.1.sha256sum] =3D "3f8877489a99ccc80012333123e434f84e=
645fe1ede3b30e9d3b815887a12979"
-SRC_URI[percent-encoding-2.3.1.sha256sum] =3D "e3148f5046208a5d56bcfc03053=
e3ca6334e51da8dfb19b6cdc8b306fae3283e"
-SRC_URI[pin-project-lite-0.2.14.sha256sum] =3D "bda66fc9667c18cb2758a2ac84=
d1167245054bcf85d5d1aaa6923f45801bdd02"
-SRC_URI[pin-utils-0.1.0.sha256sum] =3D "8b870d8c151b6f2fb93e84a13146138f05=
d02ed11c7e7c54f8826aaaf7c9f184"
-SRC_URI[pkg-config-0.3.30.sha256sum] =3D "d231b230927b5e4ad203db57bbcbee28=
02f6bce620b1e4a9024a07d94e2907ec"
-SRC_URI[plain-0.2.3.sha256sum] =3D "b4596b6d070b27117e987119b4dac604f3c58c=
fb0b191112e24771b2faeac1a6"
-SRC_URI[platform-info-2.0.3.sha256sum] =3D "d5ff316b9c4642feda973c18f0decd=
6c8b0919d4722566f6e4337cce0dd88217"
-SRC_URI[portable-atomic-1.6.0.sha256sum] =3D "7170ef9988bc169ba16dd36a7fa0=
41e5c4cbeb6a35b76d4c03daded371eae7c0"
-SRC_URI[powerfmt-0.2.0.sha256sum] =3D "439ee305def115ba05938db6eb1644ff941=
65c5ab5e9420d1c1bcedbba909391"
-SRC_URI[ppv-lite86-0.2.17.sha256sum] =3D "5b40af805b3121feab8a3c29f04d8ad2=
62fa8e0561883e7653e024ae4479e6de"
-SRC_URI[pretty_assertions-1.4.1.sha256sum] =3D "3ae130e2f271fbc2ac3a40fb1d=
07180839cdbbe443c7a27e1e3c13c5cac0116d"
-SRC_URI[proc-macro-crate-3.1.0.sha256sum] =3D "6d37c51ca738a55da99dc0c4a34=
860fd675453b8b36209178c2249bb13651284"
-SRC_URI[proc-macro2-1.0.85.sha256sum] =3D "22244ce15aa966053a896d1accb3a6e=
68469b97c7f33f284b99f0d576879fc23"
-SRC_URI[psm-0.1.21.sha256sum] =3D "5787f7cda34e3033a72192c018bc5883100330f=
362ef279a8cbccfce8bb4e874"
-SRC_URI[pyproject-toml-0.11.0.sha256sum] =3D "ef7061023bcb58a0fc4a4bbe9819=
c13b0dca7c2abc14da14f5ecc1532ab3a36a"
-SRC_URI[python-pkginfo-0.6.5.sha256sum] =3D "c21f58880fc45e91d29b2f639ab40=
51aaa6a2b054534c2d343a953347d0dd600"
-SRC_URI[quote-1.0.36.sha256sum] =3D "0fa76aaf39101c457836aec0ce2316dbdc3ab=
723cdda1c6bd4e6ad4208acaca7"
-SRC_URI[quoted_printable-0.5.0.sha256sum] =3D "79ec282e887b434b68c18fe5c12=
1d38e72a5cf35119b59e54ec5b992ea9c8eb0"
-SRC_URI[rand-0.8.5.sha256sum] =3D "34af8d1a0e25924bc5b7c43c079c942339d8f0a=
8b57c39049bef581b46327404"
-SRC_URI[rand_chacha-0.3.1.sha256sum] =3D "e6c10a63a0fa32252be49d21e7709d4d=
4baf8d231c2dbce1eaa8141b9b127d88"
-SRC_URI[rand_core-0.6.4.sha256sum] =3D "ec0be4795e2f6a28069bec0b5ff3e2ac9b=
afc99e6a9a7dc3547996c5c816922c"
-SRC_URI[rayon-1.10.0.sha256sum] =3D "b418a60154510ca1a002a752ca9714984e21e=
4241e804d32555251faf8b78ffa"
-SRC_URI[rayon-core-1.12.1.sha256sum] =3D "1465873a3dfdaa8ae7cb14b4383657ca=
ab0b3e8a0aa9ae8e04b044854c8dfce2"
-SRC_URI[redox_syscall-0.4.1.sha256sum] =3D "4722d768eff46b75989dd134e5c353=
f0d6296e5aaa3132e776cbdb56be7731aa"
-SRC_URI[redox_syscall-0.5.1.sha256sum] =3D "469052894dcb553421e483e4209ee5=
81a45100d31b4018de03e5a7ad86374a7e"
-SRC_URI[redox_users-0.4.5.sha256sum] =3D "bd283d9651eeda4b2a83a43c1c91b266=
c40fd76ecd39a50a8c630ae69dc72891"
-SRC_URI[regex-1.10.6.sha256sum] =3D "4219d74c6b67a3654a9fbebc4b419e22126d1=
3d2f3c4a07ee0cb61ff79a79619"
-SRC_URI[regex-automata-0.1.10.sha256sum] =3D "6c230d73fb8d8c1b9c0b3135c514=
2a8acee3a0558fb8db5cf1cb65f8d7862132"
-SRC_URI[regex-automata-0.4.7.sha256sum] =3D "38caf58cc5ef2fed281f89292ef23=
f6365465ed9a41b7a7754eb4e26496c92df"
-SRC_URI[regex-syntax-0.6.29.sha256sum] =3D "f162c6dd7b008981e4d40210aca20b=
4bd0f9b60ca9271061b07f78537722f2e1"
-SRC_URI[regex-syntax-0.8.4.sha256sum] =3D "7a66a03ae7c801facd77a29370b4fae=
c201768915ac14a721ba36f20bc9c209b"
-SRC_URI[relative-path-1.9.3.sha256sum] =3D "ba39f3699c378cd8970968dcbff9c4=
3159ea4cfbd88d43c00b22f2ef10a435d2"
-SRC_URI[rfc2047-decoder-1.0.6.sha256sum] =3D "bc36545d1021456a751b573517cb=
52e8c339b2f662e6b2778ef629282678de29"
-SRC_URI[ring-0.17.8.sha256sum] =3D "c17fa4cb658e3583423e915b9f3acc01cceaee=
1860e33d59ebae66adc3a2dc0d"
-SRC_URI[rstest-0.22.0.sha256sum] =3D "7b423f0e62bdd61734b67cd21ff50871dfae=
b9cc74f869dcd6af974fbcb19936"
-SRC_URI[rstest_macros-0.22.0.sha256sum] =3D "c5e1711e7d14f74b12a58411c5421=
85ef7fb7f2e7f8ee6e2940a883628522b42"
-SRC_URI[rustc_version-0.4.1.sha256sum] =3D "cfcb3a22ef46e85b45de6ee7e79d06=
3319ebb6594faafcf1c225ea92ab6e9b92"
-SRC_URI[rustflags-0.1.6.sha256sum] =3D "d7fc92159fb50a431c5da366f7627751fe=
7263cf867f8a30f27fa6063ba02ac0"
-SRC_URI[rustix-0.38.34.sha256sum] =3D "70dc5ec042f7a43c4a73241207cecc9873a=
06d45debb38b329f8541d85c2730f"
-SRC_URI[rustls-0.23.19.sha256sum] =3D "934b404430bb06b3fae2cba809eb45a1ab1=
aecd64491213d7c3301b88393f8d1"
-SRC_URI[rustls-pemfile-2.1.3.sha256sum] =3D "196fe16b00e106300d3e45ecfcb76=
4fa292a535d7326a29a5875c579c7417425"
-SRC_URI[rustls-pki-types-1.10.0.sha256sum] =3D "16f1201b3c9a7ee8039bcadc17=
b7e605e2945b27eee7631788c1bd2b0643674b"
-SRC_URI[rustls-webpki-0.102.8.sha256sum] =3D "64ca1bc8749bd4cf37b5ce386cc1=
46580777b4e8572c7b97baf22c83f444bee9"
-SRC_URI[rustversion-1.0.17.sha256sum] =3D "955d28af4278de8121b7ebeb796b6a4=
5735dc01436d898801014aced2773a3d6"
-SRC_URI[ryu-1.0.18.sha256sum] =3D "f3cb5ba0dc43242ce17de99c180e96db90b235b=
8a9fdc9543c96d2209116bd9f"
-SRC_URI[same-file-1.0.6.sha256sum] =3D "93fc1dc3aaa9bfed95e02e6eadabb4baf7=
e3078b0bd1b4d7b6b0b68378900502"
-SRC_URI[schannel-0.1.23.sha256sum] =3D "fbc91545643bcf3a0bbb65692656152226=
18bdf33ce4ffbbd13c4bbd4c093534"
-SRC_URI[schemars-0.8.21.sha256sum] =3D "09c024468a378b7e36765cd36702b7a90c=
c3cba11654f6685c8f233408e89e92"
-SRC_URI[schemars_derive-0.8.21.sha256sum] =3D "b1eee588578aff73f856ab961cd=
2f79e36bc45d7ded33a7562adba4667aecc0e"
-SRC_URI[scopeguard-1.2.0.sha256sum] =3D "94143f37725109f92c262ed2cf5e59bce=
7498c01bcc1502d7b9afe439a4e9f49"
-SRC_URI[scroll-0.12.0.sha256sum] =3D "6ab8598aa408498679922eff7fa985c25d58=
a90771bd6be794434c5277eab1a6"
-SRC_URI[scroll_derive-0.12.0.sha256sum] =3D "7f81c2fde025af7e69b1d1420531c=
8a8811ca898919db177141a85313b1cb932"
-SRC_URI[security-framework-2.11.0.sha256sum] =3D "c627723fd09706bacdb5cf41=
499e95098555af3c3c29d014dc3c458ef6be11c0"
-SRC_URI[security-framework-sys-2.11.0.sha256sum] =3D "317936bbbd0522775258=
3946b9e66d7ce3b489f84e11a94a510b4437fef407d7"
-SRC_URI[semver-1.0.23.sha256sum] =3D "61697e0a1c7e512e84a621326239844a24d8=
207b4669b41bc18b32ea5cbf988b"
-SRC_URI[serde-1.0.216.sha256sum] =3D "0b9781016e935a97e8beecf0c933758c97a5=
520d32930e460142b4cd80c6338e"
-SRC_URI[serde_derive-1.0.216.sha256sum] =3D "46f859dbbf73865c6627ed570e789=
61cd3ac92407a2d117204c49232485da55e"
-SRC_URI[serde_derive_internals-0.29.1.sha256sum] =3D "18d26a20a969b9e3fdf2=
fc2d9f21eda6c40e2de84c9408bb5d3b05d499aae711"
-SRC_URI[serde_json-1.0.133.sha256sum] =3D "c7fceb2473b9166b2294ef05efcb65a=
3db80803f0b03ef86a5fc88a2b85ee377"
-SRC_URI[serde_spanned-0.6.6.sha256sum] =3D "79e674e01f999af37c49f70a6ede16=
7a8a60b2503e56c5599532a65baa5969a0"
-SRC_URI[sha2-0.10.8.sha256sum] =3D "793db75ad2bcafc3ffa7c68b215fee268f5379=
82cd901d132f89c6343f3a3dc8"
-SRC_URI[sharded-slab-0.1.7.sha256sum] =3D "f40ca3c46823713e0d4209592e8d6e8=
26aa57e928f09752619fc696c499637f6"
-SRC_URI[shell-words-1.1.0.sha256sum] =3D "24188a676b6ae68c3b2cb3a01be17fbf=
7240ce009799bb56d5b1409051e78fde"
-SRC_URI[shlex-1.3.0.sha256sum] =3D "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3=
524c3cb8fb653a3023f6323e64"
-SRC_URI[simd-adler32-0.3.7.sha256sum] =3D "d66dc143e6b11c1eddc06d5c423cfc9=
7062865baf299914ab64caa38182078fe"
-SRC_URI[similar-2.5.0.sha256sum] =3D "fa42c91313f1d05da9b26f267f931cf178d4=
aba455b4c4622dd7355eb80c6640"
-SRC_URI[slab-0.4.9.sha256sum] =3D "8f92a496fb766b417c996b9c5e57daf2f7ad3b0=
bebe1ccfca4856390e3d3bb67"
-SRC_URI[smallvec-1.13.2.sha256sum] =3D "3c5e1a9a646d36c3599cd173a41282daf4=
7c44583ad367b8e6837255952e5c67"
-SRC_URI[smawk-0.3.2.sha256sum] =3D "b7c388c1b5e93756d0c740965c41e8822f8666=
21d41acbdf6336a6a168f8840c"
-SRC_URI[snapbox-0.6.16.sha256sum] =3D "027c936207f85d10d015e21faf5c676c7e0=
8c453ed371adf55c0874c443ca77a"
-SRC_URI[snapbox-macros-0.3.10.sha256sum] =3D "16569f53ca23a41bb6f62e0a5084=
aa1661f4814a67fa33696a79073e03a664af"
-SRC_URI[socks-0.3.4.sha256sum] =3D "f0c3dbbd9ae980613c6dd8e28a9407b50509d3=
803b57624d5dfe8315218cd58b"
-SRC_URI[spin-0.9.8.sha256sum] =3D "6980e8d7511241f8acf4aebddbb1ff938df5eeb=
e98691418c4468d0b72a96a67"
-SRC_URI[stable_deref_trait-1.2.0.sha256sum] =3D "a8f112729512f8e442d81f95a=
8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
-SRC_URI[stacker-0.1.15.sha256sum] =3D "c886bd4480155fd3ef527d45e9ac8dd7118=
a898a46530b7b94c3e21866259fce"
-SRC_URI[static_assertions-1.1.0.sha256sum] =3D "a2eb9349b6444b326872e140eb=
1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
-SRC_URI[strsim-0.11.1.sha256sum] =3D "7da8b5736845d9f2fcb837ea5d9e2628564b=
3b043a70948a3f0b778838c5fb4f"
-SRC_URI[subtle-2.5.0.sha256sum] =3D "81cdd64d312baedb58e21336b31bc043b77e0=
1cc99033ce76ef539f78e965ebc"
-SRC_URI[syn-1.0.109.sha256sum] =3D "72b64191b275b66ffe2469e8af2c1cfe3bafa6=
7b529ead792a6d0160888b4237"
-SRC_URI[syn-2.0.87.sha256sum] =3D "25aa4ce346d03a6dcd68dd8b4010bcb74e54e62=
c90c573f394c46eae99aba32d"
-SRC_URI[synstructure-0.13.1.sha256sum] =3D "c8af7666ab7b6390ab78131fb5b0fc=
e11d6b7a6951602017c35fa82800708971"
-SRC_URI[tar-0.4.43.sha256sum] =3D "c65998313f8e17d0d553d28f91a0df93e4dbbbf=
770279c7bc21ca0f09ea1a1f6"
-SRC_URI[target-lexicon-0.13.0.sha256sum] =3D "4ff4a4048091358129767b8a200d=
6927f58876c8b5ea16fb7b0222d43b79bfa8"
-SRC_URI[tempfile-3.11.0.sha256sum] =3D "b8fcd239983515c23a32fb82099f97d0b1=
1b8c72f654ed659363a95c3dad7a53"
-SRC_URI[termcolor-1.4.1.sha256sum] =3D "06794f8f6c5c898b3275aebefa6b8a1cb2=
4cd2c6c79397ab15774837a0bc5755"
-SRC_URI[terminal_size-0.3.0.sha256sum] =3D "21bebf2b7c9e0a515f6e0f8c51dc0f=
8e4696391e6f1ff30379559f8365fb0df7"
-SRC_URI[textwrap-0.16.1.sha256sum] =3D "23d434d3f8967a09480fb04132ebe0a3e0=
88c173e6d0ee7897abbdf4eab0f8b9"
-SRC_URI[thiserror-1.0.64.sha256sum] =3D "d50af8abc119fb8bb6dbabcfa89656f46=
f84aa0ac7688088608076ad2b459a84"
-SRC_URI[thiserror-2.0.3.sha256sum] =3D "c006c85c7651b3cf2ada4584faa36773bd=
07bac24acfb39f3c431b36d7e667aa"
-SRC_URI[thiserror-impl-1.0.64.sha256sum] =3D "08904e7672f5eb876eaaf87e0ce1=
7857500934f4981c4a0ab2b4aa98baac7fc3"
-SRC_URI[thiserror-impl-2.0.3.sha256sum] =3D "f077553d607adc1caf65430528a57=
6c757a71ed73944b66ebb58ef2bbd243568"
-SRC_URI[thread_local-1.1.8.sha256sum] =3D "8b9ef9bad013ada3808854ceac7b468=
12a6465ba368859a37e2100283d2d719c"
-SRC_URI[time-0.3.36.sha256sum] =3D "5dfd88e563464686c916c7e46e623e520ddc6d=
79fa6641390f2e3fa86e83e885"
-SRC_URI[time-core-0.1.2.sha256sum] =3D "ef927ca75afb808a4d64dd374f00a2adf8=
d0fcff8e7b184af886c3c87ec4a3f3"
-SRC_URI[time-macros-0.2.18.sha256sum] =3D "3f252a68540fde3a3877aeea552b832=
b40ab9a69e318efd078774a01ddee1ccf"
-SRC_URI[tinystr-0.7.6.sha256sum] =3D "9117f5d4db391c1cf6927e7bea3db74b9a1c=
1add8f7eda9ffd5364f40f57b82f"
-SRC_URI[toml-0.8.15.sha256sum] =3D "ac2caab0bf757388c6c0ae23b3293fdb463fee=
59434529014f85e3263b995c28"
-SRC_URI[toml_datetime-0.6.6.sha256sum] =3D "4badfd56924ae69bcc9039335b2e01=
7639ce3f9b001c393c1b2d1ef846ce2cbf"
-SRC_URI[toml_edit-0.21.1.sha256sum] =3D "6a8534fd7f78b5405e860340ad6575217=
ce99f38d4d5c8f2442cb5ecb50090e1"
-SRC_URI[toml_edit-0.22.16.sha256sum] =3D "278f3d518e152219c994ce877758516b=
ca5e118eaed6996192a774fb9fbf0788"
-SRC_URI[tracing-0.1.40.sha256sum] =3D "c3523ab5a71916ccf420eebdf5521fcef02=
141234bbc0b8a49f2fdc4544364ef"
-SRC_URI[tracing-attributes-0.1.27.sha256sum] =3D "34704c8d6ebcbc939824180a=
f020566b01a7c01f80641264eba0999f6c2b6be7"
-SRC_URI[tracing-core-0.1.32.sha256sum] =3D "c06d3da6113f116aaee68e4d601191=
614c9053067f9ab7f6edbcb161237daa54"
-SRC_URI[tracing-log-0.2.0.sha256sum] =3D "ee855f1f400bd0e5c02d150ae5de3840=
039a3f54b025156404e34c23c03f47c3"
-SRC_URI[tracing-serde-0.1.3.sha256sum] =3D "bc6b213177105856957181934e4920=
de57730fc69bf42c37ee5bb664d406d9e1"
-SRC_URI[tracing-subscriber-0.3.18.sha256sum] =3D "ad0f048c97dbd9faa9b7df56=
362b8ebcaa52adb06b498c050d2f4e32f90a7a8b"
-SRC_URI[trycmd-0.15.6.sha256sum] =3D "3e8673f1dc45acdff8e25a06cc62f8e52956=
3e8acd84237ce83d5a28e2befa12"
-SRC_URI[twox-hash-1.6.3.sha256sum] =3D "97fee6b57c6a41524a810daee9286c02d7=
752c4253064d0b05472833a438f675"
-SRC_URI[typenum-1.17.0.sha256sum] =3D "42ff0bf0c66b8238c6f3b578df37d0b7848=
e55df8577b3f74f92a69acceeb825"
-SRC_URI[unicase-2.7.0.sha256sum] =3D "f7d2d4dafb69621809a81864c9c1b864479e=
1235c0dd4e199924b9742439ed89"
-SRC_URI[unicode-ident-1.0.12.sha256sum] =3D "3354b9ac3fae1ff6755cb6db53683=
adb661634f67557942dea4facebec0fee4b"
-SRC_URI[unicode-linebreak-0.1.5.sha256sum] =3D "3b09c83c3c29d37506a3e260c0=
8c03743a6bb66a9cd432c6934ab501a190571f"
-SRC_URI[unicode-width-0.1.13.sha256sum] =3D "0336d538f7abc86d282a4189614df=
aa90810dfc2c6f6427eaf88e16311dd225d"
-SRC_URI[unicode-xid-0.2.6.sha256sum] =3D "ebc1c04c71510c7f702b52b7c350734c=
9ff1295c464a03335b00bb84fc54f853"
-SRC_URI[unscanny-0.1.0.sha256sum] =3D "e9df2af067a7953e9c3831320f35c1cc060=
0c30d44d9f7a12b01db1cd88d6b47"
-SRC_URI[untrusted-0.9.0.sha256sum] =3D "8ecb6da28b8a351d773b68d5825ac39017=
e680750f980f3a1a85cd8dd28a47c1"
-SRC_URI[ureq-2.11.0.sha256sum] =3D "b30e6f97efe1fa43535ee241ee76967d3ff6ff=
3953ebb430d8d55c5393029e7b"
-SRC_URI[url-2.5.4.sha256sum] =3D "32f8b686cadd1473f4bd0117a5d28d36b1ade384=
ea9b5069a1c40aefed7fda60"
-SRC_URI[urlencoding-2.1.3.sha256sum] =3D "daf8dba3b7eb870caf1ddeed7bc9d2a0=
49f3cfdfae7cb521b087cc33ae4c49da"
-SRC_URI[utf16_iter-1.0.5.sha256sum] =3D "c8232dd3cdaed5356e0f716d285e4b40b=
932ac434100fe9b7e0e8e935b9e6246"
-SRC_URI[utf8_iter-1.0.4.sha256sum] =3D "b6c140620e7ffbb22c2dee59cafe6084a5=
9b5ffc27a8859a5f0d494b5d52b6be"
-SRC_URI[utf8parse-0.2.2.sha256sum] =3D "06abde3611657adf66d383f00b093d7fae=
cc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.8.0.sha256sum] =3D "a183cf7feeba97b4dd1c0d46788634f6221d87f=
a961b305bed08c851829efcc0"
-SRC_URI[valuable-0.1.0.sha256sum] =3D "830b7e5d4d90034032940e4ace0d9a9a057=
e7a45cd94e6c007832e39edb82f6d"
-SRC_URI[vcpkg-0.2.15.sha256sum] =3D "accd4ea62f7bb7a82fe23066fb0957d48ef67=
7f6eeb8215f372f52e48bb32426"
-SRC_URI[version_check-0.9.4.sha256sum] =3D "49874b5167b65d7193b8aba1567f5c=
7d93d001cafc34600cee003eda787e483f"
-SRC_URI[versions-6.2.0.sha256sum] =3D "38a8931f8d167b6448076020e70b9de46dc=
f5ea1731212481a092d0071c4ac5b"
-SRC_URI[wait-timeout-0.2.0.sha256sum] =3D "9f200f5b12eb75f8c1ed65abd4b2db8=
a6e1b138a20de009dacee265a2498f3f6"
-SRC_URI[walkdir-2.5.0.sha256sum] =3D "29790946404f91d9c5d06f9874efddea1dc0=
6c5efe94541a7d6863108e3a5e4b"
-SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] =3D "9c8d87e72b64a3b=
4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
-SRC_URI[webpki-roots-0.26.2.sha256sum] =3D "3c452ad30530b54a4d8e71952716a2=
12b08efd0f3562baa66c29a618b07da7c3"
-SRC_URI[which-7.0.0.sha256sum] =3D "c9cad3279ade7346b96e38731a641d7343dd6a=
53d55083dd54eadfa5a1b38c6b"
-SRC_URI[wild-2.2.1.sha256sum] =3D "a3131afc8c575281e1e80f36ed6a092aa502c08=
b18ed7524e86fbbb12bb410e1"
-SRC_URI[winapi-0.3.9.sha256sum] =3D "5c839a674fcd7a98952e593242ea400abe939=
92746761e38641405d28b00f419"
-SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D "ac3b87c63620426dd=
9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
-SRC_URI[winapi-util-0.1.8.sha256sum] =3D "4d4cc384e1e73b93bafa6fb4f1df8c41=
695c8a91cf9c4c64358067d15a7b6c6b"
-SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D "712e227841d057c=
1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
-SRC_URI[windows-sys-0.48.0.sha256sum] =3D "677d2418bec65e3338edb076e806bc1=
ec15693c5d0104683f2efe857f61056a9"
-SRC_URI[windows-sys-0.52.0.sha256sum] =3D "282be5f36a8ce781fad8c8ae18fa3f9=
beff57ec1b52cb3de0789201425d9a33d"
-SRC_URI[windows-targets-0.48.5.sha256sum] =3D "9a2fa6e2155d7247be68c096456=
083145c183cbbbc2764150dda45a87197940c"
-SRC_URI[windows-targets-0.52.6.sha256sum] =3D "9b724f72796e036ab90c1021d47=
80d4d3d648aca59e491e6b98e725b84e99973"
-SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] =3D "2b38e32f0abccf9987a=
4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
-SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] =3D "32a4622180e7a0ec044=
bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
-SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] =3D "dc35310971f3b2dbbf3f06=
90a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
-SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] =3D "09ec2a7bb152e2252b53fa=
7803150007879548bc709c039df7627cabbd05d469"
-SRC_URI[windows_i686_gnu-0.48.5.sha256sum] =3D "a75915e7def60c94dcef72200b=
9a8e58e5091744960da64ec734a6c6e9b3743e"
-SRC_URI[windows_i686_gnu-0.52.6.sha256sum] =3D "8e9b5ad5ab802e97eb8e295ac6=
720e509ee4c243f69d781394014ebfe8bbfa0b"
-SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] =3D "0eee52d38c090b3caa76c5=
63b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
-SRC_URI[windows_i686_msvc-0.48.5.sha256sum] =3D "8f55c233f70c4b27f66c52358=
0f78f1004e8b5a8b659e05a4eb49d4166cca406"
-SRC_URI[windows_i686_msvc-0.52.6.sha256sum] =3D "240948bc05c5e7c6dabba28bf=
89d89ffce3e303022809e73deaefe4f6ec56c66"
-SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] =3D "53d40abd2583d23e4718fddf=
1ebec84dbff8381c07cae67ff7768bbf19c6718e"
-SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] =3D "147a5c80aabfbf0c7d901cb5=
895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
-SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] =3D "0b7b52767868a23d5bab=
768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
-SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] =3D "24d5b23dc41741267968=
1396f2b49f3de8c1473deb516bd34410872eff51ed0d"
-SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] =3D "ed94fce61571a4006852b73=
89a063ab983c02eb1bb37b47f8272ce92d06d9538"
-SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] =3D "589f6da84c646204747d127=
0a2a5661ea66ed1cced2631d546fdfb155959f9ec"
-SRC_URI[winnow-0.5.40.sha256sum] =3D "f593a95398737aeed53e489c785df13f3618=
e41dbcd6718c6addbf1395aa6876"
-SRC_URI[winnow-0.6.13.sha256sum] =3D "59b5e5f6c299a3c7890b876a2a587f311516=
2487e704907d9b6cd29473052ba1"
-SRC_URI[winsafe-0.0.19.sha256sum] =3D "d135d17ab770252ad95e9a872d365cf3090=
e3be864a34ab46f48555993efc904"
-SRC_URI[write16-1.0.0.sha256sum] =3D "d1890f4022759daae28ed4fe62859b1236ca=
ebfc61ede2f63ed4e695f3f6d936"
-SRC_URI[writeable-0.5.5.sha256sum] =3D "1e9df38ee2d2c3c5948ea468a8406ff0db=
0b29ae1ffde1bcf20ef305bcc95c51"
-SRC_URI[xattr-1.3.1.sha256sum] =3D "8da84f1a25939b27f6820d92aed108f83ff920=
fdf11a7b19366c27c4cda81d4f"
-SRC_URI[xwin-0.6.5.sha256sum] =3D "ca7e4546db1514c186778f0a257d89732ed9ed7=
5587d0953ac25be7519d9f0d1"
-SRC_URI[xz2-0.1.7.sha256sum] =3D "388c44dc09d76f1536602ead6d325eb532f5c122=
f17782bd57fb47baeeb767e2"
-SRC_URI[yansi-1.0.1.sha256sum] =3D "cfe53a6657fd280eaa890a3bc59152892ffa3e=
30101319d168b781ed6529b049"
-SRC_URI[yoke-0.7.4.sha256sum] =3D "6c5b1314b079b0930c31e3af543d8ee1757b195=
1ae1e1565ec704403a7240ca5"
-SRC_URI[yoke-derive-0.7.5.sha256sum] =3D "2380878cad4ac9aac1e2435f3eb4020e=
8374b5f13c296cb75b4620ff8e229154"
-SRC_URI[zerocopy-0.7.34.sha256sum] =3D "ae87e3fcd617500e5d106f0380cf7b77f3=
c6092aae37191433159dda23cfb087"
-SRC_URI[zerocopy-derive-0.7.34.sha256sum] =3D "15e934569e47891f7d9411f1a45=
1d947a60e000ab3bd24fbb970f000387d1b3b"
-SRC_URI[zerofrom-0.1.4.sha256sum] =3D "91ec111ce797d0e0784a1116d0ddcdbea84=
322cd79e5d5ad173daeba4f93ab55"
-SRC_URI[zerofrom-derive-0.1.5.sha256sum] =3D "595eed982f7d355beb85837f651f=
a22e90b3c044842dc7f2c2842c086f295808"
-SRC_URI[zeroize-1.8.1.sha256sum] =3D "ced3678a2879b30306d323f4542626697a46=
4a97c0a07c9aebf7ebca65cd4dde"
-SRC_URI[zerovec-0.10.4.sha256sum] =3D "aa2b893d79df23bfb12d5461018d408ea19=
dfafe76c2c7ef6d4eba614f8ff079"
-SRC_URI[zerovec-derive-0.10.3.sha256sum] =3D "6eafa6dfb17584ea3e2bd6e76e0c=
c15ad7af12b09abdd1ca55961bed9b1063c6"
-SRC_URI[zip-2.1.6.sha256sum] =3D "40dd8c92efc296286ce1fbd16657c5dbefff44f1=
b4ca01cc5f517d8b7b3d3e2e"
-SRC_URI[zopfli-0.8.1.sha256sum] =3D "e5019f391bac5cf252e93bbcc53d039ffd62c=
7bfb7c150414d61369afe57e946"
diff --git a/meta/recipes-devtools/python/python3-maturin_1.8.1.bb b/meta/r=
ecipes-devtools/python/python3-maturin_1.8.1.bb
index d0f0b381a5..a6b65e5e7b 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.8.1.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.8.1.bb
@@ -17,9 +17,7 @@ DEPENDS +=3D "\
     python3-setuptools-rust \
 "
=20
-require ${BPN}-crates.inc
-
-inherit pypi cargo-update-recipe-crates python_pyo3 python_setuptools_buil=
d_meta
+inherit pypi python_pyo3 python_setuptools_build_meta vendor_cargo
=20
 do_configure() {
     python_pyo3_do_configure
--=20
2.39.5


