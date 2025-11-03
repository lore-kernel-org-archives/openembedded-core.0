Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54CE0CCF9FE
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 07:27:38 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.96])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15420.1762154848101055566
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 23:27:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=jGuW+FsT;
 spf=pass (domain: navimatix.de, ip: 52.101.84.96, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSEjBfVu755hKkU9YsKrjH5ALC7D/YBwG479VNjEhC+Gt+D7EuENwCbmCK+EIODeeoXrz/+H6K1+AI/VgEQtQxCF+StHnac8av5BJXPanDIM0IiPbZbA2OgXz00wvBSOSYLYd8iwWGvQ2FaRIboknHEi61Q761VC9W++DO691jr7yuGkmPv4IYpXF/EZrpa/wXHQk9kZK4APQYwutOVluybZoQmvVn3EPIFT3OZqP2MZ+hM8jPdCfg4Upf29SSRUrZiSA7asDT4V+jzDt84QxLk5ORDIxaUOH/BFk+Lat5jmaZiWSpRuZ7LTtWHvYVP4Fwj76Y+Rr4u0XIuP9fpRqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKP91O/xTYCSsG9gkDxOkVgfL7aRCCPUzM6JEAyqPRY=;
 b=rtbIRG9mqJF8WCbfsWEV+Mx9TjicaSXDqXPymS8B/orKTsDK4AZOIVqCcB/3zdwKPZDFLqCMubXbbXzXrksbyeEDCLfVGUyxUNqZW+C9gtXS3ziRf6y7VZxTQncNhOTgvLdW+ldzJv5qAsHsAbT8OyrIn21VEBnzrOogcoOdbxBY/9na342yZtgNe2VQ1xQMy1KDmzmvY914+YFV9tOZkMvpdp7a0NLkopULUk51WOlCp4Vh73b1hGE/cN6eR3iigo1jgI1oumAcdgUl17+1IUvMFUotd3xlztnYYZG4oJ5wvKVHjC54cC6uM3ow5c0C5Nqn0HeXbQU559MGrUQrBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKP91O/xTYCSsG9gkDxOkVgfL7aRCCPUzM6JEAyqPRY=;
 b=jGuW+FsTsvQzdXeeihyCytWPBQxb/v/yDLXAOT/N+uBwyi4FJlUQxkK+X7qJajyLs/etz2O9RDgPWtJ3K1b0GrpdVx/bHTFxfdIHsmc7YJl1vg5NgbpWEtfigpZUE85WoDgEpAaS5uFnKSbb3ZhabuRIAEXW9hIWd3o6b60gXBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by GVXPR01MB11926.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2e4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 07:27:26 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 07:27:26 +0000
Date: Mon, 3 Nov 2025 08:27:24 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 18/18] libadwaita: Upgrade 1.7.6 -> 1.8.1
Message-ID: <598f4163349973f79b4de1693c189453afee3033.1762154252.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: FR4P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::18) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|GVXPR01MB11926:EE_
X-MS-Office365-Filtering-Correlation-Id: e89fe2f9-63cd-42f3-7bb9-08de1aaa700c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8eJPL5tofIbfU6S/sfYqsXZAyIt8eye1jv3H0EMZqms675UHern9CkPmulR0?=
 =?us-ascii?Q?npRlSVLheHWOANAVueU8qoc+2KgVJMHLYwLZrakP74Fle90IyJp1jOnmGHIF?=
 =?us-ascii?Q?0/i8960qL7+ZaglqFEFMezylT5OWojsa5EbdQEphKeRl+HpmVzX92ovIPwlS?=
 =?us-ascii?Q?SZP4TNOfdVJ3jDbLPZKe23ocTlPUYAfOzgVhldtipmJ64AkBL1Z1y3jQc3Ni?=
 =?us-ascii?Q?EdHlP2ziBwcl/SsYVsClLo8m+7V60GeQr1nXKUoYjmEl/kw3peP4EDQTyzg9?=
 =?us-ascii?Q?9mpbwF/lLjRiDJMjW3QM6ejmgMjktJiDBHWiZMzr+BcOrP+/032sVq7zNdU3?=
 =?us-ascii?Q?A2OznPw4ydx3OdPOmDcYdpPTc136Id2qCgGI7JDWuQ87QG3HjXZsV2Xu2AIV?=
 =?us-ascii?Q?A8bJoEJTzuNLIgWPG3y3YO9vzpbzfxoH9J6xQeAzMHJfTI3xq2s+9S30amQO?=
 =?us-ascii?Q?Z7m8FwAFskJhTqrBW6J7H3DQLpqQQW3EAEDtjL8y7xZ0+w2kN6FPjsEaxZUp?=
 =?us-ascii?Q?USdgxpqYJXoO4ZbwcNn069JXy/KlpjDYTNR/34YpT6b+/QJCCYm8Bxb7GR+j?=
 =?us-ascii?Q?f9Zr8f0+7NZAvEydPfaSFesDhXZo3xtB2vn8MDXoX4FOxZbVVK3d4CrRNQSq?=
 =?us-ascii?Q?GW0RIzEzaJ58IlNC0i4MOKtzXzy3zP5lAKJrAUhNiytH3bnZOqnlFYhxAauF?=
 =?us-ascii?Q?qqUzZUQ70muvuGQDUjnGYaBeRbyk7vrrHfUZH6DEqonoVuBEam8508uEFhNG?=
 =?us-ascii?Q?vtQCVY2IFVd9Mx5OiL/YDtzyOHX+/MWubrxMnGdsknj4uc907xME87LnULzJ?=
 =?us-ascii?Q?OYM7KjsuMhCHqz3wMonv7W49Cb0S94mNS1L2A6r8dFrL37Gfw+uAe8gHRhwY?=
 =?us-ascii?Q?Fu8NimAkXBh+s1rBwoSplxqs3SBaViSqgsaBXVtiBLxIhknqQ3Czwj3oIsJb?=
 =?us-ascii?Q?TRXhae5PxWNAxZr/31/+J7VbAByaGZYaoyIak3fWepVHWsyNfPa5sXrd/ANn?=
 =?us-ascii?Q?AqTzxqHvS6cqVUi6TfphI6Kjdp/SUDu/f/GnPsUDaLXf8BjFEuPMT6wgOd8f?=
 =?us-ascii?Q?QXSWa0aCXECqKX+GH7xu88RO/oCFKmoMnhT72h08drS1+Z+xWgnyFPLmYMgD?=
 =?us-ascii?Q?mbV9UsGJ1awOe+IOcjfWkty883XKQP4Rwzuqhu3jPAKx+bvYdG2dB6AFCLA7?=
 =?us-ascii?Q?A2YSTyU1BUms1PFqqFhyF08iPKMiC6BsoTiOxNaOH4Es4rwRFncl9pgtLI+i?=
 =?us-ascii?Q?Ama6XSY2C1N77ymOju9Z7rhirJSwhHKZ+0g9HroVSCCYIPaFP9siF3gNy4kc?=
 =?us-ascii?Q?EonM3Cul58IYNxGkNCj73mw7dP90C1nwh8sWC5AkMNZbB7mlsAYTW9zqapX5?=
 =?us-ascii?Q?tUB5l1e+oYhhj7ff66Bhirk+4kjN4q3hZwysBdrQtNMq4vm9accumzKQzkNN?=
 =?us-ascii?Q?kTuURf5wtQXLtW+15l7dHw+5glLWqOXO?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6qUlk5aNMrnl1191MSIjq3xCAbysS4Yc9fFJHz0fClWq1RZcQ93isczLuEED?=
 =?us-ascii?Q?SKq7Cg4Ems4zfyyOoJp7VTMC/dWB68Qexfl2UKASsGvagEVoL+8KwEJd0IQY?=
 =?us-ascii?Q?EndzYV974Gb61QkoqVzMYDkV99GWrnpT6Vki+VZiz3iaN+yXCRfn1nbhg66Q?=
 =?us-ascii?Q?w3eLeXtH2V8vc6ak5Ilt0whsVugxxMDhfLn8OQzDccmkIqHX9vD1VxVuUsoM?=
 =?us-ascii?Q?OyCMTUw7AeXpa0qq12ciC0LeHsveyqBjIJxSG/PCk60DOw9EkHf/d2S9T6Mw?=
 =?us-ascii?Q?wpLzQmo3dkegGkNkvkO/3eR//A8R7jQ0C739DVRy6xzAaPK06A5mpQrVAuV8?=
 =?us-ascii?Q?w5yQD2qbV9FO8U5cj+kpVEXBcusMPNdJbT+4gVSB6j7jVSGWAKxmJUIaoYgk?=
 =?us-ascii?Q?IBJa3WNHfcVb4mcp+Aq5jJ/uAhhzoiqD4vNdAVGBinQelgKWp5rl1u/G1DTO?=
 =?us-ascii?Q?Dj/L5f5WQxnV4f7W2rFKih1YGxd7t8kSVkIvXlFjzycsYx1DlSvJZRuS+FxN?=
 =?us-ascii?Q?/8KgW6E81ITuCwPIg1RWAwXcEEziMsPkbUJdRv90F+HkWDsTkvtOCaENfO1z?=
 =?us-ascii?Q?bmGJJeBeETzhyPfeQt72+m2UTcjS4qnztehQjs2joV3Jw/2IDm8hUAorcrot?=
 =?us-ascii?Q?UfFuZMWMIWfB4W1EFfYJKhoFFA8ghEXfSXAK16n2Lkq8u8Pwy1fKmnR1kKy0?=
 =?us-ascii?Q?WVJ9sTCESsdUPHJYb1cMWgwzOebjSh2uxjqEXBx3Z9s3Lsf2QpYbX05DjVzm?=
 =?us-ascii?Q?6vwuaJVkD8DFPOSHI7sOJH/uttI+GX4NLCiP8iBTj2lKiGVqEAtSVQYouaHI?=
 =?us-ascii?Q?JBWnihK42CcUiLGJrA/dFuvuDpvJGF5PVzB9w3qw+0RLUO1UmCa5V/lR/z9j?=
 =?us-ascii?Q?tf/wINLi8MmzqLWJXjC9Dx5HtOTaIk4VxnUZt52BgFi4JdrCUyZdA0WDyJka?=
 =?us-ascii?Q?gZYqy/lHHSXl20A72B5AvuMA733axVcDM+Gasx1CqbryDseNQIWCFRutVi4f?=
 =?us-ascii?Q?kIouhTGPP/2ojvzlfUecJyWhtwiswZtWPYsmesWi2xGK97nm7f6ZiEx1HlBz?=
 =?us-ascii?Q?B//LFHcQfdgtlXZRSuHTStROFfmvyRDD4oVLIOmyb9ABwo0MWLtW6+GgDeCy?=
 =?us-ascii?Q?mbPtBl2+MSbUg3hjozXQBXMI0uKLSNxoSmNLBhE0bEKIkjv6R1SN296Y4BpA?=
 =?us-ascii?Q?LvT4adsf29rp0OrnorAPHoXsIxmY2rsny0I8v+TJck/q+wgX4fil4JrO14W5?=
 =?us-ascii?Q?zt7ngxOGrvGcmOCKVzpzaa3X63z/HeDwq4bRc1YMjgzSuXms3Spb0oDs3/Nv?=
 =?us-ascii?Q?Z/JC+AK1wJYhV1GzP482IVLFLsqJnlfdBx9GxTuzdwcbK9Rfrk9lMg+7SDS3?=
 =?us-ascii?Q?K77AgtIhwWx+7QARIPvoNdrR6Gwhw3YTSlEppDOBHeUtdcasVy1RW1asxEiD?=
 =?us-ascii?Q?AwRNKpDfgdOOWT0vd4h4TJ1iHbKr+rvzXjXLJ967oIZ9jQqhv/p3pxcsbvQt?=
 =?us-ascii?Q?wyrfm4SDDwE8CDOGPIzkYtMWNlOfKV4hGDx0E/4ghcIduwM8iDOq1GaLAflI?=
 =?us-ascii?Q?czH3nVSB89o0NZfT9XR38L9Pi8SrW1i8kRyzp6yDhqTerImzFbKkvQ5ROdIP?=
 =?us-ascii?Q?CQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e89fe2f9-63cd-42f3-7bb9-08de1aaa700c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:27:26.0933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5hpQYBZpAYT1F8uDpIfQHXcLqyY7CGU/W3bpaXJr2WuKgvsPoxs3KUaJVpHwv/73yIbscZmUk303qx0BUJCcUDI++lxnM2DZf/iQzNitlEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR01MB11926
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 07:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225609

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Changelog: https://gitlab.gnome.org/GNOME/libadwaita/-/blob/1.8.1/NEWS

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../libadwaita/{libadwaita_1.7.6.bb =3D> libadwaita_1.8.1.bb}    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.7.6.bb =3D> libadwaita_=
1.8.1.bb} (82%)

diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.7.6.bb b/meta/recip=
es-gnome/libadwaita/libadwaita_1.8.1.bb
similarity index 82%
rename from meta/recipes-gnome/libadwaita/libadwaita_1.7.6.bb
rename to meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb
index 6e5eca38de..c4a40a8c36 100644
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.7.6.bb
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.8.1.bb
@@ -1,5 +1,6 @@
 SUMMARY =3D "Building blocks for modern GNOME applications"
 HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/libadwaita"
+BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/libadwaita/issues"
 LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b364516=
c"
=20
@@ -11,7 +12,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gobject-introspection gi-docgen vala features_check
=20
-SRC_URI[archive.sha256sum] =3D "5eacc5550f0bdbba6a1568aebf25a3d88f5ee07d6b=
558becc6fd9487579c9a29"
+SRC_URI[archive.sha256sum] =3D "8b1d4d5f89373a5b6eea8d93ecdaee34cd26ad27a4=
dd396c06f5d9929fb313bc"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
--=20
2.51.0


