Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711B9EA852E
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 15:09:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40492.1772982560256413609
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 08:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=D1cDdPnh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75278c0199=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628EQ7gj606391
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Mar 2026 15:09:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=FiuAY+RQdbfS/Ltm4WrerjHk5HnuK2Z7DbVMXa2MjI4=; b=
	D1cDdPnhv6ZHVo8vOGwbVoh4D1Ymo5C8XZsVnHNIiJRySyBwgZME3vNp4T9RqclM
	vO24Ug13nUybX+u9hyFP15kIraseC8LBGmqm1pgI30I0J37toZGiHOjVrc+hrkFU
	y56dJCEm0/MDRDarjMhMjGsqMlocb0Wyud+s65MbbPEpmpdcfQJCmgxakpXwMrkg
	yPqefRbzi6IH8xCsKiptT7na8hJkxKixb4gBXHmfNFK/8OjjX1hCBqQL5FLCMXx9
	pzA3VGuDtedPKW1awIztBmRe60pnizGrzF7ImkeF43ukNXIMSnLDE13N5VnG8HSJ
	JPAP/8PRoDmt3fz044AVTg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011054.outbound.protection.outlook.com [52.101.57.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cr97v948x-6
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 15:09:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1XJ1bmyKjsY3CKKfySYyemGJA9LDf2KVteNWMCg2qW5w4fpBPftfkQHyH67pq75ql31ShlVaWk8AOtx3Z84TJuh7Cc5DGNNwRLppW7AuWpJeKH08Lv7gRgvr4ZqSnGjiMkdruj+DqZgnfB6YkI28jCXOUZlCWIGZcpn70YVLSaHDgU87euiQGBo1C6qnfbB/KcRKJAQg9Wjx3ofSO8XK3CVh3HKK1DNFAYIeOjzxo+/hbrZr+nDrSFTG5N68EqSLGJPBd/QacDnlaFeYY1SREOmKvR2VmIl7KilpG8VjGm957fVM8Sx8MOKS7YylQoqpqNocDsiqf6ni/t8/k60bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiuAY+RQdbfS/Ltm4WrerjHk5HnuK2Z7DbVMXa2MjI4=;
 b=jb21/EzloYPjd7ipb8V1tobp42QeW5G/maZWDulOeqP1JY7rRg27YVhpfb2Y7xtu6bHTKJ4ujrV+f0pDFRsD8KpD+9PITKY4shsHMTZ4TM2RDXHAFhV/ydTxaYDl1UMK9QghyueAHrfYaMKtyz+vPZraVTgprGAqW+sQqOYZXRMcJoJJtYYptrMmD7ayYUWosofx3rR5q1UJ23ehDPEZkZ5bTqs0/RMoiXJ/owrdd/arHfUc42Y4UKMUpkNMkli1O7a5dYYKvWQcmcnbDwVemmOTQM01VtquzfLaeYsNB0dRzHVPccjttk9QnKSilVWDgB8HqsNybmTV6DogybrXDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 LV3PR11MB8460.namprd11.prod.outlook.com (2603:10b6:408:1b4::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.8; Sun, 8 Mar 2026 15:09:15 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.20.9700.009; Sun, 8 Mar 2026
 15:09:15 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH v2 6/7] barebox-tools: fix build failure with glibc 2.43
Date: Sun,  8 Mar 2026 08:07:20 -0700
Message-ID: <20260308150834.2508331-6-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
References: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:a03:331::7) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|LV3PR11MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: 9450d172-8210-4a22-0145-08de7d24a9aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	EEtGlKbM0bYseAu7wp5w+cbXM55yfa+X0zPhl8xBjxM+TPZbyNxjLN/ipReBcq76DNGH9G1+kgffKu+kgBPUi8pGYexgqbIAyB237Mkmf8+MjVe2Wt5+7MtwkWb4oyL9sMPHEjA2XP+scOyGnoa5xT9fqRwOe3DxZJNKe6gcZKuYr4zDRlqF/2aofCrxfAfm+hQTJ7hPwfQE3tSX7/ALhRg2YaBstgwK5Zt2EryUPGhN7qgyallZivb2SU9VLbz31lIcwC1IUHFqJ6L0C1ebBn+WAbjA4pBJUFuBBqno8r0+ZeSVxlHF/NTJhleZnvDQf/bHYawvpLUt74ReSPQDWB/mh5wfgX8nTzJa/ZFyj/o534be65WvA1kkHKDnf7rAaW09d3ux00htHdittVMeXDc+dVUCPA5Og5edqNitabUq6lW1aAoXkhHstkdU+1ZAt79wo797o+MI8EpvszplsSqeiAc5ENUvh2IMKMjtr5sJvOddn02AaLlNZ4CdE3laZC49SDUZ1TZgMD8LHif0pebllBMBNqQ44zISrWcvh8UJ/m3myVZP2xHSC0LW+QhBRthMSW/e8VCkMAdkzWhdHm0MwGRRLm5ONRomMbpA/7lHsTtG8+jnkoQbu9m0Susawvpa9L8b1ljiXrVoZ168pq6u5oP6vuBvtyTK7lu0D3Yv9dltkEK+rO+meWjG6qouNNCtgc1a+HFCZzMGtrkisBywXwTlu29vIENQv8Nf1/zt0Vui3sWMSglzQQpuZ6vNHV2eXcSlj64MKMTTON+4EkeRZrRGMqj3XoI+KmwEtsY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ItJ7pHKWerRlPC5XTCHfbyXHSIdds7Zz3WrTyLMmgQOm3lf3ePUy8kzVx+3c?=
 =?us-ascii?Q?imBPZ+xKxhJYtK+qmie/JLkaXv45OBPgs2jVYc+ZK1dg0Y5oDB2QXfcBNfHW?=
 =?us-ascii?Q?J8upX6Pc6f376trhQZJskFFR27OURI6yqAo6lZaQqkbSoXeEjQKUJP6Cf5r4?=
 =?us-ascii?Q?qxW3kNJO5TRM6ELpe0dXxQvxjNkU3s2Q0cjLVUMr+bXPR8Av/igcWxHOFNNh?=
 =?us-ascii?Q?Fa/9fCrBw3wA1BXO6wtygg1gzbmiskf8gtOviOs2DyFdDeRskG2Pig5046Sd?=
 =?us-ascii?Q?aSNyk6orotTlp93ZwQ+bHAVFrS3PidOJyJD829GPoG3JLI9oOd6dd8rMFEeE?=
 =?us-ascii?Q?SAfJZnYfEdG54RWTZm02RqJy+6QkwxiV6UfA2d7lFyc99lG6XbSp57RZORLu?=
 =?us-ascii?Q?1APV/6iApiJmfVnpe6jtQNpGtMLSouH4iwgOpj8jC8tsF4Vs/tnSDnNgDJ1c?=
 =?us-ascii?Q?KuDwgx48AZ0Jkmnr8PsiANKPQgV8VlaVSE156uTMaTXX0mFQlXwUBSyvVw9D?=
 =?us-ascii?Q?AmyBEndUFMK3ngavr87/LP7xof6nUvEm5bNLRQX5eqXM+YpILt88NQh5wOBQ?=
 =?us-ascii?Q?zbioBy6e1lL4HfmSqpC0xFGdoVD9PyafmQooUmgRd4DajKDzl3AT+UAIkNrl?=
 =?us-ascii?Q?OsdHTSTN70mMO831ZDyyI3Nmb/JVS4iEp8b0hn8IeI5ZqqVdjhYNc2V2Rp0W?=
 =?us-ascii?Q?7TyHGyygofi+CXWIl0BAMYi5ENgGPytqqwxyUIhUshmpQzUIlYXsxHI6E4m+?=
 =?us-ascii?Q?PQAcM9V0fvjemP1aNZIurfHm5wTDpzCkTMryNX9NI/Ql9vWM+Se9HBELoXBY?=
 =?us-ascii?Q?DORJyjZTvxu7bp6lrunIToLXGEiCG2tCgDgrL7aZPK0Dzrz9ipOWvUvzSHGT?=
 =?us-ascii?Q?ajuw1efqktP2S6eoBcTmpmz5D41bvvTZGgaJTXZow2w9pCHGjH6NGnSpiseW?=
 =?us-ascii?Q?R8zQEYbMXoQGkM6muHMnFiTWwxuFpRrcUj+in4cmLrytNYOwuwixVSj3l2ML?=
 =?us-ascii?Q?ZwxynfsBzLwA3fYBATsXymVawtMScPI7CGxB9OOTXW+XAclHSF/qluS/92Xr?=
 =?us-ascii?Q?2sabpjI+voQu5TJSg3umuO9xw3y6oH6zO2UGDtPPB4Ptf/v12X9p1a5O7hjK?=
 =?us-ascii?Q?2cP2K0CDt6I75/pylRBKrwVCtyp4SrcELO3QjqxyxAHlwxWJbKKsW2UEg+5r?=
 =?us-ascii?Q?MIxpoMQYtIqQd4V0HpC+qGwtW1bnikvX/yMtwxl5vOkB/pAaAWYkMad057ut?=
 =?us-ascii?Q?yMvy6tJ4/HN3po7Mba3tDyv7kCTEmR3iVzt+8DqgAC871csNT/BqmUYLPqm7?=
 =?us-ascii?Q?YrFLx+FpkG4fJWr/2CyG/EjpBeOIuFE1fnM3L4fp9LrVwFpCYo8JF7tw3PO/?=
 =?us-ascii?Q?Sn9hrkbj9HE8h11nq887CS1WwYbG2XdaNPGIo4iAdTNuYq0qTQMnn2xInGMw?=
 =?us-ascii?Q?5HaTxj6cm7eJQ7ZY2MR0fZxP0LICBdMh4doPMY087xDUvCXl1FvFDMzd/52x?=
 =?us-ascii?Q?p4nDz7u324/uLe1oqcfTzV7Suf/YhBm9V+JFHMCynUhi4soS5s3kOg83+Oa0?=
 =?us-ascii?Q?3RaARy95ttox+ZouTP7rJjR9H0FLPdlVqkEaLP7Ppa3S0AOlQ6THbdgxJdb1?=
 =?us-ascii?Q?Di33cdbE6qO50cJJkaJPRk7kd8Q4uvU+keRRwMuYQoiLHqJdY4h3Haic/Ft0?=
 =?us-ascii?Q?7g/AJ5VKrZyDDunPlcuzhl5PynxwcdwcVrQQkiZdjct6SPfLz13rVETdT2kK?=
 =?us-ascii?Q?nDehN/CUeR6KU/vqMBIX2czjsx20PT0=3D?=
X-Exchange-RoutingPolicyChecked: 
	T67kgRhi7eaDA+ANTFhI8pAVJ9KEDUkXA3ER71x/86mWeUrnPvvlMiyW7OjRUEUewrc2SbpJmjSFuJGY/sDd1tisnZ0U0b0ObPzrAtaiPDB8KYfxP1fsb1dhvjd32h7Omuhr3rcyLnJgdpB6HuAN6MvznIvqa0Oj+y7vxr+s3hJaM65RPJEbiwthbheN/q5Rjj1ZJvZpVfB8lpXCqb0y1Ad0j782b5RJ1DoTgIWNUkEmOIWPbZeCYNY3tCnH6d+qZAHV0xq9YuNKwZOYvHzRs610p32co86Vtr/tFp4K/12QacAv1AhDi1yoMa2UP1N8xphvM27OslU7g5EyP+CRHg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9450d172-8210-4a22-0145-08de7d24a9aa
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 15:09:15.3040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vg0R3gOpsXLQmNrLX70eEk/UOUkuVkKwrix4oOjeXHtAltTwxQZAMSI1u+F+HNwl5shd1acuwUKPTKi5Raovgt8kk/PPjG53NnvGyMY7K18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8460
X-Proofpoint-ORIG-GUID: vVI1krLUEKM4YcNSQMAFEjqhUC-LttJh
X-Authority-Analysis: v=2.4 cv=B9a0EetM c=1 sm=1 tr=0 ts=69ad911f cx=c_pps
 a=F7X/6K5kN+zqVHn88SdM/A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=A1X0JdhQAAAA:8 a=sqegTYKcpFJ6_3p44j0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDEzOSBTYWx0ZWRfXx4SGmKm+uV8V
 6BHSLCDFd14chDoVjXfnbw0ObtSdCUQ/PP97HBiY5sm6HzmDCIWSUbRIghe/XUTcbPKGZAVLMrS
 G0iItL6cGP+gg3Kkw1FVwJmm12QcJs4i6QfeGsZN75I/tChJHwpUPIs7Vn/tdzFQ5rAiYU4/rAH
 rzLz2s7t1QNPRosghYgzhR2M/N+tgtn23JwLDRDPg1enrfupIShd2+IxfKq94tYoxSmI4aH3tWj
 yugRHLWcoGru8c7obPhrbOZY22PuKJf9t7hSugWnDuvEk65mQXN3+K6Al09edMyTi44MeuDzNAD
 U5S4fKjJU3xn8Z3uNFptrhhJqbjhBFI73wW1Ala5iFWEtf6BIr8sdz+vmvRDdz+/yBeo2fIca3s
 hfE9Nk/PmPvQ+TWGHunco5PtZbl+zMA61tlqgY8YdFKwwESt2xy89dFsB5q8hhpz8nFLROZNdgv
 GvpbG2ZJkjLL/oCXCfw==
X-Proofpoint-GUID: vVI1krLUEKM4YcNSQMAFEjqhUC-LttJh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 15:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232658

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-bsp/barebox/barebox-tools.bb     |  2 +
 ...x-tools-fix-glibc-2.43-openat2-build.patch | 43 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch

diff --git a/meta/recipes-bsp/barebox/barebox-tools.bb b/meta/recipes-bsp/barebox/barebox-tools.bb
index eb327306d9..1459f48db2 100644
--- a/meta/recipes-bsp/barebox/barebox-tools.bb
+++ b/meta/recipes-bsp/barebox/barebox-tools.bb
@@ -2,6 +2,8 @@ SUMMARY = "barebox bootloader tools"
 
 require barebox-common.inc
 
+SRC_URI += "file://0001-barebox-tools-fix-glibc-2.43-openat2-build.patch"
+
 LICENSE = "GPL-2.0-only"
 
 DEPENDS = "bison-native flex-native libusb1"
diff --git a/meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch b/meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch
new file mode 100644
index 0000000000..3f42ce76e8
--- /dev/null
+++ b/meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch
@@ -0,0 +1,43 @@
+barebox: fix build failure with glibc 2.43
+
+glibc 2.43 introduces linux/openat2.h through the fcntl include chain
+(bits/fcntl-linux.h -> linux/openat2.h). This header expects the
+__u64 type to be defined before inclusion.
+
+In barebox scripts/include/linux/types.h the header <fcntl.h> was
+included before the __u64 typedef, causing build failures such as:
+
+  linux/openat2.h:20:9: error: unknown type name '__u64'
+
+Move the inclusion of <fcntl.h> after the typedef definitions so that
+__u64 and related types are defined before linux/openat2.h is parsed.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hemanth Kumar <hemanth.kumar@example.com>
+---
+
+ scripts/include/linux/types.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/scripts/include/linux/types.h b/scripts/include/linux/types.h
+index 5b01333..33cea19 100644
+--- a/scripts/include/linux/types.h
++++ b/scripts/include/linux/types.h
+@@ -4,7 +4,6 @@
+ #include <stdbool.h>
+ #include <stddef.h>
+ #include <stdint.h>
+-#include <fcntl.h>
+
+ typedef uint64_t __u64;
+ typedef int64_t __s64;
+@@ -15,6 +14,8 @@ typedef int16_t __s16;
+ typedef uint8_t __u8;
+ typedef int8_t __s8;
+
++#include <fcntl.h>
++
+ #ifndef __linux__
+ typedef long long loff_t;
+ #endif
-- 
2.49.0


