Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23554EB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 20:39:40 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.47])
 by mx.groups.io with SMTP id smtpd.web10.22303.1687466375358511505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 13:39:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=dKThOy6g;
 spf=pass (domain: nxp.com, ip: 40.107.7.47, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAD2QWvb02vFblpTVwBwUcRvtdQj2t9slIDWHBBtHAmec/DWZ/01OZ2kzcs9ToQk9rQPVlLIHfvGnn00k5aoEVCUVx/wWzW9aM35kfUs8US0WE6bVLmTg1Pb5owApdKkjRvdbiuUHpFJ2xZbUB05Ileqgr3x5GTEc6Cby13VU6rWeIHeOgkJNk7sWqLhbCHRt5j3OnDOKexNanwDynd8/OOGPlszt1VjnEa4UOtOmRDt8g1m5qABffyIPM1JzEaWc3aipdPgayXBFh618qPM0xX9jyvgbpJMEHw8JfTKPUq+j2dVQzCP+yJHxjGC6PAJJNBSMCP0flDg44OLTGxfCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4I2yClyOiyBqjIN55Jm2xRnNywNM7ybDt4pPm0cIRk=;
 b=N2g3Mqq4W1QkFB32S4HWGptS2PDjUyb3IvJisdz3HunwReIrVMQZMN3CfePFEJtQ1YuUvUxbnXmlUUUhosv6K7VeXrkGpSdGoTb+yAKognREfPECYESELAi3tvI5EHiAiPd6NJRvVuJyLTlKNdndAtGezbZn9/dGbxKYyiw8AaSpUkNvcRM6fLzBIqZG/ZWwkNcY7nhTfjz4BNAEnO40W+LLw6MnqscGcH59pQdqzgEWJeCo/p1sV+Z7DrDSSzBpM1+fhYA1YRmR/arG23MKbqP5epQqZi1Yu/lIjHqkavrTqYBLAPWqdWbe1YZriB9B9NTUwmrRK4BSKXcUqbSeBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4I2yClyOiyBqjIN55Jm2xRnNywNM7ybDt4pPm0cIRk=;
 b=dKThOy6gfRUdqjKCv7ZAxx+pCAblZeLNYvgWSJz/9+0gU3CFB1e1nhvBKWktfiK1A08ZLWe61y/4K944FecjIIrY/EisZ7BQP3GbjeEcx2pPV8t2/dBNdDoyrQF1JZprTTRsViIOEAQFs3SKGHHyKm/x06m2BhLN5+dOPb4ozro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com (2603:10a6:8:f::15)
 by AS8PR04MB8900.eurprd04.prod.outlook.com (2603:10a6:20b:42f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 22 Jun
 2023 20:39:31 +0000
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::9019:765e:e9c7:29e3]) by DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::9019:765e:e9c7:29e3%7]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 20:39:31 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [PATCH] weston: Cleanup and fix x11 and xwayland dependencies
Date: Thu, 22 Jun 2023 15:39:13 -0500
Message-ID: <20230622203913.183451-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0069.namprd02.prod.outlook.com
 (2603:10b6:a03:54::46) To DB3PR0402MB3852.eurprd04.prod.outlook.com
 (2603:10a6:8:f::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3852:EE_|AS8PR04MB8900:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d103d59-ff41-41e0-5036-08db7360c7b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wYiRzuXzV/F5nxoTMLnlty44+pL8QYPXZ1/C8++s/EIrG3/K/8sollGBz/NOSIr78ryJnDtS4grszHa9WhR2GsHLXdQt/ytTqRElbwIbdO0ghL2rsD+eUD19ZsYjWnx9D3HvhgdRait/4m/rwN816zgeRLL0iJzb3AGBTsSdWaI2j1l1hPhz5WO5V1sxnkzZixlyIz7lawv5hK4M1jxM6rmgeOzlFdwE7sY0NXBpj5KcEVCy8Uxh18+9x0f7TNATdt0796Fq8gOHOCb4wPVE3EK5siLn22JyQKD0S0+h3koODe8CPIVxWSUODmlI25n2eyBWbhCjeqWbvGLZhddYs969ghunQjuJquLIzuNTc52G6WxxjjSLepuSmZ48hVWQCwJ++4kXznd5xGprCpQf6m7OdxwKEvLCDFxdHIE5UIGN93tqkW9PSGj3naYbqWfEzeCpy4wqaCW0YWwmyDxGQfzlgWtcsgutANgFeY/UDt0ODyds0oez9/nuCIh3+7x9e+bJbHjtAiLkMzTsiqodX+hMs/qJi8T+Z/e21kaCIj4T7whAJuDh7VkvLE19e/WvLktGkQmTK7rbhWmXBjoPUoRkYTtdWXngEYampWOdU6DcrDJU6YGcDHdfdjodvNrT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3852.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199021)(52116002)(6666004)(478600001)(4326008)(6506007)(1076003)(186003)(26005)(6512007)(6486002)(66946007)(2906002)(41300700001)(8676002)(8936002)(6916009)(66476007)(66556008)(316002)(5660300002)(44832011)(38350700002)(38100700002)(86362001)(36756003)(66574015)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9tRaKi7mYrIzL0r4uU/wE7pcnl5BeunnfKD5SOJ5KYxm9ARcf0QnPawhivR/?=
 =?us-ascii?Q?Sm3AcRy6ovw7Qlb/joPBw28kfCluc0zYcIvXR4jsHym6jQqNUitOtIMEAhmV?=
 =?us-ascii?Q?beRuLQGW6wb0tNo7uK40NvL5vW4lDbO1tbftXx57n6CRPUmmFpNX9sFTyPIr?=
 =?us-ascii?Q?F80AFpUWT1vgfpEa8Lvnf9Zf3c6ED/aft2K3h/W0WHU/h9qo08IexfCTR6Up?=
 =?us-ascii?Q?fhSLFHYy6OxxnJ9OQHYB222wy4L+qFlpVYMuHRygcCKHZMm4IkbEvT0MH1d9?=
 =?us-ascii?Q?Spf2zmKfqFFN6MuCPsRxS/tEO+UfcrRpbhpti4C1tY0wAdFe+44t722E97h/?=
 =?us-ascii?Q?uGCSr9YbyE9WSHeDnKX42Onyog+uUhCc3V0y1okT0ZjZK0jinXhuM+1dykrj?=
 =?us-ascii?Q?OcSoGnSMFjsQT+hIiEvU578x0BQ7WG5uirWyvZbQPZ6plTu5sNpzSIysrjfu?=
 =?us-ascii?Q?bP81QrgHlkvJ1M4sdwDNe8QiTjcUuT/D0Z6Fv3EJl8mB5FR7Y+2s0yAuhBrK?=
 =?us-ascii?Q?sskLSTGu+JFBGOcn9owRJCt3ypkcglwwUvhfdZGCINeSjNae0h1yaNAmm5G1?=
 =?us-ascii?Q?AXnXN7FNvRlkYastP3fBiY6WJ/0DSI2qpJn17EGv/c2uo2UJ8J1JD27kRs25?=
 =?us-ascii?Q?DJiLJkGlRJ7oY2l1eQudbOYcwjRy2n1aCH4HQue/zXCyPtkwReT4+/gHp1as?=
 =?us-ascii?Q?hweuIsgEaKk+PJIa1MSKHuVfSkDbr1ybfEktJIERiZs006crinOmqp9Hmspj?=
 =?us-ascii?Q?fhlby7Kbj/t4Pi6+IeUZ5FCn4oD0tj8A+nZzV7cc4mNsyrgPQ2aVdb7YqFug?=
 =?us-ascii?Q?72Mzniq+sZTsF8Qz4v7TZzSNYZkPFMwEfC3tbfOWeKa/hKbbdosR9tALILWG?=
 =?us-ascii?Q?uSyrpS36EOiE11edWSfmuY43fuZDxQhtTEoKVFvBbXBgtTPeZiRNESNEX3cW?=
 =?us-ascii?Q?fed9Fx9pPIHD0GxGrkwXafcJJMnx/v6FLnsQMpCNy7xg05SSshhxZfLiYD7u?=
 =?us-ascii?Q?EZSk4wiCfV7FKkiAzYfDvjN2SbhLAB1aaZ27ez+2Pf2jmTykQ3djeQjafmSx?=
 =?us-ascii?Q?0DuO8g+CJOuq1GVa0Py2ANstxrL1wloOsnuxnjQMWCrEkxtfE6CmybE/qQWZ?=
 =?us-ascii?Q?buQdySosqXF4zI8qJ8uWy+xSCk24JC/jYYsTH45qtwCkbaAu6G0+d5p4QYsX?=
 =?us-ascii?Q?t1ndjosytupNuoQH3cutm8FdUc/bmt/9A0InoHzkHr+vhjzb4RQ5Hskn7gSt?=
 =?us-ascii?Q?1czO2sKESdCCxgydM0iSncvhr9GBXGAdgObWA+hFn9iz2ZBqGMGmSN9DUPcr?=
 =?us-ascii?Q?FlbTDaGUo61pq8kHmIjSurEUuUhOdSyQwPwZLcwJJTIZ4EXT5QptgoNxwAP3?=
 =?us-ascii?Q?I+Tbjg8jYRuNAsDNFl+ndO7X7fROFurM9iIekUhCSnEo0rlIKRRfAl6wrXY+?=
 =?us-ascii?Q?kG//m/n+uyVqp1gadtBHps7V+WNouu0sIKDM/CWvZWLAyP1gXmBSp0HobGS7?=
 =?us-ascii?Q?n25JgZODAj1ztvYhuaHPc3ZDxOSMUPdBnAjsDaahRBVyps8Se0tPM40HN+KJ?=
 =?us-ascii?Q?uHc4yqJtX33cdG2+72hYAgcH/IQ+xyLZ35i4i1dC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d103d59-ff41-41e0-5036-08db7360c7b1
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3852.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 20:39:30.9891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTjvdDc+qeNANtAw0LgpDQK72cGLjOQcTx1oi76bkdvxrc9uQXruIL7ieELQ4eIjU02KfTouC2JNGD/Av8XuNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8900
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 20:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183289

For the x11 backend package config, drop the redundant dependencies
libxcb and cairo. The former is listed twice in the package config,
while the latter is also listed globally.

For the xwayland package config, add the missing dependencies libxcb
and libxcursor. These dependencies are hidden when the x11 backend is
enabled by default. When the default setting is overridden to disable
the x11 backend, the following error occurs:
```
| Run-time dependency xcursor found: NO (tried pkgconfig and cmake)
|
| ../git/xwayland/meson.build:34:2: ERROR: Problem encountered: xwayland re=
quires xcursor which was not found. Or, you can use '-Dxwayland=3Dfalse'.
```

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-graphics/wayland/weston_11.0.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_11.0.1.bb b/meta/recipes-=
graphics/wayland/weston_11.0.1.bb
index 4f6ce19915..0838791a6b 100644
--- a/meta/recipes-graphics/wayland/weston_11.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_11.0.1.bb
@@ -57,7 +57,7 @@ PACKAGECONFIG[kms] =3D "-Dbackend-drm=3Dtrue,-Dbackend-dr=
m=3Dfalse,drm udev virtual/eg
 # Weston on Wayland (nested Weston)
 PACKAGECONFIG[wayland] =3D "-Dbackend-wayland=3Dtrue,-Dbackend-wayland=3Df=
alse,virtual/egl virtual/libgles2"
 # Weston on X11
-PACKAGECONFIG[x11] =3D "-Dbackend-x11=3Dtrue,-Dbackend-x11=3Dfalse,virtual=
/libx11 libxcb libxcb libxcursor cairo"
+PACKAGECONFIG[x11] =3D "-Dbackend-x11=3Dtrue,-Dbackend-x11=3Dfalse,virtual=
/libx11 libxcb libxcursor"
 # Headless Weston
 PACKAGECONFIG[headless] =3D "-Dbackend-headless=3Dtrue,-Dbackend-headless=
=3Dfalse"
 # Weston on RDP
@@ -73,7 +73,7 @@ PACKAGECONFIG[webp] =3D "-Dimage-webp=3Dtrue,-Dimage-webp=
=3Dfalse,libwebp"
 # Weston with systemd-login support
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue -Dlauncher-logind=3Dtrue,-Dsy=
stemd=3Dfalse -Dlauncher-logind=3Dfalse,systemd dbus"
 # Weston with Xwayland support (requires X11 and Wayland)
-PACKAGECONFIG[xwayland] =3D "-Dxwayland=3Dtrue,-Dxwayland=3Dfalse,xwayland=
"
+PACKAGECONFIG[xwayland] =3D "-Dxwayland=3Dtrue,-Dxwayland=3Dfalse,libxcb l=
ibxcursor xwayland"
 # colord CMS support
 PACKAGECONFIG[colord] =3D "-Ddeprecated-color-management-colord=3Dtrue,-Dd=
eprecated-color-management-colord=3Dfalse,colord"
 # Clients support
--=20
2.25.1


