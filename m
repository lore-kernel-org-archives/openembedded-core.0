Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BECC433FE
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 02:11:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.14353.1640139099988040434
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 18:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ExREFSB1;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=79909bdf5a=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BM1fAqI022386
	for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 18:11:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=3eXjGU580hL3UcDajLZH1CVBciKjfjxjcg9p1kZUYeU=;
 b=ExREFSB1ykbBmA/zJdJyNy56rPgfW80k5LVDJveVIwQNxXTXRALKpWZzEygFgb/u8WRV
 C76Wo6rACCy4YoW0ApJxIq2Dm3mt7wb/ZU2nWly90dD7GPUxZu3MPEObAABYXfsIeys5
 +Zkwz4wigVxbOEzVMyJg3Tllr2tJdo2wCzmg1ubRSQixoQ5CMKOHV7wEGMhGvPBBfB7T
 L3DKSuUCfgxjlugx4eK9zPn/kjfka9T5pT1djUOOMzvKMwF+pn2sb2CJAG28eKJI0bae
 QfjKjPXbrKqqhEQHuxYAGG7vhgx3A+kI0OczJcLHw4tsIfeR/tzuZRND4Sw+ywK3qWuM Uw==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d2rdahgxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 18:11:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PcLdMf1G4fa+tDIOvJUnUO9ZmhRdpxVJoxsu095DTePPaQdY7LpaonPv4qrh1xZEM7VV6kT2QQjWYEwZr/h7f5vI47DL1q13GY2t9Ajp7vNqsvtOEldmha3xKqlSAwUR0xNhxUfHpqeV5aWs6vxnamslzY5aC1wvTX6gUfiUmkkEuGrKstae/cMhQpja3ZpbzZERdleGoTZwLdXgTNpBVPHxPZFru/uhBhRtW/x594If0rsW+pKgM8B42qeJowPHMh0dZtqpfOa8sRO+0pbU7h6sV8MCx9wsRRbSV2MdTQEhNXno2Jkx9POYVtan65ihCgZiat0/doVhQcg66gJe8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eXjGU580hL3UcDajLZH1CVBciKjfjxjcg9p1kZUYeU=;
 b=BG8Ejje8Lv5Nd3F/EoNkPd0YvD482XDsbwmnILrgj2a/zC/M3H0kfWUBNF7KfFErMklGzW5yvdIIoM8nhZvblxyqbxw8mllMJ+dBI0/m0VKmpHfEk0iOLdXqXmg+tsvn3k8/10B6njOFznRvZaWw0idwnSUoEevfLAx+1g2pUtCYsBuGDspIOfgkVP+k2p0sbuu/zmhL8KGgnxB/owpWhnuphdzys8ivngkpPCS8NeaySW5e9vU70naKA3WaTXxOzfXt48fUmBWQUoq4gcP8ohoVn8lJjBTqt9EAM1UVJs4KdGmrUC0PellMUF39jgUIV1Nz4b85+x9dDOPYjjwDSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 22 Dec
 2021 02:11:36 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::e4bd:c128:9168:b142]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::e4bd:c128:9168:b142%3]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 02:11:36 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][hardknott][PATCH 1/3] busybox: Fix for CVE-2021-42374
Date: Tue, 21 Dec 2021 18:11:23 -0800
Message-Id: <20211222021125.55893-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:217::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02cd1a66-7dbe-4e95-997b-08d9c4f061db
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB5602A6FA9EE59E65C61DB7FFED7D9@CO6PR11MB5602.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RFlzAU61mB11kpxZfx/aYGJs7oBRb73kY/w9JQq0AIz9ZfSk66UCcxHnjFsPhvbGyqAafo8QFmJkH+C90RFBZEhLJbDGqUvsYlgkIQs0B/Qp4pfbQDL0erFUHmGLe6tWNBfUs3cmaHbI9V8fd9t8XRS9ll9nFKoKHmoMpi/yaNanfIbT5F8xfepDCuTQJsRkrUlLRlszBGmmiMvoKEA0iXYZKoa3Z74G2a+dW/y335do1hr4qwE1cI4EASCjMrMn4Ga1eqzmR55Di6i6johsIsywqDv6czJsrYqggKkJ9BFMx3+/Ea6dgQSdwpFueGbGUeGHacfBhBvXFo1VAhhiOpZxL34ANp0nka1EzYi4BWWakgjlzd8nAgqf6zvRG0QtASjmRVhzs/LKL0miBLYWYitCr2DU+qadXHY/g8vi/pcmOBS0i2/Ifg0Ziyvz21Xtxi3OZgBHvAXPkyvY5z5IdK6VgQ4wVxfzxGaeZq+lyMyikGpm2WQ0n9RIIEqm7CoLjDL2YE+gYIVoB6L8MH6si+M6sAW/ROrq61pA69xteKgtoOC/wQhaGWD8TeIFhK7cLJFopfAnM1sPaKu5W6vcgGYGPb1j5i8LVVTBeo3m0FA+pyYVKFLd+Y0z9QpQ70sh7L2NHaQA+z60mMHQWSkSQP/Uvs8Nap4+w+ppiClXw6jFfPi8yytM0jJrE8kQXIRcE0NyicO+EPNHFyTA3NbceZciRsOv4bkKtElQbtmYevxOAE+Lgary4nnLQxGzM3wsls32e2ZPsJlewbszrRDt6842/WkdJzfW5XsJqBAHZWM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(508600001)(6486002)(52116002)(2906002)(36756003)(66946007)(66476007)(6512007)(8676002)(316002)(86362001)(966005)(6506007)(66556008)(26005)(83380400001)(38100700002)(186003)(1076003)(6666004)(5660300002)(2616005)(8936002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/jKNuj3UH1CZr7UY7N6jWu8c5VxhwhHeorlaspHaqIt24NngG6IQ2C8qalaX?=
 =?us-ascii?Q?AfzfdbJ8KVIxxVxmKlXmqh9onT8+kvf04Lqbr8icNNQZ2Pp67kgJGwEkh64m?=
 =?us-ascii?Q?a3A36K5qysk3UgcyE66lMh/je7XM4z7mSPJXF7GKMDi2yT/prB0SbSGjRoQ1?=
 =?us-ascii?Q?O+2XOCtBD8cnqOpBG3oWtBVEAI4T8g8OT04cwKyb+PDm/ZOjc3vvpI2bMuPz?=
 =?us-ascii?Q?YlAdvh4xkhg3sBAzu0tgi9kUm83adkIby/3ekxTNmdbcFJ9qb9FZPrynTsU4?=
 =?us-ascii?Q?Td3VVNiCb/Z8QsD077Se538uRKiG8msiBBlnS+6XbYiiaBqDpzrRPVMZZmlL?=
 =?us-ascii?Q?y8ae844Y1JN64/oNteO2NQfYa6xUKmRH1lDtjYlP7xfReobp2tNZAuqVRLv2?=
 =?us-ascii?Q?AaKfsGJ/V1HdpGLxJkt+HKk5Pnz0fPMpYy+xjDql0KR/MCRx0/Fav8aor3F9?=
 =?us-ascii?Q?/5q76Z9wwPhLVMQju5oHKL0ToBTC9+riLm00jm4O2nWIgB7VO7onLuM893cl?=
 =?us-ascii?Q?jsZcrwM8trBcp7wImeX4oPeVsKeWhUwlvyzNsGzA1HU6d6jgNWP9FeXe2tsc?=
 =?us-ascii?Q?tLjg/d1309vN6buTYBLbOuO1QT4MhwpjQC+mv2xX8cEbXUF4t5KiJfVMWXm2?=
 =?us-ascii?Q?+8OCsJvasxdrDDS1j19ZaXC1zXFU8oPH9ZXiccq7ZzB7kgH7sdOoP1/yWK5T?=
 =?us-ascii?Q?S6EuC9502VjAU9sszLMPEZn1fRZ3+jWYZ9GcqfCJ+6EM4f9mW3dazCHu7X8v?=
 =?us-ascii?Q?71Cuc30Sfl28/ytQQwenMWBT4VaVpUxpzBs18UMyvonr/Tsrnkjbw0guh2rz?=
 =?us-ascii?Q?IpbH7S+Uc8oFRHQV+N5/L1HN9d0NE8rvFnB19fEkLapqjjhMQUJKX1VggeOB?=
 =?us-ascii?Q?XzeHuWCUbTtp8Zx1VXhQCqlhf2BspeYd0FUHlzbLXJ1aG/xGDnKGqiA4rtI2?=
 =?us-ascii?Q?TSUYXOLOp3DM6gcg+YBFEIhVYfGL6eNepnBdATJXur42JqpCoWY79KYN0vaJ?=
 =?us-ascii?Q?x2fQNEkGp0tGFVZopXN4Kz2aE9kKaICTTzXaFa4cf7iE0Dku41qV5Go+Q8GC?=
 =?us-ascii?Q?2XyypGG525z1mQ8hPlnfLbj/HyuYR8TW3abbsvEFRRmHeLsq7Bb1Dbv+OipX?=
 =?us-ascii?Q?5FdkkbJjbHxrhHVJ6zYcaS6YqVxa9f4XPdcQqd+y+b3qgf0b+nvLMIFBj8A7?=
 =?us-ascii?Q?xzojg9bGwWNnHt0vOo/z7I4CLYMVgXUz1sLBGU3snoQa4WxoRT0+B+KO/F4l?=
 =?us-ascii?Q?5E4LbSJA4Uo0NgZIdk1mwDlRVjLUxcq+37ZWC2hWs31Eb0AoUO7jWSjfu8sW?=
 =?us-ascii?Q?wZidMsnbVCrGFYSnyFjk2o0m2JfB4xGB8Ia8neq5J/7JpvSrhPaZjiwy4uS7?=
 =?us-ascii?Q?wZDo/gBKT+zUxV+LnwyqM5Vxs1YQo6O8oIfjuptQ+5yjLQRqUpLO4ON6qKjh?=
 =?us-ascii?Q?SFcWZBZyZW8ZZT7/K+cPQMxWxBDLMbruPw46wmSD7pjYzmGqilKlh7vuqLfb?=
 =?us-ascii?Q?7lppTQAIhdYsv/fb/S4ZzfbGWQeYW2F5IiPUTTfluzY/+fonmhDebeCoV0MP?=
 =?us-ascii?Q?zuYHW9hyvPBdjTezJoNfM0XfcGaM93YDP9RIQ8tgGa1It4aC5jrKhNrWAIkV?=
 =?us-ascii?Q?m2ArUv4mH8mEVDqZAzU7c0w=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 02cd1a66-7dbe-4e95-997b-08d9c4f061db
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 02:11:36.5219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9mlIQk9amoZRjaillA78wzcBEUqPc5ALvbGIK0h1Q/aIlqcealmRL01vS9JFu/AnpB0m+XajzP45hYDyB0Ka6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5602
X-Proofpoint-GUID: 0fBSXjmUGQd5dsgOl37Ihar2LzxvUtGN
X-Proofpoint-ORIG-GUID: 0fBSXjmUGQd5dsgOl37Ihar2LzxvUtGN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-21_07,2021-12-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=831
 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 02:11:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159934

From: Pavel Zhukov <pavel.zhukov@huawei.com>

An out-of-bounds heap read in unlzma leads to information leak and
denial of service when crafted LZMA-compressed input is decompressed.
This can be triggered by any applet/format that internally supports
LZMA compression.

Reference: https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42374

(From OE-Core rev: 297719989ebe8ce7d50e3991cba3e268938690ce)

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../busybox/busybox/CVE-2021-42374.patch      | 53 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.33.1.bb   |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2021-42374.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2021-42374.patch b/meta/recipes-core/busybox/busybox/CVE-2021-42374.patch
new file mode 100644
index 0000000000..aef8a3db85
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2021-42374.patch
@@ -0,0 +1,53 @@
+From 04f052c56ded5ab6a904e3a264a73dc0412b2e78 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Tue, 15 Jun 2021 15:07:57 +0200
+Subject: [PATCH] unlzma: fix a case where we could read before beginning of
+ buffer
+Cc: pavel@zhukoff.net
+
+Testcase:
+
+  21 01 01 00 00 00 00 00 e7 01 01 01 ef 00 df b6
+  00 17 02 10 11 0f ff 00 16 00 00
+
+Unfortunately, the bug is not reliably causing a segfault,
+the behavior depends on what's in memory before the buffer.
+
+function                                             old     new   delta
+unpack_lzma_stream                                  2762    2768      +6
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
+
+CVE: CVE-2021-42374
+Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?h=1_33_stable&id=d326be2850ea2bd78fe2c22d6c45c3b861d82937]
+Comment: testdata dropped because of binary format
+
+---
+ archival/libarchive/decompress_unlzma.c |   5 ++++-
+ testsuite/unlzma.tests                  |  17 +++++++++++++----
+ testsuite/unlzma_issue_3.lzma           | Bin 0 -> 27 bytes
+ 3 files changed, 17 insertions(+), 5 deletions(-)
+ create mode 100644 testsuite/unlzma_issue_3.lzma
+
+diff --git a/archival/libarchive/decompress_unlzma.c b/archival/libarchive/decompress_unlzma.c
+index 0744f231a1d64d92676b0cada2342f88f3b39b31..fb5aac8fe9ea0c53e0c2d7a7cbd05a753e39bc9d 100644
+--- a/archival/libarchive/decompress_unlzma.c
++++ b/archival/libarchive/decompress_unlzma.c
+@@ -290,8 +290,11 @@ unpack_lzma_stream(transformer_state_t *xstate)
+ 				uint32_t pos;
+ 
+ 				pos = buffer_pos - rep0;
+-				if ((int32_t)pos < 0)
++				if ((int32_t)pos < 0) {
+ 					pos += header.dict_size;
++					if ((int32_t)pos < 0)
++						goto bad;
++				}
+ 				match_byte = buffer[pos];
+ 				do {
+ 					int bit;
+-- 
+2.34.0
+
diff --git a/meta/recipes-core/busybox/busybox_1.33.1.bb b/meta/recipes-core/busybox/busybox_1.33.1.bb
index 4002d6a5c6..5f574e7f49 100644
--- a/meta/recipes-core/busybox/busybox_1.33.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.33.1.bb
@@ -48,6 +48,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
            file://0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch \
            file://0001-mktemp-add-tmpdir-option.patch \
+           file://CVE-2021-42374.patch \
            "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.33.0


