Return-Path: <yongxin.liu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AEE4C19F2D
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 02:47:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.2697.1659667636764041987
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 19:47:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=c+7g4DKq;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5216dd7dc0=yongxin.liu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2752k8oN028760
	for <openembedded-core@lists.openembedded.org>;
 Thu, 4 Aug 2022 19:47:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=CwmRfdbIqIMAtoSp4PJJs8lR1Gi1uS/FFFYMb5ygLHw=;
 b=c+7g4DKqipqysSJ1v+OGutcPE41cwARFX+nrlMM/egGvOux9gpQFBesnEISljkveeqV7
 d8l7KYZNuIZBxohtUlRtqaXfr2RsBjixIsvp0m9m/aELY9rMKQeyzGrWkjhv2A2/omoB
 S5Gxe63cx55SDLm3tzt9b4ivoURQubfLLGcNvmOyUzKzbW6m9BPpbJ/d4CIyD1PJ5cxV
 kHgkftzkXrVU+eA6egsNJeg9OKJmZ7qEXoqFb78WYjsd3Qqz8g5SIRJFmJ9sTEt1Dcdi
 rX+e3tFpwLHUqGaZOZ6u9+xhA6CgB9v2F7D3hhgsWvorGfxDoyWysI001QafPUIBHnPv 7w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hr3xps0b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 19:47:15 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2752lEcb031131
	for <openembedded-core@lists.openembedded.org>;
 Thu, 4 Aug 2022 19:47:14 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hr3xps0b6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Aug 2022 19:47:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kC+KAiCR845eIa/1BpEhtHnSvEzY/DSrIxBvwk7awvnG0j8QQ1Qb+hA6LzhHhQa74zIY/uFRIYxsnRBlhRlxCQzU9jx/D/KpDFuGQMyxU6zR6gmCfothLhZ2axwD9jeL35mRRBFkwMg/TUhcQB1dkgViOLB85arHU/zBi91OBkyN/DA5gnfxc/uAdOGKVq9az1hpmEC4aamGMcorybQAre/2ZljwQm9nGvV8Uv0znlh142NIWc0o2KRieNlBcVPTFVmWs/6MkO3A0Xd6rHr0Qhfo/dCtD2HuzcbUzaVBNCs477JDmZwn5zTQMQAQHp/HyEfnQkfc6S/j5i4nPbW7sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwmRfdbIqIMAtoSp4PJJs8lR1Gi1uS/FFFYMb5ygLHw=;
 b=Mwu5787p+qCfGQrCQPlak1a6aJ8SpJxDxQBjsfAMoadudwDWrwh5Fv/vMbz36i5aXTdZ5QXsEK/n3WLXOKfNwWlFAFyn4UDfVPE+j6aNzr0Hxnj3FttFlmNbzgGNtG/OFzIHXMmryHRxCvGB08wBS5en1H5E+Ut0im1LMuMttvxKZdNUadLQGLfVJB9nfZZ/1WFCgBfW2P3jmTlsEqpE/BoXOlN3Ow0DdW4T0oEsXnK+XPi5C/wEuuCXtaHWj7TSjqAR6d862cVw8208xuWCj8Z3bYSE1XdVahAz/7yYF5fWR8qNeLVAB0Z347CVuoxNqKKdI0S2Ntzrxnyy/qLkMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5175.namprd11.prod.outlook.com (2603:10b6:510:3d::8)
 by CY4PR1101MB2327.namprd11.prod.outlook.com (2603:10b6:903:bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Fri, 5 Aug
 2022 02:47:11 +0000
Received: from PH0PR11MB5175.namprd11.prod.outlook.com
 ([fe80::6c69:8ed6:8e22:199e]) by PH0PR11MB5175.namprd11.prod.outlook.com
 ([fe80::6c69:8ed6:8e22:199e%3]) with mapi id 15.20.5504.015; Fri, 5 Aug 2022
 02:47:10 +0000
From: Yongxin Liu <yongxin.liu@windriver.com>
To: richard.purdie@linuxfoundation.org, steve@sakoman.com,
        openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com
Subject: [OE-core][master][kirkstone][PATCH v2] grub2: fix several CVEs
Date: Fri,  5 Aug 2022 10:42:19 +0800
Message-Id: <20220805024218.56191-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:3:18::14) To PH0PR11MB5175.namprd11.prod.outlook.com
 (2603:10b6:510:3d::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa6fd97c-fe4e-48e0-7ec6-08da768ccb34
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2327:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a0fjzWn8UZwPvUZCX1AY1NGkqzEpNzXu7Pxt2avJZpiA4hudiqkGmTUEogw/bmMN0ZUwJ5/0t7Tazd4r/6qgE2xYs4lWd5MrXOIyRLWlWz3c+Sc5UWuyFps18UoyE++KrMBJibpQOlx6y2/FInHJzHNkvaZAfjW7/Z5y1VB4n+2qLUJvVsTIROBa10glWhv4RK+cfZvFxSzM5mnMK5wgBASdaOlOBLMY6ufy8/qqg+XF6p7fev9C4fJYFDB9ycDqC3uDjJWphqTN8OHzGUlQ0IhDhvRVFMrN2eTgCXH0/emH8XuTxVF4MQuGRRgGOwYQ6oE2sRZQ+JjZDGogCFPnuvaKW36Jsg0UujoapSYkgO0BLTJHrIu3fiEwjcqANuVdR6xudQIieic4wzdmOrDXWoqHXCb1M2sOhD+JtRn4ocrfVj2ytd/lbmlKkCJybhmYGoNfk4/zVAvMdq9KFXIfDJ5zyc9NOpcyy5f006TqtZRpMrO6X1/qeRsoB0chxHpbDTQv3ZicyT6Ycss1LjvwhlxF74MCpQNRtbdxW/jCg0qmyIxVHFCIOmIxxyAb7bVhauP/UHT0Sip5vObTHJPF/SJAhSV8j8/EIJvZ54J/QyZ5MgjrMcuL1zAZq3UCg1F1x/4hrliOA87YWZ+BXt6Aw5ANpG3Ff0C33Ad8nbV2gDxbX+bvLeP5RSoJxpubNbATGiriRNeG/1HT8ZM/yv6wey2sXPkRiQuwOOXMG5jR6S7IeoSGJrMdJPcpJC5zbXTpalJtrzvCiUdYLJ2bmW8tbZyMPHuB4RmhmB78E85jfJw688R0l5YQhgdGehegHdn9hCQoIdHrZRLP0yJxr2c6Z1juETijSiaCT+oJ4wAjjVHV83hUuajyz20HmJsN17VI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5175.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(136003)(396003)(39850400004)(376002)(19627235002)(8676002)(4326008)(6512007)(66946007)(66556008)(66476007)(36756003)(478600001)(83380400001)(5660300002)(6486002)(86362001)(316002)(30864003)(8936002)(44832011)(41300700001)(2906002)(38350700002)(38100700002)(52116002)(186003)(6506007)(1076003)(26005)(107886003)(2616005)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2SLhGRD0kaDs7qlPRR0CxYAejxmb9djWln93CCe8vUaNAaUrGvqNLcox6L6P?=
 =?us-ascii?Q?5SG4FJsRRg8UcIhmTFvVR+Y36OtoZZutj9zaUmcNX2HvZRgPsebRNO8Ey2B9?=
 =?us-ascii?Q?sEgQAlSzYIcIXv6Pmp1mH4VCdrT77pjj/4lworNtV50dc1ri1nZ8AgLIEkY4?=
 =?us-ascii?Q?VPdE6+SwyBZ/19jnxPaNfQUGCT3eOdEYn3qHuwXxWw3b0+eryrtb2K2RFh2s?=
 =?us-ascii?Q?f+TuNmadHscnUI8WnyxMHYMMN7bGkGccKkG0gMPIfon9QDiFZgVz2j1e4Iwj?=
 =?us-ascii?Q?PDXbLAaZSVkqW1hFq0c+0R0HPwjbIKZp/1Ob+w1HL7ducNIgK1PF3WgzjpRc?=
 =?us-ascii?Q?reAle7c+2urK8dFMAVAXndR+XU41A8PL7jOZPxLywX3sPMxXpRgQtw51Ouzl?=
 =?us-ascii?Q?KCZhOJgzghHDn4zYjsVK6eywo+AwbSco5k7z53YDgqXRjK5u0CdrRPpkXrAI?=
 =?us-ascii?Q?ClkKKIoIejuj3nV05QtFkqmaowTLob5OKygOx4WMYP0T83VshqN/1GUQwMVT?=
 =?us-ascii?Q?IeUv5xMjAKlr7IN3+m9zb1c1LTFl0CJtcsbetjehNsxcci91fGPJs5aHv3pF?=
 =?us-ascii?Q?tH8zBBV9pw+uURhVZPw1+1gZpxkjBV0NHZgiTHVvpzl2XG+iAvs25ULouyI9?=
 =?us-ascii?Q?1x+PsMOeonwriHnraf47xpcftEAc1Ux7f8rcHl/5E9PFAflqsMNzWxiqp8wS?=
 =?us-ascii?Q?hxXemROyymbWQD3LvDHKaCaHSg40OfT1Yh616a8l9/pab+EjGwo7YgqSZnPD?=
 =?us-ascii?Q?KgNV6SxQY14UFQRIEyCWvPnYDGowXc+M8J/Dre9p0bLcaM+NcDTdSduvNVBv?=
 =?us-ascii?Q?nBAAOYhG7dNkxv/n/3GoOn172cQ/btSMK7be1TWPjqvx5wEdNCVvxOa+7nfA?=
 =?us-ascii?Q?FdS/LjrtloMmnxWpzv115LuX5K3iJTBKXpzpAZkMKwDohkpFzy+c7l0Cy/sO?=
 =?us-ascii?Q?5SJp8F7+SveAj9VA9WhF6zb935P9raNFoLKj7g0krnbM4RwPk16jq/9JYDQb?=
 =?us-ascii?Q?jOBJNZgaDoadZ3aZtSKqynGEYugCAKgszHhh3cVN5TDuWxp1/Zb2FtoNypVz?=
 =?us-ascii?Q?G79yFas8NiLkmCVfm8lAhxyxEdmKDmdPk6AV/Var6IoVlK54JS5K7lGXGi+D?=
 =?us-ascii?Q?3wtw6AYP/R4yM1XNnATo1dfe2TXSRiY//c9RR8hm2EPYGJPZaO4Qg4TnNrgh?=
 =?us-ascii?Q?a0KBlowyT7jgKd7mB/gxKMrO8KxkLU8FCJUcZUByGXZkw4okkhMfzjr8Qqi7?=
 =?us-ascii?Q?N6/bw1iIuS0ADFzJoOLgY790DnklqtrJ2z4GrJJyz9HmTLyOVjdLtsD5qq0L?=
 =?us-ascii?Q?7JadibZwCgGwrfXPD4Xj+QonTn3Cri7IdErHB7U0DLHSNQsF1WFEUWfMMlIB?=
 =?us-ascii?Q?S3qHnvi7VCqcnqZPEG22nFRZvQCJ1r8nQ6mFSYJhByBDOyEihsu3AgF4XvD1?=
 =?us-ascii?Q?ACJHQkS+sUAG3PD9pMK5iblY8/b52knIz5tFMvop6G+idFMfiS6jzCGz6RGM?=
 =?us-ascii?Q?wGH9CzfId1h5Ckx0ByRcuvBN8TGVjGm38L81LH7vNHlOpjUsT558hBAPvPHE?=
 =?us-ascii?Q?PHoaK0VfYFntoq8De09fCzv/QA8Du2bAVrrZ5vjZwOEdIHuodp80HbMFkAeF?=
 =?us-ascii?Q?vw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aa6fd97c-fe4e-48e0-7ec6-08da768ccb34
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5175.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 02:47:10.8372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2rEHsqYaN3EODM1iPIwKfkHVxzdesX++Obz4YJpeUQYKsr+GWYFcsuWNdAoZuP8tZA6mZMSdymNrMRX2Lgn+8YyGsKijuZWPnzNpx3AdQKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2327
X-Proofpoint-ORIG-GUID: mCZHksTiCM-MltlpTwErywohBBczURVp
X-Proofpoint-GUID: 4pRSZlPiNJL20yq3Z3yw1NfdhEe3IloE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-04_06,2022-08-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208050014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 02:47:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168879

Backport CVE patches from upstream to fix:
  CVE-2021-3695
  CVE-2021-3696
  CVE-2021-3697
  CVE-2022-28733
  CVE-2022-28734
  CVE-2022-28735

Backport the following 5 patches to make CVE patches be applied smoothly.
  video-Remove-trailing-whitespaces.patch
  video-readers-jpeg-Abort-sooner-if-a-read-operation-.patch
  video-readers-jpeg-Refuse-to-handle-multiple-start-o.patch

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---

V1->V2:

Remove CVE-2022-28736 related patches.
CVE-2022-28736 related patches conflict with some grub patches in
meta-secure-core layers. So remove those patches.
Untill we find a better solution, just ignore CVE-2022-28736 for now.

---
 ...g-Drop-greyscale-support-to-fix-heap.patch | 179 +++++
 ...ng-Avoid-heap-OOB-R-W-inserting-huff.patch |  50 ++
 ...peg-Block-int-underflow-wild-pointer.patch |  84 +++
 ...3-net-ip-Do-IP-fragment-maths-safely.patch |  63 ++
 ...or-out-on-headers-with-LF-without-CR.patch |  58 ++
 ...Fix-OOB-write-for-split-http-headers.patch |  56 ++
 ...ct-non-kernel-files-in-the-shim_lock.patch | 111 +++
 .../video-Remove-trailing-whitespaces.patch   | 693 ++++++++++++++++++
 ...eg-Abort-sooner-if-a-read-operation-.patch | 264 +++++++
 ...eg-Refuse-to-handle-multiple-start-o.patch |  53 ++
 meta/recipes-bsp/grub/grub2.inc               |  10 +
 11 files changed, 1621 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3695-video-readers-png-Drop-greyscale-support-to-fix-heap.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3696-video-readers-png-Avoid-heap-OOB-R-W-inserting-huff.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3697-video-readers-jpeg-Block-int-underflow-wild-pointer.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28733-net-ip-Do-IP-fragment-maths-safely.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28734-net-http-Error-out-on-headers-with-LF-without-CR.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28734-net-http-Fix-OOB-write-for-split-http-headers.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28735-kern-efi-sb-Reject-non-kernel-files-in-the-shim_lock.patch
 create mode 100644 meta/recipes-bsp/grub/files/video-Remove-trailing-whitespaces.patch
 create mode 100644 meta/recipes-bsp/grub/files/video-readers-jpeg-Abort-sooner-if-a-read-operation-.patch
 create mode 100644 meta/recipes-bsp/grub/files/video-readers-jpeg-Refuse-to-handle-multiple-start-o.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2021-3695-video-readers-png-Drop-greyscale-support-to-fix-heap.patch b/meta/recipes-bsp/grub/files/CVE-2021-3695-video-readers-png-Drop-greyscale-support-to-fix-heap.patch
new file mode 100644
index 0000000000..7f7bb1acfe
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2021-3695-video-readers-png-Drop-greyscale-support-to-fix-heap.patch
@@ -0,0 +1,179 @@
+From e623866d9286410156e8b9d2c82d6253a1b22d08 Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Tue, 6 Jul 2021 18:51:35 +1000
+Subject: [PATCH] video/readers/png: Drop greyscale support to fix heap
+ out-of-bounds write
+
+A 16-bit greyscale PNG without alpha is processed in the following loop:
+
+      for (i = 0; i < (data->image_width * data->image_height);
+	   i++, d1 += 4, d2 += 2)
+	{
+	  d1[R3] = d2[1];
+	  d1[G3] = d2[1];
+	  d1[B3] = d2[1];
+	}
+
+The increment of d1 is wrong. d1 is incremented by 4 bytes per iteration,
+but there are only 3 bytes allocated for storage. This means that image
+data will overwrite somewhat-attacker-controlled parts of memory - 3 bytes
+out of every 4 following the end of the image.
+
+This has existed since greyscale support was added in 2013 in commit
+3ccf16dff98f (grub-core/video/readers/png.c: Support grayscale).
+
+Saving starfield.png as a 16-bit greyscale image without alpha in the gimp
+and attempting to load it causes grub-emu to crash - I don't think this code
+has ever worked.
+
+Delete all PNG greyscale support.
+
+Fixes: CVE-2021-3695
+
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+CVE: CVE-2021-3695
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=e623866d9286410156e8b9d2c82d6253a1b22d08
+
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ grub-core/video/readers/png.c | 87 +++--------------------------------
+ 1 file changed, 7 insertions(+), 80 deletions(-)
+
+diff --git a/grub-core/video/readers/png.c b/grub-core/video/readers/png.c
+index 35ae553c8..a3161e25b 100644
+--- a/grub-core/video/readers/png.c
++++ b/grub-core/video/readers/png.c
+@@ -100,7 +100,7 @@ struct grub_png_data
+ 
+   unsigned image_width, image_height;
+   int bpp, is_16bit;
+-  int raw_bytes, is_gray, is_alpha, is_palette;
++  int raw_bytes, is_alpha, is_palette;
+   int row_bytes, color_bits;
+   grub_uint8_t *image_data;
+ 
+@@ -296,13 +296,13 @@ grub_png_decode_image_header (struct grub_png_data *data)
+     data->bpp = 3;
+   else
+     {
+-      data->is_gray = 1;
+-      data->bpp = 1;
++      return grub_error (GRUB_ERR_BAD_FILE_TYPE,
++			 "png: color type not supported");
+     }
+ 
+   if ((color_bits != 8) && (color_bits != 16)
+       && (color_bits != 4
+-	  || !(data->is_gray || data->is_palette)))
++	  || !data->is_palette))
+     return grub_error (GRUB_ERR_BAD_FILE_TYPE,
+                        "png: bit depth must be 8 or 16");
+ 
+@@ -331,7 +331,7 @@ grub_png_decode_image_header (struct grub_png_data *data)
+     }
+ 
+ #ifndef GRUB_CPU_WORDS_BIGENDIAN
+-  if (data->is_16bit || data->is_gray || data->is_palette)
++  if (data->is_16bit || data->is_palette)
+ #endif
+     {
+       data->image_data = grub_calloc (data->image_height, data->row_bytes);
+@@ -899,27 +899,8 @@ grub_png_convert_image (struct grub_png_data *data)
+       int shift;
+       int mask = (1 << data->color_bits) - 1;
+       unsigned j;
+-      if (data->is_gray)
+-	{
+-	  /* Generic formula is
+-	     (0xff * i) / ((1U << data->color_bits) - 1)
+-	     but for allowed bit depth of 1, 2 and for it's
+-	     equivalent to
+-	     (0xff / ((1U << data->color_bits) - 1)) * i
+-	     Precompute the multipliers to avoid division.
+-	  */
+-
+-	  const grub_uint8_t multipliers[5] = { 0xff, 0xff, 0x55, 0x24, 0x11 };
+-	  for (i = 0; i < (1U << data->color_bits); i++)
+-	    {
+-	      grub_uint8_t col = multipliers[data->color_bits] * i;
+-	      palette[i][0] = col;
+-	      palette[i][1] = col;
+-	      palette[i][2] = col;
+-	    }
+-	}
+-      else
+-	grub_memcpy (palette, data->palette, 3 << data->color_bits);
++
++      grub_memcpy (palette, data->palette, 3 << data->color_bits);
+       d1c = d1;
+       d2c = d2;
+       for (j = 0; j < data->image_height; j++, d1c += data->image_width * 3,
+@@ -957,60 +938,6 @@ grub_png_convert_image (struct grub_png_data *data)
+       return;
+     }
+ 
+-  if (data->is_gray)
+-    {
+-      switch (data->bpp)
+-	{
+-	case 4:
+-	  /* 16-bit gray with alpha.  */
+-	  for (i = 0; i < (data->image_width * data->image_height);
+-	       i++, d1 += 4, d2 += 4)
+-	    {
+-	      d1[R4] = d2[3];
+-	      d1[G4] = d2[3];
+-	      d1[B4] = d2[3];
+-	      d1[A4] = d2[1];
+-	    }
+-	  break;
+-	case 2:
+-	  if (data->is_16bit)
+-	    /* 16-bit gray without alpha.  */
+-	    {
+-	      for (i = 0; i < (data->image_width * data->image_height);
+-		   i++, d1 += 4, d2 += 2)
+-		{
+-		  d1[R3] = d2[1];
+-		  d1[G3] = d2[1];
+-		  d1[B3] = d2[1];
+-		}
+-	    }
+-	  else
+-	    /* 8-bit gray with alpha.  */
+-	    {
+-	      for (i = 0; i < (data->image_width * data->image_height);
+-		   i++, d1 += 4, d2 += 2)
+-		{
+-		  d1[R4] = d2[1];
+-		  d1[G4] = d2[1];
+-		  d1[B4] = d2[1];
+-		  d1[A4] = d2[0];
+-		}
+-	    }
+-	  break;
+-	  /* 8-bit gray without alpha.  */
+-	case 1:
+-	  for (i = 0; i < (data->image_width * data->image_height);
+-	       i++, d1 += 3, d2++)
+-	    {
+-	      d1[R3] = d2[0];
+-	      d1[G3] = d2[0];
+-	      d1[B3] = d2[0];
+-	    }
+-	  break;
+-	}
+-      return;
+-    }
+-
+     {
+   /* Only copy the upper 8 bit.  */
+ #ifndef GRUB_CPU_WORDS_BIGENDIAN
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2021-3696-video-readers-png-Avoid-heap-OOB-R-W-inserting-huff.patch b/meta/recipes-bsp/grub/files/CVE-2021-3696-video-readers-png-Avoid-heap-OOB-R-W-inserting-huff.patch
new file mode 100644
index 0000000000..f06514e665
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2021-3696-video-readers-png-Avoid-heap-OOB-R-W-inserting-huff.patch
@@ -0,0 +1,50 @@
+From 210245129c932dc9e1c2748d9d35524fb95b5042 Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Tue, 6 Jul 2021 23:25:07 +1000
+Subject: [PATCH] video/readers/png: Avoid heap OOB R/W inserting huff table
+ items
+
+In fuzzing we observed crashes where a code would attempt to be inserted
+into a huffman table before the start, leading to a set of heap OOB reads
+and writes as table entries with negative indices were shifted around and
+the new code written in.
+
+Catch the case where we would underflow the array and bail.
+
+Fixes: CVE-2021-3696
+
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+CVE: CVE-2021-3696
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=210245129c932dc9e1c2748d9d35524fb95b5042
+
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ grub-core/video/readers/png.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/grub-core/video/readers/png.c b/grub-core/video/readers/png.c
+index a3161e25b..d7ed5aa6c 100644
+--- a/grub-core/video/readers/png.c
++++ b/grub-core/video/readers/png.c
+@@ -438,6 +438,13 @@ grub_png_insert_huff_item (struct huff_table *ht, int code, int len)
+   for (i = len; i < ht->max_length; i++)
+     n += ht->maxval[i];
+ 
++  if (n > ht->num_values)
++    {
++      grub_error (GRUB_ERR_BAD_FILE_TYPE,
++		  "png: out of range inserting huffman table item");
++      return;
++    }
++
+   for (i = 0; i < n; i++)
+     ht->values[ht->num_values - i] = ht->values[ht->num_values - i - 1];
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2021-3697-video-readers-jpeg-Block-int-underflow-wild-pointer.patch b/meta/recipes-bsp/grub/files/CVE-2021-3697-video-readers-jpeg-Block-int-underflow-wild-pointer.patch
new file mode 100644
index 0000000000..e9fc52df86
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2021-3697-video-readers-jpeg-Block-int-underflow-wild-pointer.patch
@@ -0,0 +1,84 @@
+From 22a3f97d39f6a10b08ad7fd1cc47c4dcd10413f6 Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Wed, 7 Jul 2021 15:38:19 +1000
+Subject: [PATCH] video/readers/jpeg: Block int underflow -> wild pointer write
+
+Certain 1 px wide images caused a wild pointer write in
+grub_jpeg_ycrcb_to_rgb(). This was caused because in grub_jpeg_decode_data(),
+we have the following loop:
+
+for (; data->r1 < nr1 && (!data->dri || rst);
+     data->r1++, data->bitmap_ptr += (vb * data->image_width - hb * nc1) * 3)
+
+We did not check if vb * width >= hb * nc1.
+
+On a 64-bit platform, if that turns out to be negative, it will underflow,
+be interpreted as unsigned 64-bit, then be added to the 64-bit pointer, so
+we see data->bitmap_ptr jump, e.g.:
+
+0x6180_0000_0480 to
+0x6181_0000_0498
+     ^
+     ~--- carry has occurred and this pointer is now far away from
+          any object.
+
+On a 32-bit platform, it will decrement the pointer, creating a pointer
+that won't crash but will overwrite random data.
+
+Catch the underflow and error out.
+
+Fixes: CVE-2021-3697
+
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+CVE: CVE-2021-3697
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=22a3f97d39f6a10b08ad7fd1cc47c4dcd10413f6
+
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ grub-core/video/readers/jpeg.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/video/readers/jpeg.c b/grub-core/video/readers/jpeg.c
+index 579bbe8a4..09596fbf5 100644
+--- a/grub-core/video/readers/jpeg.c
++++ b/grub-core/video/readers/jpeg.c
+@@ -23,6 +23,7 @@
+ #include <grub/mm.h>
+ #include <grub/misc.h>
+ #include <grub/bufio.h>
++#include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -699,6 +700,7 @@ static grub_err_t
+ grub_jpeg_decode_data (struct grub_jpeg_data *data)
+ {
+   unsigned c1, vb, hb, nr1, nc1;
++  unsigned stride_a, stride_b, stride;
+   int rst = data->dri;
+   grub_err_t err = GRUB_ERR_NONE;
+ 
+@@ -711,8 +713,14 @@ grub_jpeg_decode_data (struct grub_jpeg_data *data)
+     return grub_error (GRUB_ERR_BAD_FILE_TYPE,
+ 		       "jpeg: attempted to decode data before start of stream");
+ 
++  if (grub_mul(vb, data->image_width, &stride_a) ||
++      grub_mul(hb, nc1, &stride_b) ||
++      grub_sub(stride_a, stride_b, &stride))
++    return grub_error (GRUB_ERR_BAD_FILE_TYPE,
++		       "jpeg: cannot decode image with these dimensions");
++
+   for (; data->r1 < nr1 && (!data->dri || rst);
+-       data->r1++, data->bitmap_ptr += (vb * data->image_width - hb * nc1) * 3)
++       data->r1++, data->bitmap_ptr += stride * 3)
+     for (c1 = 0;  c1 < nc1 && (!data->dri || rst);
+ 	c1++, rst--, data->bitmap_ptr += hb * 3)
+       {
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2022-28733-net-ip-Do-IP-fragment-maths-safely.patch b/meta/recipes-bsp/grub/files/CVE-2022-28733-net-ip-Do-IP-fragment-maths-safely.patch
new file mode 100644
index 0000000000..8bf9090f94
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2022-28733-net-ip-Do-IP-fragment-maths-safely.patch
@@ -0,0 +1,63 @@
+From 3e4817538de828319ba6d59ced2fbb9b5ca13287 Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Mon, 20 Dec 2021 19:41:21 +1100
+Subject: [PATCH] net/ip: Do IP fragment maths safely
+
+We can receive packets with invalid IP fragmentation information. This
+can lead to rsm->total_len underflowing and becoming very large.
+
+Then, in grub_netbuff_alloc(), we add to this very large number, which can
+cause it to overflow and wrap back around to a small positive number.
+The allocation then succeeds, but the resulting buffer is too small and
+subsequent operations can write past the end of the buffer.
+
+Catch the underflow here.
+
+Fixes: CVE-2022-28733
+
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+CVE: CVE-2022-28733
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=3e4817538de828319ba6d59ced2fbb9b5ca13287
+
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+
+---
+ grub-core/net/ip.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/net/ip.c b/grub-core/net/ip.c
+index e3d62e97f..3c3d0be0e 100644
+--- a/grub-core/net/ip.c
++++ b/grub-core/net/ip.c
+@@ -25,6 +25,7 @@
+ #include <grub/net/netbuff.h>
+ #include <grub/mm.h>
+ #include <grub/priority_queue.h>
++#include <grub/safemath.h>
+ #include <grub/time.h>
+ 
+ struct iphdr {
+@@ -512,7 +513,14 @@ grub_net_recv_ip4_packets (struct grub_net_buff *nb,
+     {
+       rsm->total_len = (8 * (grub_be_to_cpu16 (iph->frags) & OFFSET_MASK)
+ 			+ (nb->tail - nb->data));
+-      rsm->total_len -= ((iph->verhdrlen & 0xf) * sizeof (grub_uint32_t));
++
++      if (grub_sub (rsm->total_len, (iph->verhdrlen & 0xf) * sizeof (grub_uint32_t),
++		    &rsm->total_len))
++	{
++	  grub_dprintf ("net", "IP reassembly size underflow\n");
++	  return GRUB_ERR_NONE;
++	}
++
+       rsm->asm_netbuff = grub_netbuff_alloc (rsm->total_len);
+       if (!rsm->asm_netbuff)
+ 	{
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2022-28734-net-http-Error-out-on-headers-with-LF-without-CR.patch b/meta/recipes-bsp/grub/files/CVE-2022-28734-net-http-Error-out-on-headers-with-LF-without-CR.patch
new file mode 100644
index 0000000000..f31167d315
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2022-28734-net-http-Error-out-on-headers-with-LF-without-CR.patch
@@ -0,0 +1,58 @@
+From b26b4c08e7119281ff30d0fb4a6169bd2afa8fe4 Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Tue, 8 Mar 2022 19:04:40 +1100
+Subject: [PATCH] net/http: Error out on headers with LF without CR
+
+In a similar vein to the previous patch, parse_line() would write
+a NUL byte past the end of the buffer if there was an HTTP header
+with a LF rather than a CRLF.
+
+RFC-2616 says:
+
+  Many HTTP/1.1 header field values consist of words separated by LWS
+  or special characters. These special characters MUST be in a quoted
+  string to be used within a parameter value (as defined in section 3.6).
+
+We don't support quoted sections or continuation lines, etc.
+
+If we see an LF that's not part of a CRLF, bail out.
+
+Fixes: CVE-2022-28734
+
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+CVE: CVE-2022-28734
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=b26b4c08e7119281ff30d0fb4a6169bd2afa8fe4
+
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ grub-core/net/http.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/grub-core/net/http.c b/grub-core/net/http.c
+index 33a0a28c4..9291a13e2 100644
+--- a/grub-core/net/http.c
++++ b/grub-core/net/http.c
+@@ -68,7 +68,15 @@ parse_line (grub_file_t file, http_data_t data, char *ptr, grub_size_t len)
+   char *end = ptr + len;
+   while (end > ptr && *(end - 1) == '\r')
+     end--;
++
++  /* LF without CR. */
++  if (end == ptr + len)
++    {
++      data->errmsg = grub_strdup (_("invalid HTTP header - LF without CR"));
++      return GRUB_ERR_NONE;
++    }
+   *end = 0;
++
+   /* Trailing CRLF.  */
+   if (data->in_chunk_len == 1)
+     {
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2022-28734-net-http-Fix-OOB-write-for-split-http-headers.patch b/meta/recipes-bsp/grub/files/CVE-2022-28734-net-http-Fix-OOB-write-for-split-http-headers.patch
new file mode 100644
index 0000000000..e0ca1eec44
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2022-28734-net-http-Fix-OOB-write-for-split-http-headers.patch
@@ -0,0 +1,56 @@
+From ec6bfd3237394c1c7dbf2fd73417173318d22f4b Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Tue, 8 Mar 2022 18:17:03 +1100
+Subject: [PATCH] net/http: Fix OOB write for split http headers
+
+GRUB has special code for handling an http header that is split
+across two packets.
+
+The code tracks the end of line by looking for a "\n" byte. The
+code for split headers has always advanced the pointer just past the
+end of the line, whereas the code that handles unsplit headers does
+not advance the pointer. This extra advance causes the length to be
+one greater, which breaks an assumption in parse_line(), leading to
+it writing a NUL byte one byte past the end of the buffer where we
+reconstruct the line from the two packets.
+
+It's conceivable that an attacker controlled set of packets could
+cause this to zero out the first byte of the "next" pointer of the
+grub_mm_region structure following the current_line buffer.
+
+Do not advance the pointer in the split header case.
+
+Fixes: CVE-2022-28734
+
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+CVE: CVE-2022-28734
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=ec6bfd3237394c1c7dbf2fd73417173318d22f4b
+
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ grub-core/net/http.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/grub-core/net/http.c b/grub-core/net/http.c
+index f8d7bf0cd..33a0a28c4 100644
+--- a/grub-core/net/http.c
++++ b/grub-core/net/http.c
+@@ -190,9 +190,7 @@ http_receive (grub_net_tcp_socket_t sock __attribute__ ((unused)),
+ 	  int have_line = 1;
+ 	  char *t;
+ 	  ptr = grub_memchr (nb->data, '\n', nb->tail - nb->data);
+-	  if (ptr)
+-	    ptr++;
+-	  else
++	  if (ptr == NULL)
+ 	    {
+ 	      have_line = 0;
+ 	      ptr = (char *) nb->tail;
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2022-28735-kern-efi-sb-Reject-non-kernel-files-in-the-shim_lock.patch b/meta/recipes-bsp/grub/files/CVE-2022-28735-kern-efi-sb-Reject-non-kernel-files-in-the-shim_lock.patch
new file mode 100644
index 0000000000..7a59f10bfb
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2022-28735-kern-efi-sb-Reject-non-kernel-files-in-the-shim_lock.patch
@@ -0,0 +1,111 @@
+From 6fe755c5c07bb386fda58306bfd19e4a1c974c53 Mon Sep 17 00:00:00 2001
+From: Julian Andres Klode <julian.klode@canonical.com>
+Date: Thu, 2 Dec 2021 15:03:53 +0100
+Subject: [PATCH] kern/efi/sb: Reject non-kernel files in the shim_lock
+ verifier
+
+We must not allow other verifiers to pass things like the GRUB modules.
+Instead of maintaining a blocklist, maintain an allowlist of things
+that we do not care about.
+
+This allowlist really should be made reusable, and shared by the
+lockdown verifier, but this is the minimal patch addressing
+security concerns where the TPM verifier was able to mark modules
+as verified (or the OpenPGP verifier for that matter), when it
+should not do so on shim-powered secure boot systems.
+
+Fixes: CVE-2022-28735
+
+Signed-off-by: Julian Andres Klode <julian.klode@canonical.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+CVE:CVE-2022-28735
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=6fe755c5c07bb386fda58306bfd19e4a1c974c53
+
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ grub-core/kern/efi/sb.c | 39 ++++++++++++++++++++++++++++++++++++---
+ include/grub/verify.h   |  1 +
+ 2 files changed, 37 insertions(+), 3 deletions(-)
+
+diff --git a/grub-core/kern/efi/sb.c b/grub-core/kern/efi/sb.c
+index c52ec6226..89c4bb3fd 100644
+--- a/grub-core/kern/efi/sb.c
++++ b/grub-core/kern/efi/sb.c
+@@ -119,10 +119,11 @@ shim_lock_verifier_init (grub_file_t io __attribute__ ((unused)),
+ 			 void **context __attribute__ ((unused)),
+ 			 enum grub_verify_flags *flags)
+ {
+-  *flags = GRUB_VERIFY_FLAGS_SKIP_VERIFICATION;
++  *flags = GRUB_VERIFY_FLAGS_NONE;
+ 
+   switch (type & GRUB_FILE_TYPE_MASK)
+     {
++    /* Files we check. */
+     case GRUB_FILE_TYPE_LINUX_KERNEL:
+     case GRUB_FILE_TYPE_MULTIBOOT_KERNEL:
+     case GRUB_FILE_TYPE_BSD_KERNEL:
+@@ -130,11 +131,43 @@ shim_lock_verifier_init (grub_file_t io __attribute__ ((unused)),
+     case GRUB_FILE_TYPE_PLAN9_KERNEL:
+     case GRUB_FILE_TYPE_EFI_CHAINLOADED_IMAGE:
+       *flags = GRUB_VERIFY_FLAGS_SINGLE_CHUNK;
++      return GRUB_ERR_NONE;
+ 
+-      /* Fall through. */
++    /* Files that do not affect secureboot state. */
++    case GRUB_FILE_TYPE_NONE:
++    case GRUB_FILE_TYPE_LOOPBACK:
++    case GRUB_FILE_TYPE_LINUX_INITRD:
++    case GRUB_FILE_TYPE_OPENBSD_RAMDISK:
++    case GRUB_FILE_TYPE_XNU_RAMDISK:
++    case GRUB_FILE_TYPE_SIGNATURE:
++    case GRUB_FILE_TYPE_PUBLIC_KEY:
++    case GRUB_FILE_TYPE_PUBLIC_KEY_TRUST:
++    case GRUB_FILE_TYPE_PRINT_BLOCKLIST:
++    case GRUB_FILE_TYPE_TESTLOAD:
++    case GRUB_FILE_TYPE_GET_SIZE:
++    case GRUB_FILE_TYPE_FONT:
++    case GRUB_FILE_TYPE_ZFS_ENCRYPTION_KEY:
++    case GRUB_FILE_TYPE_CAT:
++    case GRUB_FILE_TYPE_HEXCAT:
++    case GRUB_FILE_TYPE_CMP:
++    case GRUB_FILE_TYPE_HASHLIST:
++    case GRUB_FILE_TYPE_TO_HASH:
++    case GRUB_FILE_TYPE_KEYBOARD_LAYOUT:
++    case GRUB_FILE_TYPE_PIXMAP:
++    case GRUB_FILE_TYPE_GRUB_MODULE_LIST:
++    case GRUB_FILE_TYPE_CONFIG:
++    case GRUB_FILE_TYPE_THEME:
++    case GRUB_FILE_TYPE_GETTEXT_CATALOG:
++    case GRUB_FILE_TYPE_FS_SEARCH:
++    case GRUB_FILE_TYPE_LOADENV:
++    case GRUB_FILE_TYPE_SAVEENV:
++    case GRUB_FILE_TYPE_VERIFY_SIGNATURE:
++      *flags = GRUB_VERIFY_FLAGS_SKIP_VERIFICATION;
++      return GRUB_ERR_NONE;
+ 
++    /* Other files. */
+     default:
+-      return GRUB_ERR_NONE;
++      return grub_error (GRUB_ERR_ACCESS_DENIED, N_("prohibited by secure boot policy"));
+     }
+ }
+ 
+diff --git a/include/grub/verify.h b/include/grub/verify.h
+index cd129c398..672ae1692 100644
+--- a/include/grub/verify.h
++++ b/include/grub/verify.h
+@@ -24,6 +24,7 @@
+ 
+ enum grub_verify_flags
+   {
++    GRUB_VERIFY_FLAGS_NONE		= 0,
+     GRUB_VERIFY_FLAGS_SKIP_VERIFICATION	= 1,
+     GRUB_VERIFY_FLAGS_SINGLE_CHUNK	= 2,
+     /* Defer verification to another authority. */
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/files/video-Remove-trailing-whitespaces.patch b/meta/recipes-bsp/grub/files/video-Remove-trailing-whitespaces.patch
new file mode 100644
index 0000000000..2db9bcbbc5
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/video-Remove-trailing-whitespaces.patch
@@ -0,0 +1,693 @@
+From 1f48917d8ddb490dcdc70176e0f58136b7f7811a Mon Sep 17 00:00:00 2001
+From: Elyes Haouas <ehaouas@noos.fr>
+Date: Fri, 4 Mar 2022 07:42:13 +0100
+Subject: [PATCH] video: Remove trailing whitespaces
+
+Signed-off-by: Elyes Haouas <ehaouas@noos.fr>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=1f48917d8ddb490dcdc70176e0f58136b7f7811a
+
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ grub-core/video/bochs.c             |  2 +-
+ grub-core/video/capture.c           |  2 +-
+ grub-core/video/cirrus.c            |  4 ++--
+ grub-core/video/coreboot/cbfb.c     |  2 +-
+ grub-core/video/efi_gop.c           | 22 +++++++++----------
+ grub-core/video/fb/fbblit.c         |  8 +++----
+ grub-core/video/fb/video_fb.c       | 10 ++++-----
+ grub-core/video/i386/pc/vbe.c       | 34 ++++++++++++++---------------
+ grub-core/video/i386/pc/vga.c       |  6 ++---
+ grub-core/video/ieee1275.c          |  4 ++--
+ grub-core/video/radeon_fuloong2e.c  |  6 ++---
+ grub-core/video/radeon_yeeloong3a.c |  6 ++---
+ grub-core/video/readers/png.c       |  2 +-
+ grub-core/video/readers/tga.c       |  2 +-
+ grub-core/video/sis315_init.c       |  2 +-
+ grub-core/video/sis315pro.c         |  8 +++----
+ grub-core/video/sm712.c             | 10 ++++-----
+ grub-core/video/video.c             |  8 +++----
+ 18 files changed, 69 insertions(+), 69 deletions(-)
+
+diff --git a/grub-core/video/bochs.c b/grub-core/video/bochs.c
+index 30ea1bd82..edc651697 100644
+--- a/grub-core/video/bochs.c
++++ b/grub-core/video/bochs.c
+@@ -212,7 +212,7 @@ find_card (grub_pci_device_t dev, grub_pci_id_t pciid, void *data)
+ 
+   if (((class >> 16) & 0xffff) != 0x0300 || pciid != 0x11111234)
+     return 0;
+-  
++
+   addr = grub_pci_make_address (dev, GRUB_PCI_REG_ADDRESS_REG0);
+   framebuffer.base = grub_pci_read (addr) & GRUB_PCI_ADDR_MEM_MASK;
+   if (!framebuffer.base)
+diff --git a/grub-core/video/capture.c b/grub-core/video/capture.c
+index 4d3195e01..c653d89f9 100644
+--- a/grub-core/video/capture.c
++++ b/grub-core/video/capture.c
+@@ -92,7 +92,7 @@ grub_video_capture_start (const struct grub_video_mode_info *mode_info,
+   framebuffer.ptr = grub_calloc (framebuffer.mode_info.height, framebuffer.mode_info.pitch);
+   if (!framebuffer.ptr)
+     return grub_errno;
+-  
++
+   err = grub_video_fb_create_render_target_from_pointer (&framebuffer.render_target,
+ 							 &framebuffer.mode_info,
+ 							 framebuffer.ptr);
+diff --git a/grub-core/video/cirrus.c b/grub-core/video/cirrus.c
+index e2149e8ce..f5542ccdc 100644
+--- a/grub-core/video/cirrus.c
++++ b/grub-core/video/cirrus.c
+@@ -354,11 +354,11 @@ grub_video_cirrus_setup (unsigned int width, unsigned int height,
+     grub_uint8_t sr_ext = 0, hidden_dac = 0;
+ 
+     grub_vga_set_geometry (&config, grub_vga_cr_write);
+-    
++
+     grub_vga_gr_write (GRUB_VGA_GR_MODE_256_COLOR | GRUB_VGA_GR_MODE_READ_MODE1,
+ 		       GRUB_VGA_GR_MODE);
+     grub_vga_gr_write (GRUB_VGA_GR_GR6_GRAPHICS_MODE, GRUB_VGA_GR_GR6);
+-    
++
+     grub_vga_sr_write (GRUB_VGA_SR_MEMORY_MODE_NORMAL, GRUB_VGA_SR_MEMORY_MODE);
+ 
+     grub_vga_cr_write ((config.pitch >> CIRRUS_CR_EXTENDED_DISPLAY_PITCH_SHIFT)
+diff --git a/grub-core/video/coreboot/cbfb.c b/grub-core/video/coreboot/cbfb.c
+index 9af81fa5b..986003c51 100644
+--- a/grub-core/video/coreboot/cbfb.c
++++ b/grub-core/video/coreboot/cbfb.c
+@@ -106,7 +106,7 @@ grub_video_cbfb_setup (unsigned int width, unsigned int height,
+ 
+   grub_video_fb_set_palette (0, GRUB_VIDEO_FBSTD_NUMCOLORS,
+ 			     grub_video_fbstd_colors);
+-    
++
+   return err;
+ }
+ 
+diff --git a/grub-core/video/efi_gop.c b/grub-core/video/efi_gop.c
+index b7590dc6c..7a5054631 100644
+--- a/grub-core/video/efi_gop.c
++++ b/grub-core/video/efi_gop.c
+@@ -273,7 +273,7 @@ grub_video_gop_iterate (int (*hook) (const struct grub_video_mode_info *info, vo
+       grub_efi_status_t status;
+       struct grub_efi_gop_mode_info *info = NULL;
+       struct grub_video_mode_info mode_info;
+-	 
++
+       status = efi_call_4 (gop->query_mode, gop, mode, &size, &info);
+ 
+       if (status)
+@@ -390,7 +390,7 @@ grub_video_gop_setup (unsigned int width, unsigned int height,
+ 	  found = 1;
+ 	}
+     }
+- 
++
+   if (!found)
+     {
+       unsigned mode;
+@@ -399,7 +399,7 @@ grub_video_gop_setup (unsigned int width, unsigned int height,
+ 	{
+ 	  grub_efi_uintn_t size;
+ 	  grub_efi_status_t status;
+-	 
++
+ 	  status = efi_call_4 (gop->query_mode, gop, mode, &size, &info);
+ 	  if (status)
+ 	    {
+@@ -472,11 +472,11 @@ grub_video_gop_setup (unsigned int width, unsigned int height,
+   framebuffer.ptr = (void *) (grub_addr_t) gop->mode->fb_base;
+   framebuffer.offscreen
+     = grub_malloc (framebuffer.mode_info.height
+-		   * framebuffer.mode_info.width 
++		   * framebuffer.mode_info.width
+ 		   * sizeof (struct grub_efi_gop_blt_pixel));
+ 
+   buffer = framebuffer.offscreen;
+-      
++
+   if (!buffer)
+     {
+       grub_dprintf ("video", "GOP: couldn't allocate shadow\n");
+@@ -485,11 +485,11 @@ grub_video_gop_setup (unsigned int width, unsigned int height,
+ 				     &framebuffer.mode_info);
+       buffer = framebuffer.ptr;
+     }
+-    
++
+   grub_dprintf ("video", "GOP: initialising FB @ %p %dx%dx%d\n",
+ 		framebuffer.ptr, framebuffer.mode_info.width,
+ 		framebuffer.mode_info.height, framebuffer.mode_info.bpp);
+- 
++
+   err = grub_video_fb_create_render_target_from_pointer
+     (&framebuffer.render_target, &framebuffer.mode_info, buffer);
+ 
+@@ -498,15 +498,15 @@ grub_video_gop_setup (unsigned int width, unsigned int height,
+       grub_dprintf ("video", "GOP: Couldn't create FB target\n");
+       return err;
+     }
+- 
++
+   err = grub_video_fb_set_active_render_target (framebuffer.render_target);
+- 
++
+   if (err)
+     {
+       grub_dprintf ("video", "GOP: Couldn't set FB target\n");
+       return err;
+     }
+- 
++
+   err = grub_video_fb_set_palette (0, GRUB_VIDEO_FBSTD_NUMCOLORS,
+ 				   grub_video_fbstd_colors);
+ 
+@@ -514,7 +514,7 @@ grub_video_gop_setup (unsigned int width, unsigned int height,
+     grub_dprintf ("video", "GOP: Couldn't set palette\n");
+   else
+     grub_dprintf ("video", "GOP: Success\n");
+- 
++
+   return err;
+ }
+ 
+diff --git a/grub-core/video/fb/fbblit.c b/grub-core/video/fb/fbblit.c
+index d55924837..1010ef393 100644
+--- a/grub-core/video/fb/fbblit.c
++++ b/grub-core/video/fb/fbblit.c
+@@ -466,7 +466,7 @@ grub_video_fbblit_replace_24bit_indexa (struct grub_video_fbblit_info *dst,
+       for (i = 0; i < width; i++)
+         {
+ 	  register grub_uint32_t col;
+-	  if (*srcptr == 0xf0)	      
++	  if (*srcptr == 0xf0)
+ 	    col = palette[16];
+ 	  else
+ 	    col = palette[*srcptr & 0xf];
+@@ -478,7 +478,7 @@ grub_video_fbblit_replace_24bit_indexa (struct grub_video_fbblit_info *dst,
+ 	  *dstptr++ = col >> 0;
+ 	  *dstptr++ = col >> 8;
+ 	  *dstptr++ = col >> 16;
+-#endif	  
++#endif
+ 	  srcptr++;
+         }
+ 
+@@ -651,7 +651,7 @@ grub_video_fbblit_blend_24bit_indexa (struct grub_video_fbblit_info *dst,
+       for (i = 0; i < width; i++)
+         {
+ 	  register grub_uint32_t col;
+-	  if (*srcptr != 0xf0)	      
++	  if (*srcptr != 0xf0)
+ 	    {
+ 	      col = palette[*srcptr & 0xf];
+ #ifdef GRUB_CPU_WORDS_BIGENDIAN
+@@ -662,7 +662,7 @@ grub_video_fbblit_blend_24bit_indexa (struct grub_video_fbblit_info *dst,
+ 	      *dstptr++ = col >> 0;
+ 	      *dstptr++ = col >> 8;
+ 	      *dstptr++ = col >> 16;
+-#endif	  
++#endif
+ 	    }
+ 	  else
+ 	    dstptr += 3;
+diff --git a/grub-core/video/fb/video_fb.c b/grub-core/video/fb/video_fb.c
+index ae6b89f9a..fa4ebde26 100644
+--- a/grub-core/video/fb/video_fb.c
++++ b/grub-core/video/fb/video_fb.c
+@@ -754,7 +754,7 @@ grub_video_fb_unmap_color_int (struct grub_video_fbblit_info * source,
+           *alpha = 0;
+           return;
+         }
+-	
++
+       /* If we have an out-of-bounds color, return transparent black.  */
+       if (color > 255)
+         {
+@@ -1141,7 +1141,7 @@ grub_video_fb_scroll (grub_video_color_t color, int dx, int dy)
+       /* If everything is aligned on 32-bit use 32-bit copy.  */
+       if ((grub_addr_t) grub_video_fb_get_video_ptr (&target, src_x, src_y)
+ 	  % sizeof (grub_uint32_t) == 0
+-	  && (grub_addr_t) grub_video_fb_get_video_ptr (&target, dst_x, dst_y) 
++	  && (grub_addr_t) grub_video_fb_get_video_ptr (&target, dst_x, dst_y)
+ 	  % sizeof (grub_uint32_t) == 0
+ 	  && linelen % sizeof (grub_uint32_t) == 0
+ 	  && linedelta % sizeof (grub_uint32_t) == 0)
+@@ -1155,7 +1155,7 @@ grub_video_fb_scroll (grub_video_color_t color, int dx, int dy)
+       else if ((grub_addr_t) grub_video_fb_get_video_ptr (&target, src_x, src_y)
+ 	       % sizeof (grub_uint16_t) == 0
+ 	       && (grub_addr_t) grub_video_fb_get_video_ptr (&target,
+-							     dst_x, dst_y) 
++							     dst_x, dst_y)
+ 	       % sizeof (grub_uint16_t) == 0
+ 	       && linelen % sizeof (grub_uint16_t) == 0
+ 	       && linedelta % sizeof (grub_uint16_t) == 0)
+@@ -1170,7 +1170,7 @@ grub_video_fb_scroll (grub_video_color_t color, int dx, int dy)
+ 	{
+ 	  grub_uint8_t *src, *dst;
+ 	  DO_SCROLL
+-	}	
++	}
+     }
+ 
+   /* 4. Fill empty space with specified color.  In this implementation
+@@ -1615,7 +1615,7 @@ grub_video_fb_setup (unsigned int mode_type, unsigned int mode_mask,
+ 	  framebuffer.render_target = framebuffer.back_target;
+ 	  return GRUB_ERR_NONE;
+ 	}
+-      
++
+       mode_info->mode_type &= ~(GRUB_VIDEO_MODE_TYPE_DOUBLE_BUFFERED
+ 				| GRUB_VIDEO_MODE_TYPE_UPDATING_SWAP);
+ 
+diff --git a/grub-core/video/i386/pc/vbe.c b/grub-core/video/i386/pc/vbe.c
+index b7f911926..0e65b5206 100644
+--- a/grub-core/video/i386/pc/vbe.c
++++ b/grub-core/video/i386/pc/vbe.c
+@@ -219,7 +219,7 @@ grub_vbe_disable_mtrr (int mtrr)
+ }
+ 
+ /* Call VESA BIOS 0x4f09 to set palette data, return status.  */
+-static grub_vbe_status_t 
++static grub_vbe_status_t
+ grub_vbe_bios_set_palette_data (grub_uint32_t color_count,
+ 				grub_uint32_t start_index,
+ 				struct grub_vbe_palette_data *palette_data)
+@@ -237,7 +237,7 @@ grub_vbe_bios_set_palette_data (grub_uint32_t color_count,
+ }
+ 
+ /* Call VESA BIOS 0x4f00 to get VBE Controller Information, return status.  */
+-grub_vbe_status_t 
++grub_vbe_status_t
+ grub_vbe_bios_get_controller_info (struct grub_vbe_info_block *ci)
+ {
+   struct grub_bios_int_registers regs;
+@@ -251,7 +251,7 @@ grub_vbe_bios_get_controller_info (struct grub_vbe_info_block *ci)
+ }
+ 
+ /* Call VESA BIOS 0x4f01 to get VBE Mode Information, return status.  */
+-grub_vbe_status_t 
++grub_vbe_status_t
+ grub_vbe_bios_get_mode_info (grub_uint32_t mode,
+ 			     struct grub_vbe_mode_info_block *mode_info)
+ {
+@@ -285,7 +285,7 @@ grub_vbe_bios_set_mode (grub_uint32_t mode,
+ }
+ 
+ /* Call VESA BIOS 0x4f03 to return current VBE Mode, return status.  */
+-grub_vbe_status_t 
++grub_vbe_status_t
+ grub_vbe_bios_get_mode (grub_uint32_t *mode)
+ {
+   struct grub_bios_int_registers regs;
+@@ -298,7 +298,7 @@ grub_vbe_bios_get_mode (grub_uint32_t *mode)
+   return regs.eax & 0xffff;
+ }
+ 
+-grub_vbe_status_t 
++grub_vbe_status_t
+ grub_vbe_bios_getset_dac_palette_width (int set, int *dac_mask_size)
+ {
+   struct grub_bios_int_registers regs;
+@@ -346,7 +346,7 @@ grub_vbe_bios_get_memory_window (grub_uint32_t window,
+ }
+ 
+ /* Call VESA BIOS 0x4f06 to set scanline length (in bytes), return status.  */
+-grub_vbe_status_t 
++grub_vbe_status_t
+ grub_vbe_bios_set_scanline_length (grub_uint32_t length)
+ {
+   struct grub_bios_int_registers regs;
+@@ -354,14 +354,14 @@ grub_vbe_bios_set_scanline_length (grub_uint32_t length)
+   regs.ecx = length;
+   regs.eax = 0x4f06;
+   /* BL = 2, Set Scan Line in Bytes.  */
+-  regs.ebx = 0x0002;	
++  regs.ebx = 0x0002;
+   regs.flags = GRUB_CPU_INT_FLAGS_DEFAULT;
+   grub_bios_interrupt (0x10, &regs);
+   return regs.eax & 0xffff;
+ }
+ 
+ /* Call VESA BIOS 0x4f06 to return scanline length (in bytes), return status.  */
+-grub_vbe_status_t 
++grub_vbe_status_t
+ grub_vbe_bios_get_scanline_length (grub_uint32_t *length)
+ {
+   struct grub_bios_int_registers regs;
+@@ -377,7 +377,7 @@ grub_vbe_bios_get_scanline_length (grub_uint32_t *length)
+ }
+ 
+ /* Call VESA BIOS 0x4f07 to set display start, return status.  */
+-static grub_vbe_status_t 
++static grub_vbe_status_t
+ grub_vbe_bios_set_display_start (grub_uint32_t x, grub_uint32_t y)
+ {
+   struct grub_bios_int_registers regs;
+@@ -390,7 +390,7 @@ grub_vbe_bios_set_display_start (grub_uint32_t x, grub_uint32_t y)
+   regs.edx = y;
+   regs.eax = 0x4f07;
+   /* BL = 80h, Set Display Start during Vertical Retrace.  */
+-  regs.ebx = 0x0080;	
++  regs.ebx = 0x0080;
+   regs.flags = GRUB_CPU_INT_FLAGS_DEFAULT;
+   grub_bios_interrupt (0x10, &regs);
+ 
+@@ -401,7 +401,7 @@ grub_vbe_bios_set_display_start (grub_uint32_t x, grub_uint32_t y)
+ }
+ 
+ /* Call VESA BIOS 0x4f07 to get display start, return status.  */
+-grub_vbe_status_t 
++grub_vbe_status_t
+ grub_vbe_bios_get_display_start (grub_uint32_t *x,
+ 				 grub_uint32_t *y)
+ {
+@@ -419,7 +419,7 @@ grub_vbe_bios_get_display_start (grub_uint32_t *x,
+ }
+ 
+ /* Call VESA BIOS 0x4f0a.  */
+-grub_vbe_status_t 
++grub_vbe_status_t
+ grub_vbe_bios_get_pm_interface (grub_uint16_t *segment, grub_uint16_t *offset,
+ 				grub_uint16_t *length)
+ {
+@@ -896,7 +896,7 @@ vbe2videoinfo (grub_uint32_t mode,
+     case GRUB_VBE_MEMORY_MODEL_YUV:
+       mode_info->mode_type |= GRUB_VIDEO_MODE_TYPE_YUV;
+       break;
+-      
++
+     case GRUB_VBE_MEMORY_MODEL_DIRECT_COLOR:
+       mode_info->mode_type |= GRUB_VIDEO_MODE_TYPE_RGB;
+       break;
+@@ -923,10 +923,10 @@ vbe2videoinfo (grub_uint32_t mode,
+       break;
+     case 8:
+       mode_info->bytes_per_pixel = 1;
+-      break;  
++      break;
+     case 4:
+       mode_info->bytes_per_pixel = 0;
+-      break;  
++      break;
+     }
+ 
+   if (controller_info.version >= 0x300)
+@@ -976,7 +976,7 @@ grub_video_vbe_iterate (int (*hook) (const struct grub_video_mode_info *info, vo
+ 
+ static grub_err_t
+ grub_video_vbe_setup (unsigned int width, unsigned int height,
+-                      grub_video_mode_type_t mode_type, 
++                      grub_video_mode_type_t mode_type,
+ 		      grub_video_mode_type_t mode_mask)
+ {
+   grub_uint16_t *p;
+@@ -1193,7 +1193,7 @@ grub_video_vbe_print_adapter_specific_info (void)
+ 		controller_info.version & 0xFF,
+ 		controller_info.oem_software_rev >> 8,
+ 		controller_info.oem_software_rev & 0xFF);
+-  
++
+   /* The total_memory field is in 64 KiB units.  */
+   grub_printf_ (N_("              total memory: %d KiB\n"),
+ 		(controller_info.total_memory << 6));
+diff --git a/grub-core/video/i386/pc/vga.c b/grub-core/video/i386/pc/vga.c
+index b2f776c99..50d0b5e02 100644
+--- a/grub-core/video/i386/pc/vga.c
++++ b/grub-core/video/i386/pc/vga.c
+@@ -48,7 +48,7 @@ static struct
+   int back_page;
+ } framebuffer;
+ 
+-static unsigned char 
++static unsigned char
+ grub_vga_set_mode (unsigned char mode)
+ {
+   struct grub_bios_int_registers regs;
+@@ -182,10 +182,10 @@ grub_video_vga_setup (unsigned int width, unsigned int height,
+ 
+   is_target = 1;
+   err = grub_video_fb_set_active_render_target (framebuffer.render_target);
+- 
++
+   if (err)
+     return err;
+- 
++
+   err = grub_video_fb_set_palette (0, GRUB_VIDEO_FBSTD_NUMCOLORS,
+ 				   grub_video_fbstd_colors);
+ 
+diff --git a/grub-core/video/ieee1275.c b/grub-core/video/ieee1275.c
+index f437fb0df..ca3d3c3b2 100644
+--- a/grub-core/video/ieee1275.c
++++ b/grub-core/video/ieee1275.c
+@@ -233,7 +233,7 @@ grub_video_ieee1275_setup (unsigned int width, unsigned int height,
+       /* TODO. */
+       return grub_error (GRUB_ERR_IO, "can't set mode %dx%d", width, height);
+     }
+-  
++
+   err = grub_video_ieee1275_fill_mode_info (dev, &framebuffer.mode_info);
+   if (err)
+     {
+@@ -260,7 +260,7 @@ grub_video_ieee1275_setup (unsigned int width, unsigned int height,
+ 
+   grub_video_ieee1275_set_palette (0, framebuffer.mode_info.number_of_colors,
+ 				   grub_video_fbstd_colors);
+-    
++
+   return err;
+ }
+ 
+diff --git a/grub-core/video/radeon_fuloong2e.c b/grub-core/video/radeon_fuloong2e.c
+index b4da34b5e..40917acb7 100644
+--- a/grub-core/video/radeon_fuloong2e.c
++++ b/grub-core/video/radeon_fuloong2e.c
+@@ -75,7 +75,7 @@ find_card (grub_pci_device_t dev, grub_pci_id_t pciid, void *data)
+   if (((class >> 16) & 0xffff) != GRUB_PCI_CLASS_SUBCLASS_VGA
+       || pciid != 0x515a1002)
+     return 0;
+-  
++
+   *found = 1;
+ 
+   addr = grub_pci_make_address (dev, GRUB_PCI_REG_ADDRESS_REG0);
+@@ -139,7 +139,7 @@ grub_video_radeon_fuloong2e_setup (unsigned int width, unsigned int height,
+   framebuffer.mapped = 1;
+ 
+   /* Prevent garbage from appearing on the screen.  */
+-  grub_memset (framebuffer.ptr, 0x55, 
++  grub_memset (framebuffer.ptr, 0x55,
+ 	       framebuffer.mode_info.height * framebuffer.mode_info.pitch);
+ 
+ #ifndef TEST
+@@ -152,7 +152,7 @@ grub_video_radeon_fuloong2e_setup (unsigned int width, unsigned int height,
+     return err;
+ 
+   err = grub_video_fb_set_active_render_target (framebuffer.render_target);
+-  
++
+   if (err)
+     return err;
+ 
+diff --git a/grub-core/video/radeon_yeeloong3a.c b/grub-core/video/radeon_yeeloong3a.c
+index 52614feb6..48631c181 100644
+--- a/grub-core/video/radeon_yeeloong3a.c
++++ b/grub-core/video/radeon_yeeloong3a.c
+@@ -74,7 +74,7 @@ find_card (grub_pci_device_t dev, grub_pci_id_t pciid, void *data)
+   if (((class >> 16) & 0xffff) != GRUB_PCI_CLASS_SUBCLASS_VGA
+       || pciid != 0x96151002)
+     return 0;
+-  
++
+   *found = 1;
+ 
+   addr = grub_pci_make_address (dev, GRUB_PCI_REG_ADDRESS_REG0);
+@@ -137,7 +137,7 @@ grub_video_radeon_yeeloong3a_setup (unsigned int width, unsigned int height,
+ #endif
+ 
+   /* Prevent garbage from appearing on the screen.  */
+-  grub_memset (framebuffer.ptr, 0, 
++  grub_memset (framebuffer.ptr, 0,
+ 	       framebuffer.mode_info.height * framebuffer.mode_info.pitch);
+ 
+ #ifndef TEST
+@@ -150,7 +150,7 @@ grub_video_radeon_yeeloong3a_setup (unsigned int width, unsigned int height,
+     return err;
+ 
+   err = grub_video_fb_set_active_render_target (framebuffer.render_target);
+-  
++
+   if (err)
+     return err;
+ 
+diff --git a/grub-core/video/readers/png.c b/grub-core/video/readers/png.c
+index 0157ff742..54dfedf43 100644
+--- a/grub-core/video/readers/png.c
++++ b/grub-core/video/readers/png.c
+@@ -916,7 +916,7 @@ grub_png_convert_image (struct grub_png_data *data)
+ 	}
+       return;
+     }
+-  
++
+   if (data->is_gray)
+     {
+       switch (data->bpp)
+diff --git a/grub-core/video/readers/tga.c b/grub-core/video/readers/tga.c
+index 7cb9d1d2a..a9ec3a1b6 100644
+--- a/grub-core/video/readers/tga.c
++++ b/grub-core/video/readers/tga.c
+@@ -127,7 +127,7 @@ tga_load_palette (struct tga_data *data)
+ 
+   if (len > sizeof (data->palette))
+     len = sizeof (data->palette);
+-  
++
+   if (grub_file_read (data->file, &data->palette, len)
+       != (grub_ssize_t) len)
+     return grub_errno;
+diff --git a/grub-core/video/sis315_init.c b/grub-core/video/sis315_init.c
+index ae5c1419c..09c3c7bbe 100644
+--- a/grub-core/video/sis315_init.c
++++ b/grub-core/video/sis315_init.c
+@@ -1,4 +1,4 @@
+-static const struct { grub_uint8_t reg; grub_uint8_t val; } sr_dump [] = 
++static const struct { grub_uint8_t reg; grub_uint8_t val; } sr_dump [] =
+ {
+   { 0x28, 0x81 },
+   { 0x2a, 0x00 },
+diff --git a/grub-core/video/sis315pro.c b/grub-core/video/sis315pro.c
+index 22a0c85a6..4d2f9999a 100644
+--- a/grub-core/video/sis315pro.c
++++ b/grub-core/video/sis315pro.c
+@@ -103,7 +103,7 @@ find_card (grub_pci_device_t dev, grub_pci_id_t pciid, void *data)
+   if (((class >> 16) & 0xffff) != GRUB_PCI_CLASS_SUBCLASS_VGA
+       || pciid != GRUB_SIS315PRO_PCIID)
+     return 0;
+-  
++
+   *found = 1;
+ 
+   addr = grub_pci_make_address (dev, GRUB_PCI_REG_ADDRESS_REG0);
+@@ -218,7 +218,7 @@ grub_video_sis315pro_setup (unsigned int width, unsigned int height,
+ 
+ #ifndef TEST
+   /* Prevent garbage from appearing on the screen.  */
+-  grub_memset (framebuffer.ptr, 0, 
++  grub_memset (framebuffer.ptr, 0,
+ 	       framebuffer.mode_info.height * framebuffer.mode_info.pitch);
+   grub_arch_sync_dma_caches (framebuffer.ptr,
+ 			     framebuffer.mode_info.height
+@@ -231,7 +231,7 @@ grub_video_sis315pro_setup (unsigned int width, unsigned int height,
+ 	     | GRUB_VGA_IO_MISC_EXTERNAL_CLOCK_0
+ 	     | GRUB_VGA_IO_MISC_28MHZ
+ 	     | GRUB_VGA_IO_MISC_ENABLE_VRAM_ACCESS
+-	     | GRUB_VGA_IO_MISC_COLOR, 
++	     | GRUB_VGA_IO_MISC_COLOR,
+ 	     GRUB_VGA_IO_MISC_WRITE + GRUB_MACHINE_PCI_IO_BASE);
+ 
+   grub_vga_sr_write (0x86, 5);
+@@ -335,7 +335,7 @@ grub_video_sis315pro_setup (unsigned int width, unsigned int height,
+   {
+     if (read_sis_cmd (0x5) != 0xa1)
+       write_sis_cmd (0x86, 0x5);
+-    
++
+     write_sis_cmd (read_sis_cmd (0x20) | 0xa1, 0x20);
+     write_sis_cmd (read_sis_cmd (0x1e) | 0xda, 0x1e);
+ 
+diff --git a/grub-core/video/sm712.c b/grub-core/video/sm712.c
+index 10c46eb65..65f59f84b 100644
+--- a/grub-core/video/sm712.c
++++ b/grub-core/video/sm712.c
+@@ -167,7 +167,7 @@ enum
+     GRUB_SM712_CR_SHADOW_VGA_VBLANK_START = 0x46,
+     GRUB_SM712_CR_SHADOW_VGA_VBLANK_END = 0x47,
+     GRUB_SM712_CR_SHADOW_VGA_VRETRACE_START = 0x48,
+-    GRUB_SM712_CR_SHADOW_VGA_VRETRACE_END = 0x49,    
++    GRUB_SM712_CR_SHADOW_VGA_VRETRACE_END = 0x49,
+     GRUB_SM712_CR_SHADOW_VGA_OVERFLOW = 0x4a,
+     GRUB_SM712_CR_SHADOW_VGA_CELL_HEIGHT = 0x4b,
+     GRUB_SM712_CR_SHADOW_VGA_HDISPLAY_END = 0x4c,
+@@ -375,7 +375,7 @@ find_card (grub_pci_device_t dev, grub_pci_id_t pciid, void *data)
+   if (((class >> 16) & 0xffff) != GRUB_PCI_CLASS_SUBCLASS_VGA
+       || pciid != GRUB_SM712_PCIID)
+     return 0;
+-  
++
+   *found = 1;
+ 
+   addr = grub_pci_make_address (dev, GRUB_PCI_REG_ADDRESS_REG0);
+@@ -471,7 +471,7 @@ grub_video_sm712_setup (unsigned int width, unsigned int height,
+ 
+ #if !defined (TEST) && !defined(GENINIT)
+   /* Prevent garbage from appearing on the screen.  */
+-  grub_memset ((void *) framebuffer.cached_ptr, 0, 
++  grub_memset ((void *) framebuffer.cached_ptr, 0,
+ 	       framebuffer.mode_info.height * framebuffer.mode_info.pitch);
+ #endif
+ 
+@@ -482,7 +482,7 @@ grub_video_sm712_setup (unsigned int width, unsigned int height,
+   grub_sm712_sr_write (0x2, 0x6b);
+   grub_sm712_write_reg (0, GRUB_VGA_IO_PIXEL_MASK);
+   grub_sm712_sr_write (GRUB_VGA_SR_RESET_ASYNC, GRUB_VGA_SR_RESET);
+-  grub_sm712_write_reg (GRUB_VGA_IO_MISC_NEGATIVE_VERT_POLARITY 
++  grub_sm712_write_reg (GRUB_VGA_IO_MISC_NEGATIVE_VERT_POLARITY
+ 			| GRUB_VGA_IO_MISC_NEGATIVE_HORIZ_POLARITY
+ 			| GRUB_VGA_IO_MISC_UPPER_64K
+ 			| GRUB_VGA_IO_MISC_EXTERNAL_CLOCK_0
+@@ -694,7 +694,7 @@ grub_video_sm712_setup (unsigned int width, unsigned int height,
+   for (i = 0; i < ARRAY_SIZE (dda_lookups); i++)
+     grub_sm712_write_dda_lookup (i, dda_lookups[i].compare, dda_lookups[i].dda,
+ 				 dda_lookups[i].vcentering);
+-  
++
+   /* Undocumented  */
+   grub_sm712_cr_write (0, 0x9c);
+   grub_sm712_cr_write (0, 0x9d);
+diff --git a/grub-core/video/video.c b/grub-core/video/video.c
+index 983424107..8937da745 100644
+--- a/grub-core/video/video.c
++++ b/grub-core/video/video.c
+@@ -491,13 +491,13 @@ parse_modespec (const char *current_mode, int *width, int *height, int *depth)
+ 		       current_mode);
+ 
+   param++;
+-  
++
+   *width = grub_strtoul (value, 0, 0);
+   if (grub_errno != GRUB_ERR_NONE)
+       return grub_error (GRUB_ERR_BAD_ARGUMENT,
+ 			 N_("invalid video mode specification `%s'"),
+ 			 current_mode);
+-  
++
+   /* Find height value.  */
+   value = param;
+   param = grub_strchr(param, 'x');
+@@ -513,13 +513,13 @@ parse_modespec (const char *current_mode, int *width, int *height, int *depth)
+     {
+       /* We have optional color depth value.  */
+       param++;
+-      
++
+       *height = grub_strtoul (value, 0, 0);
+       if (grub_errno != GRUB_ERR_NONE)
+ 	return grub_error (GRUB_ERR_BAD_ARGUMENT,
+ 			   N_("invalid video mode specification `%s'"),
+ 			   current_mode);
+-      
++
+       /* Convert color depth value.  */
+       value = param;
+       *depth = grub_strtoul (value, 0, 0);
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/files/video-readers-jpeg-Abort-sooner-if-a-read-operation-.patch b/meta/recipes-bsp/grub/files/video-readers-jpeg-Abort-sooner-if-a-read-operation-.patch
new file mode 100644
index 0000000000..0c7deae858
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/video-readers-jpeg-Abort-sooner-if-a-read-operation-.patch
@@ -0,0 +1,264 @@
+From d5caac8ab79d068ad9a41030c772d03a4d4fbd7b Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Mon, 28 Jun 2021 14:16:14 +1000
+Subject: [PATCH] video/readers/jpeg: Abort sooner if a read operation fails
+
+Fuzzing revealed some inputs that were taking a long time, potentially
+forever, because they did not bail quickly upon encountering an I/O error.
+
+Try to catch I/O errors sooner and bail out.
+
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=d5caac8ab79d068ad9a41030c772d03a4d4fbd7b
+
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ grub-core/video/readers/jpeg.c | 86 +++++++++++++++++++++++++++-------
+ 1 file changed, 70 insertions(+), 16 deletions(-)
+
+diff --git a/grub-core/video/readers/jpeg.c b/grub-core/video/readers/jpeg.c
+index c47ffd651..806c56c78 100644
+--- a/grub-core/video/readers/jpeg.c
++++ b/grub-core/video/readers/jpeg.c
+@@ -109,9 +109,17 @@ static grub_uint8_t
+ grub_jpeg_get_byte (struct grub_jpeg_data *data)
+ {
+   grub_uint8_t r;
++  grub_ssize_t bytes_read;
+ 
+   r = 0;
+-  grub_file_read (data->file, &r, 1);
++  bytes_read = grub_file_read (data->file, &r, 1);
++
++  if (bytes_read != 1)
++    {
++      grub_error (GRUB_ERR_BAD_FILE_TYPE,
++		  "jpeg: unexpected end of data");
++      return 0;
++    }
+ 
+   return r;
+ }
+@@ -120,9 +128,17 @@ static grub_uint16_t
+ grub_jpeg_get_word (struct grub_jpeg_data *data)
+ {
+   grub_uint16_t r;
++  grub_ssize_t bytes_read;
+ 
+   r = 0;
+-  grub_file_read (data->file, &r, sizeof (grub_uint16_t));
++  bytes_read = grub_file_read (data->file, &r, sizeof (grub_uint16_t));
++
++  if (bytes_read != sizeof (grub_uint16_t))
++    {
++      grub_error (GRUB_ERR_BAD_FILE_TYPE,
++		  "jpeg: unexpected end of data");
++      return 0;
++    }
+ 
+   return grub_be_to_cpu16 (r);
+ }
+@@ -135,6 +151,11 @@ grub_jpeg_get_bit (struct grub_jpeg_data *data)
+   if (data->bit_mask == 0)
+     {
+       data->bit_save = grub_jpeg_get_byte (data);
++      if (grub_errno != GRUB_ERR_NONE) {
++	grub_error (GRUB_ERR_BAD_FILE_TYPE,
++		    "jpeg: file read error");
++	return 0;
++      }
+       if (data->bit_save == JPEG_ESC_CHAR)
+ 	{
+ 	  if (grub_jpeg_get_byte (data) != 0)
+@@ -143,6 +164,11 @@ grub_jpeg_get_bit (struct grub_jpeg_data *data)
+ 			  "jpeg: invalid 0xFF in data stream");
+ 	      return 0;
+ 	    }
++	  if (grub_errno != GRUB_ERR_NONE)
++	    {
++	      grub_error (GRUB_ERR_BAD_FILE_TYPE, "jpeg: file read error");
++	      return 0;
++	    }
+ 	}
+       data->bit_mask = 0x80;
+     }
+@@ -161,7 +187,7 @@ grub_jpeg_get_number (struct grub_jpeg_data *data, int num)
+     return 0;
+ 
+   msb = value = grub_jpeg_get_bit (data);
+-  for (i = 1; i < num; i++)
++  for (i = 1; i < num && grub_errno == GRUB_ERR_NONE; i++)
+     value = (value << 1) + (grub_jpeg_get_bit (data) != 0);
+   if (!msb)
+     value += 1 - (1 << num);
+@@ -208,6 +234,8 @@ grub_jpeg_decode_huff_table (struct grub_jpeg_data *data)
+   while (data->file->offset + sizeof (count) + 1 <= next_marker)
+     {
+       id = grub_jpeg_get_byte (data);
++      if (grub_errno != GRUB_ERR_NONE)
++	return grub_errno;
+       ac = (id >> 4) & 1;
+       id &= 0xF;
+       if (id > 1)
+@@ -258,6 +286,8 @@ grub_jpeg_decode_quan_table (struct grub_jpeg_data *data)
+ 
+   next_marker = data->file->offset;
+   next_marker += grub_jpeg_get_word (data);
++  if (grub_errno != GRUB_ERR_NONE)
++    return grub_errno;
+ 
+   if (next_marker > data->file->size)
+     {
+@@ -269,6 +299,8 @@ grub_jpeg_decode_quan_table (struct grub_jpeg_data *data)
+ 	 <= next_marker)
+     {
+       id = grub_jpeg_get_byte (data);
++      if (grub_errno != GRUB_ERR_NONE)
++        return grub_errno;
+       if (id >= 0x10)		/* Upper 4-bit is precision.  */
+ 	return grub_error (GRUB_ERR_BAD_FILE_TYPE,
+ 			   "jpeg: only 8-bit precision is supported");
+@@ -300,6 +332,9 @@ grub_jpeg_decode_sof (struct grub_jpeg_data *data)
+   next_marker = data->file->offset;
+   next_marker += grub_jpeg_get_word (data);
+ 
++  if (grub_errno != GRUB_ERR_NONE)
++    return grub_errno;
++
+   if (grub_jpeg_get_byte (data) != 8)
+     return grub_error (GRUB_ERR_BAD_FILE_TYPE,
+ 		       "jpeg: only 8-bit precision is supported");
+@@ -325,6 +360,8 @@ grub_jpeg_decode_sof (struct grub_jpeg_data *data)
+ 	return grub_error (GRUB_ERR_BAD_FILE_TYPE, "jpeg: invalid index");
+ 
+       ss = grub_jpeg_get_byte (data);	/* Sampling factor.  */
++      if (grub_errno != GRUB_ERR_NONE)
++	return grub_errno;
+       if (!id)
+ 	{
+ 	  grub_uint8_t vs, hs;
+@@ -504,7 +541,7 @@ grub_jpeg_idct_transform (jpeg_data_unit_t du)
+     }
+ }
+ 
+-static void
++static grub_err_t
+ grub_jpeg_decode_du (struct grub_jpeg_data *data, int id, jpeg_data_unit_t du)
+ {
+   int h1, h2, qt;
+@@ -519,6 +556,9 @@ grub_jpeg_decode_du (struct grub_jpeg_data *data, int id, jpeg_data_unit_t du)
+   data->dc_value[id] +=
+     grub_jpeg_get_number (data, grub_jpeg_get_huff_code (data, h1));
+ 
++  if (grub_errno != GRUB_ERR_NONE)
++    return grub_errno;
++
+   du[0] = data->dc_value[id] * (int) data->quan_table[qt][0];
+   pos = 1;
+   while (pos < ARRAY_SIZE (data->quan_table[qt]))
+@@ -533,11 +573,13 @@ grub_jpeg_decode_du (struct grub_jpeg_data *data, int id, jpeg_data_unit_t du)
+       num >>= 4;
+       pos += num;
+ 
++      if (grub_errno != GRUB_ERR_NONE)
++        return grub_errno;
++
+       if (pos >= ARRAY_SIZE (jpeg_zigzag_order))
+ 	{
+-	  grub_error (GRUB_ERR_BAD_FILE_TYPE,
+-		      "jpeg: invalid position in zigzag order!?");
+-	  return;
++	  return grub_error (GRUB_ERR_BAD_FILE_TYPE,
++			     "jpeg: invalid position in zigzag order!?");
+ 	}
+ 
+       du[jpeg_zigzag_order[pos]] = val * (int) data->quan_table[qt][pos];
+@@ -545,6 +587,7 @@ grub_jpeg_decode_du (struct grub_jpeg_data *data, int id, jpeg_data_unit_t du)
+     }
+ 
+   grub_jpeg_idct_transform (du);
++  return GRUB_ERR_NONE;
+ }
+ 
+ static void
+@@ -603,7 +646,8 @@ grub_jpeg_decode_sos (struct grub_jpeg_data *data)
+   data_offset += grub_jpeg_get_word (data);
+ 
+   cc = grub_jpeg_get_byte (data);
+-
++  if (grub_errno != GRUB_ERR_NONE)
++    return grub_errno;
+   if (cc != 3 && cc != 1)
+     return grub_error (GRUB_ERR_BAD_FILE_TYPE,
+ 		       "jpeg: component count must be 1 or 3");
+@@ -616,7 +660,8 @@ grub_jpeg_decode_sos (struct grub_jpeg_data *data)
+       id = grub_jpeg_get_byte (data) - 1;
+       if ((id < 0) || (id >= 3))
+ 	return grub_error (GRUB_ERR_BAD_FILE_TYPE, "jpeg: invalid index");
+-
++      if (grub_errno != GRUB_ERR_NONE)
++	return grub_errno;
+       ht = grub_jpeg_get_byte (data);
+       data->comp_index[id][1] = (ht >> 4);
+       data->comp_index[id][2] = (ht & 0xF) + 2;
+@@ -624,11 +669,14 @@ grub_jpeg_decode_sos (struct grub_jpeg_data *data)
+       if ((data->comp_index[id][1] < 0) || (data->comp_index[id][1] > 3) ||
+ 	  (data->comp_index[id][2] < 0) || (data->comp_index[id][2] > 3))
+ 	return grub_error (GRUB_ERR_BAD_FILE_TYPE, "jpeg: invalid hufftable index");
++      if (grub_errno != GRUB_ERR_NONE)
++	return grub_errno;
+     }
+ 
+   grub_jpeg_get_byte (data);	/* Skip 3 unused bytes.  */
+   grub_jpeg_get_word (data);
+-
++  if (grub_errno != GRUB_ERR_NONE)
++    return grub_errno;
+   if (data->file->offset != data_offset)
+     return grub_error (GRUB_ERR_BAD_FILE_TYPE, "jpeg: extra byte in sos");
+ 
+@@ -646,6 +694,7 @@ grub_jpeg_decode_data (struct grub_jpeg_data *data)
+ {
+   unsigned c1, vb, hb, nr1, nc1;
+   int rst = data->dri;
++  grub_err_t err = GRUB_ERR_NONE;
+ 
+   vb = 8 << data->log_vs;
+   hb = 8 << data->log_hs;
+@@ -666,17 +715,22 @@ grub_jpeg_decode_data (struct grub_jpeg_data *data)
+ 
+ 	for (r2 = 0; r2 < (1U << data->log_vs); r2++)
+ 	  for (c2 = 0; c2 < (1U << data->log_hs); c2++)
+-	    grub_jpeg_decode_du (data, 0, data->ydu[r2 * 2 + c2]);
++            {
++              err = grub_jpeg_decode_du (data, 0, data->ydu[r2 * 2 + c2]);
++              if (err != GRUB_ERR_NONE)
++                return err;
++            }
+ 
+ 	if (data->color_components >= 3)
+ 	  {
+-	    grub_jpeg_decode_du (data, 1, data->cbdu);
+-	    grub_jpeg_decode_du (data, 2, data->crdu);
++	    err = grub_jpeg_decode_du (data, 1, data->cbdu);
++	    if (err != GRUB_ERR_NONE)
++	      return err;
++	    err = grub_jpeg_decode_du (data, 2, data->crdu);
++	    if (err != GRUB_ERR_NONE)
++	      return err;
+ 	  }
+ 
+-	if (grub_errno)
+-	  return grub_errno;
+-
+ 	nr2 = (data->r1 == nr1 - 1) ? (data->image_height - data->r1 * vb) : vb;
+ 	nc2 = (c1 == nc1 - 1) ? (data->image_width - c1 * hb) : hb;
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/files/video-readers-jpeg-Refuse-to-handle-multiple-start-o.patch b/meta/recipes-bsp/grub/files/video-readers-jpeg-Refuse-to-handle-multiple-start-o.patch
new file mode 100644
index 0000000000..91ecaad98a
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/video-readers-jpeg-Refuse-to-handle-multiple-start-o.patch
@@ -0,0 +1,53 @@
+From 166a4d61448f74745afe1dac2f2cfb85d04909bf Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Mon, 28 Jun 2021 14:25:17 +1000
+Subject: [PATCH] video/readers/jpeg: Refuse to handle multiple start of
+ streams
+
+An invalid file could contain multiple start of stream blocks, which
+would cause us to reallocate and leak our bitmap. Refuse to handle
+multiple start of streams.
+
+Additionally, fix a grub_error() call formatting.
+
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport
+
+Reference to upstream patch:
+https://git.savannah.gnu.org/cgit/grub.git/commit/?id=166a4d61448f74745afe1dac2f2cfb85d04909bf
+
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ grub-core/video/readers/jpeg.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/video/readers/jpeg.c b/grub-core/video/readers/jpeg.c
+index 2284a6c06..579bbe8a4 100644
+--- a/grub-core/video/readers/jpeg.c
++++ b/grub-core/video/readers/jpeg.c
+@@ -683,6 +683,9 @@ grub_jpeg_decode_sos (struct grub_jpeg_data *data)
+   if (data->file->offset != data_offset)
+     return grub_error (GRUB_ERR_BAD_FILE_TYPE, "jpeg: extra byte in sos");
+ 
++  if (*data->bitmap)
++    return grub_error (GRUB_ERR_BAD_FILE_TYPE, "jpeg: too many start of scan blocks");
++
+   if (grub_video_bitmap_create (data->bitmap, data->image_width,
+ 				data->image_height,
+ 				GRUB_VIDEO_BLIT_FORMAT_RGB_888))
+@@ -705,8 +708,8 @@ grub_jpeg_decode_data (struct grub_jpeg_data *data)
+   nc1 = (data->image_width + hb - 1)  >> (3 + data->log_hs);
+ 
+   if (data->bitmap_ptr == NULL)
+-    return grub_error(GRUB_ERR_BAD_FILE_TYPE,
+-		      "jpeg: attempted to decode data before start of stream");
++    return grub_error (GRUB_ERR_BAD_FILE_TYPE,
++		       "jpeg: attempted to decode data before start of stream");
+ 
+   for (; data->r1 < nr1 && (!data->dri || rst);
+        data->r1++, data->bitmap_ptr += (vb * data->image_width - hb * nc1) * 3)
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 45852ab9b1..47ea561002 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -22,6 +22,16 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-RISC-V-Restore-the-typcast-to-long.patch \
            file://CVE-2021-3981-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch \
            file://0001-configure.ac-Use-_zicsr_zifencei-extentions-on-riscv.patch \
+           file://video-Remove-trailing-whitespaces.patch \
+           file://CVE-2021-3695-video-readers-png-Drop-greyscale-support-to-fix-heap.patch \
+           file://CVE-2021-3696-video-readers-png-Avoid-heap-OOB-R-W-inserting-huff.patch \
+           file://video-readers-jpeg-Abort-sooner-if-a-read-operation-.patch \
+           file://video-readers-jpeg-Refuse-to-handle-multiple-start-o.patch \
+           file://CVE-2021-3697-video-readers-jpeg-Block-int-underflow-wild-pointer.patch \
+           file://CVE-2022-28733-net-ip-Do-IP-fragment-maths-safely.patch \
+           file://CVE-2022-28734-net-http-Fix-OOB-write-for-split-http-headers.patch \
+           file://CVE-2022-28734-net-http-Error-out-on-headers-with-LF-without-CR.patch \
+           file://CVE-2022-28735-kern-efi-sb-Reject-non-kernel-files-in-the-shim_lock.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.34.1


