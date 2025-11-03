Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1E9CCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:22:08 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.108])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16040.1762158119656846786
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:21:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=zy1ZXZpu;
 spf=pass (domain: navimatix.de, ip: 40.107.130.108, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAaeQrIMfFswvL7lZQZ6WC+UWXqq8hIG4/48Ad4yWRLKN+t3L9ujUVOKifASS3kiYEMv/fDhgrjXVO08CCBNqqPR/UFpLiNdiYjAyMdX4EbMv3WT3bbhR4wYhsP4wUXnP23m3l8+sV1zvATMU0UMixSFOxggqRlApcE9kLkLJVqBS467JjcE/5WSFmjVAd+F5MR8quz/GeHI7l1A2Y9nhdC3jxQxnvw+hO8YQ5saXXfCS3/2w5tP5nWBefXzSdo8d5aKjJvNUdibA6vle6OH/WsVVaFelOjiHJe9C1Xw/oRII0dj24FbIOYWEsl6eI8Sp3b69E6E42pWiZsiLGTVwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18oTSPoQ+F7BUe/gTxOH7iL2vY9ORxMtQJjmiW+oABY=;
 b=xmZ07PcJoGkJmo9vF6A8LeNPjX98vgYa6hTg66BWy3SB+Qfg9kuxZ9LBWgCFfA8NXLDQoPmXsCnQq6Ffcelq5ABMeRJnZkxVOZcNn3Tp0d1jRCAtr3r3sRP1GuvSh34Zy9A8mXLZdixRiL/Zee5JzLmaQG4H5HeRJHzLU3DB/FYffZHI880YqAlturDF1GD9acsG4nquW9DgYVFbdtK4sbMaxk+GWoNKXPZuKye4oytQDQ1hc0LXVzVCssbVJD3rnzLsAwCCLJ1l84M/xjayIsekO6aRJo3zY5Te5kMAfa4UBJVI5/YrrIZPCZT7pBTLiNTV00gbRJpiKnMY3QzgNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18oTSPoQ+F7BUe/gTxOH7iL2vY9ORxMtQJjmiW+oABY=;
 b=zy1ZXZpuHf70nsjo5wIFcSNc4tlnkYajnOJdYza3cRE1Wx34++cdvWI49+KcoYvWDzrnlxlS4hIVrOLdXoJzjmPdkA63kdStZbHxZAgXRM5kLan/atI8B2VPX03XbgAfFPGygtHXLnMiUhhPEzvZVzhu8r6As+ppyoLRqVI2pWY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PAXPR01MB10285.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:24e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 08:21:56 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 08:21:56 +0000
Date: Mon, 3 Nov 2025 09:21:54 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, f_l_k@t-online.de, 
	alexandre.belloni@bootlin.com, richard.purdie@linuxfoundation.org, joerg.sommer@navimatix.de
CC: Markus Volk <f_l_k@t-online.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	=?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [kirkstone][PATCH 08/19] gtk: Add rdepend on printbackend for cups
Message-ID: <1f86991aa0d0fecf902eb19bd1b685c5c53e2b77.1762157680.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0400.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::13) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PAXPR01MB10285:EE_
X-MS-Office365-Filtering-Correlation-Id: 3489e4f2-68a2-4971-e418-08de1ab20d28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xQoAU1CGfdtfAb1EqjUYP1Sg97Ku/RKyojkfElSmMM95RQP/WYYNrGZY8I1k?=
 =?us-ascii?Q?eGNsgsoNUVKrbs5RGAlpHFG6FqQfTVW2zRKKkxLeIGFncdRcPlDLJjUOjevd?=
 =?us-ascii?Q?qBjwvGlI5sVZQIwgAXmvDro1J+UK6x0RYDLsPc9VNxOgEJepXmocSBpcBK8p?=
 =?us-ascii?Q?TRKYVVfLZcSpbDRjsUh1Wy51VvMR5i3IzgBwpxZLvWo3I1AETStv42AwAvPc?=
 =?us-ascii?Q?8Ra311b1KyKGYkrzTkIwL9+LLuv/BUzFanNRS0zBBd7v8nvuA8MM0Niy9vXp?=
 =?us-ascii?Q?naAGzSlbS1yN9EbQoY4Eb9cOjGXUPtJ3RD4DYFTOOZfHSZ5xfGdNk/2QMwQS?=
 =?us-ascii?Q?+J4HrYNcOzvpiJ+Lk2rnOzT1OEeynqy+jsqpaQcEsCu/7g4STBSJ1YGUxNp5?=
 =?us-ascii?Q?f2cp3ZJEFGjcJgeMPnT2SeKEmWbgvR0yLEcvEyO0/JbI/LYNo8aXpvt0ORVz?=
 =?us-ascii?Q?wZQnCU/q9+3Z2Zya3817KluZRHh4xR5/FKoFxEeuGx1qGyINw+DdlCVRGEyR?=
 =?us-ascii?Q?fa3hFvFHsO2gDEldCBhjn+NoIr0z+hUuY4ExqC1diS71lxYBDJIXtAA2+z0U?=
 =?us-ascii?Q?Qnq8UqkcFjJFEN4+gQxQctyfMjKEdAIzFP3FgUYXO9VxSOtiKaY3sdADTvuD?=
 =?us-ascii?Q?MmtdykSKDmmqCEonk6gsZY/AUxOebyNQXj+T4MfMbOVXslI3BOFaltfxJExg?=
 =?us-ascii?Q?1B8qkQFIZ1i2ugXo/IvfYsUr7Ur6cR/lXBXu4w4uPdhRea/Q1tIqsMFvZKVb?=
 =?us-ascii?Q?xh9rgeOfWAsLnExfY9HGeB7yGHYALyh9n4BzEJERWehndO6aUzHq1uta6muE?=
 =?us-ascii?Q?REaWXVpOOOhAHb0crGb0VbnQlzP3odckeiuU70/9EZdF8ZOSr5tsLhNqHZhF?=
 =?us-ascii?Q?2KxUMU0Z8t6f96pvpuexI6LFwjHq2Vuhc7tzjXYCWEoq32Lfs3UHD40VcH/x?=
 =?us-ascii?Q?TJ6PwsokB84j42EXk2HSev81TmOqlkaJWM2LVJbEO6VNG6vBSYicb7uuP5nl?=
 =?us-ascii?Q?Fl4KnDwBlAe9FZ/rxfyDhj8je6qKLLMcP8KLl7NDFuaOIRRlXESCK5DKzY8x?=
 =?us-ascii?Q?lBqjQUNU4xRUgfv1cdRZnX1mhkpAxmkok+emPoVTXywhQPGhedXkcRBnhSUP?=
 =?us-ascii?Q?w2nnMcCCW3r9TB+ZzisZmfIRtpKIpydDjtIOuVWJRxws/QdVBGE/t9RRkL8d?=
 =?us-ascii?Q?93aQLxkFQ8Z/xdJ+ya5Y+eZRhIyiFvlI7+wUsklqZtN4FvFlJ7IrpIjQkA6k?=
 =?us-ascii?Q?3epGYhdmRWr8ir035hoTL/LBxLUglNmuBnXP6KUPYY9NRhywvifLLtq5n7Pk?=
 =?us-ascii?Q?Muh+WMFjP4XkAuox6cz/u29Y5TPYK419ipXSS8+JfpHZ4a9VCWXdh8HnH6nD?=
 =?us-ascii?Q?Ob34d3zio3MaeKqhNCseEpiYd/VEJGXi5GwB2r1t0CvsHt5DOnOcjX5B+JM/?=
 =?us-ascii?Q?qgTeMEYBOy5+YSUlrFD/A5Fg2+IOk+gy?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?13WM8HuhD5wudITR+R1x/ujr1u3GU7bX5ZLkJ6msV8MkzyCxLwkCHiJNRSxL?=
 =?us-ascii?Q?dlzmFQm2Oy2oJyHrWePZfwNxutwWmwDhQgqmbwsBJSQpxvEJOFaIEEgZC66I?=
 =?us-ascii?Q?8F6qYQxv5qdZUNbehypzmQef6AVMQCLkrhfctjXrlELZmFWCpjG6rA/dtmYI?=
 =?us-ascii?Q?R/YfBy8Gqjk2xW4mUzPqnGFvntID8S7EJn1OEeuVqLRjieNlSoPFll/nQSMc?=
 =?us-ascii?Q?sgraCROx4vwt/f1+YQ+yojQqhcyQlAI/YPB4YO1JA0mk3K6f7RWrLAzku/6l?=
 =?us-ascii?Q?Xdh6TFUrhJ7riTP6x5z1nqpugkRpwKFO8GaGLzUWJJGZNF9SHojfszre5++z?=
 =?us-ascii?Q?QhBV3WBZJP+GeCRxDDkp84LCzz7IlgaKuD9eMqnM4MhR6gQKDlUiaV3omlI1?=
 =?us-ascii?Q?r9ihXOGLhi1VkH/e5DDUXFeAb9Je04hEkoGt4i1ea9SN6TLXtsBTuEVzCA5j?=
 =?us-ascii?Q?HJmg1wu7f29MALhTD8Hgy1XpCu22qAiPI4LePE6o3m1DJIPghk6Eamn8yTzd?=
 =?us-ascii?Q?MT2KpltUZQfgvyRqYRuDpg1fbV6icD5C8WY6uhmVtMDRc5bcvTM6OLJSzntR?=
 =?us-ascii?Q?T2ggECwlc9e88DOnqK7LaW3mG4vl+gCi03xLMDhsqvnoRFy50KjoHDbQVWSN?=
 =?us-ascii?Q?97mUnXOUEHAiEnxnWy55tZhEc/I0+/Z9Vea3FpdBTs6n/rl3VTwloUwFp/xm?=
 =?us-ascii?Q?cEEnRtLlkARjo5NXaX6iMVEJsah7LzgRr2ALLrqQy+TGS+gKOtr+2q96gMRt?=
 =?us-ascii?Q?6OFXmGqDocsJnLKl4wZAQuPQGTcV57VvexHIPPFRbsvjirWp0ZGDvB9due9J?=
 =?us-ascii?Q?7yF54vUMkKZQ2XSN4WGC8cybJiB8ym6BuJxYA+KAQb88xaFUj47cVytACXlH?=
 =?us-ascii?Q?W8Ib0AgY+Q4Q6iCyJGH/VYKTnXu6PO5RXmmROBZV6+DmGpzrWyet1Rwdm2aK?=
 =?us-ascii?Q?Gzj5R5rKqUAA9BrGOXWo9QmsEdDJth3HLQ7GXx/Ah3+I3VNSxrKIUa3+hRiH?=
 =?us-ascii?Q?Zwhqn83VK5o9mU9NjtIFUb+b2GRe6zJASvSazic512Cke1BxAS9ach6hPfDG?=
 =?us-ascii?Q?Yr+VNDwLKaijgV9pAG9vTKk+0Anio3WWwnG9dVlwKgZ1lSg4EGHGGc7EGujB?=
 =?us-ascii?Q?y9jYimcWsJmiErO4z4QpMzppzb/EhFjEDvglcw8gYC+adOaJm7k4S7MWYq2P?=
 =?us-ascii?Q?euQPmddYOyv2rVIkfmez3lgjRNaFoz329CKmOiT/m6ZKz6Nq3sexr2b7BBga?=
 =?us-ascii?Q?c0cLNA73KmFiBhaCb83jzX9OziCS0EJ2JRpXm0mMOY8RjLz385UaXI++1ME0?=
 =?us-ascii?Q?iEuuq8xnuGj+px8EkeksC/WSQV9bskicqGMDr9r+8fI9f8W7UbEhb0R5vUnP?=
 =?us-ascii?Q?hRDEKmzdISCREaZW+fq0dbeo/9XxYtuzKhF+hvwv3u0TiA3nrmzOtdXw/Iov?=
 =?us-ascii?Q?N9MUlkV5y7xqHNT2WMLBDabZ7Wy3uhq5wci4FRoC6PYFpKzZhOKqezoLNMj8?=
 =?us-ascii?Q?bFOvzOJUPi8MF56j/s2saqukjuehpmdKmzcunKSsv0DOReb0VB5mcRVqBJM4?=
 =?us-ascii?Q?dUoNZpncLWbXFChGmkRbu1rdN2/dwrXdX76xYgrF52lmlP7xHjJ+Hq80WPBS?=
 =?us-ascii?Q?jQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3489e4f2-68a2-4971-e418-08de1ab20d28
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 08:21:56.2124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkFvcZr3DJgFvboTpZ5DRrWgNJABS4c8IsIsJzbP0TGQeabLlOZmbr8jZlOU2KAbhugW0Bf6GKbxiDM3jD2T0SeQ00I12/DqlPgBQIGuKCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB10285
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225622

From: Markus Volk <f_l_k@t-online.de>

install the required printbackends

(From OE-Core rev: 0a97892920db46043102d54ef1623669241e9780)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Cherry-pick-of: 7e847cb969a399f825f468bdfd567dd6c1bdfce8
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gt=
k+3.inc
index 8d01e6077f..4a04c06432 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -41,7 +41,7 @@ PACKAGECONFIG[x11] =3D "-Dx11_backend=3Dtrue,-Dx11_backen=
d=3Dfalse,at-spi2-atk fontcon
 # this is provided by oe-core patch that removes epoxy/gl dependency from =
a X11 build
 PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue,-Dopengl=3Dfalse,libepoxy"
 PACKAGECONFIG[wayland] =3D "-Dwayland_backend=3Dtrue,-Dwayland_backend=3Df=
alse,wayland wayland-protocols libxkbcommon virtual/egl virtual/libgles2 wa=
yland-native"
-PACKAGECONFIG[cups] =3D ",,cups,cups"
+PACKAGECONFIG[cups] =3D ",,cups,cups gtk3-printbackend-cups"
 PACKAGECONFIG[colord] =3D "-Dcolord=3Dyes,-Dcolord=3Dno,colord"
 PACKAGECONFIG[cloudproviders] =3D "-Dcloudproviders=3Dtrue,-Dcloudprovider=
s=3Dfalse,libcloudproviders"
 PACKAGECONFIG[tracker3] =3D "-Dtracker3=3Dtrue,-Dtracker3=3Dfalse,tracker,=
tracker-miners"
--=20
2.51.0


