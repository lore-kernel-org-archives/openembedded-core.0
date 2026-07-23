Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE4ECC531CB
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 07:41:18 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18529.1784792467119693342
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 00:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=liMWwlAi;
 spf=pass (domain: prevas.dk, ip: 52.101.65.48, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=soagqOI9aqYw8jGyBIe8SaCO46W1itrVQFNKOC3fQcJoyYAwKkLk+/MO0Cc2PgFSFQ65TEartEwhZkz1N0NBHoO3qCFsVfvr/0tUbIZGj2GI2Aay2A3x5yy4MsCIfnkhsGjWdqDUtHWU7Y09KFmt19MZPlXTO8556gWJxLRHDFhkDvniNXV14ZqqDVzawzHjLpuQtkbhM6yXRShP3mbwgvrvABSQqwBO18T/RX1qfE9l73n78i79Et4XppmIK1MrO/EkLCGFXmqOLR2qIzZ98VRFKykYi/ArmpogcPZXJrOseDSZPQUHkvdN6bYFkv61hRUYyMwhpLdPbM+gLbFbKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arI8S0zDFTyAtmrXsvM9ZO4+rTE7WhikJ2LChd6EDYs=;
 b=CACK5M4ys4vtZjjyM6gs8WHPgqbZjA2Ga0nLlL21jmZlNLtVNenD1adv/8trF49r0+058bJczuZyQrixd+nY0qImUaJzGSBhKfk8PXvVlRfG4sHhq1YYiTr8KRfoRyNtfr/GaL9Nsv9TfL8mDO5+WVGUb2sS3HaM1jwl12G2flOOU6CxQnhv4RTLjCjndJQpn+43q99OYGi/Qf3hCbj4xS8caBUeaZxzkIhekCEYDKTv+7wab9mcE7BMRCRTCBzD1iflk2AmhoMLm3iyupqNk8IjNwr35xbrkUFbh2bOF3J91JDBjdBqPWQIsuUk82fhKd2ZL3xq4adhRdKdENrJxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arI8S0zDFTyAtmrXsvM9ZO4+rTE7WhikJ2LChd6EDYs=;
 b=liMWwlAibVvRfDhSSDLJjKYSOFDQi7u5/VNFNW/0P54ZZ4C8TtypbO5yLy5VxbV/gmZeBQjS0Z9GtKNP7oCFhiYK1Uttf5yHerFdVuJHfZuicIizoucWes5kpnup5EjJb7CWAGcTFFSMrDdCeRGavJ64hc+WL54b6pMyuhSFDpw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by GVXPR10MB8454.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1da::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 07:40:59 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 07:40:58 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Rasmus Villemoes <ravi@prevas.dk>
Subject: [PATCH 1/2] ncurses: put symlinks to basic terminfo files in ncurses-terminfo-base package
Date: Thu, 23 Jul 2026 09:40:53 +0200
Message-ID: <20260723074054.2125126-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF0005F71D.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::2c7) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|GVXPR10MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e0dcfa2-ca1e-444a-acfd-08dee88dbc3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	FjJ083RYUnbmLTFBwTYCa1hUkgV3ZAqM3OLm1nqDichLeCIsAWQvQ5PTa8ABaK6SpjdJZRJFEs/9LJ48i3wk5boEVQzona9znTdk3ZySM1XV0SrCp3hfSUGNhb0qxjfJYVbsCEUjCSGy4FItgPEWi01z050HzrAqeiWDk8R3vYh/X6eCZnGdRpZZn/tZ8e+7qtw6K2WQBxPOW+YBgNpEe8/CZHe3qaaZ21DXlvin5LqQRp9A+E4SiyHZh8meSBdV0B3+mIkhjTkS7afPPOBjAvdKswd90JMynCxDMMncsLNRnKa/zTHGmVqVR1gnygNFTDVo/Ts+ovZlRTBjZnd4h5Zmj1mkxYH5SJcQPg8wxWqbUEBJ2M/GdL/zpIxuwOj0xj+iJn75hnZpTl2MiePRaFiOZxhMTQ5YcvI8N1r9dV3oweSwrxZ+8prZ9VIc568oNwYz25ZfzOLUwSGbrrW/X1WJlJbhcGjNSiu6ie9XxGcQksWbFOREPvgRrDZaMmB/HWXGOD9nbQEtcYrD0FWLjPqrGeTiyWB4CthVtV3ziNFj0vv8RKsmAnNJ0ZoiuXEg/01Tp6/iai0znehlda8AAZDFie8EB+SjKp70yvD0kM9wlAoBXCmH9dVXpOjw4QumBs0Uqsli5n+zH3EfyPf9YtD/5y6nzPVNObyk/TqTJ8Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?txTU/zGutF3YlpSmwwltSyUJdIYetmj42HzAvE0peQ/tFao34RrPcUiRsFqD?=
 =?us-ascii?Q?P8vwD/JwPkj85sRTiiIY4t2nIZXpilqCwOKmzW7yUx9VqDmKXgLqYBOnAESW?=
 =?us-ascii?Q?B/kP0pcnnr7R/0ZDdsVniVrj0H6KxfHU+TBGGOzY0PyJdib9QJ4ur/+MJ8Hy?=
 =?us-ascii?Q?5Gpd8olVkPE6mZRwVfieKlY4g0NpVlDEE0MjpOeE1ydFn1UaMXxmS4pqA7vw?=
 =?us-ascii?Q?8UoLo/18XBNd6p8369qcyXi8UE/mQZKb1HXKctrK4Gp4YyNAna8ZUsbJuFW+?=
 =?us-ascii?Q?r/ut95xt8WUZjy9bNPEdf72Ypbzl1fL+FqO4fMpXbTHL83IUZEU6ru4+ll2I?=
 =?us-ascii?Q?rRF3uoEh9My/TkrvaES1zRUG4jEEVvizZJw66xnny8RqGi/HJT4APH6oPqlp?=
 =?us-ascii?Q?Tk0R0ufSGOor0kK2qO5FytkYWzfMXYFuz1WOg9OV38vr60ekJXNGMDs7M6Mj?=
 =?us-ascii?Q?KJx2wItDEwoAA8/+17A0R/JwKCIbRvH1s4+nvMmrf87b39os/P+1fVPNb/wE?=
 =?us-ascii?Q?7t/RJ0ZCJDKVeH3y2tle4bqsvCzAgKsWO0WVnEBddHuK3hghmjZpIRKfqisr?=
 =?us-ascii?Q?hb9Em3k7NZqS4iQuVsR2dihhyJqIFNknfR03r2CquAVVnL4dfOmXmBpJMCwZ?=
 =?us-ascii?Q?iDDr+0fCHuCi1MEfoCeMVgM1iYwACKJU1HX0gQyuRG93o/I+rHjgVYFl6BYA?=
 =?us-ascii?Q?KLM5i+ZgbWJIaxUFLCwlzLLtAAcRh6t6ZTQZE4uSOfLIssD388DajJOJGY8p?=
 =?us-ascii?Q?IpRiRS7f3ZWq0pCZnIUG7j6HXXjjt8KPdK3JCXD5d9Zzm2EnsZBbwGBSmF5L?=
 =?us-ascii?Q?zrSO9CONCF1PJ+jZ8QgQ7yfATw4nwzXXriaD0QJBOQFutDVsWi3Z/W+DWiFe?=
 =?us-ascii?Q?0dwASCWI5Sb2NrU2toA1xeu6Cp/obMgGQ4XGWpNepG3v732S0lukSy5/cqN/?=
 =?us-ascii?Q?VFmqSh2sTS6Jrcwmi/V4Oy+eRRkF9HCgh91y9bYuRs87d363dkq1h8sZxZER?=
 =?us-ascii?Q?i/q1ixsI+zIPa4rS1krrWUGU42m+QvrAeqggbNvLsZTCdxkb3LebvgC9WoEo?=
 =?us-ascii?Q?v79hJOymgGFOO9RwVQNcb1yZdpu1UKrS77ZP24EYXcmzkFQ//m2jEDW9Pp6O?=
 =?us-ascii?Q?65LZlHnYHaToU0TgeV44tbxjC7TgyvPxZE9X8DsXS9InJWbOJO7/IV61yvpx?=
 =?us-ascii?Q?sg2tmZf9YeCfLXVn+H0bfupRVW4Z+HsCbpvtmikm43AikC9oAomlVu6HFJWh?=
 =?us-ascii?Q?L4IFGHZ2R2J2hdoMWZLikNwexoO/S2qit2mozT6TPybSy+LkcemRUzra5PL+?=
 =?us-ascii?Q?aUtT8jKGv49L2t4JP0Jc/BM9OwGvEq2DbPzv0kmHp6RA+8dmVKgqUcSAUygG?=
 =?us-ascii?Q?jcHZ9cVxXPcuRs7UYlr2q6UyOKUFJMD3vF9cFqisQ6pcExqtqRVJpbOpDRwi?=
 =?us-ascii?Q?+9Zxk0u+KZ9vvtyCFXtmRsgzwgNOKpLjKXn7SpN3F59RBM9N4XDxxfORTTqB?=
 =?us-ascii?Q?Lk3EQxl5zutEbjlZd9YPR3yW5w8r7qTmuIhyQMLKa2EjmPIkHnTM2In75YmE?=
 =?us-ascii?Q?X58UJOda2FnPMf+sp58F5l50zXAMfGPv4YxaG7Ba5ImoO96/ssjrnl/oBZvg?=
 =?us-ascii?Q?QnOEZyI6qdsCG5Urmk9cBrBFkP6KcKrm4i5/CKuz9ESnaka45pmI15mvNHvm?=
 =?us-ascii?Q?i2ORVMK+XRTQAFGGRTT/q3a4nCLObUkbQcqptkA4Cfs8P3NP7iDXF2i1KvpR?=
 =?us-ascii?Q?i5TuuswEZTDLTy4eO3zK08SCQ9ehwkQ=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0dcfa2-ca1e-444a-acfd-08dee88dbc3d
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 07:40:58.6229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSmC2MJCTJh1wlgF8Pp7+V3xbZjjLaoZKguyQXa6PofUxdQ+YMLxWDNtHfIPy4FA3KeCyiOhLNmXzoYmk9qOtt47GPCTiaaUvGEOeVjYacs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8454
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 07:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241781

From: Rasmus Villemoes <ravi@prevas.dk>

With only the ncurses-terminfo-base package installed (i.e. not the
full ncurses-terminfo), systemd prints

  Terminfo xterm-256color not found for /dev/console

That is despite 'xterm-256color' being one of those basic terminfo
files that are manually split off and into the terminfo-base package,
and placed under /etc/terminfo/. The reason is that systemd only looks
in /usr/share/terminfo (see their have_terminfo_file() in
src/basic/terminal-util.c).

Make sure that applications that only look in /usr/share/terminfo do
find the basic terminfo files by packaging the symlinks along with the
pointed-to files.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
 meta/recipes-core/ncurses/ncurses.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncur=
ses/ncurses.inc
index ec265e63f2..8fff9a226f 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -161,6 +161,9 @@ _install_cfgs =3D "\
   PKG_CONFIG_LIBDIR=3D'${libdir}/pkgconfig' \
 "
=20
+TERMINFO_BASE =3D "alacritty ansi console dumb linux rxvt screen screen-25=
6color sun \
+  tmux tmux-256color vt52 vt100 vt102 vt200 vt220 xterm-color xterm-xfree8=
6 xterm-256color"
+
 do_install() {
         # Order of installation is important; widec installs a 'curses.h'
         # header with more definitions and must be installed last hence.
@@ -182,7 +185,7 @@ do_install() {
=20
         # include some basic terminfo files
         # stolen ;) from gentoo and modified a bit
-        for x in alacritty ansi console dumb linux rxvt screen screen-256c=
olor sun tmux tmux-256color vt52 vt100 vt102 vt200 vt220 xterm-color xterm-=
xfree86 xterm-256color
+        for x in ${TERMINFO_BASE}
         do
                 local termfile=3D"$(find "${D}${datadir}/terminfo/" -name =
"${x}" 2>/dev/null)"
                 local basedir=3D"$(basename $(dirname "${termfile}"))"
@@ -309,6 +312,7 @@ FILES:${PN}-terminfo =3D "\
=20
 FILES:${PN}-terminfo-base =3D "\
   ${sysconfdir}/terminfo \
+  ${@' '.join(map(lambda x: '${datadir}/terminfo/'+x[0]+'/'+x, '${TERMINFO=
_BASE}'.split()))} \
 "
=20
 RSUGGESTS:${PN}-libtinfo =3D "${PN}-terminfo"
--=20
2.55.0


