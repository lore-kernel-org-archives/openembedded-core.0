Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E861CCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:21:58 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15837.1762158114459664447
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:21:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=G5CZnLAj;
 spf=pass (domain: navimatix.de, ip: 52.101.72.100, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=loXEOBViVvzSQ9zDaXjsVmXQTnYR8+tc8XC3ypp5dn71iF/ntmzYibWtGN04prn6k1dWHmrPpjcneJ+DkY963Ou7U27uFRb4o5RiN9MDbJoT3BXP7Y3WVKFYCzyDTRS7IBmBjSfY83U0VOcwIcER53Rl76/sUy7IPXAfgC0ZRd8lZ1ZukQJXFFmkpOjzO9EhBzWwDt4i8LU3PXmz/qaUoI1vQJ8VYJWHd5yZye/tD6yvjHwvq34PWCg4Eg8Mziunwj2Q46ZzAk2yzYm2Ug/o+Y+Lf3p3KaJMSTe7mmfR9qzW+Kww7sdNGsJ53VQGlAAibPo9axAft6LltpFakcp4XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9JI94HwteExG7wWOS80Ce08VhNLYp5rC3SfY6ndvMA=;
 b=gf64GVyIIqgsvitl7A3UcH+bL6jC7WzoWfaea4evOWJvrbkeE3hoYu9O74KcKoBLfHu04+GhisHWOenlg+smgojh7s0Yub7a/GCAntCDYl8goSsd8me6WxEpDPWWVkvajg7gfJ54Uc5eGEYP4XeCkS9Grmwd8HsXkRQYNqIXLBhZJ79Ulf2u+OztSuH7fm9xCzn3oifig3d+v10VGw6TbVc9SUKUTHgMb5hp3EOz2ZY6CQfvYqV0b7ksZr6UR0PajOI+44kGlmv+J7X4DtzReGkx9NhLAVqvAR7VAHoPcisafPFmjxweQryyqpocWZewca1yDjUEGWx482femmm4Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9JI94HwteExG7wWOS80Ce08VhNLYp5rC3SfY6ndvMA=;
 b=G5CZnLAjNnywcA7ZRwXgl5+jY0CLLICyF8TEmjvNxklG5iZNHloX5Mq94p9da6nTvqQfipDOOGolRbkfNNFWyHaQsZ2wqxOq8G5fLMORtUeafdBcm29F0xDyjLIht+pc1MbbVurc3na8S0r0sZRlWdiY+wUHdFIME516qN7ROUU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PAXPR01MB10285.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:24e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 08:21:52 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 08:21:51 +0000
Date: Mon, 3 Nov 2025 09:21:50 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, ross.burton@arm.com, 
	richard.purdie@linuxfoundation.org, joerg.sommer@navimatix.de
CC: Ross Burton <ross.burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [kirkstone][PATCH 06/19] gtk+3: upgrade 3.24.36 -> 3.24.37
Message-ID: <922e4dccbe871dc663538ae40323bca8993cc83a.1762157680.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0394.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::29) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PAXPR01MB10285:EE_
X-MS-Office365-Filtering-Correlation-Id: bb066e90-a427-4c52-8eba-08de1ab20a9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5IdhRmOTgqH9LC7b8RiVJdT8l5KlxKcCFFQlhRvRjJEaaaOUrjAKrlEscYuX?=
 =?us-ascii?Q?uJwTJssDq7LD4KTvdmpWjd4CoeSRyCkdNbOJV8kaQ3Q4hOfOy4zMbtbhcOda?=
 =?us-ascii?Q?bfcy7it396tQB9hcOgyy9Yqh6boxfODZVtJWLvjYjMraDSfrVVnDyEaj11Mg?=
 =?us-ascii?Q?FaBb7fCW5oz94Czs8EmfV01c67TYJAmW9XS+6F85dEaq2wpHAwGUOGqmacMA?=
 =?us-ascii?Q?4go8laBH0IvOs1cg8CCj5ZIjJkYXXAsi91+170u/66a2+lECFG0f9uoCtOxL?=
 =?us-ascii?Q?sxHfFB+kQX6SvRhrjNZCyrIyY43t1uOGx+Oc/W95A4bwsAfcRNlAJ/b9jFLm?=
 =?us-ascii?Q?LiCq+xjlgrByTNuBCqhF7Ev66o3z2rU5icp3VYIS9Sjis83ujIQi1Uom6QHO?=
 =?us-ascii?Q?oIIdCs79Qf+/ATpSrO9zIXTDBOQKFW1cM7AmQzMQRkaeMIg0l8lXZpPW9+KW?=
 =?us-ascii?Q?6yBATGrhBU+tGhYyKNWeUXif964gLIj27ze7I03gL9UmcrfT5JUMFdk96dDS?=
 =?us-ascii?Q?RNdT0KVfUQcWLR73HlcNZbwaEJxMADSLC7REuiZgZKofOibJ7sdlf0F9KUKF?=
 =?us-ascii?Q?XsTSOZ2ax7SeC9JoZSo0UtLwUTsWsOo/6BCZL0fQRIHhB3l95IzseH8iTATo?=
 =?us-ascii?Q?IuBFWxnAlTkkIUyTA6nYxProFYh03wFAmduzRi+59EZ9FqPV718gx54/In/n?=
 =?us-ascii?Q?8J+RX2sLuYXJFHsEMLbxdPjyuTNf+JIQ+Y3m3TygamgKaeYScIZIQTF+SXPk?=
 =?us-ascii?Q?Y51TKm/GOlULJd4cjhmuhuAiPgk4hAfesPr+GxZTn2WWadCNAGXrNb3qumVI?=
 =?us-ascii?Q?ApHVmunc2dLxFehwuRcXJJtvbpGdXbh2mc84MpNJJksh/YHDElFHWqm3+RMZ?=
 =?us-ascii?Q?OBWusUdXzuOdk+jcqmIGeM+HpumnICBKIPIQnEnGvkd3XnnB9TjxOcI54xrq?=
 =?us-ascii?Q?XwMQ2yFTvMvPKtmheQVPdw1YRDTDbfeB04rr4uBl17wks7P3e++yYMenboxK?=
 =?us-ascii?Q?iG/2vwEA3baK+fJ+bZbjQiiT4IgjJvagZx51e9BU2VPenbF7IpKsePJqFyDo?=
 =?us-ascii?Q?PwRelpYYczmmF3EAvQr7nCXjKt/viFwYHAYjFmD7BnTav6AOyGsr0JI67Fgk?=
 =?us-ascii?Q?NlLT4PoXN13/7m6k8mvYetaTNLCTZRPo7CdXR5RxNcTSidim1yZSvD1L7ohM?=
 =?us-ascii?Q?3gm0QOA5wwVM1n4z55koFdWCHIjHgPnLM3SPXrV/WqKxT/DjlBc6+8joqJsi?=
 =?us-ascii?Q?potqaMYFbKGzbCV1ivjBlWgwsRUPGbmD3i2c76EJTZfJyH4Zz39cUwxsojlQ?=
 =?us-ascii?Q?alOYwmMb4e3OZ9gRPb+MQSyRBkjFgTUBh32OGm+R9+vdWKvPhHCk1Aeqeqxq?=
 =?us-ascii?Q?I/PfMHCG/7t4a+scq0x0yv76/Ie9AybQMqGjQgm45bIfeSJqBbtRFcbZv/UB?=
 =?us-ascii?Q?mftu3jDyJ2OBkXq1zAYItejVGswlUKfKBMwxjDThWTkD4vz7CWag5g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Qvfu4HL+wdq3VmlxABnDb4KPpfPHtCq6Nn7c4LpdO0rDcU6M28T3gCtYkBZv?=
 =?us-ascii?Q?OD3ZcqDonIIBIIMxOQf5X9VhiPwhsVr6VPs5npFD/K7g8C8TwD3yaVgfMgs5?=
 =?us-ascii?Q?RjeyncGj/lp/1suKiUnsDQqd/borHpofTLHTHPHa1op6tf7n8c+Ios/SwLLT?=
 =?us-ascii?Q?drr6G8E8umA7/84Nj/nghtJWusfXVGj9x21kQO3zEzLGjMH4YmRyh3iwirvL?=
 =?us-ascii?Q?GgcvLxBjeKARwMea/ILLEMYCVW8mRgQBaKkzbRITST4oJHAWUjsfQ9A9s86T?=
 =?us-ascii?Q?FiWi6fUnAwMZUtymb+Ysge5WbqUxtFI0UJx7e3hZv6w9C6aEPqXmW4Wn+MRg?=
 =?us-ascii?Q?mStZkdE/5sBbD3tkqht5trAw+o43oFl4PV6luRIon4S/2DNz/hUFURVwVLh4?=
 =?us-ascii?Q?ov38nDu2jZ08qui7GMzW7dp8oxa9ysHJiSK18N32ouldukfc40D7LXDQAQwu?=
 =?us-ascii?Q?FTK1MeAOKv5ic7xqExbws6V5bEs9jjDVaY+/9FnIUQOaKaHkhHzq6KTw8KZ7?=
 =?us-ascii?Q?JyljMMH1mGZiV2uGbXfdLxwBlIzAweIQJ9j1SfHtmFiSozam3c+di8bELMrl?=
 =?us-ascii?Q?TF7Z9RVNp/PvCK0jUEMgjAxqKvKKlfd17rPndldn7IuFz3tUFL7xFj0xcna+?=
 =?us-ascii?Q?DxEPVEbp9zfPuki7so75pjczSuNDpiabYnVI7dsoAZ7x5meIZo9vOT6aFGXD?=
 =?us-ascii?Q?XD04rcRswbGQU325ltI7gHMZV8MPNgc8VtjBUKiXVKZFjz/1jVJgc/QTSLUA?=
 =?us-ascii?Q?Hr7wT0A+DWXbdgIskI5H45oH0+kidSSG1XnJbYiKX8qt9p/WfOxi/mMWkzl8?=
 =?us-ascii?Q?KpU1ftAqMucZ2RTb/RAqdn8HLZa/kd98h7/3lKwU1B4sUaPe8RQ5uBtwAoOc?=
 =?us-ascii?Q?FpQ1AZsZjRstis3bWiq+DRElris6pIleBq/hMT6COBMdYApsrIfnaFod2ufP?=
 =?us-ascii?Q?gTMsC7jU9QlhHnttIuP6UIKVIpx9PdO5eMIvqzd5t3zPPiqvAufHpv5WjUl1?=
 =?us-ascii?Q?/UffVOmKL2uHu6UkUOy9+aO81r8bY6tiJfqin0baeF3aah4T63ontJjMvY5I?=
 =?us-ascii?Q?B5tHeZ9cMMspaoABA5MO1ek2Dqb62qafp61UgoNcWURTN4b9Y/s6Xj1jSZuz?=
 =?us-ascii?Q?NYFK7qsVwWAgKGcjA6IQg01iUh1ZGAV3C4Ey0NM9AaESAQxkjyYrkYcDF47U?=
 =?us-ascii?Q?BCZTMkHYGSWSFyPr8/0EGsMNjvrYZFxtix2zpe3so846qdrN2QfplYxsZdgw?=
 =?us-ascii?Q?b/BVrbLf+lR5ge8tdV1Kueevb+F3kwJXLphANAwCd3qhVdxX+4Vxntg+CEs9?=
 =?us-ascii?Q?wBpGoTYblTx+ADKfrscNeQzVcfW3BA0zJeC4PIRWoopOVUgqiWT1rkJvkQVT?=
 =?us-ascii?Q?wPe5fYKrGohumdrxvjRmJ04aHX0FeUOl+9PplmJWz1UUtoo2R2RxDxtPtxy4?=
 =?us-ascii?Q?81oxZJSD4n9uHhIgkl5DCnUX8sAkQoOzYTOvwuIl8jawvRucRp2ifRRhQ+/v?=
 =?us-ascii?Q?Mj10YQcpOH5mtiynmIVzne7NYlH9btvhx9gVNu/l6UgtyMZ4oPGSD/CFRKvi?=
 =?us-ascii?Q?6dUHcqizO1469dq5m0CHO1MIUqHbqKI2AefZc+SZKvvg03AOYmlz3uQKjkSw?=
 =?us-ascii?Q?rg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bb066e90-a427-4c52-8eba-08de1ab20a9a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 08:21:51.8602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PbUNrLcxXptaJKy4KSL61BAyQSKjzM6VXAWI90PtxwdccdQ6PlfIJcOpLjot2CZgPvokqLSmNHokxaPU81xpxwAnhWhwQcZ13QgC1bhTw84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB10285
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225620

From: Ross Burton <ross.burton@arm.com>

Drop merged introspection patch.

(From OE-Core rev: 8ac81784ce414057039bc16417a8b2dd8f58497d)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Cherry-pick-of: 801538a3495cfc8d7d3264e470336ee5df5f1048
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 ...d-introspection-according-to-option-.patch | 34 -------------------
 .../{gtk+3_3.24.36.bb =3D> gtk+3_3.24.37.bb}    |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/0001-meson.build-build-in=
trospection-according-to-option-.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.36.bb =3D> gtk+3_3.24.37.bb} (7=
8%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/0001-meson.build-build-introspec=
tion-according-to-option-.patch b/meta/recipes-gnome/gtk+/gtk+3/0001-meson.=
build-build-introspection-according-to-option-.patch
deleted file mode 100644
index 11effd421f..0000000000
--- a/meta/recipes-gnome/gtk+/gtk+3/0001-meson.build-build-introspection-ac=
cording-to-option-.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 6e533d5598ef875f30b84d931aae11b768465869 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 2 Jan 2023 15:00:02 +0100
-Subject: [PATCH] meson.build: build introspection according to option only
-
-The way the check is written, if the build is native, then the
-introspection option has no effect.
-
-Particularly yocto project does want to disable introspection in
-native builds and enable it in cross builds (both via the option),
-and without this patch the former is not possible.
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gtk/-/merge_req=
uests/5382]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index bfc33af0f6..94ffaa7769 100644
---- a/meson.build
-+++ b/meson.build
-@@ -854,7 +854,7 @@ endif
-=20
- # Introspection
- gir =3D find_program('g-ir-scanner', required : get_option('introspection=
'))
--build_gir =3D gir.found() and (not meson.is_cross_build() or get_option('=
introspection'))
-+build_gir =3D gir.found() and get_option('introspection')
-=20
- subdir('gdk')
- subdir('gtk')
---=20
-2.30.2
-
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb b/meta/recipes-gnome/=
gtk+/gtk+3_3.24.37.bb
similarity index 78%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb
index 3df4e6164c..382fceecc1 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb
@@ -4,10 +4,9 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-$=
{PV}.tar.xz \
            file://opengl.patch \
-           file://0001-meson.build-build-introspection-according-to-option=
-.patch \
            file://CVE-2024-6655.patch \
            "
-SRC_URI[sha256sum] =3D "27a6ef157743350c807ffea59baa1d70226dbede82a5e953ff=
d58ea6059fe691"
+SRC_URI[sha256sum] =3D "6745f0b4c053794151fd0f0e2474b077cccff5f83e9dd1bf3d=
39fe9fe5fb7f57"
=20
 S =3D "${WORKDIR}/gtk+-${PV}"
=20
--=20
2.51.0


