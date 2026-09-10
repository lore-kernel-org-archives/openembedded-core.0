Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2C7C79F9F
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 13:07:24 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9403.1789030958108648240
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 02:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=p796WIwc;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.227.32, mailfrom: upstream_ip-sk@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryFf8v9icqaioIQWH4Q0hqn1ifm/CMLijKK/nM+t2+k4zE6zsOVfLFRkFgP+KM37pvwMkNBYlg7iHeUCkMKKVFcJ6VCJ/UcdRQ2d3GyzSlF1sWv+s5wGmQjYEfpN3gMdOzi2j1N+dXHMicA+aOfQyZeGO9akIyvC5MgLwW1btwwBgBykzzWkDNeQaqJZJm3NTsBxfNLBeuHkVah97PY+Fjz3KGf94s02J1JaEWeveMxd15Yt84P8ovQgINCoTWvPKiNFdHqj0EZuq3ZzABiSS7ynW2gyY8v4UWspzrJMbl4isGCFHyRaxsWI3PimNnvmJh3SnOtsa/iCiAJu4tTTUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DR7agsUpYMs+8AxWQ/9heVVvAbPph7rqUpBbGVeixdg=;
 b=Dwmxel0gWIWYpYeIrVq/8xed1aUelEBH9Q7ym/1TScnfxL2klpFxX48tLjo89F26p09D28SU2hzUc7qDt/PS8PS6pn8PhUw90NYEBaajycl2gdP894BHv3Tt1ppC87fpF/ZApPukpswKLdzfMmn3/TrgImSoDjjooLR9AaCyoy8QwW+rdV3ozFZ5G18uV31VHO+uI0X7zr+sxB58x+V0N+I6ulkVVqOUEy99Iv+u6wLXG5bZ6uzU4/MBd6P4SAlD3Jid+yms/ZwfHc2DfvjTaKArq2P0dL1E42td9vTTQN3Vi36YgpXYqKX7epKGTQ7D5fpQqSBGm/ImYKctDQWsYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DR7agsUpYMs+8AxWQ/9heVVvAbPph7rqUpBbGVeixdg=;
 b=p796WIwcUyVAnTDQgE6I8H6RvrDh7bZrXmIYACwoLnhdqk9WWy/BpU7gxdOxojThMCbSesAJMBlpTCp77nWQcTG2+NdXYn2VjU6GsporPBxi1L/Ff9eoiO4Mypjhgvhjj3VSDjVLrA8PnS4HhNxMSXianfq8GeTUc7RCMuqBzopUOkMDX2H1nLorQy4S2HUkJ2IkKo/9KDzaShB4J0YZ2BxIhYQxIEOhlbtCIjPOb8TQr+aFJwKx7C3UKXibHOvdVQWWA2y+NZ2UbWRQDO9ve8BI0TETJIdUW2fHs+oYjGe21Zing80Nn0Ulxx5YDao43BzVi9+esHdx1TegY+6+pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MAYP287MB3754.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:148::9)
 by PNYP287MB4635.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.16; Thu, 10 Sep
 2026 08:48:09 +0000
Received: from MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
 ([fe80::ef09:5a67:49d7:9504]) by MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
 ([fe80::ef09:5a67:49d7:9504%5]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 08:48:09 +0000
From: Sana Kazi <UpStream_IP-SK@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: Sana Kazi <Kazi.S@bmwtechworks.in>
Subject: [poky][scarthgap][PATCH] libgcrypt: Update license for dbg package
Date: Thu, 10 Sep 2026 14:18:01 +0530
Message-ID: <20260910084801.2582462-1-UpStream_IP-SK@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PNYPR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2b7::8) To MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:148::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAYP287MB3754:EE_|PNYP287MB4635:EE_
X-MS-Office365-Filtering-Correlation-Id: 12185890-e75a-4227-468a-08df0f183d49
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|23010399003|38350700014|10067099003|11063799006|56012099006|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	YEHVWOD5WX2/JhJe1r0Ee4vrhhVD9rQgnO/yNIiXhFWHiuJf2VqEC5MkbbCfdIxctALvsL/9r3SlL0f06crG2KQvuUEg4TR5xDHY1SCjvlyY0dR2QEpUIudV8d5C3CHjJvtzW/M76lt5uNW6ukrH/wvRBiTCs21VlWP+9KfstYNMITfwg/EXFEQgZHHA3B8Qo2c5vS14ST+OC0e4dccgDwPCLCr5eXlh3rlwXND3pWZbj7LsdMP3dA2aOFXctYA53951w6kK/cKhSnluqG8a+oBkOVQ9VHqvZl+z757vxX3bMEPT5DMbBZIrTgZ91zFApvMMlud8QLgCYMg7Qvkgsx/XpgFpzI27pnM5OOZmznuYwCKWC0cvTD30PoDRiRgyrdDGAUung/GZS6NTF40eR639KI8kPw6DmSeaNhHzIKX41XlPG4tTckFofr336N3Nq1kCFvoAf/CFomHBda4QG2wcJI30RaY9wVfTy//nwSgwEcmK1fNHV57yCshj2fghQEJPd+Ybkg0W4Cni8e3kZUJQvOwh/ftUOm2VJWkKnitkTN7SoO0yTR4ThKg3QnRM0Dj27I8blyI8D9xDSJ0cRWCXLNVkFuxz88a3w0PHcQuvO6A6HHtPi3/SFskxFSn8CQOSN/CEtFA0wqnQg/S75JtRfPvPt5SpjOpQ1BBgjrOugdk/hEKoTHs0zh9vUIz2JXhw5n4cQIBXxZuSMPKAprdVM/YVNCckBq5OjhiG5x4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAYP287MB3754.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(23010399003)(38350700014)(10067099003)(11063799006)(56012099006)(55112099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zjPF3Lkj6s4UHbe2Jd8Ko9DpIDQMDv4lbYqXnfdP70/bGY7PCSgp6T+G4fLi?=
 =?us-ascii?Q?JwOl9b1mTyaeEQETJb8aRZnnsWZ+NUMGrJW3HEX//56wcV4CI1ijn2qzYbfi?=
 =?us-ascii?Q?CY4lJl7TZ/5PWOoK2v+bcByZnqMnaNTPJzQhcnyPkfgzayhTPtPfgyYXnVcg?=
 =?us-ascii?Q?z1dt/9tn/1BUzqwOpzgUdAunn5VOHZ9cBpOdcUc+Rv6PSi45ESmfNE1z6HFn?=
 =?us-ascii?Q?JgwRkp3i5bCRjhS8m51KXUYw1cLwWVDajGkwcscCb4uEkqqFmlkCEt4TgvO7?=
 =?us-ascii?Q?3Kr/vxuilWjqYa5D/8AiIOieJAFS5CDptPwsR62oTYHlBALF2i3FZAKAsYlD?=
 =?us-ascii?Q?/cRebUBDM9btEa4Qet6prw0mTNLFLh7ovzOKZNNnWfS6TBqpHMSvMHYCvGhp?=
 =?us-ascii?Q?wh6jxRreX2FKdO/m4tCp4L9KD4Os7f5i0Wqw/i9qQUlzwc8N/IGcVKXhWdd9?=
 =?us-ascii?Q?5WxC7ct2PzwxSOJYpXMsN5KljZ9G4amxJeEvXbxag3YabNyspRYaMf+lcFLW?=
 =?us-ascii?Q?wA6xsudkH/Mohv4wQeHqvpV8+LYzgG8NSXhtTJQ4esQdo8h//GkOYYXuqjZw?=
 =?us-ascii?Q?oX+NOApIXMY/2uyTwAVXlUnwAO2fA0ce8mIoWTlfgrS2PbTfi0VnBPWbIZIt?=
 =?us-ascii?Q?sB2L+ij8eNALAxNaG9OUzjD7NXXvJ38/RIg8LCAO3jNODaix/vpOv0IWWFbN?=
 =?us-ascii?Q?QiStHxSclNJT3BJ+w76fxIO9sPWJDrE57vQ+TufXmDrhtaXDaVzzj7HWdpQP?=
 =?us-ascii?Q?CUjlArxzrjJ6B3t+LEnQTz9rylbTQ251eddNhvOnXBr6BxxJaQn8cv4FlrbF?=
 =?us-ascii?Q?bYBretbfzjXjfiZ4iUDL3An50ott9L7uTv59AVy4w2toelXHzpcej15t5VaA?=
 =?us-ascii?Q?HrdNAUGCRpuO+mkfMJ9q22L8BVeteTiqNL1F6qfHALbEJpQwsqybHwK1yBYp?=
 =?us-ascii?Q?bXTrhk3GjKcqHwky7LanLwXLhLIOk8du6PkIRfEFTEO1Qmu+QPGm0ENbbjmD?=
 =?us-ascii?Q?TysRzXlmw4XEdYh1M3GI132nIrNW87bkwjXyJykzsbGpzCHbKGCWebMwO3+f?=
 =?us-ascii?Q?JtuW2R8WKtCYMsSibWpjreaUtrZvalj0mB1m6kiZuyo1SmTfiF1d13AY6QhU?=
 =?us-ascii?Q?WicDJKaMEKMG9J984mk1XhsXUiOhp7ZS5BPbxwzWZmoyGKtViRD/b38Eez2d?=
 =?us-ascii?Q?gJ4IumwSAz4gr0UO6ud7AIvzGQye5H4zhX4zVotinhNZyCcv1x3098pf77HZ?=
 =?us-ascii?Q?en8H5uUGAqSoUj4LxsBZHkFXj86SI++dRbS50ob2qqhF2u0k9E1pEtyqb9Uw?=
 =?us-ascii?Q?P1BC2JY3pMyYX+G3xXA3TTv///reWqOd8zqyvH9uQo5vShvzx+ozGw78jGeJ?=
 =?us-ascii?Q?MEYejU15btBUxm8ycJ4ErB/9nOFaIfE80+dUM/vgO1dp7Usu6K37w9/AEAVQ?=
 =?us-ascii?Q?pP2sN2yKGpZmldFzMKA8NIMwpvkCEMARjVLZLSMTs3q+KVqe+jL56Nuvx6Rv?=
 =?us-ascii?Q?1yEMagITXeiZwPkkZ6E/h3w+pEW8Y3SGrQo9wC3aZgC9IsBUFISmehj111k3?=
 =?us-ascii?Q?8HKdPpHXO3lauPusUHFQvkoLo9Vcabo6wjq8W+6PITWgGVGTVjPOyWPKRGLG?=
 =?us-ascii?Q?HdNmFWDwVUJnRfj+3eFbV03NmfpDPJjyF/jZQazxGIUp6ABsijFhqmsfaPvw?=
 =?us-ascii?Q?kRUnbOlvJwAHllvrrVGvr1oyJf4l0oGXxG7yuYWjS0BNH2C4pjYr2YjVihry?=
 =?us-ascii?Q?WK+4DJVREhxiiOLeufRx53QctbIWkuQ=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 12185890-e75a-4227-468a-08df0f183d49
X-MS-Exchange-CrossTenant-AuthSource: MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 08:48:09.3521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t8RsIju6+6Mfzfjapd2vRxsEQgLuHup6l6mB/SWR52tDNwobUPW8VxF9ZcukMys2/9kbWbhWQmzLuAeNFN0rO8o6Q//1JooVt3toKecsxnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB4635
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245567

From: Sana Kazi <Kazi.S@bmwtechworks.in>

Set LICENSE for libgcrypt-dbg as "LGPL-2.1-or-later"

Signed-off-by: Sana Kazi <Kazi.S@bmwtechworks.in>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb b/meta/reci=
pes-support/libgcrypt/libgcrypt_1.10.4.bb
index 96e3a692b6..504743dc30 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb
@@ -10,6 +10,7 @@ SECTION =3D "libs"
 LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
 LICENSE:${PN} =3D "LGPL-2.1-or-later"
 LICENSE:${PN}-dev =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE:${PN}-dbg =3D "LGPL-2.1-or-later"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19=
f \
                     file://COPYING.LIB;md5=3Dbbb461211a33b134d42ed5ee802b3=
7ff \
--=20
2.43.0


