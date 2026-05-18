Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5DDCD4F59
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 11:03:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6065.1779102232176393245
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 04:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KC5ZzDtB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9598960b98=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7oMgW849712
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 04:03:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=THXef+1OePtpzyeKpaoYawlJdfAGTKza42RXE4ak8ts=; b=
	KC5ZzDtBgmIJCj3TnAjzN7CcasJjXKM9bIjNWmeoR6Nkj7632tdAOd5xe6CYnbkI
	YLVfS5FroGb9ytoi8Q9UpEKg1Ii7NMy15SsZ7zHCH0If9TUCNhNx+JPhgieIGu7O
	/mHZX/YYVjBriPegKc7eXYKB/8o3dlx4wT4EYkS16vYTFaZOG0AZn9BvxA9a5soK
	hJp5nDSaI1ij3lALNeaGjcrQTm6ENKarK2pMm9jgJQAb7jjC7L95KhRDziDJmqlN
	KAStbae28k1+6TM8HPPEpi3r4xJ81+fzm2zO1u7soP+pHuprnGMOdGBl9MVVd+f0
	JsbrLp40/P7IFoTJakHVCQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011046.outbound.protection.outlook.com [52.101.57.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6kux1tp9-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 04:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZqFh5WoK2vUy3EaOewys86nj7xjWWu7RYuoxqRd1xj6tHGhrWwdRnBDCarQD0bpkFS00mOaSiKqAgtMoKKEdVyXnxJdnKIJZmdjjtQAP9od+JaJUEB5jSQkCs0OQ8yWBlUDhFzUuDsaN3pqFl6m0FJr7Pg7kA9uW5E5czf6w96jiOy81HuKMwOaAwixpFehBHSmcX2BQjkOG7jcjEn0wyjQL1Or9TmNFT0TAFFZ6ZgEul7XBxZAwv3/MDw91nv0cnecr/2Y1ZGr6CdpQzd528Zfe/3NBEu71DuEtiAQe5Px9IP+W8+P8U0qh/d5zSY5daTUm6kafkbj4ypIAO3DfVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THXef+1OePtpzyeKpaoYawlJdfAGTKza42RXE4ak8ts=;
 b=bttafvfDepwJQi4rjfO+v42C7bwLfxSds0Mu9gM+BUPJ8qwk660DkdcA+RZDTz76VgShGBG3SMvLuy2n4Gg46cgDBwqBln8s0g2ApZyF1OvJQTcNIO3HmWxAce49JFNEBHmTut8p342f/q4XA2/7dyEcvYSEEiMmlBYWqlcNV1+qmR1QAy9c4Mf7lxSTaXcN0Qb1Y8dqh8ILi1aymfhE4f83J1bV9BNElVxhTM4JvXRfCM2mn8bLx1H8F8k4kWugT5i8jOgkC5iIdYnLlVPP8ri9JJt3v8WXR2TVDsMo3lp9DHCU1Ay0sOnnzzgUbRGh9GL7EOgejoBgaOP3NUXOEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 MN2PR11MB4693.namprd11.prod.outlook.com (2603:10b6:208:261::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Mon, 18 May
 2026 11:03:49 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9913.009; Mon, 18 May 2026
 11:03:49 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: khem.raj@gmail.com, Sundeep.Kokkonda@windriver.com,
        Randy.MacLeod@windriver.com
Subject: [PATCH v2 08/12] gcc/libgfortran: package libcaf libraries
Date: Mon, 18 May 2026 04:03:23 -0700
Message-ID: <20260518110327.2347543-9-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260518110327.2347543-1-Hemanth.KumarMD@windriver.com>
References: <20260518110327.2347543-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:74::35) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|MN2PR11MB4693:EE_
X-MS-Office365-Filtering-Correlation-Id: 093cdc79-f828-489e-5484-08deb4cd238b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|11063799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	iHgxNW5NuP/9QvIleqmdfakNSvVaYrpK8q+HsUn0IiRiu9zAudNM2xDJPbaGNqqZS7y7dMA1tkw5t38eJ1jgia3Mdag8Aw2KRV1/g6TUO4e5T2/+oIQnnq1vxPjDTbfELdSCuAz+maNvlxDV6jzWO6QMnxD96igZRSD6+1TpGPorOoDTj4az5sT6cWQ93XxZLPBN/gJudzJFtU8a5SK8uwkv6V+LTVTywu0VM8UGIZr0oFeFYLQfayXRiUmgtMnzpVdNNC5WT9CDe0fc9+cxif/MSj56rY1UweB1P3rGF2FhE+YvbMoMcmmCgf4AOCp+M3Ki7VBlIPe48qdpEpuWvy6R6OA8wWT7oAHyx70bJo/bDW57QHw1FWelLtcLXfpNc+aP+62AUv9xbzh0nUYUCmPt4ZuZVGglocRqjWR9r9fH25nedbxL1W2tBMIvUSNIMcU9wC184iAJM0C0Uj/xA8EJEWiOgUUWOMis0u4ZHmgpvGhawuRjhx3KcelzmeCmR+Po7hijyLROmTjcBklWIROCvVhEKJ1tX7bGFxF+Pnawq8GeYbiQfHs+Ez5D6sRO5lEWXFHIwpfRXMJCQYn+ghLaaw4Ms2w4uhZRWZDIW9BKhjgSggFhfbr/0IzkisMD2SNUWZRJGdvPLAPT7OUdD9OjfGgu0e2Dk5iqQYMD5pQ90VOb53GQzrZLkYLWrnpmxliAgHRnXdiRb5lAPAmFErR/F4wVvv1ZaD8xsg3ejDUJyt4IEvJ3ZTIjWrQQc9HD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(11063799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/XL0APmhmOM21qrD1CJU1jUjYfzql5xV/94orMQT8321A14T2Pd0e8WxMQ3O?=
 =?us-ascii?Q?UyXfyAnK6//bNfEtuQ6SVUZ8NhULSkvAVAdeRmRiOGOvi3fBMr+Dra4aFA3a?=
 =?us-ascii?Q?n4SLlxX3Y+4dBXc189dv3gsdAfwxKHqhxwRlJAxEcRix3mmRr8xRQB1pHo4Y?=
 =?us-ascii?Q?IOCw+YTDrL8L95cLtw4Tl6vXxl7nn2PtIfYvImr2G2OU3TSaiavXIpBcXr4T?=
 =?us-ascii?Q?BxTpwtre5MvPAZaGSe23KXLJSt631iDMXEsew83DF0EVnRoJH7V95GRFfmya?=
 =?us-ascii?Q?Gy1CSqO8B166WeovdQA0cPOqwzKst0JXgBuE4ekSnHB+Tv3GE17I3Tz4sHQ9?=
 =?us-ascii?Q?oQGVuOH7MF7KXmKOA7SmZMIbyzP36umBM6edCGwnXCwVrlNkMD04bvQ7rcSr?=
 =?us-ascii?Q?Y5XaJ/sPUDtEt9wWGZTEGhFa2V4iqAOVewHtXpXc22MJW7p5aRNiFeg8ocwE?=
 =?us-ascii?Q?lzkRCxFkWUAgqSbyNTGi9/VrRjmz+rtQPiVowy0/xXPi05PaMagdctcoIPMM?=
 =?us-ascii?Q?ZbBdwkrWGhjnkaYqPPFgzLuEFLUNsdbfCwYxcmcA2+jBHrdAl17VvcK7O7Kg?=
 =?us-ascii?Q?mY8zdxHc8Ou8sMRN60EWJLL7EdcU5jPNTZqK/JpKXGrAt1AT4Hd+QsB6lV7A?=
 =?us-ascii?Q?amrOuSlirO3Zfpcn6EWXvBM2hqGNFPo9veYZpPSFgCwiksL0tBzX/55OVD7H?=
 =?us-ascii?Q?uD/XnyPBk5obhRGNDb5Ns3nWdhSMjegixCdC6P7rdbEBqsdGYoEgaICg32qk?=
 =?us-ascii?Q?PRxIccsGWCh9nRlVO2Rk0/UIHFXXQQKhoG29bAC7IQIrGpnbRJWUm7oTM6aW?=
 =?us-ascii?Q?7J2iCQ28QlcdzHb2TjyWyjtFhowSPhqnxkEae0hH1wmVv4q/S2EJwk3RcQIF?=
 =?us-ascii?Q?WcGkcKsyqVRrdQqcSFezZy1nkr1vdkF7K5waknD/pxOABtdgBhVyChd7vGOt?=
 =?us-ascii?Q?ep1Yqsi9j4Iq3uqXoYDTnwfZs27Z4hlkMIUjkPJopXRlDLDM7UHgsCeQmhVL?=
 =?us-ascii?Q?0ReixDNutwPJZjmSdK0l0JOEuaX5LXLWlQA4cFZi8cQ0Xn28Swr+29JXYHlw?=
 =?us-ascii?Q?cRuBlzey9ZT6BsfMLYp58fremlIqLj5AaV74fFKl1PCpLyyA3Qps0iURbHCk?=
 =?us-ascii?Q?GpUDiXDb8LY1H/QUjvzMO7gqGmRjzLv6v8RW+JyIhhzHbf4r88mlfymva4Q7?=
 =?us-ascii?Q?wzbSDKWVntHkX0kzSEJFYGeihmzLQ8VXUMV2zd/oGi6RXSXMYzt/gfWgHBy9?=
 =?us-ascii?Q?3OimfbpnHbGS3o3t5yWQ7Mmb7Ccsz0ObAs6VqIY03H8awmhoqx8pmVBQr7Rt?=
 =?us-ascii?Q?F06qlmWfo5DZB1Ss2BJZQ/AoVfRQpOkxBtpVnEvBfqFjM5G6zavXXf4G3CR/?=
 =?us-ascii?Q?wXLHfcTHtjK/s/bLnsXXKnbZfBSOWY7xJl3CRVQPXkokXBWe+Ukx1DRWjQe8?=
 =?us-ascii?Q?pmM9GkAkeciVk87Kc9d33OldXgCyZQN29Cs5quwFQv3FN1M6vsJmx9u3qR0E?=
 =?us-ascii?Q?a8O5DmQ8Z7Wip9mNKiNpQi1CwWz6t5aOfnh2dusCWoYOxU2bzEn7Q/SJ415y?=
 =?us-ascii?Q?jDLrJaHgXXsRuqpc9oMzfVAE1t02C4MSvuC298yGWt3j5kZirNJZ0+x1BlFB?=
 =?us-ascii?Q?ZsiuK1Fe7NuJ2dajTQ+pIWsutuzkttfaGCzVENexeJkzYsWTXWIs40BZvlgD?=
 =?us-ascii?Q?XIAX5MtCchBMFAHHbWw2mUa/wgOCIAs1XBNQ3CaVnPa3SnpEuZL07k4nFyYL?=
 =?us-ascii?Q?1kjmTfzq47CnGv9v7ULzlgO1gkz+ygY=3D?=
X-Exchange-RoutingPolicyChecked: 
	XMGgqg6iLiM/JPEkIToiz8hnVS8TX/j6b6MCNVO9ogPX+aGQ7//dP50uM+4g1Gz2XqAe6u3S6mW3xuwcMU3ZLupSXlrYsvjVhp8lo3P0ANEbh6t1P9pLXjgqbRTUBiCNMQ7eVuUUti3P4sl+L8j04aVIXlhfVXmP2B/5AOCCXyqNqTjZYUGKkR4rviYAoOQ+21k5cL3atDap8yQQENnuG+Puxi6rqGHsziSAXoCbIzuXQ/nFA9zBQDXel2BuH8VSSP40bNGM3snI/lXam+gtXxAXRGZ6C1Tj6xkurmi0zH07X9nJd217yUfIiRYjCFobvLNPsIKVBc0mQfbP2A8IpQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 093cdc79-f828-489e-5484-08deb4cd238b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:03:49.2466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Wx4Y0P6PlubFkxABlf9BT4wfZSUBCDHPoHDMav+uccQkBTDlf9XY+FEm3wOZmIF+FBmd/MngfQfjZkQo24XBJLwzjcSGpKaTEVgbM90Kns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4693
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: mfa6p38E2ra4DNaeUv3k84rccg9I-abZ
X-Proofpoint-ORIG-GUID: xxW4QweUoJFoRMyEw2sSeuknDh5V_uBt
X-Authority-Analysis: v=2.4 cv=NMblPU6g c=1 sm=1 tr=0 ts=6a0af217 cx=c_pps
 a=foOfPl9YvWvIvXDtd8Rkbw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=DZa0YRnvEpGXjuqStjEA:9 a=zZCYzV9kfG8A:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwNiBTYWx0ZWRfXyD3IODYlWh3h
 Dqhg1qrEr8+orpFSGUlZO/KZAMPfT7wJgqilQerTX/4vU847Y78FPZ2KrhkZnzPbGO5o7INE3ii
 1Fn30Po7cchbgOrYvEvBgKP+arqnkRYEgNTT4Ff/C9jZmv3gYyv5sFZajBoZ5HZNjHyJ67AbIXT
 sZfZIiRmmWUIs5tGcuj4PedtmlzihnXJ8vWIyt06t9AVMRrwucxvjLkGj2/tEHRWoaWiVTqlMvI
 kyYSWng8mQ5cveh2isFoj5pTq2gOKN6mRGVwAEwT+jhrgZebyzIwPOBG2FHLqGlb/aJhVCY0duf
 IVAVUBaKVtDdFM8ZEuYFXX2Hqya6Yc2EKXl+zUxpR+JPKWKbbODabBhJ10RAAdIJXDJYl976p3c
 M8uMBCs0Y4V8dcR4908Uq5CjsyDNb4qC0SJaOsa769AhTcQyb6QC2ei56X8Cs4SLNNMWCD4yNpI
 ptZA81kLhBdVTJp7y0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 11:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237227

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Package libcaf static libraries installed by GCC 16 to
avoid installed-vs-shipped QA errors.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/libgfortran_16.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/libgfortran_16.1.bb b/meta/recipes-devtools/gcc/libgfortran_16.1.bb
index 71dd8b4bdc..6ad12b73d8 100644
--- a/meta/recipes-devtools/gcc/libgfortran_16.1.bb
+++ b/meta/recipes-devtools/gcc/libgfortran_16.1.bb
@@ -1,3 +1,4 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
 require libgfortran.inc
 
+FILES:${PN}-dev += "${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf*"
-- 
2.49.0


