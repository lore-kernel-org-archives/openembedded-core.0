Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC43D1CDB0
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 08:17:23 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.135])
 by mx.groups.io with SMTP id smtpd.web11.13385.1729585032565837892
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 01:17:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=2+7RWWLr;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.135, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyHAaH39RNu7OBkMx+JKE8GYhIzVs+SJSPl+gpc62HIWK9Q6b9CSQHpWLmmhD/XnUHEila64z+cT3qDhCGVQZN2c0WtgxTZ44YDglHO0lFQetJdxkA9HQsB7+N7nIEs2SvK82dZ+BypBv8MLW8ZsndgwrVeqar1UFFiktAAiw5Gj5ci8A6kBY7vkAE4znpDla2JSQ1IY5zwuw7lpC5rX2b6WMSIaonLRgc5Rl2pxT007WPvEbbfFpdjRile5ZrBb3B/JfRdovwxKP29RnahRfBBKnq/rbjd8BaQ4UxNcnYnqXaB3KIbyQgOFcBzc0RS5+p67dr90gLFU4VSzyqJuMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/H6kLs0ZfYH846LQE4XprsJRYNC3Hj7j0cJ+vg5OP4=;
 b=FEkn5CW9mPjwF6EisrUZVRUlLirVjrDebQ11FiTQrcmmYH8Ceg3+cgaJOP55mBCYu9XjCTrzTa2W7g068oleHbSYHtm0NwWl/gf1QQOvPpFehFMy8VEE1+7G/5LVGh+vX7qAKtRf98zmUcEC1ih4pGtS5mEI+4OqTj3nE4eZL+7Bk4Uo9iWgYffzKjh+6yUNvVjGMtmELxosoAc/o8QNLYVAJyEc7sfOQUto2wR9mLF+bPU0Oki1Kt34xYOAfUSzOx0yoHDeX5CQHjdd2T9vWp8Cr6FP4lkf30p2K5CSAnUAf5UiThHWcHxmSYWnTP6FwWm0iq+hC9L0CvlCX3lzpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/H6kLs0ZfYH846LQE4XprsJRYNC3Hj7j0cJ+vg5OP4=;
 b=2+7RWWLrBepb0LWKU8WBwLH7t8ElUwvkTrg+ZeNQijW9iIinkNNLsaCc2ieNSm5e7mLrLMhhm96NVu9e3lePrpWXfHWtAqJlsF8Y1igRP7RA6MneNPYqnX9n37kGxUMLTUdkq1xYxVtsHLo8pXnkLPYbrgV75LS74EDkWQyo4O86UTR8HzjMHvFV6Ns1Ba4J7xN7F/0rEnQRlC1eHC3Pb/EkjJSOlWLnOwTfXqzBazXfNrLnULMucA69heHHYINn8TQplKiLy4H7pEmYG3z+PAftXnioZ7gctz6PAh/d1kbNvxhfHuU/uemYtFLwfJWy1+fOdLrAPP6KyoMyyKwUAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VI1PR06MB8976.eurprd06.prod.outlook.com (2603:10a6:800:1e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 22 Oct
 2024 08:17:07 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8069.024; Tue, 22 Oct 2024
 08:17:06 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [styhead][PATCH 1/2] bitbake.conf: Mark VOLATILE_LOG_DIR as obsolete
Date: Tue, 22 Oct 2024 08:16:54 +0000
Message-ID: <20241022081655.3970573-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0053.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::21) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VI1PR06MB8976:EE_
X-MS-Office365-Filtering-Correlation-Id: b21e3b63-398f-4ec7-a8fd-08dcf271eb00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UpAwvgFfwCldUTQ4CBLg1cgSpgKxe2MaPtPIBbJSw6KtopGwiWg1KdGmIW1i?=
 =?us-ascii?Q?jJcH967FlP93ppyaSKsdxmu1N8ZqFrZTNm4s+VRjJJg5ArKqNGSsQpJbt2DD?=
 =?us-ascii?Q?rbuzNr9M+PXh6er/nq5KpH2Qy2Cy29hNRBPQq8+A3lZ+1SB8kuR5IUlmK6bR?=
 =?us-ascii?Q?XeIgncTH2jFRuXsj3eTIbdYHJnp/trlA6KK77gSCcBfOsPE7WaJoY/xonvm/?=
 =?us-ascii?Q?uwiv2h+9TJlKKSSFfXChc3LQhMLdGE6OzPjZINPkLaAG4x4PqGdtsRSerJCv?=
 =?us-ascii?Q?511qvvWtIudML2v0J75DVeNFRm+vrCq5LmoxSnfST3R8+WchrvlaADAwXneY?=
 =?us-ascii?Q?xvin8KEd4Aqc530D6l6vIz8IygwXVw+LwnNyOL5tp65AuPpGZ5cNGDFipngW?=
 =?us-ascii?Q?sBPxfqpOHJTC67+1D4wygK1ICAp2zhHgnXNbUaZ+DDjk7218sfpQuz2WcXRX?=
 =?us-ascii?Q?gnvsE0kkREskoKwusAkElrMEU4psNQ37pemqfjDuY6RVKde8ahPHA7K+/17M?=
 =?us-ascii?Q?eLJ+NFZWcyDFw3+d5MsS3IwvBRh6UeJaMpC0ZfTbJqWmSsfse/B9d23TwBYO?=
 =?us-ascii?Q?tppyJ6Q2hUIuhpl/PUKhAV3RHj276BpLgvg0gdCntMEOCFaMe/BIo5VFgiN7?=
 =?us-ascii?Q?ab29SwO+gM9SxLZ2tarnsmkPJt35EljhltZVvCM48w/Ca1P8EPoO52dH13B7?=
 =?us-ascii?Q?rWGrzBs0rgWP4zhK0ksoWMUM8fsz9GMg7pZ/T0FqilKx6R2rnZVqBW1EBTa5?=
 =?us-ascii?Q?xkMzuhjI9hOk3qcDF0flHSF/6hgAQtg41QsjH8Z3dGYQCueMwKQY6m1JDPIs?=
 =?us-ascii?Q?UpfiOBOzYvOQrrzhS60CGfm868IrrAqgAIVF3ZoIkRa78m3DI649Tz+dOyIy?=
 =?us-ascii?Q?tnrtkelogpaHCl1sPan0UxeQYqLR1AxybXP7kWJ2fM0UUnIRYRCI1ki1rbWx?=
 =?us-ascii?Q?397ZNfYFFE3wHQq0k56aGQNDM0WobY+RQZ9XfJRsFPGxQ6zqgCgxzP0EY28f?=
 =?us-ascii?Q?mcrsnGRb0d9bLOD2CweQjrTQ6geUoX9sVq5aPHNkmcmnl1GnusTHnvoIdoub?=
 =?us-ascii?Q?HREK0RQt7SWgMhUShcUv2NxRN4YNrdtWODFGb7rlsHJD6PwgRnVpsSvqrT2I?=
 =?us-ascii?Q?3pw/8qHjV4FGu2U2vBmRrnW2brXCgzjau9YrYHVXmcvnxqQ25bdyfQrNeqV7?=
 =?us-ascii?Q?lKiaK3GXzswNGJSgGHlIU+y43trHo+FG02a5VoRRrEkucrhpopWcRQDB4lGT?=
 =?us-ascii?Q?8vQKbLfdWfSDHi3RtcbKkw+hUAk6ArKp/75dj2TaQ+NmMKlONsRmYnsKSXBT?=
 =?us-ascii?Q?ZcIqfMl4NSLi35q8pupYPTH5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EuQL+0YAcp93xXt+qPOe8L0RPFIvXiKoTHfdndsxZsQ5Kt8GU5ROc5rdapuu?=
 =?us-ascii?Q?UWMxH3q213Z/f9T61RoYVlIe3AQvsFTaaprq5nFkg9zJ2ySWwSfMAJJ395xD?=
 =?us-ascii?Q?gCZH3s/FRfK7NxBaQKDz21Ll5mgjNwdVlIcsUmUvueugdoIcFGlBbzx8BmQT?=
 =?us-ascii?Q?FXwtQ1MrQNq/abALbd3NmrNVFDHjHpmMhjqoG1n2Q2i7iTFAPTf10sIkDYK5?=
 =?us-ascii?Q?bmrpmuiDHwijD7YmtYMTX47g9IyCRimKFr2PgF0rPM3/DeT52n8J1H2kNUta?=
 =?us-ascii?Q?XM1quj1yAs7kyWM74BSv8XdpZPdRn3A8Hi6+XzhbxkJ5JAxRiEvAD2l3TpPt?=
 =?us-ascii?Q?kw1U9qctsVbjDTXut7ZEE6AWCwyskp0rqMLtJjgglPyJVYQy2rgo9shRVXVH?=
 =?us-ascii?Q?oxTUf16FaYt5lHivQ1I/+nkWBJE+XwLeJX0f4jifcagBa9XF2Y07uJrxuiJY?=
 =?us-ascii?Q?8Rsz39wrMrvcQ1D5gI5yAEhgIZ0bzcZsJhardGewEXkxO3yU1okXJDpA0/5G?=
 =?us-ascii?Q?BZxqRIsPsKFLS7AzMF16mVSqbIzo9HzlGWs8RDkgKSPnt8ikAtURfbRW29IK?=
 =?us-ascii?Q?zfTaQWy6IEjPYetWnS5LAVeO6R1QJoUw7xv/1n+5uRH9Ak1W3JMfszlqp669?=
 =?us-ascii?Q?XVlh1XiCe3J4qHXhPh9qWwB1AITHCslYeukVITgphnYOclT7Qcq+MlWcYA/V?=
 =?us-ascii?Q?ALyyxv1Hgp2sXdrKz5UquleEXkSznB0a2PgiN+2hN5MSEC29IMcGNUhgamXK?=
 =?us-ascii?Q?CaKCYdHR/MBmOs9Pj9RvkO3yXaVXqnRFVNUp4WwIN8TwmhJ4JrdBeoOu/Xw9?=
 =?us-ascii?Q?KqA0h5GhlbRTSqP8ZAohYI66ykkBt1x2N6k9UTxWHfcynSnzs537AO/AkFwS?=
 =?us-ascii?Q?LJiiN4f9TVyT6CfIu6ZVGPcBwRZ1bQHeHGu9KWYo2S7nO/IfTVKsIW2BEIc+?=
 =?us-ascii?Q?JJ8iSnTO7TJJnqiSQwpKOOwhKvzuAduqAQXpT0guWWY0MEO1yWV8S0K7gF8N?=
 =?us-ascii?Q?iCCFmpzLrbvMy8rtKYQIDw45to3pJwiiYPIm7JIMGB05tVlflFaJ01F+jM2o?=
 =?us-ascii?Q?7vk2zHJQ6o8i/21QsYFPrlNolouwmuZy0Yg1aJmbkSNOtrn+k9oFK0qbixbS?=
 =?us-ascii?Q?rQp1zNPSUXGU6UcHHnPs1FapAejQLnkDs7OEaXMCwYETd9eKdiMG2pVBbmwl?=
 =?us-ascii?Q?Ct01yXWVEwYuwbNl5fpwr5ar+C+UKuzxJWg7c0r+9c79/7B+Uk6nwDYHOVTu?=
 =?us-ascii?Q?1kahcQRHkTU+zAgPaMfVRJ34v2qMD7IDTFpcSsLuSap31kh04B5nxeQvpTOJ?=
 =?us-ascii?Q?YnfgTipYHQNiSIzF8kezIYYC8ItWpr1mSQg9dQQa/J1SvV55KaWsmQt9H2kZ?=
 =?us-ascii?Q?ExpjG+f+1sZPnzkkdSr7S8AruXTE/gQ0EGHsFNsw8z5h1qdTl0XgFkbdpY8v?=
 =?us-ascii?Q?uqcrP+NbigMj8Qq0Zo1/5OYV4M3CJItPHTiCORSVYyJ4VbW4qvojRpnPEd3I?=
 =?us-ascii?Q?CX5l4UgeQy1Xzvxi9aSFNIpmIcHN6MiqcnL4G8YeZtIeHp2wWIz70SAo8d8Z?=
 =?us-ascii?Q?u/1RQG5BLPVg7hpz5gynrya7AOwZ4InNLi0UTlCTv9MseBC6gK3tDSnrSzVQ?=
 =?us-ascii?Q?Cw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b21e3b63-398f-4ec7-a8fd-08dcf271eb00
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 08:17:06.9280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQ9TUeeKz7Nj5tWUP9xo/UhtwKla+Owh2z+o9rzVRkJnv7IizXdEEKEebJhBKbGLUYSzSa0DH2gILxsy2+w1Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8976
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 08:17:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206144

This variable was removed in
https://git.yoctoproject.org/poky/commit/?id=3D2f8806deb7655b37d6f8d12ff546=
80d6acf7a298
("bitbake.conf: drop VOLATILE_LOG_DIR, use FILESYSTEM_PERMS_TABLES instead"=
)
so ensure that distributions become aware that it no longer has any
effect.

(From OE-Core rev: a951a900ce459191a9796a7069a1d3b658dda88f)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index ab4c6a2d9c..59ac1873e0 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -106,6 +106,7 @@ BB_RENAMED_VARIABLES[INHERIT_BLACKLIST] =3D "is a depre=
cated variable and no longe
 BB_RENAMED_VARIABLES[TUNEABI_WHITELIST] =3D "is a deprecated variable and =
support has been removed"
 BB_RENAMED_VARIABLES[LICENSE_FLAGS_WHITELIST] =3D "LICENSE_FLAGS_ACCEPTED"
 BB_RENAMED_VARIABLES[TCLIBCAPPEND] =3D "is no longer used, modify TMPDIR d=
irectly if required"
+BB_RENAMED_VARIABLES[VOLATILE_LOG_DIR] =3D "is obsolete and no longer supp=
orted"
=20
 BB_RENAMED_VARIABLES[WHITELIST_GPL-3.0-only] =3D "INCOMPATIBLE_LICENSE_EXC=
EPTIONS"
 BB_RENAMED_VARIABLES[WHITELIST_GPL-3.0-or-later] =3D "INCOMPATIBLE_LICENSE=
_EXCEPTIONS"
--=20
2.39.2


