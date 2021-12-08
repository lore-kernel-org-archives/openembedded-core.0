Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5CBC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 10:19:10 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.42])
 by mx.groups.io with SMTP id smtpd.web11.10317.1638958743676272816
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 02:19:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=h/FvQTfO;
 spf=pass (domain: weidmueller.com, ip: 40.107.0.42,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itPiqH317C5rc36brcTCMMKX3HsFZKKfb62IqL8LIG8urg9vYUcMGPNMIC8ordj7db0CvgpQ59HlQK3rhEVieXAiiNXvP9uIT7CzbICV4iXK45NIXY6qFnCvoS14cnD/KuW+pEY1WKnj4D0Z+qwqvvbqnPx95RUUjK2PhbOGaUQAPMtCJMNUKS4QWmrgVzbWsDTN5oZnD3q7ktjIz3i1zlfiKO3S5rBEym2lvzFhlHHiOpCjfPdtUsqjBQ3tlgZGmBzpDW99QlLSFi/zetmRdyk/26wpQElmo64D0fngTmGQAIxmUy1fe+X+A2c9Z4m3RCYXdY0h7F+4A6QE5aa8zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cr2it97yq9HcJvkZkH+eHzu02I2mWy9gcWO0mZ0oaYg=;
 b=oFiwK68tV+SRfLPUOk2ZNmc+JJq5imyiQUxnxVHJM4FX6u6WEdq2lBffle/x68wXAFol5yhHW0HlX9a4TUiqpyQScIO12mgUoAIQyTwQhuBrLCXCaNmYMLirQzd4yWIbv0R1rxRXRJTLgwan8JKSUCmKd3k8JF8d2XiqTrQVRkHB06HEtoZgG4Ic7GQLij4Jt1DJk42zxmV82a5FFwsPYBRuXk1uu6Hp/xjCGH30+V85bBkFrd5gL/xLj4XMLu4SQ6C+969L3RBbUB0ivfL9a6yiC/cbRolYz/YVfftTG3vQQ2Vb6iLqoNczcbNV8Da3APh9W14vXsB/DnQYaSxVzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cr2it97yq9HcJvkZkH+eHzu02I2mWy9gcWO0mZ0oaYg=;
 b=h/FvQTfOKxM6oRttuAfj7z+pghEwdI2pBoTvqbpSnCtIVoa8/5rQxLkewObVB4jVfL7ucUMIpLhrdss0lH46wfN9pc+Z8pA1l1vCnW+H9B1BDHNZPXWgflGLCn2H6GyKfW2YsOw9AeIwxK1ulNezFPKmicH0R/C8yHuL9+vzn7E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6526.eurprd08.prod.outlook.com (2603:10a6:102:df::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 8 Dec
 2021 10:19:01 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f:41c4:eb10:5010%8]) with mapi id 15.20.4734.024; Wed, 8 Dec 2021
 10:19:01 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH v2 3/5] selftest/recipetool: Split tests into separate test
 classes
Date: Wed,  8 Dec 2021 11:18:37 +0100
Message-ID: 
 <20211208101839.16224-3-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211208101839.16224-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20211208101839.16224-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0002.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::7) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.181.94) by
 AS9PR06CA0002.eurprd06.prod.outlook.com (2603:10a6:20b:462::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Wed, 8 Dec 2021 10:19:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 254a996a-27da-4127-b349-08d9ba342794
X-MS-TrafficTypeDiagnostic: PAXPR08MB6526:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6526A26D59C6380532035388D76F9@PAXPR08MB6526.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8qTlGosem0WU8S24skk1WVJOGKO1pQh3ikvfoFzM6I4v+3FVVHYiuZX4MihH0ulQr6tjA7Fgd4LUgP2tMKXpnEqNZkahBSZjSiF4Azi/0JiBgLeG7QFBHxBV9Ab10ZjS4wAujRaweBOXjxEqgf+jh0cczNXAdFMzQ3mk95wzSiZkz0fK5RuaCp21MxzvoS9KUWV7/cLN9dNJdzLFY/XR8D/lU4Bum4F3ZjSH3LTRjAr8xp7RAwc17tMXyHqvkBPbXZa4UfD+t2vp4gO4RECSZZeVAT97uK+jD7p7kGjtfvrcWqo4x3c8uPPtUT/2Qr3/Etnhd/lYzW9k3CdPLZ6pbLMvknGoZhpJ/qaSBPRXJg0XJoHrQtb+CsNohBE3YuWfuHpcHQ2jrflJu+wZj5clUEek59uGgrGDt2vZnxbvsoopwlShAAQyHzQk8/Ip59GmATIGtSITW1jAiwBlLnscSaoIT9WD+7jbwH9wLm8ShhMeuvw4DjCLHqDNzRU+mizGHJvuW7cTq/h7zIRPvIOfq9BBWidTrH/+jVi+YsMDUH/Pe6h1mwBJtHuUosYCel8vwfBUgUFGHcRgA8YcO4QKhFYaGp15E+B8ucBi1YSuSmcY2K/KRHPq8U6VltkSbTVUjtVng+1FZklreSVV2jkE6ADCTC0qa+fi+rQUddtIU4ndbt6SPgl1hU4zPRLA+BcNfw+3RkhnlWj4y7ZI5qm5wQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(5660300002)(6666004)(86362001)(66556008)(7696005)(52116002)(66946007)(1076003)(316002)(2906002)(8936002)(38100700002)(8676002)(186003)(36756003)(4326008)(6486002)(956004)(2616005)(83380400001)(38350700002)(26005)(6916009)(107886003)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9AVSr0aw6y19hK1u8bddhAdG+GiEVEoa3Wnng0FppxNCsBfhk6bPjpBZ9CD+?=
 =?us-ascii?Q?7Mdxxo4AjYOSDDP3U/Ud+TBlBuwSgZoYez6Go/+/aLsMj4Ots3pAd1C+iI/W?=
 =?us-ascii?Q?ffhcMaQWxpU6W+MzQXefoZkNVMYuqa/tlvhVAxvgHdFXmkHWw8tAepcOWeRz?=
 =?us-ascii?Q?FwKuh5zVB9ICmoR48Hcl/II2kscK1m0HDvhi455UNaWsc2wSViYBfEyLOvb4?=
 =?us-ascii?Q?/wsX7RA64giu0eLbScluVWchMlP+7jtOmet5RCqyrR3vdJvXnysNPZ8yPPOu?=
 =?us-ascii?Q?F0z8YQLK6EoIl6qv9bP9g89APjp0pdxJ84343580Oy5KAo6CXJ7TdEbeNNSI?=
 =?us-ascii?Q?KBT0+7bXmOEimOFww9yjpWo4etpTufa4hbwcaKFklaXp0s488P8RFzeRR9Jt?=
 =?us-ascii?Q?tO3m3Nhoe/q7L28wDF5eC2BJZYillnZraYaaj/2oP0PZ/lJLppylokU8v+zF?=
 =?us-ascii?Q?2X8wY60ECz0hlwmFfkGQ7+LjCLqcol/uMildjlVSXgiKF1wJ1W7eyH/ZR3K8?=
 =?us-ascii?Q?mvYMnHasIGVrby1qDFbl2pJ1j+pPPCvw8y2O/BjI7zm9zrNY0PO3QLfYTYk0?=
 =?us-ascii?Q?gNQS5kkv4zJgxf4ZW6QBFTaw+byHgIKFdidfYbC1qjdDO9dTS/G1Oq93bYqM?=
 =?us-ascii?Q?BONOMz2BQxF9dg64pVSaEwkCwbLpWXqwLSTA65Y+hFkIJczUWY26r+Pd8Qfq?=
 =?us-ascii?Q?Ndev9Zf/+xdRGCt7dQP6/COPBFuAwMjDdMk/ouslYopYWb8kICoq2V9tTXbn?=
 =?us-ascii?Q?XHShMkr+OmypSXl8roj7tkrM7nsefirkgAwv/smqs32P1KQ0gxSDkuCHgiwZ?=
 =?us-ascii?Q?Y5cpseGH+mD6gwYc+ixVcpCoFYvDCydhRvb+yD+edTRbbMBBac2JgWTxlDlN?=
 =?us-ascii?Q?N1CGTb4A9N9iCe7wrNTiXUrW5WdJ5QOwP8djWikQ0WkbSGR+elwTkSLLWSoo?=
 =?us-ascii?Q?GWz2u4kpuZy+XBkQILCmHv4hyvv9+ifvWNyiQOLgqBLMOHzmFeqxlKyl4oZp?=
 =?us-ascii?Q?XEMtxSnhfbtuIvGWgBPcJHUv5xOy8g53jVaIlrYt4ADZaoJfx3dnZRdXr/oV?=
 =?us-ascii?Q?mOortXAChYr/S12FOJeh7MWJPiF46qiDsQlTy4PXsPaxfg/85/bjWUSBgPCU?=
 =?us-ascii?Q?qKC44MHPiGvdbFHuAtP6J+JnVbHmpxQ53Fiq1KNV4vOKgNc6xgZJ7G/cPkZA?=
 =?us-ascii?Q?T1KCcBzzZMtY4DzKKr6QR/OiwK4wjR/kRAB2lhDnn2G503worKa0KnNGfMu5?=
 =?us-ascii?Q?tzns2pmnqzdthVAN/DZdx4/EiOpIwOTVBegdewpWE8F6fN5WPeccXz0AJ8UP?=
 =?us-ascii?Q?0u38RgkKqtsoIYZECYClIL+lXsPVekRl77oMEKqlDpxHT46anrUvM626gW9D?=
 =?us-ascii?Q?EVSDBMB269QOfTGq1hckUnw4uA8aQ9MGmE5XrLbEWDiaoRXDMJze4WGZKHLS?=
 =?us-ascii?Q?dr0j29O5HegiNDtuNj2/AcV4YxabDbq81pqAL9aNLqn8aJ5v0Vz0OObXCy1l?=
 =?us-ascii?Q?6CE2e3U8VFuazLOXTwRrnwDYtdmz0ofhh9QRGa5LutwfVBqeFBrnGpDq1S7X?=
 =?us-ascii?Q?OEhnuJBMZqMSdF3LRF4qUlYZxtBVV2b+7uWFqQlZVd8MChPDz8XHxXdUiNkG?=
 =?us-ascii?Q?xYRvIFMNkF4z07qI8dX7QNU=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 254a996a-27da-4127-b349-08d9ba342794
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 10:19:01.6241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 07K0XGhAmj2nYadYxcMqTPrIjmngrE3J0TJdgBORXblqFbpt/VY/IIDqy1Gsdq2AN2ogemcNL+rL8wiI75SXNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6526
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 10:19:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159358

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Split tests into separate test classes to speed up individual test runs
by reducing the test setup to a minimum.

The pkgdata generation is only needed for the append tests and slow down
the other tests.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

(no changes since v1)

 meta/lib/oeqa/selftest/cases/recipetool.py | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/sel=
ftest/cases/recipetool.py
index 8dc00ac10e..1aedc02b99 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -68,7 +68,7 @@ class RecipetoolBase(devtool.DevtoolBase):
         return bbappendfile, result.output
=20
=20
-class RecipetoolTests(RecipetoolBase):
+class RecipetoolAppendTests(RecipetoolBase):
=20
     @classmethod
     def setUpClass(cls):
@@ -76,9 +76,8 @@ class RecipetoolTests(RecipetoolBase):
         # Ensure we have the right data in shlibs/pkgdata
         cls.logger.info('Running bitbake to generate pkgdata')
         bitbake('-c packagedata base-files coreutils busybox selftest-reci=
petool-appendfile')
-        bb_vars =3D get_bb_vars(['COREBASE', 'BBPATH'])
+        bb_vars =3D get_bb_vars(['COREBASE'])
         cls.corebase =3D bb_vars['COREBASE']
-        cls.bbpath =3D bb_vars['BBPATH']
=20
     def _try_recipetool_appendfile(self, testrecipe, destfile, newfile, op=
tions, expectedlines, expectedfiles):
         cmd =3D 'recipetool appendfile %s %s %s %s' % (self.templayerdir, =
destfile, newfile, options)
@@ -332,6 +331,9 @@ class RecipetoolTests(RecipetoolBase):
         filename =3D try_appendfile_wc('-w')
         self.assertEqual(filename, recipefn.split('_')[0] + '_%.bbappend')
=20
+
+class RecipetoolCreateTests(RecipetoolBase):
+
     def test_recipetool_create(self):
         # Try adding a recipe
         tempsrc =3D os.path.join(self.tempdir, 'srctree')
@@ -518,6 +520,15 @@ class RecipetoolTests(RecipetoolBase):
         inherits =3D ['pkgconfig', 'autotools']
         self._test_recipe_contents(recipefile, checkvars, inherits)
=20
+
+class RecipetoolTests(RecipetoolBase):
+
+    @classmethod
+    def setUpClass(cls):
+        super(RecipetoolTests, cls).setUpClass()
+        bb_vars =3D get_bb_vars(['BBPATH'])
+        cls.bbpath =3D bb_vars['BBPATH']
+
     def _copy_file_with_cleanup(self, srcfile, basedstdir, *paths):
         dstdir =3D basedstdir
         self.assertTrue(os.path.exists(dstdir))
--=20
2.20.1


