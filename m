Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED6D0C3ABD9
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 08:14:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.97270.1747210462173289281
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 01:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7229598d4b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E5t2US020403
	for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 08:14:20 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46mbcjrrfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 08:14:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GO1YtIG1WUuy1Z81RrkUJiH3VLfUyzsBSRLjtYsni8UNh1UZ0lm7D+5RFSQa0p3sFQCEa5GBff8ydj1HaLdMboi9BAy8V1oa1QrcZ9tv5md475VNMrzbsYicHpe4bUHARpKoSU4/8Pv7lW5cNJu+giagSLuIETur/RyRgjGPyajzDHxGwIJkDIHJcejkwGeFDjIxv7obh8F1ns5UL1+z2ipRbRoQ0twaoswzSxPiakN4RzSo3WOT9KGCmHegXJCCBDYuwQ+BNXsJoecJekjx4QAiz6qiritKMjyDvFPvvFcNsjEkWSPpv47Y6rEzgotNkXNUrHCHkg85cNpaHA2aNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKqY3aqNmJ9q8MEtPWUpA60Q09aXurhkDODiEoj63NY=;
 b=BqQ12+kHMSO6K/5VLP/Facp4SCpFt/rdKOA7dNHNXsmfDE9u3e1LnY+MZZeByWWhGSJmmMaFgvGtTSyPvfLDTmnCs27Pt0oQ68fth2qXHzJ9MD3huecS2tdfuzFJOpwrxhEZgrPV2FTy3q/IaTltYnBHqsm4bZM/QWmyyDS+OYf9D88v5yf7DeW+baC+L+lUpGoWY+mpu5hjs0GI2RtdyTLUWoQUIsxdybHMnLMvb388O2uL1OjDpw30K2and4c0+M2+QMZn54uA8byghbXm7KbgmUVkbLYvF3wCYMx+rZqZaoYOQSgoVLrH+84CByKfnaen8BNWCFkrEjBMussNsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CO1PR11MB4948.namprd11.prod.outlook.com (2603:10b6:303:9b::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.31; Wed, 14 May 2025 08:14:17 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 08:14:17 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] iputils: Security fix for CVE-2025-47268
Date: Wed, 14 May 2025 16:13:59 +0800
Message-Id: <20250514081359.704657-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0190.apcprd04.prod.outlook.com
 (2603:1096:4:14::28) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CO1PR11MB4948:EE_
X-MS-Office365-Filtering-Correlation-Id: a710c9a4-8d24-4328-0006-08dd92bf5218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nvEpv3iaxpJBzNSfzSCwUClNZp5+f/DMQDh2/vgMJRtrgX9kAoHZgoj0IGHw?=
 =?us-ascii?Q?nluO5lLxBJKOrUvJzHYNs/hKY7sePzBmHEyaxJiwty2DZ24CSLPor047DYcL?=
 =?us-ascii?Q?unQIrPSE5iHHk+x+RQbADXwVvSHeb37BNsbe+5Et6xNrcKtyN+Qy4YrFfod1?=
 =?us-ascii?Q?i0brE0t2ouSDXGG2LPfGETBb8750pLur+9DgdpHedFf2f9tI2VPXwwZgofXJ?=
 =?us-ascii?Q?fMPNnOFHNTysoOAwt2N/5TObdTuD2fZp2Wtg5j/vyeus6DWP8znuHLniQ+fr?=
 =?us-ascii?Q?sRo3xTrtSivAHy5S5jG95s57Ki83SeS2Iw9oQq/8Z5RkL+jpv7HXg4VyIeV5?=
 =?us-ascii?Q?c1RWL0LIyM4TyPISyL1w0xjJ7bIQigkQuV1a47qFOY6wuKJVntfqkbNgM4tl?=
 =?us-ascii?Q?J3mf/GB7R3WcoTt5vvxphzOV1pPtOIe1sMcM8PjOfkDyVC/w0n346qcGGZKe?=
 =?us-ascii?Q?ZYirad9j3VBT0oJZMzg4Effq5CXuSjsoGCGSALv0afPWltB5fyf+GQJFAoVt?=
 =?us-ascii?Q?2KO+tCDJihbRSqGxpZFad1fLeNwYlLptH45tZF3ucwnrtER/WmgsOp1+qpus?=
 =?us-ascii?Q?CB/nTDO8Ym0I9dCQs5X0kZB28YYuF+mz4GHM3P2TBk2kZsA6D7+zkK375jcD?=
 =?us-ascii?Q?dC6KpPEfRAFZCCAVZR15fr1wIK9dXspgmbN05by5sb6SBIISZSkg1dNJeQjP?=
 =?us-ascii?Q?B3XtUkuT2uBwn7ICA738NP0ff35xeYRFjDbktgWYhmlmMOM+erDKgQ6CPcaA?=
 =?us-ascii?Q?gyCFvVv/MEUWWf3yvLQhd+4YlRrh42BxdC8h0mo+dv010E5mKAdizrY7UPOv?=
 =?us-ascii?Q?QpqN1IB/UcsMYTGYJjjjbhM9NuTfE+tTGJjUmF4EJdr6x5WZqaJG7P/E+7L9?=
 =?us-ascii?Q?uqiQIqk/HDqWb0DOFY1Q5SmOuNGeomS0G7l2IcDoYu/koaHsLW1M6OYFSKKt?=
 =?us-ascii?Q?0YlazCCVct3yWcc2gjLeCFL8+39eek994LKnKC8IfkFo0V3AM6gNXnXUfrpC?=
 =?us-ascii?Q?5SyY86eXqQNF9iNhP2bu9JtXMFJnbvfQ+EBsKYN7iTwjcmSqplpMtMHfeL2S?=
 =?us-ascii?Q?0nWyOTrwexrzodD8zkdS89Nb4F7dKSUtoB3jvK/RymlTaoxWaKjDi7QacH63?=
 =?us-ascii?Q?yP11RvT1bLmgPSzFddVVDVaHnrh2yWhFcLGkOi8n6eN+bIbzBHiOLUz6/RLL?=
 =?us-ascii?Q?LteCtXcJB4yqZFvEvrBoZpDjQzmQ0jVb/ilk6wWfbGhjAeE5pI3hkcUqxCoa?=
 =?us-ascii?Q?ya8rcy801UMlycGEyGjMnm7Jqu5x101zg6i2q1iX0hLopYchJrgjxbxJrrUF?=
 =?us-ascii?Q?eVneCowaDw1xCNmtffkAJZI7sgikkm4RazBd4V31VW22fsOs17Ipw4kAah98?=
 =?us-ascii?Q?BevajumTcv0ANGziA1dnMdhC7utrG/cxnXcVnR7TxybtThmYZqhw/oqHFIHl?=
 =?us-ascii?Q?RVcILQKE8/4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LJRqviePvV0IEiNV43dGEbOX+HOxM0gvtNLE8ARXD7gvrvpeutoqq7lF0J93?=
 =?us-ascii?Q?3caFLVKLnOjuop6rP7HziHeFglc00FbCX9CbVb0J1ipenkKuiyXXOzKltiy9?=
 =?us-ascii?Q?LKsLzRDKvpl1a84xLEPz0XiB6u+8g+S2gdNpsh5ssM1A1f5HsAV1YGdSFkJA?=
 =?us-ascii?Q?yxXCyYvBlpEfNjmsL87wq95cjiMGEuOfxRA0g3zhUSWMpF2U8HgCYQ1kOl/3?=
 =?us-ascii?Q?hGvsQkEhR9ES+C6W6Kwyq/yop8Q0oV8FCDlAukwaXL8iwAyxF7OpqHIRzCMw?=
 =?us-ascii?Q?w5bn4x3pSRGZPLJrKbO2kwt7DfIKgyj3JW61i2hlfRdEevoJvzM2uBzzLab2?=
 =?us-ascii?Q?qSelDf4jlNqHJ91kgAaK9r4odOSQ4NNwniEPLTW0YtINlmBLlA3C8TBp9k7h?=
 =?us-ascii?Q?f4U1St3hmmmF9m3pKJWB7skwcJC1p45dd8KAdot22e6U6524pP+29psFiX5I?=
 =?us-ascii?Q?RWyul5tneryhtyN9yhP9+PmLvUxdxTKELeVauNOPl9Py45GLzqkIQozy8FZO?=
 =?us-ascii?Q?vcI2H1NSsDthPlLyfjUghWnk4X68cbOmXJNuk2VPAZkaJkAqB1B5lRkJacaU?=
 =?us-ascii?Q?UivHcNN0K8HlS465QtaIi/LAcSUyE47az1DAFlA6307a/FvTrkdlc4YIXh3N?=
 =?us-ascii?Q?Irl9lYCAy13FKXbgLMd7AKuEoYZExJzC99sAfSbdWxswKnCkHdhRDq+FphI4?=
 =?us-ascii?Q?4f4eRHNGwSPcrkQ9RWnCZQQat84ev3uiMR2D10zQkT8nduEfKi7UIAnnVSqU?=
 =?us-ascii?Q?vAI13Qy1dNgpC0C9fwyL8lSjGkfGdvJrwPqbJXRxoNRKc525q0Z+D4K1Smxz?=
 =?us-ascii?Q?iuAh+q0CfRTBGVd6yqiFnwL4Zmvw/5lAwmtJ+NQ/GsgTazAVa/DE34xcoD0O?=
 =?us-ascii?Q?2gUZQjLSpRgaCTwQ1Ne3chIhr+5MIaajFtH1RZxWr9DXcx7YT6oN5iPRZNn6?=
 =?us-ascii?Q?vxJD6yf6ztDDLdwBjsWP2SXRYfOSycLu1bVz4etFJS9Lwi5JVaJErpb41ugF?=
 =?us-ascii?Q?zK47Qu/8Tmt4d/9RDlC+fsaVMd8hEc9iBX6iHKn/8yqDDEu0TlBvhqBygeU7?=
 =?us-ascii?Q?3WcS5NSWqtXYfM7dXQ4bUuTR3S3rjVLmp444TVxB/Oy+V2RSoNaWmijRWthf?=
 =?us-ascii?Q?Ic00XHMcB+4H6Z1TFwRAdFX3HcotHo4+KXrtGzVAM48TsHtggKV6zFUyAUoS?=
 =?us-ascii?Q?oPorFPXTb+NPY4Kr9dbzYmqNfzmjFDtubgj+HFDTOY+gtRlW6JUSuBp9LE4C?=
 =?us-ascii?Q?l3stJ4bu/sh3k74Ip4YbztfhP3DFg77sapWPhpMyQU8Rt1rdqKskzrKJrgxW?=
 =?us-ascii?Q?2hLTBBQIfh9eCs8dREvIETcp5iH3/gL36QF1BjpVeSsE0gLThh86oYjP/Waz?=
 =?us-ascii?Q?gBAfgcnrsSDSOPcuH7OR5ETo4939P1uG08BgH/8gOJu6DM8svZ3jZNaDLqk0?=
 =?us-ascii?Q?zKHobdrPDvgcAetSsadc3Kn2WEv9ibDkvVqZCeJ8r+t2kDW25BKLEZYXO9DC?=
 =?us-ascii?Q?5jRnpApd6xqH7cJqIq4IRJjyCCDMQcdJ8ToslRxv28MRcAE6nv/8c7XR/4so?=
 =?us-ascii?Q?oqH6EnaX8t0BoWdESSR6AVXLA5K8aaDAwimzGbOA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a710c9a4-8d24-4328-0006-08dd92bf5218
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 08:14:17.2013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZdDnq34LC+yuSVZRZbLGLeR4WN2dPxg2xAO+RFPCTWG8rBhJdL/bk/zAZRQFDyCbT3BPXY9e2s0TeWO9aibrmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4948
X-Proofpoint-GUID: BMRaAYiAub1ravfoY2ctjqmxr7YCp5jG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA3MCBTYWx0ZWRfX2svkKk+JgyY9 sZB0MgN8MKhIFGjP3JWIjSXb756R9RwooYHK62INTxWtFa1a6bAiE4YXllYayMQ6vx5k57c5Hbs AuPG6GhRnch61W7bOPpV6QIKuUwvOo4WEHwSRiPeb9/oKT5jXm/LUKBXA1wLbLC4ZILa1h9hLJp
 Iq2b/N5uq/qclBxcuAFghKtDUcq9jVLUOO6tEVUlF9iKLG0OxhcnRl9oqY/2aRcFB+LQENswkn9 2cm7sGix7EbskLLroOQ4NErc/yKbtlxufCRXpY9By8S+J2R3RrKGAXW+zzaHyVqeZ/8xCu30aF5 QS8bzwTB0LUSGwHZPsyHXFrGCfFaNe+IqY8PHRZ288VCOmETi396oB8Rh7vF9L1h17sbEfNm0uz
 StJ5hoFo5vGr+q1Xv2aWub+YuxCPlYdTaIA3lCb74EhBXXnNNSaNydbORPgiseaGoQyB6qtF
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=682450dc cx=c_pps a=+tN8zt48bv3aY6W8EltW8A==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=xNf9USuDAAAA:8 a=5PjkQvkCQFl6gfXuX20A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: BMRaAYiAub1ravfoY2ctjqmxr7YCp5jG
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=908 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505140070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 08:14:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216485

CVE-2025-47268
ping in iputils through 20240905 allows a denial of service (application
error or incorrect data collection) via a crafted ICMP Echo Reply
packet, because of a signed 64-bit integer overflow in timestamp
multiplication.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-47268

Patch from:
https://github.com/iputils/iputils/commit/070cfacd7348386173231fb16fad4983d4e6ae40

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../iputils/iputils/CVE-2025-47268.patch      | 143 ++++++++++++++++++
 .../iputils/iputils_20211215.bb               |   1 +
 2 files changed, 144 insertions(+)
 create mode 100644 meta/recipes-extended/iputils/iputils/CVE-2025-47268.patch

diff --git a/meta/recipes-extended/iputils/iputils/CVE-2025-47268.patch b/meta/recipes-extended/iputils/iputils/CVE-2025-47268.patch
new file mode 100644
index 0000000000..dd31b79031
--- /dev/null
+++ b/meta/recipes-extended/iputils/iputils/CVE-2025-47268.patch
@@ -0,0 +1,143 @@
+From 070cfacd7348386173231fb16fad4983d4e6ae40 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <pvorel@suse.cz>
+Date: Mon, 5 May 2025 23:55:57 +0200
+Subject: [PATCH] ping: Fix signed 64-bit integer overflow in RTT calculation
+
+Crafted ICMP Echo Reply packet can cause signed integer overflow in
+
+1) triptime calculation:
+triptime = tv->tv_sec * 1000000 + tv->tv_usec;
+
+2) tsum2 increment which uses triptime
+rts->tsum2 += (double)((long long)triptime * (long long)triptime);
+
+3) final tmvar:
+tmvar = (rts->tsum2 / total) - (tmavg * tmavg)
+
+    $ export CFLAGS="-O1 -g -fsanitize=address,undefined -fno-omit-frame-pointer"
+    $ export LDFLAGS="-fsanitize=address,undefined -fno-omit-frame-pointer"
+    $ meson setup .. -Db_sanitize=address,undefined
+    $ ninja
+    $ ./ping/ping -c2 127.0.0.1
+
+    PING 127.0.0.1 (127.0.0.1) 56(84) bytes of data.
+    64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.061 ms
+    ../ping/ping_common.c:757:25: runtime error: signed integer overflow: -2513732689199106 * 1000000 cannot be represented in type 'long int'
+    ../ping/ping_common.c:757:12: runtime error: signed integer overflow: -4975495174606980224 + -6510615555425289427 cannot be represented in type 'long int'
+    ../ping/ping_common.c:769:47: runtime error: signed integer overflow: 6960633343677281965 * 6960633343677281965 cannot be represented in type 'long int'
+    24 bytes from 127.0.0.1: icmp_seq=1 ttl=64 (truncated)
+    ./ping/ping: Warning: time of day goes back (-7256972569576721377us), taking countermeasures
+    ./ping/ping: Warning: time of day goes back (-7256972569576721232us), taking countermeasures
+    24 bytes from 127.0.0.1: icmp_seq=1 ttl=64 (truncated)
+    ../ping/ping_common.c:265:16: runtime error: signed integer overflow: 6960633343677281965 * 2 cannot be represented in type 'long int'
+    64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.565 ms
+
+    --- 127.0.0.1 ping statistics ---
+    2 packets transmitted, 2 received, +2 duplicates, 0% packet loss, time 1002ms
+    ../ping/ping_common.c:940:42: runtime error: signed integer overflow: 1740158335919320832 * 1740158335919320832 cannot be represented in type 'long int'
+    rtt min/avg/max/mdev = 0.000/1740158335919320.832/6960633343677281.965/-1623514645242292.-224 ms
+
+To fix the overflow check allowed ranges of struct timeval members:
+* tv_sec <0, LONG_MAX/1000000>
+* tv_usec <0, 999999>
+
+Fix includes 2 new error messages (needs translation).
+Also existing message "time of day goes back ..." needed to be modified
+as it now prints tv->tv_sec which is a second (needs translation update).
+
+After fix:
+
+    $ ./ping/ping -c2 127.0.0.1
+    64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.057 ms
+    ./ping/ping: Warning: invalid tv_usec -6510615555424928611 us
+    ./ping/ping: Warning: time of day goes back (-3985394643238914 s), taking countermeasures
+    ./ping/ping: Warning: invalid tv_usec -6510615555424928461 us
+    ./ping/ping: Warning: time of day goes back (-3985394643238914 s), taking countermeasures
+    24 bytes from 127.0.0.1: icmp_seq=1 ttl=64 (truncated)
+    ./ping/ping: Warning: invalid tv_usec -6510615555425884541 us
+    ./ping/ping: Warning: time of day goes back (-4243165695442945 s), taking countermeasures
+    24 bytes from 127.0.0.1: icmp_seq=1 ttl=64 (truncated)
+    64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.111 ms
+
+    --- 127.0.0.1 ping statistics ---
+    2 packets transmitted, 2 received, +2 duplicates, 0% packet loss, time 101ms
+    rtt min/avg/max/mdev = 0.000/0.042/0.111/0.046 ms
+
+Fixes: https://github.com/iputils/iputils/issues/584
+Fixes: CVE-2025-472
+Link: https://github.com/Zephkek/ping-rtt-overflow/
+Co-developed-by: Cyril Hrubis <chrubis@suse.cz>
+Reported-by: Mohamed Maatallah <hotelsmaatallahrecemail@gmail.com>
+Reviewed-by: Mohamed Maatallah <hotelsmaatallahrecemail@gmail.com>
+Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
+Reviewed-by: Noah Meyerhans <noahm@debian.org>
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+
+CVE: CVE-2025-47268
+
+Upstream-Status: Backport
+[https://github.com/iputils/iputils/commit/070cfacd7348386173231fb16fad4983d4e6ae40]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ iputils_common.h   |  3 +++
+ ping/ping_common.c | 22 +++++++++++++++++++---
+ 2 files changed, 22 insertions(+), 3 deletions(-)
+
+diff --git a/iputils_common.h b/iputils_common.h
+index 49e790d..829a749 100644
+--- a/iputils_common.h
++++ b/iputils_common.h
+@@ -10,6 +10,9 @@
+ 	  !!__builtin_types_compatible_p(__typeof__(arr), \
+ 					 __typeof__(&arr[0]))])) * 0)
+ 
++/* 1000001 = 1000000 tv_sec + 1 tv_usec */
++#define TV_SEC_MAX_VAL (LONG_MAX/1000001)
++
+ #ifdef __GNUC__
+ # define iputils_attribute_format(t, n, m) __attribute__((__format__ (t, n, m)))
+ #else
+diff --git a/ping/ping_common.c b/ping/ping_common.c
+index dadd2a4..4e99d89 100644
+--- a/ping/ping_common.c
++++ b/ping/ping_common.c
+@@ -754,16 +754,32 @@ int gather_statistics(struct ping_rts *rts, uint8_t *icmph, int icmplen,
+ 
+ restamp:
+ 		tvsub(tv, &tmp_tv);
+-		triptime = tv->tv_sec * 1000000 + tv->tv_usec;
+-		if (triptime < 0) {
+-			error(0, 0, _("Warning: time of day goes back (%ldus), taking countermeasures"), triptime);
++
++		if (tv->tv_usec >= 1000000) {
++			error(0, 0, _("Warning: invalid tv_usec %ld us"), tv->tv_usec);
++			tv->tv_usec = 999999;
++		}
++
++		if (tv->tv_usec < 0) {
++			error(0, 0, _("Warning: invalid tv_usec %ld us"), tv->tv_usec);
++			tv->tv_usec = 0;
++		}
++
++		if (tv->tv_sec > TV_SEC_MAX_VAL) {
++			error(0, 0, _("Warning: invalid tv_sec %ld s"), tv->tv_sec);
++			triptime = 0;
++		} else if (tv->tv_sec < 0) {
++			error(0, 0, _("Warning: time of day goes back (%ld s), taking countermeasures"), tv->tv_sec);
+ 			triptime = 0;
+ 			if (!rts->opt_latency) {
+ 				gettimeofday(tv, NULL);
+ 				rts->opt_latency = 1;
+ 				goto restamp;
+ 			}
++		} else {
++			triptime = tv->tv_sec * 1000000 + tv->tv_usec;
+ 		}
++
+ 		if (!csfailed) {
+ 			rts->tsum += triptime;
+ 			rts->tsum2 += (double)((long long)triptime * (long long)triptime);
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/iputils/iputils_20211215.bb b/meta/recipes-extended/iputils/iputils_20211215.bb
index 3ddce0be54..03dc97dcc8 100644
--- a/meta/recipes-extended/iputils/iputils_20211215.bb
+++ b/meta/recipes-extended/iputils/iputils_20211215.bb
@@ -12,6 +12,7 @@ DEPENDS = "gnutls"
 
 SRC_URI = "git://github.com/iputils/iputils;branch=master;protocol=https \
            file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
+           file://CVE-2025-47268.patch \
            "
 SRCREV = "1d1e7c43210d8af316a41cb2c53d612a4c16f34d"
 
-- 
2.34.1


