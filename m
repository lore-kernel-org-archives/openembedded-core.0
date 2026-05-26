Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22AFACD5BCF
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 06:00:37 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31397.1779775231619589817
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2026 23:00:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=XIP2aH48;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.159.76, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=maZx5vvcLckV0FLVIwddBxSV6TyEzFhSGjRoK5uK8pCkwtOxB/2DjpyMg9qN8QEqGrBpDpaMv3YzUA/m/BD6B9JnU4N6X8Q9d6yVyoIsJAL4nLOUg/EvT9fHNU3y7p1N1Bj2U83kXYRXbJXKCUEvbKwktzWLR0G88faQpnvTImdc0L2PDUCbIgOgCbfJoAG9rFoP2c4f5KGWJFuQOP8cMRLktYYaItIv3tD3I2oCFsN1B/4geV0sMvI/k860Pk+bsDXDGPVNYgA4J83vdKCTP+nip5gpw596d2RgJhuUiI4Zi6bSzpsIKiTL7aKoGUua/oEXOgfAZ9zloH3xVYHpvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vU2l7TRSvVo2pOAzb75ciGhTIzWcGSvaV+AHpSf6Zg=;
 b=DQDG+LUmrkqQosheNwuv4onCe7YMr8VFGaTNl2OlQ6p54KhbcA6EfcQUJKh1pBu425JjFSd65ceT1RVqs54tRpDnAqE/J69PTTXbA+MjiCGLGWHJyQ8fPW/fYhHPgctGgGiG6urwFFUQJ5yjj/HxTB1RuYv1NyVGJYBd1WE75EUUcfoXglkFvTj2bBD/4y6hkZlBPW3tKNws9zD3yjavwLYEwsKKhzeDeCw+ftGP1L6FtKd8mpkkhVhnuzB0hfAYWuA+hUu3QgRSFhidhs9uP7DWuVRpnvZTCRyw/0A88A9XOiPZq3XmlBE+Gz4cNjOnGcbdD+DvuggM/z1mz13Npg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vU2l7TRSvVo2pOAzb75ciGhTIzWcGSvaV+AHpSf6Zg=;
 b=XIP2aH48MxldMvh+B/drRDPryiQN/tVJlv4C5fqYLkuP6o2DbvhcUaLIaYwODbXoVmTJzMIIId30w0qh2syRNLgrjAjSZpTv7xRuUwS9RMSxAlTbhB8vRUJy/EF0Hq0vBdxKj+7Bpb5Vjpet4ia54sUQgvEpm12A/PqSFSxN9TNwWYb4nxImPWEmI2Bu/XxFv3REZZ2KZ0X3Yr3jZQtd6fRNDl59qui1G+qX+50ZEAglaDk+b66mC7f0+BALUKAIFmDpUuqaojUKAgjxbM1bjcvuJN1lrt4fAA0w1Fpvgd38QorrRSmouIgiGXBAZra73fIVx39nQ7l2iAy1q5GEvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by VE1PR06MB6894.eurprd06.prod.outlook.com (2603:10a6:800:1aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 06:00:24 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 06:00:24 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 2/2] sbom-cve-check: Fix empty IMAGE_LINK_NAME handling
Date: Tue, 26 May 2026 06:00:00 +0000
Message-ID: <20260526060000.874022-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260526060000.874022-1-niko.mauno@vaisala.com>
References: <20260526060000.874022-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF0002397D.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::371) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|VE1PR06MB6894:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa0aece-cd76-47c1-feb9-08debaec13fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|56012099003|11063799006|3023799007|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	HVsK0j3IaL8t8SzDOLMGZVNsR84VZNpeIcK9Y2MchZ8bD2sVRBDeoL/rAEFdOgu5KMoyAHYtW0gQh0BF6nxlLfkKTFCGe2ln2vswsi6G5nrZioIwqxzEWtukd5MeHgBXXR+yVEPQ9nQ6KnRQGbSORndO75UbPQ8HYz0I1L6vbDZ6AV12hrcMAlTF8No27EElknN/cjmBFBgqk74D/rcwAWRP/yVjpxl036kXMDNNOwR8Q+qgM2RDR3/2LWLbMef4cbHcplAS+tS4fK/BjJVLbUQBQJmeJE5pLfjuBm8XeIIPEoKXv6VgMFRM6IF+pYEV8K0t7PMSocaeVEyMuQCQmX0VAqpjBaAA9Ij96CgDZdHyO3UqsbHqA952cXWa6usDLC6NFGY5Ez7xeQvqJEtwt9BAZ/X6Gf5CVXFlYL9ObUe84dYFVXy2PoFtT6vAAgsiHomeP3/XvGwKsyg63SfY7Jmu3M7d8Hnx8MYLufJufOrtfOAqWWyDytYqtiT3kfYrgmr8w05mtVKipEkpWQcG336HKaCn9dCGmB9qHIWtB/2fXfC/z782ewdQkceNl9qCVM0qs6/yKJpXPUDQ2BFWm8GYTx3vaAbG43lyGVb33kEt0P3W1NFtkbo9JoQNjIFHP1tqswHD1L1wXZZCSeRHKiOFU0WaeGLHDqDruDpgf+CkiuRxTigfUGrJ8ORLPtN3kkQFpNOAjtg/4jbRaVEMW8hrykgp6CspitHq0YMSs+mWu+a9Kw5qg8hmFkCxwgUp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(56012099003)(11063799006)(3023799007)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LcQ5it2G9fAfgAvFBUvImFnfIQTjXU9AjmirFl4Mj/+ltFcskKDnzPeVUDPr?=
 =?us-ascii?Q?mH/eMCRAQtom72dIwtqoIbNCWAMhbtlMwRwDe5t7+PTFFcBo5c7mf8C9diPh?=
 =?us-ascii?Q?lD2Wfp0Ni9WWhVgQkHjXPI41u1Xmc+6sPf85Fy46N7enACkfAw+MGlwriG0w?=
 =?us-ascii?Q?ao++bh/vDYr7upDk3/U1+iatPdZd4N1WuQZaENmKbHpJ/lFBcBIrmp2jVjmS?=
 =?us-ascii?Q?aqvU50yBmioO+4/1ZNi//cFYy2HlEyCd1Ri2bOgHdVmaTyS9wlYciJtknLif?=
 =?us-ascii?Q?J/1TzUaJ1/hUQfkSu80yv9P9dDRvG149/2vmK+SgF8HRgAt8YzeLFgSvcwIV?=
 =?us-ascii?Q?vQdmRWWcnluGnpz/xJTSFjGzqByN0E9IwefAphHv1iy3lMkCT22hG6guJavg?=
 =?us-ascii?Q?Ev8TwE3nCktf81adEMT8uEbHCQO5PvHAwvfd49tPu10kynahLL9XKXnlXRSR?=
 =?us-ascii?Q?3oohTmjlsGk69WNx2f/y8X3l9+Ogk2l93zPRi3dQXpEA6JJu8gaMc03giL5r?=
 =?us-ascii?Q?8N7scjLfz8FQmN+FRN32D6m95OAF9+OQUt7a2lFZErLUrtDk6xY6eV9j9McM?=
 =?us-ascii?Q?HcMg+o908y4nIzgHs91mY5eedbKdjAn/UVmJbk0Cfe/MPBTG0sxs8kkT8Izp?=
 =?us-ascii?Q?IaLHib26C4+Wj2cVbSPMQQSgo+i7Xzn6EnVIvLxlx4+kj3sNCOmda1WMQJkN?=
 =?us-ascii?Q?GaKlaG8jfIhOC6tI9LiCP/atR6pHrxNP49DdBPP0jlBDz6XoLkmho7WyIbo2?=
 =?us-ascii?Q?iZfzgH6TPX0K6i+Kp5NZO/dp9ggMAtHupw+WqyAB9p3o1wsC+DbkhsBeKGK1?=
 =?us-ascii?Q?eXN7DhYYfkilV1ISrQTFjQxUr/mVeTkr65M5xJJgOWIJOb+/k+5u+1LOs/ml?=
 =?us-ascii?Q?g3FiKaMRQr6Kxkzo1Qa0GGC9ceV8oWpSavF4etxEBQwvzZJzohKVVuG9LOHx?=
 =?us-ascii?Q?wSZEB2g/W6duB3XMAwbL6SBhj6TNKsjFoTqCSHEq9EwMCFSjQPUie2NqhIeQ?=
 =?us-ascii?Q?cqqrQUGndKeDcIGeH1cuqiMEoqja0LMIbE5F7fQzJmtMnBQr6JLMSOSzSpsG?=
 =?us-ascii?Q?yE69rzVWd31OLTsxeL2zshWTBr/eMTm5goYeRquQkVytexEcas+E3KPhrO6Q?=
 =?us-ascii?Q?Xt9KN4Vdyk+PE7JS+1V2VBZ7NPLKUpDRS6emSd8ZEqlc0b4mDvbQKGnJasAd?=
 =?us-ascii?Q?NSxOrXwvyoxCZgf60daaHaNATmQ5h28ej94mrO/xRksBXld17+vYEU0J71BL?=
 =?us-ascii?Q?c2IUD+bhcpb2+mNWA14WK+kozQwOi5FQQgCDzBp969nVzKYk2ShBYHvhuf2T?=
 =?us-ascii?Q?wgBZFPm3dza+ejCzplr5kU9mor/okLDMB+iDGVkzBzMEH6AN57azH4PTtkrs?=
 =?us-ascii?Q?z+icl3vLZNddsEZRn4DFf/YdFeO0mPXf4UJXHzUvVMJNqcWqdZnLeSFaQzSl?=
 =?us-ascii?Q?E+ZvVYKfP2dSv91WVK/FGZZQ0g1lsbddbrHZC8LbRu+WhLxZ1h1PadUwvyJa?=
 =?us-ascii?Q?4JHsDrUwvaTo0xnwZUa7H1k8ft8Y0R7DRuq13EZhN5HBdVDpQzLDJdFgPDNm?=
 =?us-ascii?Q?axnPkQMUslapAuxQ+6QgYkUGQ0RtS6DS0s/kFX/ACe0fKtGphBEd7rzpBzJA?=
 =?us-ascii?Q?RP32IQBY0NJ0pct6SG4hMYGTsBVOOmlxYTsgoxPPZ2M/Om6X2nMyEu1ZpIEV?=
 =?us-ascii?Q?nRMnolS93OKsAGAO4z6fyt2Se2c0K7N7z3afX+S6yRdXFdCyZpxZWnOvWtlw?=
 =?us-ascii?Q?SrjEhsc04w=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa0aece-cd76-47c1-feb9-08debaec13fa
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 06:00:24.5382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +VpVXjuP5ILThhJlwmijoBrrshZvRv1mO0ABffGJCcSyUsFiS5Pp+a/0ItAocxk6msrsS2Ypr1pyiuXBIjfxbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB6894
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 06:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237585

Avoid following build breakage when IMAGE_LINK_NAME is set as empty
string:

  sbom-cve-check: error: [Errno 2] No such file or directory: '/build/layer=
s/openembedded-core/build/tmp/deploy/images/qemuarm/.spdx.json'

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes-recipe/sbom-cve-check.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-reci=
pe/sbom-cve-check.bbclass
index fe145a2212..39719d51dd 100644
--- a/meta/classes-recipe/sbom-cve-check.bbclass
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -14,9 +14,11 @@ python do_sbom_cve_check() {
     """
     Task: Run sbom-cve-check analysis on SBOM.
     """
-    sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.spdx.js=
on")
     image_name =3D d.getVar("IMAGE_NAME")
     link_name =3D d.getVar("IMAGE_LINK_NAME")
+    sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.spdx.js=
on") \
+                if link_name else \
+                d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.spdx.json")
     run_sbom_cve_check(d, sbom_path, image_name, link_name)
 }
=20
--=20
2.47.3


