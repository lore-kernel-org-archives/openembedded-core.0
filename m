Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67047C44501
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 15:19:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11212.1783523952464571292
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 08:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OTgZkxNA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1649b348d9=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3bxT3933739
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Jul 2026 08:19:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=yWYVd5YXdOaPi2sefFQLF9mQMAR8lPr5bMrCYIXLKEs=; b=
	OTgZkxNA21NWV314n60dcPElRP9075tkvx5269OmqEhRG7MaBF8Xg4NeGvyIKI/4
	HKrA5KpiQmo5vDdpK41PMWS2eXNGcTJBGT2JDJpqRYUsj3Nr2IumQ4JU5l7juOzw
	y/Ugj+9/MDEUUmAtBO5IwRBXzxhhhMSMh+X6JLjs48oulKN5LfKtzeL7HvAJlp20
	2JGAuA1iRZUAaT8RRCcAs59RISqIqd6kagaJS3OEdv+M2oXXsUX899g2nDo4enAm
	eko1SXfos5U1d3LrZNXWV6oPLUxmxNAqppERKvz9+Tmzk3IDIzGNBxfsu5i6rTGh
	EqFW6saWyajiz8XYwtFxeQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011001.outbound.protection.outlook.com [40.93.194.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f6wf1e8n5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 08:19:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1l8q0tcIXrYGDRvrLMaxUKcq68qWffJGWAsMru8jW1DmZSbJhxsWCWSiLxKyMDh6XfRxEX5BJIHSLPgFcp/B7W3mLugrRYNjffGwud4gy2HbKSKFwLCcgZfR6c37wrmK8kQ4ssCHR1iXMJFBuME30r734bQoG7QEwWoZEDG4G63q2WalZLJG/+i1wOqxWRAOzFYtRHiPnyZVnCOH0hlGy11JIQxwRwWUxZCnS0K21y77MZZfNsi+5Fg5dXhn87FjPNINf2Sh9mYgLcLKRFPzvAahiaWNy39Ahy7fFE3c+q5CeCEnzx4HlIh/BWwB6wyOz8gVE6kNzLp5flaamNz0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWYVd5YXdOaPi2sefFQLF9mQMAR8lPr5bMrCYIXLKEs=;
 b=D1BbBP8KWIVi3dCRrosqDCxDORtOOrvwDRujOR6eapicNFE9Pi5bmdDOvBpxpFqTzV046eiQugEkWkC8QMYpK+hXWCH3O0ziNx9TJd0+jrxqv59QkloFZJNy1dnaGK3vuRULG7M13UFKoRtFpEaqf/qUGUJFtb7aE9UrvmtILvU+Tk/LM54CbnG5BEh4Q51uZyCLgr45znJiV4V1HQMHr+rs2QeYbKYhj5NA/Gf+5NIAai58x7F3zTNUuBpcGYXApOGyvneq/Jq6dH+eCU60uHiN15VZi9jTENcwrE0dr8T5Y4PVqeuPOwLNob2hsn4RcJ613fcGmolhcjnIG3mAxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by LVUPR11MB9810.namprd11.prod.outlook.com (2603:10b6:408:39d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 15:19:10 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 15:19:10 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        raj.khem@gmail.com, tgamblin@baylibre.com
Subject: [PATCH v3 3/4] kernel-yocto-rust: Add lld-native to DEPENDS
Date: Wed,  8 Jul 2026 08:18:15 -0700
Message-ID: <20260708151816.2115030-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260708151816.2115030-1-Harish.Sadineni@windriver.com>
References: <20260708151816.2115030-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0076.namprd05.prod.outlook.com
 (2603:10b6:a03:332::21) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|LVUPR11MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: 830c34c2-b67a-4d27-e62a-08dedd04427b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|52116014|1800799024|38350700014|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Aj0zSzY6a6K2dnsgx7lSpb8vY1uc6RYWY5UQGbZKOUHb57zZYuo6TKxiuAmet58s871PBFBtItPANnUgGxV1Xx3AyBmAHma+tja343qP2KO+vR7+lE2P3JXZgeNrRAkQ3s/1JczMWCWZueAcOHr1oF4fgmUEx+BrsoVdysUBnpZl1pY43/Jk5ui4wvm6s8vA7HMaqApdQAWMpV7GSyXrRrxi4TLcOgHi9+rToaEIuHvHzfBp4TStVZD0Qw/hoIMtL05f8IOllsVjw1RTiILysBj21UM/PEjXbUln4rhMEU4Oho7SGwq9pfv0QgnJyzGcjgsVbobbavWZR6g8A5CYJ2Fgsl+XSYHD4gAWR2XWMIBU59zF9N221lDHV4o1iYHPhEJhi9+wIVgMWddZiXO/0K+mS9hCrqIyXvaSc8bRFX505goyTtZUQVFD6KGmuqxGoLTS0YbT/CfBUEVfJntyoi0Xf/0Qu7s3bdXcK5Lof/B0l3b3iM9JOOKIiQliqPw8uPY4qrcyihTA0CIRGXaPEGja3BCdE0QV2+/5zKX3VJstlf3cDZb7bkf018jFZfK/FYcgxn/JWKERk6uM8oh9kxlbxPu2Q3JRXvnvE1nAyP5Pue0uON0uAKX5aAR8vPnT9sSPeSN3yKiaE0ApLNduht86qac8VTuBfVsE2Sx5fImfbq+WILdjXEVg+nEGofZIvwmd4yusQJsEvx2dUGCE3ywdJ7lnWcVZqpe0NR6Kt6A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(52116014)(1800799024)(38350700014)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T5Fxxr2KOUW3XmbxbZadpXKZOhf91Ms/a8IUe6Hj7NXDXgeeqlO9iDp21Yjz?=
 =?us-ascii?Q?v89RT886KYY1CagHMuIRMbf3+82Pja2mLcFJmqHVfu2ruGd5py16Vj/KK/Ni?=
 =?us-ascii?Q?Wa+x/UNufgq82vHQrsW2mL6+1J4d3Wf3n22gtJhXNraOS1yNMBWh8pujux6O?=
 =?us-ascii?Q?DQeNDjmEfFnEZ04c90f84qm7SNCW2p47y7h/7WyqANBVEEgH0vD2e4RVHgWe?=
 =?us-ascii?Q?Q+ovUOna/yPPCvwjVEuqsTFJvP9iP+DP32rbtT/g5Vdw7UBJ9rf8SmF/XzyU?=
 =?us-ascii?Q?8/shCCe0PQYdSVk1HTVi17OPjevXPt03MIl0opjbN7zjggnfFhTvlvFAYzeH?=
 =?us-ascii?Q?lZ/a5+tYNcd5NH+ZoU4hnwn6Mg/l6BsCm9ukykyYtkPcgJ0CtVS/b+X+BI2G?=
 =?us-ascii?Q?7ZcxwmroDypGx+kIVDmy945ZmpwlhA7DtjU9D1/Uawp07WMnMrRTyKK2RPkS?=
 =?us-ascii?Q?fIlspqNtUfK5YWo50OH2gnMrs+qRGB3AmzuOKJak1+9hjsOLPCwuRuquGmzN?=
 =?us-ascii?Q?CUO5E+G6ffuK3ea/C2Asa/HZmIGSp/vWy6iYK+LAnSJuWLprviRdNilc3bKr?=
 =?us-ascii?Q?avjfEszzMKHEdVIW0Bgn68FYDW62lB9xQg6OZJs/OyVzLL3h1sQAAYOvcXyP?=
 =?us-ascii?Q?aHilJAxv9JFUO3wC2Q/OWXt2oHb2ErIyHU849IKXj0S4c/HEnic0tnUAEz0i?=
 =?us-ascii?Q?Y0dhIpiXadN6ZDJ07hwUBSO6A6rsuDaaTYubd0bGHP4U8FQc94/FMXRbTGY/?=
 =?us-ascii?Q?RdiyQQCN3V6tzeHksKlmi3nVvh6APtxGpZHp8rylH3yeORKzzMfGZpD0vReU?=
 =?us-ascii?Q?bYCqKDh2NnFMjrnV+yhRtBz/eWiqdK/0Z7WwTOApQ3VcbP49PF4VTW+F2uyU?=
 =?us-ascii?Q?wbGwO+vjVX/ebOh2t8Z4Ajv2w7EBCbVMyJC9MG2i2xNKYYV/wcYKJFBxCzTW?=
 =?us-ascii?Q?zMVL4VIZl7L3acYKoc4buTtqM3a1v6s+QkxLSgWUscy0OVE1VEeD3G+i+VnP?=
 =?us-ascii?Q?Pg5sjgDYTIQJMq+RnYcyK40m0+vJf8qpp1CfY0K8nBnyAKrf7ggi9iKsIi5b?=
 =?us-ascii?Q?Lnqpz2mj78p/3/c3xBTvObnWVXq8+pEVy5I+Q2S+dNwrlYlChX6MVNNmIDmQ?=
 =?us-ascii?Q?NkOuw8tphNFKtitbe3lDIMIiouq7PyBMFLWR8u+BvsQLWf5mLJDhCP4OpBK7?=
 =?us-ascii?Q?fZmMuZV04manOJ9pbUyyZS1YQ/x3dy/mLz3EgZteaI3NZHlQC3fkqP6rQGvQ?=
 =?us-ascii?Q?ezbj9eoPLLxqcdVtdlX5z/lVVmOqwd2M/ublNsOuCrW7u8x2t88NlRvbFb2b?=
 =?us-ascii?Q?HFhr10LKpvE32BT5vRrLPPRwpVft7neP8k5FDXZTIyG8VGrJrEwJSDMfSMVw?=
 =?us-ascii?Q?DneE6gXug5z6J2CttBG5lvioEE4ITFe/qoHT1dGA1HGxgHgTnPQAsfVRWzxn?=
 =?us-ascii?Q?/OBNXfDR5SU6191zTRM6Bb0VsGW2JpvtpgHnqaN8Il7lCXccKGEWVC8NEHsa?=
 =?us-ascii?Q?uXBARV4csp4T9if0pjC65YfAERxgggfufO+/EZOGNimMJcUIB+GHQz50umMd?=
 =?us-ascii?Q?usaAUy3JFzsW5j/iqNjYLBTXhAnsERjmg/6aSLnb8HDYttRM1cCb6zgBqZtK?=
 =?us-ascii?Q?CQ3eKg6/9iKx1IiYwto/6lczAaaAlaizqG9EtHaYq+lKflv9qPiFOSASibpd?=
 =?us-ascii?Q?9hRkU/nAGJ8B92mhYoqPDBZ93TEZPY2Q08QV4Z4I4WBGRh1YL67pQxWCcyjr?=
 =?us-ascii?Q?NfrvJmVkwbEKvmpDcWYLiYxY0INsqaw=3D?=
X-Exchange-RoutingPolicyChecked: 
	SDEzYoCvwzUWh9q/MvoiFwQU9y/F6rH5y/yXA9IHZP4jR43hcfjT5pf/ga2nUxTwXwE2zu+eR/317+n4xIiP0I123zddfVy3l2jFh2mdvr6pDS5Lnb5/gmok4ajrS5iGoEm+W6fATNEwN4328NzHaFy2cT8mg3RRNC3vNq/3bQ2Tuzr4GH5RlTcw0PhI2jHqRghb8A3sQc1XOv3CutrX81srUgpsR606PGYRCXLeMtH2/3MIeChN8U18MsZZKC3Ti/DgOGKfT+PLRy2a7AAJtaN60A+xibMht2gRYVGKlGORtvMoLm+9CaVaYcPg//Mb0MNyVThIx71T9iXdZKek2Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 830c34c2-b67a-4d27-e62a-08dedd04427b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 15:19:09.9610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZo2oLJCSWb1znu9fP75eTUSAXBcR4YlHiLC2X1PxlCXZAbl8AdA40tJxEutS4ybmoM6gW7lY+jasIrB06L0cHkRyLkntOin8YrxU3shYu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9810
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfXyDzbzGzi4tSg
 kIRoAE0LdTvMWxi1sjXmvMUuXC1KR18aA1QzJ9H1omO83NTVGlHtOChppT6S0jviq7otgsAlMs/
 ADistF+bPPoZz0tE4YDpZ4Zd0ugA4ediI8Rx94OquQc1Wsgl5/sHHfLOKUptAbekDHV0NGPU2Fq
 ROYxSi4FeYhVkjLgxEdgHK+ccbSQg5fMQox5wDFYMVjxr7H6b3AaZUOvjj0ZVyVAXUCPkSnQNDv
 SvPCrK6UP9Dsv1ruSshsBPQGzsdhB+EgtEYNkSK0kfu1jyc1Z8DHjMj2UVNL2iJCb5LcafuRgQi
 yaOOxDRpABKyv1icZPpHiqlgRGt7Xs7VWvCPoLeixY0QVJWzSFZ/Tw2by2bTgrX+S11SnZMd3C1
 LtlxVIVjNZ2zRxjFWXua4hanakmRrJJ4i7SuwCTkVSt3LzSxIuquXGoDra7mT4FcbpPpYhDxtJA
 oWozp2DJnc1PNSz67tw==
X-Proofpoint-ORIG-GUID: ISSKJq0HfbD1O7d1mWgKCGYsmgXsWSDX
X-Proofpoint-GUID: VzZ2d98XIiN_-OyBweV9mO4SBc4VvwMX
X-Authority-Analysis: v=2.4 cv=cuarVV4i c=1 sm=1 tr=0 ts=6a4e6a70 cx=c_pps
 a=gt+0rivs0JJaOpoC1YDK5g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=LuRbOgls0ZB7qaaZkpYA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfX8ajZH3woF6bF
 Y+5hpzhltiXscCzH/wDxawhpKLOS0nMeruboEByZUvVzsqgDontotT4nhUAcCzszKkpaYmBVg6g
 r2An6IeNm+WcBDi9CCw6CSpkabjhivE8LwgXf0wX0hdHpErf36Cf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 15:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240494

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add lld-native to DEPENDS, As lld linker is required while building kernel
with clang.

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto-rust.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-recipe/kernel-yocto-rust.bbclass
index 49f2bfc1ae..1badb37476 100644
--- a/meta/classes-recipe/kernel-yocto-rust.bbclass
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
@@ -25,3 +25,6 @@ do_kernel_configme:append () {
 # More details in: https://lists.openembedded.org/g/openembedded-core/message/229336
 # Disable ccache for kernel build if kernel rust support is enabled to workaround this.
 CCACHE_DISABLE ?= "1"
+
+DEPENDS:append:riscv64 = " lld-native"
+RUST_KERNEL_TASK_DEPENDS:append:riscv64 = " lld-native:do_populate_sysroot"
-- 
2.49.0


