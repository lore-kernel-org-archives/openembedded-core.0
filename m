Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2E1C36017
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 15:02:07 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.81])
 by mx.groups.io with SMTP id smtpd.web11.13335.1743174120694761555
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 08:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=rnpoTrt0;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.67.81, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SYrp3WJE1Iwx7GpoUD8U5cqE/bT+iAZb4LA13wrqVh9ZXbojt/Fe1bCawnxV9o9swOrpwkLkwbcakpnKTkWHwIoOxI2T4dash+cdSSjcxXvB9Ok2nZigPsj/9xnmTk0cXFk4xajoGyR3Np/7za20aE9TYx9CV5dJu3LMtmqYNWzztfM3/XPjIC/UVAns+HuA+fh76VFmvtpWYfG5qfKGkyLNXgzw0LEuA9CU3eum0U2cNlQxvBE3Cd9ZHCc5T7vVpXNH0zWvmXNFLovp24UOqPzCUwH3ACXg3GpgJQrHi19kLc2pKoMX/PwyHNjSvFrV1h+JW3pk1Gt4ubaIxeU3Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxd3Rjf6GyJT0RKxTaf8mBa2G8SOeAgkESvH4Vh6uoY=;
 b=iUQJq+I4klOE45wM6iniAjIGNtNgAK0lpr6j/9kU7Ne8aYMYW3b45OS+IfctVrlMcfUJZV/j8mzg6TUnWr6N1VNxjG48NSLNFZv1E5Gsn83PCru8hke9aIWoRcd+Q0kKcm+/NlDv2bDDbrKju+6/meE2SeV/TVaUfmK1GrH0GSgKX2MXKOaiYhiaRHhCXgqar6xioJFIGB+58VnxE3hAz7okzOwCW7IUbbgBbDZJBfhPJUuJqubEXKuvtupRr9OpJ1fFsa8Kxj+tZKn3TagsKiqdJZtJ4dhICC8+BZxW2BoYTf+e+oCTjDiwv+najMls0WuN7Ab0zFx+SCf8zfKuxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxd3Rjf6GyJT0RKxTaf8mBa2G8SOeAgkESvH4Vh6uoY=;
 b=rnpoTrt0A2xTw4eG6upUvBMiQErdxVHYgQeXJzTrUKvgFNB4z7VWhPlwJQDggJEnWuWva44k3MNOZrU5jp18nnJZE2xG5+T4+bRZR2TO8XiFOmQ40h4mEd+0Kfqb5dW4IzwC4HfPhrqOJcadraGpufkAlhyc9GTBtmL7DjOgkg5yD+U+yX4SDGt6ALMpklJbT2Lm8IEhlzf2Zy4UwLPZ1Zb9s4O31JshPrTus+SwcKQq0tbiun64D/aRtZbnK8TYH2W59lbWV10zvsrWC6x48vV6QnuLwdU9in+EUbQdHBdkHWRie0yQYCKjU4ND5KWaeO02ivbQ9d1V+3xm62oIZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9285.eurprd06.prod.outlook.com (2603:10a6:102:455::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 15:01:58 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 15:01:58 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v2 4/6] systemd: Support using alternative runtime D-Bus
Date: Fri, 28 Mar 2025 15:01:34 +0000
Message-ID: <20250328150136.1855862-4-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328150136.1855862-1-niko.mauno@vaisala.com>
References: <20250328150136.1855862-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF000045C6.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::43b) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA1PR06MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c71cb13-bd2a-4970-f9b3-08dd6e097cc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7vp0kBHPbthgRIq2bGiqJcql9bs5pIl40IG1VyFeUVRTe33FaRloZjerFoVt?=
 =?us-ascii?Q?tmvqAjjGL9WqboE/E9DRMH+1+wsP5Wo+Gi9uUSFpCAfFIW7bQ4/PgWyhSF/X?=
 =?us-ascii?Q?PqExDu5pGrv1z3I9UZn0ArWEBfo+iEYBHc0zIHHv4YrwvqW8FEnTr7iWZ4DJ?=
 =?us-ascii?Q?g//fqSt95yqA1bU+tMTf1itF/E861tCgbAXW8JdLFkOb9lbFDvP8mfrbDzDH?=
 =?us-ascii?Q?Cf35DaYM0ly9Lxmfr+4qdYQAD79ZLPwyTMWYp4EEb08o0vuYJuuFs6mHawXQ?=
 =?us-ascii?Q?SgiLSSwph+dY6s5wbOK2ESOYgevds7oIhEGm6D4dPU/oVEqEiTPeKMxaq9r1?=
 =?us-ascii?Q?Brdld+uc26DnLHzjc2p/wlUbKbxn6D8vsV+IIlU3Wnsf3bthhjmBm3QpZgGN?=
 =?us-ascii?Q?RCyVYi7qwo+vTzOTWNKcpzZbffagQCQthQtq3gqkZ3XANuDZO/L4TW6qZ6JX?=
 =?us-ascii?Q?DMTuAhCidRahUtNT23ZnqdKULED4SsQbZpI4WG04z+r38nZ6/hTs/40uZ7WY?=
 =?us-ascii?Q?wlq3fiJvB/jNhhgqvJZ2vYp8ImcHKcHi0zn8vjQrTaqmbb4YcI2FutfCv0kY?=
 =?us-ascii?Q?DY4JDakQZmzd14BaoA18xswGYVclp0ud/ynxzQf/Wp/u+mngDEkla2pobix3?=
 =?us-ascii?Q?675THH550A87F3flXqB3WTQjJaMB1QfgTCDxMN3KeZLTWBlKfvsl8g4crlqo?=
 =?us-ascii?Q?ovQrIaFERkygQRtqW8GRwIrIHI4gguC1LEzK79icWHGHn5j3G8bw2a7nCvci?=
 =?us-ascii?Q?5UXg2cXSoab9vHZKua0H7JzfWcVcuL5rgeKG1Sjq7vvsshDDK4B6Drcl5Pu9?=
 =?us-ascii?Q?gLbNitDqrveoHibHSASdjuDJx9J+vNEoPvuaKwPVGuh5K7trxnJjHsg4Vaob?=
 =?us-ascii?Q?eeCjsftLyfQrvtAimjGs6LQ8kah5M812nv/HTfm4xOKyJAu1pF0qFqsA/lhN?=
 =?us-ascii?Q?zEot9vDi8H8m3E31HSzFD9P1wv1Fhtc75fMLTOrqz01zNOt+xh7YHvp7FI84?=
 =?us-ascii?Q?Ai2ecycgLD885nx5v0ElkEszIT0T0nHqT0gZBt72XMFirVe6AKdpFeDPcIae?=
 =?us-ascii?Q?MPjTHhZetssx0na0fBu2e+slU7sV2WlKGz1WMdpLoCaQh4SaOBHDJdbvnZwg?=
 =?us-ascii?Q?UMLoE75QtgADe+mOCZ2n4QjDcG0H83/pFMpDGoHIbxHT8Dmtz/v8zbvfX7Kr?=
 =?us-ascii?Q?gdThDucqGCmzVl/L1DiN2rEcLxrOWAl/rFCHKj6SdAdZj+51wNIJsV3g1mkj?=
 =?us-ascii?Q?PhJPVeRNGdocwwrnJt4zKEtsBBpak7juQwjaJxcUniSXMzs9ycXR7OK/W1P4?=
 =?us-ascii?Q?MXqPfUobhbPFvsEugG8Wir8ZFj29+3WodRwaKGDVRtB612MyDhfzfuAQYyus?=
 =?us-ascii?Q?49+oCcZNfR/o9zrTgK67iAx8wdr1ZoQUz+IpP+qyutuxCvxxMDU/chSd/5sq?=
 =?us-ascii?Q?a2U6dFB4jkV9ax3EHmUz9bIa+sNamvCiWW4MOL6FfTpKsjdLiOWbvg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qBj6FGmJHt0qUgC3sFrt+yPkE6UctG803TvIUls5ysfBcALUZXby1bOsxuwo?=
 =?us-ascii?Q?Ubf5RQRxNfszuq862+1a7q2sKTkpmTw3xVYpprftmYTk+9OM4AaYhf9elOY0?=
 =?us-ascii?Q?6MMio/4au6M8ttgzxMUvNsya49pFxZIPNhIXHovib/acLDuUrmR1EBBD43ji?=
 =?us-ascii?Q?TCGtZW1K/Qj2TdafyCAGl5wuCenO7DIsn4280GfxrFIMZtVfoYKlE2BmiOKW?=
 =?us-ascii?Q?tZxLKCgfZCOM+lnY9QztgoTOU0nJ219ZBdnl4oWAklzSk1UIWeBjjojbU/le?=
 =?us-ascii?Q?6oSY+X2M5DKamjYTpLhpjYWBJeRxUpXuROhQjdOviQtibb87VQwUUHrBGu+y?=
 =?us-ascii?Q?HKQF0gqHbh4ALMTbQRfXQ+O9YzH0fsfp1+wdveqtmSv12S3QAPMOZqTXpdZS?=
 =?us-ascii?Q?3OP6QPKZCmIlO17fzmi/aTSvysoKJCp+rLpQDSHqcr4wkGqEGZDwYPr2diJh?=
 =?us-ascii?Q?f0ZqVUq+7cuSPmxEdcV2Qd0Xm1mLheXUY21S+NAJ0/SjLE9DOoF+NMbpryHv?=
 =?us-ascii?Q?4JqwgDmzh/nnw7KEvE/U2NVOsB4cMHH/n+WRwyFTqz0yomCsgp4gO0Gsx4Fo?=
 =?us-ascii?Q?kb2lkgkeEzYALUPEHmSFDgd4snpadIeorMxzLVwLyjPZURmE2EXIPoLFLmR9?=
 =?us-ascii?Q?wCpgqgJnkuk040Fl4qYtVWP987kj68voFXGsIXQbFFQs2DLuA09gbHRM0SX4?=
 =?us-ascii?Q?7JvhAqEosrQAN4WpE4GrAiPO9KkiOL+wX9eHIYpJrJRu4PNFuI0eEpubFSz4?=
 =?us-ascii?Q?/UIvHr/QqVfwlk6BAc80q4czg31iG3xSNK0TLpri//yBthewYZ8WXkijQZaj?=
 =?us-ascii?Q?JfKqTVn4AqpNRoY4xD/bnO7tGJsUnGsbfi9OHgA2oDFcSQ1Y92AhUgPk/CZf?=
 =?us-ascii?Q?1tMqu82vUlUXj9aWfYFtQg4OqEGRA2c9F/vn1+S7GsfDeCafTTtAp/C0nVnD?=
 =?us-ascii?Q?rwd64sw59UGcGlLLg4CRIDP5tGRysfzXo0Vvl9JH6vW385ma7AaQCcg3PQDS?=
 =?us-ascii?Q?0ojPUmsz7xIdwLYDTjC72OA5M5EoW1R8UpOikn6cz2xnb9+Rhyq7dp3m7Kkq?=
 =?us-ascii?Q?vo+xhv3wfvKdE4Uj8WxjwsNCRBX3bXHCqO5TCbFbx09vjIBcu8bKWPKIbAIj?=
 =?us-ascii?Q?ptJzgHbt5XpilLLUivwljVxIKZNCjRIZZM38vEptPqLysgU38xV8olB3o2XD?=
 =?us-ascii?Q?K17r4kMFNrfllTTtCAHUnHsVlqqRql5Pic+AuRfgIrlfHqYEW5T7piBBTzLn?=
 =?us-ascii?Q?OTRqmZo69iPldgH0E96qZ+Flvqbe0hOakomq590fL2PZ+tIAwy0Qv72F43Xk?=
 =?us-ascii?Q?V4XI8AXHkSIPFFftcctmTVXr4imqy22BGImhjOXaGkMxPuVf9tHLV/eeclrk?=
 =?us-ascii?Q?5jFbAR99q3K6trPwnIAw+9gRAuozNPr4kG7/YLZeNGVTsFh+xDppOzyhTfif?=
 =?us-ascii?Q?eAJ7liUAX8rEI1SQYS81tiucpp9OPnkMpc0j52F3edzTWg3NZtX9AZOS980f?=
 =?us-ascii?Q?+sTxJMaufO5xYB3ZtSlEkzAVl/xj6mPlpHvL7ZAcrlAqbdD/RgME7bQT0MNC?=
 =?us-ascii?Q?h+QGPCHcE5XD64KMgwFaWj87MF4OuiPlNg1z0BwrO19CAQwQg3bf07S4qbTH?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c71cb13-bd2a-4970-f9b3-08dd6e097cc4
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 15:01:58.4641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UV1d6U2lQI2wVX76FlDBkBPzA4bKnONPiDk/WQUSkbdrokgTRO7RDu+CEcNIsn+STlvo0jkJsr2nV3Dywixjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9285
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 15:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213848

In order to facilitate oe-core users who wish to use e.g. dbus-broker
as their runtime D-Bus implementation, change the Freedesktop.org
specific D-Bus runtime dependency to honor the new VIRTUAL-RUNTIME_dbus
variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/systemd/systemd_257.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_257.4.bb b/meta/recipes-core=
/systemd/systemd_257.4.bb
index 64fb8fe69a..24aad11c0a 100644
--- a/meta/recipes-core/systemd/systemd_257.4.bb
+++ b/meta/recipes-core/systemd/systemd_257.4.bb
@@ -752,7 +752,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
=20
 FILES:${PN}-dev +=3D "${base_libdir}/security/*.la ${datadir}/dbus-1/inter=
faces/ ${sysconfdir}/rpm/macros.systemd"
=20
-RDEPENDS:${PN} +=3D "kmod dbus util-linux-mount util-linux-umount udev (=
=3D ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty util-linux-fsck uti=
l-linux-swaponoff util-linux-mkswap"
+RDEPENDS:${PN} +=3D "kmod ${VIRTUAL-RUNTIME_dbus} util-linux-mount util-li=
nux-umount udev (=3D ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty ut=
il-linux-fsck util-linux-swaponoff util-linux-mkswap"
 RDEPENDS:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-g=
enerator', '', 'systemd-serialgetty', d)}"
 RDEPENDS:${PN} +=3D "volatile-binds"
=20
--=20
2.39.5


