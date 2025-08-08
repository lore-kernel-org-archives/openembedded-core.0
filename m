Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FE5C87FD3
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 06:21:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15754.1754634079838298005
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 23:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=031539778e=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5785rjxe3402010
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Aug 2025 06:21:19 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48bpyetsjm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 06:21:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9EIdJeFZ0S2GZrfD1Y9NHXIfsUVaPL+ujE6AJXcsrW0hsA7bG+4oVc3J0hllx3qPy/5ZGmBlKRvXC1++zcTpQn4cqNJ4yAxZ0cVyZxPq7MRGgeD5Xm7sLjWGgQ6O70M5h+Hh0kL3vdoi8jHAP0w9IvsqIzKxdPtBJaB4E3qIoDp6/Q/CjrDlQb3efSbqfrt7UmmWwItKrrSPftgYUyDcMW7c2i+Z8OkSn4fRBCm0FdUTQE4jvQDlTfi2s12adLgOgDxjhYPNgtoGHOY/PanX7FooU32JBuhV7yUhWpvgj0CsRGR0Wiya++v+CkAp622kI42kEhAUh7ghdXTxcSFhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsWYe6XnyNie2baMeMDll3ATzOV7E8cY1EdSqOyhLac=;
 b=ObhaGmii+V3YVOuyB1t7qY4yejoMkZrzbyNEnSnRGiuD4AgG/35l8lT9ZmW7pAjg01ONthc7m0Xx0oLaDkmLYNlkG5xAYSYxXTvojnAyicsDGjzbt5NcI/jACVDyblm8INOeRHcm6RQUEP3IgGJYqLt8GzOiBbET2pBvDlZm8FRmThbvgOsEyNqbq9UXHfl40oehXApuDeRFV2hGyMc4oXDru319bMraaCuor8Hhu4m+1KfPOYIshqMweQR3s3XI5v1JkPhwX4O/TALq3pfYTJZbgojBLSMUxLqjdzWrQjzzmDoL3qSGroO0zUJgTqGtH2FQqqc8SzvnrxBeGFaTvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS7PR11MB7930.namprd11.prod.outlook.com (2603:10b6:8:da::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.16; Fri, 8 Aug 2025 06:21:17 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.9009.016; Fri, 8 Aug 2025
 06:21:17 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, SunilKumar.Dora@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [walnascar][PATCH 2/2] bitbake.conf: Switch prefix mapping to use -ffile-prefix-map
Date: Thu,  7 Aug 2025 23:21:01 -0700
Message-ID: <20250808062101.640198-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250808062101.640198-1-Deepesh.Varatharajan@windriver.com>
References: <20250808062101.640198-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:217::28) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS7PR11MB7930:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e012b4-8b48-4f4c-4170-08ddd643c865
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RSZijYGi0DkPz72LUnx8h4BDr+dFHXIjza1SO/Zhb1FIYYp3LCaedMHDFZMP?=
 =?us-ascii?Q?0E6Q2mnkDUuroEp4sWOEzuvFPo+tv81yHcRYpEOsnTknO1Rx5tUnraBBwlxj?=
 =?us-ascii?Q?jDcEk3ZQmhM/PbbjYPho/2bxK7/B0A9y0ycRNuI7gJzY5l1FhDQLtauab4a3?=
 =?us-ascii?Q?iu/KnE5ChENkuL9zzTQ4Xoo2gj7EYxWLyjAyK4Ua3hG4qcF5Hzl4VCCDm6ly?=
 =?us-ascii?Q?f/OEHn00c5CNYP2u+1ixYbsyFyuXXM8OLEk/8+1n7VELTlwuuiUqFMsMax90?=
 =?us-ascii?Q?jbCsLeOuKEO2h+NuO4NuCO2lKYw7DHejRdJOpooLdgcm5shPujuirie6O5oz?=
 =?us-ascii?Q?V/ypYPyGy9HPnnm1+Ye6n5TwqJn2fFCcchPqKkTosWXgwttU2QUIumlXt7za?=
 =?us-ascii?Q?JvzKJihF1ZQWgybQOIU0jUV/8pC86jXHLnhP1xAulQJ0P+UJbnbsp8Fs8CQu?=
 =?us-ascii?Q?om9GHxG5+RRMeyKnIu5u30evFE9dbFmxqkjCP2VsCkov1zQwKC35PYSVdtTU?=
 =?us-ascii?Q?5MSLYOMOK2CNK8PkSA49qAwNKFXVsGLvLtPKgxqldcMU5yhH7eMoTSm1kXGT?=
 =?us-ascii?Q?PNTrXCLNp8IGTXNosuaEQZqcWi/YSsZhR3ifvYx+MF6DfTnVN8sN7h5ea13s?=
 =?us-ascii?Q?YYNac4aqHRFGWjp2dwSGuJnxSWA4rCGSAMxm+KpQOx6vv8i8XYEQukRkhIaw?=
 =?us-ascii?Q?k+gO8c+3vgMMEa2R/nos5cGGMZi4G899itRgX5nJJfmofxJBFkrh+/QXWO7c?=
 =?us-ascii?Q?NKFj6147EbA6FtVphM9wAZ4joDlgLBtuvwcB/urxXSiU/HJ1DeJ92+N+kq5w?=
 =?us-ascii?Q?P9djACV0iDSOCAdRs7Cf3pDboQhCvI+Vz8Bd/OcgSJQf0uHT5hmqC4WRAeGg?=
 =?us-ascii?Q?8ltjzOVGfQq4HoJu0ijcph6jf+GwwVoz3RNoYfuDlvPC6iEAsGXkWtcZynji?=
 =?us-ascii?Q?r6huMYKz+e4cgTxf+QMefxDKDTJ0frZzSgdyOGGMpALMPX5HJaCx5mIWyyp7?=
 =?us-ascii?Q?Y5wLpML7XwRQFy+072sY/GQqC4FjLjvva0HMgQLQdExxYrs7mbdJPnyBBj+7?=
 =?us-ascii?Q?/hZGmJ85XBPf/QV6GS/dR15GonyWuLIqK60vC2/daXwDaVPgqPXm5n4gVEiG?=
 =?us-ascii?Q?56kfaETN9B5/xG0zvakTz+d52LCbyKT0tpsAWHeRB0gy9oq/XiDA+n+B0gq/?=
 =?us-ascii?Q?J6VUhR8xurkfAMTyTv5bh0oeeMmv2s+U0Y3Qs4daVVn6tvOnEDM69og4fq7X?=
 =?us-ascii?Q?xCyY40UVTsZtdyD5yWsepuT0foDEquCagdTob5W6qGUUXZ+jmBYQaWld1KgV?=
 =?us-ascii?Q?lszNXdbtqQscUbuO9XJxYiWqzrxwutYM7K6HUMpp9UCGZ6u/S+Ie8lCoX9fi?=
 =?us-ascii?Q?mUUVSzda4pzOzS0CsfBh8ChUCSc1zUooprdZFeQbQFz65FXqdQChf1lJzbB2?=
 =?us-ascii?Q?ovfpshwwa2dtSTHVLfiS+s9dL+b8D1/vIooG4vIQjxTkXHB9wnnCBw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ipi28Aw0KPlTixrly6lfmbCvBABYBuAORjBEIwvJx/7899YzpweMzBvPKYct?=
 =?us-ascii?Q?p+7rIfhpcc15CkNaaAKG7BlcNdykttdz3Adxnqs3ClB5KVJu5AceW1eLHTBi?=
 =?us-ascii?Q?liVhIyfSv7YNiOWvX/1Q4FAi3lcu21+6V6vv5rZrHgDN8Vjmrj3OtpJkKYVN?=
 =?us-ascii?Q?85IsyM9PjR913z7F0p4cWcJZIOr/cxhB7vBx2n3p+A2qNH7rwuD3skQXGfWp?=
 =?us-ascii?Q?rMIBVL0B2FkrHSF9l8IkCOsuyhWhoSU777xgbe822XgPStJDyDWoYk7shstZ?=
 =?us-ascii?Q?Uigke+osd2+e/XmcdUngAdm7T5TJv8zIKzWOIWvM4Jlye9IStBUqDlIY+so6?=
 =?us-ascii?Q?Fx4MfZZmPEJGF3cxz1Rr1aZJuEZN/nNj1Wyt03iraq/zh/2fN+m1tJTDnyz1?=
 =?us-ascii?Q?5A+6L2jWDApzSCYoxrocoynmPOsCRVh53G3nIeGC5YZ077GkCK/v8R1eLJGP?=
 =?us-ascii?Q?DqD9/ALCSSrtFDvK9V1f2LNbhszyCO/rR175tQbbM3nDrsX4aXzBR6jPMC45?=
 =?us-ascii?Q?QsFCc9aM/g0ashh8+GO05TuXJcLp34vk1R4Z8svB2m/4p1wmgMC9LUDAk6l/?=
 =?us-ascii?Q?RTpcPX2efZqe9NKtwnnM3dirYpr+Ww5o6SIzGkcxLqF3vuzNjJRgGmNIA9cu?=
 =?us-ascii?Q?CMcXjDINXjzULDlMRy6TSubU53cREiamVtzAkpX3CaG/S3vYOU8KgM4BTuoK?=
 =?us-ascii?Q?Ohp/dtXE1XA+SvkffboISajxcCW4PqOYorYq5SHqczxoaBKzNzZDIAyklT/U?=
 =?us-ascii?Q?zqg92p/V0t8X2YKLxh7omH8lAaIcI6b3KkT9gFRHcf22mYLb6H7sFC0/jpWf?=
 =?us-ascii?Q?hyukvSnnP3t1AAjloDT+iYmk5xc+jYAsp3XQHZTSUqDH1xr+WGB1d/nnm2nJ?=
 =?us-ascii?Q?JlcD1kaBf+QFhL1mLFubocNhuxsGKKfZvZNudMd9OBFgYbrWenHHBHse/VTt?=
 =?us-ascii?Q?A94TUrcTKmB7nXNWt4CfUj2DKsdl5fp1CTAbhGsnjqorimQ+irr+wwp2tK7u?=
 =?us-ascii?Q?Sqcpeizck4NkoQSFLfdT691nWhSqjhU+Efm6f+BHZnS+cBYtSJm7ax+iq3w2?=
 =?us-ascii?Q?wiB2VbKPcrwLrGKtcau6o3ki3o5Vu3KtentSmxhTLc0tUkx3FkcusmrmZlLK?=
 =?us-ascii?Q?u6TCsYNjNEvuM1pM0SlejEFJk0TPnp1DcLUQe0WZz0rZjPSXPTNaJ/B/1gA9?=
 =?us-ascii?Q?J8fuVB9LUgw/S9HyndspdEGkug8fcRjWa/arMYRXcf8WslMkaVWlv8gInnvB?=
 =?us-ascii?Q?/U03/HNPM6Bwlqe3T4TcfgYy8uRCBpDfyKVoVe2jjVPK2QUCgwwRYl9Se5bJ?=
 =?us-ascii?Q?anWIYHrv4BqXQy/E2Zd29VsKBjUl0zrl5wDznCzQAZjlOyDeGaa8j66Lpl89?=
 =?us-ascii?Q?NHDamO3BnGZoFW2x+Eclru7RR1WgxoYHtls9/ymBFnt/Uzr6Xn5F0tKaugjV?=
 =?us-ascii?Q?s+RoUy26NGpXyl3R/stxEincWdSrsOyBhxaV8foNp/ymF6rRfoxZ2dt3ASw9?=
 =?us-ascii?Q?ZQpfrO05S4wdvjAfPuJAjv68ykveIexsaE0l2wd1lo2VVOlG3FQn3np9TrS3?=
 =?us-ascii?Q?MvkWit7YIP3hzPmJOqGyNMWNNNwRAA+cP5RWp+54v8Er6cu91Wwk9DLWlskR?=
 =?us-ascii?Q?Y90nVaYSXM6HojqwlrMS/CU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e012b4-8b48-4f4c-4170-08ddd643c865
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 06:21:17.0566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2LsSuOkO27pd/h7Xf+qljqmH8c/O/n62qiWlSgT1AjN0RCEf0kdcemOlcF8RN3d7Ky4dW0oqDRFV6d8ETpgKpKGMFtlUXYx1o4qpRD6TZshtazNv/kNR5N0Zt8RaWAwz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7930
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA4MDA1MCBTYWx0ZWRfX0gJuRF5EyLxJ
 RMFSpR1CmCviOKrfsRX/lKpUWD/S2JzlRP+w7SHtbYPgpnqlwAkkQGSzoQnKP9JzYaBHfvJ9MKT
 sUvuXsvxmA9ACQhVYKVrBJQsGA+mnEMo/hyi07VVpqDeaRdxCU3rNoeNulMS4dBEweIc/cexLvx
 vgApxuzucQuwxxBbr+kBjrkwaLX+D3dK+T3GpEQPqqbuoa0Nk3kQOnHijxgfStbFO1z7shRPXsY
 Fywe63z08qYnoo0hepeqB10hiTma/39V2eDMrmUakiO91uDBEdrhixoBY7etJs4DPYNvLs/0YXw
 9mpAezLPyMAslDSzaWnhmgJsMyYHmZU6C9oeu+dCLlwW1F8bvNMvxgA73kYPZ0=
X-Proofpoint-GUID: lxGIntrTFo6qYzOhqB_7PvDH6LmBSDny
X-Proofpoint-ORIG-GUID: lxGIntrTFo6qYzOhqB_7PvDH6LmBSDny
X-Authority-Analysis: v=2.4 cv=GdwXnRXL c=1 sm=1 tr=0 ts=6895975e cx=c_pps
 a=Nk9nByta7IVv34Xs/Tv0zA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=AzTOWpOv-CpUjgPugwoA:9 a=q3obPbw4uMJ54pJG:21 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Aug 2025 06:21:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221596

From: Khem Raj <raj.khem@gmail.com>

-ffile-prefix map is more comprehensive when it comes to reproducible
builds and its superset of all prefix-mapping options in compilers

(From OE-Core rev: ff73fa7ef7666a6dbe34f15515bc3ab6e574c5b0)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/classes-recipe/kernel-arch.bbclass            |  6 ++----
 meta/conf/bitbake.conf                             | 14 +++++---------
 meta/lib/oe/package.py                             |  2 +-
 meta/recipes-devtools/gcc/libgfortran.inc          |  2 +-
 .../python/python3-maturin_1.8.3.bb                |  2 +-
 meta/recipes-devtools/rust/cargo_1.84.1.bb         |  2 +-
 6 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 36a6e0a60a..749a266ea3 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -73,10 +73,8 @@ HOST_OBJCOPY_KERNEL_ARCH ?= "${TARGET_OBJCOPY_KERNEL_ARCH}"
 
 KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} \
  -fuse-ld=bfd ${DEBUG_PREFIX_MAP} \
- -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
- -fmacro-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
- -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
- -fmacro-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
+ -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
+ -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
 "
 KERNEL_LD = "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 501808204e..b1dae17267 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -652,15 +652,11 @@ EXTRA_OEMAKE:prepend:task-install = "${PARALLEL_MAKEINST} "
 ##################################################################
 TARGET_DBGSRC_DIR ?= "/usr/src/debug/${PN}/${PV}"
 # Beware: applied last to first
-DEBUG_PREFIX_MAP ?= "-fcanon-prefix-map \
- -fmacro-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
- -fdebug-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
- -fmacro-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
- -fdebug-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
- -fdebug-prefix-map=${STAGING_DIR_HOST}= \
- -fmacro-prefix-map=${STAGING_DIR_HOST}= \
- -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
- -fmacro-prefix-map=${STAGING_DIR_NATIVE}= \
+DEBUG_PREFIX_MAP ?= "\
+ -ffile-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
+ -ffile-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
+ -ffile-prefix-map=${STAGING_DIR_HOST}= \
+ -ffile-prefix-map=${STAGING_DIR_NATIVE}= \
 "
 DEBUG_LEVELFLAG ?= "-g"
 
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 0db14f2164..0bcc04ea54 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -991,7 +991,7 @@ def copydebugsources(debugsrcdir, sources, d):
 
         prefixmap = {}
         for flag in cflags.split():
-            if not flag.startswith("-fdebug-prefix-map"):
+            if not flag.startswith("-ffile-prefix-map"):
                 continue
             if "recipe-sysroot" in flag:
                 continue
diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index 4560421ed1..fa6aecaaa3 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -8,7 +8,7 @@ EXTRA_OECONF_PATHS = "\
 # An arm hard float target like raspberrypi4 won't build
 # as CFLAGS don't make it to the fortran compiler otherwise
 # (the configure script sets FC to $GFORTRAN unconditionally)
-export GFORTRAN = "${FC} -fcanon-prefix-map -fdebug-prefix-map=${S}=${TARGET_DBGSRC_DIR} -fdebug-prefix-map=${B}=${TARGET_DBGSRC_DIR} -gno-record-gcc-switches"
+export GFORTRAN = "${FC} -ffile-prefix-map=${S}=${TARGET_DBGSRC_DIR} -ffile-prefix-map=${B}=${TARGET_DBGSRC_DIR} -gno-record-gcc-switches"
 
 do_configure () {
 	for target in libbacktrace libgfortran
diff --git a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb b/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
index 17c8fb7083..ad61aac856 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "304762f86fd53a8031b1bf006d12572a2aa0a5235485031113195cc015
 
 S = "${WORKDIR}/maturin-${PV}"
 
-CFLAGS += "-fdebug-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}/cargo_home"
+CFLAGS += "-ffile-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}/cargo_home"
 
 DEPENDS += "\
     python3-setuptools-rust-native \
diff --git a/meta/recipes-devtools/rust/cargo_1.84.1.bb b/meta/recipes-devtools/rust/cargo_1.84.1.bb
index db18ecfda9..150c2d2b80 100644
--- a/meta/recipes-devtools/rust/cargo_1.84.1.bb
+++ b/meta/recipes-devtools/rust/cargo_1.84.1.bb
@@ -19,7 +19,7 @@ CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
 
 inherit cargo pkgconfig
 
-DEBUG_PREFIX_MAP += "-fdebug-prefix-map=${RUSTSRC}/vendor=${TARGET_DBGSRC_DIR}"
+DEBUG_PREFIX_MAP += "-ffile-prefix-map=${RUSTSRC}/vendor=${TARGET_DBGSRC_DIR}"
 
 do_cargo_setup_snapshot () {
 	${UNPACKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
-- 
2.49.0


