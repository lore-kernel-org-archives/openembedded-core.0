Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8749D4979C
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 04:35:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.167130.1733114138018770878
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 20:35:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=206613f97e=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B24MfrR005260
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Dec 2024 04:35:37 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437qx11mvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 04:35:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mM+MyhtKeGbqMUeHI4gFycsAhAgzOw4NyVZRW1IJOi0RG1C9EZpuB9a1pt878/HriQALqg21b3Fle6p3yek5YPieImqhhfp8Vx/mtrMDOJZgZmi+R0vMP8jqdLRMqjNPxmsNGyeypfOljmAR5pP5QFH+O6erRecZR+sK1mTgL/mAb2LkuUqZW/8ua/x8Z5pFyTO6Yor9qJnjWjMJpX8EOOMl/jpvgeB4dXL9Hsqiu7zl7ZjzAvmjqSMkN5GRm3EKnfIUBwh+zU6+uwh7OfDP46cLlUv0USw9X6wy4UuyC78q8b94x7QQM2ZLbM3ZmwNKYLHQQAn+1yYi3ZIoeBqRGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CiLWDKrSj0pudmvgE2qRP+DS2HCbvOGEM/gL4voWU5o=;
 b=ANYy3LxZwgGbXpzNRPhpEgTDQfu5xOVetddWODGaa8TmafcJM73OfmQBSkNkjrg2ICOmQSVVW1DLh9KarlUR2YaDag+6M2K9OAjmTeuvRGgyajXWh7iwk+zkdk3RHInbeyYt1dNfdw3iwGZTgggh4irBb6MzuZ5ZIaU0HlTGjtSJG7NpbXkVnOyr7us/hUfFKniTzpDA2mBGa4UfhzIV4+psrLQblusNcl6RXP+MLaR5iC7F58hxW68rasEghbkoJ6qqeTUR9DllhOn5XRu4b8GLVBOOHYgsUSoKWOJRBm64U1G6eCZf8PCis0UmDqZSOhaiVyrTrDRpWuPYx1DMHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by CH3PR11MB7392.namprd11.prod.outlook.com (2603:10b6:610:145::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 04:35:32 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%4]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 04:35:32 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH] gcc-sanitizers: Add riscv64 as compatible host
Date: Sun,  1 Dec 2024 20:35:14 -0800
Message-ID: <20241202043514.3046780-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::17) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|CH3PR11MB7392:EE_
X-MS-Office365-Filtering-Correlation-Id: ac1da560-106e-4d88-8073-08dd128ac18c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Tyi4g2xMulnvycfaHZe6pIguBiCjO6PH6eTRtVxeortP8VLf/iDVSk7Y0OpY?=
 =?us-ascii?Q?31y2smoJReQgwbiCfYDFyCVAXEJEpoQHfrfdMfAJ2tZe0MYhH+cm1tOPihp+?=
 =?us-ascii?Q?SZ9l9pK09ZS+5/aSugg6a2ZpcRWnG3ErxdbrwJh/NzB1/BmqI/2eQTiT4k+0?=
 =?us-ascii?Q?F53vhuIrk4KnyawlkS7FoXDVmoig/tfiF+5fwkIDZkfexCB/x4fjUQmUV3JC?=
 =?us-ascii?Q?TdPs4kyNRfrTL9rXPEL74Y8Wgh21zaRFC+/UP5VLRcoAMxcP6gl1RohW15mA?=
 =?us-ascii?Q?whq2cKSMQk/oXV98snqF5DLoVnnpH41qAjAKUl4v7ZhAPOsbEwSNGmhIdwT4?=
 =?us-ascii?Q?QuewKy36H6K7wmyrl38iYKVU8GMdwlUZZUIbkS5wrENfB/bRa9fEBqxusyXA?=
 =?us-ascii?Q?c13MiaAH+AMZAhl6j1cPZ0tERFv+UdfZtsqx0kaiPM7fPT1FiWmanhMtBl+7?=
 =?us-ascii?Q?HqW+z6o3L9uZOr0Sc0e8xK4EoTMsY2aKlBHAxwuqKAITFInfCZSE5h7klMR3?=
 =?us-ascii?Q?I85bkrT1cfrwHaTROyZubQeJX3u+D4ovticEOxGjHoLJlH1Kw8KQoE4HNMf3?=
 =?us-ascii?Q?KM3Yvtub4qI9rrhfNJY/hvmmFhzc2adXrJEkmSvu20EYgo3SLRJLMfK+p2Z1?=
 =?us-ascii?Q?hfP4wc0S6b1ZXHbDFAYLdEZEIkEd63eJOngt4KWhIpfqaeQnGaBXSJdXqb2J?=
 =?us-ascii?Q?7sZXK9LtIar9T5iaNhGGR92ljKE9b3iJgtEDLE40FI+aOhxXoblObUUCx4gu?=
 =?us-ascii?Q?923NxqXqYKkKorzxp5UZ72MyvhrnqZq3/FWV6b8A/4c1/wFEVzzmHFnfr5lj?=
 =?us-ascii?Q?M/ZlWuoRcNBwHllDfxeNVpel/9YKUiuilPbhYN1NrDieUkVdzRxMHasGyv7Q?=
 =?us-ascii?Q?o/+L/q5c9GZz2nx8767RNI2629BYoVpdLUOBks3PRrE2ZMMpr6PbZmp9dhQe?=
 =?us-ascii?Q?EtQm6xWlPz4pWTtm9xIjmeTWGb9Xi8yjBnPX1TbIJG8Xdsp8QQEwKoDh4Lnc?=
 =?us-ascii?Q?AVyznGPM7V8ueKDmjchPjWqSwckQVgTBjfk9bWW2NM1+TIFJUBMVhulcDlbq?=
 =?us-ascii?Q?R2io3OKqM5W3lJGy4IxSLAm+5/mWnT71K6W/RahRPJgl7NNgQPCXHEobhR3v?=
 =?us-ascii?Q?HoM3QxfRhUvY/XTrZjJ+14hm/PIsKOyuyVzxCbyrRrqk81qHNGQ2F0Nd24f6?=
 =?us-ascii?Q?iievtwAWiqVrgqBJJCuCOX0o5UKlHRbPN7LR/s6d/2RzsF49qWYHbq8pPUzF?=
 =?us-ascii?Q?fuiOC5IbwH5it/nZniMdMutOu4VGeJK13BECvCv92pOVIlFtZ9qG8hR2pVR5?=
 =?us-ascii?Q?KbswnNFy6CW30QTARjVpDRogejc/BSrdXojWlVfQv+vzsRLANMUJvvKQB2us?=
 =?us-ascii?Q?uI8HJd4iN7/4q+ciFtnTIL9+4GuQ3gcUfBUViJRIKbBNrJCn4A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QoszW+ZYWGPOnuxKMtN2M3UdKyIzPQh0hqQ1dbMM3IRKoVER4Fb6i79J0X+e?=
 =?us-ascii?Q?E6DOBrdzrHqV8iHaxo2qlXmyQlXbjgMUBdMPoEpnIIl5UAqFv/GdBbZEjqxI?=
 =?us-ascii?Q?jXfgA+IGepR0ZYPTH82LROgJ4luZ05KBzZMgNJFIOExsIZI7r09A5bYKbvhl?=
 =?us-ascii?Q?EUfelXAcxrJ0c3LfhGqJfDpZt+/dY5bgyO30rDygYs97eZ1uaTkUt6prsgsf?=
 =?us-ascii?Q?GqCXDlBM+46Livatv05ZQjD1JcdIaakndSeGm2qzjGejTkt+8GbFcj13U7oM?=
 =?us-ascii?Q?2b4kbPHeA94MZbzLsiGtN7LH2aXhY90PbhLZ1hBRTngxAom529AtCNNeFd4V?=
 =?us-ascii?Q?PMhAwAnoo902eTzGXq4eFzC15JSVQv6l+1JS5b8xZP8iD3ZDCn97TL0h1ebL?=
 =?us-ascii?Q?llk70tRG1yVSZYwV2Kj/h4FWJgvZQHRC22/yZ5O2D4lpDw0qcV7dgHnu5u7A?=
 =?us-ascii?Q?PKunP/hp8nieJMXHf+9WnF0AvhdDfB9h5gnqtceBig6xwDTqX4pW+AZZzx2W?=
 =?us-ascii?Q?5f6XCdRgVdwP7zMQoK6j7f2M/FvJkT+8GHv9d64tgQtEcs49ntkIMIJt5YMq?=
 =?us-ascii?Q?NPVDoq0r/axP1Qc74mw0bEtInfi7EAGq6Xi7xdjqbD+sJJrdTAvI9IMiTHny?=
 =?us-ascii?Q?goN19pJxh4w29vT474uLaMZpw2P/pqwTibWnM10nAqd3DQqSX7REl69eP/C4?=
 =?us-ascii?Q?rKz1PAHxKjzDFESso5wKE9n+4UmgOlihe5u4z0BfbwvLk3kgC9o9C3iPebus?=
 =?us-ascii?Q?HLk3JjNoxo+mO30fMwwtJJnWfWm2RhPbKuX82QlhXyZvA1E4TOAYpf0TvRMb?=
 =?us-ascii?Q?Ut0uVa4oZvoBdLMbbY/DxJOh//8o9KVrajDwMXN1DRknDkvdd5ZPhT3UnbHq?=
 =?us-ascii?Q?hbIfPSMlZ4RQIqLqq0dqN3DHh0eL1rjFM7Rmb8vzKCV9Snw36KbrsBh8l0oj?=
 =?us-ascii?Q?baP+M4XSwzKH8r5q4CvszsiVhnA36suc24XQabbRSZMWuFnnlu7F/ZrNRy5J?=
 =?us-ascii?Q?drNY3MOzQaEXxD793lC0Fq6I5gWUpOY5ckrZDjE/PNn710XE4XCD++n/LLi+?=
 =?us-ascii?Q?QLo39saIzwkpqCR/b6+Nfupvv2fAz8H+H9h0m0E1kL9Ja1DuuEsmXJOzMr20?=
 =?us-ascii?Q?xfmJsTMV8/jSGG8hrsE7vqbCZyT9MyvZB1G81Tw9gHMhYmUn+wUbadT2hHqe?=
 =?us-ascii?Q?kwCXVDGBra8oXFpscZsp83xRX8LwLIf/0JzjztFyyYa3vrJ5wOjCBQbfxSAh?=
 =?us-ascii?Q?+54YphLZ8WRQAqmqVfM6ULEuVW2/iJnauZf5luxBGloGUje+GE4PwL4+b7J0?=
 =?us-ascii?Q?z2Ua2Ykmkh7a/PN4WPBGmxtkB7Aq/JLeteJ7zUZJj2NJhxX4XLdl0uD0roe5?=
 =?us-ascii?Q?afXxz1xxOzkkLzQqUeviwxu8IBSKTkkutbvk6/Ybf6Re+JTf7YAfHrl71W9H?=
 =?us-ascii?Q?bR9gvOwfBdk5IanRXPfg9KvcyMEmm1ccmUuUQ2i4ftRVL1AtC/lHA66Xbzrg?=
 =?us-ascii?Q?Ockrwrvk4Pz6zCkEe3XvhO0gaZTvgFBvFeeG6G+fpsnoZJbV0j2am8onJ5+a?=
 =?us-ascii?Q?MkjB7n1kYzyQZEBZ40fU68Xmj7cpIC54AEK8A/SnG8dc/G2+4hVQhYFcbF96?=
 =?us-ascii?Q?/Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1da560-106e-4d88-8073-08dd128ac18c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 04:35:31.9617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53frBKRWCkJfEshzpyHyzdxZOyY8s6Plh6eM/KArfGsaliB/l5vxSsxwIe7T2sTYmKbZbwl4+mC538WD6CS6ivye0Ya7KhaOD2Imwdr7ozQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7392
X-Proofpoint-GUID: Zrn-2sXxVDovMFO3WFFlhVZSIdzBwT6R
X-Authority-Analysis: v=2.4 cv=EuYorTcA c=1 sm=1 tr=0 ts=674d3919 cx=c_pps a=x8A/wAfU1CBlff9R7r/2ew==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=0G72KRo8TMF_qnlzY4sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Zrn-2sXxVDovMFO3WFFlhVZSIdzBwT6R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_01,2024-11-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 mlxscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412020038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 04:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208123

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

RISC-V offers several virtual memory address schemes (Sv39, Sv48, and Sv57),
but ASan currently supports only Sv39 on RISC-V64.
For RISC-V64 Sv39, ASan uses custom allocator configurations
tuned to manage large allocations efficiently.
These tunings are incompatible with larger address spaces like
Sv48/Sv57 due to differences in region sizes and alignment.

For riscv64, Asan's tuning for Sv39 can be enabled in qemu
by using the appropriate flag in the command line as shown below:
runqemu nographic qemuparams="-cpu rv64,sv39=true"

Additionally, the COMPATIBLE_HOST list in gcc-sanitizers has been
updated to include riscv64. All necessary tests were successfully
conducted on both hardware(Microchip PolarFire SoC)
and the qemurisv64 environment, with ASan effectively
detecting memory errors in both scenarios.

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 524ebd4ba4..8c98e9cf8a 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -73,13 +73,14 @@ RRECOMMENDS:${PN}:append:x86 = " liblsan"
 RRECOMMENDS:${PN}:append:x86-64 = " liblsan libtsan"
 RRECOMMENDS:${PN}:append:powerpc64 = " liblsan libtsan"
 RRECOMMENDS:${PN}:append:aarch64 = " liblsan libtsan"
+RRECOMMENDS:${PN}:append:riscv64 = " liblsan libtsan"
 
 do_package_write_ipk[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
 do_package_write_deb[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
 do_package_write_rpm[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}compilerlibs:do_packagedata"
 
 # Only x86, powerpc, sparc, s390, arm, aarch64 and loongarch64 are supported
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongarch64).*-linux'
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongarch64|riscv64).*-linux'
 # musl is currently broken entirely
 COMPATIBLE_HOST:libc-musl = 'null'
 
-- 
2.43.0


