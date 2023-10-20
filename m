Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9783ECDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 07:49:16 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.75])
 by mx.groups.io with SMTP id smtpd.web11.49667.1697788150539860826
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 00:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=P3mGfF7g;
 spf=pass (domain: navimatix.de, ip: 40.107.247.75, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fd9AL0NouJnZd5h5+q8O9fOPAhQJyGAlgoBUsynYWSJrADL3S/MBotA33je9mn8KdyhN73Ho+CBwngLbzIL4NWp+O32iHfIIyTTZfBl/5Bi7M6mbIE4HhxJR/qORQMSoHb1RQkCrXsImtWqZlXNKmmtaLyrRTGyNuzwOIB0qDx0Cai6NSTpVSVJBWRa9rscMYwqBUvmnpqp93xFjy94HhPnX1JIe45jjhFDVENUcGqxH8EBf1zVEXn4O1pC6v51/XuXbZU/WfR83NP26nDLU+4FuqkQMY4X1hzB8pn6qTk8ShuKs8rBOkfZ3yuTk9QDfFUgd4Xp3IGVQzfoB5WW/RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWXLPfOj1fvaUxPDUtuh/xwaAMwlKSYMkHm1KYXQ4V4=;
 b=QdB+wUvdafsiEJM+jStCsMmUIP0dsAAuTOTA7flGyAkjPbDoFeFm4zTSJkYzNt9xm+eHSZWTNHS+4MmAjfksu4fQ9wbgOadhk3JuOncbVuXbv7+EHs46XPDntvXs1sxMGoXDw8nKM/Zhj5bf3VXGTyIDpkugO5beavY6fNdDPwRG8sFEBx87CptOajYBNWuG3pq5UMWOIp/Ki6Ey5iWJ51P59BlLglVZL/BakjWPLI1lcxok2n2vQaZ+P0n/aBN53En3YKJDf8Q64Cvyk/PV8K2KxW0XeK98NiYtV/YEWrGeAPreSekINpoYZlmpCrzci16/Nl/OvkZCQ/g/OYSV2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWXLPfOj1fvaUxPDUtuh/xwaAMwlKSYMkHm1KYXQ4V4=;
 b=P3mGfF7g8u2IHg2adCunlmIyO70M+U8JXIPHEOzo5pBD1MZggTDFT/50imcE61bvKYzZzsV8BKPehhsmrsLxtsnb4jUnNG82B5qEdhFp9rzyeuaXKYJbxhpjw23MeyOXgyJCMijk6i8jHtzny1kB8dnbMBFSZpSQFYynpeXoiq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by PAXPR01MB8533.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:22b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 07:49:06 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417%3]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 07:49:06 +0000
From: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [PATCH] package_qa_check_rdepends: Allow /usr/bin/sh if usrmerge
Date: Fri, 20 Oct 2023 09:48:41 +0200
Message-ID: <af76d8aca13740020e829d985af5c634a7115358.1697788121.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::19) To VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0102MB3136:EE_|PAXPR01MB8533:EE_
X-MS-Office365-Filtering-Correlation-Id: 654cd031-d0d6-46d2-42e5-08dbd1410917
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y8nSZ7g9jqLYL2XcfrBvqyZNK85Z9Yx2uvPzIleitIUAOG7jAeAOTB9+GTLLKL4mtNZMYXPnr/lJ90SO3HFIgT4ZsurAdZmVcc3zdfynb2o0nCSbxS3Fk6I1SUuB+RxHtScCTCADtQ7QXZEnB/Sv33xLosYIRR/6MOZ7wAshxCB6Bon/xGnRxmYSfAJZKXGQmYXoFcnUwQ14XEheD0+4k2dp5FJslnTP9r3Z4HGS89p7pZmKT5ppmCKE3h5KYaw2pRaXQ11LlxMXecQJg8cTYVW1T1Lretx1Rt6Yi+t1IUNqQXAR5MTJXESqd/wVjdDvbalU3LraJ2hie9VrfT35enoQGsSXu5FaEJvG3SihWSG+7/k0N2vbdwkfhjqvxJFAq+l0A0ad/MN5c3z9B037Ejz1wRNWZhTMG+Ij4KBjFVAF4Gzq5953C/OnoujjiNzReXWpxqQb5249HHdlbSjRNlB9gv+UyxntNvjI8wEtl0/D/BMOCfw5QMUzxDQbBQNqsQ4oB8wZ8y4/kH9l4uKm3x1knPykzbGwJQEnz//naP7LPsxa+oupgh754+Ky5Ipx4PqUsOLZJyUJtz3MtzIKJtD3FNxbvL+bSDShfrcZLM7UQbd6An+KcQPTWZp3Q1ZI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(346002)(396003)(366004)(376002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6512007)(38100700002)(52116002)(36756003)(66946007)(5660300002)(38350700005)(6506007)(478600001)(6486002)(6666004)(107886003)(41300700001)(2906002)(316002)(8936002)(66556008)(2616005)(6916009)(8676002)(26005)(66476007)(4326008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+UCb+CIT+PPz1CVslP0sR1P7XOIgzGluX26WCs2xFT+6SRqCR1xGFLltYyz3?=
 =?us-ascii?Q?VELSv7mcWeHZScIYZeskpeodIuob3p8lNmllq7VqobTWR32JNmg568IS/bPK?=
 =?us-ascii?Q?efUm4dOfa4aybsJ5LIpazkrHSvtgtye14Wnwn1PLXtDeV8FIogFsyeNJ3QBE?=
 =?us-ascii?Q?VevlblvTqetI95+8NgnSz2JLh3Dbv4r6QunWypIuNaLDOp65WdW7zluzaIOH?=
 =?us-ascii?Q?MWn7UhglikFxlLguHFgKS2YFGc8mjRe++ZcEedTGMOJz0DZtUAoyQBiAZa/e?=
 =?us-ascii?Q?JYyrnPUznKwqHG6XBK292Yx1PeaicJPqfNJ7VGoR6NyQ8vX/vZQtE4KOt8t2?=
 =?us-ascii?Q?+NJ8dE++g9sQrEDKVnVDxWVGBwU8s/stTuV3A3bhFe9mJ0Pp8QDdit8Eq7ZP?=
 =?us-ascii?Q?kbUKxu4Yic+1VFOBX7Y8bupvspYqQsTBIi+NtI4QdyXKkP2Dy6EDjAeIAHfj?=
 =?us-ascii?Q?tzxva5grkKT+OL45eHdPzyrHlKapTf9PZPkvWA0lHbg4+iewkWEpiRNgm8Po?=
 =?us-ascii?Q?IDukuYyQ7ijAJBsrdqA22MmDkPLTpziCjvi5fLtGsxCyfWatvFf+gos6Dk0v?=
 =?us-ascii?Q?PMkn+CDtFRJnZEOF+rGhsGII/JhXHizugcHf0PXRpcc9EyDickzEU5fUG8Qe?=
 =?us-ascii?Q?qYJR4hWHv1AKS64J7A4Jh4fLyJcjH0HNo1WdhaFIJSuzJb6NZId5w8YCCSRW?=
 =?us-ascii?Q?5ktjbyy+UsIZdWYmtQWJpZGVFb2jBtnQtR9XO6m+6uqkxNN6ERzpd5OcTgSS?=
 =?us-ascii?Q?GGHOIJhNPI5rW5RY3kp0g3NtH2dmhMzUP1SmvDAh5/H0HPGabBiJpuFQpDQ2?=
 =?us-ascii?Q?co2psSIlY/F8l5+FZruVhHlBEIBrKKozvhZUwAGhWrjUzBpoyP+nhva3pPZ5?=
 =?us-ascii?Q?9DAzJU4HSAmvdBRcSlLpQywUpZ/PreHLtfKB756My8NnRzyiSwGNADj0dL9Q?=
 =?us-ascii?Q?NjDZjXfnFBLxsNYfVJvE0YcvNQ09fUtIa+tsq/cvjak5dS0iAaF74XMGTAp6?=
 =?us-ascii?Q?dDmtk/0+IEH/lLSWHFhqTuYZoODGJFoakb47XCmTwfVKev2sWSPhIt3WzV2w?=
 =?us-ascii?Q?FY+fs+KZm4YRdXpFnLz+HoCN9TD9LSWOFH1QvW8TLQ8UaqSA5l91Nam0YxIy?=
 =?us-ascii?Q?t4K9LemryakXmV1k4DtgU5xE7+4L2VwGztFD72Ehf38ae2ItyuZd+juSLhto?=
 =?us-ascii?Q?tVoUQ+kyO/U48gnJXjGvMKTbTFKGmirRRYfKai1zmjkkLniDWZlm+rXGkLwv?=
 =?us-ascii?Q?lk7c/LC9HlJmJVFlJFF1pJbJosGwkES5/wBX1dhpWJ3c1vknJyGNh/XswY6U?=
 =?us-ascii?Q?pmGZ//Uz/EeNR6Q50KtbP2X6nHfabdia9gfufVPpFb8+3y2A+xg8fFAGZ/Fi?=
 =?us-ascii?Q?6vDgjU5WKeFznormvkpXmcN6C/mFt+H0UYfvm4pmriEYixJGjYs/dklPOqiq?=
 =?us-ascii?Q?CcFsyHeLFivha5HN4k1wj/h9gH2B/WtYXzwJlhF9uHp5pcn1DujmJ88FwmBX?=
 =?us-ascii?Q?UPUv4uYcDpWgF0sSK9p6wYL+P8gkTmcfxjZiLP1K8oSvVaQR5PfU8wublVk2?=
 =?us-ascii?Q?hC7PQYV+cs22CTauKmrxyluK8Lw9JIi0Xb5kW224BR+uIiYhMkmkZYWA7Dnn?=
 =?us-ascii?Q?kw=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 654cd031-d0d6-46d2-42e5-08dbd1410917
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 07:49:06.0367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXZWbWiiDgDjbqbWNHdJgQR3pynt4+9AvgU3CWjOJ+DG4gSAQl75ILWL6qunWGUimILaTAy0hXMjHRx4mbh8u6XbUodmvL/MfletGia+VBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB8533
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 07:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189500

If the distro feature usrmerge is set, all files from /bin are moved to
/usr/bin, i.e. /usr/bin/sh is the same as /bin/sh and should be allowed be
ignored, because it's always present.

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/classes-global/insane.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass
index 6f3cd3026d..ecc868a4e0 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -923,8 +923,12 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, task=
deps, packages, d):
=20
         if "file-rdeps" not in skip:
             ignored_file_rdeps =3D set(['/bin/sh', '/usr/bin/env', 'rtld(G=
NU_HASH)'])
+            if bb.utils.contains('DISTRO_FEATURES', 'usrmerge', True, Fals=
e, d):
+                ignored_file_rdeps |=3D set(['/usr/bin/sh'])
             if bb.data.inherits_class('nativesdk', d):
                 ignored_file_rdeps |=3D set(['/bin/bash', '/usr/bin/perl',=
 'perl'])
+                if bb.utils.contains('DISTRO_FEATURES', 'usrmerge', True, =
False, d):
+                    ignored_file_rdeps |=3D set(['/usr/bin/bash'])
             # For Saving the FILERDEPENDS
             filerdepends =3D {}
             rdep_data =3D oe.packagedata.read_subpkgdata(pkg, d)
--=20
2.34.1


