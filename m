Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web08.9280.1611048234720859363
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 01:23:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KxrwzRTq;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLfFEZXOMj4ofMK31ZojA7kvXlITCa+dGYOCs60h0utnIYvIGGS6hk0r3P7b5kSibNrNrrnppeFJA2F0+RRsDgdsFp2ThB2g4EVpcaq8G99gJ1E/VFTrhZ7Sq30QhlcOUz14R4csKXN/EBMK7MsKiCApbzVlcDXwjd6SDFMp9Lbjnkv54aQKf8GuDpwwOzzrGEGAmNjNTrDD+XNiBKwsdfjyDa8GbKpN5kRoBa05PCyJ8B5GRzEj9Y+D1101RK5FD6Frvx+qOviJLmcmt0kF7AFTDhQipR+DEJPmiMoRZ8z7OGywpKL0TWf25kxaEkSwVbfr03MMd1eEv/jieSVbNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPRn7m+7xHcgGzwcCSfedyItNSdcVgYRZucCZHsQfX4=;
 b=GThAPspQg/OW0A+WUh/9M0DEYLiXf1dpxOouEQuIjSzqEVykmdJuk1GvhMSf37WmHhzfrJEk+kwfwO06bOZ9chcfOJunuMuScL+VwV4mXTZlJYsh4Vsrgl6YC0LpEJRSHSANyJGEMT0E/cV1oSzg1lqfNx+9DxE5+KQWk4orEOP22rYK+Zwa+m3FCFsXgJP6VZUZz6PugMf9TcYvgM8a8kewl0K7JFmtBRZGhyCVmsb0STFWyHx3kDn7e38gg06A8VrPIwkSDi/JSnfGbPHj2DymnnLCzDVHXQGDS06+APaPj2Gn/FumA3Jd43s39RQgRa0i7/XDSS5QwPsPI5q1yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPRn7m+7xHcgGzwcCSfedyItNSdcVgYRZucCZHsQfX4=;
 b=KxrwzRTqrLFR9aqKBoAX4nzXdhCk3kqmcbpVu+YyvsdQ3+Lt5nIGTlu2JgH+B1XUup5VW/68twoHqQ/kVeKkebu4nrfXs3Mq+UqRUYqv8/T01XIIXGyruD22bBekBhxDjDkjVHaGO2KQAPJsL+0ApXQfG+16ZZeWQtaoNWNXABY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (2603:10b6:805:d5::13)
 by SA0PR11MB4541.namprd11.prod.outlook.com (2603:10b6:806:94::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Tue, 19 Jan
 2021 09:23:54 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1%6]) with mapi id 15.20.3784.011; Tue, 19 Jan 2021
 09:23:54 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] apt: Fix do_compile error when enable ccache
Date: Tue, 19 Jan 2021 01:23:45 -0800
Message-Id: <90b4f96c923f2cc550e72fa59a62ec6e551fcb22.1611048144.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1611048144.git.liezhi.yang@windriver.com>
References: <cover.1611048144.git.liezhi.yang@windriver.com>
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: SJ0PR03CA0122.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::7) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by SJ0PR03CA0122.namprd03.prod.outlook.com (2603:10b6:a03:33c::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Tue, 19 Jan 2021 09:23:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa0970c5-e3bd-4f9b-b924-08d8bc5bf095
X-MS-TrafficTypeDiagnostic: SA0PR11MB4541:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB454158B9F96655303EEB8029FFA30@SA0PR11MB4541.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yOKVO1L74CvB2ak+YEAbXFLY3d2BO9srb+3zZyOX7Va1Zdg6Zh+mTBKJvZF3ISj1XU7u4Okmx/gRYBLFljb4MiDsrb7Ot5TZ8GzKk9YrCyBrvyNEqtUAsHkHx0gtQkGnNXM8ifqtiZAM9+vnVxMcCCC8kjXf2UPWE/Hutybh80wa+GPL0tPh+qP1yjUnp8vrPSHvLN3IMJtAuWa4LPN6cpNxHikRGLI6GTXngKTb10qnr+V1BjECxzYS1/CYS7ta7icqx0+Rd6VkjaZ1AxPh5DojDdN8FIfgi7dyIKZHPqOs7fHb2QRYpHzYY/rjkfoVo+CcUzzNBf0RTjZ4uLvbGbYEKhibYfCpq6KwkATjPsGCBnI2bE4i6XkWPjtp9Yby7cCLb6dNB3p5zKiefdX7bg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39850400004)(6916009)(6666004)(86362001)(66946007)(66476007)(2616005)(956004)(6486002)(6506007)(66556008)(83380400001)(26005)(52116002)(186003)(5660300002)(478600001)(316002)(16526019)(8676002)(2906002)(36756003)(8936002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?s9FZ8I8PYGm5fsFTqGkcqnGsvJZOgPUF5hrbYM5/O3P9KPrswRr3gEEvkx1P?=
 =?us-ascii?Q?NjGI/ONXxHrgXFW4TPE73JcjT3tcmEynurnOs5+jbEgq7kuHe6SJoGe7zlC4?=
 =?us-ascii?Q?hg4/jajaGdnrwbqRTlrlHgpdsi8z5jdRO3ti+3etQPsvZZEmUjzlafwq7mZU?=
 =?us-ascii?Q?7mu+qJcS9RJvtv0yKQF+vtaQ80nz3ty0GMx84LUmWw8OL/l+hcf5EflZ9h51?=
 =?us-ascii?Q?uYIUvL3zca5RFZv33FFvJ7pM/VKQRnosDMuu9B/UdTFrGwxCqLlIk6r0X0+u?=
 =?us-ascii?Q?tTifSn18afhqyUwcFrTmQ66nKRZgqa5H62ED3XjmwZnHiuNn+XBWVu5lVfIQ?=
 =?us-ascii?Q?dZ+Zg9h7BHqdCi7eHiBje6dd1qCJOVwwBJdwpTbz+khccoWnzgsQe9RVDlsD?=
 =?us-ascii?Q?ELoW0cg0j7CboPibUAKZdGwoN3NYjjfNw9/Zqknp8YjjfxbPXv2yjUYLbbKF?=
 =?us-ascii?Q?i8Rsd8LaUJN8ZUqzaePiL3V3H8gQsWlxDRFReSxDto9cEJ2ZYgqzldnsjuta?=
 =?us-ascii?Q?nttic2/M6LP0MhiJje2tCdqZdpIvItxxQ18Bv5lMssX5zXQuJGor0GczwExb?=
 =?us-ascii?Q?fO7w/VUcr1YECxIBjZMs8dPddCTb3eNURN9iPOiKS/fwHStYGZhb7fPC4VOn?=
 =?us-ascii?Q?qy6psuF0schuo1zlySnF0/WikfsQ6jySX9Y8b7ORLsfdZguFyD1aC7f6QJTV?=
 =?us-ascii?Q?xTaVmWxeO50kSAhSr39y8q2U2zDPBvIYGigGGta7lLNDwmWgu4wpvo8sG6Kq?=
 =?us-ascii?Q?hgMHLfUMAole0kh5YKYtwcimB0AgNqBygHFCzNUSrHPiay84puFtSJL9G1XC?=
 =?us-ascii?Q?e7VOTtnCUmL6oBDtFjS/+zAt3GIBiDw84z+/wNu1JkIqdVRmyyBYNh9qRfWN?=
 =?us-ascii?Q?+1Y/R1Tr6Ck7I1cFf3FsbaI4xv0HSD2d465S1pvqEvj6SPnacniT2C1C6mbI?=
 =?us-ascii?Q?K5GOWWSBJlVeU843gXik6FhpSmKERVbyDdEecgUS3FN8AJjeSShUrvuIxbMn?=
 =?us-ascii?Q?ltWl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa0970c5-e3bd-4f9b-b924-08d8bc5bf095
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 09:23:53.8954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41ejc29PNM9YqX4Kgu5plu1u5//2haJdjV9colxRBaDe4dw0MWYGjUyCeKj5q6uPMo4o1uzZ1kvhdCMBIiyn4XubbVZA6rTi8wd7bxY2jK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4541
Content-Type: text/plain

Fixed:
apt-pkg/libapt-pkg.so.5.0.2: undefined reference to `ZSTD_endStream'
collect2: error: ld returned 1 exit status

This is because ccache-native depends on zstd-native which makes apt wronly
find it. Disable zstd for apt to fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/apt/apt_1.8.2.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/apt_1.8.2.1.bb b/meta/recipes-devtools/apt/apt_1.8.2.1.bb
index 9fc6e54a292..0e10f9ba1d7 100644
--- a/meta/recipes-devtools/apt/apt_1.8.2.1.bb
+++ b/meta/recipes-devtools/apt/apt_1.8.2.1.bb
@@ -40,7 +40,11 @@ BBCLASSEXTEND = "native nativesdk"
 
 DEPENDS += "virtual/libiconv virtual/libintl db gnutls lz4 zlib bzip2 xz"
 
-EXTRA_OECMAKE_append = " -DCURRENT_VENDOR=debian -DWITH_DOC=False -DUSE_NLS=False -DDPKG_DATADIR=${datadir}/dpkg -DTRIEHASH_EXECUTABLE=${WORKDIR}/triehash"
+EXTRA_OECMAKE_append = " -DCURRENT_VENDOR=debian -DWITH_DOC=False \
+    -DUSE_NLS=False -DDPKG_DATADIR=${datadir}/dpkg \
+    -DTRIEHASH_EXECUTABLE=${WORKDIR}/triehash \
+    -DCMAKE_DISABLE_FIND_PACKAGE_Zstd=True \
+"
 
 do_configure_prepend () {
     echo "set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH )" >>  ${WORKDIR}/toolchain.cmake
-- 
2.17.1

