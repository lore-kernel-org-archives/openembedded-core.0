Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E96C677C4
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 11:34:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5511.1749641658803729845
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 04:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8257d95e65=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B76092016333
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 11:34:17 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474cd947k6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 11:34:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBares38wwLiMRHhmuRMu7yZZMTU/3r6K8BYXm782k8w7MBe1kaaUGL6pQ9X56Z+7luetJUcpL8EffSxk011FiL20GvKOPf+1d3DG5ZKCDjoAMp0xwqJtkv0/bqt9Bw+oSrxZI1nMPKdmxM+eFVUkPp1jDejZzFdh+T5leTRgdi9E2eDbTvo+yhJ8dU1kRRkXZL+rTfoEcauzoZSK5pL6RoY1T/p7pGNiffZiGEXYo++AO6CNZatq9rtt1ru9sbGxEJLDYDIq70Y+On2pZ/umA25bSpU0tC0Iho8w5QyZzrj6NLpPs4QqGMac1qvPs075R+azjgOdXvpaKQsRf6lEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alYbNRws45uooU9saQTtufkPIwphLyG0Z9l+dIpdB/4=;
 b=N9Jn2UEp3ATdbp5DYivWHoNiUINlpx0BnXVB4CUYTlsM1vaPtEr2HAvW4RTLLDYvrmpd/NL1PijyKAWzizu2DwfD5uE1wHCW6a1PGb0a5STsz2pfvXth4CLCoIWqt0Ctd0JgDUNFelNCVF9KRIYfLRAoMs2uKB0lhGXW9CsgCbhjRdOa2XIi4q9jTnagqpa55wlZy3zgbMNR5AP5js5s73xjx020UrBNZdaIXqoADcGA0/5ntNCPN9uoAoJ0xi5hlgAkwnpKnpLvTLH66UayLVADAFJH8yOV9mWrCY676mvP03QPkAfVb6tCBwMHsgAsiVJ9UWSei/OxmRFkCgemQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DM6PR11MB4641.namprd11.prod.outlook.com (2603:10b6:5:2a9::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.20; Wed, 11 Jun 2025 11:34:14 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 11:34:14 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: sunilkumar.dora@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2] Glibc: Fix for CVE-2025-4802
Date: Wed, 11 Jun 2025 04:34:00 -0700
Message-ID: <20250611113400.2146584-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0384.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::29) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DM6PR11MB4641:EE_
X-MS-Office365-Filtering-Correlation-Id: a1a2c876-3d02-43fa-7547-08dda8dbe4c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?COGy5iHQxDNizjeukLR02jokR2oMYoxAEM/9XuNjQL37neRPUel7iM8zdtnf?=
 =?us-ascii?Q?1ehEtnxdHPUQJsskUdQw7ucXnQlVONHta7lC3NII1gPd0tZ8LPIT5V+ICNrP?=
 =?us-ascii?Q?9AKFLe7IWXp+q0mV7PHp8Wva3w8mADIHwDzPN1l5OpZvcRNqBd438GBeRSHs?=
 =?us-ascii?Q?G/jgYjKR6CA6xd5ZKNaGkE3R82/S33OBPHOMxbFjqbIpBNyCs7szua7tgTOK?=
 =?us-ascii?Q?L95P3/txYWkk3d5uAEsaWr1zc7irTLfeH17G0LTa9OwTCQIPX0x5JJ8PD+Bm?=
 =?us-ascii?Q?hxHELaWPRW78tNJs2wMV6VFgBByusmJSGKUqkuyY5l1T17/nv/iig0fpfSr6?=
 =?us-ascii?Q?K8eC7kxTL5HWdO47sDRXdDyI/F8y2ykAHu1h1EI9w9V4fL3QJlMO2epThNZH?=
 =?us-ascii?Q?/Yg0THdvV56rT/SRh9JWRlqhV0RWqPCD7z88FBUQzCuAAsJbWnYScF9zVaEf?=
 =?us-ascii?Q?Y0uG3+0/zu54ZVvHCIRmEgtfiI31EOCN0zOK0jrUPJxzuySjTvy+og5GSvzx?=
 =?us-ascii?Q?hfAr1REckDszlLi+sh/G/GcK52Ntw/qDmoHnviwUAV22UKKLX7opBIhVojuM?=
 =?us-ascii?Q?Wgd37eMSW2y+qFj9ZdtwrRtUdn9oWBT10F/OK9JBCHAq5o/Uqb1tMJWv/kIA?=
 =?us-ascii?Q?WAqytIJkvRXE4Zzn++Wd/FPum0rw4gbXAvoHAeJ5037YBP7Wjbkyohxzrily?=
 =?us-ascii?Q?kiuvo1k9hyZYjTybiOcG1IKCVDs4vC9VA3KsBoWWveFM844KpkE/diwraIFH?=
 =?us-ascii?Q?rALjPQpN22hZkUXyHT8UnrArT4f6jhn40uP01VGW+0Y+S5O4ErQpJl2l9aag?=
 =?us-ascii?Q?yoOP/uOJDrSd5DWFDjd1IKHdWfml7fPYbdFN0V/cfh+Tg3FH4anzjYK+w5t/?=
 =?us-ascii?Q?pRK+Kgkqno79bYCU97xgHVuLuVTHRLMI5NIqsclzy8jy8es0KaXehcIC34SX?=
 =?us-ascii?Q?LQZOnamvZLZ+nH4jlgZivR0Hf6U2ScbadSiP3iDFppBi2eHxcBj89IwwMWsh?=
 =?us-ascii?Q?QwYekFTMHqauZ3mrcV4nMpcWyfrR0rihEGyUIn6Y9IEqPztiFj36IJ3YHVKt?=
 =?us-ascii?Q?vxih6ZWSiW5QTkDxRksHI9PxAnYjNiXx6UsFqTTG2FFXeuPAo7rSIo5tvE9B?=
 =?us-ascii?Q?O7f4RLP9uBwKOQkVFGuajnh0s4XH6AZfGO1OLOLd0hxgTjo5ee/LOi0XdR7A?=
 =?us-ascii?Q?Atrx7sOBMyouCvugSr1a3LMg5Z93f3aD/D3wMUE9zeHgO/XULVhTBPZQfsZW?=
 =?us-ascii?Q?rd+PSEsUfvnlXa8nLp4jg/LYmMR37cgmZqem7fqMSV6zYSWa9MEzr5vjCi/O?=
 =?us-ascii?Q?iTzzICOCMAyJ5kTAqzZPCxhslacKg18WfCJitklcZa+jkl7QbhOMVvENjKq7?=
 =?us-ascii?Q?KBYtZJ6shato1QLFci++ccGohY48hVCxZBS0ip+t9zMx6lMxW2qRXK1LZmvM?=
 =?us-ascii?Q?gIDTXeNsIFX68Jp6igF01KDpkOpukaSJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IvtygeL8eJI+fcincYtx3D6PPdlkXnwhf8Pq+yw4Rbig0afjTwHV3S2/IgFF?=
 =?us-ascii?Q?OEW30ipFc4G64+ZbFRvoyq6rkdALwQlq1Vg1IoXBK2YAFdLtA8dfs/Bfr8tm?=
 =?us-ascii?Q?aYtikX2e3jQdSlFSqQkWKqlujrXHgvnGvT623oIN2rJaaN+eSLaJk4U8eoLm?=
 =?us-ascii?Q?m7XVtDgjECmPcXfbAkWHTJwMnesqFtWBsve9CfHc6HtLJuQVQnsg6Sc/2ZM6?=
 =?us-ascii?Q?0lOYLuJuTX68LtzT8y6adsnbGh+75Yle9ILcEbEYT7iXj8xq4jpdEwoM51ut?=
 =?us-ascii?Q?qYQAsawzLSJ0WI2px1vXH0ydF1l42AUFFK7IdH39G16W3gPH3uMgpDIKA8vO?=
 =?us-ascii?Q?DrYiR944++NPq6Mx4w9CPn2zeUk5ofh52TOuZ8Mediz0f6UK6Yv02tkFNlWU?=
 =?us-ascii?Q?rH/nlVxSqqgY+A8kDkgI/lxPT/FMmxbjlzMLiYqyaIStq/HRUSwT/Fo9wxjn?=
 =?us-ascii?Q?zdDkmsseFUPOd7wH6QD5XVnHd2CvewBgOSuYSrFeB+KxoPyUNmEsJqewVg4E?=
 =?us-ascii?Q?4dRK19trtJG0rBidvZG6x5RiUVg4bmcV/ETjn3JWsbw8cgffBPhZoGh6ID0X?=
 =?us-ascii?Q?RfIUFJzkzy21rpQsGFh4/4P2HN3gJwq6+9KGXN0TuzgZrNNDAKN+6gW3fVck?=
 =?us-ascii?Q?kOp7OQi1QjUoN31p3QNHPzVRq+DA2OmuIIfsA38yvSmDEfHYdBHJ3yo4kyx9?=
 =?us-ascii?Q?+ZClctBYFwWfQxmSy+IMchW1ILI9ENjeBAV3cdqDOnVFQqZidLw2pawuVSvU?=
 =?us-ascii?Q?qbzfhW8Iz+uTs3llaqvIQyey5h+qEP5CQapsLTQHmIMWXcwmYILDVmogh1J0?=
 =?us-ascii?Q?Q9It1eSiT6LFcmWYJHB+ZTreYMS9SAUxz3ikdkL09GInlH8EwXFyR0Dvpa2f?=
 =?us-ascii?Q?/ZUAOUHqusix9tPCzpYvkA0e1X0y4Pg6tA0YGzaC5YL8Vd8pxVNxawbYI/56?=
 =?us-ascii?Q?hRrfTldkiKALIBgFL/57hsD4mHiYJAZjzAThmGUKXq4aORkBZYHSYU2iPLYj?=
 =?us-ascii?Q?hlzw2CA0qJUpLwuPqTL9WyK0ceyBXX6ksvLhbvIHsUu6eE18R3zDE/iqvbh/?=
 =?us-ascii?Q?BgilzniNCembYNuqvtkzQ+TrBB/0kP4g4xuvTRcgLXkFJO7J9REhtE/kDhvV?=
 =?us-ascii?Q?wYo+4Bd3QzD+LmqzgcjOFrN/CoRb7bNItFowlpUyDNjD4VVI4d4C65KYLTn4?=
 =?us-ascii?Q?1RTRSpU4rT4U6wBoIw5jrFPL8kI4YT9eEF8D1+sGiQ+vgptgFXprUy/65wZO?=
 =?us-ascii?Q?LDwPxarSHlseCmIANbUu89JKHt/I1KgINEXr4446axJzX85kjtGBJIBmOPIC?=
 =?us-ascii?Q?vu/N8Yd+RTLbhRH9SWLdaAtRp13VwDuT5+MKJYWHazxoqpisD85Ffop1W/Bm?=
 =?us-ascii?Q?ET+rc7AIA0m4AfCvik04LrSfr7scfeeci+9wdVSrqA46r2b8CiPM7j2ToTyP?=
 =?us-ascii?Q?ypQkMWIxgrIJpl7T3PxxciBSMBKJGGbVkx81M5cXVI4UNkQMh6DHxyodommf?=
 =?us-ascii?Q?nWOttbBv4S7DPWxUV4Opxn6QTs1cE+6UENhkoZmXy94SNvOBvw2lhh8Koijs?=
 =?us-ascii?Q?tAGussjj6OZTqD1qUkldSHKjdE1YuvshAVJ5zvbdzBDjOhjvjwEt6WD57xmk?=
 =?us-ascii?Q?3Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a2c876-3d02-43fa-7547-08dda8dbe4c4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 11:34:14.7462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYKR2h8tkMY8AbXm4mnMI02/Z1+DMr9DGOtxw9Eeg9hBwPKRHw4VNYIzDkTRDeNmVS1e2NoewYNHK7UGW1bocKlEIwdNHKRqHjJEoEobROE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4641
X-Authority-Analysis: v=2.4 cv=f+xIBPyM c=1 sm=1 tr=0 ts=684969b9 cx=c_pps a=ERaBaXEorJduIVC9VRC5mA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=KKAkSRfTAAAA:8 a=20KFwNOVAAAA:8 a=YV6vfrAavRWOqJXlchkA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA5OCBTYWx0ZWRfXwcnyKtQwdjIk F2zYU1rHte9ps3uAy1rJJDvxWttpwKIl8c0tMHjWf4q6T/yey1d6juPl4wHzulPetzOIRyCb1nk HtmA3Y8v+kKjAVGieBcCfbcGH0nQYCxjkPVHcq39uLXkTA2zVWq73zAINSWGtwe6AFuP7a1RjvM
 YqwzGDyeEH3LTRcB44FnGIXzN+EeC2ZvAy90BNrX31CwqQN9lZSH+PDpMm8qlZzP0fihcfaQk8k OABUnQsvUhzbEDs4XdAqlwBq4JzNMM3eRwjOa5ihNHeMgYB1g1hZDoIWTvWGMLVbdOl44p7tvGv geQBkKC6t+VvK457jP40dsv9orc+vyotiU76ZY5VSvTVCuQx1A6Cf3FeOf5aytDDXv0cssUoD5k
 Cf/TDikk0JqoHZFYJr0rg9/0Q67IniiTmWCR0jnbUYHTOXALU5k4FiuIxrRIsUYttJxkXvVB
X-Proofpoint-ORIG-GUID: Vzo0Hx2nfauaPD-GahOG4fm2e2N7adhA
X-Proofpoint-GUID: Vzo0Hx2nfauaPD-GahOG4fm2e2N7adhA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506110098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 11:34:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218449

From: Sunil Dora <sunilkumar.dora@windriver.com>

elf: Ignore LD_LIBRARY_PATH and debug env var for setuid for static
[https://sourceware.org/bugzilla/show_bug.cgi?id=32976]

Upstream-Status: Backport [ https://sourceware.org/cgit/glibc/commit/?id=5451fa962cd0a90a0e2ec1d8910a559ace02bba0 &&
                            https://sourceware.org/cgit/glibc/commit/?id=d8f7a79335b0d861c12c42aec94c04cd5bb181e2 ]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
V2 - Resolved patchtest error for "CVE:" in commit message.

 .../glibc/glibc/0025-CVE-2025-4802.patch      | 249 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 250 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch

diff --git a/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch b/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch
new file mode 100644
index 0000000000..0298f5a865
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch
@@ -0,0 +1,249 @@
+From 32917e7ee972e7a01127a04454f12ef31dc312ed Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Date: Wed, 11 Jun 2025 03:19:10 -0700
+Subject: [PATCH] elf: Ignore LD_LIBRARY_PATH and debug env var for setuid for
+ static
+
+It mimics the ld.so behavior.
+Checked on x86_64-linux-gnu.
+
+[New Test Case]
+elf: Test case for bug 32976
+[https://sourceware.org/bugzilla/show_bug.cgi?id=32976]
+
+Check that LD_LIBRARY_PATH is ignored for AT_SECURE statically
+linked binaries, using support_capture_subprogram_self_sgid.
+
+Upstream-Status: Backport [https://sourceware.org/cgit/glibc/commit/?id=5451fa962cd0a90a0e2ec1d8910a559ace02bba0 &&
+                            https://sourceware.org/cgit/glibc/commit/?id=d8f7a79335b0d861c12c42aec94c04cd5bb181e2]
+
+CVE: CVE-2025-4802
+
+Co-authored-by: Florian Weimer <fweimer@redhat.com>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ elf/Makefile              |   4 ++
+ elf/dl-support.c          |  46 ++++++++---------
+ elf/tst-dlopen-sgid-mod.c |   1 +
+ elf/tst-dlopen-sgid.c     | 104 ++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 132 insertions(+), 23 deletions(-)
+ create mode 100644 elf/tst-dlopen-sgid-mod.c
+ create mode 100644 elf/tst-dlopen-sgid.c
+
+diff --git a/elf/Makefile b/elf/Makefile
+index 61c41ea6..3ad66ab6 100644
+--- a/elf/Makefile
++++ b/elf/Makefile
+@@ -274,6 +274,7 @@ tests-static-normal := \
+   tst-array1-static \
+   tst-array5-static \
+   tst-dl-iter-static \
++  tst-dlopen-sgid \
+   tst-dst-static \
+   tst-env-setuid \
+   tst-env-setuid-tunables \
+@@ -807,6 +808,7 @@ modules-names = \
+   tst-dlmopen-gethostbyname-mod \
+   tst-dlmopen-twice-mod1 \
+   tst-dlmopen-twice-mod2 \
++  tst-dlopen-sgid-mod \
+   tst-dlopenfaillinkmod \
+   tst-dlopenfailmod1 \
+   tst-dlopenfailmod2 \
+@@ -2913,3 +2915,5 @@ $(objpfx)tst-recursive-tls.out: \
+     0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)
+ $(objpfx)tst-recursive-tlsmod%.os: tst-recursive-tlsmodN.c
+ 	$(compile-command.c) -DVAR=thread_$* -DFUNC=get_threadvar_$*
++
++$(objpfx)tst-dlopen-sgid.out: $(objpfx)tst-dlopen-sgid-mod.so
+diff --git a/elf/dl-support.c b/elf/dl-support.c
+index 09079c12..c2baed69 100644
+--- a/elf/dl-support.c
++++ b/elf/dl-support.c
+@@ -272,8 +272,6 @@ _dl_non_dynamic_init (void)
+   _dl_main_map.l_phdr = GL(dl_phdr);
+   _dl_main_map.l_phnum = GL(dl_phnum);
+ 
+-  _dl_verbose = *(getenv ("LD_WARN") ?: "") == '\0' ? 0 : 1;
+-
+   /* Set up the data structures for the system-supplied DSO early,
+      so they can influence _dl_init_paths.  */
+   setup_vdso (NULL, NULL);
+@@ -281,27 +279,6 @@ _dl_non_dynamic_init (void)
+   /* With vDSO setup we can initialize the function pointers.  */
+   setup_vdso_pointers ();
+ 
+-  /* Initialize the data structures for the search paths for shared
+-     objects.  */
+-  _dl_init_paths (getenv ("LD_LIBRARY_PATH"), "LD_LIBRARY_PATH",
+-		  /* No glibc-hwcaps selection support in statically
+-		     linked binaries.  */
+-		  NULL, NULL);
+-
+-  /* Remember the last search directory added at startup.  */
+-  _dl_init_all_dirs = GL(dl_all_dirs);
+-
+-  _dl_lazy = *(getenv ("LD_BIND_NOW") ?: "") == '\0';
+-
+-  _dl_bind_not = *(getenv ("LD_BIND_NOT") ?: "") != '\0';
+-
+-  _dl_dynamic_weak = *(getenv ("LD_DYNAMIC_WEAK") ?: "") == '\0';
+-
+-  _dl_profile_output = getenv ("LD_PROFILE_OUTPUT");
+-  if (_dl_profile_output == NULL || _dl_profile_output[0] == '\0')
+-    _dl_profile_output
+-      = &"/var/tmp\0/var/profile"[__libc_enable_secure ? 9 : 0];
+-
+   if (__libc_enable_secure)
+     {
+       static const char unsecure_envvars[] =
+@@ -324,6 +301,29 @@ _dl_non_dynamic_init (void)
+ #endif
+     }
+ 
++  _dl_verbose = *(getenv ("LD_WARN") ?: "") == '\0' ? 0 : 1;
++
++  /* Initialize the data structures for the search paths for shared
++     objects.  */
++  _dl_init_paths (getenv ("LD_LIBRARY_PATH"), "LD_LIBRARY_PATH",
++		  /* No glibc-hwcaps selection support in statically
++		     linked binaries.  */
++		  NULL, NULL);
++
++  /* Remember the last search directory added at startup.  */
++  _dl_init_all_dirs = GL(dl_all_dirs);
++
++  _dl_lazy = *(getenv ("LD_BIND_NOW") ?: "") == '\0';
++
++  _dl_bind_not = *(getenv ("LD_BIND_NOT") ?: "") != '\0';
++
++  _dl_dynamic_weak = *(getenv ("LD_DYNAMIC_WEAK") ?: "") == '\0';
++
++  _dl_profile_output = getenv ("LD_PROFILE_OUTPUT");
++  if (_dl_profile_output == NULL || _dl_profile_output[0] == '\0')
++    _dl_profile_output
++      = &"/var/tmp\0/var/profile"[__libc_enable_secure ? 9 : 0];
++
+ #ifdef DL_PLATFORM_INIT
+   DL_PLATFORM_INIT;
+ #endif
+diff --git a/elf/tst-dlopen-sgid-mod.c b/elf/tst-dlopen-sgid-mod.c
+new file mode 100644
+index 00000000..5eb79eef
+--- /dev/null
++++ b/elf/tst-dlopen-sgid-mod.c
+@@ -0,0 +1 @@
++/* Opening this object should not succeed.  */
+diff --git a/elf/tst-dlopen-sgid.c b/elf/tst-dlopen-sgid.c
+new file mode 100644
+index 00000000..47829a40
+--- /dev/null
++++ b/elf/tst-dlopen-sgid.c
+@@ -0,0 +1,104 @@
++/* Test case for ignored LD_LIBRARY_PATH in static startug (bug 32976).
++   Copyright (C) 2025 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include <dlfcn.h>
++#include <gnu/lib-names.h>
++#include <stddef.h>
++#include <stdint.h>
++#include <stdlib.h>
++#include <string.h>
++#include <support/capture_subprocess.h>
++#include <support/check.h>
++#include <support/support.h>
++#include <support/temp_file.h>
++#include <unistd.h>
++
++/* This is the name of our test object.  Use a custom module for
++   testing, so that this object does not get picked up from the system
++   path.  */
++static const char dso_name[] = "tst-dlopen-sgid-mod.so";
++
++/* Used to mark the recursive invocation.  */
++static const char magic_argument[] = "run-actual-test";
++
++static int
++do_test (void)
++{
++/* Pathname of the directory that receives the shared objects this
++   test attempts to load.  */
++  char *libdir = support_create_temp_directory ("tst-dlopen-sgid-");
++
++  /* This is supposed to be ignored and stripped.  */
++  TEST_COMPARE (setenv ("LD_LIBRARY_PATH", libdir, 1), 0);
++
++  /* Copy of libc.so.6.  */
++  {
++    char *from = xasprintf ("%s/%s", support_objdir_root, LIBC_SO);
++    char *to = xasprintf ("%s/%s", libdir, LIBC_SO);
++    add_temp_file (to);
++    support_copy_file (from, to);
++    free (to);
++    free (from);
++  }
++
++  /* Copy of the test object.   */
++  {
++    char *from = xasprintf ("%s/elf/%s", support_objdir_root, dso_name);
++    char *to = xasprintf ("%s/%s", libdir, dso_name);
++    add_temp_file (to);
++    support_copy_file (from, to);
++    free (to);
++    free (from);
++  }
++
++  TEST_COMPARE (support_capture_subprogram_self_sgid (magic_argument), 0);
++
++  free (libdir);
++
++  return 0;
++}
++
++static void
++alternative_main (int argc, char **argv)
++{
++  if (argc == 2 && strcmp (argv[1], magic_argument) == 0)
++    {
++      if (getgid () == getegid ())
++        /* This can happen if the file system is mounted nosuid.  */
++        FAIL_UNSUPPORTED ("SGID failed: GID and EGID match (%jd)\n",
++                          (intmax_t) getgid ());
++
++      /* Should be removed due to SGID.  */
++      TEST_COMPARE_STRING (getenv ("LD_LIBRARY_PATH"), NULL);
++
++      TEST_VERIFY (dlopen (dso_name, RTLD_NOW) == NULL);
++      {
++        const char *message = dlerror ();
++        TEST_COMPARE_STRING (message,
++                             "tst-dlopen-sgid-mod.so:"
++                             " cannot open shared object file:"
++                             " No such file or directory");
++      }
++
++      support_record_failure_barrier ();
++      exit (EXIT_SUCCESS);
++    }
++}
++
++#define PREPARE alternative_main
++#include <support/test-driver.c>
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 9073e04537..1ea4d5a252 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -61,6 +61,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
            file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
+           file://0025-CVE-2025-4802.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


