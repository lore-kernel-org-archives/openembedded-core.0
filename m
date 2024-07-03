Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB704C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 04:47:33 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.101])
 by mx.groups.io with SMTP id smtpd.web11.43883.1719982046892455604
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 21:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=Z3PEX2rJ;
 spf=pass (domain: outlook.com, ip: 40.92.91.101, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMAOSb6pWq9fJpqi/YFp7sIdFL3ikZ3ogO5FL6v66h+QiLqhR5NrzgQhlVRm2n+D5qAL7+pluXzAEi4JMZ9o5QiQQgSjr6waUuKX9/cdW5om5R3cT6bDvx36vL39Px+BkI8vQt+zAVh2T1ubJbnspCJR0MyR2TsantIn3C703nm9YWCe9rY0FDpWGvP6oBcumXXyWgI7KpdVafNyqgaQ8otehOvCeoY29OsmOvu0QccczWSbU5d6L7XsHYTpcSL+TXrqQXnGuBCXLxCvq/OexL45Kfvo5ExAS2yxoTW/RA8Mu0cFe3cfM0hugDVz2i6MZ3SyQYBcUHp5nKAIjrSN4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3F/3R/cgjB9QwOpEFtiBeXSrYP5m3jRPTg5zvKdkGE=;
 b=Cb2dXQxNZ45QMBzN62EYdsSlqpqQbcay/PDqY9Ai5zDTZSaozH72DOrTYBTzzIVzBD78Up1reF5nGUm8d93qadyW8NKrXdI21aFW8oa63Khp0bqA8WOQ2xBn1hXsuXmpB104HTEPJVRZPmEc7xBgtkkmBJa7jMFqAnny6mywSGcoe7GCRSmTtt4Mju7CFnz+AtOXJoHj2TsA0ISrPt9AVHA1dVrD/J5ILm5f8vJJRxl0y9tAHv3YVnXzHlV001x0RXyfyo5S3m3k3F6sCSnvMZMD3FiJn6dzjPvvnZFtCil0QS0tKI6GbC6Z3ZQP13dwRgqTFSwECGFkX8pV4OnLUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3F/3R/cgjB9QwOpEFtiBeXSrYP5m3jRPTg5zvKdkGE=;
 b=Z3PEX2rJXsLfW6E6xTLYcbPIywR0MJTyg6rkVODKrw68RiiyOJoCFyjg0CyxiQfZn2e+npPypIO122HwHWyDKb76Rt3ND1vok9fsT8mwXI4SfAt7Hh0rvySvo5PIsMKbvZfuvg/0ZtcHGEUgolLt3c2usoxMNgijsIX4cYQJ//kJ7Xrk/x2t7FDsRZ7i1WZjHX2iAPg0dzRa8C7H05DK4oTxF4YhldkbtfuChY+g+mcg4Q2shKqndMXnBJ1bfcRElHxDUIeDOYWi53xaXQCu6dxuDL3dUvpJAGZsTn4DOQdzx9GOOS1OMbZXpp/lGWfhkLAsXwW6kkCDuv4ljvOZ/g==
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com (2603:10a6:150:80::7)
 by PAXPR07MB7824.eurprd07.prod.outlook.com (2603:10a6:102:13a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Wed, 3 Jul
 2024 04:47:23 +0000
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a]) by GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a%4]) with mapi id 15.20.7741.017; Wed, 3 Jul 2024
 04:47:23 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] testexport: fallback for empty IMAGE_LINK_NAME
Date: Wed,  3 Jul 2024 04:47:10 +0000
Message-ID: <GV1PR07MB91207447D621EE3962C6802EA8DD2@GV1PR07MB9120.eurprd07.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [cl/Uhnnpzqr4/oBBgq49mEb7FrgM7PLtnXEJcWmaZLBaeIyzuo6FvT3zZgs24dqk]
X-ClientProxiedBy: ZR0P278CA0060.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::11) To GV1PR07MB9120.eurprd07.prod.outlook.com
 (2603:10a6:150:80::7)
X-Microsoft-Original-Message-ID: <20240703044710.13041-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR07MB9120:EE_|PAXPR07MB7824:EE_
X-MS-Office365-Filtering-Correlation-Id: 750e938a-2a35-4109-83a9-08dc9b1b3abc
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|461199028|8060799006|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: 
	wJs4+EPNFZkq2cKXVtu+iEVuL61OgYm3x7vlA+9f4wO67iTGl6klpcXZVa5ifBNiVFM5UlosStTwIqz+7bpPFOme3laE5xKaOU+FbhT4Nuv7eRj4+9GE1xEiiQo0KgxKmn0K6I1DIso81sSPVQlJBueeNR8P8OubMXXxmY+zxDono6Wf8fdYlOJPGdgjGQe7pBAp2Qi1DIfjzElBxT8yIoly1j3hEY1plPGvIwBcotQWEucgJM+npB/HfpRbI4u94ag2eqBRptUVSExWEpV1T4VxZ/4JZuI2PyZTmOB/GIukwN2s5wyIsr8y6ivxv2/po9emM+ylrGdFMhqxYsgpQGW1IKj2Ki+OhMT/UFlf4ezA/PZPuBcKHELWZ/MQoAOOxCKt/4X8PlGp8UGkqylNs8JndckRqOksOdv839ajvoL1jDtY7kWxRuN+dsHdQUxMOWpzUJk/q2MD6sjYCXIUh9byUiFUwnAkgA243oNNwzLJ0FnMfMmUqsv+HMjsL0I08/cqG9zYMEkEEyK3NpHckTOW9uiZrJcKzsQqdD8I1B4JdLmEjehfWGtTYRG2NcjAno6SQxkwc27DXy6x5rjlUXXK1hPvc3I2gPjrBA+uX7tpy5yuSUZVBrLdDaTaPn4/L2y/GcRSX91Zb6Izkw3Qkg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KxVpmEwefasyd+cASRwBTymCRnugvziNalF0VroM5ajliC6gciMK4RJvzrv/?=
 =?us-ascii?Q?mepeXXkqb2mBvgl/SJAohVqJEysAXhTvjne51GcoiqW+6IYLf4FJeW3tJOQQ?=
 =?us-ascii?Q?StukTLUSEvbdUaa/F/1b61bB87FauDFJA8UBHHzui+AQKcGi4g0R/zZg4L3M?=
 =?us-ascii?Q?GxK+CfqITBm/YEnoZpq+oRsPoqCwZvnjlvYCacmj1PVYPS1do33oQQqTo+nH?=
 =?us-ascii?Q?gGD5q8ynp4DvNz40RLgRqdUpHJiRfbjQemRMSXBi3bApzRaszkUdoAr99NCO?=
 =?us-ascii?Q?EGOMBL7Hnjf44/uQh71lY0csrg8eeAmfJaDpQ99t2RkG8Yta7WoRDoQL7uck?=
 =?us-ascii?Q?+Qxw4TsiMDgI7AtCQM2fxhUrQt/AEasUXhW0O46lYnYcc+C4Ix06ZtpcpjX+?=
 =?us-ascii?Q?9rHvJBlTSgIeSXYZx+2YuMtPbp34HANgYj5gat9KtMkQJqvGZDF0QV/JHY3J?=
 =?us-ascii?Q?hGM98FgqvDYFch3X5zZqx80qRqOTmyk3h9Y0a2xalfnj4uWhIJVNuXEWC5Ze?=
 =?us-ascii?Q?03XfVZ4cQKsbfXg+4TaDCyQPgALZcAPgVpKu5M8FHnl2AXTLHvFJCShFJZB9?=
 =?us-ascii?Q?NLj4FhGKuYDiCemnLfxbj9O4MRvJ/AUyeTucYGjyp9/xD7SjoPjZFKLTrBj0?=
 =?us-ascii?Q?6gb61Qu8/4NU/1J8/VS5qXXaD3nMbKgg8sbV5LfoblojKvFJSfabBeYBvuv9?=
 =?us-ascii?Q?G+isuaBPA3g/Swn/NyyBkh2sqbZ6d0CZsX7Aql3KL8VTHBoXaxbZ9DZSeEYB?=
 =?us-ascii?Q?imhS8uTuGJUv8ZAiP1LOQdZQUJtBIxZhgPt5CfpxZ0J/W78HHTGgTokVJgQt?=
 =?us-ascii?Q?CdC6tg7VPhya2734GOElaYLp9Kbr3aekNZpWSMfdhAq0+wjvLrYosw0HEi+N?=
 =?us-ascii?Q?YVoDZ0hMHQa2eLaRFmInEH1V/RS19zmDR2PBUjV6mQA8UbNeeqFLM8RDBxju?=
 =?us-ascii?Q?gNBLw8Jklt/At7hiA7FUBOMOTFq1pL7YELlk92blF8/sgSOwlzA62DzcMvhW?=
 =?us-ascii?Q?Jd2INwrP62xDp4fIN0bO3QZSSiKgWoaEtr+pKU8MClz2i25gjUS4Xsv0fEYD?=
 =?us-ascii?Q?aYf7P6LDG9YcEoq3Dz14/eAvUVadxeszVwQ1sb9U6b22EXIbRat4qprLGZi3?=
 =?us-ascii?Q?Z5dB5LCZ5v/IpSNXp0iXR0x3jqBhU6D13lEQ/a5OEjl6IkCGu5WyEchVqK1J?=
 =?us-ascii?Q?8XkoMtlChqI6rRpxGI4PwqWUB6unMdvL3cuI8DhBruPx6OyucyK9ozgx46RV?=
 =?us-ascii?Q?uWCzSbj95Y9qkEALIoBp5a2Tb5F4dyhSwN/psMSaHKgglS8VKwCcj/V1kWqb?=
 =?us-ascii?Q?XO4=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 750e938a-2a35-4109-83a9-08dc9b1b3abc
X-MS-Exchange-CrossTenant-AuthSource: GV1PR07MB9120.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 04:47:23.4631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB7824
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 04:47:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201451

if IMAGE_LINK_NAME is set empty to disable the symlinking
for image artifacts in deploy, testexport fails, as the path assembly
is incorrect.
In that case fallback to IMAGE_NAME

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes-recipe/testexport.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testexport.bbclass b/meta/classes-recipe/t=
estexport.bbclass
index 572f5d9e76..57f7f15885 100644
--- a/meta/classes-recipe/testexport.bbclass
+++ b/meta/classes-recipe/testexport.bbclass
@@ -50,7 +50,7 @@ def testexport_main(d):
     from oeqa.runtime.context import OERuntimeTestContextExecutor
=20
     image_name =3D ("%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'),
-                             d.getVar('IMAGE_LINK_NAME')))
+                             d.getVar('IMAGE_LINK_NAME') or d.getVar('IMAG=
E_NAME')))
=20
     tdname =3D "%s.testdata.json" % image_name
     td =3D json.load(open(tdname, "r"))
--=20
2.34.1


