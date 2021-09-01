Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.61])
 by mx.groups.io with SMTP id smtpd.web08.6055.1630492240348501591
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 03:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=NA0nnB02;
 spf=pass (domain: weidmueller.com, ip: 40.107.21.61, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOJ2p7WYnLeClbsNE2lOQgOn8pspocBFEqa/s0dtvKs4GiNwxcKOrLRqQT4wopz/fWr9KxpaocICaocn/vtYUlvomnEZGL0dt4g5mj859TAGG/MLPzVRbW4dEG6u9tW8Pi55NF0iATvH4g77BuW7TyVC5u9F0K+ouRElMSJp5cRKv2aDN0+8cQJ7IKQ5thHGYUFLLruYdwF/G9JwharW7LyMvbN1YAMMjDZBrpFghjdri9LEti+IRgrturOURfIOTo3+QicQny0NI7z5wBcJhoSlkjtG/lsogtg/QULZzf3gRpQwxblfaMbzUn5M/q/xT6zVvRcnEjLf3lDaax94Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=rHUYrvJ15kcOIax7DB1j7YZ3+Epv0os6OssSwCI0g9Y=;
 b=iMEJA2U9qXa70mglXPxb6ronojBk7IZS7VFcBrFCYu/yJGwFAxQOWR1+Bk3PyrI9uzU+k88UbERggaRjMdJzx4g8YFpfCX/nPRMk/G7eqLms8O23zqJ7n/UegFQpzkQbF7kvQBmwN73DggEYZbR2g7mKRa2PZUpdkvPjMKcaIMOIbatdbaEtRYpYgrZvyqRzkOZgZysszVOLfmYMGtmbU4hwUO6fNV+pdG9DyjHQkKgkUffrqR7nF8up6PCgzAlvknUVOtcDPZtLsOkYrKKGoWVaRdcEH8LpGBfq0vKdBYaCmTB02hoF5CcuaEC5X/Bx2sXNQjB5JYSyGtB5o27bcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHUYrvJ15kcOIax7DB1j7YZ3+Epv0os6OssSwCI0g9Y=;
 b=NA0nnB02O9Us+U9Wrdn6JBRcmwn1MDKZccyLhOl4ln8BdF3H2jIC243AylVPwGsuXsNRkH6Dz3z4epYzXgjXBXiJa2MDh1vh7GKvaqtq5Vqqy5Wtwg9+3NAlnBImjBNcqZv0SHFo6fRoRBbIdjSmhN4kX2AGV6Oa+2nDSu0oKgU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6735.eurprd08.prod.outlook.com (2603:10a6:102:138::12)
 by PA4PR08MB6207.eurprd08.prod.outlook.com (2603:10a6:102:f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 1 Sep
 2021 10:30:37 +0000
Received: from PAXPR08MB6735.eurprd08.prod.outlook.com
 ([fe80::41d1:d9c4:c030:ec33]) by PAXPR08MB6735.eurprd08.prod.outlook.com
 ([fe80::41d1:d9c4:c030:ec33%9]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 10:30:37 +0000
From: stefan.herbrechtsmeier-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 1/4] u-boot: Remove redundancy from installed and deployed SPL artifact names
Date: Wed,  1 Sep 2021 12:29:51 +0200
Message-ID: <20210901102954.4629-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: PR3P251CA0006.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::24) To PAXPR08MB6735.eurprd08.prod.outlook.com
 (2603:10a6:102:138::12)
Return-Path: stefan.herbrechtsmeier-oss@weidmueller.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DE10512.weidmueller.com (89.247.126.241) by PR3P251CA0006.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 10:30:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8dea3a4-6345-4898-b763-08d96d3389aa
X-MS-TrafficTypeDiagnostic: PA4PR08MB6207:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB62078BBA2A1BF262584D294BD7CD9@PA4PR08MB6207.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:459;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cTI0lWlRPPNpY4iw6qIApnV9nevnHIZPazCK28Sa9Gl6pZBkdYHdhz7ZAkwrogOvzX86KyH1mOK+IX4oVK+uBwCve26EoI3KBJPzTQhQsx1VxwagsNMCiNtJaF3LLMOZIUYYmo32l4Hb1Ry3RBwAeqtiSVyPEROckgTQqb5aEHAMhFLiXvAReMq4k0fCHqzyhUoHzAVV1Z0foBxbzDs0wmiy3o/2lDzggtHWyI+NbEfe/beZGw1+Yw52iDFbO+Oe1A8kESikmGu5kb08+HHlRFQs8d09g2UsM9b9v2oAPzZz2dD44re74ruAJkC4//u43vkuQp+t3iN2IR1a9/srbtdq2G6I58x4PxPTV41jBrc4V9+h9b0v5LfP0+oAWYkwJDkfp4aDcFvvPQc9O17teqvpsA3wtsr/hJBu6Emdaa9s4GTiQFMreIkPH78VQm9xIlyZR+otkGx06kPqb4tKwLx5z5NEM89k2IXMXaDMMinVuOdnNlpSSuHL4JemblmYWe07CXOYuwFMZk0Rr4XNs1zWW4Ld00NlkBr/gNKYXYCdyDNqmJXefMA2uv9pyyg8R5NTbFxSZSOkU2z396SYiPFN8pPU3yR6WyqN4TcI0hT2GTX6IC56q5qTol073SKWwFMYv+SO+21SIvffWZzT1kxRS6gEP1mGGV6naPj5qvglO8KpHFdGmDFNrJXHTsUF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6735.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(2906002)(478600001)(83380400001)(4326008)(86362001)(107886003)(36756003)(38350700002)(38100700002)(52116002)(186003)(7696005)(26005)(316002)(1076003)(2616005)(956004)(6666004)(8676002)(66946007)(8936002)(6486002)(5660300002)(6916009)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Fkf2wxzN5e7/0B4gswot0lanWnx/KcYrrjU4dY/rLkDEhvKwHGx/8MwKHdrV?=
 =?us-ascii?Q?9xBJ7ahUNTGFsRZyh9RuWGYvLzOsn00SXYAHgbRR7yl0cnmRX2pQ0JzjbSPw?=
 =?us-ascii?Q?lewOh97ZfmRDVmmsRZOoG/qzdfRedaY36C7eJ4jusVlu5/7y95ePM7cP2YEO?=
 =?us-ascii?Q?OH5P7dZ1freZlMZggQzSdly6ks2ctIlViNrMME3ZXGvk46/o0w73u/z+We2k?=
 =?us-ascii?Q?TDSSuxhElouA2Sa9IhquHS0/q94Z7mOZEdn9afjtQ3NrcG2WhylugG1p5Sq3?=
 =?us-ascii?Q?+291seEpeuyCOcjk0U0Jdi+1Eqd5JdlE7sLtwQT6ek2/DxO0hIldk3kdapLQ?=
 =?us-ascii?Q?1Q9xC1b70X1Sv7LWskKevfMCRZ4UOeBH9UD/IWf7RQIUoxdIIDaoUyuD4Fnw?=
 =?us-ascii?Q?5f9zEM3DWqTwHmDdf9NYXTm/A7WjSjm1az8Ks6TMhBa2ydAgSYDb4gZUGYfk?=
 =?us-ascii?Q?2M42jgn7e8ttP3hbRsnAMiPLsfa/dFDrffE3nNQEZhHKkIl7QixjMgLdoV1x?=
 =?us-ascii?Q?/UVn2DRpv79400dCKRMc1wISUKtb/rO/+AEl/ipGzKDizlyQT8x0KxTiSxvf?=
 =?us-ascii?Q?iQt07uSR4dUMRFd1UCvroocqMXpRNcrXeRu5ONa3L9iTmi8fNL8Hr8VMw6NA?=
 =?us-ascii?Q?7qskm2DApkmNJBQvMUfAkceK45CTz5WbJehYeyMD2+HkQI3dFfzR1V2ZpEwg?=
 =?us-ascii?Q?K1eSSm0qJ4fpWDpihQc3xpU74NLMbp+BHjDA0iqg6S1RGkAC6NlPCEQXk/D2?=
 =?us-ascii?Q?JoUzCrFiGDT8xwUGN28gfzxLxKbxbx4k+p/a5hE49bLGmQCGF+VvwREdng3+?=
 =?us-ascii?Q?/51znSKnoRu7dBk0lAXEbn8ENKY6DT4jZOdKtpP709RCrmyLseFw4EtTI5B5?=
 =?us-ascii?Q?xfO70PLgH0eRGm/2V9/O7MvEtzz2W9tySQNArpuXYRaBUpGQ6yqleKFDTbnn?=
 =?us-ascii?Q?XMFX7OMQA+N/Z09SbH9uitFvnE9Mlid6fTKYwHahhmXEOJw4FitALOY4L/mv?=
 =?us-ascii?Q?l/kKEBTR0cXpUTIJhEvAmMpFT6TLQZxocVqkvuUupB8tHbzOI5fwFVhtbaFF?=
 =?us-ascii?Q?Aeh0CxF50DHpn1edqy4eDMZSNhDlts5NQ4LolvWCRTiZc1xyPwdDJjbNrHBa?=
 =?us-ascii?Q?pongxcC60cTGWmmpQlgz462QP++J4Gw88w4Mdw5U8MNDgqJEN0YEnUWsKIa1?=
 =?us-ascii?Q?ohN7VE7Y/FAnUPcZCNyz8iwPl9fwTPAR+mvvR/Ogt0dYmxOgi7nA0uvRHVSE?=
 =?us-ascii?Q?1F+CGUGmNcoMVJhNfUKIaP/5zDgYwn4/ySdotsk4hBKxUbrsygfy2AZNbO31?=
 =?us-ascii?Q?kOptpzy/omGfsh/e5t2PXmHn?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8dea3a4-6345-4898-b763-08d96d3389aa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6735.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 10:30:37.1356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GWy0fYXIzx9cC4fON80YhYMSoSU2zYG50KXt+UJ/EW5ZIPYYcMB2vxJGNd0wV/QXvRpejTnA6Lo5vz/dvtb4Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6207
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Remove redundant parts from the deployed and installed SPL artifact
names of multi config configurations to match the other U-Boot artifact
names.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/recipes-bsp/u-boot/u-boot.inc | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc
index 971fdbb102..71febb6f43 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -184,9 +184,9 @@ do_install () {
                     j=3D$(expr $j + 1);
                     if [ $j -eq $i ]
                     then
-                         install -m 644 ${B}/${config}/${SPL_BINARY} ${D}/=
boot/${SPL_IMAGE}-${type}-${PV}-${PR}
-                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${D}/boot=
/${SPL_BINARYNAME}-${type}
-                         ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${D}/boot=
/${SPL_BINARYNAME}
+                         install -m 644 ${B}/${config}/${SPL_BINARY} ${D}/=
boot/${SPL_BINARYNAME}-${type}-${PV}-${PR}
+                         ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR} ${D}=
/boot/${SPL_BINARYNAME}-${type}
+                         ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR} ${D}=
/boot/${SPL_BINARYNAME}
                     fi
                 done
                 unset j
@@ -315,12 +315,12 @@ do_deploy () {
                     j=3D$(expr $j + 1);
                     if [ $j -eq $i ]
                     then
-                        install -m 644 ${B}/${config}/${SPL_BINARY} ${DEPL=
OYDIR}/${SPL_IMAGE}-${type}-${PV}-${PR}
+                        install -m 644 ${B}/${config}/${SPL_BINARY} ${DEPL=
OYDIR}/${SPL_BINARYNAME}-${type}-${PV}-${PR}
                         rm -f ${DEPLOYDIR}/${SPL_BINARYNAME} ${DEPLOYDIR}/=
${SPL_SYMLINK}-${type}
-                        ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDI=
R}/${SPL_BINARYNAME}-${type}
-                        ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDI=
R}/${SPL_BINARYNAME}
-                        ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDI=
R}/${SPL_SYMLINK}-${type}
-                        ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDI=
R}/${SPL_SYMLINK}
+                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR} ${DEP=
LOYDIR}/${SPL_BINARYNAME}-${type}
+                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR} ${DEP=
LOYDIR}/${SPL_BINARYNAME}
+                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR} ${DEP=
LOYDIR}/${SPL_SYMLINK}-${type}
+                        ln -sf ${SPL_BINARYNAME}-${type}-${PV}-${PR} ${DEP=
LOYDIR}/${SPL_SYMLINK}
                     fi
                 done
                 unset j
--=20
2.20.1

