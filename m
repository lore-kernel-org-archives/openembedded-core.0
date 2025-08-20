Return-Path: <r.gruenert@pironex.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B77CA0EED
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 06:20:18 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.85])
 by mx.groups.io with SMTP id smtpd.web11.13747.1755670811554067340
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 23:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@pironexGmbH.onmicrosoft.com header.s=selector2-pironexGmbH-onmicrosoft-com header.b=ZiTbRPjj;
 spf=pass (domain: pironex.com, ip: 52.101.83.85, mailfrom: r.gruenert@pironex.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLY/E5ZJvhuPFL36zVh4WZNpbh3rQaFev+ZoCXTHAaTC5oXKj6Gcj8Lb4q9dqXt6FxU8/7uHK4dUMH3KckNOqcH4J4GKlaRhXb556S6gQmgtCch7NcMIBqZqzD9Awl8IlbdO2+LmN/LH37I5wHcP54v+qytXTUHdqY4tq0FbWH/7tNkByY1pH02AFUmMEEQ0dpMBed1LFC3TePcciNF37oXISLsUqxyqnjy82IAqbkTeCwDhhmPOmGErUphHyUF65ho2fV3O3jUn8dEjqmyHBCxCis2SVW2rQDng/yfZ0AHIs4NobB5P1sz17azjF9BBf+Po+Y9tRDZRNvjJSWUsxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=La6tumMvqVEoz6ACpueYbzNG/fw+ZvaICLUs1cHpEX0=;
 b=fMYkKu+neoeCqy51xwDsfl+AYH60DU5sVae5dX3kTQ1NWakEdap94ZaMsbwhvGtpBq0/gmgGI4I4gm6fgo/Hq7Qm9ByyuyIVpxblJWwWlchGbhywUIPTK+1vGYetlrgAEP6D2t2p4DXiueNV0o8sFXZFczRuKPbMSLJ0ENPVB0v6wdFOjPJe3rouzk0jwahAj/vVmO5JJ5FlHgkmpvMqk1Nsk+53DpzQX8/NXlzWXW8+7585kySovHBcm7avm3J80bUE/zW+0aud/dTBroiOCw0S3jr6DtQfr4e53aODQrKS/vLXszXP8xTUX23PqvP8oNCbnyZK4Fg0jMIkdUEoPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=pironex.com; dmarc=pass action=none header.from=pironex.com;
 dkim=pass header.d=pironex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pironexGmbH.onmicrosoft.com; s=selector2-pironexGmbH-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=La6tumMvqVEoz6ACpueYbzNG/fw+ZvaICLUs1cHpEX0=;
 b=ZiTbRPjj2XDZPLjSEWQNX8ToQazSShxN6aOU6Mr6FSX0iGKBy9Gt/l7HwGkB5aRPSZLsiEQRHb5iyprB05Cw4NlRR4BQ0VWmcbcAdONikf0AWwQ6hZpNPT/1bsQJPzP9i5oNmQm8iSuLenFZfF4+mIuR56rOrUT1PAoUwrS4+Mc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=pironex.com;
Received: from DU0PR10MB6954.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:415::15)
 by AM7PR10MB3512.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:13b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 06:20:06 +0000
Received: from DU0PR10MB6954.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9943:b0fe:660e:9e3b]) by DU0PR10MB6954.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9943:b0fe:660e:9e3b%5]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 06:20:06 +0000
From: =?UTF-8?q?Richard=20Gr=C3=BCnert?= <r.gruenert@pironex.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Richard=20Gr=C3=BCnert?= <r.gruenert@pironex.com>
Subject: [PATCH] scripts/runqemu: raise an error when bitbake was not found
Date: Wed, 20 Aug 2025 08:19:59 +0200
Message-ID: <20250820061959.22598-1-r.gruenert@pironex.com>
X-Mailer: git-send-email 2.50.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P190CA0040.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::20) To DU0PR10MB6954.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:415::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB6954:EE_|AM7PR10MB3512:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e56c18-ea50-4676-78c1-08dddfb19b4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?F5djQrwN4MdFIuYluhF0efh9OJOrYjRzKOUp3HZDLNYkhOtPooETZP2P6GDb?=
 =?us-ascii?Q?9kPDd2euPW+wDp/biyS0D/kN5UgFE0kgRI5XY98Q9WFeJ7Az2wPLLqQyTmqP?=
 =?us-ascii?Q?qXD+2RLRazTuMc1b4NBh6iKIxeqHHoHwbdBQhp4Y8OAb77CXQkJwt7a9LiZh?=
 =?us-ascii?Q?372QPWhT64S4ADIqRBzXNmabe5f+fY1FPAD9bCvlajvAtu4jv5WO8dB9fjWS?=
 =?us-ascii?Q?eNKxrij2QY4MxBQVvJmeWSx3GpQd3v/Z82h0xG4xO7PRG0m65p2cBSoOQO7L?=
 =?us-ascii?Q?xO9FcDDYGeY6Bnwnd4IY/d3LzrLYUqXURVC3XvKh8fWaROtxzaVce1OHDV6x?=
 =?us-ascii?Q?nJNBJc2vclEgsICsIY1xQWEiVLTfUnwB59gnczzDwDsoIb/kvr7NWaSjVhFb?=
 =?us-ascii?Q?nydv44nOAGQeGzZvkbwB+u4kDp6TJnOqLb/8+zyKV7rpua7T/DNG3bheGy3N?=
 =?us-ascii?Q?3qdzTsQV+6E2frrHg2Y6yDgNzC2OrSzv63p6v912Bvyl9KifYmlc2wlkLVao?=
 =?us-ascii?Q?LboYcgomhZ863XS09jsO3riofwEXKI9aB8a2Y7x1GNDQjTnz3JwX31jqQa6y?=
 =?us-ascii?Q?iQusk2ukR52lUNY7ow7e8jfop2hXNlyF4E/K+hv8/Fcq94Azj+rcWOy29Jmd?=
 =?us-ascii?Q?zwJnQLjG0z0wbCjL0Y6m/u2J8MZkZkgBhg/tvNdROFWB6iDqKLE7tPjs7kzN?=
 =?us-ascii?Q?didQpUPig2KeU+yJkTQR0xxECbxAEWlvGE4DmD+Oo4gmenSEaIF9sH7GqWVB?=
 =?us-ascii?Q?b58TFNFHk7VjOm8RmtSV55iji/52Qt35w+REGD/pGEUaZ5Zf0xqCcvYJEvbv?=
 =?us-ascii?Q?+6V48PgkheZhp8Pv0QDx+9derh2yjpH60OZyaPO+7NT4mRtUaGWVwT2j8VHD?=
 =?us-ascii?Q?FglRuC1+p+5fD6V8qZ2824wg0DnwHiKGOxslV3B4LIpIk9UkHbnHSqxN0603?=
 =?us-ascii?Q?TXYc4lT2smp7Zmdu9AFNUJ+SX/KitghyiLaM4tlmme2LVO40kGiMh/MNeNyH?=
 =?us-ascii?Q?ME7wAfypVHkHuNUF7BnS6Acbe1ij2pzzWQBIDq/TmlZKiIeOe1ZGYnb0GqZV?=
 =?us-ascii?Q?RyQtKTd6++/8FVOchUZVIcuHW5F8YD+2dCy7GA7YK/EP8oeFbUCDDx8KeC86?=
 =?us-ascii?Q?Nv0FXNMXe/FeIX1Ti3pmHUYaIHF61H56G0YOQBKXLeecBRiI8+L9hfUTFxoW?=
 =?us-ascii?Q?OW2qlg8XZXenvU7eIEsWd0Sw5+9wI8d1knvN4JJEvJhhy0SJeqypQZgurl2d?=
 =?us-ascii?Q?Y6zRfVtkaDrhy3UOIycWPEG+ZifBlh4ZOdLxnUbrQxbJTU8hsvVZFAW5slh7?=
 =?us-ascii?Q?m8R9E5IadkEgFy0a6GCAO75e3Vs/ws/TYax8/UE27Aj9KrF2XslFRY8XNiMM?=
 =?us-ascii?Q?8rg/uRAXvp9jmn0w4ov9/SUJ4D+IyqypGijpYaWHGa+VrsKrmHRuAN0knWGC?=
 =?us-ascii?Q?uuLLGi5LOpQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB6954.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yq/UB6TKJ2AZ2VCk/7TEDaae2ebe0POSUDqb3nCmIZJ0+UrhkM4/uHmaMWAd?=
 =?us-ascii?Q?DY0SlXVlxwK4X36UuvAwHSqVA6p4L/s2pPghda9dmwIuHEEDbBhyUbL0ydIQ?=
 =?us-ascii?Q?WOOLJ1yGm01DF1qxBE+0xXsGN5YBNvAhu3LGfp81f6vnvqpbnV6Ns0xt3YlS?=
 =?us-ascii?Q?iDJ50ABOrFxhgbePTEAFA0IIQX2BRjCs311LYw4IwSkYldEe0qE/G1wGMYMz?=
 =?us-ascii?Q?Q2ItpBqis8YUuN0sZN0FtvYZUhzNleoZvPiupgajEGGfkq8Jwa3d+noh3ylk?=
 =?us-ascii?Q?4afk2QUwAeJEoMYCRz42BdyC1Y2jQ2/rIzlcldQD4CnST4QhlF4F+flNhn8R?=
 =?us-ascii?Q?Or7QqCYeUSvSYPyMmr7csdxKjcZ3YCx5wkiifGWnuDLiCIF5yWYaR+PQt5sl?=
 =?us-ascii?Q?gIWAMTFV2Typiu0FsdQ/GOqwVW7f/Sm25bnfwGjPMPo0Pz0rvrwqB2+KI7OR?=
 =?us-ascii?Q?RhNnCoZK3c7XWeVRMGjXhHSIiwNYXD5NpUJX1iksbhywT+4HXv6eaorqUS/H?=
 =?us-ascii?Q?AMNEDNPR8FMJ+UO4O1zYfpY52JxFhIPf/tKzp3GrM7A3M0H1h9wJlujGfj6f?=
 =?us-ascii?Q?cxRlCX8Zm/y/BvuMGuKNson725zbAmTHhhUqsqCeB0hoGqbxI/AtTk/hdmJC?=
 =?us-ascii?Q?pKzjhBolcq8gbYiOEn4kyuQF8Q4BVz8CdokXcezFUOVcu+SefByFwCcg6FuQ?=
 =?us-ascii?Q?Hzl0VKtwO0mQSRc+aW9UG7PmXmp0bRq/OaXC8MNc17jQtHYI+DXGZ879EyaW?=
 =?us-ascii?Q?302nlkdPPy2fbwkLOluR16gJ9ZzcvGggJ6CSJCfwjoJSt0ac+Ii6nP+LATFW?=
 =?us-ascii?Q?rqvuuNCEtWJDQptxTcxSHEUqQTT9Xe7B7Wph2IMWDYW8R3AMwtfR+ZRfhnZY?=
 =?us-ascii?Q?9Ap7UBfqAm8MSGxuhJZEZX3I1l7UlAGdonJ1Dnu7qLUb/EihUwsdtWbK6MTN?=
 =?us-ascii?Q?ez8ml5pxkWnAYzMETyR4R2t3p1F+7S54H05H6V3mkYr/3RF31N4VBOHLyYRz?=
 =?us-ascii?Q?wQ81kzl/LPGTP/WhsqzN6dYQiStgweR/smVJEMJpqaRDfRYOPBricl45rUGA?=
 =?us-ascii?Q?JMMwyUPVmq0QvpVCKYq+lf1RQQeQ4gAuDazJAaXyhbu2N7NHlyH9FI0WbOO+?=
 =?us-ascii?Q?79b2siftBipZHMaKxKrNcJzkpdTZpKQpO0Yt0aOgAc/qgk0L3CAvSSEd9CVB?=
 =?us-ascii?Q?BVJ+lWkv3Tme32sTLO6GiqFsHxASfCBbOxpFxWl7bKS1jXxJ6KC/KL0JZwa+?=
 =?us-ascii?Q?a2fcmJLvS1uXFRbCuXr14++JvmcYZCMH12fp5TAWLzA2yulXGqpYPb8Zz5oy?=
 =?us-ascii?Q?xMeaYIGqeNgQ1s38gBOYvOeg1nT/B4lEctOzRjcQRhyO4+FJpAwipck/rkzW?=
 =?us-ascii?Q?rON1zE6OReyofSU2a1tU0/8VnguqsIRwOf2XyC5Z+spq664BgSV0MLmwVnxn?=
 =?us-ascii?Q?VXG6fLdUbBXihECXhy1VZQM8OubnUx6iga2X8/JDAF1Do+L5hIFOh1mAMgnV?=
 =?us-ascii?Q?kKSVTB+QILM6pRKnfJB3zkNXRB1aseolKM5yKgwbKQdvW0kjDkHsWxOQr0Vh?=
 =?us-ascii?Q?j8Fl1DyGrswluVTrlLjnKJ6+OrUQby77tPcUIz4t1Cp2U2o6Fen4xggRdtLp?=
 =?us-ascii?Q?D/HkjLTxN/YmbJmcas8Fdrkmvp+q5qz25j1tL/0aizHX?=
X-OriginatorOrg: pironex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e56c18-ea50-4676-78c1-08dddfb19b4d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB6954.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 06:20:06.6870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00aa8e52-eebe-489a-8263-3195e0a468ca
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aO0TCGw7LX8QRAR6mNHx9pCDEX70hg6NXgMT+fEzfqelmxq/BGHJeAyMy4bip537k/8CKCnuWdp37tqyQKWurg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3512
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 06:20:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222153

I am new to Yocto/OpenEmbedded and compiled poky by following the Yocto
"Quick Build" guide. I later tried to call runqemu
from a terminal different to the one I ran the compilation in
and runqemu was not found.
Wondering why it was not found, I ran it directly as `./scripts/runqemu`,
which was a misconception I had because you are supposed to have
`oe-init-build-env` sourced. However, there was no error that told me
this when running runqemu like I did. So I thought it would be
good to add this error message to notify the user that bitbake
was not found. At least it would have helped me and saved me
some minutes of head scratching.

Signed-off-by: Richard Gr=C3=BCnert <r.gruenert@pironex.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c24528eac8..6a36fdc011 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1715,7 +1715,7 @@ to your build configuration.
     def run_bitbake_env(self, mach=3DNone, target=3D''):
         bitbake =3D shutil.which('bitbake')
         if not bitbake:
-            return
+            raise RunQemuError("bitbake could not be found in your PATH. D=
id you forget to source oe-init-build-env?")
=20
         if not mach:
             mach =3D self.get('MACHINE')

