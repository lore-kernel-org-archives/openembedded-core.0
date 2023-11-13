Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1380C41535
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 13:58:09 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.49])
 by mx.groups.io with SMTP id smtpd.web10.37139.1699883879028211034
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Nov 2023 05:58:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=4Wssf5Uv;
 spf=pass (domain: weidmueller.com, ip: 40.107.14.49, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UvS2Pb1GCbj545jwZ/VQ3hGK5qAdNcT/lsp/SgZhghziY9TZbXGit+PtLOjdXUQK2I+Iz6oP4WAXTq0F04Zfqow6YW+kLQg/bmhSECqRn1RYG6vO8yzPGQlwUHz2d6jMH6y/0xS0hWkzDwjbdFNgejqRC7shSXBvS93INYMAM8FWgG2HXQSWmQ/qu/ZU1YwlfUs5s3TwqcIQ+68UuLlFw6v+hR+eeimiAoEJelS9dimjNcxm3Sxbt/vUvNT8DRFfEkEPEwNOduZ5atU1pAh1jtKAjM7j3BkP51SuhM+PJwlrjASBy0la7EmsZqhPTWenWEUOffekxziaFVPnGNJQ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2AJxhzLaXYaAlFnc7kzEYCGTMO0h/neppMo9L1u9t8=;
 b=XwJRVwBY6gVhh2XW4XAXggWy/XTEqXvL1DGBfUB8PAfIoYHbpUY1iN5GE0ucTDxlfGPTnzft9yYVdF8YPn4Z/rac2i2eN0ptV8c7dE2ULRcAR2t3uNkUT+8QD9uGAqSb+g6pv2C8QyiSfDb1kDV6E60ZTs/N/hxzXJoqqVYn+otSlQLHZisL8XWLLzZmuplyOCr+GFjO0vAAAWNIJ0h/SWiigKK1uw9+PKCUwQC0V+K99gFIBDtB/qAdqxplW5/p61DXb4Ajp6gbWImYgyvcp5S5IHPuHjwsC6AIa2lhBgJ1Vtl0hqClgWQ0dkgeZzZWI51vTj0cmUrVyvdoiS+ipw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2AJxhzLaXYaAlFnc7kzEYCGTMO0h/neppMo9L1u9t8=;
 b=4Wssf5UvrJFT3D1k1h22qevJZviyQx3KDXUBe2xjZIOwkTXcSzDZmBocOQ5XRw8SyppWRjdBF8rhEJf1zKdQsjucE1NFkahpPUdiWuCATzDAYH05ipIBndkO5SYJkM1zMtSlJLxGIyGCvjQPSE98BAbnGcTDlzpdrgdsPdaFi0k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by DU2PR08MB10040.eurprd08.prod.outlook.com (2603:10a6:10:49f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.28; Mon, 13 Nov
 2023 13:57:55 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 13:57:55 +0000
From: lukas.funke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [OE-Core][PATCH 1/2] patch: extract patches without diffstats
Date: Mon, 13 Nov 2023 14:57:45 +0100
Message-ID: <20231113135746.1047416-2-lukas.funke-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231113135746.1047416-1-lukas.funke-oss@weidmueller.com>
References: <20231113135746.1047416-1-lukas.funke-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::19) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|DU2PR08MB10040:EE_
X-MS-Office365-Filtering-Correlation-Id: ba812a61-7cc9-4d18-1ece-08dbe45088fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BOmBzGnguUKqqNfzmyM2BZ9lll30ZQia5OfSmJaZ5Ev7Esb8wKD6CBw4213wuLSOV4VvkFRd9inIhaRBGkUU+/acBaoBui9922xEb/PkOuwabi2feITNBQJEAYhDUpRY7IbsUd/znTbr/XBG+G3YBtZxFU278rspPnC9z1+xOMXETRYvRpRSVgdpxBEv3qEvMEa+Lg/8+0rTfkWbB5l0LJVjkTkNNJGz4rb8qidlAcClj3sINCgq/lzGzlmZc5APTfV4DcOj9F7gt4mWkFfi9En43U+RRVuKuxv9E9KpcjDHAjQKxKmJRdnnyj2KCKOrWKVfPHdVNQyJBAyI6oBGzOMkkr6oA7tFYIcJ+eY7hv1KSYv+QJIg+utYldlQfgUGgipoERUVCGrq5rRUCnfyyuUS/HgorXzRvE/IVWCG9frdpNWkAKNEktpKG+y/KDEjNxij+bcQNY2gcWL6bSXIiTp1s7KmDBVr8kw2Yh5crNP2ZkivHfpr7BXai0287Ctu5J6V9Vpdezjw+ojhkI/lzIBevRyVwiplUeHEFdtl4S8VkY8FnhFMUJHU3KF7HwP8UELLBSWwMtq9ux5KzCjDsRDNDAy86Ocbb+/v5OkiwKwj964VLd8VS8ioGrubl/U2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(39850400004)(346002)(376002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(316002)(26005)(107886003)(1076003)(6506007)(52116002)(6666004)(2616005)(6512007)(9686003)(83380400001)(4326008)(8936002)(8676002)(5660300002)(4744005)(2906002)(41300700001)(6486002)(478600001)(6916009)(66476007)(66946007)(66556008)(36756003)(86362001)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j7ezbeJKbU+2gT0chzCLoQN3XEFryb4JWduPsXE8wNDPqvUosGagvXEywoAY?=
 =?us-ascii?Q?Y4yWWgfd+I2/BWQ4zAypbqUcZ6h8VmnpPw4vQuT1CxW1JouDI6qUgu/WK6xs?=
 =?us-ascii?Q?BJIjeO75f1K9EJ840MYBN2mAJlJEDrd6AlPm8PBmkVkMJ4F210CfM1TlN/Bv?=
 =?us-ascii?Q?mpcCzBfVp4WLr/+TxZS14uE9UX/yxn+ARHdbeWglSHNwhr00qumyGbM1bA1m?=
 =?us-ascii?Q?jJ4InTOviLsqaA+f2aQtaDCtdncttv4HqUDhcP9bof4Si9/B82XNyTSd7y+e?=
 =?us-ascii?Q?MpW1miZk2FfNzjZKxPyUhTeygaXZOhhEToXXX65fyQoPEK8Vj/sKQuRj//9H?=
 =?us-ascii?Q?f7vtOefljCYM+CetFDCmT4oAOoW/k6z767l5C9L+rGRIH/5uQOTPhL7aZB3u?=
 =?us-ascii?Q?pJ2p6AEuw11Bo1/nGkVoFoqMj/y5agscJGq8orwp3wMqmbT5VeTHmxNZRG6D?=
 =?us-ascii?Q?GYyH9E2GLrVnXAqSLucImZEu/16oqHWQJimxU5eBaZByB/D+mtFRY+tu2UW9?=
 =?us-ascii?Q?yZ3NpaoUrEQ/ejR7xIZKpi9hJWkQCcAyLEN8kem2QeRezMsxLs2sRykSmQDr?=
 =?us-ascii?Q?y1qzh0AW2zPT48wxqLEgcjIFa4ewhzZbTEPBVgtO6RvfsllH2Mh0sz8XXg6J?=
 =?us-ascii?Q?WNkQ8tMLZmbwijXURXlunaewZp30btinB41bQuLh2tZxtoL7g0gseUW9s/9t?=
 =?us-ascii?Q?lAA+gCR4REHDBBHfh8l6KItQngqojsJN5UMAd6KjolwujOiY/1J+JKwWa/Dt?=
 =?us-ascii?Q?/i7jHfBgCu6H9qlOfvFODMHGTyteJcG9vuJBQMcYq0vA/uK/BiXTu8IDM1Ty?=
 =?us-ascii?Q?re5nuQQq4JSoVr7WW/vRsdh+zkkp1UGv3J9GDxdOrdnaQx1QeHrf7ORltktQ?=
 =?us-ascii?Q?liCudwKr8/VmQp2ebZPKHA8ecDcSrERjgnNt6VSGIP9wLdgPHUqzM1SfTeP6?=
 =?us-ascii?Q?tcR0St/Lr09FcS85/oPpUxpy9aHIMPDxk7azo2r11jlMt7FNVGoX0JdfxMzB?=
 =?us-ascii?Q?diY4Zb7s7v4eJDcCu34g+o3p8N8RgkS5bqxNjPt7GE2Cglkv8YCisfOGhtXP?=
 =?us-ascii?Q?pc9+VNvR/RJ4E91zjKT1/UfLwuf9VgaoULyBk3VxJv0yTxm6+OnR/A97tGVZ?=
 =?us-ascii?Q?CmA/7rG2oQoCe0oiwFU0Y/W+CgCgU796RZekkC2yTVmzD3lqaguRiOlS1yPU?=
 =?us-ascii?Q?1TF/6s2/bX5Msft2WBDIrWYyHzV9G+lAJENNU1uU+vGZ95k/g7cqNb+ejeN3?=
 =?us-ascii?Q?joM4INyiLyRrV4yr6jZC7MnvdySfFQcrED682Gnm8EvwQlvXs46r273LlJW3?=
 =?us-ascii?Q?fZdwxiX/KvFvu9+YEAaTrGmraiUw9VLNQr5GzL7s9HzowhlDrJX7OyR5WRfP?=
 =?us-ascii?Q?gVcEUvSb9/oppkDWIvJw1o9r/VVNoFu1yuLMHtgOlRPEbvebz4upmh00Wbpn?=
 =?us-ascii?Q?IB8T7YIqZyMxinGy6bv/vdtAtQfYkksdduaGh39OOR6Oe0w0JsgdwtnQBh4p?=
 =?us-ascii?Q?hazOmtG5Uv0pyA0Yt3iV0wcHjLR+F+7/SuQfx3ENW7BOkj+dtfR/mU70bEwk?=
 =?us-ascii?Q?ZYp3YZP7QMt12kRxIpQUm8R7fWzL1k0P/LKdk+H7mESdVeixHIPF5OitOKXX?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba812a61-7cc9-4d18-1ece-08dbe45088fd
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 13:57:55.0790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0OU3ki3Fzc36AD7ay3lFWT+Q6Ivj0B+k172oj+cmmORq2I91LVo62pSbFK3g24BhtF7IrerEIvllnWZ1vIU1/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 13:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190471

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Extract patches without diffstats to reduce changes during patch
refresh.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---
 meta/lib/oe/patch.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 4ec9caed45..71cd193afb 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -464,7 +464,8 @@ class GitApplyTree(PatchTree):
         import shutil
         tempdir =3D tempfile.mkdtemp(prefix=3D'oepatch')
         try:
-            shellcmd =3D ["git", "format-patch", "--no-signature", "--no-n=
umbered", startcommit, "-o", tempdir]
+            shellcmd =3D ["git", "format-patch", "--no-signature", "--no-n=
umbered",
+                        "--no-stat", startcommit, "-o", tempdir]
             if paths:
                 shellcmd.append('--')
                 shellcmd.extend(paths)
--=20
2.30.2


