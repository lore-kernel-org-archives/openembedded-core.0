Return-Path: <christian.taedcke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB4EE77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 15:30:43 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.106])
 by mx.groups.io with SMTP id smtpd.web10.154319.1734708632698321741
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Dec 2024 07:30:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=hGmxUqfv;
 spf=pass (domain: weidmueller.com, ip: 40.107.20.106, mailfrom: christian.taedcke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nnZmNvDHb3XKezFsWg/pI/Y30hZlMYfCRvilyLTDv07bb2tWmKtAEFne9LNkfvEzypwazbUZthvQfiphzMyWdbGD6BNNFREf+FubYwKry60qsgDLMTUBigU/RkmVuh1nhaa7QuSVVnUhsJH4eIZpdiGuWg1ecDMnJuWT5nyNcrksVkyvIa/O6nJkg+1D3YCTScQicJrssDb5VQs4I5t9yLbLufjZYHfgSM9Lg6taDP5xLAZLNKnaUT5iEtqXgv+lPu047CzLqzy0ZL0qPnFDxMBiMrHnc5myXK1vH1G/ElYGYvcSCLpuq0BbwXy4DH1wBkXN1F0ZfAis0ydmk9rt9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnhBwwQH0S7wF6r3eDDg/Wi6xUmNUSbFAYJkAz1/vEY=;
 b=Yji80lVu5l9JODpbrLwoVdlnpootg5jCnh0zpbCMcwyO0ysCwA28fmXJeYkZUi+ZA7uxBC1lkvQbXyNgCRkdpR2oyTqGYQx72gvp5qO6TrDhxX13NkIb2gDPyAiAnggcp4mQequ+zkVvSvv2ypSHsnbpLAPJs13z2vlpLzuN5mj0DyTh//8fAdV3MU9DR3QbBy82xWV5dZH4baxkcgdbxUAUem+wOpcksPjh3gGDPuVq4M9xQfaR3mQe2wAW+2QaGAQ27wbHp8dofsvabIMwXgRoe22bw9jFexChWu4jPUkgVL11IK+6I2Um5SNjQYyTYcxxIrOv4/GRNyX4OOZVMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnhBwwQH0S7wF6r3eDDg/Wi6xUmNUSbFAYJkAz1/vEY=;
 b=hGmxUqfvvg/O0niVMCCfLu2TEn8DcgoRvUGav6jK9tRUzafwgDQ90sre+/LnUrtIQLrsbqrzO3tWlCjqHaWXKxO2uOivWJBOAbl5fX+ZCJymLw8zd/lvCoDcr5+vgqwH20HMTLLK+RrE73KfRpVhtjqlzyhtgco8zHNI+dsbxDZu1KLkxD5RCvEiyaygeMVWp94mojqxRCeS1sT2zPGX59wnCo6iTBSahnITideA1+CIig+hhMUMytD3V5SYrhq3RZX+oG9/rX+a1x2Ri6JG7fE83oQtLLWT+oXniQrrLJ/V34WfDylfAVK8kkbChwLvoqUDrDPl9CSrv2lfzI1HWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB9199.eurprd08.prod.outlook.com (2603:10a6:20b:578::22)
 by PA6PR08MB10765.eurprd08.prod.outlook.com (2603:10a6:102:3c8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 15:30:29 +0000
Received: from AS2PR08MB9199.eurprd08.prod.outlook.com
 ([fe80::7254:707b:b5d3:ef15]) by AS2PR08MB9199.eurprd08.prod.outlook.com
 ([fe80::7254:707b:b5d3:ef15%7]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 15:30:29 +0000
From: christian.taedcke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: bruce.ashfield@gmail.com,
	Christian Taedcke <christian.taedcke@weidmueller.com>
Subject: [OE-core][PATCH v2] kernel-yocto: enable fetching kernel metadata using file fetcher
Date: Fri, 20 Dec 2024 16:30:04 +0100
Message-ID: <20241220153004.2199488-1-christian.taedcke-oss@weidmueller.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::11) To AS2PR08MB9199.eurprd08.prod.outlook.com
 (2603:10a6:20b:578::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB9199:EE_|PA6PR08MB10765:EE_
X-MS-Office365-Filtering-Correlation-Id: d32e6f6d-3cc5-4c7b-9baa-08dd210b3c17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?no65FIfpPW0HQHgBXlJdQBqbqy3w6Tlyi5gQDpd/81tyLyboyyGZgYH70pVs?=
 =?us-ascii?Q?sflRhSow6y1KhohXOE4ByfSOxw9GhPGMgWRbkF1aqWXf2gKCmxfALVnr+tXM?=
 =?us-ascii?Q?SsdrI+5qcA8xycjX9ImxFdcTPkCMqcOsxzLxMSvd/+o6tKIHFZzKd/x0pAbv?=
 =?us-ascii?Q?I4KVv0X/D2yOlzPVipd7ydeFgR1ao8ayZiBEcrtu8m+FvMG4xe+C3JLwb7h4?=
 =?us-ascii?Q?DOq3U87LIecpH/UcR9XRZR3QBz/8PvI0mHZy8DN5wdDt2ttys148nx2/dvAC?=
 =?us-ascii?Q?u1viEEISsx1xmxGHHxo/2W3D4RNCg4Qrt8z9DQZ74hwVD10KQUMcpa0pX/FB?=
 =?us-ascii?Q?7AjQavbqhdp4KvLNRFoCKMw0cXmZXLxsk5siK9Ei8CUxNvBwP1pzOpmAQ58M?=
 =?us-ascii?Q?FAe/idteMJaM40s8EBcq7wopSw8uriKmmvcSWQmQXG5WdV4HZC2zKpuYswvm?=
 =?us-ascii?Q?qBgIIVewzAfe1FYV7wKNfQd5LBycCOxTbDLGS9nOFzd60TeJcdsCSgJm8850?=
 =?us-ascii?Q?759Amkwb9dQQxwU8dXU6Rlsv+z81Fy9/p80EvjbTyat8ElwfjPN8l7Ivm/4K?=
 =?us-ascii?Q?Y15Z+QkoIACRXQVdffoDAHJ4XusFd4Sfz43Fn7r3Bs2oXuk7we7ecBWCy51N?=
 =?us-ascii?Q?0HwYO/XJHKJek2T6zkddbP5Ue9A+wzsQPs0yOrzGsk40B3vM7oOTVdhlgleX?=
 =?us-ascii?Q?UxZgdTo1VaVZ86iJd+dao3qi9pQ3+J9BIzwV0ylrbPZIwHxng9AnO1Dcs4nZ?=
 =?us-ascii?Q?RTLiXxtWvMt7Ef1vQ0NYxUac5qdpBrYtg888m+Q1Axg0hxHVUef0/uH3Nu1U?=
 =?us-ascii?Q?5u6wXLWrzsagWFR/eiXGvhsDAIGMxf/OUJknFazqDEPRzv8bQ4NFgRy5/1jx?=
 =?us-ascii?Q?SFM9L5B0jb/JT7laPZx3984UMG0h/pwbDA+FcYqDDKOCpa4NsyijrJm3gq7K?=
 =?us-ascii?Q?Eu04arJ5iq1fzwwECJODJsSUOnXnuCTTHB482RqzcEP1e/HKb5NgECFTKteq?=
 =?us-ascii?Q?bhmbIcx2y5alYXyYY0oSwB1zY6YAb1LzfDHIse6K2nfHY18ykAjXzL+2xzCT?=
 =?us-ascii?Q?Agp9h5hkPPAE6h3qi4RinjKNGfUut8PDDGgj9zetOY9St+NCr6ryrVoslSKZ?=
 =?us-ascii?Q?5OTUteCcjvc6hAql4oS1y3PrbfsaH+/aSN6+849pQG6j0gPFyNvAvUTFlSGX?=
 =?us-ascii?Q?ST7N/cig5+wITdEGUzh/oKKJI8s+1icid9tQtxkkOqzjXIHrv1P/txR7T30w?=
 =?us-ascii?Q?yFGkUkLI6/zhPuAKNvOzWnn8FY357r/XVeluLRdOulIu8j9/gZg5Zx5nEkIJ?=
 =?us-ascii?Q?aMDiRymsTVBYkL4Du64T9A7ilCPFjHgyB8ZZ4VLdr2/x1dQQ3vS35TIAIj1i?=
 =?us-ascii?Q?hPMVDwbzxUuDvFSn80U4qK+xwPs3B5UaKYhuHwptJch2yQal8ebngvpFnj6C?=
 =?us-ascii?Q?woOokqAnNPHFkxrvx3h28sKJXdIO6v93?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB9199.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8kQg1js02SKVDlrChzZ131IRnSDG+vE2H3cG6FLwwzrYvAmhq8UJZypDA3S1?=
 =?us-ascii?Q?y/dRAXn+HhPy7anWbXX1CpZKqwZm+dWVfsGbP4UKjAQkLtKCCdguhkJrj/iW?=
 =?us-ascii?Q?9VqWd3dBiHAhxkkt1/hJb2NBMC7y2KFvKgd0T/7x+1pEQ3CIPM6U90UIiLzy?=
 =?us-ascii?Q?M+yu+NVzAJ/xIoSwQF0Y/JU4DMM/TKwj9OohIFV6ZeKhcR1v+93k5lybR/Xz?=
 =?us-ascii?Q?xG6Gs9WBvuC6mIpxjCA41izHCOmdKj25H9/kt3MbB/ooadpUh49lKOcLgm0q?=
 =?us-ascii?Q?zD/P0fMJs1Mj2EYbKJzo7l2K78zowcf2AqwZnE6Cx+GcrU7gyD6xbssjrWXr?=
 =?us-ascii?Q?XML4tck/S8cpgBCvBzmDp52Ty7wGbxqc7q3LJCCrvbZ3GMbesMmHjIbC+Ief?=
 =?us-ascii?Q?vKvwqyGiEilKVOfgdKjF6gaOemtkRfcX5dLEQ4s45nVZXuZGvohRp7I9/Ymt?=
 =?us-ascii?Q?Ud7uoE3cN/KeKTBqG3CGv8JguFcAvwDI1vstsbkIejFfM6MhOeTqu0ngFiil?=
 =?us-ascii?Q?nbtkrdhgpBzZJNDQiggR3W7YEyyrCxt7ZPSnoLSJIhYAr4cqT8AXO7Sjn002?=
 =?us-ascii?Q?q0t45aEGi4LAtAIKqy+SEf/1xCqBRaE+qvBJ+5JBW3ixF6T4AvrSv58AIcAE?=
 =?us-ascii?Q?sauYtoycZ/muhZOxreiiDNdn4TbX59bPkYagmRXQiJ4nBbo57wWBHhEcllEb?=
 =?us-ascii?Q?OTU1JNoaPPWAGcpVzwOdJguCgCvfe2sJ0m9SXNt6fCTJq1VkWwXfqlBmOrJv?=
 =?us-ascii?Q?2cpiLzVgKz85OzMpinlUdjFx8ipmQr3DCJhhtxhkThjpPADdu4mlAG/p9R8T?=
 =?us-ascii?Q?ILDGSr+t7f6jGG2a8DWkGZ89a9iomYyQh8SN6HqlkmfMVAvtFGovrwlKVwsq?=
 =?us-ascii?Q?QKj8mm25yuvrKOl7i9l04DwpU8UMgJA8kDCVjjOy4oWk9YD+PM+6JyxuPy+F?=
 =?us-ascii?Q?P84/0dgjQyW9xUbawsVUYK1s0m9nNa3xT79P0vPRFZ61HFjGS8ZqNpYelNPy?=
 =?us-ascii?Q?6TJCC3giy9Bh+ODmls9gGH0kj9Gegnj95yCR8f0qZoqkiap5LY1js3vwZQ0g?=
 =?us-ascii?Q?Ux0iE8ZhpqkHnHEKTlZV8c4qQPCIZ2K9+wmGI6dqCEeK/q4aStrZ3G+AIcfK?=
 =?us-ascii?Q?ns7QZehRqLhq7NGz+tbKR20VGJqujWUnM5Chz2SQ0udihQpWmRgE/QFZ7WIT?=
 =?us-ascii?Q?a70CF/HTEsdWA5kIoGvPGrypvkX73iAQmj2NbgZ7s7rjrmK8bMF+VlVn1Iha?=
 =?us-ascii?Q?EaA0gIoTWQf/FmWMRjhYWqO+Ioy8wjRgyQdFplG3GpMMXHYER/1sgjktiPzz?=
 =?us-ascii?Q?qb66vBf+tfzs7Ts5010Bcai3yC30q7BqDk5/IfNsaS3lOZLkazI+oOF6Nggt?=
 =?us-ascii?Q?xer+UGdTzqanVW6wQ4PMYL6pq7x4gOSjbzC1Lyrw2gFcGTTrc/n9lYZYRxcN?=
 =?us-ascii?Q?7anizByMk1DZSEgZz0XSeA5lU/+3RnRfkAAGeibKedJZamFjVAvKJUZBEGC+?=
 =?us-ascii?Q?ZkZmrzXZje9tfcynYVeLLrUPPQunoXM1eKhKnTlYqPSpAanxQG8eVc+162xt?=
 =?us-ascii?Q?dRI8gub1Rte0Pmx2U0qC4nRkjcvlxXDXD3vBIh01t7P/DjTG2Yv4SqNh034C?=
 =?us-ascii?Q?TeHJWYv8kLeu8zaZgd5L0rAk0LnMviJvjjMKDkogIhK+?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d32e6f6d-3cc5-4c7b-9baa-08dd210b3c17
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB9199.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 15:30:29.3915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rp1C8Gm0W+7YMibBNYzv/xZ+2pGWCWLVh4W1PPDED6taRaA+7A1Eyccv2IVWN1aYUB4MPbciT5kGELB3eM6tb/kVh9J4dNyK7zKQvAdruHwhvcWsHpLjHk11NDztD7fs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10765
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 15:30:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208982

From: Christian Taedcke <christian.taedcke@weidmueller.com>

If no destsuffix parameter is supplied and the file fetcher is used,
the folder name (i.e. basepath) is added to the kernel-meta search
directories.

Signed-off-by: Christian Taedcke <christian.taedcke@weidmueller.com>
---

Changes in v2:
- always use destsuffix if available
- do not restict fetcher type

 meta/classes-recipe/kernel-yocto.bbclass | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe=
/kernel-yocto.bbclass
index a5d89dc2c8..7d80e9aa52 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -62,8 +62,8 @@ def find_sccs(d):
=20
     return sources_list
=20
-# check the SRC_URI for "kmeta" type'd git repositories. Return the name o=
f
-# the repository as it will be found in UNPACKDIR
+# check the SRC_URI for "kmeta" type'd git repositories and directories. R=
eturn
+# the name of the repository or directory as it will be found in UNPACKDIR
 def find_kernel_feature_dirs(d):
     feature_dirs=3D[]
     fetch =3D bb.fetch2.Fetch([], d)
@@ -71,13 +71,16 @@ def find_kernel_feature_dirs(d):
         urldata =3D fetch.ud[url]
         parm =3D urldata.parm
         type=3D""
+        destdir =3D ""
         if "type" in parm:
             type =3D parm["type"]
         if "destsuffix" in parm:
             destdir =3D parm["destsuffix"]
-            if type =3D=3D "kmeta":
-                feature_dirs.append(destdir)
-	   =20
+        elif urldata.type =3D=3D "file":
+            destdir =3D urldata.basepath
+        if type =3D=3D "kmeta" and destdir:
+            feature_dirs.append(destdir)
+
     return feature_dirs
=20
 # find the master/machine source branch. In the same way that the fetcher =
proceses
--=20
2.34.1


