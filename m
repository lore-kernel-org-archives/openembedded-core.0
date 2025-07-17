Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89CB7C83F22
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 03:00:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.40289.1752721205873276530
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 20:00:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9293993554=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56H2aHuC4053603
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 20:00:05 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2063.outbound.protection.outlook.com [40.107.212.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wds0tm3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 20:00:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9RZU/t5z+eHkZcGb3h/9RU+kYjo6HSpG1wIxUisNei1WtajzoouHAqllqJZ+Jpke3JNLIfO2BkXcU9iUA4h1vgNmWfCgMpsJhOBXlQOyl/zUhSKEN9v4pHbpbpiCQKUdtCa0lyEtY8gSBypiK1NCg+SMbHHS9B21mPHWSUXrgIoOiUPGVd3GjepvUuIQcIPYwiGS+5p2O11a4X/nJBS3Eoyw6UA1LlEtLz1/j4ZdNuDh6xk4a/EVkjbg1u62DxPqcVxbfjowEd7fvLAvRl0JS4/gBg7Lg2xb8CwpGLP6mRMzlrf4rW61VTkjnz1m4NKLA3LfdJSrUqcm0k3LoeSBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYaPs48uIr3GfFJhz9WIiLFAcMwrkwhztqtwhfRk6jc=;
 b=IWqMtk8ZcWSulp3tNpWADCpyz6Hx2BZmtxQSndbL6/gQSdMPT4zYsSsqGCGEmrJHVrR+eHYaP7IfSizRO8eoPGTUzPPGNdApFippZZr/Bbcqq7Uk0xvsyjB+7C9OcOXYdWNXkIsB5tx4skqzJAC0OIrX52lg7iX3wsNtEzbth6NdLAC5rVQGOutq7HUG0CzKOT4/tG6gmL8ZBgUiymqskHD/2+0QmeKjgtWVqzGQBZZl56PAQ5r4hSu/yUSAH6KBXm9PFnCJZxZvmtKdB0VS+F+Lwc8OZmsjKB/IUO3LjC4SA8XchRm97wKsZHfstYvRKfWLIyAjjt3qRWJ1T2FtJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA3PR11MB9062.namprd11.prod.outlook.com (2603:10b6:208:577::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Thu, 17 Jul
 2025 03:00:00 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 03:00:00 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] kernel-devsrc: copy arch/powerpc/tools contents
Date: Wed, 16 Jul 2025 19:59:48 -0700
Message-ID: <20250717025948.1442716-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:a03:331::7) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA3PR11MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: 34d0d7d1-8f8f-4233-e8b3-08ddc4de04c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nozrpYTADhMIbap53+e1W4+fXh+WUg7d4DyqIELFL4XxOJmj/rJ9o4zuQIDE?=
 =?us-ascii?Q?RP8Pe3QzKVn75avrqcf5uQvRnIlAMkfUNIxaB5y6xM2YAmOu0/f+vBlo75Y6?=
 =?us-ascii?Q?HFdZbCO2ydlipGY2O5vZgr3nXeg4b3glF6WD+yp+RKf6k6ziZHpObIm3jU7r?=
 =?us-ascii?Q?94UCSJStkTR0clUFY9lkGeU7Zmy5l/gpDxvd2XQszBTeMjYSTs5XNxKxHVKY?=
 =?us-ascii?Q?yk/FYd7e11cLdGrLq5gc7nr6e0BNJzun2lShOCDkiiT3j1fTr063+aVHNcJ0?=
 =?us-ascii?Q?R0WmLiAMmwsp+sEDxhOOe57a/vSrWqAnmQ0c+Yz0PZaPxDC6u0JXTyYmd4Ve?=
 =?us-ascii?Q?7UeH/uCCvTn9h52LHj6cE+yjgzDTMYg0S520ZeRFhf1aYP4HIBGjypnBvE4V?=
 =?us-ascii?Q?wpshSYRr7T8ds1MhCEsVZYMIllfSJ2tprOcv+BKeYj5b8TK4QxM7712+JbaQ?=
 =?us-ascii?Q?xchVlO7/49CcSekqJR+HJz0MBcuQElkrc0u8gi27x6QYoXZN+FYHiWE3dUB3?=
 =?us-ascii?Q?cLGg1kZYMN6YZE6l70jEknCGLyx7wEDbZqYWaQEWw4ejmpYwkbnwWgojalv1?=
 =?us-ascii?Q?LeAe+BMAZ6/bMyrEoAnm/xcnl3Q1MfN1JV+B3Ef1WbWWxHrfpb+KGHEAviCq?=
 =?us-ascii?Q?pz0GZWLVl6oxIAwS5EOzB0WltVHQyqks61tPVCc8bUOulxQOyozynW4kXJ+1?=
 =?us-ascii?Q?7b0cs9/ttJHjW6dy1nD5tc1hMhKJJ1yO7R1N1oQvbzOXqKgfnUZRMq7zQwvH?=
 =?us-ascii?Q?UpGAKOTBTxOHc+YnHYXw6QfGlAgAsItYoqUPGpgtvWepwjdnOFhyu2fgGisA?=
 =?us-ascii?Q?b9yTdsCbvp64P1m01nlZkaBCPc5RLTwqcbdWOg7Dv++IxeKkJsnKhKY1QsKY?=
 =?us-ascii?Q?o+dOHEHCwJejlS1rTTnIvkykUr/PH3ZhWMl2vLCYXmi6c2SauTvb9D6HvxGn?=
 =?us-ascii?Q?Cx1WMA1Ypx1INLJoaRRuF7/ocB+4nyFzlQaz5YqmpnLW6QXuXapb0tULIXQz?=
 =?us-ascii?Q?351PJfSw1wIJOKuo3v/D/1+JWcxoOHEl9JIrP+OGPnlJKbbnZ5QT9SHU7LKs?=
 =?us-ascii?Q?Lezb6D2q2jd2bJ6rl9xpNKGFCWK1DvJW2rhphrWa2o3EXFCTgZzb08ejcSrI?=
 =?us-ascii?Q?33xrLVREeSkvUf72HFT3Xh1cGqg4QnjtUO8pONom0IONoQpeMTS47MhlLuBV?=
 =?us-ascii?Q?25ZOGNtpw3EgeEvgZGQzVofC17HXGrv19tfKLuJA4J2vMB/VtOJMyyqwb3YZ?=
 =?us-ascii?Q?Oeq0dRyxcEIvjHjapPivb8K1Zi+hTrUsXVYO4Hh+Vbb32wFzRg91kVXubYsM?=
 =?us-ascii?Q?6fJD8+lvRTRnPDK9GMB9kkT4qF25ACX4wBgGZtiXriziflQgRXhRhPlcdpfY?=
 =?us-ascii?Q?VpoXbJiEhIcUhSSIsN5ibSCPsvx+JD2b448hoEjy9zEe3AnaLcqbvwdbC6c1?=
 =?us-ascii?Q?5GHfFWZ9DvLFbB2mD+VoE49Vdxxu+bGT/ffBOKreNXXpmBlopp6fC+6UFIMj?=
 =?us-ascii?Q?qSw+H+u37lyUEqE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/bRnQV6worZzbMw+Wla+Iepxc/teB24OJfqVkZ36UxOnCDOrEuaElXNMIKv4?=
 =?us-ascii?Q?tL6MURjmp/bM0bIZFu18aUshiWYA/pHzYjTrth3WkFjwP5m2elqBgfUat7tL?=
 =?us-ascii?Q?p6yeTYJWi7a3nyS5WQz5Ws5v/O6fdA+CWn2iQV/XGi2ebggS+hIhGMQho7Ru?=
 =?us-ascii?Q?kOIW2ZyKzPKjshB3q/SMx+6D5tjFK+rdehca6PJc7NAs2IoZiKQZ/BIl7Nuz?=
 =?us-ascii?Q?CJ9HCP3P0uxSyugUlz7ieDuvQV4qyhd3oLWhAZdZF7qR1umozyMusjjIOCj9?=
 =?us-ascii?Q?pcsIfTu0ebwxcfAg+bczRTE+sQxnQbo85vTvx43QTMeLmg3bytu4p+vL1KGG?=
 =?us-ascii?Q?dgEL6+U0IEf03PS3n2Tx4K/rz3H+I3SFhXkWsMcFHyaBFfs1kYOTC/3ZLp9I?=
 =?us-ascii?Q?oAf1OEduzwBLvzB1KIH7m1D7qDyMun5Cj6mx5GJLbf2b9LG2KvyPPFa6Bk4x?=
 =?us-ascii?Q?EYHhFFfnWygpKyyh3qbg4wXV18VC/1ZCT6hN6h9tzGK5wGvV9f6Z2oXh6SsL?=
 =?us-ascii?Q?YZbYEQa8o6fFuao73FBgDhp9tLGsZNEThWhSF+Y1BhKxiZqf/n01nRuhsOcG?=
 =?us-ascii?Q?bomU15xniZxOK0iz/to47qR6NPR145SNZRO1l2F/rStQebiOlKqd1r0FxOnY?=
 =?us-ascii?Q?OdQ+wbkMk/4U4czD+nHwDKKqk4lQmga5vOiwjFtS+5tDZcaJlDWhsGLw6Dwl?=
 =?us-ascii?Q?r4onnRaGoxK67+yHTWlDLd+vUMbQGoTd7uvcB2uug+HJS2Hlw2+9SGgMUnqZ?=
 =?us-ascii?Q?FdaMIZ1r/7HZcd98HD7piv7tdo0wgxRpibRB4egcs7QTQVOgRNu0acTa9PvU?=
 =?us-ascii?Q?mcKnSuYPNK+UlxAiDBCmj5T1nimaCeV6WST1qlYvULKavEoAuCGLLTimf6Vp?=
 =?us-ascii?Q?OTbg36yaU6hVByBl0V4JgghqMosP4Vff9votJnRblBnFzLfflCJ7Dp8colaC?=
 =?us-ascii?Q?+pGxuEQQwEYvSnbWj87vqWPXGaBW1G1AbWwGUzN4mTIod62h9ZbendQGLrnH?=
 =?us-ascii?Q?RHAxYbXNbSiDOl/hy0GwPC9BV9kQrEQDhEp1kvtXBWcFkZUP4FSpeKBIYoma?=
 =?us-ascii?Q?cCSXLJ7o87fGg0y+ybInltmK3Xn77r3KC3wdyTiiGFFfOyXyRUcCsSXCmCM8?=
 =?us-ascii?Q?/5cyALBZBt2mZCztMLhktDsBOCUdx2Fo1BHKRooptpCa4XIlh+H2GnKjo+t2?=
 =?us-ascii?Q?HXbeO5wyfoONVQxqpoCxHrS2JBuezRyXJHW1qJVtA/Rp3568bMDIL5/9ycgu?=
 =?us-ascii?Q?agCHngNNbP9pyZWtyAOaLC8lqoNYWvEGCeZCw7tViLFOA+sPJyoJnv7Mp/8g?=
 =?us-ascii?Q?wXmwx+ifbGf2Iza0zmCJdPEePEAE1VC/SfKi2JoAw/E/d28U3uPpYqRss0OZ?=
 =?us-ascii?Q?oGsJkV+noNEqxI+zPmTtOWjn3RM0jR9unbWDa8CRmHY7OFCNRmlYN+S1VpWT?=
 =?us-ascii?Q?EHVDle61ZjoZdGKA7t3FIcP6jBNOBgNmrRD33brIFQ8FMIkZQhMrph2MssLL?=
 =?us-ascii?Q?AaKvu99tOsIuB3F+LXflXNGCzRNtASI6HerHt0Gr1uSA+r68TVQBRLto4ksD?=
 =?us-ascii?Q?ei+FV1KiktwTaWXBTvZwrrPXJAlj2x0KJCtLV8XPRoKQ0i1nRAwGAsM/3AN2?=
 =?us-ascii?Q?Qw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34d0d7d1-8f8f-4233-e8b3-08ddc4de04c3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 03:00:00.0584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pVlQfYsy4P73+xmvab2fQnDT5LOsWAW6RfkrJzqkKPA/7RBRLv/JfRRXh/2ka4Pr2iiKDID/hDnk3H7Eclf4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9062
X-Proofpoint-ORIG-GUID: q7Uu8yuoYrIwx-IIobh22OpYU0qqf7xg
X-Authority-Analysis: v=2.4 cv=bLkWIO+Z c=1 sm=1 tr=0 ts=68786735 cx=c_pps
 a=B1juiKOSPdvfexZtvkw8XQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=JWDwriL19-fPr1t7ZWIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNSBTYWx0ZWRfX4NvtevEjn83m
 LmzFftj5fcMIRbKNrPe03g9iNiyfplxTfduKD2G2H55Y9vAZtOoxyipmiy8gsCvlUpeC5vIdoMY
 UxORxK6NmBgcLjljtOLDImWqbhV0ovR7vMMfdjfiX/aA89ncLGp3e4OXXli2NmK9tx4qzOfjeYQ
 bIFsQIjtnCWNbGIP9EO+e0+gQdBw6cZfrBJCCBWIT2IJD2k6ZRLI4GBioDn8LsCgSr01gtimwXf
 1z5e0dJbthfpJhN+ZVsy371fYbks7CC1L6M6ZQiLmrDQwM3GTgVzzuCuxdJdf4p32XqsX2ie9GB
 XzyN0L6jnHWCQFhO/Sshd7vaiublXoM9Gjt5kKaglUX5/K69Ga9kPxdO0zoWDlwkfAOgrsQzdc0
 yFho6gZu
X-Proofpoint-GUID: q7Uu8yuoYrIwx-IIobh22OpYU0qqf7xg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 03:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220513

From: Chen Qi <Qi.Chen@windriver.com>

For now, using qemuppc64 as MACHINE and building things inside SDK,
we'll get the following error:

  ERROR: modpost: "_mcount" undefined

This is because after [1], MPROFILE_KERNEL is using arch/powerpc/tools/
contents to do the check. This in turn affects HAVE_OBJTOOL.
"""
arch/powerpc/Kconfig:   select HAVE_OBJTOOL                     if ARCH_USING_PATCHABLE_FUNCTION_ENTRY || MPROFILE_KERNEL || PPC32
"""

The current MPROFILE_KERNEL for powerpc:
"""
config MPROFILE_KERNEL
            depends on PPC64_ELF_ABI_V2 && FUNCTION_TRACER
            def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC) -mlittle-endian) if CPU_LITTLE_ENDIAN
            def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC) -mbig-endian) if CPU_BIG_ENDIAN
"""

If MPROFILE_KERNEL is disabled, thus HAVE_OBJTOOL being disabled, then
FTRACE_MCOUNT_USE_RECORDMCOUNT will be enabled, causing this error.

Note that there are 6 scripts under arch/powerpc/tools directory and we
need to copy them all. They are needed in the same way as MPROFILE_KERNEL
needing gcc-check-mprofile-kernel.sh.

For example, gcc-check-fpatchable-function-entry.sh is needed by
ARCH_USING_PATCHABLE_FUNCTION_ENTRY.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=abba759796f9b73eb24df9b734dd063839fc62e0

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 3d2eb3929e..c4b5d0e5a6 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -208,6 +208,10 @@ do_install() {
         fi
 
         if [ "${ARCH}" = "powerpc" ]; then
+            # 4.18+ needs these files for MPROFILE_KERNEL, but don't error if they aren't present in the source
+            # See https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=abba759796f9b73eb24df9b734dd063839fc62e0
+            cp -a --parents arch/powerpc/tools $kerneldir/build/ 2>/dev/null || :
+
             # 5.0 needs these files, but don't error if they aren't present in the source
             cp -a --parents arch/${ARCH}/kernel/syscalls/syscall.tbl $kerneldir/build/ 2>/dev/null || :
             cp -a --parents arch/${ARCH}/kernel/syscalls/syscalltbl.sh $kerneldir/build/ 2>/dev/null || :
-- 
2.49.0


