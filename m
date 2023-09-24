Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E10CE7A88
	for <webhook@archiver.kernel.org>; Sun, 24 Sep 2023 15:22:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.41367.1695568967413318399
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Sep 2023 08:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=J5Eq92br;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76311b4abe=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38OFA2uv023714
	for <openembedded-core@lists.openembedded.org>; Sun, 24 Sep 2023 15:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=cGsB/Rio4pHyj9bLHb
	KTvW8QtlP1OzQ6O6jc4HpcG/E=; b=J5Eq92brIpeQNeSwf/dAuG3xaOdIjJsMYO
	weYnX0vVAjk4nRZJOhkfKErivpI4mwB1lNfE0K93xyj0SyX+SV7Ix0Fj6bs8mfR6
	ArtPri7M/4ZCD8HVcVhScM6A86gXhT/yeZJwWAg0Civi16GSlO+BqaMOxAtW0yQt
	FTdVKPSJWsser9+GAmXhwUXpBJs1KlsyCQOZzS+VijRNDxCcaJ9XYdnUoZ9Ij44h
	sFON1OsXMA9Ix6XIk9TAkHlZEch0q4zLhyy4P6tDEA7sfFKgfZh63Zakp77mkUNE
	V5R1SZ7PTVDHydn3PlEYj9NKDjayaP65rcEKtngu9SyKrRk5y5Ew==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9n7x12xp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 24 Sep 2023 15:22:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXO5JapMe9NI2+T4Z6jsUbBEPQd8dbmDlCX/1HO6UEjDXrUYUbxwQhLmojnfD9Blj1/wYWxUEICtISkeTpIe7fj++th+vzu4AuancTqcK6KD6AAfwqRRcK5hVLRP5x0fHlp1SAZqnTW8Fku64cGupcq4B1bQDMyoFnSEqevKpwfdEa9Rp+v/EujLykseM6nJ/xpToWMySh5DjuSj7zwbUPGDsJjE6DPA2Ur+ZvQgZ3tnCA0ISSdl9OBHSwGRrRb5k9rzhLDLsbC1b2W6JiLHXCtyiGIdL2NQ2uUKqS8HsuWmpT4Vyd4ugTsBcYqfR0nMBUf5gueQ/zMTpKstRPxADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGsB/Rio4pHyj9bLHbKTvW8QtlP1OzQ6O6jc4HpcG/E=;
 b=SZ5gRzkspcHEtodoto/o61yhko/up74qMc9d6dR3olcndM+ITks4gNhmXwpTaKUJk5Ffy9+brHTsnnPWHfQpdMbyl/AjpE19BqxR+TH/MoMZUNHm4iKAg7BlEJzUtTlL0NrTHLtkhJyNqvmyAqXHCCSF6Ta0/vv4kfmnrdCkq6T9661SakU0ynPAkCsJ0UmSavoBryW/WKHr+1SZzXKiguXorDmmYOH35kNMSHDZhBrAgVi7SZWo2sa0wAOyFAqT1R3lTHdThQ0TmTxfVatn1C3u8l3715l4z5vWvi4GQMZWTcEDc+i6KSJ1gCn+G3MXPohxh91CWzDrCgp510fU0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CO1PR11MB5153.namprd11.prod.outlook.com (2603:10b6:303:95::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Sun, 24 Sep
 2023 15:22:41 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5%7]) with mapi id 15.20.6813.017; Sun, 24 Sep 2023
 15:22:41 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v2] glibc: fix CVE-2023-4527
Date: Sun, 24 Sep 2023 08:22:21 -0700
Message-Id: <20230924152221.1424556-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0360.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::35) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CO1PR11MB5153:EE_
X-MS-Office365-Filtering-Correlation-Id: a67f5408-3a9c-45b6-0111-08dbbd121771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZbGA4zjX/UIycM4SrDgGB/YAy5KZDjLhPS4INs4Tr/Bok2fL2DsMERkEwUG6d1vQwqHILlufOrtX/Qivl3X5f0jsjqRKOW3nkZXeOLFRK+pPX5mdFYK8WrLXoOnPpk/cjrg0Ya75hHrKQ5oyXczKLoGqjRl9Kx3lZRws1keMULsWdFVjJg+g+OgpjVmltPIYJOBZaYakqFyoAi1w/GpPbZc/u1yYYZY7XXoz1q4FDNrDTJQqUPQuIzEmFZNMZ9ic53sb9GEYy/kA9rLVGTEgX3IbqX4q2enzSDM89Uknno0qFA3kce0X8MCrxE53f66EPWIrPIBnhxh8oe7zLOwWt7GmNeFzl3OazdDB06laKh50ywdbkWU/U/u+2ugmrRAJi71X2+9NJV9K6TTc1HYKOddK6tsSbhyouHy8rF5JQuz570ORh5vLBOHX2WLrGoNmJqBwgKsaouiac4UptNuDvH/4bniIO/ZelwoUNEJccVs5BclJ0tOdwKqXpjjwtLwg5q5LaZbKCv1gJub5PlBUgERdpR+WbQGxXss0GHOLIhA8FpuBj1Df34HDHN6A3Z/xxQHhFAJQhlKFEkLDfOVD+gmWgfLk/+Fjg5omAXdMygWBBkjUV0FJi07ehNURLWKTzyagnEeHp4J794D0GiYEQk386tWsW7VFBeHJyJihDrY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39840400004)(136003)(396003)(230922051799003)(451199024)(186009)(1800799009)(52116002)(8676002)(8936002)(5660300002)(36756003)(6666004)(4326008)(41300700001)(6506007)(9686003)(6512007)(6486002)(2616005)(26005)(1076003)(316002)(6916009)(66556008)(478600001)(66476007)(86362001)(66946007)(2906002)(83380400001)(107886003)(38100700002)(38350700002)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5n1Y6SH6eEVo36AiBZPYuhlOI5UECRAMtLG46HfMW0WJAIZzUoR2iriPD9w1?=
 =?us-ascii?Q?TvQObUAvmcjgZmk7bbpNufaje62upyNzThcczndcmEcRhhRy6/aXqSwc7Sna?=
 =?us-ascii?Q?CcX3JD9yOQQZ0xcmXiigXBzDucdOhfnSynsEzHKkRMj+lNsnnTRPZF2kduv2?=
 =?us-ascii?Q?sW9jcVVWHMbHKhbcjGqrk1z9ZU9wxHKGmLdkKaG20WQtbsLot46gmQZzCFQb?=
 =?us-ascii?Q?htX8g9X0Xq4VYFd+mAS6UZ4BjvIochG76V9galBNdauNjBZfPXNjuFeIlp9O?=
 =?us-ascii?Q?POnQ0Fj1GlWmMiz23NJZ3UaB20wEdK++iU3SRiddDzXQ9CIRUbkTyuDEkL45?=
 =?us-ascii?Q?gNVbIHBkNzpm3AG+Tojlv79+ffMj3DB049jxHIn9BGjz5tUaprpG3NidQQGe?=
 =?us-ascii?Q?dhtI6Dp9U4qlpS5zccz4dxWOvEsd/Ptip8XW/W6R27cRNu3MCCDDfIoCdilp?=
 =?us-ascii?Q?O3ZN2gknWzFSqnVqhoG3tUWDhRxbVBdhdYQ2skIx0dWaE0r8iZNZGqgfhaWr?=
 =?us-ascii?Q?A+IOYluLYdF2y1bKrT+mb72xKMm87FUYf2+drw8kS5cHLIPcxuuIvRq//YM8?=
 =?us-ascii?Q?52zunEcoW199S4pARcWiX/YdfIE2BO3WQ+UTNuT7YvAW4P8IYAgdRLXd3q+V?=
 =?us-ascii?Q?E7llB4+DThUzoeWXg8ropsRnqO1JN1mqF6AveglxX7yhHiagBbw9CXpYeTYL?=
 =?us-ascii?Q?FZ3dxasge9tnSHDoM1HU1f/A3nK2BmnhkoRCmzVNGIYsgO4GW47lNsyHQApT?=
 =?us-ascii?Q?XJv8eWJQSbVR40T2XOG0F4krjBdE1W5c5dcZruWPItiltfiOfidoODbkKBrR?=
 =?us-ascii?Q?kFvU6M+ZRdNA319wDX82IGb2q+9nB6NtNpqEfzeV62Fa6k7twSOwLqdfLunk?=
 =?us-ascii?Q?75Boc2aspS0b6ktjDYzuU2Gg9XFSLSg+PzJB+GwO5j4C9KvVojwARpL1bN6+?=
 =?us-ascii?Q?NuPu7GFps1lUXroqq3XpzGV6qvVqdq2VcaVrkA2leuQrc6Ls090sh+tGuPtS?=
 =?us-ascii?Q?klzIpplEP7mYVnTpMqC+G1gBv+fsp6fjFJSkMtP+OeNRjJYkhHB2NfZKPZbX?=
 =?us-ascii?Q?Khckp1HFp0Gm1LmTpL6XtyUn+574Pqx4XmS/bYjwgkxo+A+v5hPitgOkMBC2?=
 =?us-ascii?Q?y1NOFv66ndS9bGDbgAkNA9Ixlpg+D5Mj/clWhXqrlkFQ5ZiP6Q03CnZUfmsJ?=
 =?us-ascii?Q?Y/Pvg77GPK5gkwHObIoWNeWt/wY0YtxqXFduivNeImCwDwIi6JsYg2nQTimq?=
 =?us-ascii?Q?aOcFKZoa91d0ZBwa1UdG0wT5LYg8cYAcGLj2hO9+lEME5xjYTyiDgxOZOZeS?=
 =?us-ascii?Q?4tkygBWcrCpCvbZPlJTPyQkrf3DehbLZhAPT3UD1mxNFHIKaFAfTEZZqUYI+?=
 =?us-ascii?Q?SSVypxF2DOZyM0vtcvTkkGc8kMjDwJPGWD01/M6sW7a58l6A16J0AZEiBiyO?=
 =?us-ascii?Q?Dz/h/UlmPGB+YYwdDumzyS7/oKqFn9zmlscNnP138pmBX99fU1AAKCuPluRK?=
 =?us-ascii?Q?ez0dfxXvVcp+tLjTOV/GFUDSnCCTqYSfeNu1aaMvv0y236CKdeErcVbijmWI?=
 =?us-ascii?Q?6qWAOj6EbrnG5C+oAjdc0N9R+xleDISlD8m3VExHZoL8+X9KPNgC/zXyybVt?=
 =?us-ascii?Q?vg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a67f5408-3a9c-45b6-0111-08dbbd121771
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2023 15:22:40.4773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPv8JPWNYcnfTOfwbrzEiqDoXXyaTcqjCxaRd9jqp4L97iV8NNbal7/4HYTbU5VOYQfsiG3axhVaMMRUqh7ALgwNjILYJc0181eZzIJo74s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5153
X-Proofpoint-ORIG-GUID: 0RLOmHjOHZ_ybqTwv9jAfYG1jGGyh107
X-Proofpoint-GUID: 0RLOmHjOHZ_ybqTwv9jAfYG1jGGyh107
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-24_12,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309240135
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Sep 2023 15:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188163

From: Yash Shinde <Yash.Shinde@windriver.com>

Upstream-Status: Backport[https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=4ea972b7edd7e36610e8cde18bf7a8149d7bac4f]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../glibc/glibc/0024-CVE-2023-4527.patch      | 219 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.38.bb         |   1 +
 2 files changed, 220 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-2023-4527.patch

diff --git a/meta/recipes-core/glibc/glibc/0024-CVE-2023-4527.patch b/meta/recipes-core/glibc/glibc/0024-CVE-2023-4527.patch
new file mode 100644
index 0000000000..7d9adf6a66
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0024-CVE-2023-4527.patch
@@ -0,0 +1,219 @@
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
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
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
+@@ -126,6 +126,7 @@
+   [30477] libc: [RISCV]: time64 does not work on riscv32
+   [30515] dynamic-link: _dl_find_object incorrectly returns 1 during
+     early startup
++  [30842] Stack read overflow in getaddrinfo in no-aaaa mode (CVE-2023-4527)
+   [30527] network: resolv_conf lock not unlocked on allocation failure
+   [30550] math: powerpc64le: GCC-specific code for isinf() is being used
+     on clang
+@@ -157,6 +158,12 @@
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
+@@ -102,6 +102,7 @@
+   tst-resolv-invalid-cname \
+   tst-resolv-network \
+   tst-resolv-noaaaa \
++  tst-resolv-noaaaa-vc \
+   tst-resolv-nondecimal \
+   tst-resolv-res_init-multi \
+   tst-resolv-search \
+@@ -293,6 +294,7 @@
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
+@@ -427,7 +427,7 @@ _nss_dns_gethostbyname4_r (const char *name, struct gaih_addrtuple **pat,
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
diff --git a/meta/recipes-core/glibc/glibc_2.38.bb b/meta/recipes-core/glibc/glibc_2.38.bb
index 32ccb888f0..237458d066 100644
--- a/meta/recipes-core/glibc/glibc_2.38.bb
+++ b/meta/recipes-core/glibc/glibc_2.38.bb
@@ -51,6 +51,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch \
+           file://0024-CVE-2023-4527.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.39.0


