Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16325CD5BD5
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 12:44:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19539.1779885872358190449
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 05:44:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=py7oHWUR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96079a5f83=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8nvs52856730
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 12:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Q0PvPsfSeoj+1CzpiYx7CxzeXYg5X7NUj4Nm9LrnP/Y=; b=
	py7oHWUROsUn/DJy3lHBvQU6US/t1qtJKdgnwdt1z3Jzlv/rm+ptqF91o2RHZXdy
	JJJc7rLJ+gEl5Lk+O+xjXrG2lXJreK7ttDZV4BeNefUuontdUEb+mAu/2ra10OMs
	Av530G4jLok4oOuWpc4OikcYHJ7ji4K2DsfeBSoT/Hk+OqGz196F+2Ff7OTemLN3
	7X1W7NhfubYIXPWj7xMApYzZEz8YnBt0L8BevO9zehYNA3MIAJ1N24Ca9EEhpssT
	v4PsYMX70z29UHSOvUVz+x6lktbciWAVWXKyM0pwXJx21bMUMXzLT2wJdcdS6Ii6
	m0SQfEwYQkTMbmUZ+xfM5A==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011032.outbound.protection.outlook.com [52.101.62.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb1f061pk-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 12:44:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ikz/kfiw6ByIfwq49Y2rTM5SimpgtA2TECbJqOX3DOGZt2b04QOli+QxVHGp11EmPVVIJ5ACWbRY2s8F9dBg4LZVk82qs43PTu6m6R/eJxnsPSHtQaHSMjZmqk+uVpNsWLk1QhR7AHArqlGleWtUHQK2BjTgI49WqqP0Pbg30PBzpeDPq/YmwmTxuOOn1jicHkQbdqgaTixwp7Ttbeo8tkgMkcCQExz2LrKZ7Vhsz9cyQUzsn029mnruTJjHWiDkJZV85PO6FVhDZKg+y26lX/ZYbBqzIQuANHRaSefsJbxCzUwXgpxweG2WNUt/jLmHJyGbhGNLKZjd6UN7+UWSGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0PvPsfSeoj+1CzpiYx7CxzeXYg5X7NUj4Nm9LrnP/Y=;
 b=er47tGlDO+rVL7IZpXbSuQOhlTNTZMhN12Ueb2gtJiA1wLMy1UE8BrihEo618VlMXdpFnmUsWDsOQowXfDve6XkJP8+ky1L85JSnbIa/+xu2ypkHLkGrlKQ8b+6T4sv6iJv1P7fhGgx4+SbcUA7xFwKw6XKvcD282nJT5ZoSmfqN7q+Eb+bLI9vFM7nlCeaPKgG1OUAYZ8e/QNUQDj706mNfuOZnoui+/giPjjSCLg1+r0losaCr3Ue5Tn/Q0OwXrC3agEapquLxRNsjyAKUt+ya91GivwvQpLBGM5EVnS02E6IYDv0DN/8kQ2zC+fTofMYNW3swKUtW5C7mVjtbXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 PH8PR11MB9973.namprd11.prod.outlook.com (2603:10b6:510:3d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 12:44:29 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 12:44:29 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v4 4/7] gcc-runtime: avoid passing MULTIBUILDTOP to libatomic
Date: Wed, 27 May 2026 05:44:11 -0700
Message-ID: <20260527124414.1728434-5-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260527124414.1728434-1-Hemanth.KumarMD@windriver.com>
References: <20260527124414.1728434-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|PH8PR11MB9973:EE_
X-MS-Office365-Filtering-Correlation-Id: e277aa95-bd9a-41a9-4e5c-08debbedb16b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|6133799003|38350700014|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	KVkExuZK44h+v48xLKvpgzVUVN8TG0UwWmI3PSl/eUPjLCNhYP88hmNxkH9G0i+P5OzjPaUeXc5wZe8I3Cd7B38WsQvU4nBwynRcxoint8nIXWAw+vU/+url9+SGUQDFCXjUVlM+udSsSf69hGcQAjgLEQWrtIU31KYUDTBzRWNy+YrABSJ/W4mYZOWJhAFziogah91hEB4XwwcY71cEs/7Yz9UyQuEQfdar4i379kB32UofjGM9xG0nb3MPhJVUwV7VDPG6LTGL5nF1s3il3hGwBM2lkWK/jipx3TfjxePL0kJFS5VFOcI95lGM9lB79XzZgdxH/z8DslZjEYBAX0/7nd+A+EtzWagcbnvt9PonY2z9Om+M77avDbTvnQoNgIb4X/Z445JTW4jEeTxSi0/BS75N64U95rcMiz92+DPfEqQ+7xnZbn6NgwqpUQf533J2UxmEg5UzHTwsMqL2NuG4a3x3a+Y30VJzq5QhJzHg2lCMx4qQta97ChfNuDfX74w1ptQe2N4h9p2FtL4Rn7t9mqc0JIsquImL2Btah7fcf3uZd8HmJ3HXgA7Nwo8RAEYT1V9mNJOJu9/qF52d209uwlX/6Qk6wrYZAbcggwAqxWQ0xNFonWS8jX+xKtMDUrVvKmePBzdJQd4kGBsl5RnhU+Nm/P0Wf6chQUGWSyQL/FXp6v8BNWbszeTmscYNTkvBHQnwMU3Z33GJEIl0zGDY9r1Urq6pqb3B3pv/V1XhmIjW7r9j+wNbFat11CrA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(6133799003)(38350700014)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4ViLCm5HEKufN2Njn3VlBj1wb/gFwhgAEGCoNoLFP5PmPfoA2Jzjek61FDOr?=
 =?us-ascii?Q?hJDZmemaohe2f9YzkJBhX4Wdvw276GZtZ2CTyxOYZSlA3c67CcJceWNdl1Cg?=
 =?us-ascii?Q?ni0eoA077KNqLnobVOupxBKPqfe8wpI8Rie5/bq2BKlFi4jPODJLFiVzEg+v?=
 =?us-ascii?Q?8jhQpGMkp1Wpr+uW4DL4cAE+rEatZmTa7CcQ0SlmF5UgzUdNUBU5zZPgyAr3?=
 =?us-ascii?Q?shRKp5Wp2tKs2XQoEieeF285E9BwczheVxX8lzHPM9NYxbZIOsJ79hXPCYbW?=
 =?us-ascii?Q?lhampuanl08pF1cqG4gI8dXh6XTYojdDWg0oOjd5KKOc+1gLxfV8SfbzV5kW?=
 =?us-ascii?Q?fcw98kY2O4FgVI5d5aGL/uhnTTs89bGG6E44NFkuDxNf28kH9tnDenP1GthG?=
 =?us-ascii?Q?Us6O101ZeQbkxn2H0vz3zelx0L1ZrBjsJKS/+RW+roOjTSkI2NHIm2eT3VIM?=
 =?us-ascii?Q?ur+KC0ST9JPgVyYK6kHxIMRXPKF892tVGCTqgPfNWSzXVgfcUwmnuNoGx5BA?=
 =?us-ascii?Q?oIzGArniDvxUZQj0lR0w5f5cvUgGZNhRe0xAhWlnP0jnOhEYVzsfDzftQLZn?=
 =?us-ascii?Q?thL72VCpblKsX1UNxW6U7ST29r0eyL3UlGc/5Rl7Mb4qpsfvKs7gRXZNGEky?=
 =?us-ascii?Q?BIpkYE2sBvFsXr1L2WJnuwcgwgomVlvqk5zFOkC5qEoExvV4W0mlh/NJGg5Q?=
 =?us-ascii?Q?WtbXpz6zPu2K6+ghn6TKcAhQHAtWRi7vo4tU2u4lEmVBSwHUNuWfsOhdkWaF?=
 =?us-ascii?Q?aIXwyjyiRSyFMkTvjRxjw3eXpGEfFDkSw3zlfNTuFWWByGUkNqiFsDJeKr/f?=
 =?us-ascii?Q?KQ7rzIoPsH/iztsT0pdFy25A77K/UfJjDCWYUDoCEmT6CtK2i1lbgdyDa2Sx?=
 =?us-ascii?Q?WbmOamMrUFljS07AzuLMw8JsSvMlrAkx/oomoa2VD+JepqZfmI8O/RTiqWI6?=
 =?us-ascii?Q?iknlk9zkHuujHJqspT5DJJCcSeP4WthEJz23PtX8HTmSO7IYGoCoiyJHOiOU?=
 =?us-ascii?Q?wc83bs2s8yY4JIQBdDnLMXiNdbD/EbPu+2+wyt46zlDiEe8Osk3bWAazNqg6?=
 =?us-ascii?Q?F4uJnFXlpaEdpJLJO/7ukMtmeIwu3hDMqtqPepxB+2nkc0I/cFGb4uxeRN7Y?=
 =?us-ascii?Q?1t5KsCHTkQA+J2BVhm/XHOXpDP1yAWELaTxw+YqRpZEaCSJrGz5YGcPy5mHt?=
 =?us-ascii?Q?vHd/Qz3zluJqPoHJzW0D9sS65pxiSpyUzj87L7NsUdo3alQohKsBD+Dp/MmF?=
 =?us-ascii?Q?tZ2YNbBO257r8d7CbwhXWKQH2nJatHCAw1/DbvBjVBMjNE2KSHSbjHM6VV6x?=
 =?us-ascii?Q?kRWnAly24OrER/duW1DENnWWhqUHjgYYivhthqHL/MoVnAFlBxfDpiIPosL6?=
 =?us-ascii?Q?UEOlZc06NvT1Jf2zguP2N5N/5pzj0g+s/lnhNvQng1jyuTvsY94RCORZnnaM?=
 =?us-ascii?Q?VKvfMXmVXhEuIDTmsCFyR6tZAwclr5cvqwNZk4SDpyW8vWe2shJ+gujJbK7e?=
 =?us-ascii?Q?1Wtr7Oyfu+snCvAUUkbkaA19HEPozFj+EJ+yYAHIVUau1ausjds92Wm2VrtI?=
 =?us-ascii?Q?ZUCfd2L6sml3qUIZhVjewE4NfIs/wrpGle5jCVeAjvk3+8PsnwFsxyEuQNGt?=
 =?us-ascii?Q?KH+nvXS3CIu9iX+ddSOyBzvndgUWwbq9Gjxq4ss0s5lfNeaR+1P3/nQewtri?=
 =?us-ascii?Q?9fXo4TLgWsC5IbFlWsfTFq/8Ssc3uT1rh7HG7oGJ5s7kxxNUhR/2h0NzETkx?=
 =?us-ascii?Q?UCrjIgOM6Wv+brCwv7lBuq0+8A+QH+g=3D?=
X-Exchange-RoutingPolicyChecked: 
	dFi7vtHM9fajX/n6CyfvSYKJ0RxLCP3ZXK8OvXe6EwZONHUxesJjPQbtbZ1g1x6Cm0gBb/FDaYsCKFBNVKY+ad1qCyCC3vZxC68wN2DXPG9HkevDf/LbZHv1QrBHEyR9ckv/992vxbsIcDqJIrQhmV1qayTvaMNmzMKsMA1aLHY0ghxkviPJ4ZJq2DxzsNbObAbLALrjja4XO2VWheac8dWWWeLduFNONFTN6mTHwnZfcg/knm34KpUWpfNb/bSTaOCnIh3pgrmk//ayK7AN895hCTX2jWSOJcUuGEKTnMd7BCzpC1Y4k9G+SCx9B930kP+9z++JhEo2rJnEnLoSSQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e277aa95-bd9a-41a9-4e5c-08debbedb16b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 12:44:29.2866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AB94eM2fzchw6/loLPfqfKORi/HpOh7t8nWrBJxtf7YhBc+FvsGD/9qdDpm9l54LmV5+0FfxgV2L9F9YwHqy0rn1BhOnUyeEsfOcsi+GUK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9973
X-Proofpoint-ORIG-GUID: -4Kbyajb9QjXVwkqlzbLdoweZXauEG44
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEyNCBTYWx0ZWRfX+M8MXVLD74tL
 KOrByaRDzwLTs1KQVvcmMGojiEbacrXRP/fNMOoCFyftJw8zz/8rgEixZtfjlsNo/h1lrTvfseI
 kpcsHGXVFaMA+BclSirxlUDq5IjmmZYEjfiVRcY1Jj1UwvN1Hgq1MGKCUOPwKlpcJZy8P6b8yoA
 YN0hYHeDoyEkzQYgoyi2qDPjXQwOYK5bUR5yYAPx90Xf4fRG5cGbYNIAcNb3NSUzVLDeuBOi5Nm
 Vxba7e7sDV16stfRb1gfWiXD5K4tfPvyjWmomrCfn5KCXunMlIpsrTk2LnkCI7v+u6QIv5rfwNx
 7bK7wvBLIXnenxQ02HG8vmLt44JWfmGKVE+h5ZRHMSof4HGn8LF0V7r5oNde/9YghunL//qOr55
 HH46W9y0hf7M4cCym4PkdpK7/azRTcIeUqj0hiYOwBZ1uL9oQ7P+na2qHuwn3xXIcqhKRbntsT1
 0KCw4HZBojSpEdtRFtw==
X-Proofpoint-GUID: -4Kbyajb9QjXVwkqlzbLdoweZXauEG44
X-Authority-Analysis: v=2.4 cv=PZXPQChd c=1 sm=1 tr=0 ts=6a16e72f cx=c_pps
 a=j/UUtXukZThXjipu8qKQYQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=ggAbHpMFlleW2AOwp04A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 12:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237652

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

libatomic constructs gcc_objdir using `pwd` and assumes
MULTIBUILDTOP is relative. Passing an absolute MULTIBUILDTOP
from OE results in malformed paths during libtool install
operations in both compile and install stages.

Avoid passing MULTIBUILDTOP for libatomic and use the upstream
default handling instead.

Link: https://github.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d3d40faca10ea2e

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 30b2832c82..e305180c64 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -83,14 +83,22 @@ do_configure[depends] += "${COMPILERDEP}"
 do_compile () {
 	for d in libgcc ${RUNTIMETARGET}; do
 		cd ${B}/${TARGET_SYS}/$d/
-		oe_runmake MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/
+		if [ "$d" = "libatomic" ]; then
+			oe_runmake
+		else
+			oe_runmake MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/
+		fi
 	done
 }
 
 do_install () {
 	for d in ${RUNTIMETARGET}; do
 		cd ${B}/${TARGET_SYS}/$d/
-		oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/ install
+		if [ "$d" = "libatomic" ]; then
+			oe_runmake 'DESTDIR=${D}' install
+		else
+			oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/${TARGET_SYS}/$d/ install
+		fi
 	done
 	install -d ${D}${datadir}/gdb/auto-load/${libdir}
 	mv ${D}${libdir}/libstdc++*-gdb.py ${D}${datadir}/gdb/auto-load/${libdir}
-- 
2.49.0


