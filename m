Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC239CCFA06
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:22:08 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.85])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16045.1762158127551463229
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:22:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=Yp8G4PBR;
 spf=pass (domain: navimatix.de, ip: 40.107.162.85, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOH/2aEA3OZGFARoaG0Ntic5SeiIcG+KVxOJ1sMpWInyRmDGXm2QHgZfBE3R3EyZTB66LDd4LSBkMILaNdNpwqxVnmE7K4dZljhGyQUIKxtfuwsiqFYKRxjbvCEN8uFIiKaNJ7cHIhL8zDdeFqmZHJ/kCa6ztgvm0OLXqUOU4cGKp43gebd+eGZaQmJLaKYkbmhpVRR/wMbAjqn7h1+bAIThsPu5Yjlxi8+Rmjlgo11jnJv6p+A1EAoxoC9qh0m1qg6h4QXt7mh6bkjkffGrjP72ixuNPSuIo8NaOxQpIqmycqMWOorIUWYVDWOMkFr4YbdEAbMlaHmqc7dhTiggcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VpNZ8n7G+NimOSe/bjxHqdVW6vz+aageTBQanFmeoj4=;
 b=GqOzGUALJ+YRfVy0m2unC+NRmb9RWpWB4ZbLwsG9lSJAv7+rHUvzPE6i6pwm5Vcm2uSf4nRlTLRKn+5xDWybHFNsimT8ZAdcEKRHKeSJTktwB25K2mry+PPs0U/d63nYMZeADEkPUw2AHCtlZ81WZ8lfoQ0rd52umgjNZM/Ehyb1GmQ6pDY7whHRAhW28h2OL9Zzm80yn+RDsD+Zl1In496qRw6j73sV/TNQcwu4lTQRsjyIbIyqxqxX1jsBl3rfjCkrPOpMX+cT5oOWCauJC0ml80y20Gq7WG8Ut59gSuiP0zylyKoWnwZc8gQj+CnLtWMVy2y5DDRPXxC4zSy6rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VpNZ8n7G+NimOSe/bjxHqdVW6vz+aageTBQanFmeoj4=;
 b=Yp8G4PBRXJ1iQdbuyaHGU8zrEBC+9jEknnvtIIpMl/3+m7hSqpYG4VhbnsJId19aFOJG99HsHvi3o8Xx73P/NpCbHpZJyFC7kJEgdIppCjqTFLQHRS7OOVsWkh69UDwmShRvirSdKarV8LdKWTThxHIsn9bg0yRKNk9Q0CbwCqg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PAXPR01MB10285.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:24e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 08:22:04 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 08:22:04 +0000
Date: Mon, 3 Nov 2025 09:22:03 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, emil.kronborg@protonmail.com, 
	richard.purdie@linuxfoundation.org, joerg.sommer@navimatix.de
CC: Emil Kronborg <emil.kronborg@protonmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [kirkstone][PATCH 12/19] gtk+3: add gtk+ to CVE_PRODUCT
Message-ID: <489fea5855effad3c60f3443df46729c2e432b99.1762157680.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0312.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:85::6) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PAXPR01MB10285:EE_
X-MS-Office365-Filtering-Correlation-Id: 9665f60d-d025-4c67-683b-08de1ab211fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ik9MwMkeQM8qz97eQ+f+N3PeAzDCtR7Rng3eVt3G4z2de9You3Hd29SNJalC?=
 =?us-ascii?Q?3lBrD4/i/Kq+lbYMB7xsua5lxS+gv89HG1GUWEDvtDLFMcu5gIQc4o0SVlfX?=
 =?us-ascii?Q?JQlP5u3zCI/2Bo52DfcBVn4un5OSZKNTLEjO1jYWUrHr9b/hM2IKCCO/s9FC?=
 =?us-ascii?Q?A3oFWhJEBADkapyy/Iy9mlkx1DQdv8EqUVca/sc8Tq8lc7YZCjCJcz6hLoEe?=
 =?us-ascii?Q?VC/xrDVAW8aSB0vZDbblZ5chUQbggYDVezXsyrLrlNMkGpYlttvfsIhjzeQt?=
 =?us-ascii?Q?IbQNcHU0M54I+vaKfDDyNybFWKFJqXwKyC/rB3E/DXHzhXiuSLUmJ6JOAXKE?=
 =?us-ascii?Q?xqDqvtn/jJ8KTQufyrd0/PP4Y8nEXZ/KtqD8yD3z9TgUqlV4SNp4bVTjEAo3?=
 =?us-ascii?Q?WlfbCrQIDzJxK3AH9MZfT2i/ZC77iVDdypiUUeGfVq4D4UcW4TnNT4hI2+u+?=
 =?us-ascii?Q?svcDpAuO/XTgcSawOVVKpEpGR7tUi2UNc62w3L8aRbD8TngfcDZ6uIS317Qi?=
 =?us-ascii?Q?w7YryYsIJUWSbXlH+PatjZ+q35bzDOsTAxd49GRrW7Bgt/ATOTA8QkZM2DJA?=
 =?us-ascii?Q?VHlqJK7nu6hQ2iL+3qeJi5Zo+WbkTQVvZzZ8mmES8Cq/pxec5dU7Z1+s8m9m?=
 =?us-ascii?Q?11cdNcuMg1KLkoJO50ab/cTQh/7KCQJKfu0TMc1iqONy5kDBJh/saZLuNT13?=
 =?us-ascii?Q?9WzHgJx1sk/hOZE2inwjbaL0Grd0KOiF4iHJFQj0O7ck1yTdAZ0NWnfPs8N6?=
 =?us-ascii?Q?mvQ2aZiHlIQX+zstVvpyjoAw/ghE06KACGNDnxCr1a/xPZSIhOcx6M1Hqhrn?=
 =?us-ascii?Q?qRcz6dFvne7M7j0tHRERUNcvX5tE2V0Rxsyinbo+nRSYS3CXniKIU0AFnS41?=
 =?us-ascii?Q?bF01FwT20dCJ+3voeEApGnYqWpV+217pRTJN23NoioB0H1kz/ksGY/la8pK+?=
 =?us-ascii?Q?D8rwJrEtgrLIPpKgValCUCmdj4gAkjkKdEyUYSPsxr25ZqeHtxEYehgWmZ24?=
 =?us-ascii?Q?HQlGD6Mp4zbJuQ7S2FXbAdh4CQ3OJZ/zedWaCgLz8Yoe/BPqAjOsriVYKvOT?=
 =?us-ascii?Q?VBBS1IsSmx2m+iXp+KFcgHw74I6KzSpAO+zV1x0YfZh5DZQi9YCKNcedabVF?=
 =?us-ascii?Q?hC9eRMW3b5Y1UpkgUItOmvfS3kaFhZBrwdG6Duz6doDX+Rh0518ooaFDBpDD?=
 =?us-ascii?Q?pZVCzbp28kDn7x8IeHDA11hjynv2ClWkXhJ3m722FGicupJCeFdDCEZyr/hW?=
 =?us-ascii?Q?9FnIUOAiMgU6vPAJxB5dB19A3MNQVdAignSlJggqJkwKX/pw0fuTguPxcieI?=
 =?us-ascii?Q?nfeHjp8UrWHWhKxhWT2kesXh9aMUZYqYbhvL0oGOsPr64A86MIFx/dP7cvzY?=
 =?us-ascii?Q?C2ZBjLQK0LqAtDhbzFK9OEstf1RFDRY5eQbWwcvqcopQGsvSwrT3XH+flYXN?=
 =?us-ascii?Q?djHicyBuPZddIT+i5TwKVYZd9yp6HZYA?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1RV4Rzpoyf6MxIkMo/00tQA81XDOYeRqljH2vsO3ZTnLOOAkNdyUZMG2eS8q?=
 =?us-ascii?Q?nagHnbnhdul9WhRJsCqau7PYjSe9HmHVKgu6x2Xc5LKsVBFldwZraBaOaxgF?=
 =?us-ascii?Q?DgZwGIqcyDZmBqTqlTnDXO3KJZN9LSvFkipKkdyH1bjrd2pGVgI8bkuchW17?=
 =?us-ascii?Q?18OdoPHMkz87lDADBQwJl4/C715PS/zk6WzWeEVZFrSZzNPwFjXUPvXKXlFq?=
 =?us-ascii?Q?TdbgAiI9+KP+J0nySUF6emuauqAgSi0ntH2kc4vKmmHjAEGdPgiVC25J6bfG?=
 =?us-ascii?Q?RD+pfV9CPUdgpdElikXNGqRhfPxIl37/u74pdkONx+4PXMTqiEKqbZB8Ujp4?=
 =?us-ascii?Q?7V+Gs8kfTKhT3ohYQg0g9FuvaNVsTx/HSmE47Dqhd6MIvURzwjYMuBudYf/4?=
 =?us-ascii?Q?vdVV/NtSJQ2ZCLxLU9Loy34n0Jtelp9e7FT+UE4R5umYc40+WDeWhacjbYkv?=
 =?us-ascii?Q?Lr4CwizrM0ktnSNhkieTQInX4NqaHydRnwz4+dGPvKdMTCuL9cTmS0DIzZle?=
 =?us-ascii?Q?KJBupmw4MuuVlJ3ERL37TlOf198w/8EpbPIYMmQ740vzVy7BcCOAI2Ta0oG3?=
 =?us-ascii?Q?WnA0f+KT8YKJ3K1s30SJSXndeF79IJ25xBynsTruWv/T61uWM4w/y2hLNZ2K?=
 =?us-ascii?Q?EdkoizVt8kmgKzqAifRmHVl8ah5+2WgSFAMsvk4sSmHz+Jl7WNtUxMEx4ykq?=
 =?us-ascii?Q?emKtlAZs+deoCXOgX04EOlE5gdcExpboVhdi98fZeuhbtwlpmPfGQe3s9YGQ?=
 =?us-ascii?Q?cXRWfdDFJnrnUAPm5yF0QOQBxFMNsPww56bFwuHsrmI+VXVwWnjWlGphYzAs?=
 =?us-ascii?Q?h3vQ2sRXgH7+qW3LgfiV4dDW2CfHn03c9WvSF74TH8uTdbEFTHFCWWHjzgqu?=
 =?us-ascii?Q?ud+MzjRiCwgB9pAtuv/R/wx97mNpNe5Y2F3dm0fgVzj96fiYCbECgGWVyNtb?=
 =?us-ascii?Q?Sn5spb7njPxz0hpjOC8Qyf/32VaiICrV/2ABhV87CAde9t60Y8yZ7Dxsn+Oy?=
 =?us-ascii?Q?8SLPY1sK3sSLAtKskGXDtcaLHX9YZlX/Om0+Q8nMf8dDF5+nyma1lwwls73a?=
 =?us-ascii?Q?/5fD8eh4hBlOsQguYuHrxjfrsBIxe3+MN5E+yGrUf5t+6HbJa20seUZnlEyt?=
 =?us-ascii?Q?3QlSK1mEc7/2w8ySmSxWAfU+YyDKQg+Zh7+44ldgqBgfMBKf4vf1z7SuoNe0?=
 =?us-ascii?Q?Gl22LX6RGiGgNqp3x3iYL6uVgt89+NF/a6kI3hxdHM+xIYMbHCAhHsPekrxQ?=
 =?us-ascii?Q?ycBTju/z567v6ObWcmpXlq2DF6Q2B7YYvZu87x26LQMmwiB96hCs8vS05KXr?=
 =?us-ascii?Q?gtNCGbrhMAYnajgVTsWTqeBU4cAGREm4TkrpGdsaCDzBDl1r3zxNcWgpHDHP?=
 =?us-ascii?Q?ZgrubDQhkh1PEpJpsuRk5Rtx2p+bDk12aQWA/2vnZxw4TYqCgcOnuYDFzzQ9?=
 =?us-ascii?Q?gkzCVN7heQqWBZepiJM/SFe4wp9Y2EN09H2++xyAWGzZmsPLXrFkIUo3V0WP?=
 =?us-ascii?Q?Sb8J+6yN4Vm0TfGj5T62WwpspQI1JR32BIBrnIPR66cLSnwP8TCUhbuhA4YZ?=
 =?us-ascii?Q?LnnvYezizpYyAFKa9F97LZFbeFWjlo3qUV4Xr1kRQNLAxxAffteA8pgUDelt?=
 =?us-ascii?Q?Uw=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9665f60d-d025-4c67-683b-08de1ab211fd
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 08:22:04.2611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MgcI0JgtELbzFOMfnJdsjj/W3U5ze/wzhXpY5UILq5kX/paWwLzrZJzfm20L5lyPAHzbHiPY1Xecs2jxdxI5KZfHbX5dpuNhd2omMJUXWjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB10285
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225626

From: Emil Kronborg <emil.kronborg@protonmail.com>

While the plus in GTK+ was dropped in GTK4 and onwards [1], it is still
necessary for GTK3. This is also reflected upstream where two versions
exist: http://ftp.gnome.org/pub/gnome/sources/gtk+ and
http://ftp.gnome.org/pub/gnome/sources/gtk.

[1]: https://mail.gnome.org/archives/gtk-devel-list/2019-February/msg00000.=
html

(From OE-Core rev: 378e1f415855feabe88b168e14f8d367f388e4bc)

Signed-off-by: Emil Kronborg <emil.kronborg@protonmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Cherry-pick-of: 2f3dafe8aafd4b52b152a1abab6b9412de621147
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-gnome/gtk+/gtk+3_3.24.41.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.41.bb b/meta/recipes-gnome/=
gtk+/gtk+3_3.24.41.bb
index 94a553584a..a9b2065683 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.41.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.41.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0=
d91eb439ebec522ec2 \
                     file://gdk/gdk.h;endline=3D25;md5=3Dc920ce39dc88c6f06d=
3e7c50e08086f2 \
                     file://tests/testgtk.c;endline=3D25;md5=3Dcb732daee1d8=
2af7a2bf953cf3cf26f1"
=20
-CVE_PRODUCT =3D "gnome:gtk"
+CVE_PRODUCT =3D "gnome:gtk gtk:gtk\+"
--=20
2.51.0


