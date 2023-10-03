Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6837CE776F4
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 03:09:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.100711.1696302578494213194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 20:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NY8V7DKQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=86407c7a81=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3932jT6A021271
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Oct 2023 20:09:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=8584g1IL9EC5tlE00d
	La72qf5/RLFtwnYJrJCp7v0Lw=; b=NY8V7DKQDdFY/2ktnfpvhzb1eQXNilyGuu
	XiyvBOeHsx09IHC9IIVy8yW8xZyXSrP8SlVEWczqCVu1XIiPOgqOzYPLaG8FGDsu
	shiU8iDZ2MjysygxRdFJiGlJ2FWJPTYGv5OjEFM6GotamnL9ouX2/f/k3tsZeU6+
	mFJr+EBwBYNSWjnuLxIhliKdNKqIhng8EOpVRsOqXRc4XdbFrpXwsgb4QFk1cjDW
	7y/YQBtcL1izRp0HpzySzJUg2EVG52E/ZEPC4dkHGRyf9j6BCxTP0Jjt0b/pXw/x
	1DOzLtB4FRoL2xZXieQR8bSWGdORNUZAYeupj5QqVdjKr5D7y8ow==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3teey0j8vy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 20:09:37 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 39338im7015551
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Oct 2023 20:09:37 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2043.outbound.protection.outlook.com [104.47.73.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3teey0j8vw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Oct 2023 20:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhpSj/WMZxRkhVn58i4DjWIxf4zReRN9EwDJKi2TnW89QNbGh+RuBf0B33eY7Dv2fVA56/c7GrvwcJk1GS43TQHNIOI/WSblhifU4Gktb7f8uTyJp0AXbnVi/baIZ17nqPLh7wBcZ7ATEczaU/PE35yCwkLqvEekOqRSp4BHvtBtsFQGD4Ic6fB1LFMlKtAYpWF8u6kCIqwaGvNlOdGtZiRjYiSQG53Jnml8/Y/56o3Hu/pNOvMYHukcxJ7Md0pJg9FAfXgzQ6+b21WYu/43+svG5VN17PPUBt/csqdiJFpIVe8c/q26Xu+YreB2ZoDom2y8u76TmLTGmodsPXuTww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8584g1IL9EC5tlE00dLa72qf5/RLFtwnYJrJCp7v0Lw=;
 b=JkTb/3zuc56n/zaanZfPE5jFA8MnyyvROl6zg6urFsadJCDDwxFngXekKaMDphYg+R07nJahoRV+cwaOYX2cKZY4bXi4fvLw9nva70lM58OagNWtxsqRBs0BlsqSbz65Q4LdjasYaDgx98uTR78UhXrGVto/tj2qRhmZtc6GLHJmzl0gOV2AxFoAA0mijiDBLO66g+U4lQPlj5afeeCYM0uEsAdK/MEJf4eqcKmXxjdlsasrN614A92VWinHk7l4eem7y/aaWn2Tr/0VnHVqw0cWMS/LqLhWD2kk28/6qK75bA0voaKPlCkvLY8tEDV9swoI2G6gyc6Zm2yZh+8E3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by SJ0PR11MB5021.namprd11.prod.outlook.com (2603:10b6:a03:2dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Tue, 3 Oct
 2023 03:09:33 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::6f95:6ed:cf39:91d]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::6f95:6ed:cf39:91d%3]) with mapi id 15.20.6838.029; Tue, 3 Oct 2023
 03:09:32 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kalappa@windriver.com,
        Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com, steve@sakoman.com
Subject: [PATCH V3] glibc: stable 2.38 branch updates.
Date: Mon,  2 Oct 2023 20:09:17 -0700
Message-Id: <20231003030917.3593279-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0078.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::19) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|SJ0PR11MB5021:EE_
X-MS-Office365-Filtering-Correlation-Id: bb9eb9f8-1082-487e-7552-08dbc3be2a67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S9yb2H730yyYeUwTA8CEX8iS+YopwpKrz2k0NSwMIHz7OFSOyQtjzv1MU39fHQNpiiR5oCuyxkLAb/WalzSi+x2BNNzvu3VwfomLtMPUfsnvim0DLmOjZlyqz34Sxeo0ct8CifVGiZ2hom0XfLKg0vp0VHFhFnyupeW7gGAQ4ujLS/VsqxFxJTMSiJo3OIPhwq8qgoUM2n93LQI96EgK/aOJGHHAsNXIIqD1BlEjXOHZzIv1wwIcynbnH/YONyIa7SO2s5lTM1AKG4oRHPu+52mkj/nIxRRhNcwAbkfW8SmdQiAOP+fKx/jUJoVr0HuQdKoiR+Gp37KVKow+WLx3aD4Dg+pspRlrnI4g0EMqnw2OdFpCtdHpFxgsVWll5QeLZ86fTyxJ2OVV+zVUT8HHaYS5t609eGYPEda9OzcOBrXrQQ6OibNRkHLq+P4msTuh12aqJvSRbMgwuOHltqGMstBdklOfufTWC2OpFJ/qjZOI8asvPL5vkxMtiYjMVtBwSazSduTC7w5ymflYJpfiNX89cee0Wuih3muNYbtJNgh6YGgi2PzEVxefmKLXWAXSTxxmiZOxIMCd+l2V29t5dTcVgl3CW2lGxcf6UQf5x2SETTjx0AE5h/hHw3WF/nyd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(396003)(376002)(39850400004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(6666004)(6506007)(478600001)(52116002)(6486002)(30864003)(38100700002)(38350700002)(86362001)(1076003)(15650500001)(41300700001)(2906002)(6512007)(9686003)(83380400001)(26005)(2616005)(36756003)(66476007)(5660300002)(8936002)(66556008)(8676002)(6916009)(66946007)(316002)(4326008)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NwW6BJwxs0K1n0fkuGZGyPrVWdMTECFejXxNwssrEVWHwlirSrOHMxrdJayK?=
 =?us-ascii?Q?QWV/ZChWVcD0x65qbju+6tM2ZdxQOBD192EBrDgzdp5Wor4v9T8K5Rb+B8kx?=
 =?us-ascii?Q?95rbnX77CtI+5w1MbIBFoPzQNvhewYkWDnT+omAu8Q88E85DxrR7w04mNRS5?=
 =?us-ascii?Q?u6ZEwUFw5iL6pgsEM3+6G4V0CFamsXe8JepWonDtOav2LHT+HgH/2U3rOerg?=
 =?us-ascii?Q?M9ZmPcGh+eFjcTCDlhQcBrMWJjeq0KgDDjtfBL5QIeTInWsfVkRPYksQRfKB?=
 =?us-ascii?Q?p6vsG3dKluSod/BB0duBgwZy5DzIhAga1fd3LElWNKU7t3DpCcRZhwYiAnka?=
 =?us-ascii?Q?AbDDtLS1NPdHPJtTO87nlZU6OuBndauWJprtyRacQz3+ngqscZ9jaBzS1nTf?=
 =?us-ascii?Q?O0L24dAyQfDOmywNHAq7H8oc7Z39Ymi5ufHgMdCLLH+09GSGpYJh+hAztovm?=
 =?us-ascii?Q?wMWkpwOxZIkK9XW9DIx5O6Arf0zTsy+KnYQz7dfyRTKvAMQtZ/iHIaKMbdFZ?=
 =?us-ascii?Q?yagYnWPRVZs3VA38gluvROiSUr9rD+KXFlgv95ML+iyuSHt8SEwY5fiHRoy1?=
 =?us-ascii?Q?tDGZddeajjELzRS4/bDHwADP2AvKvig82+NOXmWqkK0VJe5I4n2D1KHCfEg0?=
 =?us-ascii?Q?YozSnwyfh5RNBPzV8sLB9UtsQzT7Z9rRQomFp87clXiu1xWdqqpehNRe8pcm?=
 =?us-ascii?Q?KA8eC2bEJcSmFceHfnToTAWv4fulo1W+CMTxuzXLqSJpFDZnD/Hm2i7vyh9M?=
 =?us-ascii?Q?5NCnEkzXC8MHe1uaVPh+k8WI2/QyhKSNqe6jGypgIt53QY3jfuR8FiTfdWl7?=
 =?us-ascii?Q?QMWuXW5Y6cm9WGrF9DmfmZQFyXybo3Hz0GBNwgzHpUw3NHCuhL36v0nvkhoQ?=
 =?us-ascii?Q?W5bu3AebQ4nlCqqTvAA4fPL1gBnAPIl4sWk2wBuKR1o9oxOsy57uJtZ/1ZFp?=
 =?us-ascii?Q?WMJACQYqdCqjLToFx98z7akxWXaRGBQfkOP+UoW5MWBPmJHpIntO3yrCdar0?=
 =?us-ascii?Q?hlQ5ghabvVpp4+9wIfz3QbEqrmQzSdlQTTCl1LCxuRagK2HI3pwJcUcV/kBH?=
 =?us-ascii?Q?LYPfu8P1QJrjO/sPu9RbeQvHFve22qcex3PuRVrX+mysysUt4DRDDjS3J6nu?=
 =?us-ascii?Q?V7dkXa25Y3sakzWlK11pC66XJCztTFYS250h9eG8wYRt/8WgfkRcqP8jY9Hz?=
 =?us-ascii?Q?n+De+Tnrc1al8nOZCCEap8IJ5kXpnAbSuxqX8DUNYw2uxv4Pc9Ak6oz+rz3w?=
 =?us-ascii?Q?0kelxIRs6mYoHLARC3ySnfJLjL57zYThPxRIZogA/2slFI+Qf5y1gdjrxsc1?=
 =?us-ascii?Q?Qb+UFwZFQ4baMmB7IM5loP3o57/KSDYDtDmFTOj8DA+GvopFRW/Cha9DBacu?=
 =?us-ascii?Q?vBfbssQWIBCi3/ej+gUFrCf66qquASrstrkC3Qhmnuj/63PbW02mWbhGiLtU?=
 =?us-ascii?Q?WsPLzPY0z9bku6kNj4I3kMz0fl/zOntPJ0LwXP4puNFR44UFEfuH3qdxdotW?=
 =?us-ascii?Q?9NnsBJcU20N0Yndiq3fpzb+xUeBRDUdNoVbKM9PTskvnWxR/zKahsBfCGGuL?=
 =?us-ascii?Q?5kPdpP700Gu2UJKWE8Z59mbHwqBiHw/uJRKN0P6i+5/6z0Ek1wLqdW8RAL0E?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9eb9f8-1082-487e-7552-08dbc3be2a67
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 03:09:32.7158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HyXMQiwh+AloYZWOR9X/nyeb2w5VE1ehcGug//wpyl25n/qQ1gURKaOM7LEh+M4PaK1qVWsPeweCvsTneJhnS3qGmhCwJkt1oVKsgyV4WnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5021
X-Proofpoint-GUID: WiV6QcNptlRh2Ze7nzWhRhSJPtV6eQPn
X-Proofpoint-ORIG-GUID: zGKjnobUAOE82-v9QsdvzCCcTnU4-LZq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-02_16,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310030024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 03:09:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188619

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commits on glibc-2.38 stable branch are updated.
0e1ef6779a (HEAD -> release/2.38/master, origin/release/2.38/master) manual/jobs.texi: Add missing @item EPERM for getpgid
d94461bb86 string: Fix tester build with fortify enable with gcc < 12
63250e9c57 iconv: restore verbosity with unrecognized encoding names (bug 30694)
00ae4f10b5 getaddrinfo: Fix use after free in getcanonname (CVE-2023-4806)
b25508dd77 CVE-2023-4527: Stack read overflow with large TCP responses in no-aaaa mode
89da8bc588 NEWS: Add the 2.38.1 bug list
d3ba6c1333 elf: Move l_init_called_next to old place of l_text_end in link map
750f19526a elf: Remove unused l_text_end field from struct link_map
a3189f66a5 elf: Always call destructors in reverse constructor order (bug 30785)
7ae211a01b elf: Do not run constructors for proxy objects
92201f16cb libio: Fix oversized __io_vtables
5bdef6f27c io: Fix record locking contants for powerpc64 with __USE_FILE_OFFSET64

0024-CVE-2023-4527.patch is dropped

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../glibc/glibc/0024-CVE-2023-4527.patch      | 219 ------------------
 meta/recipes-core/glibc/glibc_2.38.bb         |   1 -
 3 files changed, 1 insertion(+), 221 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-2023-4527.patch

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index a907444f50..f5ebbb2ee6 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.38/master"
 PV = "2.38+git"
-SRCREV_glibc ?= "1aed90c9c8f8be9f68b58e96b6e4cd0fc08eb2b1"
+SRCREV_glibc ?= "0e1ef6779a90bc0f8a05bc367796df2793deecaa"
 SRCREV_localedef ?= "e0eca29583b9e0f62645c4316ced93cf4e4e26e1"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc/0024-CVE-2023-4527.patch b/meta/recipes-core/glibc/glibc/0024-CVE-2023-4527.patch
deleted file mode 100644
index 7d9adf6a66..0000000000
--- a/meta/recipes-core/glibc/glibc/0024-CVE-2023-4527.patch
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
-@@ -126,6 +126,7 @@
-   [30477] libc: [RISCV]: time64 does not work on riscv32
-   [30515] dynamic-link: _dl_find_object incorrectly returns 1 during
-     early startup
-+  [30842] Stack read overflow in getaddrinfo in no-aaaa mode (CVE-2023-4527)
-   [30527] network: resolv_conf lock not unlocked on allocation failure
-   [30550] math: powerpc64le: GCC-specific code for isinf() is being used
-     on clang
-@@ -157,6 +158,12 @@
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
-@@ -102,6 +102,7 @@
-   tst-resolv-invalid-cname \
-   tst-resolv-network \
-   tst-resolv-noaaaa \
-+  tst-resolv-noaaaa-vc \
-   tst-resolv-nondecimal \
-   tst-resolv-res_init-multi \
-   tst-resolv-search \
-@@ -293,6 +294,7 @@
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
-@@ -427,7 +427,7 @@ _nss_dns_gethostbyname4_r (const char *name, struct gaih_addrtuple **pat,
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
diff --git a/meta/recipes-core/glibc/glibc_2.38.bb b/meta/recipes-core/glibc/glibc_2.38.bb
index 237458d066..32ccb888f0 100644
--- a/meta/recipes-core/glibc/glibc_2.38.bb
+++ b/meta/recipes-core/glibc/glibc_2.38.bb
@@ -51,7 +51,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch \
-           file://0024-CVE-2023-4527.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.39.0


