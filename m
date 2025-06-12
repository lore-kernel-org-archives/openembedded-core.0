Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B356FC71143
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 09:57:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9129.1749722244775068734
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 02:57:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8258e96b79=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C3YbaB027382
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:24 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474cd95bnx-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJXFF6ULJY2MPZ+KHSL+VflUa5MMVeoQ9tCRIxXn0hZRlbDFb2d/cUConweBRQbMLWOEkmsfjXy0HBdna7TUhYjQ+5IuXJdXQPwYTWvSi8xNkoVN5GOKPQ+X5PB0z8vKiP+jjK3Sd5sr/KqBAp5yiUmDd52pOcQ+i0bCqoMaQZmqAMdY/HFQrtJ18/BLGX17KjTyjtCu1WZ4YuaLqlPw0EucOMkRSw4Nwxc8Mb+iFZABjOrSPNMW8DoBKhL5Q3m4XwosW7DGiU/5cCRbgqrVXh/aWcSth6OfTFegk0bO4QwQ/D9S3Y7F/i5nCwrrpwugO606dYIV85CajuMirMyLlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFrXq5YuOy/FOwcu2CVtMT/aWHab7C/WTsTNrRCiuz8=;
 b=Bo7A1bwPSAirRGPUJ/o/FHMW3lnhG+HqS0qFjl6BFFCRR+G6mTHxNxtWmGPTuXTCl3nnV+JjT0NcpuSEgFSFRB0xwyqI5wIBAbKtUYkvgExkPpWvSzoc66ho5LwqM2IGB3uaE4NQSAlR8uzGc4dU+024+oBMsPO3HllqinMQ4S9S5pYGAgUbIQ+V149BnhDWXpVgK/0xGa5IMWaElgHzJA5wS+HD/U8FT5tP/mW1Kmq5FG/UseMhXCV53dHWx/IsZL62pdu8pO8hPZxnNcuGquYKLVh8T2QEE2x3QNhA9cGVt3mzfbqbwzB7g/F9vl3kwR0/jv2IqgCb0/1xeNT5NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH3PPF2B89F77E0.namprd11.prod.outlook.com (2603:10b6:518:1::d11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 12 Jun
 2025 09:57:22 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 09:57:22 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        =SunilKumar.Dora@windriver.com
Subject: [kirkstone][PATCH V2 7/8] nptl: rename __condvar_quiesce_and_switch_g1
Date: Thu, 12 Jun 2025 02:56:38 -0700
Message-ID: <20250612095639.3630518-8-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612095639.3630518-1-sunilkumar.dora@windriver.com>
References: <20250612095639.3630518-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::11) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH3PPF2B89F77E0:EE_
X-MS-Office365-Filtering-Correlation-Id: a6b30330-1480-42cc-b998-08dda99786c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?g+L82JawVQMzWGZvYN1P1N8GAGx7zfY6b8UFNpaEja79zT+44IdWQ5OOXkBX?=
 =?us-ascii?Q?baGwWUcz4e/AJ/u08/tJ7lDfogu49zbkP9uofbMkJuXdy96uOBcN9vkvX/XT?=
 =?us-ascii?Q?eAzT4kpz1g8s8hQ0EJIWlHM8aJeHV/2E41Pjf6cdFxwtb5ebOYXhB6kZLcc6?=
 =?us-ascii?Q?Zheu2ZtbVzJzEwakfZiTyeWM6NvaeOWI5qsQJ96DOZvOxVmVJgUNQdmoirNb?=
 =?us-ascii?Q?5ra+HAj2Nbw2F65hPD+ue2Lp8niISyFXlwDdehReEvNlADwFcaZvr/vk2O8X?=
 =?us-ascii?Q?DYJCXRp1x79hR6l0t4sDxTT05vDJfa9paHJ/HrePkzywXnwva9hIFD97qEZ4?=
 =?us-ascii?Q?jxRg53lIJDSVLaqMh6xmxYnB5iInO3sPj5tR44adYQBi4HbbAipdU3CpcFHa?=
 =?us-ascii?Q?+4ovY05yAlsjaPobiGvkd3GLFewxrMGZLyIaZriAXfgtXcltwMg+ikxAXzYK?=
 =?us-ascii?Q?si9EeFQ+VU0jaYnMKOUNaoR6gymoEpKWxZCU+ukvp/v2jGHQ35wgIvfnKWK0?=
 =?us-ascii?Q?P1lYOFt/LfKx1IAFyqxqlo2ZO2HtOgZxSSJHvfFtxpck8q7YToLBy+GF1Cbg?=
 =?us-ascii?Q?LQjxVrn2M9nSybZVsDHQ6DCEL12snavzixxFJBziDmdEVR644vxkmGSVIEqK?=
 =?us-ascii?Q?h4S918kVmhTheiA4j9g74R87UXFyXKs5HhP6AHHIOfsg+rG6HTzm7BWw4tiC?=
 =?us-ascii?Q?vvzyWWAG4rPxofF7a8L/Wl7ltxh9yin6gC3RGFzP5Bk3tVcZpgpT3YK5HwD4?=
 =?us-ascii?Q?KWTeIPQEURga5Dnyu3HGBsfZukYkyUxCe9i94YWEFdyXAV8cgxNXSoCXF5oP?=
 =?us-ascii?Q?av/w7y8FF+wrwRuQOfx3L9bIiJzko/Nf6+XSAhcaVSJq6l6q/A/jBNjPiel1?=
 =?us-ascii?Q?Wag/3xbrvm2LnXQSVEqVKgm1FZ3LKW6cxVaIqjV5mIS4GKfEGNv5WiRYMNwc?=
 =?us-ascii?Q?3pmCUMfbZOdD96RAMzBTaHYn78dWRuYduw6Rn3/1FTIzZ3T4xFpRJjXWCWcX?=
 =?us-ascii?Q?Va28tTu8BfNNLzxX1xHYIO91JL6sV+xI8b4kveIxOdN+sC9gwvSIf7n6yoxV?=
 =?us-ascii?Q?5o0vn9KKSiJOxjjEyAZ5dnZgZBUglkGmHmzLircp8GtP5ff1aTEbwRHrWCMq?=
 =?us-ascii?Q?5ngIlr4FGAn8PvCY2NYS6zKMBVZiJSfKw1d7wkky0NOa2DvoPYPSl1EJWSKd?=
 =?us-ascii?Q?ZwQagW9dOKPz5f5ugv/GiDpNCuF2u66RhK5zfrW7kePDT2j82IGWPz9xEfGK?=
 =?us-ascii?Q?Oyz5osdRFFt73GpIOO4kdJC6Ve6RYfdbO8vWpGm3Ix8TzlKtSc/2hiamuWGR?=
 =?us-ascii?Q?3wHmkDy+DvX6TpuvFis1VUWWPmgdnNztrVs+kS4lsw/q89yVqPl67XmlNB79?=
 =?us-ascii?Q?BjzBC3AyI7ujCSCR8OpPh4Ux+zyVfjfhItF0VBYw9U7/urltaSB2vqkbWcU5?=
 =?us-ascii?Q?jNNujwKHuzMJS/Xf8QrdcdrWwZOph+eZLy5SzNwloPmCYb8AeSpztU1/bqDo?=
 =?us-ascii?Q?nk2wVFat/BnO/lk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Sv1wWERZuZafzvSuxS/sMfo/cmEiphHRvYpNpND5Lalpa7ahOtmd4rdql/ET?=
 =?us-ascii?Q?yYyte+JVZYWT9/Xoj5CEry7r8qdQm0NQ2oWDxFkP3+b8pH2kk6vvR1siFmks?=
 =?us-ascii?Q?/ZsbBcGni5RzHVLhMpuR4PpJ+YFwddgzSrscpTPyQSR3p0LWxYEWQDjn2BFN?=
 =?us-ascii?Q?uSJJfQGCB426iOtfcOrHmdCXVco0DrnTPTFbde6/pKlFzb9q0UuzOqZ1/8gh?=
 =?us-ascii?Q?a2MhtHkjocFvYCXBS1bix9GmFyVlyWxdjUhduwrb71Qts68gb5fq/27nQwer?=
 =?us-ascii?Q?Wtf3BbmySrdEC49QEdKddWlRcq4cy6kc1kaiJJLGkVi2ucCS5DZdFZguXpoa?=
 =?us-ascii?Q?0M/2BQ+uq9E7CcMQWlRlImsHAC7oj1IpAIvpnMbawygCse2zpu0UzU1aSVQ3?=
 =?us-ascii?Q?CecacxRRPQ818/Fffz99YdIjAXnX18KzxDmnERWZwrEi9OE5JXvqzqz1LqVo?=
 =?us-ascii?Q?qz6KnWfjW0e3vXMt2cPiq6Wrgb+zoBgshihTUKOPi2ZhRJV2ZWrs9s6GfUiX?=
 =?us-ascii?Q?SAfM0Qv9cycmnAp+jwQ4RopQvDvE8C6b8WKpw3zK28dA5IsTQCckh4+knexi?=
 =?us-ascii?Q?OdE/9PUH40ALzj4fNUi4qQ7GKKzK2TfP5ehgYex2z1qbhoY1qm0tmKL211lv?=
 =?us-ascii?Q?NXgduOjhZs5x44RxeqARPpx/nhdSyeG6b/VbLglgA9yY23sstLkkL689YOKj?=
 =?us-ascii?Q?ratm5oNpyeV0/AcNrrRM2xRtrdzi4PfLVB1exHEDSZ+8qusyJgWxO2pj/tjL?=
 =?us-ascii?Q?6sIIbc+iVmONHGeSNqwr92hkF6UFa7+yjdLFVmniGmO60WY/mWD1eIV/B+vS?=
 =?us-ascii?Q?jgVCAjbhOiw8wrAx4Hd8+AqFOHyANdF76BbiZL+ZkUw5/tJGxjIgp/LCp3k1?=
 =?us-ascii?Q?j3uWqteMoB31CItrcD33B7bjhNG5PeCE3n86QbCZN/qm67eh94vlkx8t7QSE?=
 =?us-ascii?Q?qg936Vbv6T97YrYb4CIEg9CLb3Xb7q+bj6mNykrM4zbqmMPLyYTi0aZ6fdZH?=
 =?us-ascii?Q?VS/P7ok6F90roUwtxcmY86wgLzcaN5tQLZbBSmhIylPeS/I3P+46iqUzlZq4?=
 =?us-ascii?Q?BOOkj0CngDTuX3wAhOA1sTOTYtpw4KvmY1hcCq86js7zBkgDl6syHNUaNO4v?=
 =?us-ascii?Q?mUYizvnWreAfY4RK/6D8IaoOPeotYcRvnbmQ+evJNozS53RyfexWdOg7J5Ny?=
 =?us-ascii?Q?1b7kygpD1556JV1wJOLKYfxLPFiNECZgBhkmI++p0rDoROpg1qsOR4uBflpF?=
 =?us-ascii?Q?raDa0263CA9qkbB0x5NC2FuDm6zmq8lqA7GkBiwhw0IL6Xe6fOw/0LEoO1Yb?=
 =?us-ascii?Q?F5+jJRqNDI+Rr6ZTDCxxUdMmW16IPv4vdRm8apVt9pWwRQ/yCggBM3Ard7rv?=
 =?us-ascii?Q?nGrGmF//fQYTjjDSt3GKZJlu3F5tsMUUasMBTVEFX4cqABeUEoclnsE9/OUt?=
 =?us-ascii?Q?dqd1Vf/x+DV/J1s6rt6n72DxZRLUbXS3+kTLJQTJlapiIgpvZwX8MmSpFaSP?=
 =?us-ascii?Q?Ujv+/ToniXliSHiEuEsbjE8e/9C+9pqHoyM3y7ddpMTJlYaDBEopb/8HIb27?=
 =?us-ascii?Q?shWLoGSnKpgBWIK0zqoSxs7FOFSemSHtJOqpcpZms8h8BjkuR0vZ3bfYjK8/?=
 =?us-ascii?Q?huAebuPUeI9vpGz3dDi38ms=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b30330-1480-42cc-b998-08dda99786c9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 09:57:22.4330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0H9wgETkQ1eZpyhAxi71SlWFX+kUDPqOHMNeqYgtIJESivAgRKAoD5iwrvFaRS0nExI73GlSY2Hd8E98o742ryYRbiNqZfgWNyOydGcsUM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF2B89F77E0
X-Authority-Analysis: v=2.4 cv=f+xIBPyM c=1 sm=1 tr=0 ts=684aa483 cx=c_pps a=oHfdRNjjH91Dx1UII95wnA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=s6aSZSq6sOFI80PhqW8A:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA3NiBTYWx0ZWRfXz6vo83GrTut9 QwgW/xo/s+L2nnnh0ZeZYi0FDwXgzKqt3BUzF6YvnqnwwbeELZPY0pb+RDBT7EZzXubU1eTkHBx JA+93/f+WiaiBgIbo0G9T9K8eKbmiLZ0T7EjGq4XGvQJwIgAMZZapdwvxArEMNeTkyloje9t0vz
 hlWmid65U2RmsVCV/lfrs5icUyYcGgjmqyGgEff255iJhy/y7+T0pEwuL9v6bBHA1iTXkOh+Oqx QvKleDdFsKMlU6u4o1IVHr9fy/awzhsYDUoM6tQObqV11iliudz5Ey0hiwRCfRrSysIYarhQ01N HtFL6GJ1cu7gmJsUG+xkAIfEM+qd68tSC8zAzptOJSwaoXUiOu7W5aIX5VK5XRVTNfbPPd1c5ow
 pFHKGoH/CXUNrTlgU/GPYow9GsmOVw1Ek70Umvdyv7nGMdvDBdKvms6dgFCh9fptBMMGxlEP
X-Proofpoint-ORIG-GUID: ijZbiFboX_ano3LoxpLR1iwo8Crg91FR
X-Proofpoint-GUID: ijZbiFboX_ano3LoxpLR1iwo8Crg91FR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506120076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218499

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from the Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847

Upstream-Status: Backport [4b79e27a5073c02f6bff9aa8f4791230a0ab1867]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-7.patch          | 159 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 160 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-7.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch
new file mode 100644
index 0000000000..29aef6ebd6
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch
@@ -0,0 +1,159 @@
+From 305380894e0144159e493dff6d71dbcbf07aeeb7 Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Mon, 9 Jun 2025 07:01:40 -0700
+Subject: [PATCH] nptl: rename __condvar_quiesce_and_switch_g1
+
+This function no longer waits for threads to leave g1, so rename it to
+__condvar_switch_g1
+
+The following commits have been cherry-picked from the master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+
+Upstream-Status: Backport [4b79e27a5073c02f6bff9aa8f4791230a0ab1867]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_broadcast.c |  4 ++--
+ nptl/pthread_cond_common.c    | 26 ++++++++++++--------------
+ nptl/pthread_cond_signal.c    | 17 ++++++++---------
+ nptl/pthread_cond_wait.c      |  9 ++++-----
+ 4 files changed, 26 insertions(+), 30 deletions(-)
+
+diff --git a/nptl/pthread_cond_broadcast.c b/nptl/pthread_cond_broadcast.c
+index 5ae141ac..a0743558 100644
+--- a/nptl/pthread_cond_broadcast.c
++++ b/nptl/pthread_cond_broadcast.c
+@@ -60,7 +60,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
+ 				cond->__data.__g_size[g1] << 1);
+       cond->__data.__g_size[g1] = 0;
+ 
+-      /* We need to wake G1 waiters before we quiesce G1 below.  */
++      /* We need to wake G1 waiters before we switch G1 below.  */
+       /* TODO Only set it if there are indeed futex waiters.  We could
+ 	 also try to move this out of the critical section in cases when
+ 	 G2 is empty (and we don't need to quiesce).  */
+@@ -69,7 +69,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
+ 
+   /* G1 is complete.  Step (2) is next unless there are no waiters in G2, in
+      which case we can stop.  */
+-  if (__condvar_quiesce_and_switch_g1 (cond, wseq, &g1, private))
++  if (__condvar_switch_g1 (cond, wseq, &g1, private))
+     {
+       /* Step (3): Send signals to all waiters in the old G2 / new G1.  */
+       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
+diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
+index f976a533..3baac4da 100644
+--- a/nptl/pthread_cond_common.c
++++ b/nptl/pthread_cond_common.c
+@@ -189,16 +189,15 @@ __condvar_get_private (int flags)
+     return FUTEX_SHARED;
+ }
+ 
+-/* This closes G1 (whose index is in G1INDEX), waits for all futex waiters to
+-   leave G1, converts G1 into a fresh G2, and then switches group roles so that
+-   the former G2 becomes the new G1 ending at the current __wseq value when we
+-   eventually make the switch (WSEQ is just an observation of __wseq by the
+-   signaler).
++/* This closes G1 (whose index is in G1INDEX), converts G1 into a fresh G2,
++   and then switches group roles so that the former G2 becomes the new G1
++   ending at the current __wseq value when we eventually make the switch
++   (WSEQ is just an observation of __wseq by the signaler).
+    If G2 is empty, it will not switch groups because then it would create an
+    empty G1 which would require switching groups again on the next signal.
+    Returns false iff groups were not switched because G2 was empty.  */
+ static bool __attribute__ ((unused))
+-__condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
++__condvar_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+     unsigned int *g1index, int private)
+ {
+   unsigned int g1 = *g1index;
+@@ -214,8 +213,7 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+ 	  + cond->__data.__g_size[g1 ^ 1]) == 0)
+ 	return false;
+ 
+-  /* Now try to close and quiesce G1.  We have to consider the following kinds
+-     of waiters:
++  /* We have to consider the following kinds of waiters:
+      * Waiters from less recent groups than G1 are not affected because
+        nothing will change for them apart from __g1_start getting larger.
+      * New waiters arriving concurrently with the group switching will all go
+@@ -223,12 +221,12 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+        are not affected.
+      * Waiters in G1 have already received a signal and been woken.  */
+ 
+-  /* Update __g1_start, which finishes closing this group.  The value we add
+-     will never be negative because old_orig_size can only be zero when we
+-     switch groups the first time after a condvar was initialized, in which
+-     case G1 will be at index 1 and we will add a value of 1.
+-     Relaxed MO is fine because the change comes with no additional
+-     constraints that others would have to observe.  */
++  /* Update __g1_start, which closes this group.  The value we add will never
++     be negative because old_orig_size can only be zero when we switch groups
++     the first time after a condvar was initialized, in which case G1 will be
++     at index 1 and we will add a value of 1. Relaxed MO is fine because the
++     change comes with no additional constraints that others would have to
++     observe.  */
+   __condvar_add_g1_start_relaxed (cond,
+       (old_orig_size << 1) + (g1 == 1 ? 1 : - 1));
+ 
+diff --git a/nptl/pthread_cond_signal.c b/nptl/pthread_cond_signal.c
+index 14800ba0..a9bc10dc 100644
+--- a/nptl/pthread_cond_signal.c
++++ b/nptl/pthread_cond_signal.c
+@@ -69,18 +69,17 @@ ___pthread_cond_signal (pthread_cond_t *cond)
+   bool do_futex_wake = false;
+ 
+   /* If G1 is still receiving signals, we put the signal there.  If not, we
+-     check if G2 has waiters, and if so, quiesce and switch G1 to the former
+-     G2; if this results in a new G1 with waiters (G2 might have cancellations
+-     already, see __condvar_quiesce_and_switch_g1), we put the signal in the
+-     new G1.  */
++     check if G2 has waiters, and if so, switch G1 to the former G2; if this
++     results in a new G1 with waiters (G2 might have cancellations already,
++     see __condvar_switch_g1), we put the signal in the new G1. */
+   if ((cond->__data.__g_size[g1] != 0)
+-      || __condvar_quiesce_and_switch_g1 (cond, wseq, &g1, private))
++      || __condvar_switch_g1 (cond, wseq, &g1, private))
+     {
+       /* Add a signal.  Relaxed MO is fine because signaling does not need to
+-	 establish a happens-before relation (see above).  We do not mask the
+-	 release-MO store when initializing a group in
+-	 __condvar_quiesce_and_switch_g1 because we use an atomic
+-	 read-modify-write and thus extend that store's release sequence.  */
++         establish a happens-before relation (see above).  We do not mask the
++         release-MO store when initializing a group in __condvar_switch_g1
++         because we use an atomic read-modify-write and thus extend that
++         store's release sequence.  */
+       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1, 2);
+       cond->__data.__g_size[g1]--;
+       /* TODO Only set it if there are indeed futex waiters.  */
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index 2cbc567f..eb32291d 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -382,8 +382,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+      because we do not need to establish any happens-before relation with
+      signalers (see __pthread_cond_signal); modification order alone
+      establishes a total order of waiters/signals.  We do need acquire MO
+-     to synchronize with group reinitialization in
+-     __condvar_quiesce_and_switch_g1.  */
++     to synchronize with group reinitialization in __condvar_switch_g1.  */
+   uint64_t wseq = __condvar_fetch_add_wseq_acquire (cond, 2);
+   /* Find our group's index.  We always go into what was G2 when we acquired
+      our position.  */
+@@ -414,9 +413,9 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+     {
+       /* Now wait until a signal is available in our group or it is closed.
+          Acquire MO so that if we observe (signals == lowseq) after group
+-         switching in __condvar_quiesce_and_switch_g1, we synchronize with that
+-         store and will see the prior update of __g1_start done while switching
+-         groups too.  */
++         switching in __condvar_switch_g1, we synchronize with that store and
++         will see the prior update of __g1_start done while switching groups
++         too.  */
+       unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
+       uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+       unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 45e6dedecb..547d0a3d7d 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -67,6 +67,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-PR25847-4.patch \
            file://0026-PR25847-5.patch \
            file://0026-PR25847-6.patch \
+           file://0026-PR25847-7.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


