Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EC7CCD185
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 12:00:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7496.1760097625236914925
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 05:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KHuWE8RJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=237884a40a=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59AC08Sv2634943
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 05:00:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Fhg12Hx4w
	mlcyDhfA3O3D9DJJOBG1W8VQBIwMyuXcOs=; b=KHuWE8RJlDFKf23y5OTSs21sI
	iNYR3X3vOYnNA29Y8HxVKnPSGyjeZLuDeD8xK6bT9cMkbtlwfgOdOt3HVWyef0v2
	MpJjAREydKwbVmFyegLSbZEaraA320Cupi3w05A20+qKEZedZImIlaz6+Zxkxnj0
	+0gNFErQ3vRYrqS2h1O8MgLBybjxi98ZwqaVaghU+LuYI5oVNasZH05ubRcjN5CV
	KSP5FN7PuoyE3/PjJ7VXn72JvkWl9w9opkflH39Qbs1vdC/7fex/j6RCve0aq/cJ
	u0C+VIEQSGGrTax3xTKb7cZn09SQzYwHka2yOCOQLkR4HQgAHf9Iasf3jMT+g==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012031.outbound.protection.outlook.com [52.101.43.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49nx2x23ht-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 05:00:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ypVM5V8DzrpxA+1D4L4+pOGs7aLETQarTisSwPg6dXIonm07HQtab/wNCYxKqRuF+33Qj72vI18NPpruEnK8UMM0nvjOvl/r+ysaOp8I6OFKR5jz1S3Mg7gznVO4bRwh48JeAHbhNvnmSD03ZxeOmxFsB2fUUdsKlO6FCLg6jG94h2omhTumR5SEiyGzPzjxLI6SkMPdSxuHs350wwWoAJzh/fMjqOZapX2G6pkJkbdbwxNI3e7CxOLXBMDmduBzKp41Yu+WtcaQaE4AeXODx41hK87aRdJZPhnUA/AuHFMzT69Lwz+6HZhI8IeMjnjtOZBZIRXeEn401vg6OfYRvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fhg12Hx4wmlcyDhfA3O3D9DJJOBG1W8VQBIwMyuXcOs=;
 b=eH5/XDWPMOSH5TfzrUMfs1FBE/f4sPb4cZaQWltStkDV4uNi9Vgw/YmrG3v3ZpxOFjaEO95n/woQTpWugv7hEf17N7O5UiRoaoCD0hIx0lkQgwaAn3CAiyhONxECvTtaIx+SiJJG64+rWdKi+Df+CWhMCIOVZqs+IahRiITtymZJ0GpVTlzR3VyOsdp+R3vGe6ws1eO95TrzDxwiTySdee5Id4aKy+Nq5C9cGtWL/2A7SxQvls2sYUwWiFk4wBPNpy6YAySewNAUbZbcoE1t80PvcoXlU40hStK6so6q2wuv4/Fuj29T5vo4uaxg7pYCszvv2oVZVkIHOwxMLWDWEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by CH3PR11MB7796.namprd11.prod.outlook.com (2603:10b6:610:121::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Fri, 10 Oct
 2025 12:00:20 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 12:00:20 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Yash.Shinde@windriver.com
Subject: [PATCH] binutils: fix CVE-2025-11081
Date: Fri, 10 Oct 2025 04:59:11 -0700
Message-ID: <20251010115911.3361641-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0096.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::37) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|CH3PR11MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: e7974b26-bbe7-43c7-d873-08de07f49612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PAn4BixfVsEz7lw2WK/usGAUbsTnkEHomYmd3u1/PWCxEePsntZEZHYEhTQl?=
 =?us-ascii?Q?dcOIJUcgJvJubk3hH83KPBlih+HDLbooPqg5JNuyJJVoZO8Wh2Brt/SduY7s?=
 =?us-ascii?Q?DgxqQRhJ30QEFmPeQj5cK7KUiH7qR6yYrTib2j1JtbNve5bwSuil9z9KD5wg?=
 =?us-ascii?Q?8AFrEDQBxNA/8RsVgVVbqJ6lzSNBTnCy1wd+MznS+zwXyijaCkLEGJR4TVGC?=
 =?us-ascii?Q?1e7Zg8Kb7xl78SijSgOtI+9aC7BEZNR904BhYSF4B579g3bhlRqEgCeyFwba?=
 =?us-ascii?Q?Vwk1MMBssQNqykAUSs7L4aAbRcShwdd94WYRgr3CIE7WrzmnDMuXbKI6z2m4?=
 =?us-ascii?Q?dVr0A1M4j63+zotbArwMlJXTMk48BtZKokwXCsUriE7YtmSEgkbYwfQ6z9RZ?=
 =?us-ascii?Q?kxOtxfvAlzKmwgxVH3tjvMtDUC2vVitr+VzresefglFz0TKzAuvs8SIggbI4?=
 =?us-ascii?Q?XyNCAFu4x1hud3EeJS/dVVYLCXOJvKisS4hMTpX5eE0y/ZedKubsphqI6++d?=
 =?us-ascii?Q?cowTQw/xmYtHQ3MxfWUvs8Y5HffdM9vJzxt5UFMl7niFReovfqFbcs+h9XKb?=
 =?us-ascii?Q?Z7YxCUqlW9QQSru80lU4oEjjnJbEGmBsBDtdqW0ys9Jjlgg2Z+PrDw7zhFGo?=
 =?us-ascii?Q?8gDmek0is5VaL9tWtMdcNTt7TC2oUEQngtWGSxN7IDV0fGl7Tvc2KYzpynuK?=
 =?us-ascii?Q?+lemkjBzAkWYIJq7oKEY9bVQgVqCOGeqgbrnBeOWW712YZeXZOeEBIaOEH9G?=
 =?us-ascii?Q?/yj1yW7+a3YaqiO85TmPq102CJYnFgo163itg3Ja9IS7vtDAN/ImnYrkP1vB?=
 =?us-ascii?Q?GgT/uXh9XvTDCq1UH4INeLUQaZ0YGl5sw7QHZsxw+cczISBD+ImhMqAZrARU?=
 =?us-ascii?Q?M6FX8e6hutCIs3FplulQSvkm4Q2icCUYvqyyogpIw/jUxC6fpvSybZdq1jHW?=
 =?us-ascii?Q?iLaXCweF5Qhb5TP3SX1hRgFMeLRdA6vs+dBxp7qbygqzyWZY911UAETYnACm?=
 =?us-ascii?Q?FW1eh/puAjmwqW2cPHlkMOMv4dPNxBiRyBKPAQwPgjeg0lwmW2Uqqh1w36HR?=
 =?us-ascii?Q?k1gFY0er8HtVoVoM5lh9GwUqvRjFP9PC6rT9CQNPvQnX5b2R9G9baIuGWzWQ?=
 =?us-ascii?Q?hrEXSlEgpzEw8HOQ10VBlfNSyOVlvjK9NNEFRcecdqBIbt4CsCsuw/m/gp0E?=
 =?us-ascii?Q?HfY2bUG39Mlks2opxGfti2efBSTpqvHeYcxvorw8uuUVa64sCv1FjBT8na4a?=
 =?us-ascii?Q?QV6vwtR8X2O1m6nQ5caE3P5/7SWS0bhPYVkpW/2VmqfLGXe+mJoEEt7nKycm?=
 =?us-ascii?Q?qDQLdEKsyqZjid2gcpfGBWPXkBO2HF1LAueyPG6sFiClFyp3V8kGSorNbZ/S?=
 =?us-ascii?Q?me4v4cE/FyCqoiNfbvH78u8Fo8ZAHHuEp11mTNzl+THktp5NtyJSANaoEhP7?=
 =?us-ascii?Q?iV8BWYy+PBSzjv0/ntJToR1zlqEMVPzAzNkEBV+wVtafFc8ro8f5Lw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dY8OOY0CkJrE0xSxo7m4sGI8xd04t+Eavo8wPXJrvffd8Wq4xAI2uQqI9R8o?=
 =?us-ascii?Q?lZAuMv6UTAIWjIaM4PFIvqad2rbs8/687Y59z73v9crFFXGj6a98U+GawwKe?=
 =?us-ascii?Q?qfieviiLXzan7k+p0bYjlH772dSgm9KAOGV2XHa2JH5IlJJ/wROiN3Iyttxz?=
 =?us-ascii?Q?lCaVaR+Xk/5/AKp1VTduOLL87TiYzOVotwoOtZFS2kncwr+9kgj5j7N4r6M0?=
 =?us-ascii?Q?b7zz6jTbcVt1oA1iadveo2LOiRWniXSH7G7GMwErbQKUZRP6f52jmgVdLzG7?=
 =?us-ascii?Q?TdYlr9vXPCTtl17LCvjD4tGd0rOOXJqaF3x0AFuAz7PXF+2lyGzgM+WL8MzR?=
 =?us-ascii?Q?dQhWYG4/xfMSl4wM116IXSDutWcHB0+fMUefd6Qzj8wyuEhjEHzMf9jY955U?=
 =?us-ascii?Q?nYazOy3AgvD7i1UqmmAs00NBnjAnzZKCzrwEBL6eu773q6uysUQFEirk8JbN?=
 =?us-ascii?Q?8QhMcWWyT9I224KcBTnxbcoUmJ/wWC4oMOiX96NnLH9WZl8tjXIfkE6LvYk3?=
 =?us-ascii?Q?GKPwSOTFRzJLIvHZTKumHu56CJ7ibFusTqRx/eK3ohBX34yn07s8+c9H4Q9Y?=
 =?us-ascii?Q?BwcPXfs6Ywtrxnc6ynPf2XZZOTd28abrSzv8ew/XC1VJliwsfpQxjxsOcwkR?=
 =?us-ascii?Q?LFKDlLH0qWi/0qggWmcy21FxDIQabhkkA6EHfuQ5MpQEVg5OwD3B36P1NY00?=
 =?us-ascii?Q?uuUOjQq5fjjhsJ9Tp/xZ51Ein/VLu2z/BufwjGaFebuTx9Wfx0CwsC+63pxq?=
 =?us-ascii?Q?50H5uknaankEjHOaslNsl5i6UE1JtuJZZFuGJ86IhN8kGiSFr959fZj9k5yY?=
 =?us-ascii?Q?taZ/7YWKf+m90Lf5GPGbQhNFvDb6HpWlUMG5cObu+x+WIo+vM/Pd2aVm8DfG?=
 =?us-ascii?Q?aYlqcYk3WFdB+tcpvxaKoh5bB39JBpW2+u6PV73b9nbpneAwwthgjujtNJTs?=
 =?us-ascii?Q?z0I79Y2rzQUp5REhcsMxwmfzSfg5Cv/XpE1UzmYR1xzvqJBKNjhdYJNRLxwq?=
 =?us-ascii?Q?oRqWaRms6CCeeekE5eoOhUh6W6Z9ufjOYLRsvHF0LnECVNel2fCuS78bLYL2?=
 =?us-ascii?Q?RASf+Z6Umtlh1+Wyy3uMfnIry2YSTe7Iovwe9zx9kOimUCjy97OCbPxGI8dz?=
 =?us-ascii?Q?7R1LU+ScstLGjZXxm1kvpirVXNneO0h6ees8ljh/mk2mboKLYMLAperUIPAc?=
 =?us-ascii?Q?+NulDBPFuGEu7jhR9K63jG+QXeaGqm7sLW3in6EfJjUjkrhwv2oaGe9APs9B?=
 =?us-ascii?Q?Vt5WlrcGdDdrf8PweH3H/39M/ydI1WLPUpE7I4bJjUKoCqFPXzGnKdHYdFWL?=
 =?us-ascii?Q?exyUKJHxl4Z3ul5zl+CUkkkJ0BEhBwEfEC80P9yLSThcgKlhI1ZNJ2HcEeUh?=
 =?us-ascii?Q?yw676K5h32HL5VmcRoh+PJGIx7FTmuJsIzZTJzzZlukIdDX3B3Cpx+Ycl1ay?=
 =?us-ascii?Q?V4oCES7ioMEmvdywdX2FOkghRhnAu2nMOew7t46aTgG6Ev6iI9+WdWYLMO6j?=
 =?us-ascii?Q?Rw/OkQrThFlFLWgWe3Ezz2A3DMU42ccDZTdF1W8QVVeW48Ma7aYuFgyUvP0h?=
 =?us-ascii?Q?5Xq9TtM00y5AlXht/nmrZd5bCR4BDoqDGFVMKq4MAvJHjIQiCAP9ZUaHsbEg?=
 =?us-ascii?Q?Eg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7974b26-bbe7-43c7-d873-08de07f49612
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 12:00:20.6163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iTD4jns4g3ng56hHyL262vVKnDuhtaglvCGle0Bcx/rD9xj+fR9P0p4Fs3w65fqj1pX87u8VQk53LopEHT9Yn3Tfs86/4IirYkCe1I9MSlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7796
X-Proofpoint-GUID: yHw3m_xQEcLP3JvEZiDBXQTi3Eql0BaQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEwMDA2OSBTYWx0ZWRfX7gd8PZtT15QI
 +f0RFDATdgqZL8zG45jxM5D6lHl/FDpte8PPXVMSXnrt5PV+S3CMQKy7cO/AlWZw2nZ4GLDpXDj
 nzKF5KNzmnC//ggc7yIJ2rFpfQEYgYe+cmLOBcTpnjsw2miigsRXGIKQeb3n41EgEHaPCVtIPwO
 vRhaOqfBmSYRy08kCApUt+4TAfzCyCBqNxLEfnQmgUGM1tLFb0bJs+vrW1bhiY1NInYihnI49FB
 953kg3viDr/EHr8KaBdGhu3YG7FOAvw6E5mKBBfiT884+3xxS49cdmb9wW16weR3uRWYtZ2BNiK
 CsBPk2hEfQgQR768/thErFMulcMf9g9XH08TFrIsPw55u3sBNSRwI3AmHsixjfy+gBLwMAM7LUJ
 qEmoVLqgA5IBb1f8iYE8gLnxy77gKA==
X-Proofpoint-ORIG-GUID: yHw3m_xQEcLP3JvEZiDBXQTi3Eql0BaQ
X-Authority-Analysis: v=2.4 cv=N78k1m9B c=1 sm=1 tr=0 ts=68e8f558 cx=c_pps
 a=qV0RoXYxPRq0QxHYvE7eUA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=GE8bw80KPiBdhygVilYA:9 a=ul9cdbp4aOFLsgKbc677:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510100069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 12:00:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224679

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE: CVE-2025-11081

Trying to dump .sframe in a PE file results in a segfault accessing
elf_section_data.

	* objdump (dump_sframe_section, dump_dwarf_section): Don't access
	elf_section_type without first checking the file is ELF.

PR 33406 SEGV in dump_dwarf_section
[https://sourceware.org/bugzilla/show_bug.cgi?id=33406]

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=f87a66db645caf8cc0e6fc87b0c28c78a38af59b]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.45.inc                |  1 +
 .../binutils/0015-CVE-2025-11081.patch        | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0015-CVE-2025-11081.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 9c82f65eca..e419d829c2 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -36,4 +36,5 @@ SRC_URI = "\
      file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
+     file://0015-CVE-2025-11081.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/0015-CVE-2025-11081.patch b/meta/recipes-devtools/binutils/binutils/0015-CVE-2025-11081.patch
new file mode 100644
index 0000000000..0e15a7d6c2
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0015-CVE-2025-11081.patch
@@ -0,0 +1,51 @@
+From f87a66db645caf8cc0e6fc87b0c28c78a38af59b Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 9 Sep 2025 18:32:09 +0930
+Subject: [PATCH] PR 33406 SEGV in dump_dwarf_section
+
+Trying to dump .sframe in a PE file results in a segfault accessing
+elf_section_data.
+
+	* objdump (dump_sframe_section, dump_dwarf_section): Don't access
+	elf_section_type without first checking the file is ELF.
+---
+ binutils/objdump.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=f87a66db645caf8cc0e6fc87b0c28c78a38af59b]
+CVE: CVE-2025-11081
+
+Signed-off-by: Alan Modra <amodra@gmail.com>
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/binutils/objdump.c b/binutils/objdump.c
+index 290f7e51f66..ee8823da05a 100644
+--- a/binutils/objdump.c
++++ b/binutils/objdump.c
+@@ -4485,7 +4485,8 @@ dump_dwarf_section (bfd *abfd, asection *section,
+   else
+     match = name;
+ 
+-  if (elf_section_type (section) == SHT_GNU_SFRAME)
++  if (bfd_get_flavour (abfd) == bfd_target_elf_flavour
++      && elf_section_type (section) == SHT_GNU_SFRAME)
+     match = ".sframe";
+ 
+   for (i = 0; i < max; i++)
+@@ -4993,9 +4994,10 @@ dump_sframe_section (bfd *abfd, const char *sect_name, bool is_mainfile)
+ 	 SHT_GNU_SFRAME.  For SFrame sections from Binutils 2.44 or earlier,
+ 	 check explcitly for SFrame sections of type SHT_PROGBITS and name
+ 	 ".sframe" to allow them.  */
+-      else if (elf_section_type (sec) != SHT_GNU_SFRAME
+-	       && !(elf_section_type (sec) == SHT_PROGBITS
+-		    && strcmp (sect_name, ".sframe") == 0))
++      else if (bfd_get_flavour (abfd) != bfd_target_elf_flavour
++	       || (elf_section_type (sec) != SHT_GNU_SFRAME
++		   && !(elf_section_type (sec) == SHT_PROGBITS
++			&& strcmp (sect_name, ".sframe") == 0)))
+ 	{
+ 	  printf (_("Section %s does not contain SFrame data\n\n"),
+ 		  sanitize_string (sect_name));
+-- 
+2.43.7
+
-- 
2.49.0


