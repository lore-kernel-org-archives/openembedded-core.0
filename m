Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B64C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 09:57:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9124.1749722230602295833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 02:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8258e96b79=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C5A2jH005270
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:09 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474cd95bne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWQ/phB8wZnt5O8T5YAH6qha+Ll1rJ8x7zK0RoeaMfd4M2VZ+CRmpSSKMUmMbF9npgDYV5Bjo2SMtfASoyaj3TpDF+NleJ7d4/LDHYb70k3iBTmZA/4wskuvoU/BuYBjqZBcv1QOyq99s8zXzQO4S2Odszl4IjI+yJpoSbEh9Uciy+ehgnN86rlBFJc0CmxKjnXAjXRKtFEwX+ZTbTKwFAd9VRud1sxwEjTKuPw9sVaaIFAT7VrZ+zHWC0ubzsiRVYzypakEVKmZ/RroGiBT1+WOT9rH5LVLowu78xBoHLqr26yXJqFSwaN8nI9KAYjcBXrLThLlVUY2csmwowzt4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMHNS5pKNNQMFLeZ8/VgbqkY0q0KAfzaruUi2nxu7tk=;
 b=P5PLfnbb2/jakflt+GpTslqB0QmW0M5YtlshYm54bvelNv8CIzetNcAqU9j0T4tYb2So7MxtcM8cLH29+8SDyeAsILMi97ocx4BU8W22ooz6dHnOz0n/UsCuiRiegPbaZnQTCfmjG+ll7QXWbT2KGKA1TaaC38ZIdgIbMpXGie/5NDGlGL3sgtcpOnMYy5OS7gKJLp68nYEbYakU+Sp8Z1W3rQRHsfXgrk7SKHL30vW4pxqSOEbJ/0ZHePKJKY2QA5MIvPsCb3jX6ZzlAe0m/s70QVvx97E+Cz9j6hmkX8Bo86iORblO8/YI26UGgS+8a+J6Q9Q3B+SdSsqsVkR01Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH3PPF2B89F77E0.namprd11.prod.outlook.com (2603:10b6:518:1::d11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 12 Jun
 2025 09:57:06 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 09:57:05 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        =SunilKumar.Dora@windriver.com
Subject: [kirkstone][PATCH V2 0/8] glibc: Fix lost wakeup in pthread_cond_wait (PR25847)
Date: Thu, 12 Jun 2025 02:56:31 -0700
Message-ID: <20250612095639.3630518-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::11) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH3PPF2B89F77E0:EE_
X-MS-Office365-Filtering-Correlation-Id: ca5f2cc3-ad59-4bc8-68a2-08dda9977cde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JAR+iybbO1g6Jucb3kwCUmSycWG/QIZsJgBWgh/uVAgaE+9dN0sBt2aT2oBP?=
 =?us-ascii?Q?VpZmQqt82pr9lpjFwLSxti5sJTKeydaLdUn9ZVSS2tVX8v0CEGluy5gZu34c?=
 =?us-ascii?Q?xzKoYO8BsENWkANy/XKoHuDp8+cERWu18uAbVPlp19sc0JlgLNavQQNKP52O?=
 =?us-ascii?Q?QiOA1HOiPZkCFGsFr8TbzIKbFIxynfJwCq5PJgbCTAwP2foIZykfidLow4M9?=
 =?us-ascii?Q?ICxM4GdZpY59iiNOmYCnYBec2ZCJyqcErl0EmvO+0DIc+gwvWglnkwLDwLTF?=
 =?us-ascii?Q?mq+KRuXgGiMTufGYAiLcbN56CjFIAjN3v/O8gRNSZ7RXlMpsyMIOYWLDi7oB?=
 =?us-ascii?Q?8Hfw2htCk2RTVN9bHPIhPkBpr/ClgJ1WScZbFv0QRLxL22mcUi2kI1f6kjRA?=
 =?us-ascii?Q?LLL2EdMxpwOux9EmUSIXQ1ritZE1aUfGp/RyA9KfH4dEFMlDbCHS6BsY/zMs?=
 =?us-ascii?Q?uIRIKLYX+frx/ygatsWyW1CVeaxatYU3nj071Noyj7aml5PDV8UCQhzfqGXV?=
 =?us-ascii?Q?/YrYwZzNxb11QOHPS8NWJfqL92xQ6U07LtLLeg763RdkI4ZIk81fh3EYd0oA?=
 =?us-ascii?Q?BlFHbJVPsJy2CV9x95P336lyD+/dJuhDHSc/s3Hek1+oyJHRrmvEMjIn8mGI?=
 =?us-ascii?Q?B6kz5irZvZL5pNVaEl+XVUmyD3lYNKNriKLvUA2spl1i2zBZ8X98NLSrp1Td?=
 =?us-ascii?Q?p2nWjGR9qKYkjOL4lfMwMcLu9YykOyl9WlfIf93PcbCI89i8YVA3HvqX2Qvt?=
 =?us-ascii?Q?wkdEw7dRoRPQNdiHECPBWtJMjg7WnF4G9zKQTCLv9v0Tx1f/dGpzn8E7lsFV?=
 =?us-ascii?Q?bVlpbWxxzIXJBVXh/yJH+lUceZfaVvu2uziyLBQ+8+fRuDCyZwzcEQQ9ekiP?=
 =?us-ascii?Q?2TqtAmTjzkf9AYisDzPesL0HTuKR27p370v+HbbysxCBnkHtKM/ujFTZ9wDx?=
 =?us-ascii?Q?QqirA5oR8zEyXHxGac5KPJGIPI/15QK5Cwcclh0xA+rkG/8HGe5jgtRlacH3?=
 =?us-ascii?Q?G1c+Sd05Ch2dBDul2AWcOZHam8pYS9zbETCLKCgApE92lOB/ROB7KBzgDEO/?=
 =?us-ascii?Q?+OcJCb7ETVC19pO4/9RDdP9/OpqoG8uRumfPyUfolaFQBgiWqBN+aOa4kbpm?=
 =?us-ascii?Q?zIj7rEnUNvN7jO6b9DWfEkI3ZbO6VLFX375mXCDocV6c38rmyRuIheANtoKl?=
 =?us-ascii?Q?/oce//l7EvaSIKOQ7mYxvJDhALiDqU1jFjkH3MZnDvxQnP5grhcARvvzaurB?=
 =?us-ascii?Q?aruoDLIRmjPREwpKf14zyo3Ex2rV08HxyP8Ic7xdFuzi06twf9awVo7inLT3?=
 =?us-ascii?Q?/BCB0jtIdsmj4z1oitoXDrmp76EV0jDOu0D6gFehzzHghmbqNkd2wx9Myws3?=
 =?us-ascii?Q?BwCg/eQc43KlwuhyQfNzUOhB3PuS9DDxnGirXpps6JAJUfqXyaangOV7YYZ/?=
 =?us-ascii?Q?Ab+hUI42WAviL5vJZHbiB4SMgc/ul+mB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VJUqoat+RiD0K47QJUatgGBtUJ53402mJRhAWsKMAzNDcgmAMgYiuGqIGkUZ?=
 =?us-ascii?Q?E+Iqb43FeazAqXYJadVgjuzR5g6XCzT7kYF3ra3em+aRIv7PjZeSZXe8bMjE?=
 =?us-ascii?Q?5YvfY3Yo+UPh/m+fZ2g4PFpeVrOYELnkcsD1LhtlrsfS0tEiyX/NKQapLrr2?=
 =?us-ascii?Q?jxLjOz5rsZBc0rg6YDA4CngL8SEBraMyLGIb8ZL2uNrdKFe5VajQwNMzAF/G?=
 =?us-ascii?Q?0imF1umX5zBi+/El3G+TlDEv5aD9EIkNCMje8iIbF1PQw4sGi2euGIQhKDQO?=
 =?us-ascii?Q?DWBZXT4FuljjcDqSWW/1TEjPqq7amm7T0fw3raPhTX96hlYZG74ZayV4cEw+?=
 =?us-ascii?Q?EGY57c9e++cCcTTQ8P7n6k3DteAjqS2BtgfMwA416PThDnAHMKGrpBt7QUBL?=
 =?us-ascii?Q?ASWDRdrdIlwL9cpnPFWwLLV3govDRiJ0kH6RKQio1r4aCI1Qi4is5HwXblk1?=
 =?us-ascii?Q?gQ8pCuhwgHAZuDjHSwxylO1jyd+mGgRCqUc1q02l2xpwzOJs0Gm8MPMgPTBz?=
 =?us-ascii?Q?nuifDJ1rUC6uJBaoLXWhLWFe5V7s7DUnhhsMWn/qH1LNub5Z7V669jHf8AEw?=
 =?us-ascii?Q?WuAIPnEEkVP677DlEudBKswUM1pqarA/LtEbQPSzlRYe4euBBYQC5u8GP5b8?=
 =?us-ascii?Q?ZmaXNkOK0SIr8JZI5YoFOQSZNs4mfw91YUS8YUfi9lV0CrE2XKroVUwSFcpe?=
 =?us-ascii?Q?puF4lxjkohvYTHwq1Wuk84Hn+ax6Q+Zqv2S0sCb8qO/2BlSp9r/yH9TSHhsz?=
 =?us-ascii?Q?59YwlyCuYFPam67UCUoBHmbh+FgmLcJvpVg5JvqNS2jYtIXKP2E74q1TiOs1?=
 =?us-ascii?Q?AIraS9WIMc/1y21U5ZFk3hMw3s74QNVrK7RjtyHaWthWE19/KMqoC5e/KI1J?=
 =?us-ascii?Q?BF357hL+oHpBEXqdArnCFqqqqv4SRbpfB77/lI+oQWyocg9C3eYcVXFtIN2C?=
 =?us-ascii?Q?extX6zo0LvZpHprv7sfkyblNxKnUxZ6rvVlM28rARZlPq0T2kfomATTl1GgC?=
 =?us-ascii?Q?T0/EYlpk5Or1YKubOtkb16azBziTA7Sy6HS7Q0oMI9s8N7J3cN1tSqAZaLpI?=
 =?us-ascii?Q?tN3zvpQGcSZpvyE/LPH3Q03yGpR+yy3aJnbpYYuOl9yilvW4lnCLJ9iTkWq1?=
 =?us-ascii?Q?0Glg3H8PkcIvbC4LXT03J2znbcmOUONTN1l/bZeVSu4g2hE8laQGEVk7HljT?=
 =?us-ascii?Q?1VSdY00e2zenYYUPcY+koIzFeAmFdnSNpgJkq0KQBExpC4YgGoixHDQXngYd?=
 =?us-ascii?Q?lfARLrNED5kkPO46UB5Qo755E/aEqKp69gFzCHv4EUO3lUps/8tSePI2P03+?=
 =?us-ascii?Q?jgTEsqqJpx+nkuVHuPg9nazWZ0ZtCjiplS5s01yglSuABxPDw8MFbBTbikxK?=
 =?us-ascii?Q?t5RZLKeNryKM/cvCCHL+mrJkT+sN1Gkx+F6RygKFkmkzQGhD5p5nS5Qrd2H5?=
 =?us-ascii?Q?/nfNjEqC1OuiCNw5Hj7mozvcnKfjr8gv5Z7tn88suwEIRyS4lRKTfJx/Q9Nn?=
 =?us-ascii?Q?iJIGo9OfY/Gpaqhw6X3tjw4im03nlRRT6V05m6ZjLP7OFsrh/v8ObGYGIMnd?=
 =?us-ascii?Q?cPJFAHr6MebGefw1L6n55caLXscyihiD1RRsqoSTB5G1iIiTV0PgYu4AM8MU?=
 =?us-ascii?Q?GQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca5f2cc3-ad59-4bc8-68a2-08dda9977cde
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 09:57:05.8758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGLy0nvv/VlGQeY+P+vZLwK/NcDwPZKceItnGx5N8MzaUIl0sVjAjhAshkuC5MKKixrUtInpT1fLLIruvhrFqX7clYtvSbpW94U9Qlj/ZgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF2B89F77E0
X-Authority-Analysis: v=2.4 cv=f+xIBPyM c=1 sm=1 tr=0 ts=684aa475 cx=c_pps a=Q/Wut8DCZm/BU1iMwo/3iA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=fuEzAIyizCd5F9mZEqQA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA3NiBTYWx0ZWRfX4YJ+mIcnXt2l htNlAU3B2DZ609A+xP7x+WlRjsEhb46yh4VekppH9hC/VTwg8qLAFvtAe4PRQIlBn5pA+10GLf/ nYjTAtEdXOAXStu5KPBmudFE/pErHcjOHjWr6NHQcrP2coqC+BxJOyvVKqzk11GhDsdvr0nFJ4k
 yRmqlgJhymim/e2Ic1KKWrtDJUNS2LDb8F07vThJ18hvZpIfAv3WJLoeYEC+tI60bTyX9OPp7u+ ITBnhkcjeOHGJG+XYzSNIoMGx5B13s9+SfwimL34xFnrF7hYn3rW58c6F+oMoe4dATtaBBA1SrF 4UHh2EE52zQv4+eeVgUvp9CZ7Wa+HqqJuy+dDSGHePCbrc/BepSquJSxtigEi6gRY3H3pBubeqp
 YBkKWUcpuWq69eezHy8HZEImVCzwdgLud/9fMxbIue7BBTLSymLoOw1iJLSG2sstnvrZ+CFd
X-Proofpoint-ORIG-GUID: Xgz8kp9iS28nvIH71JeiZT6iPlVnIbkr
X-Proofpoint-GUID: Xgz8kp9iS28nvIH71JeiZT6iPlVnIbkr
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
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218492

From: Sunil Dora <sunilkumar.dora@windriver.com>

V2 changes:
- Split the previous single large patch into 9 individual patches, 
  each corresponding to an upstream commit, for easier review as requested.

PR: https://sourceware.org/bugzilla/show_bug.cgi?id=25847

A race condition in pthread_cond_wait that could cause lost wake-ups
under high thread contention. The issue particularly affects
applications with many threads waiting on condition variables.

[Root Cause Analysis]
 The lost wakeup occurs when all of these happen simultaneously:
 1. A waiter thread gets preempted between signal decrement and group check
 2. Multiple group rotations occur during preemption
 3. Signal accounting becomes corrupted
 4. Final signals are delivered to empty groups

[Impact]
 Applications using pthread condition variables could experience hangs due to lost wake-ups.
 This particularly affects high-contention scenarios with many threads.

[Fix Details]
 The fix prevents signal stealing by:
     Broadening scope of g_refs to cover entire wait operation
     Removing the complex signal stealing handling code
     Properly maintaining signal accounting invariants

Upstream Status: Fixed in glibc 2.41 and master:
 [https://sourceware.org/bugzilla/show_bug.cgi?id=25847#c72]

According to https://sourceware.org/bugzilla/show_bug.cgi?id=25847#c74, 
commit c36fc50781995e6758cae2b6927839d0157f213c is unsuitable for backporting to older branches 
and has therefore been excluded.

[Testing]
 Verified on x86_64 with:
 - Custom reproduction test case
 - Stress testing with high thread counts

Reproduction Steps:
 1. Build glibc(2.35) with injected delay (usleep(10)) in __pthread_cond_wait_common
     Just before : uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
     File: { nptl/pthread_cond_wait.c }
     (Note: The injected delay is for testing purposes only to reliably reproduce the race condition)
 2. Compile test program with custom glibc:
     [https://sourceware.org/bugzilla/attachment.cgi?id=14360]
     gcc -g -o pthread_cond_bug pthread_cond_bug.c \
     -Wl,-dynamic-linker=<CUSTOM_GLIBC>/lib/ld-linux-x86-64.so.2 \
     -Wl,-rpath=<CUSTOM_GLIBC>/lib -L<CUSTOM_GLIBC>/lib \
     -I<CUSTOM_GLIBC>/include -lpthread
 3. Run with CPU pinning: taskset -c 0 ./pthread_cond_bug

[Behavior]
 Without the fix:
 - Process hangs for 300 seconds
 - Eventually crashes with core dump
 - Verifiable via gdb

With the fix:
 - Process runs smoothly even with forced delay

Sunil Dora (8):
  pthreads NPTL: lost wakeup fix 2
  nptl: Update comments and indentation for new condvar implementation
  nptl: Remove unnecessary catch-all-wake in condvar group switch
  nptl: Remove unnecessary quadruple check in pthread_cond_wait
  nptl: Use a single loop in pthread_cond_wait instaed of a nested loop
  nptl: Fix indentation
  nptl: rename __condvar_quiesce_and_switch_g1
  nptl: Use all of g1_start and g_signals

 .../glibc/glibc/0026-PR25847-1.patch          | 453 ++++++++++++++++++
 .../glibc/glibc/0026-PR25847-2.patch          | 143 ++++++
 .../glibc/glibc/0026-PR25847-3.patch          |  77 +++
 .../glibc/glibc/0026-PR25847-4.patch          | 116 +++++
 .../glibc/glibc/0026-PR25847-5.patch          | 103 ++++
 .../glibc/glibc/0026-PR25847-6.patch          | 171 +++++++
 .../glibc/glibc/0026-PR25847-7.patch          | 159 ++++++
 .../glibc/glibc/0026-PR25847-8.patch          | 191 ++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   8 +
 9 files changed, 1421 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-1.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-2.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-3.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-4.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-5.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-6.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-7.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-8.patch

-- 
2.49.0


