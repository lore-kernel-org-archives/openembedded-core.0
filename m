Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86740CA5FA5
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 11:40:10 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55337.1790595604195884966
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 04:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=AGgFgT+W;
 spf=pass (domain: est.tech, ip: 52.101.84.67, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IrVBJgrJmmYmbbPUGtrv2P/kkkWPsIIBQYYHONPVASJAdW+eUz+S/XDKBZRMM88rKHmnipqt2oqkTHFW1H7/sWGTP1nL2ASp0fLkHijH67HfrWHwjUjaO+tCdidsV6jvWxxGYSxwUm/37JclYJCOmwnWiVNp2FhhErDh/awM3g9Pu4H/m7OgxYqo3QuXQDPsVGesBozdp+GZg0iitihw5CQ0j7HUj2xpBgtKGV+BUm3ZCXmA0gIgb3INo7iUne1VjyGMqBJ4MPOYd+v/jIjYr6HuTTA5IlhXlioDz1skq2t64Zz//tvZYJRdArmjPR9sqLFmSdUcFfIEFsHsE+wbjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGpFzTN6FOJKhbIJn38LMJYaBWMOCY37dGz/KoHfptU=;
 b=Cxq8eYyQsSXaZm0fczdMtQqsu1vkgEcGBikYtLYCw9c/U+Yvg4LnJ5/8rSXVFgd8jIIYRiNkCl/r2UAZ624CRLorVUWkP5K4TnZahW2QkMN8CRPTgPKXdrrjVkrLrV0pMCCfE6AWTZeWcKXt068FFsubCvIFnckunEKUea1V+tClPu9N/mrxQd3Tc0GpR60aPk2jDa+G0Cnopa3wHlPoSHXzk3zc4gu88zAmLX0uHZ2svmsqWjdsDVRsWrlk73GO0RVQMmtA5CRn+BozU8MK/WcOHgqzMQGhMFxZ1vWeAxIbXeszm++ZeOalJ87OL4xE+ANTOofonDg0PlPrsMzffQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGpFzTN6FOJKhbIJn38LMJYaBWMOCY37dGz/KoHfptU=;
 b=AGgFgT+W91IDqtxvX2pI2m62NrXuDUQgXLaoh3F25C/qRVYWqRkxkbEiMvLYETXnsUg5+5BMh18row+GpvwH0Zhiy6H0JymJSKKe9xa1wgejEotOu7WP/orAjOebjixdvLYxCixvKuuoZqtwVkqBm7iA+Ao7ZILK2hQa/8Z07kJN8tfIlSH85UsM5bG36vWhXK9un+dWYXIrc5oGYtoU+tD4jivbS8zMEtf6HdkNzFdjn7nLn7ocPkE4bQRFiVYP4v1qboCiwizm0n7gKy5o30KcRFowIZboQXTXtKsJsdVK7HGx1hfH9d7NT8Y8GumnknFw6WFoo0TrEGsx9KMuZQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VE1P189MB1053.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:162::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 11:40:01 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 11:40:01 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] systemd: Update DESCRIPTION section
Date: Mon, 28 Sep 2026 13:39:56 +0200
Message-ID: <20260928113956.42485-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260928113956.42485-1-jaipaul.cheernam@est.tech>
References: <20260928113956.42485-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0239.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::13) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VE1P189MB1053:EE_
X-MS-Office365-Filtering-Correlation-Id: cece1fdb-74eb-4e8b-0392-08df1d553b23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|11063799006|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	DBbvSRoT9xff3kFY2WKYZNfRHPtJcXrL5BEyx5Eu+Ely1TiZC/POHqZ2B6NWI7t78zLgtkygntX9Gw2qp8FBb9bcg5H7NkIQQtQzOF6uVha7eoFkG6z+m79MWy5z++czL0Zth+02btQka3CPOzpbWsFzhA2jrN+XbuS7PZSg/FdN0/UpuxCNSmJIXcI7cNDoP2oGUlvczsCdMyQUTHbiUs1flT2qlWGY3b5vKSZuP6smlDGnuPdf7lmObas1J3hfRa8qA1TJawgWpuQo7H5EJ3YT1KwE/lH6X0nYIRZXsqhzZLKUoIyz4Yi/rR2dzo26KPxKJpSDlABY+qVY4rzGtFIoc5FinfGeZm1ohfr7OoGzPaFw/d+UPFmiKAdRWGfg6AHVXZdCvUuYo1+AxG/tIrxrUtTDVeIBtYwORVgAyfilwmWO2v2CJlrjAo5bTqhlBedxDYclaJXA8P+w1NptR2bIKP7ru4W8sNlfThQlkaOOkPkxceyeM0KS37dxJTUsEI/EtOW2dndpG8Jed9CX1Tfu5KM/xQEJEtd61RF1iBn+OhB35HdY1SXhlgN3YYr/P4W0U9NCSp7YdC3dCU/J9sIsXtfuHhBKhj2nu/uaZnw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JdRVH+865A1gWq3J0207rtOAEp64vY921ND1efSblq/snNxKgTexE//doIyZ?=
 =?us-ascii?Q?gZ+2uPsZCkbNDVyzHFvkiUNmK4jpnXV+AhF+e++Fffit8kNPL4TYpoliVWpR?=
 =?us-ascii?Q?GGbG6Of9bXNRxxJ5F+tzkpMFtSJp2K/wDJSk/qW/lBv/se/eqWv7pnN9K6Pm?=
 =?us-ascii?Q?9ZloKYWj6abSEspPnFWMS37hwX8Dfoy2j0WRJckXy7zDgV7OGLTU6tPw4c8Q?=
 =?us-ascii?Q?/bpRRJiwm6/j1uZBszi/Uld8bpl9CNuwSEUo3+7K/f7aFPzFWBaIt1VFAp96?=
 =?us-ascii?Q?y9K3uTqV+bucrdmjREaWzf2+RHc7H3npuGsGPqsVjQghm0uAhmYt6T0n25jC?=
 =?us-ascii?Q?rSiVC3W/waaqR2RcKYcZ+cDoyydhCLXCcpQiLfJVKJZuLMyYQ02/IY0ONS7G?=
 =?us-ascii?Q?fy+eBdYyvJlvRKmNvd5Pu0U10IlAVtE/Z8/jBIF1rfMy3EJZSuawZb1kKDbg?=
 =?us-ascii?Q?ThkHG/FAtmoZhJweDskaP2R0Q6VaykIyCVfk3FhZi8SDr1EsZpbuX2Cvn79Y?=
 =?us-ascii?Q?Bg9fFvK8aWo/cFtQU58o+SlX5es3uJpPjHuu1cDWiIaIskZb5JlA22AbNNLR?=
 =?us-ascii?Q?8xHZ4xz3XXS04Bb9o/4Yq4P0blYALugKpGjv56nosMh6qOT3WrKY+vj8FjlQ?=
 =?us-ascii?Q?X1dzeBF2d1y5yL5DvpEdYsGEz9Pjv0ihV4XM1tfh4mk9kdKNnwsfMKA1fj57?=
 =?us-ascii?Q?6O9nPI0JydfpyfZ2OBx/RbFFbA3lngBUdo85jaehPemRPUPCAaQywQXLygA4?=
 =?us-ascii?Q?4mkKvuPtmmRtUaoTmOZYsuN57gocEj67YcMI68QJqZz8mY2iTBBIfViztP6t?=
 =?us-ascii?Q?KTyhzlgEvBOk0IwVu8F+j+Q4241RDw6YM8xmK0CUvtsUembsQlNiNWgshcrG?=
 =?us-ascii?Q?QUgiGzscVI8lo7f3B4xyNMWeoiaNM5+pJIoal3btklOTqaVPRsCvza1An6cd?=
 =?us-ascii?Q?KUmNIAT1RsQ+PrQguT3n5t0VN2czslp1qqFLBKDKfefQ7XCG8w/qTTx/zNF/?=
 =?us-ascii?Q?bHiw9D5F8T7g/GvZ34GwhsAc68GgKuyf4Jgn9AMtm8cfJc3h+LTZoiIvB8TP?=
 =?us-ascii?Q?oNxtGc80IQOgECdmAop4siQzR1AjxMIVK27AoRPuf/+OqEhzmehmD7wo4Xk/?=
 =?us-ascii?Q?loe0Aa09yFyORUhXFZW4qoQ6KEnfBjBUuSaao7n1W0SZQvNlNp7QAc4qZPMA?=
 =?us-ascii?Q?fnoJKchMoOW003e9e51rgsV4CHPkBgW+tIRKTH6xS5/vq1ItCR1R9gGqlMky?=
 =?us-ascii?Q?/Qd7/9LxriyvM/ScsyUi46B6dk2Yhth+0Ys5c9WEIOROUZbgtpM0wgrYnYiN?=
 =?us-ascii?Q?5rnVx23Q3S19jxMaxQPk3ksI85o8IY26pxEICXrX5OhhcAilJurQphFvFvjp?=
 =?us-ascii?Q?CgdaJ3oe6kVy2v1xFWPaUGGTJti9GAN+2l3lGrIcbrErqRAmH6Iu86kWr4V7?=
 =?us-ascii?Q?JzyCZaMnBj6Ekc0Fj1kUr2MmIndMTpXaWKpstBgPux2sTbIXEcQbok5D1hhY?=
 =?us-ascii?Q?lzsTJQXiLF2+o/MP+f9eqA+PJbz2EKLQGniDZ7tO4MOf0YgJnKbF9vvVfHSD?=
 =?us-ascii?Q?+mA4cNz3VGAXG1wG3zMuTnvjF6bpPsfbiro+dJBxfQ7ObPJWzsS7U/CFH2gG?=
 =?us-ascii?Q?sjopwR4G+6GU9NRrj2rttA7oTyKdTeQVjnftchLFFOvhxFMJAfJjDCy89+WZ?=
 =?us-ascii?Q?KW27nGD7d8szoN9BriTrZLaQ6yJ1xm2wfXEvRN7vVftBsRhMDVWTvx362Od4?=
 =?us-ascii?Q?EIO2BT0ghA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: cece1fdb-74eb-4e8b-0392-08df1d553b23
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 11:40:01.2671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQEjPtQSiVB9IbQPwrkLWCeFGvf58eyC2wIjoGmpP/jgRFzVKWtnxNJv7DUs32ga8a6HmCOZWPoMCihl4yGUBQ5klG667MKjgB8028zfGK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P189MB1053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 11:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246757

- Reword DESCRIPTION section based on updated HOMEPAGE

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-core/systemd/systemd.inc | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/syst=
emd/systemd.inc
index d3760491f07..3efc48f65bd 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -1,14 +1,12 @@
 SUMMARY =3D "A System and service manager"
 HOMEPAGE =3D "https://systemd.io"
=20
-DESCRIPTION =3D "systemd is a system and service manager for Linux, compat=
ible with \
-SysV and LSB init scripts. systemd provides aggressive parallelization \
-capabilities, uses socket and D-Bus activation for starting services, \
-offers on-demand starting of daemons, keeps track of processes using \
-Linux cgroups, supports snapshotting and restoring of the system \
-state, maintains mount and automount points and implements an \
-elaborate transactional dependency-based service control logic. It can \
-work as a drop-in replacement for sysvinit."
+DESCRIPTION =3D "systemd is a suite of basic building blocks for a Linux s=
ystem. \
+It provides a system and service manager that runs as PID 1 and starts the=
 rest of the system. \
+systemd provides aggressive parallelization capabilities, uses socket and =
D-Bus activation for \
+starting services, offers on-demand starting of daemons, keeps track of pr=
ocesses using \
+Linux control groups, maintains mount and automount points, and implements=
 an elaborate \
+transactional dependency-based service control logic."
=20
 LICENSE =3D "GPL-2.0-only AND LGPL-2.1-or-later"
 LICENSE:libsystemd =3D "LGPL-2.1-or-later"

