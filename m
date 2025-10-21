Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 237A5CCD1A7
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 16:17:56 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.84])
 by mx.groups.io with SMTP id smtpd.web11.16760.1761063469044328962
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 09:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=HbYbPUmm;
 spf=pass (domain: navimatix.de, ip: 52.101.66.84, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9vA2pxee+PSkCbW0ktipsM0P54Ju/an3+3qXHs6GjPY8RVeIJKdSFM0SolLMAOToHqwzyfV8ZQFQtrH1BKiyji5AgAZNJcTG1norepAgHCTmHMv6xIkfByrnTqMxhl5z6VtQ5kXDx9NxVAdGN63zypFTiNXC2SbvniNoc2AJHIpL2Nb4X6KfW4YdsQYZGUwURkvRf2M4Z3ZtPGzcTk7ozQ0uieVDlyJbADsN3EETiWx4u1Oa8Zr8CdvkKckVljU2j7FtsJAB1C4kR8jPkBpyNuaiiPi6vmiJ4yOgAs4YYBHyag3KQ5fDRecYh8liIB6RM0lwaYise041vALQ3j1nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4enJYDe+ddJ183b8YFRVduzCHLq/4IsdIIV5s2xA8o=;
 b=QEh7+aU99TaHgBr7MMRvMdSrGnlxeRH4551IS/WhLYdSMSaiaJAI9pm2+an+Bqc9J2ZMRPVVmgwih196SeBsBG2UJxF/ougVd67676+6vqSxPijbmk11Pr1JxnRLrrSGSS/YZlXfG1axaJG73vxxpSrd9gxe9TVLutIueB/6mx7PN7JaX/74KINcBWdrJlG6WslGfNH+6ZTDfP25eG7MsphcUgkgtHVaR92r5z67pa2MbPkPNNMHGKwHOncau3lv/1gGrdDvTEy5HYn/mHtPGn96t9HucVeho8UoAtVYzJuFC+6HCWM07eM8+UgSzg1aplwzJ6t28E6KxNfTyJSDPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4enJYDe+ddJ183b8YFRVduzCHLq/4IsdIIV5s2xA8o=;
 b=HbYbPUmmmfcr8C6i/M8SEse+4fdSoLERZtjHeCiyzhPlM3IMppZmmd2ybsq1d0FR8El3VBppeVC/OseDtrOwh3CcDQL27eF6XiXt+YnjvlQgCezhmHJsslajG3l9nLJBhr2yKJCYiGs/da6tlMGR9aZEfRnQAtobjZzBL1MJQpo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PA4PR01MB9380.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:2af::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 16:16:02 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9228.015; Tue, 21 Oct 2025 16:16:01 +0000
Date: Tue, 21 Oct 2025 18:16:00 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] gtk+3: Update 3.24.43 -> 3.24.51
Message-ID: <93e977e2b4bf3b48b958dac4c75dca51c3e2a9b1.1761063359.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0238.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::11) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PA4PR01MB9380:EE_
X-MS-Office365-Filtering-Correlation-Id: 00a74971-4899-47dd-82da-08de10bd2087
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?elr7vQrFiqJViTw5uomC8eAWOE42F4prMPSoBlgcN2q3eA+lOx0Ua6DWQ50u?=
 =?us-ascii?Q?keo656DozKSe9ZaOPnODAoTZZHH1fPjecF8Ugjp6cSj3Ww0opk4TTr4KHM2K?=
 =?us-ascii?Q?6TJ79ZKAVd+TURkwYm0+Z/hQy60uMHlJHjKGR2my8LG5nYKJNnJthmYQ96kN?=
 =?us-ascii?Q?bpW+2/pBYgK9mNfyccBiRDm8rzXP6QqFazPY0DhqRFbTtazJe7TxCGVwIiSs?=
 =?us-ascii?Q?SoA2h1cvsPF8gQihaZrjmruLU+WSX19k9S0UYvC3HqRWND0o2HG78bC+/TXl?=
 =?us-ascii?Q?lrYN9LjUt8Nl5ttoKgyijan5O0Ae916g8Bc/r8DtgKaDq0kwXbKap+mrkD6A?=
 =?us-ascii?Q?gCJhmC+jTNO4ItD/Lcboo+tp/E8wOQRimD4Ow/tnjXtGFKn7A5c04tApUZtE?=
 =?us-ascii?Q?BczsCmZQtku1IbE9U14fwNIblA4ebh2hKMfDoKAgZNlI88smzbx7b3HA40Uf?=
 =?us-ascii?Q?Gr/T6IxOQQY7Ky2n9AOcZco+R8OGprHUQJau1Fuq9Jz+U/JZt5fIbfBR6czP?=
 =?us-ascii?Q?5NnD0OnD/eAmOX8jT7xqsi9ZBgJr/0+x8PtwLldA+H1BokYgkF4v/1MtXFPS?=
 =?us-ascii?Q?dW6bee2nGv4V1b6pyqWzDItD82yaLwitVa0J07U6vSJzyx2klXnwZ/KZXlSN?=
 =?us-ascii?Q?UKvQ2ESwMK1RBgItmB92SNmd+3OiefViMq+qvgnkQy8ioT5QVX8GzmT9f9LS?=
 =?us-ascii?Q?mtpBSnK2s9RmgRO9uOuYdJjKw6fkMsM3OYflqcaw8U4D9MCkk4znbhVSh9Bs?=
 =?us-ascii?Q?RglXf0hjoSMb94ScKQa8UD8+xNglVevWVSwfpc8V0T7PnPtbydou2Ozk4pPi?=
 =?us-ascii?Q?k45fGu8iX+i5TrXtEtCbVzhx2xpIHjsxklMLCNFOnaXSjKvwN5PyhKb3OsuK?=
 =?us-ascii?Q?m4kAxhxMcg7Lq7QkfpNnjO67Tc709cU42NzYd5GsIp8GjcA41SH/NkjZp6yY?=
 =?us-ascii?Q?DHaHKJSLXOHQAjpZi5ox1jQJ9XmCKUKRe9wCy4jdztYhELR50VYm6QxqzGSS?=
 =?us-ascii?Q?pyPC1qNAw0p9Ltq/W5/CZO0sl4ucmnWWucLswUUkIbl7ZgAUSkWZ9mWD/EuM?=
 =?us-ascii?Q?KRPwM9F3z/UT2SxBhvQdB8ct4jQg6awVK79Bl88bk17CLzI60iXVAY5TCTrm?=
 =?us-ascii?Q?4xhTDK+NEau9xV3EVkOtcaaonNr2nSmy6PJGnbTv8dLBd0Mxzw6ZMGeH/N74?=
 =?us-ascii?Q?9kA5ze9ZOBoB4BIO5MK5Pqdl3/bdQ6dJ9gdQwVond5Td1avHoM7N23SnexzS?=
 =?us-ascii?Q?qirFyedgtGLwHLk3UwCycqEX4S4vr/CC9OBrNkrhpqS1fp1aBNtcH5Gzxhp6?=
 =?us-ascii?Q?6u9g+PQrecSV6eyloe27EmSyTQA95UNQ5PSC/wgWlTUqzCBMHfykSfafQF6r?=
 =?us-ascii?Q?sZGtyumUpolDD14UJJuJtjVRf3+vMtLCZs5navxd+pMAry1vYJdhm7pPPhAM?=
 =?us-ascii?Q?YhCvI6SK7Us/Wrqel3SrdsElyw4J2hms?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i5PIQymxwjLMTYTQp7764W/JBBNSb9AhdKcYvECwJDcKMVno5oXuamWvwkEq?=
 =?us-ascii?Q?6VIlZ0qDt8wrYFkaD5nptJzKLGAP+3Akqa7qu4Z2j/3cidgbnp4NKTixUpGK?=
 =?us-ascii?Q?7E8ApIyOXmogVCIwrJlbOeSKx1H5JM5wurfydpspIdfLockyKmB8oZxUXiSQ?=
 =?us-ascii?Q?JdkXN+G2YVzF5bvXdEqeNef7jHTgdG1iXgk7b7kXd+yJs7xKdtugGmvgjmfC?=
 =?us-ascii?Q?g1A6T0QFhNKpTfqb8ytLpLKh4RwIF424Nv14Bqjd+nqI3D96CkjDzoSjkgc2?=
 =?us-ascii?Q?nv37QArUivm2Nv/a41gyfzSX5eETjuiRG42uL+amr8JbpOTm1dyo4nMMX+RZ?=
 =?us-ascii?Q?CW7NWYuXxtaQqme9jVnKWK85+dGi8FVER8OdFQwqviv0q+Cz4i8Dc7X90jhM?=
 =?us-ascii?Q?aFhZIWACrq4u9t9aJKHY8Nqk3XqmQ81rXdw5ZEX8+PwFnCWjQTGSI68+PujC?=
 =?us-ascii?Q?RQtQljx5I0N/l7jARTrOuBGcAwO1jOaYzEmoqSMGRR7a6nVEId+OiKQ33R2r?=
 =?us-ascii?Q?oSjKlzT6Z98RkfTqPvwk8alpEOj9nYQaiJlcAp5BxFDma1dsjyGyx3/y++ZW?=
 =?us-ascii?Q?6P1TTHkl3W2CwVBPOu0VAPlfSuR140+UrNWl1H21H7vDlt+DHmQkc9IoTClY?=
 =?us-ascii?Q?dILHcZstSO6S3URufi3krwLMUrji1qHVHxlyIFafHF5LRtiyMG7adTWEJwHD?=
 =?us-ascii?Q?8O9C9cSFIM2ouvhS50J/dpwgDEpbB7jEtq2g3csyDk7OOKBDh2rW1YMcI7o8?=
 =?us-ascii?Q?7BmtnWhRx9dmgqCJ6wAGDJ/3oLC+20USPkX5nHITzmEnkzRUCTwsoBn5SnuW?=
 =?us-ascii?Q?F4FkOA47uGn5IqNbIoE8o8KOjNaX6pOSobKVqUroZKvpos8gvPr/pNmGmpuD?=
 =?us-ascii?Q?LutTcze9zVGnvmAn9+c2HuJ/UkUCBuDLpk/1GhcqWFTIJascHFUOS0ZPp3hx?=
 =?us-ascii?Q?FJJpc+GQEEYdB4eahHWBx/ITzN1r1G2qvBvk71i9LPce5sGOsyffdElp/B+9?=
 =?us-ascii?Q?XXozhuqyvwqoC8E0pciqj0HQF9cr4DFhMHHTnGl2FgwNvIICk2gwl1/okVFL?=
 =?us-ascii?Q?IWNd3Uwxo7X7kmCtxUf4Yj7nkpAoXOHZ8uDCa1gXayqbUTI7eNKzV0TSRv0F?=
 =?us-ascii?Q?BKf/MfeN5u3ULpxvNQXDK4J/AXVmnXJl8kfWL0K7yPJCVTnIaucHi0efq0m9?=
 =?us-ascii?Q?L9KEcAfWYSlceDL6ahVVN1UT6y7t205XCTstNxu5H2agRK0Zu/6IpsvnujlX?=
 =?us-ascii?Q?zj7XMGLomNpOhUCvep1kxcSQZ2rJWdZcmsDaF59cbDColanY0uchL73F7HfD?=
 =?us-ascii?Q?H9CHnanV1pQF0RIc89DumkJScDuikAPDmObl0uFtwhfsTjO8kEnX8G7Ol7BN?=
 =?us-ascii?Q?p73l8mtlE/awk6eo19brfXgwzOsg2aeq1u51tI84G3D9QWxNEfUy0RxEMTyn?=
 =?us-ascii?Q?es8YUPO2T9OYYhOr1RYrJSYwfgKAmkl+Eq741UWV4nE/00sTspt3yEcEwYqB?=
 =?us-ascii?Q?ufuG5/Q4ZsXzONe5aq5EXdh8J2DsRgKcJRshfuUBC+rxUhChT4i0srb5vNrj?=
 =?us-ascii?Q?OUsUI/K/xZIPbyYsuUlCHrNhANTQlL3CT3TaIpwLmn1nnO19TPIlUh87iiDO?=
 =?us-ascii?Q?HQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a74971-4899-47dd-82da-08de10bd2087
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 16:16:01.5834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kA/uG/Z/vI2YhQFJJYq36goDyrzEg3orQtopFOJkkRCCBIRWAyoaJuo4xauovwPZytlTurCIz86IcsdQC96qwt+dL04oFkrNxd0c8wc7fso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR01MB9380
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 16:17:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225153

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

According to https://www.gtk.org/docs/installations/linux/#gtk-v3x the new
place for downloads is download.gnome.org (ftp.g.o redirects to this). And
new versions are without `+`.

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
index 5d58c41c6d..0090e6369a 100644
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
+SRC_URI =3D "https://download.gnome.org/sources/gtk/${MAJ_VER}/gtk-${PV}.t=
ar.xz \
            file://opengl.patch \
            "
-SRC_URI[sha256sum] =3D "7e04f0648515034b806b74ae5d774d87cffb1a2a96c468cb5b=
e476d51bf2f3c7"
+SRC_URI[sha256sum] =3D "0013877c6bd23c2dbe42ad7c70a053d0e449be66736574e378=
67c49c5f905a4f"
=20
-S =3D "${UNPACKDIR}/gtk+-${PV}"
+S =3D "${UNPACKDIR}/gtk-${PV}"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
--=20
2.51.0


