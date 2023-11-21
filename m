Return-Path: <wenlin.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A09C54FB9
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 09:42:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.36229.1700559726728525328
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 01:42:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fgCuwR9b;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9689ef011e=wenlin.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AL9NVSo013538
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 01:42:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=cmjbl9CLtZi//v/f77
	ar2E23Kn7hCahEqdy81iAybq8=; b=fgCuwR9bQ9u8uEUucA8m+NvgkPG7N94Lj2
	HKitu3wrorQCA5UBs6VSlzUkmQBr/2wvW79rnShvonylW+D7wlbw8Da51r70oRc3
	7nOQbhzKfLpwIckUvS6av8XVlnbFGAHaQonwSZfA3CULcU0CaEVtth72PsHJb+Js
	2Zo9D7BWpksCwBjyyTCok1Y4zPpFjXCZM4onFRafb25I0D8qKRQIWFvUpeNxYw3n
	X9bbbUDw+4w5g14ECmikU4Y/ganBMZpKJZ6u7m607u0VvyYb4rzB1mWNbo3NbjRC
	oYhcqT7Jq3lSZ4GyMhc3WsMbJkLexbvDx2Ygbv1CKPoKba0nTOnw==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uese42787-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 01:42:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWcIpagSn/qB27Y0nndcFcmixf1JxqB9eE24JtMNa0y2WKBuuRrcFuevmxsKKVszM9yjrGlrfhLEGLhBbh4sgDuPrJJ/Y5d19Erk3WNhFuL20S2kxthgPeJjDbDHs+PAm/br72bHu3DqGEJ9yWav201kRSlg8WwH9+hGtxG0AB8YZCKWz0CpgKvVZGfTbWEo1/k6fZhdOTaqDrRkmHVLzmz++Gb1fZrJJscegIXfsGYgwB1AjGBCGZMdJdclTlnvmzz4H7QMhUGcr70xIa7IcbZs2nyvfvGDtWF79koDCqVRiGngD1sEN+rFAQWP/1dPhJ+rIkKPnLvNPtf6EEyL/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmjbl9CLtZi//v/f77ar2E23Kn7hCahEqdy81iAybq8=;
 b=AxQdpz5RybS9Y4qbhd/rq4MWFTxJn/Wo4EF2mnuEDO7Dvf6Tm3pMFCCV+zDip4Z1L7fRB2fDtX11Ed3XnjdlAt6RhQOOLUG3PWMaLr/JBIh1Dh5Z+dIP5h341CK6EHgCHlVazbv8c3v/psz3e5DHe/sobk5UCBnGNm/5kInQEWmvSH5uLTssbsDHQAlpF3A/1g+L9pjdXa5VnNNrDut2+7e23I/nCNgOpinPCpbNHo4hy8qSr7ZcOdQKLDdkQaQ9stqnOjBEqLOd0WCI9g2eFTH8zJh/SBkXQaBWrNKNwSBKxGBoV96WxcprXnzKw8hxKLt49bUKtoT4OLoFDUTh5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6325.namprd11.prod.outlook.com (2603:10b6:8:cf::11) by
 PH7PR11MB8011.namprd11.prod.outlook.com (2603:10b6:510:24a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 09:42:01 +0000
Received: from DS0PR11MB6325.namprd11.prod.outlook.com
 ([fe80::58c:71ab:32d4:dbfe]) by DS0PR11MB6325.namprd11.prod.outlook.com
 ([fe80::58c:71ab:32d4:dbfe%5]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 09:42:01 +0000
From: Kang Wenlin <wenlin.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] libxcrypt: fixed some build error for nativesdk with mingw
Date: Tue, 21 Nov 2023 01:41:54 -0800
Message-Id: <20231121094154.3406211-1-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0076.namprd05.prod.outlook.com
 (2603:10b6:a03:332::21) To DS0PR11MB6325.namprd11.prod.outlook.com
 (2603:10b6:8:cf::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6325:EE_|PH7PR11MB8011:EE_
X-MS-Office365-Filtering-Correlation-Id: f49e898a-46c4-4198-5e49-08dbea761c9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yGrc+g2ZPKF/ee1rGFgyQz3bu6HMDIBfHoYfOawPuvK4y92bB6ic+zWuU+BcCLNB6MfaAJtWd2oL3y4+JtNum2tnUqfxdH3a5We1vsS5rbKps0j5bgU2PeUc4tvVfZcRN8kSmGNh14icZ2UF0BX8FWJFMbqsdJz/SHYd5N3tHpzeDR7R3HIiwfRNiWsJNXa0IvkBYcFtJWENjUrD2FkPMUJtoZZ6wXdGYFaRLN2pUTqRHQG+niJZJ5gyPbsa4z+xWZPyg5tkaIyhZ5KSR/77rfK0lL2e9A5Hje+vYQLWqwQKRsNXws98Y+B9BqSQt9XUklOWJ47wCfkRBcqNHxwp4wtuWOyVxO/ryuTeOOdhADy4SNBcpnjF8PQXdRfOsF+TS8Sj0+3vLqEc51ldIBLnzUBT4gZGwLDVP7njtRk/QUFRob8vcOGy+COLZxzY8E4KJHYqid5iEyfnh+reATWfSVNGLPwLgKsTXYbVqOch/DobnKPTOtUfdJoKTiCbDXMkjIExXUVDimvOhYU0P+vUAudylKcm6hfSc5+IjncDkoi9fws6dsKSLkzqH01odcrIre4RZG2hn784GDfu7OQR3PqbA85MxfZ2Xf4Yqd6hEHJATJRUsM0pLHcDJy7197pt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6325.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(376002)(136003)(346002)(366004)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(2906002)(8676002)(8936002)(41300700001)(26005)(1076003)(2616005)(66476007)(66556008)(6916009)(316002)(66946007)(5660300002)(52116002)(6512007)(6506007)(6666004)(6486002)(478600001)(83380400001)(38100700002)(86362001)(36756003)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2UCfdjbC6ovhOWHdNeYffUFCltSIbvtdtEc/oa1sHwSN5OhF5wRwKqghKQsb?=
 =?us-ascii?Q?wbk+3lBS1U+Qahe/l+AJtDtLf706vB7z/G/faNRq/GllWHg8Q6P1twlnC11H?=
 =?us-ascii?Q?FCT5MopEceTvaW/p1Ciyzjwn4mcno57JkdV2p/IUIzxHnYlFfsCNhaXdVYAI?=
 =?us-ascii?Q?P8ze1P9jqnWHDRk16/qEdmLCiaAgmMe2wN1PO/zNZrZYJcDTzsqpmeaJBlag?=
 =?us-ascii?Q?BdZpHzDh5UIzDHEKNspOXkcR2LzTwDowBE0ZLEhuemTbeK4xERc/bNLD3Ihq?=
 =?us-ascii?Q?QQrG5WsrKATz1mX15EN70OPK77lq2uPpx30QP9cYLq7AE1nGgoi+sCd/n/JS?=
 =?us-ascii?Q?Dq2q6U7n7rUVZd2eXqt+jbx3uHAMhYTIVvy59dPMnWUNQ5jEVGHnlsnJUHGr?=
 =?us-ascii?Q?ZGdJvV5+wqG7vrcfP9Pbya5j5WZYi6Ry4U/zkXnziOG4iGX+rpyFK4WIbzBs?=
 =?us-ascii?Q?ZRrmcWIx1x5y1kHy7D8PLqxCm0GLCBp6KUqmLobQK8yzC3Wyk7iuV7CB6UpN?=
 =?us-ascii?Q?dQRkccezaVCruFXOWrzc+dGqjIldxL7rVKSbPxEAFMBHeZbuTUzKPOGsl9jO?=
 =?us-ascii?Q?kdtmiR2Ja/L8QNDNgQjR5fs8MwrPmqCK3ZR7AXpigzfNSlk5WLSWE1wGb8Qo?=
 =?us-ascii?Q?cw8dATC/dHN4diN5+jtaLsTFT2bJ9F5VdbSlrvYeLBEOIPwkW95JlrziIR1r?=
 =?us-ascii?Q?VM45gvbUDAam99QVj3T0Ol8kBw19yxLoA2HDOSnLKKYW9lsDewoojb8+leSk?=
 =?us-ascii?Q?eF/ZTbTvd1/SBns9SIJGtMYqQBI87B0XFOezI8osR3PB9rpxdCUlArf+r9wD?=
 =?us-ascii?Q?MS2GxkoJrnWO0Np3UvsXPJ5m4kBej+MGlrPxe5w9TXMHhkUE2KM1p6lmrJOI?=
 =?us-ascii?Q?8n/PNm0T/GPcPpfHsjzmpVJVmuV8qbbRzLEoOcU1/xhaimQO7ZbxfXZSCd6k?=
 =?us-ascii?Q?3rzICgVNderytTcCiHK5KR87hZkP15B4yf6Q2PFta3P6umLC/n6TYMz6K9+l?=
 =?us-ascii?Q?bzr9VtKF7NCThXpkttHjHMw8aGrBysHaFho4Wk/kBVg4pkWhrVfBSnpuM8wh?=
 =?us-ascii?Q?FbQib1Qf38hI8kWt492a8jrKFLFbfwmOR/+1WyWkdNVApRfE/j2/PPf1RcVt?=
 =?us-ascii?Q?8pq5JOTVHsvaFm7vwoghpaZ1SRp39JPgJpIiav0j/2YiSav1bomTfQ0FQsZx?=
 =?us-ascii?Q?kUtN3DTYYO5p7jrAUMVKUtRXSRLL/Xxi3WRzt0qrWw3ziGzDJCxnWOumkR1C?=
 =?us-ascii?Q?KUF4pW8joonUe+D69MPWgayDlPbDHFl8nhKZYKIOgAf8SNp9lOhV1CGpjNgQ?=
 =?us-ascii?Q?his99PD4Ny/E2oAvjh15E2mpAI162+SC4dAizKkQoQB6L5eej9MqGZmokCKw?=
 =?us-ascii?Q?snZI+oBiF9U0VC74PyCBI9xtuSC1sSIgAOH1oTl2c7sDws9CVe1Q+ykMqL1S?=
 =?us-ascii?Q?qkqqvGRZ9Kpi/OKvaYAP8JMNa8/zZcIyDzkPymYGC5Tudm2jur/Yve8pMWib?=
 =?us-ascii?Q?1jslGxKLElhGXL8zlaOtdPgkLfgCBokTNL7KReg1yM+yLGkkRDWfGKTB0Pzl?=
 =?us-ascii?Q?A+R+VEzOuxMeZnXYqmTvdk7vzeCCR0ZndyUbmIMblyovC+o6VlYpKKjNzazK?=
 =?us-ascii?Q?LA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f49e898a-46c4-4198-5e49-08dbea761c9d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6325.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 09:42:01.1644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2IuAlyDk3KT8pHareJjLvA5Adxm9rBjvEwyFPOw9uEYJAmqtVA3KbhgQ6EszJ2ShOVn6lFO1ZZSdFsie7Okkg3knWoA1IN08HX0XxUbZow4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8011
X-Proofpoint-GUID: 3JJXetk_LH0CntKsEtP-LHdVzajIB6SU
X-Proofpoint-ORIG-GUID: 3JJXetk_LH0CntKsEtP-LHdVzajIB6SU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxlogscore=849 suspectscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 clxscore=1015 adultscore=0
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311060001 definitions=main-2311210075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 09:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190961

From: Wenlin Kang <wenlin.kang@windriver.com>

Steps to reproduce
  1) add layer meta-mingw
  2) add line in local.conf
     SDKMACHINE = "x86_64-mingw32"
  3) bitbake nativesdk-libxcrypt

Fixed:
1. pedantic error
  | ../git/lib/crypt.c:316:24: error: ISO C does not allow extra ';' outside of a function [-Werror=pedantic]
  |   316 | SYMVER_crypt_gensalt_rn;
  |       |

2. conversion error
  | ../git/lib/util-get-random-bytes.c: In function '_crypt_get_random_bytes':
  | ../git/lib/util-get-random-bytes.c:140:42: error: conversion from 'size_t' {aka 'long long unsigned int'} to 'unsigned int' may change value [-Werror=conversion]
  |   140 |           ssize_t nread = read (fd, buf, buflen);

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 ...dom-bytes.c-fixed-conversion-error-w.patch | 47 +++++++++++++++++++
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  6 ++-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/libxcrypt/files/0001-lib-util-get-random-bytes.c-fixed-conversion-error-w.patch

diff --git a/meta/recipes-core/libxcrypt/files/0001-lib-util-get-random-bytes.c-fixed-conversion-error-w.patch b/meta/recipes-core/libxcrypt/files/0001-lib-util-get-random-bytes.c-fixed-conversion-error-w.patch
new file mode 100644
index 0000000000..3846f76674
--- /dev/null
+++ b/meta/recipes-core/libxcrypt/files/0001-lib-util-get-random-bytes.c-fixed-conversion-error-w.patch
@@ -0,0 +1,47 @@
+From ff99091eb8a6b9e6edc567f6d2552183fbaacec3 Mon Sep 17 00:00:00 2001
+From: Wenlin Kang <wenlin.kang@windriver.com>
+Date: Mon, 6 Nov 2023 14:43:28 +0800
+Subject: [PATCH] lib/util-get-random-bytes.c: fixed conversion error with
+ mingw
+
+With x86_64-w64-mingw32-gcc. get below error:
+| ../git/lib/util-get-random-bytes.c: In function '_crypt_get_random_bytes':
+| ../git/lib/util-get-random-bytes.c:140:42: error: conversion from 'size_t' {aka 'long long unsigned int'} to 'unsigned int' may change value [-Werror=conversion]
+|   140 |           ssize_t nread = read (fd, buf, buflen);
+|       |                                          ^~~~~~
+
+In util-get-random-bytes.c, has get_random_bytes(void *buf, size_t buflen),
+but in mingw-w64-mingw-w64/mingw-w64-headers/crt/io.h, read() has "unsigned int"
+read(int _FileHandle,void *_DstBuf,unsigned int _MaxCharCount), and has:
+ #ifdef _WIN64
+   __MINGW_EXTENSION typedef unsigned __int64 size_t;
+ #else
+   typedef unsigned int size_t;
+ #endif /* _WIN64 */
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ lib/util-get-random-bytes.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/util-get-random-bytes.c b/lib/util-get-random-bytes.c
+index 79816db..68cd378 100644
+--- a/lib/util-get-random-bytes.c
++++ b/lib/util-get-random-bytes.c
+@@ -137,7 +137,11 @@ get_random_bytes(void *buf, size_t buflen)
+         dev_urandom_doesnt_work = true;
+       else
+         {
++#ifdef _WIN64
++          ssize_t nread = read (fd, buf, (unsigned int)buflen);
++#else
+           ssize_t nread = read (fd, buf, buflen);
++#endif
+           if (nread < 0 || (size_t)nread < buflen)
+             dev_urandom_doesnt_work = true;
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index ba93d91aef..b93d56b4dc 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -13,7 +13,9 @@ SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=
 SRCREV = "f531a36aa916a22ef2ce7d270ba381e264250cbf"
 SRCBRANCH ?= "master"
 
-SRC_URI += "file://fix_cflags_handling.patch"
+SRC_URI += "file://fix_cflags_handling.patch \
+            file://0001-lib-util-get-random-bytes.c-fixed-conversion-error-w.patch \
+	    "
 
 PROVIDES = "virtual/crypt"
 
@@ -26,4 +28,6 @@ CPPFLAGS:append:class-nativesdk = " -Wno-error"
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"
 
+CFLAGS:append:class-nativesdk = " -Wno-pedantic"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.0


