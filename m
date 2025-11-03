Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41708CCF9FE
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 07:27:28 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15258.1762154838863992680
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 23:27:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=tJDchiYd;
 spf=pass (domain: navimatix.de, ip: 40.107.130.82, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdhoQ5tZK4cUwQ+9RHyLoiOOURjF8n/skz0NpTP+GQy0I2UIy3LatzpX3ebKEs/LNYWhLRCyi0y9k3JvQSGRPXs0g9w7rSZ8zNRk0v6W9kfQ9w5GVbgfIqEkL/gT+0UkWt2rL3MHie1J5nLvx93I9tv0ZTRM3NWX0ogTkRLYREkcWxzoGjctIvGg1zkbnnatsRlLnjDQtSO8qiVkimggcXuO47sbFie732QflgSXRVNZYVj1wJ4+UQUlgCcEHYaRDOA5kZ5aUsbG9hDI7Qh92PXC1Is8XM2J/Ppzdg12MuXWsPh6MRNUJPg4m/fkzqOkpI25INx7LLavfa8sxPqTRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGg5Cx3ibKydRWGUuLrsT1atMICz8ECJQK5s8TlXHUE=;
 b=EZyd8rkMIHUrbSsEApgLTfVXhh/9QcRbspbg/whAfYCpP7DwgTcJXDFYRVRWRw8sane8W33T+vKk0uCpG6YMDq4P5Exsh9t7nw0ifwwVqhbwAquzkEnHYYaWlTS41FlbfI5sx17eLg+2TDPawcGDbJl2J3hnH/GaTPLfI32CE3S1dbXpPjwTdvs4c+TkekA+FPGfbKUQOxu/ZPdSmMK5KgEy5AFhZppria4oDveRm0hlLLtLUog6Gxao8ISeDXu3pJ4qXmTw896ia/2nyTVQLUt43go/3EPFqK1iKtSyygHF7rdafFWPukCD+bbhUrwRyGpT7jm0M3luybtVtX9wIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGg5Cx3ibKydRWGUuLrsT1atMICz8ECJQK5s8TlXHUE=;
 b=tJDchiYdggJapL0o6Ni6LifO91p2sXqBjbkGIixwGxCLjy0pFEEQG2Cs/a5ub2tqKqvsgNVRqi9R5qIN7sbGfT9R3hTZXsV1IBH9UukkQtpVdSqAyMlcPXWtXNpy4TZFULFitUv/PFmeVN9caxhH30g57/k2n5c5B2tlvTGwy6c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by GVXPR01MB11926.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2e4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 07:27:15 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 07:27:15 +0000
Date: Mon, 3 Nov 2025 08:27:14 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 13/18] gobject-introspection: Convert to gnomebase
Message-ID: <3a1ac8563a34df06e791c3313e06f67c53424826.1762154252.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: FRYP281CA0017.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::27)
 To GV2PR01MB11835.eurprd01.prod.exchangelabs.com (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|GVXPR01MB11926:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b6b4a6b-2f1f-4a7d-e1d9-08de1aaa69ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AYPri0WdIAMDREOYifXUyOzoflPtu6dNS4o66E0zof4d8v3cbihR2I0UixWd?=
 =?us-ascii?Q?B9vCNOvAdlrFPGsEe++jTNLopwmeNE+Y1gat1sjc07Xs3GA1o1AwsbVowfbd?=
 =?us-ascii?Q?eq5/ozeq5GFL/i1GSKudZo/aFHqJ/s869G6WZvDU7uHRLVPFJseW6fHlCDds?=
 =?us-ascii?Q?mFk4IcYjsCJgj6efKQuof+hmrWupONv3Hdw8fClOV5baJlNhnw/FJkPvOzXR?=
 =?us-ascii?Q?rQ68TMBVyw/7TGb+EdeQybqga06RO0qEag8NvM3AmPGcnUiSVLXo2wkNzNWF?=
 =?us-ascii?Q?xp9JPYT2OCcImqJEf1k3imtTt3zRU4t0urJN4QmOOiou3jVq3gqhd7xDlieI?=
 =?us-ascii?Q?tH79rJ+dXtsN/7/hj47FLrb2hN6vR4UMsWhzvBoCB/Hi2/zS2kzmm2cz2MSK?=
 =?us-ascii?Q?CSDJPv6zgvxSeioZnxs9Y/s2L1twhOTBnL1KOMlAW8RT7d+uv5+qeZpjY9Vg?=
 =?us-ascii?Q?nBRsGH8bzV79IzM/yxeAobyr8+04RKKbKto0sQEQZanagAnXOnEtkO1oFF7e?=
 =?us-ascii?Q?xjJ8xG9OMQa8NpXsdSP6eeq6cw95Ba3Bl+4L0U08iJGOEHGRMHqBzjgBzHnH?=
 =?us-ascii?Q?2F9zJ18n3KXPQA0z+PgyrNyyKJUX40adrlbmlpzJ2R+DqSJCYfJvqhehF13X?=
 =?us-ascii?Q?rQGRkicTfjsng4Gwso0z/1Ukpnvr4yKgye62R1tkmXA2mzxlTyX7vNUGjD1n?=
 =?us-ascii?Q?sH9UNLDiRPqXZPiK1VHCOCYZO4/d9F+KSOiuIUvtGdZKoMPYjfArRIwg1fPu?=
 =?us-ascii?Q?Vnxgpo9KTcfi2aTQtZNNyGI7p/eitEeXzi4ss9GNNxjOmyBz03lfzAqOq7/+?=
 =?us-ascii?Q?X1dzNlanKGcs3lENPXDi81Hj/GY3hxu7WGPCm26TO9X8v4rY+8XDH4jxZu6C?=
 =?us-ascii?Q?7M+xWRduYBd2rDAb+TIwZxu8RELfnD+y7C93YU2jHZuV/lxeG5HQvhfczE0R?=
 =?us-ascii?Q?lffkIoJhdODEnFeGfuOM4Q/8zl7+fZCPMFUxe7i6vM6PyoXdbwabp3B5gLR4?=
 =?us-ascii?Q?6g4kZhK/f2Us0HANrezlJNQo4ZczOCbUk/0vJrDKfVNB+MOiFdwigDQnWjOD?=
 =?us-ascii?Q?Fd11N96CDpgG0FHf7rdpDZqeA13yN+my8Q+p4ckVt8USLDJgBL41OZo0S4ZC?=
 =?us-ascii?Q?wDqdfSr1Kw2Dlnh5AjNwsIoi8AGspT92zZPwa717Ok4De/F2o5DTpnNWFUSm?=
 =?us-ascii?Q?55zkU/tcRzvyR1j+BA8JUj6KK5QsjHEkts+QTum38p2U9SSHT98tF5AxeQ+L?=
 =?us-ascii?Q?F+ylXdp8o1VXl4Rl8B/efHhaLcwYW0V6kR5S7YBlpsyjiTGAB/rMJbTUSAAM?=
 =?us-ascii?Q?NIbn7IW1VmZBFSHtcWnI0ioG6aU34U67mHY2Ula+45TmcfyL3va7xFFgyMgD?=
 =?us-ascii?Q?v52uO2RaSAKOrSyH9mXyu7tVBM/G4/SFm4ErWq+Jg0dqsuHCdKgspEiFNxlk?=
 =?us-ascii?Q?m3YbTYWf4TA0uPXcpP8nrsC0C0ZvHNRH2aDI1oBs4GvhwPw+i0usrA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FFmRQPYwvj+AwzBwZ13YfF9tc01Y593g8XBFl6BgLHVEWr8W3118tY1ZHG9Y?=
 =?us-ascii?Q?sLz9BZwMjBn07MZylLjQqdxMkTTnpcqZY6PjlC+aEqq76M+KoiALvP3dIHHk?=
 =?us-ascii?Q?9T39OY432Pt9nZSS9+VruDEpvpfEWxEbXAt2gyukZSej01nPx0UqKgSlazut?=
 =?us-ascii?Q?j6z/tgkXEc5QiH6j/3+ZPl2TducrT5QQiNfh7vnKSIi5DMPm9IwvpUX09DJy?=
 =?us-ascii?Q?S2QUP2LDgGRKbzS/pjGMobOTEHIW9a3dy2XCkSJnnuE9oodS821UCP16iDDk?=
 =?us-ascii?Q?EH9swlTXtkHKikZQphN7cLtC9R44LP1i14oL6RYPVRcZWRqYLRy6+F3zosMa?=
 =?us-ascii?Q?NJoy5RakyD6YidCOSshG8SO7RialN9GWPWhDx5ohpohDQcQFIxxF1F0VzlvP?=
 =?us-ascii?Q?7bl26WN6co6ORR/qJqY+hQf/czl2Z7ezm6ri8g0bBWe2EYPphSf0PbeK5FOn?=
 =?us-ascii?Q?Y+OpX2HVJ/B9PXmZIlNJGcbtMiAfIN1HOu8J3jIqUZrmpPt9eYP7CV2BEquw?=
 =?us-ascii?Q?yf3dw2lreCQoHteb0V2pbR2XnVtbz3nAonkSSbRMdY7UYINL79xTuPFvZcF5?=
 =?us-ascii?Q?ZZcSuOdMdwoPXRbhcvw6or93uhA6LRIGEhwrAQO5Et3kJRP9Jy+U2GPtm2oD?=
 =?us-ascii?Q?99jp+eFOB1G30YPA3JcmmPSocottjZSEkaE5sKCW1d9MbPnZktrgVB7w6BXb?=
 =?us-ascii?Q?/8A/xH8Jq9bcuONi/ku8K1zYNYAVPjbPIX9JnpstlErnRyT/ZR+je6POE0kS?=
 =?us-ascii?Q?G/WXE7+MDYiQCNmxkGskahwfX5I/T3mFW7g9XkuV1n1o7p3iFtkJGUfc9SFv?=
 =?us-ascii?Q?RPJY951pw9Zb0encpkjJhQJjhursddM92LBj/32Yy7p5pOOX0GyKEyRhWPEh?=
 =?us-ascii?Q?aO9OKmCeH6zFpV1wSxPi9HGjlnOhLgenQ2O40uKwcRot/1b+NqIdPvFBfi47?=
 =?us-ascii?Q?OuUg8ywTvdCL5EIE3gFICkdDtR7LE+IMyDP6rN6H9gEux039VS4DO3wXzdCq?=
 =?us-ascii?Q?90/UlySK5Q6TuswGm4FiJQNq8Gfhj0dhDeQgtxPP0HG52C1C38DzBVz66+1U?=
 =?us-ascii?Q?tEtzKRTcEB68SnYsddI2hgCh9915oY/4klJifrUUKdOfp0MZ1D/zUUSWf34O?=
 =?us-ascii?Q?x30d+ZB1kKVS7zEO47u9PKZekxrR4tGNRH4yUpmRTETUeqSQc7Zy+inZG2np?=
 =?us-ascii?Q?a7zp3GfeiTdlD0TCXoYDy12cvC3vaKSY9Vgwm42mQ8r0RcluQWpNyLuoOFTs?=
 =?us-ascii?Q?rRNR8PYxxwu1Ivx5402dzGLKl9JTldAgGMWCFd0j2VjEhjftDogS6n8Z8W5+?=
 =?us-ascii?Q?2/jE+ncmxIpej9ULLZUyzFfj4BGQz+zCwgy75hjFQMAKEesj7MwAfgIwq3xs?=
 =?us-ascii?Q?5fRTksciOElVksXaOKUToPe89XiRFu7LIid/X+iLIHALYsI4odnLOYRLgBSn?=
 =?us-ascii?Q?bybjRucvIkJgKw1GsjApj8TaJ2wQ+Wvktx5/7j1hRiyb8zGYOvctIuHKgEsp?=
 =?us-ascii?Q?W2Jjqz+kKGIf5fVk3pM8/co2PMrs8HS9QvoyAZi0AXPCFbCWXUKdKzUk/EAW?=
 =?us-ascii?Q?zJDegLAwSPzVjggoJPY+8bU2HRVqY2/ev2oROQ4dIDBK5VPAWmxMOephfEx1?=
 =?us-ascii?Q?MQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6b4a6b-2f1f-4a7d-e1d9-08de1aaa69ce
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:27:15.6586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZzqnPbnYD2nqPe7+PIjCYF7vs1JBCpvew81yDG90HPvUTfDKmlXFmduaLukT0iSVr+ntbZsEZ7zjAkVNi0lBWPIprXkTvjYrrCeL7rkacp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR01MB11926
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 07:27:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225604

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

Replace HOMEPAGE, because wiki.gnome.org =E2=80=98has been retired=CA=BC (s=
aid on the
site).

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 .../gobject-introspection_1.84.0.bb                      | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection=
_1.84.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection=
_1.84.0.bb
index f6797cd2e5..dfdb1eaa03 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0=
.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0=
.bb
@@ -3,7 +3,7 @@ DESCRIPTION =3D "GObject Introspection is a project for pro=
viding machine \
 readable introspection data of the API of C libraries. This introspection =
\
 data can be used in several different use cases, for example automatic cod=
e \
 generation for bindings, API verification and documentation generation."
-HOMEPAGE =3D "https://wiki.gnome.org/action/show/Projects/GObjectIntrospec=
tion"
+HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/gobject-introspection"
 BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/gobject-introspection/issue=
s"
 SECTION =3D "libs"
 LICENSE =3D "LGPL-2.0-or-later & GPL-2.0-or-later & MIT"
@@ -13,14 +13,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc434e8128a68=
bedd59b80b2ac1eb1c4a \
                     file://girepository/giregisteredtypeinfo.c;endline=3D2=
1;md5=3D661847611ae6979465415f31a759ba27 \
                     "
=20
-SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/=
${BPN}-${PV}.tar.xz \
-           "
-
-SRC_URI[sha256sum] =3D "945b57da7ec262e5c266b89e091d14be800cc424277d82a028=
72b7d794a84779"
+SRC_URI[archive.sha256sum] =3D "945b57da7ec262e5c266b89e091d14be800cc42427=
7d82a02872b7d794a84779"
=20
 SRC_URI:append:class-native =3D " file://0001-Relocate-the-repository-dire=
ctory-for-native-builds.patch"
=20
-inherit meson pkgconfig gtk-doc python3targetconfig qemu gobject-introspec=
tion-data upstream-version-is-even multilib_script
+inherit gnomebase gtk-doc python3targetconfig qemu gobject-introspection-d=
ata upstream-version-is-even multilib_script
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
--=20
2.51.0


