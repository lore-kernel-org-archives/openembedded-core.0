Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9E0C4332F
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 18:43:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.126496.1669660975412677213
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 10:42:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=N1jZSSFi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=93317ef19f=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ASILY2r032733
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 10:42:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=HultqYLPnA+yvBVstZL7+NXAUkPRRMa4mvrE/fi0NNo=;
 b=N1jZSSFim0m/XFyh5WnG2Q//oGrWv4iT7iqox23iQ32h+YKhX1Ju84o3nE7gAqrZpoUD
 P/j6Pw0JSp7RC0lEqjMDM+AUnbbtZD7SoGi3Lf71xJQwSdhh1kBriNchZgmej8BW7Kle
 upLxDo9aj+B5GuaOu6IyaHMpyBS56wGGWfppBd6f20ggUylJJfFFxr4Lj0QNz+VCmSoY
 2M5zs5+S7q8lvJyzuOL2m36cAgfuhCl60LV9V7GUAnBDO1X706ao1ij7gPsvqZJaMDim
 MKLkOWTkotYhPUtZHydm9PtR0fQ6ipsgbx6CprJoYIpnptLjmIUZ3gi/JIUHXKyMn5nX 5g== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m3ey91mtn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 10:42:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TzwmeT11vgZW/N4ZoKTvZqVltIT+d53vl+nZRHRNZQNALJmTbveKiO0Po2eNjHLOiUDKIlV0rKj6yUGmyPQi2kpgzof+pYTc88FMAyPmp0hDHfIXOx+fWL+61nqPb3omKHZmJlvWLZmenZskRMDjaHaAh+leipz2uRS4lOVkqjm8wduSrG8ZzLf+/u2Vc3xguiJsOaw6miJzRJBIEpJQRas1fecM7J07kLLMuUzDaplUZi4VHCXxl6N7k/SAruZbIFjCuJ7/3RU4WiQynB7+a6PiGC/nv9uX4E01u6w2hk2GpDnE9lRYCAO15XezyfK5EyiT4Z8tEdBbwXwWq1e6cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HultqYLPnA+yvBVstZL7+NXAUkPRRMa4mvrE/fi0NNo=;
 b=aT0DsOac6kh6gdyg1aP1p7ov1nBajKM5/FSXslGbiDEwpg+9lRwAeFxfalCXJpQ0yuNDEiCZpg5Ayg80kMNgUB9Givla8fgePCl9sw1jgMBEBHn+k/QSFa05t3XoSX1aIpnBFM/yTxm7rhzzkSyoHUKN84OiMIBxmkTV/hbPdbSRvJu7kSnYuEe5CoQWWq4I51rT/u3BAhm6Ky1YYto2tx6cemJ/npbIcKs3NgGA06Tp7/baW1dc2bFvOwAme/MlFj4d1riYdMInCh4KQfZwF6WdXkIJRWEWneUpfeW8GRKu/HwXx8alavzvACL/I4yzr2uMSZUSRix3kkF7H/Rr9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by DM8PR11MB5670.namprd11.prod.outlook.com (2603:10b6:8:37::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 18:42:52 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3fdd:fc11:e12c:46b0]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3fdd:fc11:e12c:46b0%5]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 18:42:52 +0000
From: Zheng Qiu <zheng.qiu@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: zheng.qiu@windriver.com, randy.macleod@windriver.com
Subject: [kirkstone][PATCH v2] tiff: Security fix for CVE-2022-3970
Date: Mon, 28 Nov 2022 13:42:41 -0500
Message-Id: <20221128184241.3814898-1-zheng.qiu@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0078.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::11) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|DM8PR11MB5670:EE_
X-MS-Office365-Filtering-Correlation-Id: 402df1e9-37d1-4ba5-6b6b-08dad1705b68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	E2ucTsfEuknetn2QqfPhBdp/qeyrGUz6Fmwu36H3+UTPGrD59MeVOPsbh79kpRgKcPr67aKxXD5z2URIllfjLTzhLpdbgKXDp5bqHbHxukhZmArc36omr/HBbTjXwYt7+rbVlwWA6ta8GHkGsPzXvdmRs5SuLmXpWe+3bntNInDSWmtz8fUeUF6Ie5uS6oXa1GC8IYZvsLJe+bJw/FcrtEDC+hD0t0FQYvBlAB+2jcD1MwibDfTIx65ednO/1MeBug4RLtzKcu4yLbzXyQDfUgUyZWfXyoXAoPZJNjiJS4bNwkFoICrP+gGnDTu28QXr2rYfL3td5Wy8dQDi2ynPLgStmeVBuQ8eeYvopj/nZAGEsmApNn/FQpmQ/cjo80x515njr/p9XEGsn5K+4HiKM0ORfT3NrrC7LkiTcElybRCyqrT8GRUDi/Voyq1kZe3TEeu47rvRgd9WAFiCvMTXImSjX1DP4VVkGwVWE7SbJ29bvUO/aDcTmRHL1Q7qZA2cjJcwbJCuZc8+OPIvEMDdqx/aTQ7D6GHFVv9EhQGr1aCElD9GoEeeumHRN7Vs9nT9nAPOX/bQ9v3zLGO+d/F26RLjuLb6YdfCw2nqTA4aXcFd90aoJhGGy+tuYFcLEnADiAIZ5BIBU74rPd0YDVAmTWs1kFwQ4coQfb769VQ5cyHnqCRR4hvH4mbWpN2RS4ssVv5LivBjBz3sArZAi4HgqaKfHGrvP3SyIGXeoehJPty4cKafXHZgrK7nsIOaY6tqMBxZbRi+W84ohDn5PBk3vg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(136003)(39850400004)(396003)(451199015)(6506007)(478600001)(83380400001)(15650500001)(86362001)(107886003)(52116002)(6486002)(6666004)(966005)(316002)(2616005)(26005)(6512007)(6916009)(8936002)(41300700001)(5660300002)(44832011)(38350700002)(2906002)(38100700002)(4326008)(66476007)(8676002)(36756003)(66556008)(66946007)(1076003)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MnTH6J2YiII5Q/GJv0fcuTlMKvtmHMAzQkYAignvBc5P8+Ikn1zRejMKhfJF?=
 =?us-ascii?Q?WbujEPLmfZX9PEIO4gILcRi8qSyC6R9Jm4p8WJTCLjz7teQIcKWgXlKQUjKg?=
 =?us-ascii?Q?L9ilkw/IaETuXiWcnRHK8qbjX31+gBn47CAp441/7Z2XoyYEdlaBQWU6azEB?=
 =?us-ascii?Q?edAcURR0Dju6kxfad6piASDYsCN+/P3uzVA9tBKBo/56wIDdA4HrjAYBNfB4?=
 =?us-ascii?Q?nfrZBC5/B/Y4ueQzWrxJF51qa8tD9CRHol6rXg3YL2Je1D1nQmOkBQhb3+qt?=
 =?us-ascii?Q?nuFymkLurrMiF6W3977Q2yZEx8I4SGwV3TvOsh+QrzQRefrktfb3Kz2phh/u?=
 =?us-ascii?Q?CKxFAajO9S43QkMjBy15nhmsPxZjMwBdjeSzqxPI5B7xUuI0E/Y/rVKCKlFe?=
 =?us-ascii?Q?FRHiSsXtoNs4OFU3roC+hSvLMYFBGghGfC3G9Jhz7BEqgspvTkJcX76aezMv?=
 =?us-ascii?Q?MyNcFXQldcTXA9o8DtKGivzS2FRU+NmEdmBYGZDwjZ14pTvtvH7jzjTVE9TZ?=
 =?us-ascii?Q?4TxTuEq1/EO8oLHRvYEQ4ZuewaDOY0BJnAzjc8tncNzA2Kz3lIKe4lLu6HFE?=
 =?us-ascii?Q?oIcf6ZuBJufpCtsb/lHZJJ6EFAyuSykbrGTuv84/iT74dWstyWHBMliAQiaV?=
 =?us-ascii?Q?EWJ9mzW/7MgriCXSPwSebryGV3+UcBb/UWJBCXE+yURFJQVHp1lTwgbkjCRY?=
 =?us-ascii?Q?cxC1WYmykvWW8juLnntTaKcJBOky5UeUpUlRjHpQ9KLW1X4SHqEzUIEqqcyl?=
 =?us-ascii?Q?TPC7ZQgF+vL5sWyKo8gznI0lvWzlOjUoV2oWxKFtvxplQjCPsDvH3j4gmfDJ?=
 =?us-ascii?Q?MWaWIxn1fG0YHC1y8dq+iMfa1D8aao/T8Nw3VyNtFeDW7UHAhGHDTwL5nJRY?=
 =?us-ascii?Q?REUWBi04qPabssRZSsvi6ZZyPMnwfNJB4uiYxj24bk8Pc/7UjKIHBRi0TSya?=
 =?us-ascii?Q?9GLjf1B8FsB8Lq71ObXT1wjuj+NMNvlA6Q7sJzyYcoti+FwI1XUyMja+RMR6?=
 =?us-ascii?Q?BNBvMKztcV4Y2Yr6KE3NwF9RTrdPnc8VLPDjkw9k4N0grC/aCaKsJvZPQuHN?=
 =?us-ascii?Q?+Ttb8Q7n4pHZZeEFCKwaj8fvVsacBpPrulm2cbDyKOGKR+9M5uk8t0e8huHH?=
 =?us-ascii?Q?G0wMVSZwLcpPqfxEQ0c8adBcH2eKDNxdJx6espYqeVCU79NzIN8RqAs3n/em?=
 =?us-ascii?Q?BUKnaIZ8qGyM3vvKbjlp3i3JE9bpwTMwzA6D1PmJi4mJENEbcItOKF9iHaJw?=
 =?us-ascii?Q?Vq4F/v/89/7SuLA8hmKxw4y9SafYlN0mm6lVUae38L0tFFjxR9UK0P8zGke9?=
 =?us-ascii?Q?KVLJb1Yr5HSTIhUKq+rbKCNceoTG43GNZhreDf4qRZ+J35ICbhrgfjIcsWfN?=
 =?us-ascii?Q?BOuoA8vkvM1F7vxP1/fE5s1uMNvIY8/RvgMixFFc8ruLgS4MCC3wcCNqxnE/?=
 =?us-ascii?Q?siKJYCSNAKj6D4KSJL11JmVy5UJf/QRWVA0nZoZ/lC9nG3XmB0QpIXXf+acl?=
 =?us-ascii?Q?v6BSRomINB++AD2lBXTqOwzB8d6Tw89esCjHGIVbjwSSCPUL4k4RkG8A1OLn?=
 =?us-ascii?Q?1Vnc4rMKcO0O3xLdrud1zOHTCYEp9SUZAEpcH2xZ5zYi7nXJz4DQ9q4tMhQ5?=
 =?us-ascii?Q?vQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 402df1e9-37d1-4ba5-6b6b-08dad1705b68
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 18:42:52.7552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfYfUPeCLe6Rn/hBuh/AM6W7tWLEKqdbC6FTZsqDgjXQuxIqtcV5hnzTQEza6iypaL3ouOc9uuPCh7gF3Ldspg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5670
X-Proofpoint-GUID: 4vRVjQCo9mA0MD8I6Offxddvcnzmqc8c
X-Proofpoint-ORIG-GUID: 4vRVjQCo9mA0MD8I6Offxddvcnzmqc8c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_16,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=287 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211280136
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 18:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173938

This patch contains a fix for CVE-2022-3970

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-3970
https://security-tracker.debian.org/tracker/CVE-2022-3970

Patch generated from :
https://gitlab.com/libtiff/libtiff/-/commit/227500897dfb07fb7d27f7aa570050e62617e3be

Upstream-Status: Accepted

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
---
 .../libtiff/tiff/CVE-2022-3970.patch          | 42 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch
new file mode 100644
index 0000000000..5e4b6e3935
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch
@@ -0,0 +1,42 @@
+CVE: CVE-2022-2953
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/227500897dfb07fb7d27f7aa570050e62617e3be]
+Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
+
+From 227500897dfb07fb7d27f7aa570050e62617e3be Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Tue, 8 Nov 2022 15:16:58 +0100
+Subject: [PATCH] TIFFReadRGBATileExt(): fix (unsigned) integer overflow on
+ strips/tiles > 2 GB
+
+Fixes https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=53137
+---
+ libtiff/tif_getimage.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index a4d0c1d6..60b94d8e 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -3016,15 +3016,15 @@ TIFFReadRGBATileExt(TIFF* tif, uint32_t col, uint32_t row, uint32_t * raster, in
+         return( ok );
+ 
+     for( i_row = 0; i_row < read_ysize; i_row++ ) {
+-        memmove( raster + (tile_ysize - i_row - 1) * tile_xsize,
+-                 raster + (read_ysize - i_row - 1) * read_xsize,
++        memmove( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize,
++                 raster + (size_t)(read_ysize - i_row - 1) * read_xsize,
+                  read_xsize * sizeof(uint32_t) );
+-        _TIFFmemset( raster + (tile_ysize - i_row - 1) * tile_xsize+read_xsize,
++        _TIFFmemset( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize+read_xsize,
+                      0, sizeof(uint32_t) * (tile_xsize - read_xsize) );
+     }
+ 
+     for( i_row = read_ysize; i_row < tile_ysize; i_row++ ) {
+-        _TIFFmemset( raster + (tile_ysize - i_row - 1) * tile_xsize,
++        _TIFFmemset( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize,
+                      0, sizeof(uint32_t) * tile_xsize );
+     }
+ 
+-- 
+2.33.0
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 29a2c38d8e..7df4369755 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2022-34526.patch \
            file://CVE-2022-2869.patch \
            file://CVE-2022-2867.patch \
+           file://CVE-2022-3970.patch \
            file://b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch \
            file://0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch \
            file://CVE-2022-2953.patch \
-- 
2.33.0


