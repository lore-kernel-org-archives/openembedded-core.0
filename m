Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E272C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 18:13:12 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.43])
 by mx.groups.io with SMTP id smtpd.web10.37911.1644862385167473379
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 10:13:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=43riZdYH;
 spf=pass (domain: weidmueller.com, ip: 40.107.2.43,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ur6BJUye01hwLU67dPIBDMFiKOaauzod6I1HDIglISGkh4hiGAs4e0m0rV/YV2i6oadEcPoHHvBUdRFGOhxZAu14sEmpvym52p1kCPldlimU9KcKXrbi8Abcw44s2DMhuGQaOH6rpJE0e6MrFWPPpS7oJdw+xcmFsanss6ZCcJOcPIlXkv+6+pgrK3dYOICXVw0W0f/QXlH8diPo5BhTzsTDV9M6TC5cTYqnogg72SVkMnHqLedmtWUV6P5G1lGYU23bN1tc0qmZdu1LDWhKyAD8fTBX1KVrWbMD7iwNPFFDlZ//huNnnKunFJqvlVul6koYS6a8JnWAQ5d7l4XRaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9rxBzd+VfEGAbo6ymefkJZbUJY/YA3dLyrhDG2qqZg=;
 b=VSTFCJH6HSbdVXeWM0JztylZeIty5pVqsRYWGWZ+wUqMe8fPrqd36SGJQ3X+RVeCH7HBbR3VmCwy85CMiZHWuuev3SrgqtpBxABF2k4nFlyjAtV9Lhd+QDTjSU7eGDyjxNtMDbOgidtvr1zJi/902Aj+WECQ+ZobkcqmEwHk2sfw+kN2xymvi8Ibc/fAgLTM9OJIs2ZrYScRcfkiJBjVnAb4G/uIJdnpTU4MDX88EoLkXFbrTb5X9ki7tzjkzo3XX0b46rzN8mqsQd094i4tvfaB0pG2EZhPZxCIpmBfuIub4ZKMozTf9hCrD2Yh0892iLjbIGg8MyVZvOeCl2aS1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q9rxBzd+VfEGAbo6ymefkJZbUJY/YA3dLyrhDG2qqZg=;
 b=43riZdYHZZ5QdsSiXnNQAVW2Evh7GzYI5rrD3idPXeOuUFz7ZI3JmYkK5WBbagyznEyV/9C+ZDVLkaaSw4xIbZDnUVtDOyrftK7K4L8lyiJBs2Nv+olgGKN3cv/JHufaC7p0jfxgvC3EJJOcogk5ySGMDlsAraEzD36mkV4DSmk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by DB6PR0802MB2181.eurprd08.prod.outlook.com (2603:10a6:4:82::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 18:13:01 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 18:13:01 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v3 3/4] selftest: wic: Remove requirement of syslinux from
 test_rawcopy_plugin
Date: Mon, 14 Feb 2022 19:12:36 +0100
Message-ID: 
 <20220214181237.10308-3-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20220214181237.10308-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20220214181237.10308-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0256.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::7) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2851285-4f70-4b2d-5d8a-08d9efe5a30a
X-MS-TrafficTypeDiagnostic: DB6PR0802MB2181:EE_
X-Microsoft-Antispam-PRVS: 
	<DB6PR0802MB2181C058D6B254C564E78357D7339@DB6PR0802MB2181.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:211;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QLwmLjpVXa7uwV3M43kF5ME+8E7wN8omd9o30DzjWecH7MXC1j3x291lAnMzSHswrgZIXkQPEMgLTxwLo4M7LWIfMO63BiECLUsP8UOIpwrofUEdW3DE/+O4DfV2z5+G7z4to+4wpDAKA76tuUmQ2iXYEicbM2e1LzFzb6mu5NRctTGtEbKNFeSM/vwE4eF92Q9Bsj92NdsSg8K9zy5sPef3tpSeyEpbvhUe1+gwW2H8jSvYizLxzrVZCLPNguGeMr9S75Gjlfu/wlmYmAmyfxw6BeC1RKmCvLAXs9HSm++wxBG1V3nfuX+a7cFrPk5PPevY648xhdC+IBhq1a4zSa7EBckxTMeVJBA4AmbSFoS8P1gh3IUBpVqzITY1IYtX4o5zUcQ8j10duNEHQrrsUqX9s3HQYBcf8jMGfCVPrfMrrWcUq6zF7nT35t1qN+KDEgcIJ/NweQ2eys+qe9rMpmfEyZzK3fzrPkWcF1clJVtS0n2bBvXl5cCoNHnD0Yg1INOxH/FBUmavsTtY0vo42apsVCi2b20rd0n5cjyHAPeHcxqbSCfPJ0jenCVX7G0q/CNH4ZjKmTk39UY7X9tS9Sd/d5WgXxxDGJ904BS1kWiYdGI1zCd0xWzS+akWRTA5rgpbXT61Y+gNG8x/XSMkdDZeklGxWUIkpaTmRvKy7hMwyNJiVlI7dvEZMNDi4k4FK0Zgc3S5qi42wdXQtEIUdg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(8936002)(6506007)(4326008)(66946007)(107886003)(52116002)(66476007)(508600001)(6666004)(66556008)(6512007)(8676002)(6916009)(86362001)(316002)(2906002)(38100700002)(186003)(5660300002)(2616005)(83380400001)(26005)(1076003)(36756003)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+gU0R+rZGhZJUJcHw1xFNKo2nRgnYlCruyZ2tBLcpBaTER+6gLWrp1G/FJ0y?=
 =?us-ascii?Q?HTNlSYVnkZLexgDOIl2LnwO1fPj45mtStG0OL1Ef5lIvPn3Ayg881w4YROVb?=
 =?us-ascii?Q?zOSPOMA5NSVeRJMu633N0zPO/E91BfITwFG3YVUdFqJ3GV56FzhRP17zqYP1?=
 =?us-ascii?Q?B8J07L8yn2fit4XQSm6cwz+QC4v60HK+5Xt0SeF2aPEu7nbmDnlbqfv42omD?=
 =?us-ascii?Q?VY0Kr10DQiN+VfxToT7a0XOAb2lR4OWLuA7oRiA+w8gRNB+CydlurP0D8n7X?=
 =?us-ascii?Q?mviiluxvPLWe6+8PMmkhfd0PJZWJitwKZftTUgekyJW64FdD+5plAgvxCh1S?=
 =?us-ascii?Q?SO0c2KCoNsuG0IoQ1D9hnisPV9UWmUczd9DpC+Epfc4fConBSr7KSuhcCdkp?=
 =?us-ascii?Q?zdvFnX18x/NzQHAI3P/3D0FOWHYCywOHBLyMBA7HxuvvVcaqnQb56HIK2WhT?=
 =?us-ascii?Q?Bd6row12/V9vv+qGGwaFaEHxT2j+Zs3q4w12ewPYWFw9EWSa135Nl4PgWnnu?=
 =?us-ascii?Q?EcYLGBWSNL/WOHdibO0eWcZ+8N9chGM3QtWc6cWF4I5rQL/8+kxGJShWnPkp?=
 =?us-ascii?Q?q67bssJBCvfeE67UdocfyuRGE1wn5K7nDJdJlguWucwTl1j3NJ0Kx1qV8dvO?=
 =?us-ascii?Q?vD196Gk4QApyhgdXDU98te3U54shdkddgMm0VDty28hbr3DoI7FyWOkjCoH4?=
 =?us-ascii?Q?VCRH29UyCACNAKYicFGyQwgLVa0vqesG3v833efvCt/dlrDtAQJ0IDnfV0V1?=
 =?us-ascii?Q?AfC7b3AGRmTjhW5gbgxUkdOEpGdcommrob+yYRc+LkuVuNTXthjVLfws7hd0?=
 =?us-ascii?Q?n952f1cdjviZtZdIZzzBime4+xIJHfkPNpr8Gpl6kJYVUUya3Kl4Ena0q1pz?=
 =?us-ascii?Q?G3U0kQDZ4tBB1A7Kwy5OuS31rQpVOWbfEGacomOHoNpFo6VIsR8bwOhAJw6F?=
 =?us-ascii?Q?nHdlqxeqOF2B0uQOaXAdVgTHyLimn2h2VgnvdAbSwiqcsclpizvGDkbDVHDy?=
 =?us-ascii?Q?7OzMdX9UzKf7Q7XeghkDBD7gilgLqtMgFU09Qqw0dQLB8qLqvTvY2DPqUz98?=
 =?us-ascii?Q?zbJnmeMOiPR9iYSfwCh5LpiZzfqG7ThxjuTNI7ba6VJrtW2bxJP3EG4remTC?=
 =?us-ascii?Q?kWmzB90RpmzJvRuDm3Xs5w/fxBu+BeBnD+fxPHgLPhWEMe0F9v8e4woyP4bE?=
 =?us-ascii?Q?M2UhsIKfC9VgpJLTQreS5ffn1gF59mqLGiJWSL+sHBSrJ/9qwXjLKG9P7Ufs?=
 =?us-ascii?Q?5zkwRl+SqRvHZm+0P18md8DpXUSZPMq9/KJ18V0QZgMmnRT5rBtop1UYUkRR?=
 =?us-ascii?Q?ir2fpTRqsSrVM811xQfhvuMXR7xn22cZX9dDuH8jGOAJiRLFEz9Nx2oycqC2?=
 =?us-ascii?Q?iaPkRf8x02bJeBeEguJ8yNy0cq25tkV7QDs1LNdth/cYX6ij5HQ/hXA0fSjg?=
 =?us-ascii?Q?zh1DRrHfO0Ylp/CILNd5ptKfjeM3Ym1Pm/6h3w3g4cl/kRO8wbrD6tili3pO?=
 =?us-ascii?Q?hmr/qViEbu5YPtnPD0e/GTvh+Gz/nb7Baea/sTDZsYtZoUPi4OarqZH/YKGE?=
 =?us-ascii?Q?7oW2bWN8aGzywjwvOOfgjKKPbS59bfYYVmxGtz08wkLY18MHxCvYXw4YbWSI?=
 =?us-ascii?Q?kfIeQ1dXLPnaD1hbai9BWIY=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f2851285-4f70-4b2d-5d8a-08d9efe5a30a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 18:13:01.2488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 l/nB7ZmIgKl6SggxrKPFUpTHuV01vHMdBEJP2HncLKubYUuH7e1NoUN16Z0KIXpd5Zco28+A4E+urpPdUyO5yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2181
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 18:13:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161731

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Remove bootimg-pcbios from wks to eliminate requirement of syslinux from
test_rawcopy_plugin to avoid the following error.

ERROR: Couldn't find correct bootimg_dir, exiting

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 meta/lib/oeqa/selftest/cases/wic.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/c=
ases/wic.py
index 5fc8e65142..96b3e1b6a5 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1070,10 +1070,8 @@ class Wic2(WicTestCase):
         img =3D 'core-image-minimal'
         machine =3D get_bb_var('MACHINE', img)
         with NamedTemporaryFile("w", suffix=3D".wks") as wks:
-            wks.writelines(['part /boot --active --source bootimg-pcbios\n=
',
-                            'part / --source rawcopy --sourceparams=3D"fil=
e=3D%s-%s.ext4" --use-uuid\n'\
-                             % (img, machine),
-                            'bootloader --timeout=3D0 --append=3D"console=
=3DttyS0,115200n8"\n'])
+            wks.write('part / --source rawcopy --sourceparams=3D"file=3D%s=
-%s.ext4"\n'\
+                      % (img, machine))
             wks.flush()
             cmd =3D "wic create %s -e %s -o %s" % (wks.name, img, self.res=
ultdir)
             runCmd(cmd)
--=20
2.30.2


