Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED654CCFA07
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:22:28 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15851.1762158145672912437
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:22:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=Fs/qKgzT;
 spf=pass (domain: navimatix.de, ip: 40.107.130.95, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDbyghg9wjpngvHSdubN4umy2/U4zVYKPa6niDlmQK6rn5Z4n0HXx8+FBLL/YmMH8R9fBDvylV2/h2ZVS65bCnDcwJqHab4wLrt/o0uHm28AEiLjrJnlbfEKcFJIefoL6prUYepJ6r4w39/h5AsF81/UmDEpjP+Lv7BgyZ49ea+SsshYhUL1FUVCSG1/rxVYR3x1mnAPJrBzK19P65AO39xCzmlhrZzS2kJC6ENXDuxh45Qc+RJbanWuiZbYmB1mWYH8pOD9m9urQBxyyKiE3N+pwtbVSfzKLMlvarWJ7xkhNTIDFzMerGPYQATY2X9fmi24o2WDs91GjwyM2ddNQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhCLpTOUyreEZT5qKIy6F4pNE0xkWCo4ZwcaMZi72sc=;
 b=Ny6a5tFLmH6B/SsQVCID9aCzryVzqhx1XSNC2CkAm1q7tzxV+wZgt7G3kyOjDPxXCYiMjUg7qgoWUQb7CWrqJnBR/hH5ny2Q9f041It9ubzxRtnHYcDly6mrxbEjspPd6LNmp4Lm7svUF57oIOnfQOfTr8+MIFdOL5BMhJmJkQEWikXgEecGJfNW5pybobKJJZb/L7j7BZUusCMO0WaUET9jup7Vvo/DyDbxEIBh5LnU7emfb/1gRbW6TCA6sb0Cr2ZIn20QyfVCsEbfZGSgAA+fNN6EhsPoc84c9VPBy+cc1tK6BhbQ8HQ82Q22fgocF2pmBuBVpUgS23CjsAnWMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhCLpTOUyreEZT5qKIy6F4pNE0xkWCo4ZwcaMZi72sc=;
 b=Fs/qKgzTxrVOUWS8uzBe3cocaKMp+fWRdujAvq43TqeqB5GGlhklUgbRTYYN3QHY7bvl6JFdvm7koT47ZaZhgi3AuGJfSxIYO+595HiKOscaol6qmKOR4BrQD1wBrAkwRe37v27Jtjd/xBDBsTNoBoI/bQphT37jCcpctWOWJ4c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by GVXPR01MB11135.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:21d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 08:22:18 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 08:22:18 +0000
Date: Mon, 3 Nov 2025 09:22:16 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de, 
	mathieu.dubois-briand@bootlin.com, ross.burton@arm.com, richard.purdie@linuxfoundation.org
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Ross Burton <ross.burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 19/19] gtk+3: Update 3.24.43 -> 3.24.51
Message-ID: <32b3658901c6e7b79cb0423f202ab970186bfc4d.1762157680.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0444.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::29) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|GVXPR01MB11135:EE_
X-MS-Office365-Filtering-Correlation-Id: 8732dade-3c13-43eb-a8dd-08de1ab21a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?delz8Z5YcvbcFODFa1Srh3182bwi0U+zRX5ZCAENODueJ9t1GZbIdItDxcg8?=
 =?us-ascii?Q?TPyl849Q5YCVdu1OaPw/9Z1eka24T3meyRFdOxajF9EgSx9G5OdcNu1XgqI7?=
 =?us-ascii?Q?nnXuUzoUjh2C35HxOSzMjQVt0HrSsXtQdMdPryW4bXjVe5qWCKCp4w+qXnc3?=
 =?us-ascii?Q?VbkxEXTtMIfXVnebbDSDcSwqIgJQUc8HjuqFor8KwtDX+mo5Vkl9fbYHjvts?=
 =?us-ascii?Q?0N5/jxXPl44KUH1Yqgvi9GyhG/Qa8vv9WhZydUKYBLOsV37gr7LQiajWIuUF?=
 =?us-ascii?Q?BQRuYe5ZBeLPs6kXR29jHjiO1YOvO/NwxS6tSFHM5s+myCbCvkkX7TzuJuNW?=
 =?us-ascii?Q?34K6mbr3AW2JNopMfYxMgVjzHpG5GliukoptfHIy8ElHc7Pv/haF7hYozWyp?=
 =?us-ascii?Q?wRnXg6lyZi9A2DweRx0SgnwNcKACx8y3u8kBvkysttPsTEjuP0KtbxWz1Vdf?=
 =?us-ascii?Q?Zgj0VxHQmfjaUPB/PO6EJpTTA0/cPyopjmi/sp4+i7Y7QBpd+q1Q21d5lqoE?=
 =?us-ascii?Q?seiv22eH1Ujh3doMz5u/OspjJtmxmkbm8LxfJmK+RkeRVHrKCWKZ10LoXrN4?=
 =?us-ascii?Q?7glRqtR1fcB2ydJbA40G30yXBFyzNzFOSnVmrtnm1C1ZBsu1eXqRFwCZrrRJ?=
 =?us-ascii?Q?sv78A3Wo+FohQew3LbDUizHNe5bZhZNYq9NTAZ/UgWQH5Y4K0OQAOc4lwzsv?=
 =?us-ascii?Q?LCNDIPrK7tzEhybZFNQxqj68nbZu62GJ8JMwpDGezENQdYQLCqKZYnV4buCq?=
 =?us-ascii?Q?8TX+wzIA4sdClzd1kgWLb0XKKtPp4ng63Gp8jgwzfnag2BnXjPDmpbwWzT9L?=
 =?us-ascii?Q?IsDCljzVwFh+YN0kdUA1E/S9YThOofpTxK8sxEAVDXEwa/gGTCh7TG1GHOPv?=
 =?us-ascii?Q?WUUM/V/G4isJMItB4mrB8v2z8Afqos/MI5bgJhdjx3st9T4mHK9mY+z/hS5P?=
 =?us-ascii?Q?3rb0STguyYVNdcNmsr7AfKaJzP0Oa7kDNsLMnETbOWhIAcSRqyereRx+FhdD?=
 =?us-ascii?Q?4H3XXXG42OczAAXUBU2z6Y86ZhNkkL/WWDlx2iurkTDpPQJTbboZkanayytv?=
 =?us-ascii?Q?+fTVtunpLO1QB5YDbA1QfgDAuGKSw5j9lGP3z7xzPGOpnLAbH13HSEviOdzM?=
 =?us-ascii?Q?dBFudjo/D9oFiBXVqrJkkNgGBlBJMc2uAMyA6MTQppXGSpDb7askOvNKvUI+?=
 =?us-ascii?Q?XOZUbodXROGIVhQvVNBH2F2Z69+XU7Q662nV4X7WFQICCVDY0brwFQXe+fhO?=
 =?us-ascii?Q?0ZBlIFLiwO3ct4d+H9T2NRGVonPrsWdbFn6WUDsTh7pouKL3euR/tlUpRr2z?=
 =?us-ascii?Q?GSIsUuERheWbXqC8TSvC9q5DqVGTQ4PevWNLn7RRwEbGmQSBhvY3EP37tXjf?=
 =?us-ascii?Q?nBm/qrdY2DVFtUQ5JmZ/dNQ1CpyRu23JRvxVniYDBip75uO1+b65K+7rLwnj?=
 =?us-ascii?Q?nrjFf/3NjiQ6WBBddFqZ6aJFZI0Va1uv?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RKlL6pEtW1Tx/DIWTcp+EgcahWvftmU54am7M8fx9L2NVej49WppBT01FLDI?=
 =?us-ascii?Q?iJ4m3ToxO31C39W8WzhHRSJJzTNZznAQe1FrtTghSj+tE42YqqQ91I+VWDiX?=
 =?us-ascii?Q?69djjQhmN1mgYsJh0CH9IxsxSw02f416Dt/mTsDvS2OJ2M2cgwDWbweiuUQr?=
 =?us-ascii?Q?W1ngdt0CYVgUaqEV4tqrfFML2Fz/oJwI2WU9vr4L4+9uB9VbfmoVQ/ruceuy?=
 =?us-ascii?Q?P7GQ2vCQlBgXJo3L7DJzDX1QNGhYlbkbcaFcLNqsQeuglwp/o6ynfRi8YWQd?=
 =?us-ascii?Q?BJMqgY6WZeU0l3ZVQCNgUf0MhVBWZh3FGCN23k47LCbtq34hwMKnQx1YSjXk?=
 =?us-ascii?Q?kZfmMn6173w6dzN9IOVZZ8mxouS2uAbQw848YIkvS1F6Bgpt1wRvVBp8d0+m?=
 =?us-ascii?Q?w5JIJnEI8VeijWSW4eQ4/AR5Rc695Vd0nMbRyCe9gt4WwuFFScg/ByRazLNt?=
 =?us-ascii?Q?MYbRUSlXMJk4LkAWI24m0HVqQHW8bj3SwU9GcFKFHa1boxM4IDKALNgIWDaj?=
 =?us-ascii?Q?oI0U9Oy95zJ8XoCQ55xe0tpcitRfYuFhPMyjraFeHuZsJRSs3fIts3+2G16O?=
 =?us-ascii?Q?FJxeeq+Xib7vhLCaHUwd1m7k6aS7VeB9CjlkTvDj+jHnZp/rCl3uNEgKB4vy?=
 =?us-ascii?Q?ouqXcTciKzbVhBrM+S+4eTViRtSb29R6lVy76w7zwbDIQgwsVNuvuqbjCG9h?=
 =?us-ascii?Q?J/o+NxGGoJBLM3mNIsp26QO1a1VwItX8+n5COST1YmjO7JkhZ1PxNaZXDqCw?=
 =?us-ascii?Q?41ha1XpBqRkErFcYLt1nT8nKNBX892h5CGhnoIESVMHrtJnv4ENud7CdhJ34?=
 =?us-ascii?Q?Uo5i4KFQDzTKEZizv/2qoiKRFM/NJlwJ/xGzQZY1rl+zV4giO3kJFnEJp9l5?=
 =?us-ascii?Q?RJWBBJK0OUOuJmNdZ1zDAeKkYyqU5+RkMMFdBwLTmpV5UwmrKA6Gnq5oQhCw?=
 =?us-ascii?Q?JpIh2JjRJiRuf2fow1w5F83VCMNP/p3ceU1bJThbIFsF9cPVf7lMqvd55Nor?=
 =?us-ascii?Q?fKWYPP5ixmmxXlCMjn2KB+SH196NZ6MzJpvTsuBQcOmHShC7jbsAu5TOMPBo?=
 =?us-ascii?Q?gVc7Jv0kdmKvxegS1KLfKgsYgAA1jwqFKq9PLIArZJIrWmjVpxWqSjlkiNsa?=
 =?us-ascii?Q?iC90zz49fId4RmUw7v6Yi8/FnFilIh/UfS1hfXM3DZzREMiXt+ssMsbAizaA?=
 =?us-ascii?Q?ptwGhJolo9iPs98TJiLB3yyEDFcTjFI4CtyEtEaBQdqhHxbNQCiHITF1G+OK?=
 =?us-ascii?Q?Er0rF3iNtaNYwDRuAO4vYor3Kd6BsVteDw8DbS22mr13hc+97pxLWsdGrIz7?=
 =?us-ascii?Q?RemVDekhaNwgDvXFgQuXRiQ9/aOTR6rxX+qgrVka+8wSYXzftk33JLGjpqvc?=
 =?us-ascii?Q?HDN1PDlcMub0e630ELWgOXAKPNwW/85OghdcMm6JKwikZmgzyQHnUTchNTmZ?=
 =?us-ascii?Q?PtX+xwaFSOals8snvwhSxq1R7SQPFOZBIAWOS3jrOimCfHzJhIVSwQPSDIlA?=
 =?us-ascii?Q?ohTKR9+LgtyrtDUL4e9jCzqCDMKFqi0zSA6Ib59S8wXCQ4y3PlsYMA1mzlgI?=
 =?us-ascii?Q?LE4q0JAQgJAus/XRi6Ak1s6/Rx+kx5CfNp7l1kxCS47hXeiEAoWX/v9PqJJe?=
 =?us-ascii?Q?hg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 8732dade-3c13-43eb-a8dd-08de1ab21a32
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 08:22:18.0758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QreG9KOLlsZT+f0lzxMYosaSc3/4+VleB0yy+KNhDtpCR4339a3pHIoMnmIlZfFRwklbONmGRjJ05jImz59tIrEDuWIxDPGuA6rEvtbssSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR01MB11135
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225633

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

According to https://www.gtk.org/docs/installations/linux/#gtk-v3x the new
place for downloads is download.gnome.org aka $GNOME_MIRROR (ftp.g.o
redirects to this). And new versions are without `+`.

Update opengl.patch, handle new `is_gl_context_current`.

Overview of Changes in GTK+ 3.24.51, 29-09-2025
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Wayland:
 - Force window titles to be valid utf8
 - Flush tablet events when neccessary

* X11:
 - Avoid a use-after-free with threads

* Windows:
 - Avoid min/max buttons for dialogs

* Images:
 - Replace a few calls to gdk_pixbuf_get_pixels
   with read_pixels to avoid thread-safety issues

* GL:
 - Try harder to keep the GL context current

* Input:
 - Make compose file parsing more robust

* Translation updates:
 Catalan
 Esperanto
 Persian

Overview of Changes in GTK+ 3.24.50, 07-08-2025
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Themes:
 - Add a progress-working-symbolic icon
 - Support strokes in symbolic icons
 - Update theme CSS
 - Remove hardcoded Cantarell font

* GtkShortcutsWindow:
 - Differentiate all keypad symbols visually

* GtkApplication:
 - Register unsandboxed apps with the portals

* macOS:
 - Remove redundant NSView calls
 - Fix some memory leaks
 - Don't try to use the file transfer portal

* Windows:
 - Always mark windows as minimizable

* X11
 - Fix problems with gtk_window_get_geometry

* Wayland:
 - Fix a crash

* Input:
 - Make compose sequence visuals configurable

* Printing:
 - Fix the build with libcups 3
 - Support gnome-papers as previewer

* Translation updates
 Nepali
 Persian
 Uzbek (Latin)

Overview of Changes in GTK+ 3.24.49, 05-03-2025
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Fix a crash in GtkIMContext

* Fix crashes in DND with GtkPlug/GtkSocket

* Wayland:
 - Fix erroneous crossing events, causing menus to malfunction
 - Support the cursor-shape protocol

* X11:
 - Enforce size limits on windows, preventing lockups

* macOS:
 - Fix pen tilt handling

* Translation updates
 Bulgarian
 Thai

Overview of Changes in GTK+ 3.24.48, 25-02-2025
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Switch to the new ci-based release process

Overview of Changes in GTK+ 3.24.44, 24-01-2025
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkFileChooser:
 - Stop replacing : (colon) with U+2236 (ratio)

* GtkEmojiChooser:
 - Update to Unicode 16 / CLDR 46

* GtkSpinButton:
 - Use semantically appropriate icon names
 - Make numeric spin buttons always LTR

* GtkEntry:
 - Stop guessing text direction from keyboard layout
 - Add a shortcut and context menu item to change text direction

* GtkEventControllerMotion:
 - Make enter and leave signals work

* Accessibility:
 - Use message dialog titles as names

* GDK:
 - Fix portal handling of gvfs files

* Wayland:
 - Support the xdg_foreign_v2 protocol
 - Try to fix monitor geometry on sway
 - Improve font setting fallback
 - Use a better default cursor size
 - Fix a crash during DND

* macOS:
 - Fix a UI hang

* Translation updates:
 Bulgarian
 Farsi
 Hindi
 Hungarian
 Icelandic
 Latvian
 Serbian

(From OE-Core rev: 7f370c3b9c10e723324ea8f924011c5f570749d4)

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Cherry-pick-of: 78a280af441a60cebbecdd2416106ad8b3095018
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-gnome/gtk+/gtk+3/opengl.patch    | 72 +++++++++++--------
 .../{gtk+3_3.24.43.bb =3D> gtk+3_3.24.51.bb}    |  6 +-
 2 files changed, 45 insertions(+), 33 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.43.bb =3D> gtk+3_3.24.51.bb} (9=
7%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/opengl.patch b/meta/recipes-gnom=
e/gtk+/gtk+3/opengl.patch
index d846045c24..51d4c8e43a 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/opengl.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/opengl.patch
@@ -1,4 +1,4 @@
-From 24a0d767251b81810767e03aa1db8cc497408db3 Mon Sep 17 00:00:00 2001
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Fri, 16 Oct 2015 16:35:16 +0300
 Subject: [PATCH] Do not try to initialize GL without libGL
@@ -20,12 +20,12 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com=
>
  docs/tools/meson.build           |  7 +++++--
  docs/tools/widgets.c             |  6 +++++-
  gdk/gdkconfig.h.meson            |  1 +
- gdk/gdkdisplay.c                 |  4 ++++
+ gdk/gdkdisplay.c                 |  8 ++++++++
  gdk/gdkgl.c                      | 11 ++++++++++-
  gdk/gdkglcontext.c               |  6 ++++++
  gdk/gdkwindow.c                  | 13 +++++++++++++
  gdk/meson.build                  |  8 +++++++-
- gdk/x11/gdkdisplay-x11.c         |  6 +++++-
+ gdk/x11/gdkdisplay-x11.c         |  4 ++++
  gdk/x11/gdkvisual-x11.c          |  5 +++++
  gdk/x11/gdkwindow-x11.c          |  4 ++++
  gdk/x11/gdkx-autocleanups.h      |  2 ++
@@ -37,10 +37,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com=
>
  meson_options.txt                |  2 ++
  tests/meson.build                |  9 +++++++--
  testsuite/gtk/objects-finalize.c |  2 ++
- 21 files changed, 128 insertions(+), 14 deletions(-)
+ 21 files changed, 131 insertions(+), 13 deletions(-)
=20
 diff --git a/demos/gtk-demo/meson.build b/demos/gtk-demo/meson.build
-index 252da16..4b57cff 100644
+index 252da16d05..4b57cff6ac 100644
 --- a/demos/gtk-demo/meson.build
 +++ b/demos/gtk-demo/meson.build
 @@ -28,7 +28,6 @@ demos =3D files([
@@ -63,7 +63,7 @@ index 252da16..4b57cff 100644
    demos +=3D files('pagesetup.c')
  endif
 diff --git a/docs/tools/meson.build b/docs/tools/meson.build
-index 05621ee..3d0a333 100644
+index 05621ee7ed..3d0a333b32 100644
 --- a/docs/tools/meson.build
 +++ b/docs/tools/meson.build
 @@ -2,10 +2,13 @@ if x11_enabled
@@ -83,7 +83,7 @@ index 05621ee..3d0a333 100644
                             include_directories: [ confinc, gdkinc, gtkinc=
, testinc, ],
                             dependencies: libgtk_dep)
 diff --git a/docs/tools/widgets.c b/docs/tools/widgets.c
-index 932daf1..348807e 100644
+index 932daf1746..348807e133 100644
 --- a/docs/tools/widgets.c
 +++ b/docs/tools/widgets.c
 @@ -8,7 +8,9 @@
@@ -110,7 +110,7 @@ index 932daf1..348807e 100644
 =20
    return info;
 diff --git a/gdk/gdkconfig.h.meson b/gdk/gdkconfig.h.meson
-index 7db19e0..088651b 100644
+index 7db19e0470..088651bafa 100644
 --- a/gdk/gdkconfig.h.meson
 +++ b/gdk/gdkconfig.h.meson
 @@ -15,6 +15,7 @@ G_BEGIN_DECLS
@@ -122,10 +122,22 @@ index 7db19e0..088651b 100644
  G_END_DECLS
 =20
 diff --git a/gdk/gdkdisplay.c b/gdk/gdkdisplay.c
-index fd5e9ea..87b45e7 100644
+index 5c41a48fd0..920bb18ce8 100644
 --- a/gdk/gdkdisplay.c
 +++ b/gdk/gdkdisplay.c
-@@ -2420,7 +2420,11 @@ gboolean
+@@ -2412,7 +2412,11 @@ gboolean
+ gdk_display_is_gl_context_current (GdkDisplay   *display,
+                                    GdkGLContext *context)
+ {
++#ifdef HAVE_OPENGL
+   return GDK_DISPLAY_GET_CLASS (display)->is_gl_context_current (display,=
 context);
++#else
++  return FALSE;
++#endif
+ }
+=20
+ /*< private >
+@@ -2427,7 +2431,11 @@ gboolean
  gdk_display_make_gl_context_current (GdkDisplay   *display,
                                       GdkGLContext *context)
  {
@@ -138,7 +150,7 @@ index fd5e9ea..87b45e7 100644
 =20
  GdkRenderingMode
 diff --git a/gdk/gdkgl.c b/gdk/gdkgl.c
-index 0940c06..4b56614 100644
+index 0940c06c71..4b56614f9f 100644
 --- a/gdk/gdkgl.c
 +++ b/gdk/gdkgl.c
 @@ -21,8 +21,9 @@
@@ -215,7 +227,7 @@ index 0940c06..4b56614 100644
 +#endif
  }
 diff --git a/gdk/gdkglcontext.c b/gdk/gdkglcontext.c
-index cb0ed90..7ed74f3 100644
+index 52c7bce692..fa544794ac 100644
 --- a/gdk/gdkglcontext.c
 +++ b/gdk/gdkglcontext.c
 @@ -85,7 +85,9 @@
@@ -261,7 +273,7 @@ index cb0ed90..7ed74f3 100644
 =20
  /**
 diff --git a/gdk/gdkwindow.c b/gdk/gdkwindow.c
-index 62e0cf8..b8bda71 100644
+index 62e0cf816f..b8bda7140d 100644
 --- a/gdk/gdkwindow.c
 +++ b/gdk/gdkwindow.c
 @@ -45,7 +45,9 @@
@@ -321,7 +333,7 @@ index 62e0cf8..b8bda71 100644
            cairo_region_destroy (opaque_region);
 =20
 diff --git a/gdk/meson.build b/gdk/meson.build
-index 297c38c..fc71f8f 100644
+index 297c38c68e..fc71f8f49d 100644
 --- a/gdk/meson.build
 +++ b/gdk/meson.build
 @@ -56,7 +56,6 @@ gdk_gir_public_headers =3D files(
@@ -354,7 +366,7 @@ index 297c38c..fc71f8f 100644
  gdkconfig =3D configure_file(
    input  : 'gdkconfig.h.meson',
 diff --git a/gdk/x11/gdkdisplay-x11.c b/gdk/x11/gdkdisplay-x11.c
-index 7e08f47..30fd7b6 100644
+index c6d1f53d70..9793cb4329 100644
 --- a/gdk/x11/gdkdisplay-x11.c
 +++ b/gdk/x11/gdkdisplay-x11.c
 @@ -37,7 +37,9 @@
@@ -367,19 +379,19 @@ index 7e08f47..30fd7b6 100644
  #include "gdk-private.h"
  #include "gdkprofilerprivate.h"
 =20
-@@ -3191,7 +3193,9 @@ gdk_x11_display_class_init (GdkX11DisplayClass * cla=
ss)
+@@ -3191,8 +3193,10 @@ gdk_x11_display_class_init (GdkX11DisplayClass * cl=
ass)
    display_class->text_property_to_utf8_list =3D _gdk_x11_display_text_pro=
perty_to_utf8_list;
    display_class->utf8_to_string_target =3D _gdk_x11_display_utf8_to_strin=
g_target;
 =20
--  display_class->make_gl_context_current =3D gdk_x11_display_make_gl_cont=
ext_current;
 +#ifdef HAVE_OPENGL
-+   display_class->make_gl_context_current =3D gdk_x11_display_make_gl_con=
text_current;
+   display_class->is_gl_context_current =3D gdk_x11_display_is_gl_context_=
current;
+   display_class->make_gl_context_current =3D gdk_x11_display_make_gl_cont=
ext_current;
 +#endif
 =20
    display_class->get_default_seat =3D gdk_x11_display_get_default_seat;
 =20
 diff --git a/gdk/x11/gdkvisual-x11.c b/gdk/x11/gdkvisual-x11.c
-index 81479d8..3c8c5c0 100644
+index 81479d81f4..3c8c5c02ff 100644
 --- a/gdk/x11/gdkvisual-x11.c
 +++ b/gdk/x11/gdkvisual-x11.c
 @@ -306,7 +306,12 @@ _gdk_x11_screen_init_visuals (GdkScreen *screen)
@@ -396,7 +408,7 @@ index 81479d8..3c8c5c0 100644
 =20
  gint
 diff --git a/gdk/x11/gdkwindow-x11.c b/gdk/x11/gdkwindow-x11.c
-index 89f0666..d3e1440 100644
+index 0c59ad464e..ad3244f152 100644
 --- a/gdk/x11/gdkwindow-x11.c
 +++ b/gdk/x11/gdkwindow-x11.c
 @@ -36,7 +36,9 @@
@@ -409,7 +421,7 @@ index 89f0666..d3e1440 100644
  #include "gdkprivate-x11.h"
  #include "gdk-private.h"
 =20
-@@ -5906,7 +5908,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Clas=
s *klass)
+@@ -5916,7 +5918,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Clas=
s *klass)
    impl_class->set_opaque_region =3D gdk_x11_window_set_opaque_region;
    impl_class->set_shadow_width =3D gdk_x11_window_set_shadow_width;
    impl_class->show_window_menu =3D gdk_x11_window_show_window_menu;
@@ -420,7 +432,7 @@ index 89f0666..d3e1440 100644
    impl_class->get_unscaled_size =3D gdk_x11_window_get_unscaled_size;
  }
 diff --git a/gdk/x11/gdkx-autocleanups.h b/gdk/x11/gdkx-autocleanups.h
-index edb0ea7..a317d61 100644
+index edb0ea7dbf..a317d61cca 100644
 --- a/gdk/x11/gdkx-autocleanups.h
 +++ b/gdk/x11/gdkx-autocleanups.h
 @@ -30,7 +30,9 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11DeviceXI2, g_object_=
unref)
@@ -434,7 +446,7 @@ index edb0ea7..a317d61 100644
  G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Screen, g_object_unref)
  G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Visual, g_object_unref)
 diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx.h
-index 1f64bcc..4db6c18 100644
+index 1f64bccb6d..4db6c18351 100644
 --- a/gdk/x11/gdkx.h
 +++ b/gdk/x11/gdkx.h
 @@ -43,7 +43,9 @@
@@ -448,7 +460,7 @@ index 1f64bcc..4db6c18 100644
  #include <gdk/x11/gdkx11monitor.h>
  #include <gdk/x11/gdkx11property.h>
 diff --git a/gdk/x11/meson.build b/gdk/x11/meson.build
-index 754ae0a..0318c83 100644
+index 754ae0a615..0318c83877 100644
 --- a/gdk/x11/meson.build
 +++ b/gdk/x11/meson.build
 @@ -14,7 +14,6 @@ gdk_x11_sources =3D files(
@@ -480,7 +492,7 @@ index 754ae0a..0318c83 100644
  install_headers('gdkx.h', subdir: 'gtk-3.0/gdk/')
 =20
 diff --git a/gtk/gtkglarea.c b/gtk/gtkglarea.c
-index 802303e..6439d77 100644
+index 802303ea9f..6439d7745d 100644
 --- a/gtk/gtkglarea.c
 +++ b/gtk/gtkglarea.c
 @@ -29,7 +29,9 @@
@@ -568,7 +580,7 @@ index 802303e..6439d77 100644
 =20
  static gboolean
 diff --git a/gtk/inspector/general.c b/gtk/inspector/general.c
-index a3a3419..274600e 100644
+index a3a341956b..274600e74a 100644
 --- a/gtk/inspector/general.c
 +++ b/gtk/inspector/general.c
 @@ -35,8 +35,10 @@
@@ -615,7 +627,7 @@ index a3a3419..274600e 100644
    if (GDK_IS_WAYLAND_DISPLAY (gdk_display_get_default ()))
      {
 diff --git a/meson.build b/meson.build
-index 67b24e5..c1cc09a 100644
+index 04d54a8e2c..324915c9ee 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -137,6 +137,7 @@ wayland_enabled        =3D get_option('wayland_backend=
')
@@ -673,7 +685,7 @@ index 67b24e5..c1cc09a 100644
    gtk_private_packages +=3D ['pangoft2']
  endif
 diff --git a/meson_options.txt b/meson_options.txt
-index 94099aa..8bd0968 100644
+index 94099aa01e..8bd096896d 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -19,6 +19,8 @@ option('profiler', type: 'boolean', value: false,
@@ -686,7 +698,7 @@ index 94099aa..8bd0968 100644
  # Print backends
  option('print_backends', type : 'string', value : 'auto',
 diff --git a/tests/meson.build b/tests/meson.build
-index 6ff249f..f2a9fba 100644
+index 6ff249f8a1..f2a9fbad6d 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
 @@ -5,7 +5,6 @@ gtk_tests =3D [
@@ -720,7 +732,7 @@ index 6ff249f..f2a9fba 100644
    gtk_tests +=3D [['testfontchooserdialog']]
  endif
 diff --git a/testsuite/gtk/objects-finalize.c b/testsuite/gtk/objects-fina=
lize.c
-index 95b565c..7f340c3 100644
+index 95b565c591..7f340c3775 100644
 --- a/testsuite/gtk/objects-finalize.c
 +++ b/testsuite/gtk/objects-finalize.c
 @@ -109,7 +109,9 @@ main (int argc, char **argv)
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb b/meta/recipes-gnome/=
gtk+/gtk+3_3.24.51.bb
similarity index 97%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb
index 0ee2f18167..206578542c 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb
@@ -18,12 +18,12 @@ LICENSE =3D "LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2=
.1-or-later"
 inherit meson gettext pkgconfig gtk-doc update-alternatives gtk-immodules-=
cache gsettings features_check gobject-introspection
=20
 MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
-SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-$=
{PV}.tar.xz \
+SRC_URI =3D "${GNOME_MIRROR}/gtk/${MAJ_VER}/gtk-${PV}.tar.xz \
            file://opengl.patch \
            "
-SRC_URI[sha256sum] =3D "7e04f0648515034b806b74ae5d774d87cffb1a2a96c468cb5b=
e476d51bf2f3c7"
+SRC_URI[sha256sum] =3D "0013877c6bd23c2dbe42ad7c70a053d0e449be66736574e378=
67c49c5f905a4f"
=20
-S =3D "${WORKDIR}/gtk+-${PV}"
+S =3D "${WORKDIR}/gtk-${PV}"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
--=20
2.51.0


