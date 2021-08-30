Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.40])
 by mx.groups.io with SMTP id smtpd.web10.15383.1630320437072949536
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 03:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@synaptics.onmicrosoft.com header.s=selector2-synaptics-onmicrosoft-com header.b=UFFTYeL9;
 spf=pass (domain: synaptics.com, ip: 40.107.223.40, mailfrom: randy.li@synaptics.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obQXpw6qbZUh1p0HvQIq6lv5Ks6gPIwZVlsyzyERn0FZrIj4RLw71TNUOCsgZKNhK+zlWHqNDcpgNWBRLBqfSmLb+ZVBDlAk2PtOR82Felu9bDKyM6+BuD/wF13vnEqiH6rOvPRr9azVdInYYKGb4i4qWDG+wghIMZYwEYk/DMDlXiKfzFWtrpGOkT+95vsRR3RGEvmj+3pcuJts3WqNLELECuVjiHFttydgJOAaaplFGkaKkYK43kkYcTmabbCeRpNsbtVBu5WHTRhmVOiK82yKkJgc6aSxQvaTgdiNlILSS5oqIk9nMHap/RjPBDFqp7xtcuAFm1GrLyVjN6f+bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZeDu5CLHPLeHstkQu24oN0tbRvwxNex96a5XueE50U=;
 b=gcOQiGi30xEyUDb4LoY6fXZj+ocmBZ4c70n0CKQbb2I19L7E1FZrXOxsIkcq9ZmNjEDu6thdwZdpwfb2pV7V/c0AxnxjVX3MdJQvYpdZhtgYEqIyh0orsrs3Gozne7rPjL01Kq0e28bPV9kO0pa1OWc8ampT/6U8t+mqvLG8yTBi4+PouB8uBOdSigPGPbajcU8KPNv8yf7oOh5aYl/C46BWBi1otizgnfTUSaIs3DsHsfWgaHPjmT8DfKc/k+nncOtihqzMGOpEYYg82kDJzLOSmt58lmhQYW7utcklmFyLTidJx9493gmVh3eG9F79Ta2J9Mz2ZfrGeTmHc1WD5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZeDu5CLHPLeHstkQu24oN0tbRvwxNex96a5XueE50U=;
 b=UFFTYeL94FKEzYv81mIBmMXfYwSz3dby8Quqnotlmhh9Gd77nkMcvFswlk2DCSP69yvhickDtS7leuuwMpQP78xcXVvVtVYTJSKih7WdDYkNun5lluUcriwEi6pBRIMqnEFfkfJXpe6spCqNUiEKWHKAmZ115AMd0SM+TpJLAUY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DM6PR03MB4347.namprd03.prod.outlook.com (2603:10b6:5:110::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 10:47:16 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::1aa:48b3:79d5:7e11]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::1aa:48b3:79d5:7e11%7]) with mapi id 15.20.4457.023; Mon, 30 Aug 2021
 10:47:16 +0000
From: "Hsia-Jun Li" <randy.li@synaptics.com>
To: openembedded-core@lists.openembedded.org
CC: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
Subject: [PATCH 2/2] gcc: disable zstd by default
Date: Mon, 30 Aug 2021 18:46:44 +0800
Message-ID: <20210830104644.422663-3-randy.li@synaptics.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830104644.422663-1-randy.li@synaptics.com>
References: <20210830104644.422663-1-randy.li@synaptics.com>
X-ClientProxiedBy: HKAPR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:203:d0::25) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
Return-Path: randy.li@synaptics.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from randy-t14s.synaptics.com (124.74.246.114) by HKAPR04CA0015.apcprd04.prod.outlook.com (2603:1096:203:d0::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 10:47:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c24304f7-deb0-4932-a748-08d96ba38835
X-MS-TrafficTypeDiagnostic: DM6PR03MB4347:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR03MB4347BFEDCB913BE53FB7A6C686CB9@DM6PR03MB4347.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fZKiXhgPOZBWGQyY6IUMsmralEYfv8PrrcMx8E/8T7deDPovDN9SJUrU2IXCCrIgArTBx70mkRXY1TuYeEIrSvfQQtaZOiAcFcaRFpGQXFw5ikVPYFUUbVzAGUzfCN4MrO4qpE9SMUb0Ytr2HidI2VJPCPcxYaj1eG0Q9JQcMALsJMkKzEkeHuUdfeqYwi0tnx1LTLL57dIo1xrjnrNFwZqFAEk90+vNy+B6MTcTgZZ1R4iw3NAs3avSF73+b2H4BVPS68zub8WbCi09UFwzVQ8aFab5PZJ682mZyKU8QXTz6UUCJRt+Qa5mwR7L/om15/KX72/dUocyrVPI0bJ/zRIGs8BZpIZFxN3p7hi6CYS2ja1Cpr/AU89Ib/XtMm46LBiKRvmKc1TxaD4hNuBjoYkhyL85HUVcFFtmkE9/hw8kEqZhJA6wa8GcmrIz+Qwhdo4W/Q9g/7Q+nRf4KBLDOiT6JJohlR0cS8RmC1n3ad6P0eKEgiJ1lHyvZCU6VkpK+A9hCTBTS6DnMTE55C06rKZmjMGKCrtAxwX73eLMUZqcUImD5oqIE9BxFz1jJnRiVkhw1ckqcxTlRdoNch5EUt5WmHl9ns96Cbgy/mfVazlx/qq93fiANFcx4fU79F1sGWbBjCBu+9tALy/0Mf8Kh5BRBMjZU9sgHzwwZ9iFotvfdTsg6pNEfRRHfl7bQYPqomhcYwpxF2Dp9SjZxnsBBw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38350700002)(186003)(26005)(2616005)(2906002)(38100700002)(6666004)(956004)(6486002)(4744005)(7696005)(1076003)(4326008)(36756003)(52116002)(316002)(107886003)(66476007)(8936002)(8676002)(508600001)(86362001)(66946007)(66556008)(6916009)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?luOg18nB86DPZQY9wNnVHL4Q8Y7+mRoRFpuMf9ZZd220WlfILGSlJPvOcpTc?=
 =?us-ascii?Q?swzi4Cni2ChJzJhOZok0axF/55PElX4dJKvlDPgi7fXLp0jENn3S3x91QEeX?=
 =?us-ascii?Q?YBNI7p04iX0+N/u8ZZonvjoD4kwdfJKsVPkMR/5dyoWm7AijrQluW11DWxjI?=
 =?us-ascii?Q?IpJLo9pgWgB457GkIwggxckwS0JFY8Cx46d/lmQI6vdJbVJHnBFkUwX771by?=
 =?us-ascii?Q?NKAXnSU/e1cJLh/LmHo+60FFKhR6O1fTrfKIuYaAiUK7HPKwZrtskgYlQ/PE?=
 =?us-ascii?Q?Ah0WHUpVGuR6OpMNcL0TdcPAhB+bxrV+jSClrmKkJO4AtynT7YFyPZiCPsMp?=
 =?us-ascii?Q?OyqJsxbO5+841JYg/fLIr6C5pQ8VfK8CU3KW9Hq+evQ71V5IymSPw3nbvLGC?=
 =?us-ascii?Q?CQwv/w244JP8cxYD6uB6FAE8STSvtngm/fcUacrUuB85RMVqkQ3qKxgG+UtM?=
 =?us-ascii?Q?ZDx+ZE0Nay2zOH+lWgvsERDByfkDYZoImoX7rsuthSCXiZvu2alCXbDU5Dkm?=
 =?us-ascii?Q?i2mfazkS5CFfj/je/a0+5z0qw1hY0FPPnfEXtEpljtnUUBHyAQvtc+Wl+9dA?=
 =?us-ascii?Q?6PMYWDlAUpM5psYG4/bYDeFrJk08YWv2YAcwGs3d6fDtp7Jl4HA3WC+p//ng?=
 =?us-ascii?Q?gek+O2gYjnmPhKOXoleAfrafFoVQFogoOVJmka6cof4NL0wUiO/1cS91l553?=
 =?us-ascii?Q?RO8td6OJkoAs3TKuoetudGCPgTA5uRzJjliyiT7yuQfkBIkHX0IIbWRvc2zJ?=
 =?us-ascii?Q?LmUR3ABYhiszs85PRgwfsdnLcU1mpJodXOSs2g78gGpFLqKZHw3R2zwl4EPU?=
 =?us-ascii?Q?aXM4HitN1KFG1PKH3BKoPbSzgRhnqSVN6gk8/iEEAE7N4jHuR5xdOnnTi8Xo?=
 =?us-ascii?Q?xrAivXcRL0VZL0Xw7OW/85OSVW/X7DY/31zhONjsXU+pBmTN5FqdJqDrtUnx?=
 =?us-ascii?Q?lHG7uQHOBp9k0b+mMqw7uw/+8z199fiOJMXxg25nyFDaoD6bxQi2zq7ftR8J?=
 =?us-ascii?Q?j6DS48k63w3ckBe3tosf7V9fKbgbUeszhdNWEm5XY6ZGbxQR1ZOMAYn5oJjB?=
 =?us-ascii?Q?zlZ5BbnQo/5DAdo1BzhXhxksDhMrUdrGn/P5nm9m3YOknfY4TsU+KE15PIww?=
 =?us-ascii?Q?KRZ86MByWfvq8LXBKPGaHgA3sMWM0MsOXIwmCQA/Bqnd0doffjVg4lhgW/Aq?=
 =?us-ascii?Q?7ByZh/dCOMSWk8SGtK3tcgUazZ1Jlckx8AA/ksKFe+tGBNVuSKxQPWmgy7P5?=
 =?us-ascii?Q?EdagG2WUDMoOKd6hroLbYZNI4VsxUUv2gP1CG+/3g/UUp7zmnmbS/XZTjTi1?=
 =?us-ascii?Q?S7vbwC2mTNMvE3X35GW6LcDx?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c24304f7-deb0-4932-a748-08d96ba38835
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 10:47:16.1721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJ02QUU5LE9Lgdfodwr42y0a6jo0KRJmyLaMp/0np9PBUPSSflq1tgfbcabl6phhGhIrCixQ3W8msCH90Y/G0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4347
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>

I think this script is a little trick, unless you disable
it, it would consider it enabled anyway.

Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
---
 meta/recipes-devtools/gcc/gcc-11.2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools=
/gcc/gcc-11.2.inc
index 9fd30f5..77dd94e 100644
--- a/meta/recipes-devtools/gcc/gcc-11.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
@@ -90,6 +90,7 @@ EXTRA_OECONF_BASE =3D "\
     --enable-lto \
     --disable-bootstrap \
     --with-system-zlib \
+    --with-zstd=3Dno \
     ${@'--with-linker-hash-style=3D${LINKER_HASH_STYLE}' if '${LINKER_HASH=
_STYLE}' else ''} \
     --enable-linker-build-id \
     --with-ppl=3Dno \
@@ -105,6 +106,7 @@ EXTRA_OECONF_INITIAL =3D "\
     --disable-libquadmath \
     --with-system-zlib \
     --disable-lto \
+    --with-zstd=3Dno \
     --disable-plugin \
     --enable-linker-build-id \
     --enable-decimal-float=3Dno \
--=20
2.7.4

