Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E25FC43217
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 07:49:00 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.63])
 by mx.groups.io with SMTP id smtpd.web12.6087.1633679334680079990
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 00:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=IBUqAMyQ;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.63,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkpYVXEq57qcD+ez0BAQPcxVkiDLInrHpYUz2UfpOu0Im+Mo3oZCyk8TC51bO7/sLXO9+CRCbj2tSxquZZ3nFcjNzl5w3p+xwdrp0vYgMM4RBsNCX7cUZN6oH1DcBrQvv3Fp02d3Hm8ULr4d4XmWeotk8A2pz0wprwPMNe93rTkNCWcppLaKX4e4l4qxsOOcOmZYfdlpwsOGnT7vKkctopbkUyJFnIp3idsP4k2jXCyw/Jopxl2eOKAmxzgYeb9QJy5qiEVMSruG/cchPjszID+F/uLiQfD3sQfAWRzUUKtlDTZkCHM6F0uG8jSSsaZ50/KhJL8XW9ExryU6TfhulA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7P0jhSxZF+eAVAZO8Un+4oQawwSw+ld0oJrR4K9sEQ=;
 b=kjYr/Cvl24rqa9F5p9ARvLTciDrdONJbEFfsCZWE2u2tZLCzIrdK0IwkKzwiz0HS8UsEcdhNGUZM+CQ6KoaGWlEzB/9clZINEc2mQ4MDUW+ds/+1ifp+UFCHUJgCjZhTTFToJJg9i/2ndILfoxOPs4MCZZm/5cbZyazBBSpeUNFwvk3d+D3w0OfWgJRHlSEMdIt8dBWqeAxlx5JOnxUzN27Pk4sOawcc0UTll3ONPvmWNT2jMrsTiYHbcRCTHGA0+elarvwFjmFlJlzubUMy5yONGujFn/8PYMUTT2IzIrCJNrWYaPl/Pa5M5r1SUON1/hlvQ8GvSyYfBqNUUrbVvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7P0jhSxZF+eAVAZO8Un+4oQawwSw+ld0oJrR4K9sEQ=;
 b=IBUqAMyQqLIv8RH1dhhkLisgsEH23HoaGodeJWO10j0nRl9q8J+nRFck85sAyeqP8dnWshEEEaPm4WFvPbmhoNf0kj6rYhS/knYhQ9mLRwUUhMPei1nboEYe8AjPafkC4OKApDwnqPhMD2p2Kls8kv+M7/WJYhkkySAsnYjlbDg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB6127.eurprd08.prod.outlook.com (2603:10a6:102:f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 07:48:54 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 07:48:54 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 06/12] recipetool: Add logger info for missing license
 entries
Date: Fri,  8 Oct 2021 09:48:29 +0200
Message-ID: 
 <20211008074835.10320-6-stefan.herbrechtsmeier-oss@weidmueller.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5d320339-f4c5-4d38-b19f-08d98a301389
X-MS-TrafficTypeDiagnostic: PA4PR08MB6127:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB61277FE87BEBCEBDBE6B56AAD7B29@PA4PR08MB6127.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	P2b/O+ISvw9ggptY9rCRvulJqTWLAvkAQBNT3vP3AQvTzQM4nNxJ1K/O2KoQxezaa0BEVh2vq9czluZt380PmrwYHO4rXsAJTQ1dlsWTPA6pKmEmRB/aNe/QtSu4Ks06nQ5RNkXBnxG9QQ+AX2EMOkv4RhABnAN0cM9nDIJH6KH4FJ0BJqBqOZiSvhAbNVDnGULP8u5hJDa4MjOk5xBVBh2vUn17TzoZwo5p0C0w01gJVvpLCphV/gv7a/UfagcgItE55kOAc5E7LO7pqo5i2RRR0rlKJfKnU5sGNpm8znevGxK71ebvkl+TWHgoC1pdGvjmysYBPZwKlF6Bk/cZLLMnTLskEW49uXuDayQgEOm/9Dhqj9k4PRzHPbnuyFdxPxXm/faXC0bZUg2bE6ZkmiXc78ehKW23hnYBXxp0iKPRW1Hs8fAdiCVPLd8fFoELz1giC8IzwpidL86SeoxauXUrCY5yyf2WJqt8A8D2+/dKPzlc1+0E8+A3AntKr+cMHTnt3br2REyK4m+n64I95526ybeoeOqvQZrEzxVkM9CMUShjJrOiey7BSFuxM3Iv3qWgBIt291SpVskSyPIZviu98sW+1YHEiShH/4WOF03UG9ihPiUrLdQr351MeL5XG+3regELGUJwY5NPGnDTpZlg1rs+LOcxk8DXfRAU1/0mnMdVUtv59c0g1y6nnglDBi80Qob3XgrLRov9GeEvdg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(186003)(7696005)(5660300002)(26005)(316002)(8936002)(107886003)(86362001)(8676002)(508600001)(66946007)(6486002)(4326008)(36756003)(66556008)(1076003)(66476007)(2616005)(2906002)(6666004)(956004)(38100700002)(38350700002)(4744005)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WXXsqMPvGNBLUtkQZFqMetOHd3lmSE5tTL1xqSFYm/O7z1qenDS7CzQussk/?=
 =?us-ascii?Q?yleVnWwXNI/tZByi5JpavNNvPADwb8r1/RWBYQlew82WL0UXCj5oQ+6QmJVj?=
 =?us-ascii?Q?x2o4cySCj9z44XxJ7QQim4Bn2ntWaNcyxpfg89BR0ShJpqHZUwGJ36Rc07sj?=
 =?us-ascii?Q?W5qetq+4zE9HNIsU5/QzQg18QuxEohT/wNYvv34Gehz7/0paDiIWBptLnwC5?=
 =?us-ascii?Q?MBzy8czCtnHzAyeW0KucR+lEsRoojFOGUboKUOMNXCIvPFP56wzhpB/hS5UM?=
 =?us-ascii?Q?CZ7jYXeK9W4+f3H+hhAcbANrCVTVa5yvC70Cn+8wAUOOdUFZVrF/cfL1j+Rg?=
 =?us-ascii?Q?Oa2D5KiLOElhY5Wtk0aQ5ajJb3qTNvUnTArvDCzutEuH/nzAwUwCjCXp7ESs?=
 =?us-ascii?Q?D1BSM5C3dsAggG748jzYCXIWUV1yd+qvp6AlKaCreeB6mP8LnYXdGuP/CKy3?=
 =?us-ascii?Q?m58+yQlGcW567c7rLGbPPRYVrKMTfu15HRa4I2cJAtk8mOI8GSOUtUwydv1j?=
 =?us-ascii?Q?Awz4rpbvKfCjZdetSRwvOTx6MN+tuu+fx5/lIlR/3flsTGQJTd20UKU/rUB7?=
 =?us-ascii?Q?0GoU4O5om6ayO+SMX7UeuvVtMfRkI4yEyolIZLAlfD6tFzp31TEHlSPrqQME?=
 =?us-ascii?Q?dvOmTc0sD8lujdtNhqWASQCiTHNGy1CZGNMexzCQEAfJEHfSjr5KSpcusiSI?=
 =?us-ascii?Q?ryBXWGKkQkzHjdJVHkNjV1HSDbnTNUWuksJ7L4r9zketdtFR5zrpeXBU7Vix?=
 =?us-ascii?Q?rgZ9jL2Uv0TnwHvZgEu2qTh6H4v5THjdpkc6Gr0Vqiim2zLzhAccBMI9vPOr?=
 =?us-ascii?Q?vgpbnY6pt+bU7P9/UVRZ0Biip5VNtkVTyTEaHTD0MFwxOg576YTjnQWnudbD?=
 =?us-ascii?Q?aP5dKlOG7xA2qlP/6ZEoroU2OG6K/jsuJHy1hZUoEcSYGgIJ3exTmqQJ0TmW?=
 =?us-ascii?Q?eQ/9cj1xf7j0DC2blEvzN0CWy0xCDnU/5kDLtYfXrXkFjpHHBmR4upI8OvcN?=
 =?us-ascii?Q?L2QIer2oDDMC7nZPyvb+T41TYlrhjb0n2zhjVF82pVCJP7gQUKVAlgezu2Ly?=
 =?us-ascii?Q?xmsvbxJrZlsQ925IYCtLPw700xvJTSQK1XjnLiLRzTjXsC7oHRLakTsl2BkP?=
 =?us-ascii?Q?CtjEOo1aRab8abKapzibpLgk/i5tIYbBm6VQ/5zdLaYE/WNXbDIrN0O2RnLE?=
 =?us-ascii?Q?TKrJgekYQZ2z5eThhOe6fG09QfPMOBx08o8PhJLhOaqvR+1+GWxwiu+7vLbx?=
 =?us-ascii?Q?zR+V4rkum8YoeG0JuuxS8w3ox6Ts3WqRaWlupeo9z6nj1IbyDpRRmhIL6B48?=
 =?us-ascii?Q?krw+Zf3mBdsFP4DCXgMaLHzX?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5d320339-f4c5-4d38-b19f-08d98a301389
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 07:48:54.1774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 EjeRoS2Yj6ia/jmYoSfDTnrBRv5d/pKdX6bLQ3t+51pvj+E0wUxJMb/4oSQwJbTgWTHwZPYYNgmnj1mENeyMyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 07:49:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156765

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 scripts/lib/recipetool/create.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index 87b25ebc7e..a8c4cdef4a 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1128,6 +1128,9 @@ def guess_license(srctree, d):
             license, crunched_md5, lictext =3D crunch_license(licfile)
             if lictext and not license:
                 license =3D 'Unknown'
+                logger.info("Please add the following line for '%s' to a '=
lib/recipetool/licenses.csv' " \
+                    "and replace `Unknown` with the license:\n" \
+                    "%s,Unknown" % (os.path.relpath(licfile, srctree), md5=
value))
         if license:
             licenses.append((license, os.path.relpath(licfile, srctree), m=
d5value))
=20
--=20
2.20.1


