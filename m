Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B0AE6FE25
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 13:10:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.21200.1695388195115608043
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 06:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Wg12HmcK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7629193b84=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38MAB2Aj030796
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 13:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=DERLm0tji920Sft8Vb
	vr5m+3a1RrunaLQ4PfhMHflXI=; b=Wg12HmcKbwb73GjJuRGx0+6ZkPFj2K7vjM
	1pe3n+og8YLNC6jGLRA/d7QmZONI+STRlkLk2niSpy/COdTLuCEpX8vRyTfrge2O
	dWCGBPJjbMWrbFRjr5jsr3dF7CKs4O7jXtOcF/ati6JmCuLpQQ5cJNZ0u6G2HPCX
	cwql7qD/NFzSI8UzVHPF25aR+Ito+zofHkMc3/q5UfUaATN+ascVNG+cG56Tryt+
	apgBTs9Dk8ii01iiFv4wwvFXTU/ytOmIBAwyUu6B6KMWWA163cxtII9WcGiaN2rz
	zuEPb9umIae1qPVPfF5aZ9E9qg8rj2v5BKJensvWfngZbaEKjEgA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t8tvxrsej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 13:09:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dATZbieXBDMYU1SHjnGts2u9np/LQx6Cfed6rZ7pPqp07ihOreSyycDlVGEGnPyhfi+5Ye0m6N3Eh9TD4fvFDtbON49BqxgT4ogRjid3AXAg9zdA79mfObtthNp46rV5K1OLx4pk9LsRqQJpEt83cqLKhE6NlTZkptpS6AKKBiDq15kLhFTLGwMmn6jwSkykT6GHjIMX32D2HJqAgyQicQwPuTN+U5HqpLH3nxLuJtgRdi3GEzGJZfhAs75UPvD8jQgdnXnWh+oAYkFGHr69SYmhrGep0aWAae5qixVJVLHUCcEz8h0AT/8iwAiPp9Rv9xQWflaFaSDV4LL74ta+SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DERLm0tji920Sft8Vbvr5m+3a1RrunaLQ4PfhMHflXI=;
 b=BbMjS8/Ul2rhQI16UekD9WtpxsU5KaoP9zNVmyBwqrtf7EGQYGVcvnwBqGIU8w+W+SMaJKz9ka5HwHgrZIY0/tBvRphrg1GL4xHi3yGfm7FpSZWtUIiSNBRx8/FFc6AMJIIZL/wqr1X7+DPqJUAueB+0CYMAaLujekuVE0tktXNIWqiW0uRS3jFDLJhamPsF0CflKzDwmG3YFiZ8VfrwIXLKp8QsqpgSeOV9pa8ZRHauT+BuIFrOlOPuTrQ3Tn23PK7T/6CBFlHmgBIybISJdkAxnrsp8/g6s4P+DtNPf5/taSGoMF5+hUOWuPZ6TPiuQSirOxQCRhniOxsQlSJDEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.34; Fri, 22 Sep
 2023 13:09:52 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 13:09:52 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [mickledore][PATCH] glibc: fix CVE-2023-4527
Date: Fri, 22 Sep 2023 06:09:40 -0700
Message-Id: <20230922130940.4142845-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0066.namprd05.prod.outlook.com
 (2603:10b6:a03:332::11) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DS0PR11MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: 34051b07-931a-46eb-1e76-08dbbb6d3508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IRIFslGEIflDuUQlol71M5gnuW7AWYyGKGAABWx3/UmwnZjawPHR8/QrFBNIydBthlOD1qShgZI5bb3fH1WfYeBc03D/YdkFiiaztKO9JCaAJ0CLAuSrvz58q7mf5YYDKjE4SSDnTw47845xv4taoEf+QmTrjWaXzLJKagmhnkfDX4o2hVL61uPfV++4i55LWA8LXgAeIe02qlreD57WIk9cOU2xvCMfEP3vVxf3Rgsez1sOUuELsOChm1/g7UdVUyDKW2sIbq1pUxVLAvl7558WtS93NIGKUhGmpnASqeRDc7BPCspcGTe+0k+bMf/EDSaaNUgJ9gwHEHdppokeWwmHNqeq6ojwMweEjkpujpAE2bnTFG4LvZj5EScg6n4DCujmi24WD8fg6AruE2wHfQJu1HB3mXq5Yh4AYmQMTwEeemziZdpXUCZILY7UaXHtWqI5FrAJIm3b0VkffytaCbB4w2VF7xvM1ksH+XeSMHi6vCgt0rl2bn3MbNqFkeAMu/GBwz0tDyTO7CJVmqFdw9R3fx68WF3IqD+cvy/fAMqi/x+eL4Cbm+MpmICifXT0bb8CNnQWtk9WxKKpcatlkaM9Cb6fgR2dxnpQJ4J78Pki5sToaaCx5e9Urfc9jSm5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39850400004)(1800799009)(451199024)(186009)(2906002)(5660300002)(26005)(41300700001)(66476007)(316002)(6916009)(66556008)(66946007)(4326008)(8676002)(8936002)(478600001)(6666004)(6486002)(6506007)(6512007)(9686003)(52116002)(2616005)(36756003)(1076003)(107886003)(38100700002)(38350700002)(86362001)(83380400001)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Czyab+eV+IqWyRykHPYmBp+L4XCOCK4fdnWlfPpSwpnH+7NRmtgAWhA3cWeY?=
 =?us-ascii?Q?PcBrVQU19la8BHbEfd8HgUYXR8r7K4sIoGcmDtjWR29Tt+vKyqDMjVUIIE15?=
 =?us-ascii?Q?bLXZuRLF8B8XFgL26gSaGjsLHsyDNCvIOlpM0Oq01pLLHftO0tn1BhxQTgGe?=
 =?us-ascii?Q?OHeTIR+rcNWwMTIR6i/OUc4TxUUNcJ6snSvFY14rMrER3nuiWMMjfAsWD+Ox?=
 =?us-ascii?Q?WMEUE2FgXllJPyyGGwh8ONeXfnp7pFRR3nkFx2xSIEBcG+vZwuob5K7lpv3x?=
 =?us-ascii?Q?OGBf4I45GqSFW/CmIRmnvCc3rmYdS1Cazy3p3VKYGm6zn/TkbgZOV8YtU4CL?=
 =?us-ascii?Q?4sAMu/56xKPX+PGssQo+jCoU/fsSxVbSExAVbUiWT7ANhQDYLxk1GnRsDvUs?=
 =?us-ascii?Q?QeEGjHaD4PAyOyyUC8zcioewR/DIEmumsuKYZq1trP32MIcr71aoAJe1orMf?=
 =?us-ascii?Q?kXXMXAysYjd52SoHK2Ps6YqENVh3UL34LtSVk+NWizOuG7r/57PRlYuZB7JY?=
 =?us-ascii?Q?XdmuQUwlaWzp3G+XmsiFd0uk9UReQrOWfU95sPryVkJUU7dktujSPQpUw2WO?=
 =?us-ascii?Q?4QOsj+4nWx24nJ1l6T92bs3/tTVYzgLppiAlBJ+m8VkdNQLHdWpdcS09UCfx?=
 =?us-ascii?Q?sNiremeQK7996NP8fMaOYae3OzVcBof4MbpuKpcHesp95Q+I7gAdoRg983gm?=
 =?us-ascii?Q?chmUp3Fhv2cpNXMWGGe5ZxPnZGkmf6eiBPdIY566o0RiuGGP+f2LMzsDfX1u?=
 =?us-ascii?Q?B5THZekcnEcK3d8DAZEnE3HLpKOED0Gg+zQY6awJ7o42ahBfvaKkNJoBLrq8?=
 =?us-ascii?Q?PTLG0PIH8mJOtaS+Co5MpWKkTr6+qtkqcB80OGlUDdWX/vvNB+wkopUnGOA6?=
 =?us-ascii?Q?RXNKGuFPicA1/EzQRp4J3udTFbWBfK4K2iysiLw/BWzMxcOMs8Q1ZaLf21dc?=
 =?us-ascii?Q?Vm/CyKcRNOt9v5rEVkegDUQvmPkrMU8H5nC9G+vnDj5WzwBT1GYFCjTFRfVu?=
 =?us-ascii?Q?e0lfYSv3ayd02O5ZHM03jOp30lohCrCHDgECccpNDgBw5fcnJ5DUeTzdNnXM?=
 =?us-ascii?Q?9qxfPll93fWEZON6DXqIfQZXq+joE7BfxE853V2DW6Iatp691NAxb5jb6GRs?=
 =?us-ascii?Q?1gGxjjDMzFr3wHySSKWBocqtbd7ihd098SQ/t4hHpTngjXYvnFevN0SpC0a/?=
 =?us-ascii?Q?3eeRm+tYzpx3fOzqZWhmk1vf0VnvNQ1GVJHAn19U9pSY7PRDwOYluxU3b5B/?=
 =?us-ascii?Q?dHN8lqq7AbHz4QxAYr7nW3DglQQwrDHGfckFjAzQ41UCYTvx2U8p0BYxtDWh?=
 =?us-ascii?Q?MWPSgLkp6HVvV+CnGx/1yDs2m3HuYdVSta6QIShltP42Y5VQsHRwuzA8JHAk?=
 =?us-ascii?Q?A3sgixE/AmpqCaGYiw6rMZBv/dGWTaTmbxvzuJzkhh35hZ7SvBQFqEN58mvu?=
 =?us-ascii?Q?A9W9gF7VObeUz5pT4T2tJoDjeqDccBeKJs2/CI6w3dR1LJP43tTQGtuG7xm6?=
 =?us-ascii?Q?isADGi9vJnzNoIBKlObG5nhNakNwK+eTBR2HM9D9T3VGim7a9zS8kHPLtNMb?=
 =?us-ascii?Q?9ova8uqgr4KkbWGIhrcowZbvmctONfyRzF1Mm9+rHJVurjXqhsZAEoY5Ie6E?=
 =?us-ascii?Q?uw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34051b07-931a-46eb-1e76-08dbbb6d3508
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 13:09:51.9847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZyXlpqdcnl2PKVj+Oii0e+9I00HLmCEeyaxfOcUIjMFw0jowmuKrxrbXbWY0W8ytpASP0AGT8ttXYVGZkkNNnQZ5KxWq17RpkloSRqkHqls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7997
X-Proofpoint-GUID: 5YzkPbgOO3bSXrNecuN5_N8UH94hg8sV
X-Proofpoint-ORIG-GUID: 5YzkPbgOO3bSXrNecuN5_N8UH94hg8sV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_11,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309220112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 13:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188101

From: Yash Shinde <Yash.Shinde@windriver.com>

Upstream-Status: Backport[https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=4ea972b7edd7e36610e8cde18bf7a8149d7bac4f]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../glibc/glibc/0023-CVE-2023-4527.patch      | 217 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.37.bb         |   1 +
 2 files changed, 218 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0023-CVE-2023-4527.patch

diff --git a/meta/recipes-core/glibc/glibc/0023-CVE-2023-4527.patch b/meta/recipes-core/glibc/glibc/0023-CVE-2023-4527.patch
new file mode 100644
index 0000000000..3f549c9542
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0023-CVE-2023-4527.patch
@@ -0,0 +1,217 @@
+From 4ea972b7edd7e36610e8cde18bf7a8149d7bac4f Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Wed, 13 Sep 2023 14:10:56 +0200
+Subject: [PATCH] CVE-2023-4527: Stack read overflow with large TCP responses
+ in no-aaaa mode
+
+Without passing alt_dns_packet_buffer, __res_context_search can only
+store 2048 bytes (what fits into dns_packet_buffer).  However,
+the function returns the total packet size, and the subsequent
+DNS parsing code in _nss_dns_gethostbyname4_r reads beyond the end
+of the stack-allocated buffer.
+
+Fixes commit f282cdbe7f436c75864e5640a4 ("resolv: Implement no-aaaa
+stub resolver option") and bug 30842.
+
+(cherry picked from commit bd77dd7e73e3530203be1c52c8a29d08270cb25d)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=4ea972b7edd7e36610e8cde18bf7a8149d7bac4f]
+CVE: CVE-2023-4527
+
+---
+ NEWS                          |   7 ++
+ resolv/Makefile               |   2 +
+ resolv/nss_dns/dns-host.c     |   2 +-
+ resolv/tst-resolv-noaaaa-vc.c | 129 ++++++++++++++++++++++++++++++++++
+ 4 files changed, 139 insertions(+), 1 deletion(-)
+ create mode 100644 resolv/tst-resolv-noaaaa-vc.c
+
+diff --git a/NEWS b/NEWS
+--- a/NEWS
++++ b/NEWS
+@@ -25,6 +25,7 @@
+   [30101] gmon: fix memory corruption issues
+   [30125] dynamic-link: [regression, bisected] glibc-2.37 creates new
+     symlink for libraries without soname
++  [30842] Stack read overflow in getaddrinfo in no-aaaa mode (CVE-2023-4527)
+   [30151] gshadow: Matching sgetsgent, sgetsgent_r ERANGE handling
+   [30163] posix: Fix system blocks SIGCHLD erroneously
+   [30305] x86_64: Fix asm constraints in feraiseexcept
+@@ -54,6 +55,12 @@
+   heap and prints it to the target log file, potentially revealing a
+   portion of the contents of the heap.
+
++  CVE-2023-4527: If the system is configured in no-aaaa mode via
++  /etc/resolv.conf, getaddrinfo is called for the AF_UNSPEC address
++  family, and a DNS response is received over TCP that is larger than
++  2048 bytes, getaddrinfo may potentially disclose stack contents via
++  the returned address data, or crash.
++
+ The following bugs are resolved with this release:
+
+   [12154] network: Cannot resolve hosts which have wildcard aliases
+diff --git a/resolv/Makefile b/resolv/Makefile
+--- a/resolv/Makefile
++++ b/resolv/Makefile
+@@ -101,6 +101,7 @@
+   tst-resolv-invalid-cname \
+   tst-resolv-network \
+   tst-resolv-noaaaa \
++  tst-resolv-noaaaa-vc \
+   tst-resolv-nondecimal \
+   tst-resolv-res_init-multi \
+   tst-resolv-search \
+@@ -292,6 +293,7 @@
+ $(objpfx)tst-resolv-invalid-cname: $(objpfx)libresolv.so \
+   $(shared-thread-library)
+ $(objpfx)tst-resolv-noaaaa: $(objpfx)libresolv.so $(shared-thread-library)
++$(objpfx)tst-resolv-noaaaa-vc: $(objpfx)libresolv.so $(shared-thread-library)
+ $(objpfx)tst-resolv-nondecimal: $(objpfx)libresolv.so $(shared-thread-library)
+ $(objpfx)tst-resolv-qtypes: $(objpfx)libresolv.so $(shared-thread-library)
+ $(objpfx)tst-resolv-rotate: $(objpfx)libresolv.so $(shared-thread-library)
+diff --git a/resolv/nss_dns/dns-host.c b/resolv/nss_dns/dns-host.c
+--- a/resolv/nss_dns/dns-host.c
++++ b/resolv/nss_dns/dns-host.c
+@@ -427,7 +427,7 @@
+     {
+       n = __res_context_search (ctx, name, C_IN, T_A,
+				dns_packet_buffer, sizeof (dns_packet_buffer),
+-				NULL, NULL, NULL, NULL, NULL);
++				&alt_dns_packet_buffer, NULL, NULL, NULL, NULL);
+       if (n >= 0)
+	status = gaih_getanswer_noaaaa (alt_dns_packet_buffer, n,
+					&abuf, pat, errnop, herrnop, ttlp);
+diff --git a/resolv/tst-resolv-noaaaa-vc.c b/resolv/tst-resolv-noaaaa-vc.c
+new file mode 100644
+--- /dev/null
++++ b/resolv/tst-resolv-noaaaa-vc.c
+@@ -0,0 +1,129 @@
++/* Test the RES_NOAAAA resolver option with a large response.
++   Copyright (C) 2022-2023 Free Software Foundation, Inc.
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
++#include <errno.h>
++#include <netdb.h>
++#include <resolv.h>
++#include <stdbool.h>
++#include <stdlib.h>
++#include <support/check.h>
++#include <support/check_nss.h>
++#include <support/resolv_test.h>
++#include <support/support.h>
++#include <support/xmemstream.h>
++
++/* Used to keep track of the number of queries.  */
++static volatile unsigned int queries;
++
++/* If true, add a large TXT record at the start of the answer section.  */
++static volatile bool stuff_txt;
++
++static void
++response (const struct resolv_response_context *ctx,
++          struct resolv_response_builder *b,
++          const char *qname, uint16_t qclass, uint16_t qtype)
++{
++  /* If not using TCP, just force its use.  */
++  if (!ctx->tcp)
++    {
++      struct resolv_response_flags flags = {.tc = true};
++      resolv_response_init (b, flags);
++      resolv_response_add_question (b, qname, qclass, qtype);
++      return;
++    }
++
++  /* The test needs to send four queries, the first three are used to
++     grow the NSS buffer via the ERANGE handshake.  */
++  ++queries;
++  TEST_VERIFY (queries <= 4);
++
++  /* AAAA queries are supposed to be disabled.  */
++  TEST_COMPARE (qtype, T_A);
++  TEST_COMPARE (qclass, C_IN);
++  TEST_COMPARE_STRING (qname, "example.com");
++
++  struct resolv_response_flags flags = {};
++  resolv_response_init (b, flags);
++  resolv_response_add_question (b, qname, qclass, qtype);
++
++  resolv_response_section (b, ns_s_an);
++
++  if (stuff_txt)
++    {
++      resolv_response_open_record (b, qname, qclass, T_TXT, 60);
++      int zero = 0;
++      for (int i = 0; i <= 15000; ++i)
++        resolv_response_add_data (b, &zero, sizeof (zero));
++      resolv_response_close_record (b);
++    }
++
++  for (int i = 0; i < 200; ++i)
++    {
++      resolv_response_open_record (b, qname, qclass, qtype, 60);
++      char ipv4[4] = {192, 0, 2, i + 1};
++      resolv_response_add_data (b, &ipv4, sizeof (ipv4));
++      resolv_response_close_record (b);
++    }
++}
++
++static int
++do_test (void)
++{
++  struct resolv_test *obj = resolv_test_start
++    ((struct resolv_redirect_config)
++     {
++       .response_callback = response
++     });
++
++  _res.options |= RES_NOAAAA;
++
++  for (int do_stuff_txt = 0; do_stuff_txt < 2; ++do_stuff_txt)
++    {
++      queries = 0;
++      stuff_txt = do_stuff_txt;
++
++      struct addrinfo *ai = NULL;
++      int ret;
++      ret = getaddrinfo ("example.com", "80",
++                         &(struct addrinfo)
++                         {
++                           .ai_family = AF_UNSPEC,
++                           .ai_socktype = SOCK_STREAM,
++                         }, &ai);
++
++      char *expected_result;
++      {
++        struct xmemstream mem;
++        xopen_memstream (&mem);
++        for (int i = 0; i < 200; ++i)
++          fprintf (mem.out, "address: STREAM/TCP 192.0.2.%d 80\n", i + 1);
++        xfclose_memstream (&mem);
++        expected_result = mem.buffer;
++      }
++
++      check_addrinfo ("example.com", ai, ret, expected_result);
++
++      free (expected_result);
++      freeaddrinfo (ai);
++    }
++
++  resolv_test_end (obj);
++  return 0;
++}
++
++#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc_2.37.bb b/meta/recipes-core/glibc/glibc_2.37.bb
index 3387441cad..caf454f368 100644
--- a/meta/recipes-core/glibc/glibc_2.37.bb
+++ b/meta/recipes-core/glibc/glibc_2.37.bb
@@ -49,6 +49,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
+           file://0023-CVE-2023-4527.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.39.0


