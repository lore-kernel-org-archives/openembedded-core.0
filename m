Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F444E93709
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 11:03:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12634.1696503780171218036
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 04:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UVrRuX57;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8642418f7f=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 395B1ReE002312
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Oct 2023 11:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=0869+OFQl9bzY1gLS1
	09L3aj/YcsE1w/zsb++5bNEZQ=; b=UVrRuX57gNLuuKVYUkUIsIrXnYV05a+VED
	O9i/0aLSFHGeWdv/8oQ0S/5H0QFUkCHElj3AYyjGYiK9Q9kx/oyD88W587qmOBpO
	uuKYts+THEDvuMDQ9kC8GV7qWsoAQCQE9pQWOrtd1anVZWc9G+gMSzauzZia8MEJ
	YIdzVM1QEWdVEHLkRac8TgPK5JxfzJSXLa4RxonDOpZ/h6VcuQNJY2iwFmhc3qma
	3GCL0EQxVRfN6y48EfS9rsaziPwVRXOOBFinD4UlDquUbEBRmQb0SKHnnN6YxTBV
	NaGt9ZyCsobcLz0KHeo6bD3z6vXN8g4BVdpTQX2Wv/jgQ7ihekWA==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3thtya01b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 11:02:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mld01ygZ6J+PZ0x3OmIYadvPEd3f73TJj+xmm+0pkfDVMgxgOJ7Cy5Ueq7lFW3fOxHRRXQKFscZ+NgwvDGJIoZzmB8XaSAQeeG3NIVF0QBeSNJR4yl9eVPW3/DAkZ46y2AWcvc0Z8shCwVaEP2PqWndeFCi2weIvsUsZyRB0SprK+VzBsl2u/7w00WeuV/0lTrkAWYliT5/WRgBRzSJ+Svo+clN+5wu1a6EjmMXJ14y6k3TVdDgqjxqyDufqKbMCFlHWDzTloJd3cwM1V3s+vtb+Fy2BC5SkrARoGUeHFrP2N4YsSyFk5sax/Geub/31gKFft1ei0nIotvAmufLY1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0869+OFQl9bzY1gLS109L3aj/YcsE1w/zsb++5bNEZQ=;
 b=DpMcJadK8X8mHSOixVAHo1Z7AgEpYcfIvTHjBAoVvpBDmXMhTu5lHnUK6HAnXrle0POUnlYKj/613lKawGfvM98JNfZUN0ZlGnUp3f1mMBx+G1JTcJGGZu0lWEt2ziL98uKHvnLjug3o1WTIuTwrKL6gpziOJtFrnTh/Fx9XaP2/KyAudqtaYao6cZiSz3gVH9ar/vnw309m8hBhz1Hg5LSR5AANDPlqvwXlPsMkki/y2P8Cw61nZf2siaoCkGgzz+6v/b8yjUjkJL7u/39bbHCyQonV+LQ5Ba988A55eGzQbmnzgYQsXiwt2gzNQue/YkFddtRgBw/93RrBSAf9+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM6PR11MB4689.namprd11.prod.outlook.com (2603:10b6:5:2a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Thu, 5 Oct
 2023 11:02:54 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::f525:287c:b2c:81c5%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 11:02:54 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [mickledore] glibc: stable 2.37 branch updates.
Date: Thu,  5 Oct 2023 04:02:07 -0700
Message-Id: <20231005110207.1582338-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0042.namprd07.prod.outlook.com
 (2603:10b6:510:e::17) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DM6PR11MB4689:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cf3b91e-272e-446b-a7fe-08dbc5929fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iunnAeOsnzt2ByJgh3LLjkLy5z04RPEde31yr3+xkfk7N4wgQpGu8MmBQtFle9bgkTYhMLFpoKxQrAlN238/NDEOpELEg0evjWBfG3PqffcLlXtvBGNDqX1oIloNn+tokHmZww5FE4XkhPqPCdUYpH68Yb74MTiIv/V4BPWSMFAice2+UpKkO2UHm/CB1vcRcc3hYUMrQpt9qpt7/eBihU3A1w/elyGf5TvBbyCpOTNa2kULn9/NMGkjCGUZuCjaEgPfxLY0t20a76svBiju5Z+GvOjfAgk8PHb0puQx8G321cLMk4Yzke5GGQWHhUQnEmzl/uDwc7LmJe3B6fQp38vIcOGNEhmQqF6/dFYa0lANQg9iNK4e2t3PKYer1u43Ik3Tu7YwcgupCL88rYFBaYqEOEEGSQlRg0EtCeACd0wHs6TxqfVdPIGkoPIxEdXLtMPPBwvXj0M8ayjPS7YByjEzr1hQv7rQhxVjIg9uWQ2ovZW3VC6fQv1SNBCKNfkUFBpS+dFjjajYPaqGPAtYl3wS375eKbemd7vW59Uz8VqcXxkvlxcnpwvo6SDJdYSO+Z7FH2jj84TQbt4+Gy9VCDpHfehIH9e4vsVEqBAp0gb4v+UjCuIoiPQqXhbzc7BKEC1RQU3L7izRCsNrv1AXDZjs9uID/6u/D7VfTS3zk6M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(376002)(346002)(39850400004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(66899024)(66556008)(86362001)(66476007)(66946007)(41300700001)(316002)(6916009)(38350700002)(6486002)(38100700002)(478600001)(2906002)(30864003)(15650500001)(8676002)(4326008)(8936002)(5660300002)(83380400001)(9686003)(6512007)(6666004)(6506007)(52116002)(2616005)(1076003)(107886003)(26005)(36756003)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vdSnQYcd2bBOLn4amWU+CxWyG79wWyIOjhK5/wSpoQQV7eT6KcJxaDxb9FUk?=
 =?us-ascii?Q?82WGl0hi238Dhi88jFRBMX+dDatmSNKWNeOjRIZBcjFNuHROBx0hMJ7kUyDh?=
 =?us-ascii?Q?vqyXy7h2RflBgVKPSnhjO31leC92Ld87Fc5tKG8GTvxpRlQvUhpsT/B+29xW?=
 =?us-ascii?Q?+O+HQ2KFR2AWpUTJzPcnC9ge/bhM57pP7fCPkzKsG0002GczlIc2rvHc0HeO?=
 =?us-ascii?Q?DVUxx0plR3gjy+YOtixy7qOVfIMjZYfiuct6mEJDhJcM0ACRklgX+7HisbP3?=
 =?us-ascii?Q?szhw7quyWT/nrj0IXS0zE5JWe+Jm9ZeI5HhaBAyb/xlr5NVXKPzbWEGeKWuM?=
 =?us-ascii?Q?PvohtOu2Ezyku1w33/xtnuhqliAlVYHI07cLPbikFPhd9DJ9QDcsJh+0nweM?=
 =?us-ascii?Q?vu11yVUWHM+D+E1Mb9cXNqqsgXl+oNmFeyzv5duQC9ai3zPj9fZaDqldYp/6?=
 =?us-ascii?Q?8AWmbZSbN5tu1m2feDGxJk/5kiq2PWxJsWRjPe5hKMddbnJWddknvzhJlkK4?=
 =?us-ascii?Q?wi4befJH3Zs8HZtleyPzlTmb7sMc88u0UjdTGdRNhSWpAGIR2vf2Aus40hXm?=
 =?us-ascii?Q?HIf97GibFAo2V+Dm3Mdc7ToJUMNZ6XALuomHaCMjoqUTfMh6r+hWmUK3EAyr?=
 =?us-ascii?Q?dpVECXhgvS1VE140eQvhgg1ZRZSYlCx9mL99ml8CjL24rjmX9rDrLs5a0FoF?=
 =?us-ascii?Q?ZkWATL65gk5iIgRwQGVoqcgKuuoVALgM7YeL9VxDCVRroEs9v5r8wewi9V2b?=
 =?us-ascii?Q?mV2/yzI7xHK+NnjvXRocjldEVzzsyojMpeQn2pxpCLFms3tLETd1qWw9VEAX?=
 =?us-ascii?Q?dq3rR4ZtAIOcs4rQWsQnDA2PSRKfp84O0A+yDpGu/TfXoQZWZNFrO+j8zCxK?=
 =?us-ascii?Q?Nc/bujr99yEMRNLbLB5lKJKwuQeGBMBqJSxmgWZg6io+/ZbCRbdTkBepoCWR?=
 =?us-ascii?Q?OFK8tgTAxnMi5cD1E91UnC7fHaMgoXEFi3QDJaW6Chgquf+EnUtl1LkrzmQ7?=
 =?us-ascii?Q?EFBnFz0TDvfRd49A7BgxYaCEtdOmzQsMrm/oGYc5Aoe2duZuIOf+44b7rCQ8?=
 =?us-ascii?Q?lXdrxb+N+oDdp6bq0V+etREyijz1Cfru3nB4/a7lse76eiVdPxuVzHGumxO1?=
 =?us-ascii?Q?RdU/kacZn964T4tIlI4KoX+n19uu9Dt8H75HW5wrJEBOASTuz2gi7rwnBwW6?=
 =?us-ascii?Q?XUWBAxwF04D8Y7cukcZLMt8p3w/berE2SijKZD60zkHE2uV3U4FEBnhYD8i2?=
 =?us-ascii?Q?/YXhIuppAt5zCD47MrOTWK979tzT6C+knmNXOO6tDog5GbeQnwe6hmYwZlfi?=
 =?us-ascii?Q?AMm3fpUSo0UxYWdbTrEoCrxxdJ6MKsl18FVoNSM7YJOX5RXvLCjurSURLA23?=
 =?us-ascii?Q?l40WOm59XQ9niKf1oaQLZNxA0+6v5AGhPo6yigEkeRbjdHixTZqG7b0NGAX1?=
 =?us-ascii?Q?BUuBmEQ9dkE/GjKhOavrV/HbOMy74MWJ4rNfnliFLGNTZyAXqmHIwlO7bsvl?=
 =?us-ascii?Q?PvwOFbd7VyNnvLgbn9Vsme7qh+bUW5INvo2TkvPaQxw4AnkOzaUebdZELGQE?=
 =?us-ascii?Q?cuQcHMKx1ghLLaaXKY44KInMNUpJJZV9GfkIF4BqEZ7RdvmCZcKltFji1b7L?=
 =?us-ascii?Q?7A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf3b91e-272e-446b-a7fe-08dbc5929fb4
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 11:02:54.4136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: okofztSpewxw6YkWXkpbYQqRn267BTTwk3WRnxwAjIqPdweVmiQTEBL65i4+tqE+25ZsrYWjmX66Yrpmirjh30JhKHcVcjKdTJqdiKaoSEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4689
X-Proofpoint-GUID: Z6k2AMnhtSnbrayTs0jltIfWIBr7abD1
X-Proofpoint-ORIG-GUID: Z6k2AMnhtSnbrayTs0jltIfWIBr7abD1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-05_08,2023-10-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310050086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 11:03:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188717

From: Yash Shinde <Yash.Shinde@windriver.com>

b4e23c75ae tunables: Terminate if end of input is reached (CVE-2023-4911)
2dfd8c77b5 i686: Regenerate ulps
94ef701365 Document CVE-2023-4806 and CVE-2023-5156 in NEWS
4473d1b87d Fix leak in getaddrinfo introduced by the fix for CVE-2023-4806 [BZ #30843]
9d5c6e27ed x86: Fix for cache computation on AMD legacy cpus.
79310b45af x86/dl-cacheinfo: remove unsused parameter from handle_amd
6529a7466c getaddrinfo: Fix use after free in getcanonname (CVE-2023-4806)
b752934602 CVE-2023-4527: Stack read overflow with large TCP responses in no-aaaa mode
1a7cbe52c8 elf: Move l_init_called_next to old place of l_text_end in link map
bdb594afa5 elf: Remove unused l_text_end field from struct link_map
a7e34a6675 elf: Always call destructors in reverse constructor order (bug 30785)
3d24d1903d elf: Do not run constructors for proxy objects
be26b29262 io: Fix record locking contants for powerpc64 with __USE_FILE_OFFSET64
0d500bfdc0 hurd: Make exception subcode a long
f94ff95e93 x86: Fix incorrect scope of setting `shared_per_thread` [BZ# 30745]
cc8243fb0b x86: Use `3/4*sizeof(per-thread-L3)` as low bound for NT threshold.
80a8c858a5 x86: Fix slight bug in `shared_per_thread` cache size calculation.
1caf955269 x86: Increase `non_temporal_threshold` to roughly `sizeof_L3 / 4`

Dropped 0023-CVE-2023-4527.patch and 0024-CVE-2023-4806.patch files as they are
present in glibc version update.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../glibc/glibc/0023-CVE-2023-4527.patch      | 219 -----------
 .../glibc/glibc/0024-CVE-2023-4806.patch      | 342 ------------------
 meta/recipes-core/glibc/glibc_2.37.bb         |   2 -
 4 files changed, 1 insertion(+), 564 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0023-CVE-2023-4527.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-2023-4806.patch

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index ff2b2ade9d..7eacfec778 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.37/master"
 PV = "2.37"
-SRCREV_glibc ?= "58f7431fd77c0a6dd8df08d50c51ee3e7f09825f" 
+SRCREV_glibc ?= "b4e23c75aea756b4bddc4abcf27a1c6dca8b6bd3"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc/0023-CVE-2023-4527.patch b/meta/recipes-core/glibc/glibc/0023-CVE-2023-4527.patch
deleted file mode 100644
index 211249211a..0000000000
--- a/meta/recipes-core/glibc/glibc/0023-CVE-2023-4527.patch
+++ /dev/null
@@ -1,219 +0,0 @@
-From 4ea972b7edd7e36610e8cde18bf7a8149d7bac4f Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Wed, 13 Sep 2023 14:10:56 +0200
-Subject: [PATCH] CVE-2023-4527: Stack read overflow with large TCP responses
- in no-aaaa mode
-
-Without passing alt_dns_packet_buffer, __res_context_search can only
-store 2048 bytes (what fits into dns_packet_buffer).  However,
-the function returns the total packet size, and the subsequent
-DNS parsing code in _nss_dns_gethostbyname4_r reads beyond the end
-of the stack-allocated buffer.
-
-Fixes commit f282cdbe7f436c75864e5640a4 ("resolv: Implement no-aaaa
-stub resolver option") and bug 30842.
-
-(cherry picked from commit bd77dd7e73e3530203be1c52c8a29d08270cb25d)
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=4ea972b7edd7e36610e8cde18bf7a8149d7bac4f]
-CVE: CVE-2023-4527
-
-Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
-
----
- NEWS                          |   7 ++
- resolv/Makefile               |   2 +
- resolv/nss_dns/dns-host.c     |   2 +-
- resolv/tst-resolv-noaaaa-vc.c | 129 ++++++++++++++++++++++++++++++++++
- 4 files changed, 139 insertions(+), 1 deletion(-)
- create mode 100644 resolv/tst-resolv-noaaaa-vc.c
-
-diff --git a/NEWS b/NEWS
---- a/NEWS
-+++ b/NEWS
-@@ -25,6 +25,7 @@
-   [30101] gmon: fix memory corruption issues
-   [30125] dynamic-link: [regression, bisected] glibc-2.37 creates new
-     symlink for libraries without soname
-+  [30842] Stack read overflow in getaddrinfo in no-aaaa mode (CVE-2023-4527)
-   [30151] gshadow: Matching sgetsgent, sgetsgent_r ERANGE handling
-   [30163] posix: Fix system blocks SIGCHLD erroneously
-   [30305] x86_64: Fix asm constraints in feraiseexcept
-@@ -54,6 +55,12 @@
-   heap and prints it to the target log file, potentially revealing a
-   portion of the contents of the heap.
-
-+  CVE-2023-4527: If the system is configured in no-aaaa mode via
-+  /etc/resolv.conf, getaddrinfo is called for the AF_UNSPEC address
-+  family, and a DNS response is received over TCP that is larger than
-+  2048 bytes, getaddrinfo may potentially disclose stack contents via
-+  the returned address data, or crash.
-+
- The following bugs are resolved with this release:
-
-   [12154] network: Cannot resolve hosts which have wildcard aliases
-diff --git a/resolv/Makefile b/resolv/Makefile
---- a/resolv/Makefile
-+++ b/resolv/Makefile
-@@ -101,6 +101,7 @@
-   tst-resolv-invalid-cname \
-   tst-resolv-network \
-   tst-resolv-noaaaa \
-+  tst-resolv-noaaaa-vc \
-   tst-resolv-nondecimal \
-   tst-resolv-res_init-multi \
-   tst-resolv-search \
-@@ -292,6 +293,7 @@
- $(objpfx)tst-resolv-invalid-cname: $(objpfx)libresolv.so \
-   $(shared-thread-library)
- $(objpfx)tst-resolv-noaaaa: $(objpfx)libresolv.so $(shared-thread-library)
-+$(objpfx)tst-resolv-noaaaa-vc: $(objpfx)libresolv.so $(shared-thread-library)
- $(objpfx)tst-resolv-nondecimal: $(objpfx)libresolv.so $(shared-thread-library)
- $(objpfx)tst-resolv-qtypes: $(objpfx)libresolv.so $(shared-thread-library)
- $(objpfx)tst-resolv-rotate: $(objpfx)libresolv.so $(shared-thread-library)
-diff --git a/resolv/nss_dns/dns-host.c b/resolv/nss_dns/dns-host.c
---- a/resolv/nss_dns/dns-host.c
-+++ b/resolv/nss_dns/dns-host.c
-@@ -427,7 +427,7 @@
-     {
-       n = __res_context_search (ctx, name, C_IN, T_A,
-				dns_packet_buffer, sizeof (dns_packet_buffer),
--				NULL, NULL, NULL, NULL, NULL);
-+				&alt_dns_packet_buffer, NULL, NULL, NULL, NULL);
-       if (n >= 0)
-	status = gaih_getanswer_noaaaa (alt_dns_packet_buffer, n,
-					&abuf, pat, errnop, herrnop, ttlp);
-diff --git a/resolv/tst-resolv-noaaaa-vc.c b/resolv/tst-resolv-noaaaa-vc.c
-new file mode 100644
---- /dev/null
-+++ b/resolv/tst-resolv-noaaaa-vc.c
-@@ -0,0 +1,129 @@
-+/* Test the RES_NOAAAA resolver option with a large response.
-+   Copyright (C) 2022-2023 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#include <errno.h>
-+#include <netdb.h>
-+#include <resolv.h>
-+#include <stdbool.h>
-+#include <stdlib.h>
-+#include <support/check.h>
-+#include <support/check_nss.h>
-+#include <support/resolv_test.h>
-+#include <support/support.h>
-+#include <support/xmemstream.h>
-+
-+/* Used to keep track of the number of queries.  */
-+static volatile unsigned int queries;
-+
-+/* If true, add a large TXT record at the start of the answer section.  */
-+static volatile bool stuff_txt;
-+
-+static void
-+response (const struct resolv_response_context *ctx,
-+          struct resolv_response_builder *b,
-+          const char *qname, uint16_t qclass, uint16_t qtype)
-+{
-+  /* If not using TCP, just force its use.  */
-+  if (!ctx->tcp)
-+    {
-+      struct resolv_response_flags flags = {.tc = true};
-+      resolv_response_init (b, flags);
-+      resolv_response_add_question (b, qname, qclass, qtype);
-+      return;
-+    }
-+
-+  /* The test needs to send four queries, the first three are used to
-+     grow the NSS buffer via the ERANGE handshake.  */
-+  ++queries;
-+  TEST_VERIFY (queries <= 4);
-+
-+  /* AAAA queries are supposed to be disabled.  */
-+  TEST_COMPARE (qtype, T_A);
-+  TEST_COMPARE (qclass, C_IN);
-+  TEST_COMPARE_STRING (qname, "example.com");
-+
-+  struct resolv_response_flags flags = {};
-+  resolv_response_init (b, flags);
-+  resolv_response_add_question (b, qname, qclass, qtype);
-+
-+  resolv_response_section (b, ns_s_an);
-+
-+  if (stuff_txt)
-+    {
-+      resolv_response_open_record (b, qname, qclass, T_TXT, 60);
-+      int zero = 0;
-+      for (int i = 0; i <= 15000; ++i)
-+        resolv_response_add_data (b, &zero, sizeof (zero));
-+      resolv_response_close_record (b);
-+    }
-+
-+  for (int i = 0; i < 200; ++i)
-+    {
-+      resolv_response_open_record (b, qname, qclass, qtype, 60);
-+      char ipv4[4] = {192, 0, 2, i + 1};
-+      resolv_response_add_data (b, &ipv4, sizeof (ipv4));
-+      resolv_response_close_record (b);
-+    }
-+}
-+
-+static int
-+do_test (void)
-+{
-+  struct resolv_test *obj = resolv_test_start
-+    ((struct resolv_redirect_config)
-+     {
-+       .response_callback = response
-+     });
-+
-+  _res.options |= RES_NOAAAA;
-+
-+  for (int do_stuff_txt = 0; do_stuff_txt < 2; ++do_stuff_txt)
-+    {
-+      queries = 0;
-+      stuff_txt = do_stuff_txt;
-+
-+      struct addrinfo *ai = NULL;
-+      int ret;
-+      ret = getaddrinfo ("example.com", "80",
-+                         &(struct addrinfo)
-+                         {
-+                           .ai_family = AF_UNSPEC,
-+                           .ai_socktype = SOCK_STREAM,
-+                         }, &ai);
-+
-+      char *expected_result;
-+      {
-+        struct xmemstream mem;
-+        xopen_memstream (&mem);
-+        for (int i = 0; i < 200; ++i)
-+          fprintf (mem.out, "address: STREAM/TCP 192.0.2.%d 80\n", i + 1);
-+        xfclose_memstream (&mem);
-+        expected_result = mem.buffer;
-+      }
-+
-+      check_addrinfo ("example.com", ai, ret, expected_result);
-+
-+      free (expected_result);
-+      freeaddrinfo (ai);
-+    }
-+
-+  resolv_test_end (obj);
-+  return 0;
-+}
-+
-+#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc/0024-CVE-2023-4806.patch b/meta/recipes-core/glibc/glibc/0024-CVE-2023-4806.patch
deleted file mode 100644
index 42d91fd340..0000000000
--- a/meta/recipes-core/glibc/glibc/0024-CVE-2023-4806.patch
+++ /dev/null
@@ -1,342 +0,0 @@
-From 973fe93a5675c42798b2161c6f29c01b0e243994 Mon Sep 17 00:00:00 2001
-From: Siddhesh Poyarekar <siddhesh@sourceware.org>
-Date: Fri, 15 Sep 2023 13:51:12 -0400
-Subject: [PATCH] getaddrinfo: Fix use after free in getcanonname
- (CVE-2023-4806)
-
-When an NSS plugin only implements the _gethostbyname2_r and
-_getcanonname_r callbacks, getaddrinfo could use memory that was freed
-during tmpbuf resizing, through h_name in a previous query response.
-
-The backing store for res->at->name when doing a query with
-gethostbyname3_r or gethostbyname2_r is tmpbuf, which is reallocated in
-gethosts during the query.  For AF_INET6 lookup with AI_ALL |
-AI_V4MAPPED, gethosts gets called twice, once for a v6 lookup and second
-for a v4 lookup.  In this case, if the first call reallocates tmpbuf
-enough number of times, resulting in a malloc, th->h_name (that
-res->at->name refers to) ends up on a heap allocated storage in tmpbuf.
-Now if the second call to gethosts also causes the plugin callback to
-return NSS_STATUS_TRYAGAIN, tmpbuf will get freed, resulting in a UAF
-reference in res->at->name.  This then gets dereferenced in the
-getcanonname_r plugin call, resulting in the use after free.
-
-Fix this by copying h_name over and freeing it at the end.  This
-resolves BZ #30843, which is assigned CVE-2023-4806.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=973fe93a5675c42798b2161c6f29c01b0e243994]
-CVE: CVE-2023-4806
-
-Signed-off-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
-
-Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
----
- nss/Makefile                                  | 15 ++++-
- nss/nss_test_gai_hv2_canonname.c              | 56 +++++++++++++++++
- nss/tst-nss-gai-hv2-canonname.c               | 63 +++++++++++++++++++
- nss/tst-nss-gai-hv2-canonname.h               |  1 +
- .../postclean.req                             |  0
- .../tst-nss-gai-hv2-canonname.script          |  2 +
- sysdeps/posix/getaddrinfo.c                   | 25 +++++---
- 7 files changed, 152 insertions(+), 10 deletions(-)
- create mode 100644 nss/nss_test_gai_hv2_canonname.c
- create mode 100644 nss/tst-nss-gai-hv2-canonname.c
- create mode 100644 nss/tst-nss-gai-hv2-canonname.h
- create mode 100644 nss/tst-nss-gai-hv2-canonname.root/postclean.req
- create mode 100644 nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.script
-
-diff --git a/nss/Makefile b/nss/Makefile
-index 06fcdc450f..8a5126ecf3 100644
---- a/nss/Makefile
-+++ b/nss/Makefile
-@@ -82,6 +82,7 @@ tests-container := \
-   tst-nss-test3 \
-   tst-reload1 \
-   tst-reload2 \
-+  tst-nss-gai-hv2-canonname \
- # tests-container
-
- # Tests which need libdl
-@@ -145,7 +146,8 @@ libnss_compat-inhibit-o	= $(filter-out .os,$(object-suffixes))
- ifeq ($(build-static-nss),yes)
- tests-static		+= tst-nss-static
- endif
--extra-test-objs		+= nss_test1.os nss_test2.os nss_test_errno.os
-+extra-test-objs		+= nss_test1.os nss_test2.os nss_test_errno.os \
-+			   nss_test_gai_hv2_canonname.os
-
- include ../Rules
-
-@@ -180,12 +182,16 @@ rtld-tests-LDFLAGS += -Wl,--dynamic-list=nss_test.ver
- libof-nss_test1 = extramodules
- libof-nss_test2 = extramodules
- libof-nss_test_errno = extramodules
-+libof-nss_test_gai_hv2_canonname = extramodules
- $(objpfx)/libnss_test1.so: $(objpfx)nss_test1.os $(link-libc-deps)
-	$(build-module)
- $(objpfx)/libnss_test2.so: $(objpfx)nss_test2.os $(link-libc-deps)
-	$(build-module)
- $(objpfx)/libnss_test_errno.so: $(objpfx)nss_test_errno.os $(link-libc-deps)
-	$(build-module)
-+$(objpfx)/libnss_test_gai_hv2_canonname.so: \
-+  $(objpfx)nss_test_gai_hv2_canonname.os $(link-libc-deps)
-+	$(build-module)
- $(objpfx)nss_test2.os : nss_test1.c
- # Use the nss_files suffix for these objects as well.
- $(objpfx)/libnss_test1.so$(libnss_files.so-version): $(objpfx)/libnss_test1.so
-@@ -195,10 +201,14 @@ $(objpfx)/libnss_test2.so$(libnss_files.so-version): $(objpfx)/libnss_test2.so
- $(objpfx)/libnss_test_errno.so$(libnss_files.so-version): \
-   $(objpfx)/libnss_test_errno.so
-	$(make-link)
-+$(objpfx)/libnss_test_gai_hv2_canonname.so$(libnss_files.so-version): \
-+  $(objpfx)/libnss_test_gai_hv2_canonname.so
-+	$(make-link)
- $(patsubst %,$(objpfx)%.out,$(tests) $(tests-container)) : \
-	$(objpfx)/libnss_test1.so$(libnss_files.so-version) \
-	$(objpfx)/libnss_test2.so$(libnss_files.so-version) \
--	$(objpfx)/libnss_test_errno.so$(libnss_files.so-version)
-+	$(objpfx)/libnss_test_errno.so$(libnss_files.so-version) \
-+	$(objpfx)/libnss_test_gai_hv2_canonname.so$(libnss_files.so-version)
-
- ifeq (yes,$(have-thread-library))
- $(objpfx)tst-cancel-getpwuid_r: $(shared-thread-library)
-@@ -215,3 +225,4 @@ LDFLAGS-tst-nss-test3 = -Wl,--disable-new-dtags
- LDFLAGS-tst-nss-test4 = -Wl,--disable-new-dtags
- LDFLAGS-tst-nss-test5 = -Wl,--disable-new-dtags
- LDFLAGS-tst-nss-test_errno = -Wl,--disable-new-dtags
-+LDFLAGS-tst-nss-test_gai_hv2_canonname = -Wl,--disable-new-dtags
-diff --git a/nss/nss_test_gai_hv2_canonname.c b/nss/nss_test_gai_hv2_canonname.c
-new file mode 100644
-index 0000000000..4439c83c9f
---- /dev/null
-+++ b/nss/nss_test_gai_hv2_canonname.c
-@@ -0,0 +1,56 @@
-+/* NSS service provider that only provides gethostbyname2_r.
-+   Copyright The GNU Toolchain Authors.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#include <nss.h>
-+#include <stdlib.h>
-+#include <string.h>
-+#include "nss/tst-nss-gai-hv2-canonname.h"
-+
-+/* Catch misnamed and functions.  */
-+#pragma GCC diagnostic error "-Wmissing-prototypes"
-+NSS_DECLARE_MODULE_FUNCTIONS (test_gai_hv2_canonname)
-+
-+extern enum nss_status _nss_files_gethostbyname2_r (const char *, int,
-+						    struct hostent *, char *,
-+						    size_t, int *, int *);
-+
-+enum nss_status
-+_nss_test_gai_hv2_canonname_gethostbyname2_r (const char *name, int af,
-+					      struct hostent *result,
-+					      char *buffer, size_t buflen,
-+					      int *errnop, int *herrnop)
-+{
-+  return _nss_files_gethostbyname2_r (name, af, result, buffer, buflen, errnop,
-+				      herrnop);
-+}
-+
-+enum nss_status
-+_nss_test_gai_hv2_canonname_getcanonname_r (const char *name, char *buffer,
-+					    size_t buflen, char **result,
-+					    int *errnop, int *h_errnop)
-+{
-+  /* We expect QUERYNAME, which is a small enough string that it shouldn't fail
-+     the test.  */
-+  if (memcmp (QUERYNAME, name, sizeof (QUERYNAME))
-+      || buflen < sizeof (QUERYNAME))
-+    abort ();
-+
-+  strncpy (buffer, name, buflen);
-+  *result = buffer;
-+  return NSS_STATUS_SUCCESS;
-+}
-diff --git a/nss/tst-nss-gai-hv2-canonname.c b/nss/tst-nss-gai-hv2-canonname.c
-new file mode 100644
-index 0000000000..d5f10c07d6
---- /dev/null
-+++ b/nss/tst-nss-gai-hv2-canonname.c
-@@ -0,0 +1,63 @@
-+/* Test NSS query path for plugins that only implement gethostbyname2
-+   (#30843).
-+   Copyright The GNU Toolchain Authors.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#include <nss.h>
-+#include <netdb.h>
-+#include <stdlib.h>
-+#include <string.h>
-+#include <support/check.h>
-+#include <support/xstdio.h>
-+#include "nss/tst-nss-gai-hv2-canonname.h"
-+
-+#define PREPARE do_prepare
-+
-+static void do_prepare (int a, char **av)
-+{
-+  FILE *hosts = xfopen ("/etc/hosts", "w");
-+  for (unsigned i = 2; i < 255; i++)
-+    {
-+      fprintf (hosts, "ff01::ff02:ff03:%u:2\ttest.example.com\n", i);
-+      fprintf (hosts, "192.168.0.%u\ttest.example.com\n", i);
-+    }
-+  xfclose (hosts);
-+}
-+
-+static int
-+do_test (void)
-+{
-+  __nss_configure_lookup ("hosts", "test_gai_hv2_canonname");
-+
-+  struct addrinfo hints = {};
-+  struct addrinfo *result = NULL;
-+
-+  hints.ai_family = AF_INET6;
-+  hints.ai_flags = AI_ALL | AI_V4MAPPED | AI_CANONNAME;
-+
-+  int ret = getaddrinfo (QUERYNAME, NULL, &hints, &result);
-+
-+  if (ret != 0)
-+    FAIL_EXIT1 ("getaddrinfo failed: %s\n", gai_strerror (ret));
-+
-+  TEST_COMPARE_STRING (result->ai_canonname, QUERYNAME);
-+
-+  freeaddrinfo(result);
-+  return 0;
-+}
-+
-+#include <support/test-driver.c>
-diff --git a/nss/tst-nss-gai-hv2-canonname.h b/nss/tst-nss-gai-hv2-canonname.h
-new file mode 100644
-index 0000000000..14f2a9cb08
---- /dev/null
-+++ b/nss/tst-nss-gai-hv2-canonname.h
-@@ -0,0 +1 @@
-+#define QUERYNAME "test.example.com"
-diff --git a/nss/tst-nss-gai-hv2-canonname.root/postclean.req b/nss/tst-nss-gai-hv2-canonname.root/postclean.req
-new file mode 100644
-index 0000000000..e69de29bb2
-diff --git a/nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.script b/nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.script
-new file mode 100644
-index 0000000000..31848b4a28
---- /dev/null
-+++ b/nss/tst-nss-gai-hv2-canonname.root/tst-nss-gai-hv2-canonname.script
-@@ -0,0 +1,2 @@
-+cp $B/nss/libnss_test_gai_hv2_canonname.so $L/libnss_test_gai_hv2_canonname.so.2
-+su
-diff --git a/sysdeps/posix/getaddrinfo.c b/sysdeps/posix/getaddrinfo.c
-index 6ae6744fe4..47f421fddf 100644
---- a/sysdeps/posix/getaddrinfo.c
-+++ b/sysdeps/posix/getaddrinfo.c
-@@ -120,6 +120,7 @@ struct gaih_result
- {
-   struct gaih_addrtuple *at;
-   char *canon;
-+  char *h_name;
-   bool free_at;
-   bool got_ipv6;
- };
-@@ -165,6 +166,7 @@ gaih_result_reset (struct gaih_result *res)
-   if (res->free_at)
-     free (res->at);
-   free (res->canon);
-+  free (res->h_name);
-   memset (res, 0, sizeof (*res));
- }
-
-@@ -203,9 +205,8 @@ gaih_inet_serv (const char *servicename, const struct gaih_typeproto *tp,
-   return 0;
- }
-
--/* Convert struct hostent to a list of struct gaih_addrtuple objects.  h_name
--   is not copied, and the struct hostent object must not be deallocated
--   prematurely.  The new addresses are appended to the tuple array in RES.  */
-+/* Convert struct hostent to a list of struct gaih_addrtuple objects.  The new
-+   addresses are appended to the tuple array in RES.  */
- static bool
- convert_hostent_to_gaih_addrtuple (const struct addrinfo *req, int family,
-				   struct hostent *h, struct gaih_result *res)
-@@ -238,6 +239,15 @@ convert_hostent_to_gaih_addrtuple (const struct addrinfo *req, int family,
-   res->at = array;
-   res->free_at = true;
-
-+  /* Duplicate h_name because it may get reclaimed when the underlying storage
-+     is freed.  */
-+  if (res->h_name == NULL)
-+    {
-+      res->h_name = __strdup (h->h_name);
-+      if (res->h_name == NULL)
-+	return false;
-+    }
-+
-   /* Update the next pointers on reallocation.  */
-   for (size_t i = 0; i < old; i++)
-     array[i].next = array + i + 1;
-@@ -262,7 +272,6 @@ convert_hostent_to_gaih_addrtuple (const struct addrinfo *req, int family,
-	}
-       array[i].next = array + i + 1;
-     }
--  array[0].name = h->h_name;
-   array[count - 1].next = NULL;
-
-   return true;
-@@ -324,15 +333,15 @@ gethosts (nss_gethostbyname3_r fct, int family, const char *name,
-    memory allocation failure.  The returned string is allocated on the
-    heap; the caller has to free it.  */
- static char *
--getcanonname (nss_action_list nip, struct gaih_addrtuple *at, const char *name)
-+getcanonname (nss_action_list nip, const char *hname, const char *name)
- {
-   nss_getcanonname_r *cfct = __nss_lookup_function (nip, "getcanonname_r");
-   char *s = (char *) name;
-   if (cfct != NULL)
-     {
-       char buf[256];
--      if (DL_CALL_FCT (cfct, (at->name ?: name, buf, sizeof (buf),
--			      &s, &errno, &h_errno)) != NSS_STATUS_SUCCESS)
-+      if (DL_CALL_FCT (cfct, (hname ?: name, buf, sizeof (buf), &s, &errno,
-+			      &h_errno)) != NSS_STATUS_SUCCESS)
-	/* If the canonical name cannot be determined, use the passed
-	   string.  */
-	s = (char *) name;
-@@ -771,7 +780,7 @@ get_nss_addresses (const char *name, const struct addrinfo *req,
-		  if ((req->ai_flags & AI_CANONNAME) != 0
-		      && res->canon == NULL)
-		    {
--		      char *canonbuf = getcanonname (nip, res->at, name);
-+		      char *canonbuf = getcanonname (nip, res->h_name, name);
-		      if (canonbuf == NULL)
-			{
-			  __resolv_context_put (res_ctx);
---
-2.39.3
-
diff --git a/meta/recipes-core/glibc/glibc_2.37.bb b/meta/recipes-core/glibc/glibc_2.37.bb
index bce566acd4..3387441cad 100644
--- a/meta/recipes-core/glibc/glibc_2.37.bb
+++ b/meta/recipes-core/glibc/glibc_2.37.bb
@@ -49,8 +49,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
-           file://0023-CVE-2023-4527.patch \
-           file://0024-CVE-2023-4806.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.39.0


