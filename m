Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C503C54755
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 09:31:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9361.1747387907015127032
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 02:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=723171ed67=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G2GZSR014858
	for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 02:31:46 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46netchg16-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 02:31:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tV5M59le5qiBY0yWAGjC+W4spgD8rFGFVw3qWJnREnxMtLd7UCIlNUM4pP/w0e6W12rT5B4n8q/tLoF/i++hekDFCVuRICLyo6Dx5MlvxEV8wiGFKZZnjBxqc2SqwgKmiCAizRN/x0LLlTA3W6nY0wKV90QpeJLquFkMi5v1YeIEA9uWX2FfZLkiV4sZNGZfQhYx2kMy7GbPaFWvNpW27dW+49n9LaEO9wN1eZy/fU1xtndwe9YXEFJJVo8Qf/1LQ8tSP1w2wvJNXM5P/6rBlaWroEtLSGVUpjhHyz3lmM0X/HFquNIUDXioBL9ZIzE6TDx5d5UsN+Q9oaMHijkVLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOh2EWc+3T/rWvjkbYIopwzdQOlcgq9T7R6NpEUoDDU=;
 b=Lt+ZSeT4QJbjum3DTVzbswsObYvLhNSJpU7ld/nxW830DdKkzhLEdbzB6arktI+UXvFkpo+7wo3vXvGBHHrPWk95GOkmGvFJ5OrkeYiJ9Zcrd+6v94s0HnwJ7xohZRB3ptb9VtHhmYv5+P1yrPIVJwtrBkpuI/Jfk2OUHCoDzFqOUQATgziWzbXniLCp03YODAONKCk3AUnJheYJADJAJw3fvliApntwBgIzB95+gH6WZ/FDqaaIoPk6zZqlmncfxVgbMU3+jTMH6lyOwtyLjTYu3fymWEPkTs1S/6RP8uDQWxisjapZAk6e1mfzx0sjItSJ2HuoeuMtk1IzODnAHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 09:31:44 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 09:31:44 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] psmisc: fix runtime version when using git shallow tarball
Date: Fri, 16 May 2025 17:31:27 +0800
Message-Id: <20250516093127.506158-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516093127.506158-1-yi.zhao@windriver.com>
References: <20250516093127.506158-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0137.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA1PR11MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d8339e-714e-4390-3633-08dd945c78fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?k2YsC3LtAg6efKeTlptxTUH7pegA9e+kT5ZhTw9f9H2ze9To0Pud9qfMcB3n?=
 =?us-ascii?Q?xgdoSfIIMENgdnn5jF4Lma951hziYcQi33S4ygORW5zLUUdqtBhppf+Ie25N?=
 =?us-ascii?Q?bElSRNA8PtcuGTO54MHxYA0pQc2r8kYLAxTBEZv60GaMuwkFl0Vb+32L8sL/?=
 =?us-ascii?Q?nrqZ+DJdwBqTEXrWwmJmMiMSvgwj2pYJamsl7Lx4TgBO/wRzUx5wvs64xrXr?=
 =?us-ascii?Q?L2E+CMqkQ7yUSTbnVnh7M+Lrsp6YJR0UswCErWxBA01YBnrCwJI1QVSpXvHJ?=
 =?us-ascii?Q?MiQcAcAUQCMIhVVUe5E4/2nysyKurbnYmZaPyZKau3LDscK/0/Reo4U9uvYV?=
 =?us-ascii?Q?zA27nPEggzixcISnR2mecmunDeoVWhAcotI+c+TZmrYBYEQeaSJ/rO9LdG6Q?=
 =?us-ascii?Q?TQAUVdXM1D0HjILYdvDgn/xISPCQx8Lu/oQyodvS65fAD8fBgG892zazSmub?=
 =?us-ascii?Q?fCu7+uCy7c29mJw9L6FbI2NOIwjqoi9pRTXHNxCG2dmfSfDKRDDcVSmq0ior?=
 =?us-ascii?Q?O3P+wEwjs0I7orjOxzCoxa5001hpTnSOdiU0rZdvGXDJLE1yYzoz/pvw1Kc2?=
 =?us-ascii?Q?r+FB+GA0SOe4IuSGjsXQZDtz2Qn0aP+OavYhI435J29VufNUbwwRCWtkLmV8?=
 =?us-ascii?Q?yRLNYJtYe80G717beToqrFdKTK3T/0GluFTRgQX7Rv0ig75IuOyvRGPDo0vQ?=
 =?us-ascii?Q?6XF8ZCNa9DIRMycE9Geo+rWN8sDme9En/SNv7wq5gsNighw7rWx5wCRPZeK0?=
 =?us-ascii?Q?OgQKGLqklz2h6zbF55jRi3PnxpI0B9V5eVo/8iViaMEdyo4I9wB2HJc01nEo?=
 =?us-ascii?Q?QfhCPykSEqJ9hM8tuP2/umlo5CE35ofQKnIzu+NCcZFSXXRhXkZW5xBEknYD?=
 =?us-ascii?Q?ASqpjw/dZk9tyxluj3udNRECIak+s8hygEtBf9yFLoIQGPsVIq42z82zeNCT?=
 =?us-ascii?Q?CPY7DTZDA2w7ad5/d4wyIJl7HtrVqOZEpCX5aC/j5OCphj1X/SDELdTMe7jH?=
 =?us-ascii?Q?wH/MGc/fHxjHOe84RyrERlOQu/kgXv4kqPxCRQL+Q2lDKLL1KJBNO0h8+Ggw?=
 =?us-ascii?Q?Edg3q97N4Mo4XzYJBGmFhxC+7Gg8H0ss1RinSefO/DPikKEeQeUddj0xQmQU?=
 =?us-ascii?Q?XirV8lWl+0gcOjG1yeacFvlFHbg+I6EXX/llipoRcACNFsyDEIQ1SaOnHt1A?=
 =?us-ascii?Q?lqC9Xdk1zuo5SK9z791TZDiLxtYEQnqC07BOpuhIC+WoAUCy+Y5NmyuHuimb?=
 =?us-ascii?Q?KnA0p4+9BGWcDxGwjtYLNTMHLZD8uuy1+mL3AiLKpSAD6r31Ve799D7JxmIX?=
 =?us-ascii?Q?/WgCpGuotMutgyE+M59yFQ4kYUkcM/2esB+/PaAHZ8Gb/3cfBhEHBRuYzpG7?=
 =?us-ascii?Q?+8rpGgM85acbVYKtU0hzW8LXtpVIcGJlX/NfMFT5FY3ioTJgGnOmaw9lNipE?=
 =?us-ascii?Q?sCUyIkncp3o+l0ZngKIOwiFu/x252ACKNapOuRVgnfB+hVTxOP6JXQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LxceWWKyF0Kh0NWvmZOIhYCsnnpF/XpbRzeyqr9QCfXWG9IvTaRttKbObZhk?=
 =?us-ascii?Q?sxci15uPLwLAlk/m7GKEvWOaRa45I/zWVdsFgoFOXQ3acoBoh3Yvsvc668zZ?=
 =?us-ascii?Q?Iw2OXentcEtERi7XUr0jO1IYqA1sNHB3bhkEs8BLnyPPqleaCivGeBWeyfUP?=
 =?us-ascii?Q?3JUXGhc32dhesCfVO0u40JHA+6v1rvIlHUxtt5WEZsnI9G+g9ZiOXsEyI1pR?=
 =?us-ascii?Q?L9QmC6W3v+wGvhUNhkvzqDo7XsTOaAj325YAYl1djQYh8nROiJtDS/j0Eiqb?=
 =?us-ascii?Q?Am5BmOYX4gjOmgekeMEKtCwyH2QjewH2wbF51aAdxdjI9LbS7398oh6t1+Lp?=
 =?us-ascii?Q?axGaQpmb6DI7raDgD147TxPZaxlOS4dXX6L6EcQfpMrGe5wqFGQh4A/kIgub?=
 =?us-ascii?Q?VAMH8tQREiUir8JalLc3EiQI5MQ1cb0XEmHqcuFCnIh5GO8ZlSyCfax2gKS4?=
 =?us-ascii?Q?FB6aVXP+Ap3nGvCIFz6Z7X3LqHJh2jkW0i1Yk6GsGlQzQaqX1MOFCJK8jZ90?=
 =?us-ascii?Q?2LYQxhVRFpnyYqqCeOeEWpxyZ5j7ctNQz2HDBXdAh5tPqMJgy3n87HaZMjBs?=
 =?us-ascii?Q?ksjGmgZKjyvAz1bnWPALPHn7s8+tCwLoRQ8qErcotsLsTcRoEJ8BS6cjc2Sb?=
 =?us-ascii?Q?GIKncv5dMbJ0gLfzDUM2VKhDUiTpbPmBW+OIIqp6dX0RlD1yF4ooSRQb71Um?=
 =?us-ascii?Q?5rdoU8vJKU3I3R15MxfefLcvUMg57B6g7kkAoRPgAEe4H0UmE+X2p8NT900I?=
 =?us-ascii?Q?2p4YvvXJ0kK9si/tUgVZsbRKiYfppsqMI2QImiohiuEIaX62o5kitLgY4+92?=
 =?us-ascii?Q?l9uFk3tCsKOE7SAszp9xk/HG40adUMGBamRcuAzPliwWAC7YPm9dXz+0IQvL?=
 =?us-ascii?Q?Sc24mGnQoJ6XAlfmAmu190z4ZGAY09ye6mtft9NTpuMzA4ugONz68B/Xh5PH?=
 =?us-ascii?Q?J4jrCmt9ilz4g6aYYDxKlaOBV1aymanS0tHzmW9OinF+3PBr1F3YK6ReDP3P?=
 =?us-ascii?Q?hzyKJumbv/wr2Py74x5s4yOZ7ZLhUOtivwqj5iy1SCC8XGIz1Ak9pYSTwdxt?=
 =?us-ascii?Q?2JCqTRAKmIsFwlF2ExvGaHsk6dYn8xroy4auiqHDdjmFRHyYcbVACMZnfwW9?=
 =?us-ascii?Q?Z7cKluk64I0F07djTvqXgmjvJKERS7mnD/TL2sOGaOvc7KwuejrRJH/U0tJC?=
 =?us-ascii?Q?TE/fOIR74WbQgji7EuQ8UgKDURJTp0+SgRN/oH5W+kCwh3gJju/FmvB8MVRm?=
 =?us-ascii?Q?FTC/8O7pk9fpDDobDI8jSWbeB+12/XUQlip3pPfepEZYEJn+Bb4OVdtCA2VN?=
 =?us-ascii?Q?TGveqIDhSsUzlAgpRwVtyAQmgIOyvDUsCMH7aizDXer9XhcWZxezGGkgV4tr?=
 =?us-ascii?Q?oo5gq4uRc1lXLpK2B00ZbfG8k3W4eHkiygGuJT90dxdqobxwsyjMVvTXLrd5?=
 =?us-ascii?Q?ElT2AfeTqC419IOAVZ/wEa4q4K3wezhlXSFFv/Le5wvnv2kQKMhGu0Xl1Qio?=
 =?us-ascii?Q?iLI0yErSYtN5/QBYTDQNCIxAw5+meAzJdh1Vl3QAldcfk5FYEFB9cfm4ytLt?=
 =?us-ascii?Q?K/Z7v80gdBiOPKPiFJRjccNcwG2sqjqj4HY4OGoq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d8339e-714e-4390-3633-08dd945c78fa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 09:31:44.6728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tIFwguplSAq7AqapK8yqoR3Ur2/CAKl8rLARtCnl966D5hz3JYB0oSI46hYjSgXvOXY6m82GeQNnXjXiWQ1rRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6396
X-Proofpoint-GUID: bapyDUMWB_7UcgRytonskid1Ok-amlQd
X-Proofpoint-ORIG-GUID: bapyDUMWB_7UcgRytonskid1Ok-amlQd
X-Authority-Analysis: v=2.4 cv=U7WSDfru c=1 sm=1 tr=0 ts=68270602 cx=c_pps a=AVVanhwSUc+LQPSikfBlbg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=t7CeM3EgAAAA:8 a=0gDct7OKsOyg5-76syYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDA5MCBTYWx0ZWRfXxoUF/wlXPiiB XmsUZIHe7scBlE4EWUtaAAQ6NBtUAY1kqDHy6l5725ukupGe8yMz81PdJ3b7eFh4169nR5goyPF NRyA1Oyf2so6F86+wv+HPZYwUkkeyG6A1O6fLdpYveid1IAhyZZJtOs9GrzMFHYS2gG4O0aF9yv
 E/UjPSc5aYEABq86XaeofN6ynydpb8xY5JwnLvjYuo/dczpacMMe4P4NwAgNoAc69QpanUrl7Ao bM83r6im2lXBW6olekJFte3QYZ6TTerpgaObj47FheDCMmJ0Db++dajm2A7cHl2+vNC+1ZAtnar teODNoqTogZdZJcc3dybgKpBVHXGmQ1nLc23lZgVDwhtowUOXO7j9MySvI568al9OhFL9gnGpea
 KaVrqEceqL2/hMuftzdSb+kWXInjpAgB0pCbHklUFWoUmg0DRT6066U28UaNGfx22fNTZpal
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505160090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 09:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216732

The runtime version of psmisc is generated by 'git describe' command in
misc/git-version-gen. But when using git shallow tarball,
git-version-gen can not get the correct version due to missing git
tag/commit messages. This actually breaks reproducibility, since the
generated binaries should be consistent regardless of the source code
packaging format.

Add a .tarball-version file in source directory. Then get-version-gen
can determine the version through this file instead of 'git describe'
command.

Before the fix:
root@intel-x86-64:~# pslog -V
pslog (PSmisc) UNKNOWN

After the fix:
root@intel-x86-64:~# pslog  -V
pslog (PSmisc) 23.7

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/psmisc/psmisc_23.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/psmisc/psmisc_23.7.bb b/meta/recipes-extended/psmisc/psmisc_23.7.bb
index 4128ca0533..d6bb7ef81b 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.7.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.7.bb
@@ -24,6 +24,7 @@ inherit autotools gettext
 # doesn't believe po/ is a gettext directory and won't generate po/Makefile.
 do_configure:prepend() {
     ( cd ${S} && po/update-potfiles )
+    [ ! -e ${S}/.tarball-version ] && echo ${PV} > ${S}/.tarball-version
 }
 
 
-- 
2.34.1


