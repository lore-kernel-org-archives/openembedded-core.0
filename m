Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF43AC5DF7D
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 12:29:21 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7636.1787056158598812296
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 05:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=mE4uP7dg;
 spf=pass (domain: est.tech, ip: 40.107.162.4, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MuRu+eDX0+RxpNTf9hTd0sERB0ZATBPELuRafZKFjLQoLlgi8V4uy889jMHGs2f9w04M2wUR5HlNifEtD/vIvHn1rGkbHq/R5Y5WhMNlpcme3rz8RjCMI+ih1qio8zKvvWiK7/I6TKCzNKEm1AUTzKWwC36khROGR25+CyMUfAeUzqr4zZteTt9g/+Zdrm2uJ3bQgNFrEYK0ZRUY0e2R5uVoomCHbqXbZ/NhiOUqs61kWpBwzeZ9gVPLyZ/uqlHQ8OPvEa3uP8RNLemat9A+G/mrdw4pPVfWD3aSXTwBJhVN1A0lNs1P4cLTAgKuC476R/GnOzwMqpKzQEaQb+CGdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MAXtrqnfzIJPuJ5suelSCg9oyM5spkJiD4oS+k6ISrs=;
 b=C2InhSP2fqiu0Dz5i4S11pNFPBH9xVt23uwNyWL8bzk0B9p/A/7LUNJfHQweBbjp/i0Ql5UvkiHQyG7oLresuGOJ3oFvG6odD/jvAeizuk2XbZrfiblyPwlg3bj8QgWa8Y7cNm8kqcyvPSbwET0IhKDuoAHl2D00CBDuDzyxac7k0Q7cJXAEU316qZHwmnkWlqqF8qVvOdBGl83nPkxuWOXxYX+hoglUDmhViZKfGT4GrG+h7xtgcK6q0Vsnu7ZpTCZ4KCZlN/CDTUoOeny3wK6Pw5YO4FrshifcYAjyMrW/OrccTipujvj70qKBr+1fYksF+Fn3UDSanwmjKe7Gsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAXtrqnfzIJPuJ5suelSCg9oyM5spkJiD4oS+k6ISrs=;
 b=mE4uP7dgxX9L+j5d95NnZhgi3YmpdP2aHN+ZI76BU8SHNh4DCINGThjTLlnnlyfO/9mSYY1iy6ZzAQENrLW+NAoVkBWQKswBMFXZkblTC/oPpUBF34t2SWoZxwdSkE7jDnmLqEMwjRFwOe6YlxDB0x6lA4zhaXk5K54erG8N4gadZqUp6fNdAnjN5rSMY/XRWDeSbFqogEh5KQbLQOKTMR3XTktSq6/YTTE/5/8z504N+P3JugNqL8a3Vpom0tPgSqZrzOV+0bYjWkgTOn9ajsx+/6Wt/25jpW1N1Oz85YGaKOrrVSyaM6AUF85krTB8pUjM637EFmrwRDaNxLVrWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB8P189MB0796.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:122::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 12:29:16 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 12:29:16 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 2/2] powertop: upgrade 2.15 -> 2.16
Date: Tue, 18 Aug 2026 14:28:57 +0200
Message-ID: <20260818122857.54302-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260818122857.54302-1-jaipaul.cheernam@est.tech>
References: <20260818122857.54302-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P191CA0013.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::17) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB8P189MB0796:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a484056-9dc3-4ee6-06cb-08defd245191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	AoxLCsY6qKeVQSEIFIZptbmfQKbIcr2keOSRrUZ5z6Dfv2d8yBamZbiWwSQ+C8atHGdvTAb3Wh13fQVrwOqMHPDROB/ju4fzTg6hkUutpIst+4C164JZq2UAPoV/yg46EVbY9AW6gwLJOIa54t3amDMM7uVN7hNlk1A9OYG/5FaSAigz+nTBK8xb4NwBvA+kuPbmOI9lqsozX8uhStwa9xz1gM7hbNnb54GuKwoIQUN42fqxc50vd7Qu1ilmv5DsBUnVKcUAmvHzQD+2UPdmODe3O7daZqccBQouT1gL1JD7TOnjYjox++vfZry5znKE71tFvRdVwC68KM4gm23Kd6HWWbYqNMJr0A3nERPRca25hTx40kdIR3a+qgCgL7PylWwP0mZdnQz3P26VMty7ceFJKhLe+G3h1QwLejl+8ydl98s02ILrtPZw50qCvD19HL7x3vBNiElDB6pCvsahP58bXiBwgLMXHsJe46xO5m1BsaEto77Q55IuzY9BEVXww+EVwxVbSWGKXtrAM/KvOqlvG3cNUwjxijSVrH8oMd+FwjUHD+qYr5wGU8N/TaVhCKYt70c99gBjW73/ZRz8YbxDQLeJrIm2zjgYpVRqCkfAkvF/kYEc/H1ROhRChYaL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lCOYtfSSZOcP1V7NpErfHqAFcAB+tzKM1+C3WcwIR4aXseI/X3GhJq8Ttia0?=
 =?us-ascii?Q?eLdMHFQNR/kRhfE50MK2Se0xDvBJaAiejXcCW1QyuxxFwT72vhD/yt/5D2Yv?=
 =?us-ascii?Q?T+J0CCeU5mkOZ5M1GD9pF4zRYaPdWz+n1a333htcFXL34hDzB4OhMuUt8mjG?=
 =?us-ascii?Q?n/6xZCMNOI6U3DT8VurtvDEACXumSTD+3UmhszIkUWckln8qV1AASwNU9CnN?=
 =?us-ascii?Q?ujm8Fu+8OUCr9jeOmovKZRtg+RjHKidVeN7OitUDUxl4nQLOrMTOZorEuiGW?=
 =?us-ascii?Q?11xgPXe6e7H/xygHAeDU4oC+nYKJ8k2+azeSg8koDPqTPWC6zIHaszaUZ/YK?=
 =?us-ascii?Q?I9VjiFvWqm1hIDAFTriRP0bm9DJnpm7x3YPvyfZkf7bkHz1ZvQUvymay9Ijn?=
 =?us-ascii?Q?0MgdyBBRB7TU80aJRCEUyqiFFDsjJrydParvcQhKje9hsj6JOfcnQiIT5Tla?=
 =?us-ascii?Q?8a5EIHs4rlh0wDVvsJoCtqT2igRHkwF9CTw1eklUjryDtzfm0Mly8fBoxA2V?=
 =?us-ascii?Q?nllVfebafSH5ATOqosL5vajsS1VnfmxEMZy8xJA4cg6N8t6xKT2UCDYfYKBC?=
 =?us-ascii?Q?ErzOSjGO9iBl/gL/YwLeeZhpL2RvLwl8zhPlxIFFJ3Qc/1nrmbAWkZpGTNlt?=
 =?us-ascii?Q?1ucKwKKDBUiEWUJG0YezoKwJDbgtpjJQLtJPdvQ3zMoXkuFG7mh5mjIJYupH?=
 =?us-ascii?Q?WdqIpqeLr6H2ZL3LLL28U05XaM1CAE4ufl/0oB1J4gcUvdpQ/4TG0F1W0+eI?=
 =?us-ascii?Q?jlvbhUbu0i2xDkAGiYQb81SSOV0KMkPu63rXhrfCPaxOgOa/qJQ0cEs8iFNp?=
 =?us-ascii?Q?aJJOoLyRTlDfq7zglLxpHdDukWkdu5PRnHdijqAIUeVLJmzemHbReg7zMs4G?=
 =?us-ascii?Q?r3jn9ySjXp2Qg1Qfvp8d7vDU95RYuw3eW6nDAb8yHmkcfyaNSoiBLPuB+A+B?=
 =?us-ascii?Q?hVwAgOT7fCNxLArwlU2ZKANUNasN4UE4Fzg7e4tHl/W9Lw0nbkIF/TAoRqPI?=
 =?us-ascii?Q?4J+eyTXhxgUNm7TnruZM5UjEl2dLZ5HwIphgdmpVz78wFrCttA7EI+UuQ7tA?=
 =?us-ascii?Q?VlUcbVXy90eHj/ToGnEDNFlcSd43CAMeSlvGNyQ/cDeFNKKG4VX2RxOWEOI9?=
 =?us-ascii?Q?58j9ujscxlhBl9MyLxzjHAVM2mIl0t8Zusxy7SciXQ3051CJSGEkVtpvo/CI?=
 =?us-ascii?Q?tvN7zjanTsy1gybpoi5IEPidDecR2JAtlb1slUMCB3lvPkivxtmO3dciHx3G?=
 =?us-ascii?Q?2/4YoAsv/JLtLNP/7oF2LI9FJIkwzP7e78Q9Yk8D+N0b1138L0TBbjEsd7MR?=
 =?us-ascii?Q?HppE7eRvO6joPGzHHkYX90d9v8smoZD7HlAg07WSC3y+KfVy1NqzTu8JWCQA?=
 =?us-ascii?Q?lwztdI6uO9MJRAlWHTTPv5Zx4uj3199CueeGLK6HUi8Gfk0JrSTex+3uImok?=
 =?us-ascii?Q?mI2pscV/9hV/QhWFgifJbS8/zxuRFHJZreOTJ1DW0jSph0NrmNBO9DuBDwTm?=
 =?us-ascii?Q?zKzrnZP6jPIVDwoyipGXNuif5PW/nknYZt2orHAVVFw/IBTJiyApuHL2P1mX?=
 =?us-ascii?Q?jbRxVH4v9P914e6Sl7b5WHBLfuAHFnJnpiWS1nrMlU0qtnELMqcxu+UM8imy?=
 =?us-ascii?Q?sR64D9V3hPx8mNidmx3hPrIEh/TA1/ZdMWNqtbXf/jDNXqN4Wq5B3E13/dIs?=
 =?us-ascii?Q?hErWP0ahKmI2UyEjfYog6QAP3vafPTkcFc/Gul8vqLly6zMg9PKy9s+Czi2C?=
 =?us-ascii?Q?WpnkGE8YExgPdoQCdNRUUXDCEWqbyDk=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a484056-9dc3-4ee6-06cb-08defd245191
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 12:29:16.3529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mb3f2jWX22OSYldfzSlWtUYCf45y3mJUnwCEUDHW1+EPZriY0N78Xh2qD0e0R+cbtGOS4QeyPgSX3Xa36ILhsR8tg4BlORHuVhzZ3Dyke6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0796
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 12:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243680

Release: https://github.com/fenrus75/powertop/releases/tag/v2.16

CompareLog: https://github.com/fenrus75/powertop/compare/v2.15...v2.16

- switch to meson (upstream default since 2.16, 6a18fe2 [1])
- add libtracefs to DEPENDS (internal copy removed upstream, 2b133ed [2])
- use --bindir to keep installing to /usr/sbin
- drop autoconf-archive-native and LDFLAGS -pthread
- drop 0001-wakeup_xxx.h-include-limits.h.patch (PATH_MAX no longer
  used in those headers after upstream C++ modernization)

[1] https://github.com/fenrus75/powertop/commit/6a18fe2d933ad0f16ccc64b40e8=
32f571319c518
[2] https://github.com/fenrus75/powertop/commit/2b133ed512c6852cf81cb98831b=
dfd585c0317bf

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-wakeup_xxx.h-include-limits.h.patch  | 55 -------------------
 .../{powertop_2.15.bb =3D> powertop_2.16.bb}    | 14 ++---
 2 files changed, 7 insertions(+), 62 deletions(-)
 delete mode 100644 meta/recipes-kernel/powertop/powertop/0001-wakeup_xxx.h=
-include-limits.h.patch
 rename meta/recipes-kernel/powertop/{powertop_2.15.bb =3D> powertop_2.16.b=
b} (67%)

diff --git a/meta/recipes-kernel/powertop/powertop/0001-wakeup_xxx.h-includ=
e-limits.h.patch b/meta/recipes-kernel/powertop/powertop/0001-wakeup_xxx.h-=
include-limits.h.patch
deleted file mode 100644
index 7bfca8abfd..0000000000
--- a/meta/recipes-kernel/powertop/powertop/0001-wakeup_xxx.h-include-limit=
s.h.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 4c24fdd8e0a42359df7308155b2d43c28a5e02fd Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 20 May 2019 20:25:00 +0200
-Subject: [PATCH] wakeup_xxx.h: include limits.h
-
-limits.h must be included to define PATH_MAX otherwise build will fail
-on:
-
-In file included from wakeup/wakeup_ethernet.cpp:45:0:
-wakeup/wakeup_ethernet.h:35:16: error: 'PATH_MAX' was not declared in this=
 scope
-  char eth_path[PATH_MAX];
-
-In file included from wakeup/wakeup_usb.cpp:45:0:
-wakeup/wakeup_usb.h:35:16: error: 'PATH_MAX' was not declared in this scop=
e
-  char usb_path[PATH_MAX];
-
-Fixes:
- - http://autobuild.buildroot.org/results/a0b3337cf4a827e6566f8b15b6bb180f=
0dcef7a3
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Upstream-Status: Submitted [https://lists.01.org/pipermail/powertop/2019-M=
ay/002052.html]
----
- src/wakeup/wakeup_ethernet.h | 1 +
- src/wakeup/wakeup_usb.h      | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/src/wakeup/wakeup_ethernet.h b/src/wakeup/wakeup_ethernet.h
-index 682bf95..e0fa628 100644
---- a/src/wakeup/wakeup_ethernet.h
-+++ b/src/wakeup/wakeup_ethernet.h
-@@ -25,6 +25,7 @@
- #ifndef _INCLUDE_GUARD_ETHERNET_WAKEUP_H
- #define _INCLUDE_GUARD_ETHERNET_WAKEUP_H
-=20
-+#include <limits.h>
- #include <vector>
-=20
- #include "wakeup.h"
-diff --git a/src/wakeup/wakeup_usb.h b/src/wakeup/wakeup_usb.h
-index f7a1f7e..15898e3 100644
---- a/src/wakeup/wakeup_usb.h
-+++ b/src/wakeup/wakeup_usb.h
-@@ -25,6 +25,7 @@
- #ifndef _INCLUDE_GUARD_USB_WAKEUP_H
- #define _INCLUDE_GUARD_USB_WAKEUP_H
-=20
-+#include <limits.h>
- #include <vector>
-=20
- #include "wakeup.h"
---=20
-2.20.1
-
diff --git a/meta/recipes-kernel/powertop/powertop_2.15.bb b/meta/recipes-k=
ernel/powertop/powertop_2.16.bb
similarity index 67%
rename from meta/recipes-kernel/powertop/powertop_2.15.bb
rename to meta/recipes-kernel/powertop/powertop_2.16.bb
index 5dceac17d3..674cf67b5a 100644
--- a/meta/recipes-kernel/powertop/powertop_2.15.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.16.bb
@@ -2,21 +2,21 @@ SUMMARY =3D "Power usage tool"
 DESCRIPTION =3D "Linux tool to diagnose issues with power consumption and =
power management."
 HOMEPAGE =3D "https://01.org/powertop/"
 BUGTRACKER =3D "https://app.devzing.com/powertopbugs/bugzilla"
-DEPENDS =3D "ncurses libnl pciutils autoconf-archive-native"
+DEPENDS =3D "ncurses libnl pciutils libtracefs"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7=
e"
=20
-SRC_URI =3D "git://github.com/fenrus75/powertop;protocol=3Dhttps;branch=3D=
master;tag=3Dv${PV} \
-           file://0001-wakeup_xxx.h-include-limits.h.patch \
-           "
-SRCREV =3D "d51ad395436d4d1dcc3ca46e1519ffeb475bf651"
+SRC_URI =3D "git://github.com/fenrus75/powertop;protocol=3Dhttps;branch=3D=
master;tag=3Dv${PV}"
+SRCREV =3D "6147262e506c607036eaca4182ee491b61d06aa3"
=20
-LDFLAGS +=3D "-pthread"
+inherit meson gettext pkgconfig bash-completion
=20
-inherit autotools gettext pkgconfig bash-completion
+# meson defaults to /usr/bin, keep /usr/sbin for backward compatibility
+EXTRA_OEMESON =3D "--bindir=3D${sbindir}"
=20
 inherit update-alternatives
 ALTERNATIVE:${PN} =3D "powertop"
 ALTERNATIVE_TARGET[powertop] =3D "${sbindir}/powertop"
 ALTERNATIVE_LINK_NAME[powertop] =3D "${sbindir}/powertop"
 ALTERNATIVE_PRIORITY =3D "100"
+

