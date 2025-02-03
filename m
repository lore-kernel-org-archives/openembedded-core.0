Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 238E5C02193
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 09:16:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.83950.1738574168819595430
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 01:16:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4129e85224=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5137Cu5T001231
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Feb 2025 01:16:07 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hfs8hbd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 01:16:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qDklDsIDPbxCiBY01rocOAcA7yUDQk+Roq7SD7D0MjshHbHuVQwoKL8CRR8/5zBQiY+oTOWFLT3XcC0mR9nHlaTFDOZbTxrW/tCdULX39yrtoE7FdzIXmK5nP37pKhs08HQ5a1bamr+Zj77eUV8s4JQaxwHPkSa+tMnKzxmPS/kgwOXQjuTmlsoeqqEPPL8ZroXDrzuOiGdJKYA659qkwWWy0UhhBFxuR0Yt4hmqc/4GC0WQvqKNUiQzVU2ReP8zuwqp4Yzx+m5gwrtJmjEO2vtEDcKDLavonG2OLfbTHeTPil/kTN67fJu8WtOZoxeBMqbeYXyC/QK2MgK7LTmc0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRqD2dNCOTH7/UYEDoBzKWW6HQtFanB5xF7jYV/9Qzw=;
 b=y4q4Yrz6AYIMdDw1xW/MOPX6DlQljCh47vyj4Lj9/McsY9rsMQQPNrZVK4Za2dTX4jywSBaQtK2Ueg7oqNn3QwrEIsd1T4aD1uULQHn74hss2rwYSeEGGbj3/DREXs8eErWYzHULKrY4jL9jrJe33r5EuPontPDkQKQj7o9QA11K9fxiGj1Ky3v0o+8vbKp8zoJdrxPwy7MdTQhL2Tq3fhfM2Fwx9c4PwemxQ1qBZY8aXonu+gNvmV1Ls1mkuMmnCJnZ4By9/r8G3ybh+QLm51vj8uTMU0wYAnb6jBxT20toCDPY4jej5wBLB8HwsjPIvVQOrfZ0CX/hKrWIakIAqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Mon, 3 Feb
 2025 09:16:02 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%4]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 09:16:00 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Yash.Shinde@windriver.com
Subject: [PATCH v2] qemuriscv: Enable Sv39 memory address scheme by default
Date: Mon,  3 Feb 2025 01:15:19 -0800
Message-ID: <20250203091519.1205884-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::36) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|PH8PR11MB8039:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cf3b6bc-59bd-4a43-1db8-08dd44336054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yINhJdXaVe7k7zp4uLeTox0VpFeX4O2b5H61hoNiRhl/87IN+0nOAL286A1c?=
 =?us-ascii?Q?nZ7YS0hiesiFb6Vx9XNRR7S7w2dB3Z3/x69EzqrTMXM1VEjsrS/f/2hQnjYu?=
 =?us-ascii?Q?Djv9rwArETtW9jcSVYY9BswyjgYXar2YecYXo5StKrInA7BjQjwzz5yjuP19?=
 =?us-ascii?Q?0FLFPxtx+2o2r7IEevTkH2x9nh9JFeSKO6sA4HSDCHZnaFrCIMwfp/0Myt4+?=
 =?us-ascii?Q?AhTaf6uVctFnHWZgQa5qtet2U5A4sNl2zEZR+LfM1TVRpcfaYAYurabiCrIr?=
 =?us-ascii?Q?WotmxTcT4Ib+IGz21vyPXFX9ZpdFwSXpkseUpSWajWi/o4nQvU9lurcsBZzr?=
 =?us-ascii?Q?FLTmMeBxKFNKyBpzsLmcZAmzPxzcfdZvF66ep5/GecnPRoDrUY2TyKLppQG8?=
 =?us-ascii?Q?6g0dKTzs5RnK48y2BhTnwWEbkC1RgPYSDjIp81d7LvV8zfA2O2Bx0CzkMlY2?=
 =?us-ascii?Q?X7OWNO4zjhzMujhxEAiXHS5qVw0UEGJz5ghFVgyaKH0MdclvGBE54awyO+w8?=
 =?us-ascii?Q?Z6abOkeEfxC0otuz6tSxMuogFWlQw2Xv8+H9bI8xKkR+3PRD5znuWfN+IbAA?=
 =?us-ascii?Q?Q1l95O99nWPqZGIHFp0bFNkzo87Yl/4Rw/KV2Ob6s5/FuPSzdN/uAdznh3Hi?=
 =?us-ascii?Q?wAu7Q5mVO9xSBYCSNCgE07GPxYCnU2FwpC+MgwW45k1j/CqD/i/KidVyjeCJ?=
 =?us-ascii?Q?aJHgR93Zz1FVqw6Thk5u7vAM7C5aDvG/NZ3UnvAGaSzdCEWBCgAXYlD+LoxZ?=
 =?us-ascii?Q?UmlzYu1RA/8/b52xVrO4bvUhbSqASuojw1qoHJgk8V9MEmyvhqdzRJSMZz3e?=
 =?us-ascii?Q?ymzdzTSek6Hv8i1jQI/UnlTWmyW/D5WiDhNXv2gxf9G71aKzsEE7Q8w7aor+?=
 =?us-ascii?Q?7KfqHMBXyJvBMbz6gVzYVVz4h+az2kmIscpGtjpyZT4akayKFv66fjR/jset?=
 =?us-ascii?Q?ZYsFtVLaconkFHDORaTCR+oy9/r6+q2A71y15e6oFqqRtQuLKrGLMlwFGu9x?=
 =?us-ascii?Q?6kX60yygHVR+Q1xfsSHU5Cn09KF5a7y7kiIBsXwg3diEyMcmTWvncT08mJRA?=
 =?us-ascii?Q?Y21KgcBMSg75wZHmvMfag5am+xR/0d19iMgcxeau5H5yPLFmZhL5EfadXPgt?=
 =?us-ascii?Q?Sn87xxiVnHPBLMuOMC+Bn4LsiGyU1qARThwG19nFgsGs8ZVxT/BdLHNOJKVB?=
 =?us-ascii?Q?uN4HfPoqInL3zUw8EklwJrhbNDu8gi1iBYLtxGWFj53ZWQAsJx2iwTdc8DE5?=
 =?us-ascii?Q?Iroa7WhD0F2hRlXYjThic7XMrvkIAJXXbn/Y2Gx3lnOSB4zNsFtL5+tPUXAo?=
 =?us-ascii?Q?p54G1R5Hh8OUzkJiMtfgKw1b29a0bnA63CHXUERw7jCvD18utj8AgskH6uv+?=
 =?us-ascii?Q?4thR+txDrqLM9Ngo5rJGi1UfBXD4v3YlQMzy5XJ9Ll9eshRcgg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NWYsbZlx3Ec4f5AZ4ZCzbb2BBPheebqdP7F0QUJwJ28bHDvMOlb99l5Yi9kO?=
 =?us-ascii?Q?R4gFAuy5wWnElOzlhz8BNM/QRy79zKulLI9eceqRrZc5j6MUhGFoU/+oVTb/?=
 =?us-ascii?Q?qu98W9A9KJXnfsMGTkjMbH+iIJd8xNEv1wXOULdmDTZgqLd+FB6UOAYA8Fij?=
 =?us-ascii?Q?/HVd5Bzk5kJyoZW9BEtzw7XzVhXfHee1ZreMpgv4J0YmYI3U3J4ziu70u0Sn?=
 =?us-ascii?Q?ldHL0SXWyYqr/rbHDtpPHtApJWCQsvW+xfZ8vfuHpVkV6vAxTQOBZd8Q+Alt?=
 =?us-ascii?Q?lBc95AW9xn21/3NUWEMxVG/dd3l7fF1MIvGTJrnH20RJ9EtYRk2iK0TkN+J0?=
 =?us-ascii?Q?59jPcGl4Ayn94dUqfcLWujyM9nR2VZBD+oMvLtm58pQcHlJssrvVQkSb4yLk?=
 =?us-ascii?Q?Tmh2MAtyh9aXaQoa8ExXLuAkk99mAY8MvA0tiqO1c+EKVorWN5ZdbfPY+zH6?=
 =?us-ascii?Q?qYPykmHcq8EtHDtILd7WM3ckKZP0XhBL0rIt7riwcLRH3IyfppjnnAozncPc?=
 =?us-ascii?Q?n8PoohVM25rjEahS7/uVmNj4qiume0kGavSj5dSLxc0Ft4zhoQqFdqNDSf9K?=
 =?us-ascii?Q?6/zI+vx+dbbtVvGFDOrMyFoAasZn5vDjXDRmc0GL1TgKWoqEOHQ5fjFinVlV?=
 =?us-ascii?Q?/FFXyRmKp99t7g4k7DWoWn2Hcx+pkre/XIw9gQSNWj0WDuU1Z67ToKvGggy5?=
 =?us-ascii?Q?x2kNawcIuTnCRgCY+2LQpdMBC3C3X/yxW1SkhkZvt+WvRWzMSL1FFuULgX22?=
 =?us-ascii?Q?X4gw1gaSoHFGsdv4BXtmPU8TfJPuCyNN7TUJHbB/23EVEC5KFY8toPwUyWNf?=
 =?us-ascii?Q?c2crcVfDsVJEa2mlZ5vK6dUE3pkwhq7BCnJRWy524015flG4CAa9+BSqXqyx?=
 =?us-ascii?Q?o8yJo7DXriQ5ovvObWG4RO7d4KlQPt4usAm2mff3ZbGMyz8J4BZ1e8cMbU4n?=
 =?us-ascii?Q?pU6euscORMLzBNzaKusi9NH2Svjdj1606vksBnkGV5KSFxFHTscpFKoIiU+W?=
 =?us-ascii?Q?trbZIsA7n7OqtSRWbCYajHEqwwTgf5+80ab3OHi2qXpAmBApo4RiYcHDA13D?=
 =?us-ascii?Q?NSHJWfBMhFovReanpVGbuY+WFbSenQzaoSS+C3WH7+hk+McvJkVPMLEer5Hi?=
 =?us-ascii?Q?rjVRXSJix2JdeL05GyK8RxFvL2PEof5tr1dAibg6xNI5Rtkjymhf5/pus1xs?=
 =?us-ascii?Q?qwmzRJGFIb3aFr2IuNP164JB0vHdIZ6ziGmrUEu9IHUnJzRwWgU6CZWNT+0z?=
 =?us-ascii?Q?7R9sC77P/EprR/wD37xvK1jFjt5reP92INeMSh1Ap8jGSKYXkm7qJQWXjum7?=
 =?us-ascii?Q?7BuVAfvrP4661Y9WnnKb3Mv+6UY0apKXYx15UsLeaKm2ZLj2nleFwaLqA6BI?=
 =?us-ascii?Q?Vnm1pCego+9eyTeXkX2JAl8MpsSxpYavBVG8LngoAZ8CqjLXJeStII41S9iU?=
 =?us-ascii?Q?VayD1FDQjfaQY8gMCVhIkqSZ7zW2JEhUv6qrQpUfqP/dOk83m4sfULbAMb/A?=
 =?us-ascii?Q?oZQK8Lirrvemus7qMeOh8MUNnae9maz6U4gAoZ3FNKl5+mp0F2JVJNC0e/Ys?=
 =?us-ascii?Q?kiLIeLWT9XbAx8dODsSbPJNxYEDNklDj80f1aaSOMECap5lCUz9Qa5q9GfgI?=
 =?us-ascii?Q?Iw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf3b6bc-59bd-4a43-1db8-08dd44336054
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 09:16:00.8079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2NiBjV9KMeqqgdVxp0gQWd9aughffnShXKrSCfOmk6YTaF1XbiKHc6+l4OZLn8rWujqtGQj+B2iJZJw3MKMhGqGzFq1a8f+ia0v2CHXGBtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8039
X-Authority-Analysis: v=2.4 cv=JrcLrN4C c=1 sm=1 tr=0 ts=67a08957 cx=c_pps a=joO5rFOndlhnht97C4Lqsw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=iGHA9ds3AAAA:8
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=gYD8kNbDIIr3LEbscD8A:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: OPBtra-l1KDfPUjzpmbhoOH5xcMy0sRY
X-Proofpoint-GUID: OPBtra-l1KDfPUjzpmbhoOH5xcMy0sRY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502030073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 09:16:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210633

From: Yash Shinde <Yash.Shinde@windriver.com>

Currently, GCC Asan supports only Sv39 on RISC-V 64 due to custom allocator configurations optimized for large allocations.
These configurations are incompatible with larger address spaces like Sv48/Sv57.
This fix enables RISC-V 64 configuration for RVA22S64 profile(which has sv39 mode and other extensions) by default when running `runqemu nographic`,
eliminating the need for manual configuration via command line flags (`qemuparams="-cpu rv64, sv39=true"`).

Fixes [YOCTO #15691]
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15691

Reference:

https://github.com/qemu/qemu/commit/af651969eb23ecf018bcaa8e0761b58425de550c
https://git.openembedded.org/openembedded-core/commit/?id=4b4450ff695ef73bf7a2437e142d2e0730d6a547

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index d01d988eee..65cbfd66ee 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -27,6 +27,7 @@ UBOOT_ENTRYPOINT:riscv64 = "0x80200000"
 # qemuboot options
 QB_SMP ?= "-smp 4"
 QB_KERNEL_CMDLINE_APPEND = "earlycon=sbi"
+QB_CPU:riscv64 ?= "-cpu rva22s64"
 QB_MACHINE = "-machine virt"
 QB_DEFAULT_BIOS = "fw_jump.elf"
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
-- 
2.43.0


