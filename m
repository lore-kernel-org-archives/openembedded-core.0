Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB68ECCFA07
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:22:08 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16043.1762158123888962636
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:22:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=D10yLK9b;
 spf=pass (domain: navimatix.de, ip: 40.107.130.75, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHC+qXZd9Rfe5KeNvDbtxAg5CCOtBe8pil5wFEjKiKolHgQlTwrhvLgZifjhc2sYnsAABktI/O2r58BgbEQkDSfcxxXEPpIiYNWtCM1mOWGJF9o2LW/xEoWn9xxG0mxrYtTjcXD/mX8hYpGyb+mYnkdCM4byPR0WUGqjTin/4bFwJ6BWQCCATATLUGgXuEYzKx98A97TtUqtrS6YA6vs/zKlgKR/D9ixLR7kLvdpE7EGhO1zO8DNvODai43MbGGFYe3uzddfpsmkwsDs3MFZ3oOheoYfBLDjIF2TFSXyLnUwGEJJ4Iu9bFZjKWGhuWnGmpJjmIicrFsO1lG7jL3c4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yv3/jzIp32w50OByc5a/WfFMw2Tal59sQa42oo+DlvU=;
 b=s6oJtTPYbLUliad8mzp/Kca6grvrxJB9TCUU8p1Ql5uj73ahD4P8QciOhfgD9Kwf3gdCDH/kK01nzQf1l0eZSSyBTjQtTD1NFP70FIaULLP/KNuuip8YuaS01uYCTQ94VyiobXQIIu8ISvm7kqQTgY3kd0XHhwCYGSVUIEnmsGW+90m0oSqnfRnH661BxwmMuHRfMnJAXFVoyb1hYk/ULNq217A/A2Rv04g/VMGXHtBNCzXwHGWPInCoBhvdnP+2zqj7YhNlbUEDPIzpm7g8i57TKuDnwcvw+JAdFp2KrCNDVrUQanDpCvUswObSLHx+JT1jBTzimpOmV5syYJEY2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yv3/jzIp32w50OByc5a/WfFMw2Tal59sQa42oo+DlvU=;
 b=D10yLK9b2ihwOG3ZBLgw10STa1WoMPjjgm/5ZKiZ/LsauG0jP39DTFl1yiw/QQeQ5D1pQN/cHRDSeH2R2hAL7zq39iEV3PUvxOQ/U/bHxWHO6m9uyJVxUVdHNtMkj72wMFFacD5Tfy/m0NE/pqr3kq3PZOHE+F9Vk+N8Ob4+lBA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PAXPR01MB10285.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:24e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 08:22:00 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 08:22:00 +0000
Date: Mon, 3 Nov 2025 09:21:59 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, f_l_k@t-online.de, 
	richard.purdie@linuxfoundation.org, joerg.sommer@navimatix.de
CC: Markus Volk <f_l_k@t-online.de>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [kirkstone][PATCH 10/19] gtk+3: update 3.24.38 -> 3.24.41
Message-ID: <66465febe9f717cf1b3221f7513bb33871fd76f6.1762157680.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0427.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::28) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PAXPR01MB10285:EE_
X-MS-Office365-Filtering-Correlation-Id: ccca880b-c1f6-4804-6c8b-08de1ab20fa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VEtrL7Aab5uETCPuan6AZlpY7Bu7TV4B+OHzCrRRhyZ6Bet0NLaueIksIhTh?=
 =?us-ascii?Q?CxWeNh2WYQa6DjCgWV1rLc6n24c8dJm6zEqAq8pAP8Sk1zPAbion2YcbBuoJ?=
 =?us-ascii?Q?JKgobS8QJQ73Q91qmuo3Fr4mQNEPUa6ZtmqWiK44aDMhepzax9n360EtORax?=
 =?us-ascii?Q?y7u/46g1mo2wG/uhzoupvrivXpaO/u1TOKbBMYX+dLaSHw4sT2HIurdDQfzS?=
 =?us-ascii?Q?cxJg3pehmZ2agDElZIEbHHRWkFhVOgiL1awUK3KJKQ6Kbg/+WEAmrzc7KMGF?=
 =?us-ascii?Q?Gysx/uxIFQDgP3SvknYwzwsqw/uQef/GfJHtPAUA0uOGaX983omswvArg9kY?=
 =?us-ascii?Q?/selSw+TGojULNyaVk4T3tSKXE7mBWv8Ll41vJR2tjrrl3nvxnoWonEkmKhO?=
 =?us-ascii?Q?MWZXcIjTic1jBtkYQqAKZSaLR7GwRZjE5/BGdAP3Icx4oBg8fGYG4PP2q89T?=
 =?us-ascii?Q?I6qfkBT/VX+KGcwiA1xLfCn7O3hNCQhZjKbA/TN1IbqT99vFmwSBkjjLo9oZ?=
 =?us-ascii?Q?A46p4gfYA1j8e3tpixDD5XvQmof5zt8sCKsbmNuZdzI0oTYYNAbmtLq0ucX3?=
 =?us-ascii?Q?AFGNpIkO0nrnALbv2cMHUR+tuGkR4DAQEtbtpm/TGR12EU7VWZs5bOhnBp5i?=
 =?us-ascii?Q?LW931yljUr0g4OCknGigUyHMPsVTtTwnhgr4tfK0X7gFvvb0sbZKbaez3TFa?=
 =?us-ascii?Q?CjzFUu2eqMBdPlkAXqa4GuswatEvixflPOPdt4uzvQDg4DBkJYFsq6Ui3okI?=
 =?us-ascii?Q?V2Nxh3bmLjcw1Tni797Wt3odmpZHS6Gu0aJQO4C3xhhZB8Xm/j/izSFsXCrv?=
 =?us-ascii?Q?sZBXykVzGMVNelojHIn7QrT2d/RA8vm1Zqu/GYk2ppMzLpYaqpI9OvACzzfW?=
 =?us-ascii?Q?OIYsT6Iq2cv8puQMqDFZRn/0Y3DxEFkijHd+p38MFP47z/Rs7aLKPG7R1RMu?=
 =?us-ascii?Q?6rHGA78kqOBwAlvL8nZztpBfMzV0NUjAFvvntO01Qt8p8fhv66jxMo/e/Y1g?=
 =?us-ascii?Q?z3Bpc5+3fUnSfoMU9FuXt4exh2IuJnrG2CFHAWcr7OJGj0WRj/Qd86KvPNtI?=
 =?us-ascii?Q?OKBZSSpx743xVSLhmcYceFPaOwm+x3x9JI7NrtmBmLeFl0OrC40MIMndH+FD?=
 =?us-ascii?Q?GznlJRyzCrajutS4423tzVIf6TG2ke5aMQWQf5OlWS713kOI8wHZiG9CIgvs?=
 =?us-ascii?Q?vVD03/AXj0xFseQwwfGFlq+UL23mllfxXG4c12wI8DykF5kQqKkRNKClLNya?=
 =?us-ascii?Q?QQdPj0wHrHEvqqxwbH4eSCo1Klk60WGiJ7gV3WioY1oGFTlLCs8gUTUgOXAR?=
 =?us-ascii?Q?qgWk9e/J5+ztHqKUf0IcmT5t73uY0pFOZQ8IyFfnLO6sHyKIG7T5KZHagYFy?=
 =?us-ascii?Q?9If6t8AkyJFthAH5BbPRZCnC1kscw/UkpBf7Fhn7idnloCbk6gIdkBMOY56T?=
 =?us-ascii?Q?pKAfe/mEQSYGbcCIzOq1/BQBmCUJLQbT?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fXlt9EKlljh7489kIxbOtZ50bFkXkUbtIaptd0rVScN0+DrQQ4L1WyfV0NKU?=
 =?us-ascii?Q?HYGk1YiJmZmqgZg1IdOlt4v7p09OuUlwAPP/CALduaDrT5XB8J4Q4mPJAd0G?=
 =?us-ascii?Q?Bp4Y/KWE4q7C30PKTTh3YwyX04PmUh/B9p/b41Ez/cLDlEnHLKG6UVCnbRdo?=
 =?us-ascii?Q?d2KN74un7tWvfReiJmcdrPUGfWKeF7pn7lhBB6OOQ+yN1+bHZgNzJOchNSsd?=
 =?us-ascii?Q?OZxuVZsRh9+GSwZpxHoAE5K4p8s1+KjhPD/aa1mJeLzRxBhVLCZazvfzENp1?=
 =?us-ascii?Q?fdZbnknqAa20pLfrxh9DBam78q02Qkp9UFRL0XbN9BsRuK3yIYxxVIwH+v6q?=
 =?us-ascii?Q?+CSuf3T5d3SskZ6ZbdjYZMWrlpUlXKbZVkR71g1MBLGF4Oqi4bQmdjmypfUc?=
 =?us-ascii?Q?j7Ksg9ZzD8RJhc+TJnVNL2ru6GoQDWaBeutoo1kbNUvuBy3v2zPHt9XnHwJx?=
 =?us-ascii?Q?9INokjTtA7wx40aLTPdX/FUcF23FYz3XAieG3CmSyVhwT+/bfHfWYJm1aNGI?=
 =?us-ascii?Q?yIgRq237WAe+7HFXJztmDc/E4EIuNQs4U8dSlp4vmWZXRjmr5XibpBxvhtFE?=
 =?us-ascii?Q?3lc6yc/WiW5mYYRY8NwU05UAlhPrDlS1m2qrJU5Q911UwF7OQBxQAg/vn9hh?=
 =?us-ascii?Q?v6/2ze2gjelrSlIevfAv33tlHtjOmfNuRpPvIdPJ6Ab0xhTQCbRVreEc+9Uh?=
 =?us-ascii?Q?eNdnv1+xhcIUmH6Qqc8G4S9tGKjIaZYkDvwAntGWpHM6Siee90ujhnSynS1S?=
 =?us-ascii?Q?lVY2ycXafZ3XSFqPPpD9jX4ednx5e0aU8aoof0dgP+Q/dc36dtqh7NV/DeFs?=
 =?us-ascii?Q?69M6KToI6Kt7NK3MfgR1Rvlo0keS+Z4j8dEuzpzlJS3Qxq4SNYPFu84NA4uO?=
 =?us-ascii?Q?NFIzpTT53h89+WgYhc0t8OKkKg8KhZ7rU9YSuv8D1qIhRUK8uCmynju9AvX1?=
 =?us-ascii?Q?Gd1vyI8x66j656eBtoNNVomKB/dp4eXNTknLKNI9wRzIM4KGgA2wb7K2hEyw?=
 =?us-ascii?Q?boi5zKmOKy5c+CX+hD+rRXeTghteJsbstLZzzIlEg+kznxlGK0EWiyB8zi0N?=
 =?us-ascii?Q?00w0xRUp4qmbTBBl32bI9xJtu+R+eBEj+zWe/aOBAOGScigJ6gc1gp+tTuc7?=
 =?us-ascii?Q?XI1/OxdPfgmYqDqIXOIKcQF2h3yCagMvmUx/nNZ5+ggXTCpZyEAacL9M4YFb?=
 =?us-ascii?Q?2DA7JPmGQ4wjpHj5u0bGdmg4q+gPE+ZjDDHsqECSoWIz4Ukt82H4w8j30XnT?=
 =?us-ascii?Q?7OR7jErzXqI5DP/h+5k4Niv6qPgWPe8U6dDtKNWZr0GPocqub0Kh0oGW8vbQ?=
 =?us-ascii?Q?xAnBO5LOlq213JmnrXEhGt+un+/eAwcf++Jmr3ZPV3iFAWVEh7N7QwdVXjye?=
 =?us-ascii?Q?F1UnQ4/SXx2LBEfUP0hnA7/FtwFEugscIUoqUCggB3IquuRmqzY5LIfDqNDb?=
 =?us-ascii?Q?s+Cg0Z447uTviKIXRwG0gPPuOQrl4OEBcUmJz6j9hNHnSylLWKsRCOm/5eyl?=
 =?us-ascii?Q?+jYUAziFmAqCprMJb5g25nig3rfh5VswMbNB7LKrbUcc1yfBSoO49VZ4mxh4?=
 =?us-ascii?Q?sWyFa+uo+2mR4rEYBkQdvdHYsilKoqDQrgcQwU3DCuZoy4P80WSqM9qkNqZk?=
 =?us-ascii?Q?Og=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ccca880b-c1f6-4804-6c8b-08de1ab20fa4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 08:22:00.3953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tIbZa6dCCXgErM4v0+NvL6aJ9d9dwluKKPOVIX6JJ8S11RnjNsUVWVANmZ+D+b6CGCxC45TRKxo5Ro1zukqUQUEHI3a02/Jl5S90gZ5QxVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB10285
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225624

From: Markus Volk <f_l_k@t-online.de>

- update opengl.patch

Overview of Changes in GTK+ 3.24.41, 23-01-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Fix a crash introduced in the X11 changes in 3.24.40

* Build fixes

* Wayland: Fix interpretation of gtk-shell protocol

Overview of Changes in GTK+ 3.24.40, 17-01-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkEmojiChooser:
 - Update to CLDR v44
 - Add more translations

* GtkGestures:
 - Preserve accuracy when translating events

* X11
 - Support 'virtual' XRANDR monitors

* MacOs:
 - Use consistent event coordinates

* Translation updates:
 Georgian
 Hebrew
 Swedish

Overview of Changes in GTK+ 3.24.39, 19-12-2023
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkMountOperation:
 - Avoid a segfault

* GtkTooltip:
 - Fix some positioning problems

* GtkFileChooser:
 - Handle webdav in the pathbar

* GtkFileChooserNative:
 - Fix closing portal file choosers

* GDK:
 - Handle offscreen windows better in some places

* Wayland:
 - Create pad devices on enter
 - Ensure device-added/removed are emitted
 - Make stylus button mappings compatible with X11
 - Try harder to preserve cursor size with scaling
 - Avoid oob access to cursor images
 - Support tiling in xdg-shell
 - Avoid using legacy cursor names
 - Fix buffer size for scaled custom cursors

* X11:
 - Remove slow path in gdk_cairo_draw_from_gl
 - Trap more XRANDR errors

* MacOs:
 - Make gdkquartz-cocoa-access.h usable again
 - Silence secure-restore message

* Translation updates
 Belarusian
 British English
 Catalan
 Chinese (China)
 Czech
 Danish
 Esperanto
 Farsi
 Georgian
 Greek
 Hebrew
 Icelandic
 Kazakh
 Korean
 Polish
 Punjabi
 Romanian
 Slovak
 Slovenian
 Spanish
 Turkish

(From OE-Core rev: 2378f50d32aa955a269fc747de3af2cb28767741)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Cherry-pick-of: d3b384e899556c4bac8cef1fc43fb054602e3183
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-gnome/gtk+/gtk+3/opengl.patch    | 25 ++++++++++---------
 .../{gtk+3_3.24.38.bb =3D> gtk+3_3.24.41.bb}    |  2 +-
 2 files changed, 14 insertions(+), 13 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.38.bb =3D> gtk+3_3.24.41.bb} (8=
7%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/opengl.patch b/meta/recipes-gnom=
e/gtk+/gtk+3/opengl.patch
index 7354265e10..8f2feb0ee7 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/opengl.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/opengl.patch
@@ -141,17 +141,18 @@ diff --git a/gdk/gdkgl.c b/gdk/gdkgl.c
 index 9690077cc2..55f85ef605 100644
 --- a/gdk/gdkgl.c
 +++ b/gdk/gdkgl.c
-@@ -26,7 +26,9 @@
- # include "win32/gdkwin32.h"
- #endif
+@@ -21,8 +21,9 @@
+ #include "gdkglcontextprivate.h"
 =20
+ #include "gdkinternals.h"
+-
 +#ifdef HAVE_OPENGL
  #include <epoxy/gl.h>
 +#endif
  #include <math.h>
  #include <string.h>
 =20
-@@ -40,6 +42,7 @@ gdk_cairo_surface_mark_as_direct (cairo_surface_t *surfa=
ce,
+@@ -36,6 +37,7 @@
                                 g_object_ref (window),  g_object_unref);
  }
 =20
@@ -159,7 +160,7 @@ index 9690077cc2..55f85ef605 100644
  static const char *
  get_vertex_type_name (int type)
  {
-@@ -212,6 +215,7 @@ use_texture_rect_program (GdkGLContextPaintData *paint=
_data)
+@@ -208,6 +210,7 @@
        glUseProgram (paint_data->current_program->program);
      }
  }
@@ -167,7 +168,7 @@ index 9690077cc2..55f85ef605 100644
 =20
  void
  gdk_gl_texture_quads (GdkGLContext *paint_context,
-@@ -220,6 +224,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
+@@ -216,6 +219,7 @@
                        GdkTexturedQuad *quads,
                        gboolean flip_colors)
  {
@@ -175,7 +176,7 @@ index 9690077cc2..55f85ef605 100644
    GdkGLContextPaintData *paint_data  =3D gdk_gl_context_get_paint_data (p=
aint_context);
    GdkGLContextProgram *program;
    GdkWindow *window =3D gdk_gl_context_get_window (paint_context);
-@@ -293,6 +298,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
+@@ -289,6 +293,7 @@
 =20
    glDisableVertexAttribArray (program->position_location);
    glDisableVertexAttribArray (program->uv_location);
@@ -183,15 +184,15 @@ index 9690077cc2..55f85ef605 100644
  }
 =20
  /* x,y,width,height describes a rectangle in the gl render buffer
-@@ -341,6 +347,7 @@ gdk_cairo_draw_from_gl (cairo_t              *cr,
+@@ -337,6 +342,7 @@
                          int                   width,
                          int                   height)
  {
 +#ifdef HAVE_OPENGL
-   GdkGLContext *paint_context;
+   GdkGLContext *paint_context, *current_context;
    cairo_surface_t *image;
    cairo_matrix_t matrix;
-@@ -718,6 +725,7 @@ out:
+@@ -703,6 +709,7 @@
    if (clip_region)
      cairo_region_destroy (clip_region);
 =20
@@ -199,7 +200,7 @@ index 9690077cc2..55f85ef605 100644
  }
 =20
  /* This is always called with the paint context current */
-@@ -725,6 +733,7 @@ void
+@@ -710,6 +717,7 @@
  gdk_gl_texture_from_surface (cairo_surface_t *surface,
  			     cairo_region_t  *region)
  {
@@ -207,7 +208,7 @@ index 9690077cc2..55f85ef605 100644
    GdkGLContext *paint_context;
    cairo_surface_t *image;
    double device_x_offset, device_y_offset;
-@@ -825,4 +834,5 @@ gdk_gl_texture_from_surface (cairo_surface_t *surface,
+@@ -810,4 +818,5 @@
 =20
    glDisable (GL_SCISSOR_TEST);
    glDeleteTextures (1, &texture_id);
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb b/meta/recipes-gnome/=
gtk+/gtk+3_3.24.41.bb
similarity index 87%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.41.bb
index 3bcb9793ba..94a553584a 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.41.bb
@@ -6,7 +6,7 @@ SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk+/${=
MAJ_VER}/gtk+-${PV}.tar
            file://opengl.patch \
            file://CVE-2024-6655.patch \
            "
-SRC_URI[sha256sum] =3D "ce11decf018b25bdd8505544a4f87242854ec88be054d9ade5=
f3a20444dd8ee7"
+SRC_URI[sha256sum] =3D "47da61487af3087a94bc49296fd025ca0bc02f96ef06c556e7=
c8988bd651b6fa"
=20
 S =3D "${WORKDIR}/gtk+-${PV}"
=20
--=20
2.51.0


