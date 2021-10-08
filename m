Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5C5C4332F
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:48:58 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.63])
 by mx.groups.io with SMTP id smtpd.web12.6087.1633679334680079990
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=QKPGbWDc;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.63,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nnh4OacCWjchGsi9mgnSg+TZbmiGlIMztSPJ51Bo9/BDDzYNr8K3/5f5li54HebVIJMCymxGLbqZHPxJNDC8L9YYh23j3o66WNPQb9w3r24YIjPpO5v1HVnaMwMSM5HcxlgUMXjF/sUlk15/3aPSU8rFt1Misgz79u+rgVIzbnVOvWSS6B6wZCVbqu7ypnkgZleo47zxvx1clfjrtSfSaFw25GQJdKzl1AcbhV60mT9dP2okcWuNH0Tykj8zomARm2ZTBH/07jCw3RcU4+dyKUdvjAYp03/XuRtor0z6iq9WduUlKkHvXIFHHLQ3tiDRNfLiXR9Utd+ALEKDjgDRPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SEuFIUP6xKVdAROCN+nwVeNErAF3J9BGVsBzVh61oM=;
 b=Yn2ZjKpqzjvB4qJYBUwtzxnWJmLNtMiPvRHX9fDTvDkoA+U35UdVHjEtqe34ZhoVPN/TkKDn10NmsOkRDQSnmL0AzWXPT+wgBg4P2AYNhvc86913YXUTNOU7O52ZmJHz6JGsRRFsWnxFEBbmWX4vlQSSqb2NqjU0bwiUjyoPqANjLZ4sHQvMjFwLPgc5+BGrYwfBS5J4wxhku3m6+Dw7AfDPMBDb0ebJrSksdf27w9LrUYQ/TxfvWYkSoCAO8oXuXg8HIkGOAu5NQUWIvEbdCQA+sqNEyvGjagTXt6PIFVjZ5AK/uiDTEJbOB6igNu5Ye2jmOX69L+r81CaLo/VpOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SEuFIUP6xKVdAROCN+nwVeNErAF3J9BGVsBzVh61oM=;
 b=QKPGbWDcq7LOawj4jRxnFgyagObwJhBaBedYtt24/C3vlWhd+Faf2cQGSKm8JogJTa3kq+11AEU/T6jMR60l29x6K94Rex4753d7VmFHmIzNoLUxE7ceezqb9YwETdebdgq3oYvCI17UMCvwjksyJHDgYXcs3x9k7HT2cBz8Rpo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB6127.eurprd08.prod.outlook.com (2603:10a6:102:f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 07:48:53 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:48:53 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 04/12] recipetool: Change default paramter
 fallback_licenses of function split_pkg_licenses from None to []
Date: Fri,  8 Oct 2021 09:48:27 +0200
Message-ID: 
 <20211008074835.10320-4-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211008074835.10320-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20211008074835.10320-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.155) by
 FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::9) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.4 via Frontend
 Transport; Fri, 8 Oct 2021 07:48:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb4848c4-0b0a-4932-0ab4-08d98a30131f
X-MS-TrafficTypeDiagnostic: PA4PR08MB6127:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB6127A8C0BFA9C7BDBDF2FA5FD7B29@PA4PR08MB6127.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:475;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y07YuZl+JR+55YsCv2xvx92fLx9FrvYmCy2wnWb4BlpyJz93p4UA0UYA9AsJ3eIqNFhRvlsNKQH3u8aKMGAFhQndnb2reII7OfCqYAFKrLomGcyu9Bd6yoTC2sp+bRBlJ3akyhYjIRAWz4oySwg4QH381ZtgO8fqIteZYfhZ4w4Q2p5tersnXBQ5xi1x8nr6UaEx9Ll7f+UGUH8R2MRzU8Zh9nCYUxWzH0GC1Rc9YCkjw+Ml/HBQauhXo/kw/0srP0blITZORsVYeCm+qd1pl150na99/2mSAY7iODsG9Z7fo1pisCeT7D/IohyW2IubkY0wPP+ytASyQdDNFWrsssv/3xqM5hpr9xzqtkYl2qjqKkt274aUk2QxIVfua8zVbjPa8p8pArZOsrXdpnfjJbk7DBQ5Hq7ggeIetATWkHRAsI7Hri2UATsAQKwjNSksFCROK6c0g+9A/DXqI1sL3kZLHJXahrG7NQ5TDhx+g728QuSUrm302b04g6oLKPAcfmkCisXHEVRjRKg0E//YiddC9Py1iSMvBPokupgnIuLcIU5iIHO0xGhkZUOfUHh5bOrx9ES/sx7IEKseei/aeDRtyOK6zH1flhqQf2EQT3uPLX3b+NWT2xc+j2PI84YIOsJtPoOFURVas5qxuhzrywT4axVlqaWUHhiXYTHDK8Gb+Nfkr568tW/hdJoRbkmXdb9ppIBkREk1r6LhrNcgXg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(186003)(7696005)(5660300002)(26005)(316002)(8936002)(107886003)(86362001)(8676002)(508600001)(66946007)(6486002)(4326008)(83380400001)(36756003)(66556008)(1076003)(66476007)(2616005)(2906002)(6666004)(956004)(38100700002)(38350700002)(4744005)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RtQFN9JCJ83THRtAr5SEWbT0Lm2jC0Ra4Qm0k8DyMREEks3BjUASKTvAU+kK?=
 =?us-ascii?Q?gEwpkOJsXjWCuhOzPE4URCvrgopz3NimTHRCEp2sSdOB5Rxiyum0CfZdJlBV?=
 =?us-ascii?Q?VgP1qPFKHIqkRKDptRmAmcLK9h5uisLpoZZqZ15YmYhtU+Oy2KD4PwTsVLYb?=
 =?us-ascii?Q?pI7fJauFG1o6Y4WFJZmDd0IQbr6LuA4yl3KnJVPZQoKNCV+Xhj/tUvozcnnB?=
 =?us-ascii?Q?XgPMSv5J8IpezkY0e6QALQfWJiesyj+lE+bkmIj5CiAnN/WkHDq/H87DIgGd?=
 =?us-ascii?Q?STheVm904PFran0PMebHmzu3F4+gRk6Qy1BFiXubYt38SaQhkTOJccW26u1C?=
 =?us-ascii?Q?YKwz3At1MO+wLEjnuuQ2TnY1QClSH4Rct2HJ8ym4bDS1Q1r2WJzb1rANSknJ?=
 =?us-ascii?Q?oG2+h1k4EQF8Ph3PUVwF4TMne8VAOo7pTEucjU+ClzNKg8MZ30nYhfZWUVaD?=
 =?us-ascii?Q?o/mJQj8H46BjIAoyid5eE2pyM6DvR8kh5Ap80dDR5Y8CERvcC0t9hImBEG67?=
 =?us-ascii?Q?kw7M3UI7m88JFYKwJ0lFf969Zwm9g2A/h/yp4fH7Hlv/8m0mZUxF4aojCLKG?=
 =?us-ascii?Q?F3bDkC62GX23Heku6M8LZG9fU3tNBOvzhWBRliysELybWpddG0gxJvB++0zl?=
 =?us-ascii?Q?qvz75IQ6PGH1NRRYCpNuCPnDJ/0W1fKyFFSkQjw/CPox8ebS8jBoCdWs3hhz?=
 =?us-ascii?Q?N3pwWfPKMN1Wr+ZBcGEg0BVtVfzgPKLu8w94bizxHa/5IJ8J48+LlObFFRq+?=
 =?us-ascii?Q?VyjT2FA5jPdKrZ30t9Hp4FRXjeCSMPg1LPh9zctu9sTSiAGTncyAkyBI4dKO?=
 =?us-ascii?Q?/B9do8/X7X7YHnj6FZgI0V+EOBIWXfZnlCFG/3AHn5E+LrVWJaL+h6FRN8Au?=
 =?us-ascii?Q?bSP0b01J6Pbh8VdJVuzczjc2GFoununXy8QNWbO4koM2yXHguWbLvvOHRMic?=
 =?us-ascii?Q?r8tsqMw4OUDT7yopOm6odgiYyrFM/I5h9X5JMuHiYEly9kbjFGrmEpt/DfTU?=
 =?us-ascii?Q?wZ9Gg2XU476v5bMzLs1z1FGXW2eQroOmXm5Xk391Kf2Q8p4YTyRssnVkwGWj?=
 =?us-ascii?Q?lFoeUTDAVwVmpg6pgElPAX5G6dGf1bUBe3WKgy+zaLJjAljooTi12SNMZMiK?=
 =?us-ascii?Q?/m0oHW4LcUOFyxxM/s9m0GBw0ivTtV83CTbFXpLv42dzll2S4Ay3kYeXPw0i?=
 =?us-ascii?Q?Pw5EzSKbdTjOWH10tGnTM3yjOc2kgL1ZHCsA7UEVqUE6AbASNthM2WIJJZG2?=
 =?us-ascii?Q?q2wUJ01t9c+HiHVDqsHqa7OHiie3sI4Cp20IdHbmsIAxoDbxpefA5fiOLjhW?=
 =?us-ascii?Q?rSDmlkVVjUXrnKd6hoiJX2Wo?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cb4848c4-0b0a-4932-0ab4-08d98a30131f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:48:53.4536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SX0RprTInHUxHsgcH73MflWPjiQIvlIes45Xr5nZBu8M8ssXRoZA0JN7W5erBMOD6yBjh+7Gt7rW4VmtAPewYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:48:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156760

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 83cf25d9b7..893980a5ce 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1134,7 +1134,7 @@ def guess_license(srctree, d):
=20
     return licenses
=20
-def split_pkg_licenses(licvalues, packages, outlines, fallback_licenses=3D=
None, pn=3D'${PN}'):
+def split_pkg_licenses(licvalues, packages, outlines, fallback_licenses=3D=
[], pn=3D'${PN}'):
     """
     Given a list of (license, path, md5sum) as returned by guess_license()=
,
     a dict of package name to path mappings, write out a set of
--=20
2.20.1


