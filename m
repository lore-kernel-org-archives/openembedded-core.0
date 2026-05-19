Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D19A1CD4F3C
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 05:27:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15124.1779168454994638850
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 22:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CV4cwk53;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=959934a5a1=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5F3mS3001337
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 05:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=rmfm7JNgCSPRwWyTffdo93jh5c/CHWExtvam6ZOZe98=; b=CV4cwk53HQ5G
	R4+DqNCogjrB9gdM0MJnBBKlwempzfyEf0zyQEJ0qz2SQflh+6GanM1VDQz25Wy1
	1wdORp19a4u3dYc5Vs0bEqf4zRNWATWcj+X9y5z4Zlu5FSlbRfqam7SQba2lGaAN
	2BMME53co/Qsh5mM65I7nBdv94pjwE8NezPWxlKX9lvNKTsmNDwap6HEz4u+MU3J
	7AgJTkHKZNyQ4zIsjGdSX8LEK7gC+uzCc/uuuscmwRKnqGQBS2yFKFuMM+l/bf75
	7rGuDGtN+xgcPMJT1mwDbmeqSDaP4gJXMD24ccA3KfOHx17SAL+W8dXdSeVtycLr
	VXv8unJ8pg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012061.outbound.protection.outlook.com [40.107.200.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6fj3u2r2-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 05:27:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qil4O7Odze7yhtJ+FbFjJGjdh8smWDmsvpn18oYzbuVV+wb8GgQs0ZXcJKCfbVkR1+Mx6fPVPEPTruZxPDRLjVvPyqe3y8ro31CGEScnOdLklftDqnvh0bEqmdDzWIfrDOM3cvdCXNlkaM0awEF/lbb/yWJ3zjhclnFHc47vIinfyGDZdlkdH9v9HqEKqjYlFbGYthZlZM+xh9BVnr5o/4Xwyqk+O4w2nte1wdNaFq1Vvem+uZxxBSb0HST9kw5o86ihTe63cHEZtzaObfLm6YpRtiKo/TOIBsR/hMmmYdQPUCkuhi0/4tPE80dXOHmLf2ZWV46e1Umbphd64ew1sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmfm7JNgCSPRwWyTffdo93jh5c/CHWExtvam6ZOZe98=;
 b=WlGCIBBDEHYEFdSiQucV8Lti/8iHYE6Jrs+WcoI10dvnyEmKFz7TmLdL8STMNCdNeG0Xl7lB3PbGHDDffRd4NsgTZzL527HerD5Lv7rnGjOvuj/ZK0/nxUr5NfeRo3NNgEu7yYQxGE3mHllUrcfV4Gkp3L/cdRQLMwufj0+ynvSGNng7sT/qZYIhFx6q3ip8ANaQ8fZRM3UonSZ4pOHEGrT/JQBAvY8ltIkrF0pyyr8xNtVWZCmb3bt8PpS6k5HhnU9roELTOadKZbVMrkEZZLbSHPLybSd4HWQ6xS8F5SKvAga9rO5+jQa0EV3eZz517mQVYe/zTXtddpdR26KMRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DS7PR11MB6221.namprd11.prod.outlook.com (2603:10b6:8:9a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 05:27:31 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d%4]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 05:27:31 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 2/2] busybox: fix CVE-2026-29004
Date: Tue, 19 May 2026 13:27:11 +0800
Message-Id: <20260519052711.3732145-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519052711.3732145-1-Qi.Chen@windriver.com>
References: <20260519052711.3732145-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0148.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::28) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|DS7PR11MB6221:EE_
X-MS-Office365-Filtering-Correlation-Id: 0602f4d2-5a63-40f8-3a91-08deb56752d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|22082099003|18002099003|12006099003|56012099003|38350700014|11063799003;
X-Microsoft-Antispam-Message-Info: 
	12mnmW20/MMQ8VRF5D5OUZmc8GseSfO6wuWmV3VRB0e2FmceSfhAtxE+e5R5Zbrj5WP3qMujk/0VLEMFRlR3sj/BOPyIZjvmHmYUqgCsR33AQbplVZRJWPnreg/3UyIrNzDIBRoTCMXdJJQVhAWA7szU4rWueGXneqg68iJ4miJcweRqEyF6fbNZQ57dDekt0LY8DRcYV9F+j6yW+aIqjA5yf73ytSwruql0FCKdc3695m69B8/Q4bAmcMZPGpcHKHD+uYcjilv84b98R+ZbLcAq/meT0OLZZgSGhXtX975P98Qyz11E3tJhnGWmxFW/Am8OPxktA0m4oACTlh6nLsVeYjegmyPJ3dbDSitLwoarBOMq/nbAB9x9Vedrsnbhn3WrYp9Yhll9ORW+CDO59qZY7iZnD8HtURSoqeVWL8pEDGCiwRHOA+nVpm67AtTSoCQE/YSxmuoJGvNPjH0W+6lpwhs4NYb9hGSc9XQyVCr0XV5EYHoHYtpb0gA3ISDaslW0Ta4Id3IMeHsw/Fk3TgCX5X6s9izK3Zpm0dcI7WFcCTlm7lAFIeEI8kXqcStRRz0qqzni1D41RKQ0bsh4wUd6VlY4pYVQnlmYJDxVfEkDHHMebE7tsFRm7RnL5dadIk7fbvCH60kVRvCtMOTzgAlR77LPAXq3xnsvhJqiS7g+qpj3rtNPiXZHg3OWXA/mI4bmxHXqwdZkuBb0cLZ69oJFsTfhh4So6bjCF1QNWf3LgpS5rQywpWnKRYrWRPiQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(22082099003)(18002099003)(12006099003)(56012099003)(38350700014)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ABzigIyDODBp+dulCC8WwxRUFgb1sME3eEY2x34d0aU3QFN0eXFyBUihXxcl?=
 =?us-ascii?Q?GT/NvVDN1zYvutIaFdrHHXNk1YBqDgzfcuRwz6UGxuT/36GEOkMe6F/iy2SW?=
 =?us-ascii?Q?H7KIw70bIu6xOdyPVrEYdeUHNl3WIPr7poC+cywB1PNTUb/bsD3BPcj4yjgz?=
 =?us-ascii?Q?bM883c2zYVD92D3/chiY5Yp2YDmuOBHDUMbghDWhV6XrmGlWaHgbXsRSDziz?=
 =?us-ascii?Q?vc5zxX/Y3owLCUrt/jj7IRmYbGviRq4wC0zp3RhBjl0dS0tLr2h2lUv0w3pQ?=
 =?us-ascii?Q?TBjEKspg89HJbsXsC8OHIbWVgDEyKTNPtpw/5TXgmXAWjoL5YdW8dEBsyPa7?=
 =?us-ascii?Q?5ETUD7lE8ZPmk1UsGtL6v7ZGkhZs7HCYUXLGoYKAyylDi6recJootpooXSKz?=
 =?us-ascii?Q?1rE5+dTxa3oBvAT+KPcCe+YTIke5LFHIK3K2DeHhCa46r+JiWLO/QSsCS7Hw?=
 =?us-ascii?Q?UoJb+sYzCHjKa4KyDABzGfqnwGngvexvbF2Vtptgi1qc27yN01tGNrJuievo?=
 =?us-ascii?Q?KFy6zuskCltd+kZn+24nlu8F+fD0sGKzAmfACIapgMXteRrPusl0M3JgQ1bH?=
 =?us-ascii?Q?Sfov2gJ+bE5/ZHoDA2OyzpQQZFLLjHGxIZ7EXYFMupZhzeSBNL5NE9H1oRVL?=
 =?us-ascii?Q?qexCUaKpKVCL4STX4SFzz084DcWW0hScprMM4WqdBOC4wqwEydWMcBzUXxq4?=
 =?us-ascii?Q?HOtmk+NZjekOryeK2gEE1cilmYNmF33O6EZ16Znwgvp90BDEY65VRX2uAmYg?=
 =?us-ascii?Q?EupxnlOvA1GuxBBHIZg6NBJROmOSzvNPRqGetMgrBxBEWRde9CffdKr67Vq2?=
 =?us-ascii?Q?Ot+Q17c5slkJ/9z7nf44z23Ykw+9ITcJWpkQikwx1LNmTY7edCJkfBGPo6hB?=
 =?us-ascii?Q?ljfeVQZubmf4GipdJMBOEjbuAC1KXUVhPDNQcMxHfAs/sUmUSLkIzOy1elil?=
 =?us-ascii?Q?g8GADuKsbs4xi9wQKaaOQiWcnrK2L3+usqZCmLzPcqEjstQKep9OJs68VNuU?=
 =?us-ascii?Q?zwoVUT1k05NhEBKemSLRGOxlq3Qd8eqgN0m+gkMicDsaErikPZGBV3IIRvpw?=
 =?us-ascii?Q?iJuO+yuohhFLqvWRaGOSIv2ZS/jw06bOJUcHjfvBj7K4maZASUsMbbK4Ud+5?=
 =?us-ascii?Q?cwxecOtrL5MFFuzr9sg6yHG9NnB5KOw+Y3IInrWAOmWlGpu/tyok4wRiewGy?=
 =?us-ascii?Q?IjgJTltKKLEsiw805aouADbudO0dCJxoYXJYcyPz9cJzUMJkqZdeg2HVPpxr?=
 =?us-ascii?Q?6vgePvjPEIy2s9/IHSTMD/y5tNqwgDs3gr0VTIrtmmFi5EA483XVeav9oJi3?=
 =?us-ascii?Q?vNljGfwJRAW3AY8VbdHG9ZL/KTmPQdgozbPYEsOGr7feMaeX0JzCLcDcsNke?=
 =?us-ascii?Q?7pLDZC88md8i6j2P1j3xlC686LF/2H0s7xgSdZJ2mXJjTmbfpvCiEI4Y451h?=
 =?us-ascii?Q?7zuOUMfuBMZmHVRpFuvemcNpud7ESbqmh7+v5gq6BueEpnJ3ewsYJE3b6pHD?=
 =?us-ascii?Q?JfJy6HUjzGni1HknrU2bpLcmF/x74ERMvAK4uCrwghMfcPsek5LGy/tg+T3T?=
 =?us-ascii?Q?3EuBTO7P/Zug1XyejxradGAoPsNUmMH+k6GSqU4k1V1hK3+1W8+nARy79fQO?=
 =?us-ascii?Q?wzzbclJDpJv8L09INEQ2+yh6XGWThHNWs6+yzbcAc8IsxZQTDxyyv5obKdqj?=
 =?us-ascii?Q?yVhIiSTXFd/DYYE11FW0u4+I6Ox5hsxQ6dZ5gSFIVvFJhdV6a51kOMNvTw0P?=
 =?us-ascii?Q?C85oizVr1g=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	AVche21JIf5+VN8CVgleV0cBBoJDYchiwgz1/0Y4JSfr44bX4T21ACJgDVweZ0BSDopFR03OunZ0GgK5j60F0Yxh9d8Rk+k10LxZ3nkm3rf+903FCOfB10kvx7ygrBHxCpS42o9/jhDVyM0pJ2xmiOA+osVIvdpQ+AqctFDE096KBReqYKQk/2lMxBoXdlZPnQbsa8hSG/vcecP8drR1IOmHGva4yLiNPVsXL412qKM17OWvTpct+nBCIocyk97yDa4m+2jGkCUFsRL7dOufB8oN+bJQZk35OufKV0Ea3bjitojhxU7GSBuJXDF9+Pi99Sat/UsLkbwnnziNAVPQJg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0602f4d2-5a63-40f8-3a91-08deb56752d5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 05:27:31.0939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ra5jIX4RaPT/7I2mNpTvBq07Y84yPjrRwKC84yf6/5rLvWSdwMcDFH5SmyHkBwQt+bHRN2HD3Q/BRnIK9OkCwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6221
X-Proofpoint-GUID: GwB9HO_4oRM_S5HFEGMErzTsIZBnj6-C
X-Proofpoint-ORIG-GUID: GwB9HO_4oRM_S5HFEGMErzTsIZBnj6-C
X-Authority-Analysis: v=2.4 cv=VssTxe2n c=1 sm=1 tr=0 ts=6a0bf4c5 cx=c_pps
 a=1c0oZQ8MA7sDNsoFSDv1iA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=J0Tn2xNtAAAA:8 a=t7CeM3EgAAAA:8 a=mK_AVkanAAAA:8
 a=0ZRd5boCRadUMG0dJzQA:9 a=9ZcRxastL33iXWX1AWsW:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA1MCBTYWx0ZWRfX07d1jJtSWFvq
 xDDPBcfV0maNLJeWwGo7LXY4aT4XnXfY8QR2lpzq/WEw9z86NE1Es2kAN63YzxbmTQqz+fDX5bF
 /734Ho1p64mSjWxPeLkvG2VIAorv0oneq1U+6TIpO4mZ3SqaSWZ6hmtY/bwnA6qfGy7XWBFSPrP
 X0Le9RZWQ3xbz1P4joigDVQ8VbKorOSmeeQGpJ7t52fyUsTOAwxZKz8LleR/jP5uESO3J8Wd1Gv
 7lDkpbo8/ho8YJplyFuWr/5AXp2TU/gs9xHNqK2vz4iTiwfe4e9o35aBeW5bl3yNnzFbL5cblXE
 ySge3IMtSmC+BrOiYuTRaw6dOgnHiA0Zc1ixk84H/iMhkyqK+kH7UMofit7wKsOU0UC8qLhLlwZ
 q03ThnsiHJ7JfsfmDHhP6FJuncYyowymjtteDVC97wRiJdXRlVS737aToqxdwNDYd+rhkE2L6Ya
 6xVAZuGvkgdatCRRT4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 05:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237268

From: Chen Qi <Qi.Chen@windriver.com>

Backport two patches to fix CVE-2026-29004.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-29004

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../busybox/busybox/CVE-2026-29004-01.patch   | 42 +++++++++++++++++
 .../busybox/busybox/CVE-2026-29004-02.patch   | 47 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.37.0.bb   |  2 +
 3 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch b/meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch
new file mode 100644
index 0000000000..8ce4858adc
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-29004-01.patch
@@ -0,0 +1,42 @@
+From d9a718cc17535c31d38f31fccb904a30e823166d Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 12 Mar 2026 07:25:38 +0100
+Subject: [PATCH 1/2] udhcpc6: fix buffer overflow
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2026-29004
+
+Upstream-Status: Backport [https://github.com/vda-linux/busybox_mirror/commit/42202bfb1e6ac51fa995beda8be4d7b654aeee2a]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ networking/udhcp/d6_dhcpc.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/networking/udhcp/d6_dhcpc.c b/networking/udhcp/d6_dhcpc.c
+index 79cef1999..d13b05829 100644
+--- a/networking/udhcp/d6_dhcpc.c
++++ b/networking/udhcp/d6_dhcpc.c
+@@ -351,15 +351,15 @@ static void option_to_env(const uint8_t *option, const uint8_t *option_end)
+ 			addrs = option[3] >> 4;
+ 
+ 			/* Setup environment variable */
+-			*new_env() = dlist = xmalloc(4 + addrs * 40 - 1);
++			*new_env() = dlist = xmalloc(4 + addrs * 40 + 1);
+ 			dlist = stpcpy(dlist, "dns=");
+ 			option_offset = 0;
+ 
+-			while (addrs--) {
++			while (addrs-- != 0) {
+ 				sprint_nip6(dlist, option + 4 + option_offset);
+ 				dlist += 39;
+ 				option_offset += 16;
+-				if (addrs)
++				if (addrs != 0)
+ 					*dlist++ = ' ';
+ 			}
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch b/meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch
new file mode 100644
index 0000000000..734f0bbbdb
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-29004-02.patch
@@ -0,0 +1,47 @@
+From 1e14c5c577a7bd46f42315e9bc445419770041a7 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 12 Mar 2026 13:23:48 +0100
+Subject: [PATCH 2/2] udhcpc6: check the size of D6_OPT_IAPREFIX option
+
+function                                             old     new   delta
+option_to_env                                        694     711     +17
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+CVE: CVE-2026-29004
+
+Upstream-Status: Backport [https://github.com/vda-linux/busybox_mirror/commit/d368f3f7836d1c2484c8f839316e5c93e76d4409]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ networking/udhcp/d6_dhcpc.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/networking/udhcp/d6_dhcpc.c b/networking/udhcp/d6_dhcpc.c
+index d13b05829..1851cee2a 100644
+--- a/networking/udhcp/d6_dhcpc.c
++++ b/networking/udhcp/d6_dhcpc.c
+@@ -287,8 +287,8 @@ static void option_to_env(const uint8_t *option, const uint8_t *option_end)
+  * |                        valid-lifetime                         |
+  * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+  */
+-			/* Make sure payload contains an address */
+-			if (option[3] < 24)
++			/* Make sure payload exists */
++			if (option[3] < (16 + 4 + 4))
+ 				break;
+ 
+ 			sprint_nip6(ipv6str, option + 4);
+@@ -332,6 +332,9 @@ static void option_to_env(const uint8_t *option, const uint8_t *option_end)
+  * |               |
+  * +-+-+-+-+-+-+-+-+
+  */
++			/* Make sure payload exists */
++			if (option[3] < (4 + 4 + 1 + 16))
++				break;
+ 			move_from_unaligned32(v32, option + 4 + 4);
+ 			v32 = ntohl(v32);
+ 			*new_env() = xasprintf("ipv6prefix_lease=%u", (unsigned)v32);
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-core/busybox/busybox_1.37.0.bb
index 4790899684..a6abfa2598 100644
--- a/meta/recipes-core/busybox/busybox_1.37.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
@@ -64,6 +64,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-tar-strip-unsafe-hardlink-components-GNU-tar-does-th.patch \
            file://0002-tar-only-strip-unsafe-components-from-hardlinks-not-.patch \
            file://CVE-2024-58251.patch \
+           file://CVE-2026-29004-01.patch \
+           file://CVE-2026-29004-02.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
 SRC_URI:append:x86-64 = " file://sha_accel.cfg"
-- 
2.34.1


