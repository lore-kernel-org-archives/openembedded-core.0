Return-Path: <libo.chen.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB35C87FDA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 06:48:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.81944.1754030926349445655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 23:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0308760e6e=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5713xW8S2860233
	for <openembedded-core@lists.openembedded.org>; Fri, 1 Aug 2025 06:48:44 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2043.outbound.protection.outlook.com [40.107.102.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4888htruxt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 06:48:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rAH7EpM1t6D79Wv5KdGIlEb9dlPUE2+L0HMsd9dg/O/b66JJ8KDg0xZN5Jn0wMSME4GEu3HIXySkDbT3GDutFyJKJnoJshEmH9atxqxrNiXY34fImtCPggXkaP9IZA/enZhrCZB9Sa7Ma1pZq1p/lzu+pC1sDb9Qk0i3kL4dCCLwxANNf6Qnhz7Rfm71hZ01qM0cad0MGuvg9Ud9yfyTtN4HwBYdt1RZKNrMJz445BmD3BEbgK660Ffc0HJ08dfl6Caprr0amNJHniw5d508Ph+ZtVtPJPQRxqmn87TVC0rIMe7c+ZG7iCWH6o4XHx14/Ond7kT4feU/O15gFN0Jug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7eZeCJEhc6Gpu29tBNW3zt4vPo4GY4NXcMO4lraC78=;
 b=MCnX9oXjUhby9f1S+VP4ZgOHsAzpr005pQKoZqqFgNUSuxFtN4FSR8V90SwE5TD6T/LEeA/TR87P61a5MUSfmZEdXj8TK/0fV6h2lOMTgqKsm5TQ3+n/krALvxo7D6yZx6I7S6sq5Qg1BDA9ogjlxY3CFdkO3PuwGua8NxIK525IYxPCyCG2/6x55jfyOf4d+4/Vuruw+6Sw0dakmN6JS2iYc+P+6l2nKu+K7j9pPZTzxDZNs4ZpY+n1lDvZtcfwt8LmpHtExPv+DJNSu4HnnqS1oqwK2wLQ6xeGvyh1qil+WsiUW946ZI682qTx9md0bjEAjTzpjPRcuefXL0/7Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7)
 by SJ1PR11MB6273.namprd11.prod.outlook.com (2603:10b6:a03:458::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Fri, 1 Aug
 2025 06:48:41 +0000
Received: from BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d]) by BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::5e9:ab74:5c12:ee2d%3]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 06:48:41 +0000
From: libo.chen.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] runqemu: fix special characters bug
Date: Fri,  1 Aug 2025 14:48:28 +0800
Message-Id: <20250801064828.2904332-1-libo.chen.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: OSAPR01CA0377.jpnprd01.prod.outlook.com
 (2603:1096:604:35::29) To BN9PR11MB5354.namprd11.prod.outlook.com
 (2603:10b6:408:11b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5354:EE_|SJ1PR11MB6273:EE_
X-MS-Office365-Filtering-Correlation-Id: 667d575a-fd24-40a6-af97-08ddd0c77385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+N1j6DsBsI2b6TgvacbcGe38s4alIPTyNnVsv+z4H08Y6mNILQpwas83zMHL?=
 =?us-ascii?Q?nfDCmx8hZWp/sCz+shXallcrYd3z193rSzIrSiS5rUySr2gQQV93f5Dqx0Zn?=
 =?us-ascii?Q?KIKT31XqKyG30Mkihiky8Qd6rqDSBW04q8dOs1atNoISxdUrlWSxsyrjLVgK?=
 =?us-ascii?Q?c2KSEi+ZcahdSmXi4Dh7WvxtNtSUf9AQKeKjCnXZMnlvffym+iELNzQXm4E0?=
 =?us-ascii?Q?Hnx8X8EBeI/ft9Qa+TkeIKSMiIWY/hnjAa7zBcpg85Z1Rjve/79H7VLiGONZ?=
 =?us-ascii?Q?BLVfW4tX815Su8Gle1eaC65NpDYB2wS7oWDxU3DrWqlxYG5tVvlnRcGuTsI+?=
 =?us-ascii?Q?R2H7uvVKJzlzQMr0F6HGqN39eu5NNkMaD1oo7StXL70X98Bj3uemaFU0PLms?=
 =?us-ascii?Q?BFvdwyeke1kUYlXGYcuiwqHjbdKMQ179oMh67kwtArCtneDrTn9TXpeq7XC6?=
 =?us-ascii?Q?u1j3CrpSmqEBh8xOlpFybCW5gTgzeU6QCc2Gx7F8AELwvxFq1UEdF6lW0n2L?=
 =?us-ascii?Q?zIvw90LI32tel5vn1AZktMnCCsAbhkX5Fu5/QBOZdKGzEef+KfDbozFhCEbR?=
 =?us-ascii?Q?dayrv+wPE/2891QXyNexul/JmDG0nEarUicoYdEo8GSwM7WM/1ipdEzQ/zWX?=
 =?us-ascii?Q?4Tt+zSeesKgJfcvNFt1oetpHVsS4jKUv1D4Xkn187QlTu7DrInLuUCiyo4GV?=
 =?us-ascii?Q?OJqTDEEjA1J5aaN3/UvmhvddLi6Wc6V4j85XtdF8pJih2H6aLhX+Pe5q4MaY?=
 =?us-ascii?Q?13bVwY6eS7rerWiNuTJB8kj2c/3r2fL0jHFf41+r973WD84OceEmSyLgJOiV?=
 =?us-ascii?Q?cIVQMp6PBuTvQoBJXcbJwE7xMou5wPjhXwhWAm2bvCjjkvsjRevWppf2n2Wx?=
 =?us-ascii?Q?/bV23d6bOxbxoLaOX/hyWDtGmKH4BBArV6ywGQN8veq2XGVFCi2kOJwUvO6w?=
 =?us-ascii?Q?ZgMAepNikmH0R8Ja55qFpdG6s0bHL+2u62XrMR9MKFqTnTlQGjFQqE30/3uY?=
 =?us-ascii?Q?lxEUfZRgJTCmoT3EeErka8B2xkvA1tJRd4FhRPjfQvl0lNs0YObqQjnIP0gJ?=
 =?us-ascii?Q?6iWh/B24g6ANxLyDTxcJB63/nTjgMBx+2Z+sfz7C3Tfaxd9KoTwHw4HBYoaX?=
 =?us-ascii?Q?a2qwOJFOG9pWq+oMQAsytSNUhuKIE9/2vWZPMNVIdhDa/6L6NfijasFGWFEP?=
 =?us-ascii?Q?cJjchXhwZnWWMk0lnifs3scNYq+0ZGCZwLS7OPJep7NFzVzNCEX2e41VkAgU?=
 =?us-ascii?Q?UrTKx1spiKf+pweffPzNSXNA5uW9CKPd9+1689PLtG38aoeY6rH/gMrhJG5r?=
 =?us-ascii?Q?xu/Q8IAluI+XL9fIl4CVRuFI0SiZCQnRM9unQvIjf+px/4H31l0ZUgUPAHc5?=
 =?us-ascii?Q?lZf/VZn/LAtEDDb4Dtr3x6aw9kH8oYFF04a5M8xF1FuOD2vnhhxgkII8MsVK?=
 =?us-ascii?Q?aQyizvVPVyVO9bBV6ntDF/RhzyIwuPkXy5xCBAchc/o0sft+rYdWOA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5354.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?g0M1owCi+MQdhPeGlPsJ8qRkVz6U1xL/FQgjrx/qQVh7pnz8VedpjOIKWPtG?=
 =?us-ascii?Q?zLRqmWQR2EozCxWcp6ErZ500k2BDRtp69FNg4Zq5N9OEDoVPjKjAt11ebHwb?=
 =?us-ascii?Q?Lo107yBZ666AAeNOw07Hm5K530lbNBPPRdojaa3r2FM9l89LU/GIJHCuZ0PK?=
 =?us-ascii?Q?MLFQCFPgdjw3s6c6WDzxnGKUadSAr2A/3CmNJNtP84xHZ/47GA1B+EOAXUpH?=
 =?us-ascii?Q?NeJ4hHYlA/uazqNt08rpq8zW74bYEw+gd/aPW1DR1IhTIOBm3JRmoLuhNcBw?=
 =?us-ascii?Q?FS2A0JU3zODVIV7YAuggY3kOXA2gb73PebXk9JGIY0lf8Cr1mxZDjGkCfFSf?=
 =?us-ascii?Q?sc4sLFz4jqQpgwxWXOhQpZXSWRYh4l4NkMiCQeRJrs9nGB8mCrIjEj5ThZCD?=
 =?us-ascii?Q?IkV0ElwrcvhIMDJuzc05bsOS2duX4DyQQNGQZSpOcmxOflGmmtngtRlGPaYd?=
 =?us-ascii?Q?w/D7JNbZcXQwQJTA5tJLQ33574v5hMJUlUdmuO3cgiIKfYOjTmAw5+g7DFf/?=
 =?us-ascii?Q?/YWRvrpBkrPA8I9dV6b98maYvnIC5YfEuujFhXIi9i/VuzoqsSXUsIeCZARj?=
 =?us-ascii?Q?15N+ztcjO/Gk+wZWajyq5CzGl5ihAKNfvkRvcDm7Ywt49eZh++AVPKlB3CAO?=
 =?us-ascii?Q?CyN2Om8kpuyhnD5rc/zwzOSRKFjuAo2mx9TqM7RHGSFOn0FPQyrHcrhTS0+I?=
 =?us-ascii?Q?5tVjWV3+H2zkRlQtC3OsTKhg5smGsWFei4j2m5/j7FO0NrhBc3L0pWXm0rFJ?=
 =?us-ascii?Q?NTnHBkT3lacPVvFAjbGwL/G8JSx4nSZ3kOfT8CAQM35ykGvT0NfXrTEH0gem?=
 =?us-ascii?Q?kTJMO5uPqIHY1NK+BmNgfSV2TU+jOSUDY6Y7cOt0JCdWPDnoGsU8hrq5eo0S?=
 =?us-ascii?Q?fETGuAafFHgi+QxppnpvIgg7g7EWnuUMIdhfx21d0335hqebAf6e1ppezSPF?=
 =?us-ascii?Q?qr+flgPpMkrMI3PzjfwSfDfslmwbkPZ7Zy8nqSYSP7gbzsynf3G3JwCqrJ+e?=
 =?us-ascii?Q?jwysh98XcBa9DKBgA+rBViv0GwO/tamrfyf3uBJHU6NYzl1gc0s7KQ/MP8Ha?=
 =?us-ascii?Q?HJ95lBwQQkq5EqiF8VfgdVqJrMlZo2Zcd0RgzUExUDCZgJBEluity+IGub2W?=
 =?us-ascii?Q?DbH7rngI2OJ3QuBXHQro/BiZiELfQkdmp7G+RhmhKly4I1t3MKIzrLQJ/6io?=
 =?us-ascii?Q?8uXN3F5EAZjq3tL2OU5lvDJrfXy3jC0EJMsbC1k3GF+rbVwDWHD4fJoJ0Bpm?=
 =?us-ascii?Q?DwN/K169PXIbo9mgytSGTmmR5Z4ALLtqoU8QdwqSRWfIC7NIB888CnzxdgpC?=
 =?us-ascii?Q?JiUX6F4D4wrQ2jWVE63sG1GTyjNl1LNJqmVtG9Z8LfHREC+uqWEBTy5VwXPz?=
 =?us-ascii?Q?U/dfHsyAUV7x9VVVkT6l4fJ5pb+y89bNVs+CUS0diAIj1zBC5RlQKLJ0EJHp?=
 =?us-ascii?Q?ZYRq/4o7ffxQsFS8xgupoI8MiBXGVM4Kc4OrAkfCq4muujWAr4wo+OWjarW5?=
 =?us-ascii?Q?RepO3D/VooNi5YZqK7cOCVYtUm9QhnHQ3qamA0QUqBPqJdwlMCjvzlA0FdtV?=
 =?us-ascii?Q?ePw9pd5iBmaUorSKd9g2cIP5cpPVLKuZWuMEyixw7MlD90nD0MP8RkTbMn6O?=
 =?us-ascii?Q?TQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 667d575a-fd24-40a6-af97-08ddd0c77385
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5354.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 06:48:41.4658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3jZJr6NvgvIMnPxEOBU+JFFmdVFqLM5RFPZQ3dUNjBmm6NCPHrW01S0jwsab7KEUGC6YFpFkfUviGiNC3vlsy2wPvoAs8BKd5+BzuAjuS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6273
X-Proofpoint-GUID: KrD9nuMHQ194TmjCaXRDQuf04Chlzs3V
X-Proofpoint-ORIG-GUID: KrD9nuMHQ194TmjCaXRDQuf04Chlzs3V
X-Authority-Analysis: v=2.4 cv=ZtntK87G c=1 sm=1 tr=0 ts=688c634b cx=c_pps
 a=wGKF5knUpTQULII1YW1n8w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=nQNCM_iwqSZUGIDYJeAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA0NyBTYWx0ZWRfX8Ky4Po79RxSR
 MVBWwBBwg4j7oLudDR+0aUJIWqpm5jI7dBGWW1L5JmnBW0tAsEJe6Lw1f7vvFVcVJgphdcgdjl0
 lhQ+J7xS2EY9MInv83VufvlgIzpOvycUsm3l2CX+FIgH3d8tFn76q8kRtIzyG+zZuhpy5QUMvyX
 NEhb6iXXik5WtuJqbYOuyII+mlk3ZChaFhssWmadVeoZyA2rgcMoA6tjg5MPp3fgP5hh3Y1oFVW
 lU3/a55BS/kvq+Yf/G0461+e2znUv8tmF9AoBdg3pXdju+mpWSf1PHIdo1kQYJuUteKn61uceWk
 X218EG8CFNRO6PRVYfXPtrUvAtT9xHu4XQbq5fsd0tNruPA4Fv3EOGQwvbsDXGfVqELJpvh7YoK
 Bt3baCBW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_01,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507310086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 06:48:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221222

From: Libo Chen <libo.chen.cn@windriver.com>

Fix the following bug for runqemu with a file path which contains
vmlinux characters.

runqemu - ERROR - wic doesn't need kernel

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
---
 scripts/runqemu | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 3d77046972..137a4f0feb 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -368,12 +368,13 @@ class BaseConfig(object):
         - Check whether it is an NFS dir
         - Check whether it is an OVMF flash file
         """
+        n = os.path.basename(p)
         if p.endswith('.qemuboot.conf'):
             self.qemuboot = p
             self.qbconfload = True
-        elif re.search('\\.bin$', p) or re.search('bzImage', p) or \
-             re.search('zImage', p) or re.search('vmlinux', p) or \
-             re.search('fitImage', p) or re.search('uImage', p):
+        elif re.search('\\.bin$', n) or re.search('bzImage', n) or \
+             re.search('zImage', n) or re.search('vmlinux', n) or \
+             re.search('fitImage', n) or re.search('uImage', n):
             self.kernel =  p
         elif os.path.isfile(p) and ('-image-' in os.path.basename(p) or '.rootfs.' in os.path.basename(p)):
             self.rootfs = p
-- 
2.25.1


