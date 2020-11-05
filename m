Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.69])
 by mx.groups.io with SMTP id smtpd.web09.2313.1604608736524001028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 12:38:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=X8KQdnQd;
 spf=pass (domain: nxp.com, ip: 40.107.3.69, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwZ+X+wi3zS72DSqox7c98ZIMpCHOmQHge7uwLMJc9CFgKI+BuFk4Sb25PzhLsyzd1MZLJwMCWrFfrP63dWbnqYlAXE7GpVd1Xa9EoGcBFnWI7RAbv4I+5ETh86OA15MZOcZ4pL2IV8PdFtFAENE/s/lBI1c8xQ35hogD5OScQVwRVrqHWZFQZIFqLPAI6re/n0vuDW1MO1fjDGI6VjXIYDpQ7Zzaw+KwR4M1NspFJCs+tBkDDD2WYRd7KQ5k8CsNX6cWXVGtYFsdJNPrqd4apCzR2dxWGUMAmOFyWH6b41buAJVVr1+T+XmEbDnzfCSOL11JnqEqJUa5L7eJPSPeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmrn1RPpL/EOzeyhByGBDnxU0bWnA311XK+PH7wEaOM=;
 b=OZyfRiTGD+gXaI7AniPE3xlSAXHzDL2+qVTCpxGVGaNA3qctNcaO5oZGUgz0VuHM6zHhcJ7il46/pRlzejqgYcAcyOLfpmZYe8mwl1A8tL2o8ipKzc1VZKLnmFtQDE4onUa3k8vq/flEVBt9VEhS339gqevcyM/YU5yyqjJvaW98fC2gelFB7C9iK9TTN2JwfcFbvQgEMqLtXFYhNnQ8wnorUaV/jDcx0hyWK5MYauAQYC/hw2J4IkjyVUaPORsEDCN4EWZiRVGZlCsG899qTvF/hBxIl6YYBeYeIdLQ3E2ZLNmk644KaNXzeQ8170V25baqd52/eSn16gyMMgTqVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmrn1RPpL/EOzeyhByGBDnxU0bWnA311XK+PH7wEaOM=;
 b=X8KQdnQdU50cFH8HcbfRpZmzN+KAI3wrRLtlgHJPt5GbjtfWXGPQrFbppVsyubfokECBD3r6m3yFr9/59J13V3bORYyXDs4Ir5xc3SGmP/R3LkljOXflxvJ1WdVKR8+aTmoGf4/UUz+9Jf00tFTi94AXoKLFcOBD90BaWqd+ZZ0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com (2603:10a6:803:124::21)
 by VI1PR0401MB2431.eurprd04.prod.outlook.com (2603:10a6:800:2a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Thu, 5 Nov
 2020 20:38:54 +0000
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com
 ([fe80::88a6:6d6e:dae:385c]) by VE1PR04MB6621.eurprd04.prod.outlook.com
 ([fe80::88a6:6d6e:dae:385c%6]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 20:38:54 +0000
From: "Tom Hochstein" <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Cc: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH] mesa: Add xcb-fixes to loader when using x11 and dri3
Date: Thu,  5 Nov 2020 14:38:20 -0600
Message-Id: <20201105203820.19558-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [64.157.242.222]
X-ClientProxiedBy: SJ0PR03CA0080.namprd03.prod.outlook.com
 (2603:10b6:a03:331::25) To VE1PR04MB6621.eurprd04.prod.outlook.com
 (2603:10a6:803:124::21)
Return-Path: tom.hochstein@nxp.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from tx30imx-01.am.freescale.net (64.157.242.222) by SJ0PR03CA0080.namprd03.prod.outlook.com (2603:10b6:a03:331::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Thu, 5 Nov 2020 20:38:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0db75d8e-a01b-4cf7-c20e-08d881cacf88
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2431:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0401MB243173CC874CD9CA26ADBFC7E2EE0@VI1PR0401MB2431.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a2Im/FFmBzG0r8JUS/Rd/5heBXosQLPUJRT/y3Q0Xsm+TzrBbp24iq5Mzcx7TK5Ma+Dc0up1TCTqk6A+TMMTnkU1ErV4SmSvYztESNOvjPr/RpVZEqFx+U4+fYRXs7NTwOJyzeXBMIiZ93dS9WAC1QX33I6WKwEMKTnJPARd5DhfmKKEWf3z8Kiuin76mdxH/Grs/SJVUcUvHaVWuqbrr6vxKUTWtyXL3UZ5zbBggbGWRaEs5hdx/nPwmshOSg+29KhITApXyPZgupbIvEF1kGbvVCsfd6EMN04rUzZzJtvVcI6gBLflYQ7MVxSn4d+Lcaix65p5/qCfyizHdg8Cvji3QEt2n9FmGuHeoazVPPg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(2616005)(66946007)(8936002)(44832011)(6486002)(86362001)(66556008)(36756003)(956004)(4326008)(478600001)(8676002)(6512007)(5660300002)(66476007)(186003)(16526019)(2906002)(52116002)(6506007)(26005)(1076003)(83380400001)(6916009)(316002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	w3Wmpi97VixG80H7Weol3ZitB94j/hw8SyFEUdHwK7Ugy9LxaDGtDB1yyb03Qgh1lt+XZDHgXvbNQB9JU5Vp1s55XS64NvCaeDXmrbL7Xe8PEyKGo4FtOMCGyW87tTrhAfBr23Kvh4kc82FIlsRth7H27Pl/CyCmIFUQOJkdlZs4h/kypdHmngxWqdmnyu2pMUXzRyvcUcRLhNEuNoE2YJ2CsLMkAwcIBbXHARgxTqfVThPbRNp3R8S3BxQCDmlexSzJYB2mfPNR8orEFzQWEVG5J1UfZda5Ivy4GzockdR/AyOAXcfuPiIFp9db93iT1HdpxiY7x6EgMQRlnwUVntPADUD43BLJn8ylCCltzEclbb8B1jisEvzFlWxreQyO7ZaSUkKeByrJ1cdrDF7fuyGEEFcujVhJKpbZR/CJQrFAmHKOkuULdIn9JYiyiJ237ZDpcEM+YVFXxeMy/emQb5Pn6Ei5FWEjB7CL9MhdpfIu/WkQYjJrQWdOTm4DrEJiMEf0q6rnt0R/EliaJ38eJIcVeMsFnuUiMBGlkcVotlzU/KWRuqHyvyV7ghIp8rn/iOPnvGxEuFS/ZuH+j7pxsgMzJC76n2UVUxpVQINxbLu5ngNrWDuoDFkNrcdJExXdmeXn+Xclvg0gY0nssQbdzA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db75d8e-a01b-4cf7-c20e-08d881cacf88
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 20:38:54.2286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XEcjS4BtOdBY7lXybAy09zVBAbgDydsIVPRwABsVG5GDoD8WsYVgrDdCmS4CEkYL0i60zNIj0b2GhdfTYl2rPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2431
Content-Type: text/plain

Backport fix for undefined symbol for xcb_xfixes_create_region in loader_dri3_helper.c.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 ...xes-to-loader-when-using-x11-and-dri.patch | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/mesa/0001-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 15f54c5acd..246ed936e7 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,6 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
+           file://0001-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch \
            "
 
 SRC_URI[sha256sum] = "d1a46d9a3f291bc0e0374600bdcb59844fa3eafaa50398e472a36fc65fd0244a"
diff --git a/meta/recipes-graphics/mesa/mesa/0001-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch b/meta/recipes-graphics/mesa/mesa/0001-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch
new file mode 100644
index 0000000000..9ee72880a2
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa/0001-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch
@@ -0,0 +1,36 @@
+From cf17d6251653f4a98e7c4f904ea2f0bc0ecedd5c Mon Sep 17 00:00:00 2001
+From: Duncan Hopkins <duncan@duncanhopkins.me.uk>
+Date: Thu, 15 Oct 2020 12:14:57 +0100
+Subject: [PATCH] meson: Add xcb-fixes to loader when using x11 and dri3. Fixes
+ undefined symbol for xcb_xfixes_create_region in loader_dri3_helper.c
+
+loader_dr3_helper.c uses xcb_xfixes_create_region() that requires dep_xcb_xfixes to link. This is dependent on with_platform_x11 and with_dri3.
+But the source meson file does not set this up dependent on with_dri3.
+The build was initialsed using platforms=x11 and gallium-drivers=zink,swrast.
+
+Reviewed-by: Eric Anholt <eric@anholt.net>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/7164>
+
+Upstream-Status: Backport [cf17d6251653f4a98e7c4f904ea2f0bc0ecedd5c]
+
+---
+ meson.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index cfe02fa6373..3cb3c904927 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1782,7 +1782,8 @@ if with_platform_x11
+       dep_xxf86vm = dependency('xxf86vm')
+     endif
+   endif
+-  if (with_egl or (
++  if (with_egl or 
++      with_dri3 or (
+       with_gallium_vdpau or with_gallium_xvmc or with_gallium_xa or
+       with_gallium_omx != 'disabled'))
+     dep_xcb_xfixes = dependency('xcb-xfixes')
+-- 
+2.17.1
+
-- 
2.17.1

