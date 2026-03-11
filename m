Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333791049528
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 09:59:16 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16610.1773219553252693267
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 01:59:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=jFDheV9V;
 spf=pass (domain: est.tech, ip: 40.107.159.61, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMbpaq8VyAYzq220GB9O9nYW1zrAibRBeiDovZjD+Sm2xxbz6ZCmP0VWTuMVDRUx6sC0pO/tjzVWSaMRdl4LwmOFNXuHIbCm2hoX43hZi21RFquHgcmxKxOxYfvWVJg0cn7sGsYvLvAN0pBBs/zPsgvPATx0nmxN7RxXh5hW6P3P9XK6riz6bPJ/wYS/rc/+tJ020ZVqhv2FWww4PJpbeUNJT0vQU7B3RTNV4n7PINfcVMeJo91/Sf+DvE0fG98S7a0jE2Hu/+o8IjOuSj+cBXrThJb3pHZXBC4OF5FigtJnFCaPWIxJvI9v3jCs+jykvzvtTfHIzpKjduyUD3R+BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abV2yTvIVQq8WlaUSmzS8b5MXYu+Xc820vFD5AbW+6U=;
 b=PrVxHoD3X+WRowXfW6OddI4Y9mhN9/7vfNrKCJ0VfFdRfLyou3MO6rmrXu4rUWwR9AKbVyUYW7yop4CsszolFQS/NkdKcMhPCCZNP626c9jLZAGE6XcFV2bbDZ+CGQBVMArBAom6MU/pPReRl5cZKd1V9V3Ds5brNdVZx2/ACBKx6AdjyLrnH2uqqjsN8JUPTXh6D5UeFOSXO1TMd1b9rKK0qyCTarvASVjoRI8/uMPpnKFHlPOqs4ERoWJuFczLfXpx7KkNv0slDFNsdi5aeHwGk6kX4woaBk+HW/JluyH0y1rx7LkISPIGVaEmrd9Uwsj92WpXl7u3jdb0royF/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abV2yTvIVQq8WlaUSmzS8b5MXYu+Xc820vFD5AbW+6U=;
 b=jFDheV9VdMNJW4fyB3u5QVdWAmkEYrMeBIqbMLWNfYzxnNI9Qa6CWCvaEyT9tS6vx29rTTKZNOhDNJmLSqlHuveYGYoW+2K2ljKZVKvW2GEvxFMKjFo8xVSY3PEztL9CziW6DVja4ffuelPz+/2grSBUvDBoSTD0XqLlJM7d+1y9a6a1EVXU9AMHqGGZFHbE/gsiGyUhVzRec0zuj2EbMhPOPN9indyX3DDorR6KX08XDBTz/y0cpPdfWZ2AWuQEjlEcPnTHwX9SYlWyGj9COhZ45c6Dc1tZbtpsK7pVWqarkeRUpZI2G1chxvbPaLbLAs4RKNgQwJjkH88613kJog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by FRWP189MB3228.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:182::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Wed, 11 Mar
 2026 08:59:09 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9678.023; Wed, 11 Mar 2026
 08:59:09 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH v4] python3-pip: Backport fix CVE-2026-1703
Date: Wed, 11 Mar 2026 09:58:57 +0100
Message-ID: <20260311085904.409863-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO4P123CA0036.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::23) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|FRWP189MB3228:EE_
X-MS-Office365-Filtering-Correlation-Id: c7ad61ba-2e71-49d3-364a-08de7f4c74ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	K0MBTVh7FT83GJbfuB2/RZ51FlvYn7RIxmkpzgDU2hci4eQ3RDeT86S6TJsdHgQ2lIZOi33CNN5Yqb8mSknw+gCw7lQkd1INo4M70VwHRG9P+2xnyQl6gjtSY4UFN4GFFAv9RlxW7rZUJhfcvBuiYuhQZC9p1N4kjVhmiWnuEuVmSSX6qRpc2iKZLH8E8hOwzxZslwNhVcIyK1NuxXWcHYXcVIj5Mz12VFWfHS66wh5KH45Y/X06gD3ZvykcsML5ZHZta6WzgZ6tq915MOnh8Ma/DMIe6F56+sP0ZkzFmkWZJIYm4fECGI8QQNbMxhPaVXGad3eiyjL3r0sPwpptJTH8LlkIYyYnQLmOtWdsei8NOVNjlPRcRZTXxkQu3jTaPU7irYPM3Gvfq6614HI9VKI/CeFAbP8/rqfzFBJ1Q6vXAHAcn5hbkVB4kCblsl7XjN5a2Q1YFEL3Gu04TuvqTEGRnxsNeVnEse6C0nAb3IGqrd+FGeCcVSb6JeW51Etv+IRQhrFIPsaYJj+MMTgAXdwAgMyOHCgjQojTIvjSB71Z7UDZqjAQcBPnMn0XTQQ+KbYSqMnGD6vnZNAZfRWo/xln+0Jqdhd8hzWcXfZ//M8yO2v6rGfDQt1AmrDWOf+4vYJG7i9A/0IxHfNDj/wgeK5zQ6cKEe+18dBgFJe3Fpyxog7qk/HRMCac6QXt6xvn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sXPv+a94MvgSCwSxfzz1o64eIIiONYT4SfvzGGZ9AB7oRUHZPbTzJwmkgGpv?=
 =?us-ascii?Q?PRN2Da0Xeok8+63ZF5Fxw/pF8XR0O8XUhH7Pd5NmhSTntn7gXDdIlCMU7dMc?=
 =?us-ascii?Q?L8vloqAp2fRUZPwzSsxpp+kFLJRp78IarXGeZK9uDckW6W00hex/Pigqj8p3?=
 =?us-ascii?Q?jKhxBKx0gSCkb/gni+9awP/aN/wf+0NaLG5A8idTvRz9FYmRt7dWv+uBzYCN?=
 =?us-ascii?Q?Pb5DwpaEUUNI3Wbeo58XTWQ4wyw0iYZnxTvrO6g32JmyFC6em28xS/EYNy3j?=
 =?us-ascii?Q?eWbc2eYKJTvx0r7sClfLdj8tduMbmtQkuL9CrORfghWc5XifSuZ0B7xhcf8l?=
 =?us-ascii?Q?ErVeReTVveAqjYgEModu290BsFixPLbVfkghFl2tAzCoQyADImRZthLQcHho?=
 =?us-ascii?Q?9wtlP7/3oMrRz2bldjV+uZh6msMMYwVioKnjvaPjhUYtft1lNMn557kM87FI?=
 =?us-ascii?Q?LecEGCDN+pjk0X2z71H7+qx5BfhgoGODLchudF0so+ANsDzA5mWaPbOwyQ3R?=
 =?us-ascii?Q?vJq5froJj4KIxTwHMZwh4rxVyf6Y3hd2wBYd4iGNw33kQbsCXGVToxD0szSz?=
 =?us-ascii?Q?WdiWr9sEdvIZRcG8BCV55nUpp/A3x73Ssh1B7AxEB95K/GLXIv4FPn4bLsoU?=
 =?us-ascii?Q?UJgHRmO4Rnd1mackYEntjSmLy80M4gALKY7C3eomrI2tbGDhMmHk4xiijQHz?=
 =?us-ascii?Q?fXnRP5LPRHKVtBUk+t77l36cU8OJb2RcPiapeRawqhITKk4bsf11bEh1VUhL?=
 =?us-ascii?Q?6J74BnKKCq3B7BJYvqRaE/3mbL6cFHdz8xTBrCH+YHjR7x2RNtXWd4hizOdl?=
 =?us-ascii?Q?AaFWbTOd+hdyoJVs/97CviHu4ockDEqArU8wm5+G7nPPGGhPuK5/pPRv6jv1?=
 =?us-ascii?Q?evH1cDsSJwuqij9s+O7G77I9D1FrKVGnAPKfBQd1yiHxKlyKoHlRg/QBgTE4?=
 =?us-ascii?Q?EH/t6tIaZIIhAHYf85/UxtbDoWsn6ZytV82b19DX10uhLXnI6xKoMx2KH0gA?=
 =?us-ascii?Q?4sUvgL2JsK1CDKWI5OpnqBUXvMpkMq74b+mG9thA70bBHp6jJ5E3NWme+iAW?=
 =?us-ascii?Q?y40Dq+8GjTPxoqjBRqic3FuJFvc9U6jTSRzG2RYgRQ1NO99DPflnwh9DJmFK?=
 =?us-ascii?Q?X8KxtWUQHHIVfGCg3B+zvWWhhsZzl0OOS7DlJ6RZ1Vy5lJHVzHPa2M9Fjx51?=
 =?us-ascii?Q?+aAVywsJP/ZTR5aW8KIxF+pkRPZlu8tkzpRkPys26a+G5+sEE2yOPVhtfa7j?=
 =?us-ascii?Q?+3coSLEeXeMjdQO9827QCE33YQh0fBeKOYS1bsJJTbRcNN6G8jYz0WuO85wR?=
 =?us-ascii?Q?3CBmETFoHG3CdcJBTNS5oEesu0iwbCTOqIixviij1JKkCsKFgRHJTnE/JGgT?=
 =?us-ascii?Q?2h4m+z53Q9DfrQQPCarwiED2sWUQHGtWMCZEzpV5HdS7CTsT/f4l1381Knob?=
 =?us-ascii?Q?9xPTy10Ix4KiVcTiSkJPNtB/EAx21muXc1XMHbKOkR9f0Jt3Z+/l07Y0SYsU?=
 =?us-ascii?Q?q4Z2Tu5Dqi3E6iV9ldXCLWv4EZgCkhq7cZkyJDy9DTCIgcSZYkVkY645PX7u?=
 =?us-ascii?Q?rC8bgV4zJDnaEjMiYB4oxuvObhlUrTrG9uJFrkyxURIsWJUrypeB0pGrOWS8?=
 =?us-ascii?Q?XicajLDNgfoXAfh84qM4nt4ejsEnOzELvdFb07n65O4lZUGFfEm+AFPl8kO1?=
 =?us-ascii?Q?Ttwt9c48t77BbuG4iET59RJCurVCWqv+bnc+Pfwkx1yT1p5SFwJYyxJY6CdX?=
 =?us-ascii?Q?5SdW/f51JECn5Q/pvzxi0Hbc6X3cQBA=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ad61ba-2e71-49d3-364a-08de7f4c74ee
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 08:59:09.0271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N18Xz2NAJhBcqGNkE1825gEC92DuRvRF0z0+tbbaSSWPFjyv7UwdpLm0XK1rARInNi8oLufDbWbcHXAzj8P44mewVrjMGRE3J57L0Pcarsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3228
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 09:59:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232860

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Include the patch linked in the NVD report: https://github.com/pypa/pip/com=
mit/8e227a9be4faa9594e05d02ca05a413a2a4e7735

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../python/python3-pip/CVE-2026-1703.patch    | 41 +++++++++++++++++++
 .../python/python3-pip_24.0.bb                |  4 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-1703.=
patch

diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch b=
/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
new file mode 100644
index 0000000000..0462b2eb58
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
@@ -0,0 +1,41 @@
+From 80ed8403c764fcad8e0ac3d491f8b3c7c62a0e5b Mon Sep 17 00:00:00 2001
+From: Damian Shaw <damian.peter.shaw@gmail.com>
+Date: Fri, 30 Jan 2026 16:27:57 -0500
+Subject: [PATCH v4] Merge pull request #13777 from sethmlarson/commonpath
+
+Use os.path.commonpath() instead of commonprefix()
+
+CVE: CVE-2026-1703
+
+Upstream-Status: Backport [https://github.com/pypa/pip/commit/8e227a9be4fa=
a9594e05d02ca05a413a2a4e7735]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ news/+1ee322a1.bugfix.rst            | 1 +
+ src/pip/_internal/utils/unpacking.py | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+ create mode 100644 news/+1ee322a1.bugfix.rst
+
+diff --git a/news/+1ee322a1.bugfix.rst b/news/+1ee322a1.bugfix.rst
+new file mode 100644
+index 000000000..edb1b320c
+--- /dev/null
++++ b/news/+1ee322a1.bugfix.rst
+@@ -0,0 +1 @@
++Use a path-segment prefix comparison, not char-by-char.
+diff --git a/src/pip/_internal/utils/unpacking.py b/src/pip/_internal/util=
s/unpacking.py
+index 78b5c13ce..0b26525fb 100644
+--- a/src/pip/_internal/utils/unpacking.py
++++ b/src/pip/_internal/utils/unpacking.py
+@@ -81,7 +81,7 @@ def is_within_directory(directory: str, target: str) -> =
bool:
+     abs_directory =3D os.path.abspath(directory)
+     abs_target =3D os.path.abspath(target)
+=20
+-    prefix =3D os.path.commonprefix([abs_directory, abs_target])
++    prefix =3D os.path.commonpath([abs_directory, abs_target])
+     return prefix =3D=3D abs_directory
+=20
+=20
+--=20
+2.44.4
+
diff --git a/meta/recipes-devtools/python/python3-pip_24.0.bb b/meta/recipe=
s-devtools/python/python3-pip_24.0.bb
index be4a29500a..35428260c3 100644
--- a/meta/recipes-devtools/python/python3-pip_24.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
@@ -31,7 +31,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52baf9=
5163b597008bb46db68030 \
=20
 inherit pypi python_setuptools_build_meta
=20
-SRC_URI +=3D "file://no_shebang_mangling.patch"
+SRC_URI +=3D "file://no_shebang_mangling.patch \
+            file://CVE-2026-1703.patch \
+            "
=20
 SRC_URI[sha256sum] =3D "ea9bd1a847e8c5774a5777bb398c19e80bcd4e2aa16a4b301b=
718fe6f593aba2"
=20
--=20
2.44.4


