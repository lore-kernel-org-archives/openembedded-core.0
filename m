Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6105DCD37AB
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 17:32:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1561.1778175159885247928
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 10:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mhs0twf8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9587ffd4f1=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475PNbY975049
	for <openembedded-core@lists.openembedded.org>; Thu, 7 May 2026 17:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=llhWlUKtlkz7sISZ7Sh5aS16uu8zPZ6zR/EW7RehrOs=; b=
	mhs0twf8ZIyQGIQ4dkDCPb+/CoId5P4TJu39WI9ffl5oD9YJe3nOp/rQ8ZKHYsvv
	mADOGyO+8pDNW3zS9hx4+v00aqBwBIDHb9qtqwR7vsdhWPBbpkhKZnZIx4xqsiWf
	PdlHAoHuAkbCEPsqovZarAg/xSMFL7T8GFNMF+V4aRNRKbWUHB7oWjtMVCsAo9ZA
	WnIqhhljyG9FRsyMsBZ3fjPDwAha6Txu2PoMDmN6ztBKVKLEpzrOAEcjyWcfo0GP
	Xj+Z/inwNkJPxP/rmv3Gqgv+0CE4TzJ5PRs6jilwonKz1XzueIlXYVW1BlRBm1Br
	t5HHZyOPeZO6ESJyNqjbkA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011016.outbound.protection.outlook.com [40.93.194.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dw8t5xw0m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 07 May 2026 17:32:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WpK8moVQKBlelDlocsN9f7VtHC5hPFEBfzYDQ2f30tfVhyfhWv6LKTGpqMLJSg+m+DhSs6eQHmU4BOH1G7ZBF7QVtX0EcwxY7q+g7F5lJG5kX3tb0dMVNpMTVfK5qg7V+b/Lmz1prAMn5D9FODsbf42wFmiUHvPvuLmCTG7RbjxDFHu5NGSikB2EkhdUGBjHXhvr8ApGgiVVQetzQyJYRMpQd9BmZM3lCeH5Idm/ECp/XfkkZjHjTSitdTFOm6NcZHCaeSzp24dAvAFxpWKr67ATidr0r3ZkgsNCQKkojyTTXOy1Wh3rPLkpECfGVgXqLbdmDB2kTAtRrEOO4sytdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llhWlUKtlkz7sISZ7Sh5aS16uu8zPZ6zR/EW7RehrOs=;
 b=QXkj2yhhKsny8YBbrjAdyDh1abHGwHIOMDkbxEHlN8KNG6fFyo1qKgsAkB7GlXwIplWB7TyXivvbHILFqB4Hk7eJnDaHZU+/TuVxsgqJsR7v3y095wHNVwmxWmm1TJvQwVP+YzZz6eYnyq5FIOS1+cQrcam66RcJi7bAzjkxWwVrK4UX4vhwQgvf9OimVDW0raQ3d8xYtcMKMzn55zTlFSUKcQrm3E3esjD4BZpFMxoxYOSVOxDCUCBTnVY7ikUcvYJcMlGSxhHKDD3nRDUuekshFuEtUcU4Ma7rYArYu10+C7ihIgzy2y2bQAwPaM+k8bymhDJFjNjLVKxxDF2/yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 DM4PR11MB6288.namprd11.prod.outlook.com (2603:10b6:8:a5::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.15; Thu, 7 May 2026 17:32:36 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9891.019; Thu, 7 May 2026
 17:32:36 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com,
        khem.raj@gmail.com
Subject: [PATCH 3/7] glibc: disable automatic libatomic linking
Date: Thu,  7 May 2026 10:32:07 -0700
Message-ID: <20260507173211.672855-4-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260507173211.672855-1-Hemanth.KumarMD@windriver.com>
References: <20260507173211.672855-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0462.namprd03.prod.outlook.com
 (2603:10b6:408:139::17) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|DM4PR11MB6288:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f845c00-023c-4f94-b699-08deac5ea132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|56012099003|18002099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	2RiksMVe8c6KKNbqNtXvZw7qGIOzS+d2Twvuzew8SjQ0kuOUC5If2M+0Iuz6pJh9+3hO8N7am9usNknrGP3z4CwdXWDyDLpza573zGJVMsgXFGoyhIwMSUa+e6ZZeP/fRRPEhVfwY7TSWqWT5nblfr6aPLNMIaYfzj82YKzRiU/H0vQbQhBuVElr+UnJoD0+TKjGl/GC3uDFh9q+mrmRJIE/g3HnY+OMIfdAIW4fqtg0P5rZ32/3kXe4twea22RyMgdUbEgkATESLk/3A3/TixnNvoG2nQR1aDQo1wBD84BDj2Ose0UhZ3XEV027TPatwDK/iHrg2ggzblShIR98jlBhiHddFDKPsvnKBRIEWE7iYBLFrsJ4dJHETwrQJljFHMRxAhknJdGj9FX0eNE/90r/GF1+R4Vn1GaIh8Be2wpClybwPPTpSBqaL6f4bG2HTJctMDeHJyMqw5NCneEecl7f1lGpvaBC3pzU9fUGK55h/WgyP3udzzFWq/8V7G8xS1zTTi0p10bgYZ4KGOs91oX79W3KiSf+q4/+Mi8hAXDp86xcdaBkNlsAJ9GbeM/tMGCfUrr/7vKpuPLeEyvmt+nt0xvtPjTjf37LpZCKgDEMTcboTShvna5HVR7ZTy8Z6n1/lHVe0lwFdHpETQfAgARZq8UczS/ZmnvkJsx5zIRzbk4Y16xljZ1wh2gCaSc4lpt8YTZhcmPFsnSW1FQYYrcsxRQa0+qI4IAv5AzkDKXo+yZUYBqCuysayP54dGA0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/fgvZEfvubogKazfr0eAmT+QUBiSV+in6cXpsYl7jMRnI1Lw3swnzFV7CBHL?=
 =?us-ascii?Q?P0LJ1Q4VtPjDd+R1pCpl5M20lz7wMjxfeGTx+wNSIsovAkoKmQnLpGYnVM5a?=
 =?us-ascii?Q?YJH7ZjMMIHtMrN9faKdhMhnsxnGfVWuqStcmP0qnBoApTEnKO+jeRByZtToI?=
 =?us-ascii?Q?Hv3pyXvK7C2jMVzmimIU/96QG+9x/RcBq6TMxkx58mYTtHnT8XkQjaGBPxLl?=
 =?us-ascii?Q?uIfQSuJ1b+hRVo0nGm3TrsVEY9uJ4ukVh3vwF3NJ9hrnZr0wb93AFjfqBQLQ?=
 =?us-ascii?Q?8CNIlqCQzEidvPZat+WzK3D4zqaThEiN1kmMpKt0HTMGe3Rn2FUUoDL+kOSW?=
 =?us-ascii?Q?MHvdhmZQTpHCWl/97FPFB58mZ9FTBgRdMm9kAeA2S//q8gxzvbFEOUGQfqkM?=
 =?us-ascii?Q?TTnu4SC1A/WcMgJl+xZWPhPviJXtbsRNZOgCJHOXPUkKKYNIhWZpyhjRxebH?=
 =?us-ascii?Q?0gyn2SAYbn5l04RPoYwSdHxftlAfQO0j6Px1vQ+7aDbs/NbdbqYdap/u9fjr?=
 =?us-ascii?Q?pYgnv9/sgscDG+jtF7bcpNpm/jeGaLXpXGJ2NMURvewxwt/jyZ++NM0/v8Fu?=
 =?us-ascii?Q?kMg90pa0sxGPjpeh/IX4uwc09APJ4YEasurAO4+4ft5aPCACfgajB1m2aqQ9?=
 =?us-ascii?Q?W8k/IRwSvC41HYD5dNCzgEPwkypTKcjxKovsQTaFikeYSUFhv8K3cOGF5fG+?=
 =?us-ascii?Q?Y+PcjAJapEZK+R6ok1bqH3q4d/AmfrtiW5YsfXgK4xF/oSxp5nvgzlngl1PK?=
 =?us-ascii?Q?xgMjd5XOT3Suo4DVq0yW8lXwnoOfTx29rx3nMBGdrM1xTbWBUFgERhBTbokQ?=
 =?us-ascii?Q?vAD1v3XXUB+oU3ioxJ6bk2rAQedpqC5jaaQ1CiD7K9VtbweXT422ZA94FP6C?=
 =?us-ascii?Q?QiudQkYLE3txzlga4daj79cyG3UvxaGvkRRFBLsqKEej8WVw8TjbsNXX4o5C?=
 =?us-ascii?Q?F0nbAnQ60ylej5XM1/8y1IDWuMf3ova+j8j985DNh5DePJ1ET13mFpDxExtU?=
 =?us-ascii?Q?CkGsFdZ1SNcyx89iuhOoEWtR6WGGHWNRqH47CS3wHL/IoIjB1E0gMFHxqZea?=
 =?us-ascii?Q?xycjL8+mzBwSQliMC7Hyga8NGEqK/ZRr+lYYOZgSM5jweLAlef7SpGdwkpN2?=
 =?us-ascii?Q?AZANYy9B93ZjEsIaRVqSyCklTMvqvWtiIHQpLSZZhWo3MWIrfzb9oZ4es1in?=
 =?us-ascii?Q?gvfBQ1YqwUHDAqzXu2oEr3BddHF/dDKJWll8VUS1Gx7h67lp9tcqsWgEL0bS?=
 =?us-ascii?Q?EDt3FNcPcvogtUqMrkR7qRS9PynaiLlEIWRJ5JUtnEIc0hRS+K9vliK438P+?=
 =?us-ascii?Q?aB6TQflcVpILuXG2AOqet5Fy8U7Vgt6VbJSAWPBthVT5JLSvy46WYvBb7N83?=
 =?us-ascii?Q?Tl0ijGWYzU85P15Xbep1tXB65SXVs7AYqgZ+ieDoDGH6eOsUCzfml3mk0ufY?=
 =?us-ascii?Q?h2bx9tUFbsJcVhTccC6KH9aUXI7RE1g2O/F35j3yEyln4nWBCpup/UhLaacY?=
 =?us-ascii?Q?Xe9psPIz2KiRfY06YtM6MJv/6Nj7qjQbS6bKfOgBGTpX5GFffewwNnctQ8Gb?=
 =?us-ascii?Q?q9kPgk0pbxjdoFR4TDpcbvcwuM0sztfeFFB/GKdY531lJx2KNt2cEGP3KD3S?=
 =?us-ascii?Q?zIMDsf33aS2cuaZa2X0A7+oTePzfBg3iKyBRhyHz5HDt0mGUSvNCsk2y4hXu?=
 =?us-ascii?Q?weaKnJtovux4AuTZ39lJlV/GYiL+STWFmtmylIdszeTfk4ZMX0ZFu/XlNV5g?=
 =?us-ascii?Q?pNL98M5hOjhq7OAzGJ7caOuSJWojaOs=3D?=
X-Exchange-RoutingPolicyChecked: 
	LHy5RuLvHEPj2jOBaGABy83JjxnV6wNh33ETzd4o2newqoqOGH84yOuWcQHvPJ6Gk0HZ/Mp1drHykeT0UJmW2m37S8cZANL41rQsYcc2GeQgcmJ071MP4/Etyes9gPAE8i3+Y1clk3G+xX6p9fARvbomow4/PwFn5LgnQjEIqZScJ5cLxSqw+OyUDwhlIiedoz6CiXZeuHzqslQnstz2Zw2z5g3OdPTqz626L/6nVtZoYUlSw7Lwu5Le9uyv6nj1BicOkOnDYc4xjoE1jKFDKXC3RNEE5Ob/6hnCqKagDJdEqMmB3GRYfqeGXgxNy0y+N8VApSbU+krX5PR3BJR8pQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f845c00-023c-4f94-b699-08deac5ea132
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 17:32:36.6279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PVGOafj5SshuQNGpoaPEGBysQkXl6Wie16xuf5MzQkECbKTdqNd9gUfgBRe0EPrFm34pHbYrRA1PxkMsMyJQrueXgtB7vccavkcx5Os4rc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6288
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE3NyBTYWx0ZWRfX5ifCxqTaOX1a
 4W1Y98N4A9pEbTqKI5EAYN0QFY2nkbPgRqjJVLRFbr/zi1Dcb9AkT18cVt2KCAvFeSsb6cZ56v5
 4Eeoa0uyYhnjPsnplgfC26BsZTWPtGTAeLS06FoB0fKrbE7oCk5YXj0VQx0UAZ4m8G0Sl86o8dX
 d7KobgOAlKUFB9XmfPCRrOiwytqD08thTFMcOvjiAsGh1QEs387AsAqfC/vQ/kxraUEXyMzVE76
 RnMF7YAAgQx/Qywx2wKOfh2SQeWQySh2iMTTsSsN1JAo6fTsqSUY0Kqn4LaXNHVF3vlmeixaZNq
 FGKi2yd+DoIip2VHeD71qUu6+wmhblC/adqXE4NrDTbMrz4N1ndtkANHBnuyQExBJ1w8f3FSQbw
 yTyi/r5UvwMv0kmmvTk3WSlng06LnoT1iCjYfZhyK2IAfg8eGjX2tpZXEUT6+vSlprUFBED4QZY
 FLoO0RVpeT3rn/LTOLA==
X-Proofpoint-ORIG-GUID: wmu1MwPbdBhBcqD1sBbHAadhqvCaspF9
X-Proofpoint-GUID: 3sb4-Azqk-vcq4ygBzBRGC4AAl4BXX7l
X-Authority-Analysis: v=2.4 cv=BcLoFLt2 c=1 sm=1 tr=0 ts=69fcccb6 cx=c_pps
 a=hqw49duEbq/Dm1LMQehLaw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=_ZnwpK3xq_8UVYgt9nAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070177
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 17:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236608

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

GCC 16 introduced -flink-libatomic which automatically injects
-latomic_asneeded into link commands via LINK_LIBATOMIC_SPEC. When glibc
is built with a GCC 16 cross-compiler, the compiler would attempt
to link against libatomic which does not exist yet at this stage.
(libatomic is built later as part of gcc-runtime)

Link: https://github.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d3d40faca10ea2e

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-core/glibc/glibc.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 30d93bca77..ac96e640e2 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -49,6 +49,9 @@ EXTRA_OEMAKE += "SHELL=/bin/bash"
 # bash but it can be configured by setting KSHELL Makefile variable
 EXTRA_OEMAKE += "KSHELL=/bin/sh"
 
+TARGET_CC_ARCH += "-fno-link-libatomic"
+SDK_CC_ARCH += "-fno-link-libatomic"
+
 do_configure:prepend() {
 	sed -e "s#/bin/bash#/bin/sh#" -i ${S}/elf/ldd.bash.in
 }
-- 
2.49.0


