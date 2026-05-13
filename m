Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 230F1CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 05:24:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.897.1778649845830945109
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 22:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZEjzomv2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=959349fd7a=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D3Lc57147001
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 22:24:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=2pkdhY2S5i3DvnGoBWkNQEQy/fPyGL64cwnt29YgS7g=; b=
	ZEjzomv22JCfFsLI/6il2TWO4pz8U0Pufr1+nQDqyj7nFGjED/UqlsozPD6RoGbx
	U9MeIORCOJo9fcJhjoJw4f7blSfGR6ktb9UnEf4/nRlb5QwflK8fQMu5URXdg0B0
	ZIsdESCncgRcg2VN4Yocu//40Tzfe8FIoi+Vyr1BkHWI7B1PREiyhigDdESXPlmL
	xdte65ZxRonBtwQTC/Aklrp0x5kbWaVopWrS+CG88hGvbdH/4fFU7Kpbvqi9UPhV
	ygqAiJQ0FcXXMfMwaknBzXmCDkwiiveS/wBY0LnRjHDjxEudwEGol2pWy54OAVAa
	HPARaT5rgsgi0skP9He0Ig==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011050.outbound.protection.outlook.com [52.101.62.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4g7g85yf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 22:24:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwsXgcFOTOqXwd0brv2582MkyThrDrU5u6u2snnNhhM011ey+qqYP42fd7BiM7bJ1PSn4hvoPIZ/SRh0iNuKE9hi4xJ3NSMnZbjL/rJRqcxmGysjb53u2ts8EcgpiFMy8N0AfjAZX2aPB3z0BmlC4tJ8etp12li8hEAXaiGPMGA2fKWj9bfDn4vsfOBdDwmpjeyTVxoe7bx4Jo2tT4jRTNdjcszh2wn7nMDn0hHlG5R3KJTPxACTMLNUvMaTQZP1357SJZvGSk9D+f8UBdWftwD9GGV3nq83AzxA/ZcJkRjvqD7xi0FUHNRDPyHAG7RZvFDGYNVl35qNWYukOapCbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pkdhY2S5i3DvnGoBWkNQEQy/fPyGL64cwnt29YgS7g=;
 b=dAZWuF0ZzU1+qOFRrEEWA4XN99rjt7MQps8LGOmApx9Ms3i8v+nDRaIdN+7p5MUyVor4av4WEb/lpsk/fq5US2bohe+tuJ8Ea72jQSXgHVe8PaScrOzLbLW/tVWGK0NNjwZ6HCPcqIzlKx2bpMyC3UYg4b+Do3ZBEeSons379s/Jw2cyWXok0LrJG2vfZKv2yYxyEnU2ghljo5RnKqsTIQXr016JKz/Gzhpl8d4hJJWqDwFOz6/K9Fv/vX7giC4SmSaxtLeP59n/n/SFxzwddeh/snIUs0jrC9V/mX0sWARVZQHH0GwLJLPjC34NJZbxtL2yiov76ojzpKetmlM2wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS7PR11MB8855.namprd11.prod.outlook.com (2603:10b6:8:257::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 05:24:03 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 05:24:03 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V5 6/7] util-linux: inherit upstream-stable-release-point
Date: Wed, 13 May 2026 13:23:33 +0800
Message-Id: <20260513052334.2271800-6-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260513052334.2271800-1-Qi.Chen@windriver.com>
References: <20260513052334.2271800-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0116.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS7PR11MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: d748537f-26b9-4677-6371-08deb0afd853
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|56012099003|22082099003|18002099003|38350700014|11063799003;
X-Microsoft-Antispam-Message-Info: 
	9onQNPPivjPE6bhpnhEgdcXp7JUFum4qDGKi3hzdRSEVqBKuCPXXFTO925Iji/nSHb9oI6GlvZVUp4O3ZkuoXJhiH21xqXxlTVa/NpB3I1syGVHl+IAnIIt0+q3fYoPKE+5jBQSG38Pn9Eubsy7kfIoOXaRdHLkMGHQ/gxEnKyvLMEUFf9tsNNKMURlaoeOzKXyYbzDv4h3COXujJn18ci7aAu2WlokG25biKnaynk9CZ2/O36jRG3a053+7oziB+NV681SUf8ifQ3nKf60xaLYgafJOmsSE19bprPIbRx2uGoANZnF61zsVQ9WLkee/S53lipMERghhzO1v9lSUayLN+4OMkiTJ4Mm9Z/HJfJX8C/cDHcuo90qRJWQva3oy6ySkdvLEvV2tjAs9LNXT6/zCZc2IuXEvlVb5tybVyYSRjXE7ONRf8GUf4D1On/KLYMI9pq3bOSPlo8+MDtcN/IpsRJgRGCP2q5ijqjmlSh9RGyMV2D/J/mOw4v56KWN+hHkEAfQsu4izbPnd/aQwrb3lAes6WJEMaAfD+VkLjyhxvlJ7LSjI91uNdg0SsUNvtXKS+3pw53PxM8MBsfWqQQR94wnxRWPkJ6HkvTCcT6FSlej0wMcMWM4d4XjnfhiEgf7evGwZWUufCUHovB5MIcF/QZJBlMoj9Uv+LtAEaIGViQ/3zmwCbEhqYa/dYbBiBPQV0XablwaE7U1ihtk6x/iiE8vNjX5EKR7MlQR8sEClSZCGhVHLCfR2yP3vblc8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DmWjejJbmCVInG1pe5QDEccNhEy+9JYv06RTbtTcIFfji6jNMiR29kRhB755?=
 =?us-ascii?Q?/xPFKnxv4PcMOohufRxVLXGrDzC1Ys0XE9y0RV98Wcki10p6YH+QOjc09wT6?=
 =?us-ascii?Q?H+X1oAMyhu4hu2Hj2j4+rmQxoDT/Scgz3crxXUM07FmHW8M30jRAQsi4IVlH?=
 =?us-ascii?Q?4a/nJ6b82rIF7xKmUWr+VP1stMhGdFGrnmwtY2OROUqci3Ldd9vJ/F86MQAX?=
 =?us-ascii?Q?CTM+58g5iDTLiAxiguH5mcXgR2wjEson7AdGB1RWaik30+goJFEt57UYktpi?=
 =?us-ascii?Q?oO81Rc6JL+IVl3IJ1C+DvIyftXjdx1xwChNd/YuRRI80pISP+i9niKUdApZh?=
 =?us-ascii?Q?KE55pJi6tRAbG1qe+S6kBS4AM2YYSL7myMZuixyRg9RD7roe1WeLfUeisjXR?=
 =?us-ascii?Q?tuE8TwfkN2afPVMe5okt2SVxbvbUPnS3kTQ6gaivFOfzzNreMHm18gydZs/a?=
 =?us-ascii?Q?dGR0CNsTni6Yxgp5jv7Y4qw/U+Chb+6FYj8pFDEagX4zd7T0Jb/twrJcqYMp?=
 =?us-ascii?Q?Hgtkxz66MeWnYpwMuf/CVDP2yv5Zj/Q981Ig/UQNpwzCMDstPpdcFBdZWlQy?=
 =?us-ascii?Q?b33I0NBj0VyagSAmNMjQgnk8XsDT+M0HxTMzmVal6AA/HlEguveLhb24DGI4?=
 =?us-ascii?Q?lhJIbK5F1NCKI3QbYAJYUB+wX+mfULYgB1JJ+/m3SARIC+LB2LN8pDcTe2HY?=
 =?us-ascii?Q?OaF0V8Nr8pZpV9I5jcDhfcvyjnuRqi1fCJBpmnlNdMfrmpH/UaH61ziI0TGQ?=
 =?us-ascii?Q?5s2VjfJ3NLjE9eki2nOYYiZB0U/oJtEqCQ3gfu35xUif0GUaTsn7i1Wid5LB?=
 =?us-ascii?Q?J76SoSElKqmu2jIHow8ajoyKWQB3bxf/B2Q/VjtL8J6wza9fLFWDkZ+qlouM?=
 =?us-ascii?Q?QrVIhbJJR4+vHET9wliW1WMqRKc+bBItflq+RxwGy9sMiOxH7f8F/BtrFP8Q?=
 =?us-ascii?Q?kASmfsMy5d5fivnSTSuB2Gc5SmUkjV0kgWj9GXdifUIIqlmUf0r7BKuGf98M?=
 =?us-ascii?Q?fEaKw8X0+tR+jI4P4A4UlRAAkjq/ZDW++CTZOor8tQjgr+lTAEJtnACrH11z?=
 =?us-ascii?Q?p+tJ/beaSwYB1iRSRtw1VBdohK3GRf/N7cyOVswFME+v0FTPc8L5zYm1sllS?=
 =?us-ascii?Q?BWVCO0KjexjlWBhP0/CU6B9Fb41f1ZpzRuwDyUtpATFVVOr7avFnTUSzB+VO?=
 =?us-ascii?Q?yRUBwrttJW+ylXov+YWksSxC7zChfzLnGlfEDJhp9i8uVBd543GrD2qRumEQ?=
 =?us-ascii?Q?/zhwxc5q6CY4+eGPgTo9m6a8H/RJ4WZabKA0mRnaUvidJCO+piieFgDOzZy/?=
 =?us-ascii?Q?wD8lHLHpWBRWhI6PL8wnG07PKYTVPUb2duVJ8yzXSoMsq+hdX/TeU5PNPRbE?=
 =?us-ascii?Q?/2IB2YbHkgAK9HZtjx+dwbuWdIqfPeuYz5Ue//vCL7mMXz1ty6uChQakm/OJ?=
 =?us-ascii?Q?STfpFMASY8nZG6yQ/VYj5LjujMtaEHocHwxmlEYvw09MhbjNe30qqrC1xcEM?=
 =?us-ascii?Q?T/rIzjE98IDrv91EC5ZpKx11wGiHQJiEZ5vmI+Vfv7zrTBTMbmRNyVY+0EmA?=
 =?us-ascii?Q?2S2hv/OvdKOmXrh86JO1Ca3Js/f9hbcV5xa+6yWv349FonaJMvUoQmBF8tNc?=
 =?us-ascii?Q?BfC+M/VDBS1Ux8Bp089ohafQo0BVXJsv6zxfmhE8HOHWkVLG+QS8gbhLNoWN?=
 =?us-ascii?Q?CH3Ij+0VQkCek6Pvcygqy6U8BavJovnOlctiThCohFT1G/4+hQbzapXJ2Um9?=
 =?us-ascii?Q?I9yLOY9MSQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	SMUcGk7drmBi0El3VrOy6oHo5cO+SuyuAF0sy+Nwt9Nxu6ZpJottBL/fmYHpij6oKU/dZ13JS2j6XCPt8DUOuGyzt74RYd1gjW6/4F7sojpWkbyH0qKm0NhzzYTzlZdg1El+CDskNqn01Moe+4DfdM1nSVn2kFFhGhbYZ3gnEf0OZXNskJg0lw9TeW29/sPjDavrdfVcPwZXOGG7nULVPc2uVgad+Y3KU34Kg1A/tMeobtfza+Kv+nx4YNg6of1cyhEhGnQzhCob0nLYERkUdae77noEg7pe5t/pbYTkrwZXRpFQkeXqHW4HK/0AaKE1ZxSjJLhij8eNROCTF5CLig==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d748537f-26b9-4677-6371-08deb0afd853
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 05:24:03.0691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jx34C51YFpJtjXkDXb6zwaIDc7Luij1MPDRR2LlV/xF3njxy/bIeGbxFvJSJCOs7O3cu9kyMM90yN3fXcODWoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8855
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA1MSBTYWx0ZWRfX2xOFSulsmjgC
 HboK8dNm17I2uYJt05sNEtQbIx/bV7WW050pfaaXSWIDkb1etDTQcjfK5H58G/gkBTGa48NszNb
 hvBycGeD+7+FNnEwaZ4BY3HzEDIM3EYXU7uyFGXumchDKGAbIpXlkXF62KAPNoY6T+zpJ5G+qMf
 Y6D9JG2e51uv9AHCDklbobmT4BV2y9RQknb47kbExp0cFXIr3RpT/OremBwBZHIUEp9bIFo7Mql
 GvOMyU1a4vdg2GT4ZOAkZd+mACSIdcJdTZ8vJVl88pud2/ovyoG29ejBCrKuJPgU62wyEIicIdR
 RV0ZeV712dbGNpNjl78DW5e1TvdmsRsealZ2L6j8KOtObnFi36HmSjDlmbAJEDKXGdnyL4wfqNi
 p7sIg5vybsqg+sWWMx3yNj1wHpKdk2tHXwKsr2BatDRBHOILRs+xnJl6AMZABUi/24fCf6W/X2y
 LUXkEaBiLE2MUF8APuA==
X-Proofpoint-ORIG-GUID: dnolhZ5o5vIBi1sEBsppbCKQWwEN7TJC
X-Proofpoint-GUID: Ju6jQ9cw2ww8PfXSNIN9CZQFdTZQrwqO
X-Authority-Analysis: v=2.4 cv=Q7jiJY2a c=1 sm=1 tr=0 ts=6a040af5 cx=c_pps
 a=Vx/W+/sNOQWsPBnrpFcqzw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=pmzwAjFSpYc_cExjFc4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 05:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236925

From: Chen Qi <Qi.Chen@windriver.com>

util-linux has x.y.z version scheme and the bump in z is a stable
version upgrade. For example, 2.41.1 -> 2.41.2 is a stable version
upgrade.

* Evidence

  Its repo[1] contains branches like:
    origin/stable/v2.39
    origin/stable/v2.40
    origin/stable/v2.41

[1] https://github.com/util-linux/util-linux.git

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 0235862666..1068e24b76 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -25,4 +25,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
 
 SRC_URI[sha256sum] = "3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed9b50ec2b5799e58b"
 
+inherit upstream-stable-release-point
+
 CVE_PRODUCT = "util-linux"
-- 
2.34.1


