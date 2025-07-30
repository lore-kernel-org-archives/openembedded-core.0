Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B2AC87FCC
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 08:48:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.30596.1753865324613359068
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 01:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0306c9daa3=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56U8SsZS2904501
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 01:48:44 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 487fwtg0k1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 01:48:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DO2RH1spXdbyKAI9YMBbKcGxGwuTjTdMs3zOKQlteEMVrAW44bGsO+sU58kitSVOCTdKWVtcW2itJmWtWBbrQ6O3CLpRtyGZCJjoU7GRiNkVQzfBAYKPxOmOTTMZ1P8cxInrA1Gcfcv8X1CbeOGwrCuUbtMmj4Uwfq2WCQdAGjsgMnubiebkfQnNqqPOKlXet84iIkI3dgz/YYIxzpf8JaE7wTLOhw6x63kiWLsKN1U0IPo6u1EqVIeQubOJySC/hxoeZ0Gm6a8+DfzJ8XWGezQiE6qocTvyh4qQuwaCqNWrHOmDpmoHgA670f9oQMb4ugZ17uGcsDbH6cEap8H3ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MV4ZCZDx6mPqdpLb3hho9kf2WnCOG63seqhb7xui+8=;
 b=saVOzlTaZZ1nYC/k175jto9M3iOO79Ck1JMwJAQMLETCrGbxB4ezYn+dy9ylugS3Nu0FwBw3gMpUVEpmOpNKQFFszL8bx68QB9dMyg3R7xXnyCE4ZEXk/CmtMRhtv+PAP7Fu5Vtf7vJbJKmTTwl8bq4IWH/UQ1yH3XYaBzKBKMjfM/dGP85AGK2tx5iKD+svHi2E+dg9e4H7CxyV3+aRRxj7rS23gRQ/Pek6yZ4WRCS4ELUPDIfwW7QB4xEdUgBXtmzA3Ji5RzRo6zT5S9klzS6yUuU80paSaJfaIUx8VUUcjFiNzVAQqLeKFUGQ4Deb97YVStK+9Tku3WdCW5Ld7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CH0PR11MB8190.namprd11.prod.outlook.com (2603:10b6:610:188::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Wed, 30 Jul
 2025 08:48:42 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.8964.026; Wed, 30 Jul 2025
 08:48:42 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2 2/4] toolchain-scripts.bbclass: Support target-specific environment setup scripts
Date: Wed, 30 Jul 2025 01:48:16 -0700
Message-ID: <20250730084818.27093-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250730084818.27093-1-Harish.Sadineni@windriver.com>
References: <20250730084818.27093-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0022.prod.exchangelabs.com (2603:10b6:a02:80::35)
 To PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CH0PR11MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: 10ae658e-ec8e-440a-f55f-08ddcf45e306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RqfTJ0HwBdo3F2gOUbW4Q1EEqXFMlEe2CDvcw3UqVE1KXFBrQrcvI4Llfxl6?=
 =?us-ascii?Q?K1K0kpxa0fK6ZkPWEEoftRH//jByNpv7dli2q6clgXcSO9kqKeNUrC6J+VQ9?=
 =?us-ascii?Q?7ZRhHAVO9b7IKo5iFwjOD+WLIxu2agMTJBzs5MkvuuCBa1JKrubUjKmW23Dc?=
 =?us-ascii?Q?1l5F39H5ccLFHm8NKEljwVg88UC6I9UGYsw1X9hsoiSaYw/5Qs+n7+zqNTxj?=
 =?us-ascii?Q?y+cw0Uc+siP8sa8ycJ9R1W50rUKMNYwDDaDOB5S42KRgWC+yKz+RJFvAdcMr?=
 =?us-ascii?Q?ha8KLY7ovLpd/Ds1OecHO95fuJ9cRXwY7z/GivxK/LwFZ1zsbRWGL8nT8iRF?=
 =?us-ascii?Q?UC6/70WWXdrN8un0CGwomSR96+VWIw2rufHFl7q3m7aw6LizCJecPMExLr70?=
 =?us-ascii?Q?zyXkeBIlj/daL6L8yKWI4OkZ6g5JTzyfHV7zD1sNMQp6yDicef0l8/9qK4da?=
 =?us-ascii?Q?4evrU4GsglyPYksU4TKBdLFxQPFmiRUYjGMHZRZSA/aXSaNRHVkkBh997qyW?=
 =?us-ascii?Q?b/PTLRHFoxNr2MFrenDeu5dbJeUy6uJ2FVJ6AA20rV6cbjed0bwpdk8Ctd2q?=
 =?us-ascii?Q?qSDRd+H0cQLhcJfOfPojoqe4qXjsszfXWrDkkmrDYrvV8I9qMxMWUJinNAkS?=
 =?us-ascii?Q?N4u2wpxKf2x7r+NSMJv6rqKksL5FOLCuC9luCEAuPn2vPqUv8PVFJbdu/kEA?=
 =?us-ascii?Q?AUp8iiKdbE4XaVK7pMMjw+XjRuSnLBmv/bZJGyO4o0QzN8z8abt2h5JX9IBO?=
 =?us-ascii?Q?BaB/Z6v3ZPR0HpYLvZlOHhfWDEDi0Too5IQEI5aEmBgp7OHfwI8bB8l2R52A?=
 =?us-ascii?Q?hkX+HEfNf05bwFJmmO6MEyGe5ycf+39FZx67N0Xgqi0LlSBY1NfPRySXoKql?=
 =?us-ascii?Q?4K8TJbG5rykoselXljX3zQ/lvnASZ+hP/F0ZqRzTXlS+AbiGAcKKtku4ju70?=
 =?us-ascii?Q?N5jQCtkkU2JY6smRNVwiWLxDcnRcj76kFZxnfYxrwsc+58qvGik0AKP2KXJZ?=
 =?us-ascii?Q?sPOPFDwZvtTSNktz+Zb2lP88OR1ye806ZspB1x+hVLjUtsTHGF8c2DfYsA4V?=
 =?us-ascii?Q?QnyB+z6yfWCgzw5hhWau/Ia1Myj4v5TvVY76kk6TSx/oW+5L1HRBYjOEI4tj?=
 =?us-ascii?Q?K5TUlLMtSOAK9G2IcIOn/dYLsfi6SwB8q3dUU5/sEd+GvEqZaFN9b3kM9AWc?=
 =?us-ascii?Q?YNNQI1iXX2Chwe27F1/MTz4gQlV4jt0QxBKsPexR/wc2Bz1Mz14B4o++ipe1?=
 =?us-ascii?Q?M5DqSLmIrtq3KBpNwvgadfmr3IcOaLw5wAQTqxdRbbZAZSufTSzrJ33zKD0z?=
 =?us-ascii?Q?9h6rvOEishCi0wDeSYUCbXC1c8QHvpNdiJMhGCvE8LUICr+9NVexRwydDM9v?=
 =?us-ascii?Q?sBYNV3MiXxlJAdJ6LHrj4vEAclq95Tsx3H6ztckGK5QcCfqynbwApt3Huvtx?=
 =?us-ascii?Q?soNct9iyMnGcZRLMOAX0lVi6GwUssUV+DqTlBR0S1qZidGMG3jo9EQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c19otT5IbuQh4lmRYPzJ7ufuqdJlxjN0rk3xcfdVW81xo5y/5iecySnyc5jY?=
 =?us-ascii?Q?qvPen0iM1pmDxOuofU47vuY/rE03XJqzgvCVs2XaNhNGFGAZR4y2AFcnCaD1?=
 =?us-ascii?Q?lzVAk+R96X66jmNqqEGNBFFV9o8pdtRGZhapbCuJHvB9OlTeS2XxMiCi/zu4?=
 =?us-ascii?Q?+n6cwxzish1TX2P6JpydzUVWaBEo9T5VBXbiaTMFPe/RUp6Acdh6QeryEnaS?=
 =?us-ascii?Q?8xUPGefTN1XBxj3vlS8gjQ2PLqBe1gRUUgo1uL4s8M/yyGlhWQkvGx3AsBt+?=
 =?us-ascii?Q?VRBo8BOOVukRFnTOSzH19LCpl1TAU3yO2+gBWFK9Ls5jyTge2ra9bR9XnAn3?=
 =?us-ascii?Q?KxNwTu8BA7ckb1O5TtJe6oscqSVqnYEzKvf6R6cHB0/Sf8JvTmL8b/aBNAOZ?=
 =?us-ascii?Q?WTTt/V6wXyQi0F0XnZOWVplxQILA5UQsZY5lijSX9mfFw60BpTxVflm3Beyu?=
 =?us-ascii?Q?fpc95eCP56bAV2LyZDksThbDrU0Do7HgjNYXFLzeSo4e03vjoBMd84PRlll/?=
 =?us-ascii?Q?3Z06uSBj5APny/QaH/tuGvFLSZdlNAgZJ/Yl9Tctg4C7/5Q5rTbNgZdZYRrd?=
 =?us-ascii?Q?AGNU2wKmlkimeWQf6+VsNp8XmHC7vNHmmcleCtqOpZhFv807ocPMpe0xarqk?=
 =?us-ascii?Q?1XSjtsG6OrnFzRM62yU9lVBRei0cK7JiJxr+unCznpZ7turzNB6HDGseZeR/?=
 =?us-ascii?Q?L4pSqhjldxQ0gnXcB2zN4C9HoX5Ro4dz8xNo6GaIUixovRDui3Mzy8W5WY3g?=
 =?us-ascii?Q?sLxh1fPM89B5ZXJgXHQGMNHCMj6Xgv9oBkTPuu4/rCoMGuPYAwPu2u0sx9Ex?=
 =?us-ascii?Q?tNe53Urq++k47gEJ4gzvZg4X3yAQCGjv46dI4dCvnLb3ok14uMpp/tuGzJix?=
 =?us-ascii?Q?32WGyUZLK4+UXEqIpUqrKmOp4u/O19sm6l4LU3dFaGtuIqheqagIPw6ZQYmv?=
 =?us-ascii?Q?SC/7Ba7L8knUcsoa6uGSKnPi5WsFqb7FQZCQEnLnhaPGeUhtCCG8YWXTjS0z?=
 =?us-ascii?Q?kBwzmR3hQLntJxSxe203M2b5ZJp/yBzNbfxtwEygXc4uf98a51+zTScpXsGj?=
 =?us-ascii?Q?//Lg34YlzZpXF3Vdg8prx0m6JMEf9/1rf4YvYtYaRb8n7Qo2G7Div9WDRPKY?=
 =?us-ascii?Q?I5Gdp0Il5lw7p29Hvtfnd4S9OGtbSVRYQSWyj2EMM3ngMlHVVCyKogTZuqAc?=
 =?us-ascii?Q?t9lW8b+CUx78k/cLhRWnhOll1lrK952e3ZXyfwUFWhSaEK38zk71vtOUoCY0?=
 =?us-ascii?Q?IbKYV4R+bcm/liH9OlXOOcl0jqYpzT+7iJApreyL7S29JuXZSy5o4oAQeZCb?=
 =?us-ascii?Q?9QNQag840DaRL5dGSvyVtXh1FoZImxS9CdWqJqXkxWPg07AD74NSfxoq9PyH?=
 =?us-ascii?Q?l0ZPMZVM0kxMByP5YuFewAMxg2MGcPFa9kkGNjfomhjoHKAybs5LPNvAmff3?=
 =?us-ascii?Q?shnEdIwIaul8IzW3b6bw+PKE9gPwlI9hzWe1EHr63XhGAQS/M7VtYlMlcHHF?=
 =?us-ascii?Q?QDkDacQvuvD7GLrLIdhv+jLnB7gcbHd0Pfplrpay7suUCfh1b1jdaqB3MqPF?=
 =?us-ascii?Q?4GVMQ0VmYRn5jW9qhBlc2LnXt1HahVyRDMESVKUY4jkBXVHMpRm1YPiN9OAT?=
 =?us-ascii?Q?DA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ae658e-ec8e-440a-f55f-08ddcf45e306
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 08:48:42.6490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zb+JCbOn/RL4XvJwNesn6JVsddcnVAq95crbQF/XjKQluvO5guVeOR6ibNnzWUvqNkzycPTaxMByOe/ywxXe+JDNWOdAJEPn1Mkv5JwDrcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8190
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA2MSBTYWx0ZWRfX6izIY/meOCw8
 tUn7iU4d28ygPW/rHXRtPG+omBCiuL1E5dr83newFoNf4oru2qDeG2yIWIZZki+ObIrIh7ar+Dq
 ejAC0EiYzJph5tKDhoFDeBKfj11YnEbSULJK0X/sHR4s58Wl9x1/b6FTy+vaWFFyn3KWmgPSybS
 47aKaXxG8FRoinMhC3enzp37rDmmu+Pb1eFOFrSl8m+EIU7dT/cpBz4j4G82YYshTqo1xIWHE0U
 9RqAP2SngweWYiPloZsFuQ2IMZP/w/V2ufpvZpZmRu9LOQoFGrBDJ1XmRPMuCGWo91va2QMXuid
 NJzCEmfskBvxTIzk2iajC9D2CjpUD80lrjKCYlVbypPaDcnABbyIDJcuA/D6Lpy3qnH2izeGjKN
 VmkiGl2I
X-Authority-Analysis: v=2.4 cv=MbVsu4/f c=1 sm=1 tr=0 ts=6889dc6c cx=c_pps
 a=bu/IKwmYeS9Jib3vFHOoZQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=k3yipUoe5h4FhPZAmqYA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: smad-vU6lu1AdTo51WnY_9izKInhp4Pg
X-Proofpoint-ORIG-GUID: smad-vU6lu1AdTo51WnY_9izKInhp4Pg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507300059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 08:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221110

From: Harish Sadineni <Harish.Sadineni@windriver.com>

YOCTO [#15061]
Extending the SDK environment setup logic to also source scripts from a
target-specific directory `${TARGET_SYS}_environment-setup.d`, if it exists.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index 5874a48af8..765f2d8b22 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -171,6 +171,11 @@ if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
 	    . \$envfile
     done
 fi
+if [ -d "\$OECORE_NATIVE_SYSROOT/${TARGET_SYS}_environment-setup.d" ]; then
+    for envfile in \$OECORE_NATIVE_SYSROOT/${TARGET_SYS}_environment-setup.d/*.sh; do
+            . \$envfile
+    done
+fi
 EOF
 }
 
-- 
2.49.0


