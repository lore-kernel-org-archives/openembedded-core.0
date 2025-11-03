Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E311CCCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:22:18 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15844.1762158130762091447
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:22:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=EhR1Xj9L;
 spf=pass (domain: navimatix.de, ip: 40.107.162.93, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4SQg2wldkgN0ngPPCzkP2YNmAwQjbB1IxrCi70G9BlXMc0G+XQNa4dN29/augRWt5Wo5Bskqr510hf4MA6nWoHTW90SnSUZEWBpCjBnxgrEHwOuc6IDlb4UQCo8h1u/G8URYImEAPqDFKRdVHQ38daIl+tieIoTir+7ebHoXsYRYHEg7d7/jZTLFbXXrjv3zikUJ6Estv8peB1MVnKufTwOeD/HNcPEGdZPR6gZTLVOMYNN4iVHUgp6SCzFJf/pCThkvgAEA6LRts+Eip90RlC1pG2JmTKZUDmGhAYcIeAQJ0/txfDVwdf13vwgj+dOuIIow8EmGqBv9Ifvc26z3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nGzj5s3L9M9QwmzWXi4QJHWNJ19Scsg3DOMcP619b4=;
 b=ybIcRkx1ST3AoJ2L9ZphgwZ5y0ksZf8WNQhohKcokSLfAwDc1L5VZ1AEeRzpvMVztgmdhExDe+ZQvGvoqyvZyHOI364m/aKYo6XwyukmRG7LMUSULZ9E2naEAYAVBpCi7M5MS/HIJXcv0dodEVpTlfBv21zwOV4tX02zKR6ujZXsf6z2pzkvCUf9zmCqc9/6TmgrqHN7YVVhnx1dkE0kKF5R1IXg7NJ2FI0Lu30vMHRNSrlKs0T3X0ovsoUxraKLLfS/qPI6QLXLDubmwMjMZyPaPvEIAacZFDwP9HeGPLJ+qCnoXWwY4XO7LkDAm5ld3F/6Dwegd76TRj29HKitag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nGzj5s3L9M9QwmzWXi4QJHWNJ19Scsg3DOMcP619b4=;
 b=EhR1Xj9LyISijNSUIXsFH0yzJeKsGEzVRA6ZAu5r8pxI+Xqr0ZRtT4HR8DcNCbjhNqH0S0MUgmIj6uyZQvFuJbWnirG0c8mpIU9qMULhEZv85IWgfa6aPtvu0PhlLhQI4MXNGg8pdINKqoGnVVLUK3HpRjeze1l235fwrUNigUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PAXPR01MB10285.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:24e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 08:22:08 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 08:22:08 +0000
Date: Mon, 3 Nov 2025 09:22:07 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, ross.burton@arm.com, 
	richard.purdie@linuxfoundation.org, joerg.sommer@navimatix.de
CC: Ross Burton <ross.burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [kirkstone][PATCH 14/19] gtk+3: upgrade 3.24.42 -> 3.24.43
Message-ID: <88d63fc0efb0528d1a376da2857d4fabad908f7c.1762157680.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::17) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PAXPR01MB10285:EE_
X-MS-Office365-Filtering-Correlation-Id: 65c60b59-6bfa-40d0-7bfe-08de1ab2144a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Se4QS7Da4KWUqTVt9fhzFw9s+P4UD/welc3JlViCcJtxSa+061rwBy5vP5Q6?=
 =?us-ascii?Q?wXg2iFe7p8QNvHo4EpoowpF2MSePQOADsgFLtNBypoLMvy4lMekTnns70vAj?=
 =?us-ascii?Q?FNSppEsyLTvBZxVRTCEg+Xe/wFoKe2xwDifZ+BdHelelE1oxJhUrNY0lxawU?=
 =?us-ascii?Q?6JrbDDjN2Dzx5AIEUxzh7tOt/Dx2+1DdvA2NCqtbf15hsmwhdgQGwwnlX7k3?=
 =?us-ascii?Q?2IQDrmp4EYzLlmtp7egiz5mFeknwNM3Zd/0g3GghbrbkyJgPuZlsanTyIBVO?=
 =?us-ascii?Q?milX+dJ2gXkHyjXl6daF36j9fzp6OwPJ3zy/Y+h6nkfDpdo9ezfHecvszfXD?=
 =?us-ascii?Q?HSOmbwGJXCRec0AKwolCgMoz2meVtpgYVlec/U7MCCqxIdXIZwmqnsF5An9I?=
 =?us-ascii?Q?GLNK4GBYcSw9sWxXVfLJnM7/d9qpjiNviZlwk71oKZ3BpK3nSvjWfXLZmqhq?=
 =?us-ascii?Q?WIXLyQFVvSzC6jn4baVmEI9n+vwxgMtaUYPjP6gPqMXiYJEFomYXNAbRzfiS?=
 =?us-ascii?Q?SeF2Su2c/UKMjdmkxG0sxmgdgdVod508teNri5swEJllT1x2ckoNoZ+PhgOh?=
 =?us-ascii?Q?KcHzRFfiClzAec7qMvvboIVwgVsXuPcUQflQQwDgJ9/0YVWzyFcdsNPbqdZy?=
 =?us-ascii?Q?da6A5aKSkGqembQR9LKEQERM+uedssNrQtZgTXJ7qy69uOWe7JBAyG77hybW?=
 =?us-ascii?Q?Zg5t4j1mGR5icahaeu6nc/3sbXolaJhtroJithQVI0GPwkUmd1Mfirtfh6yz?=
 =?us-ascii?Q?TKAWMJmO6zq5kOF1OmuQBGOFHqoTe4t/0KkZ9TZdGfXwQ8Y5J4kNx/dYrQgb?=
 =?us-ascii?Q?zrOatj5220YmXkXs1McexSjgTIDulyoF9Q3uBciBSNDtqpKCekBMjsSEBhgD?=
 =?us-ascii?Q?yPB2wKljviJVpvSwFXHHj7a9TI6rV2Exy1n3vrNigO1Qufz0sgwFGq19vDf/?=
 =?us-ascii?Q?Jhyb6mh8beQWvvaFeneM3QvNmW4JTclHdkxy2ufzqE1XsRIwT6DvcmhOGjrI?=
 =?us-ascii?Q?kqmISHFJrV5msQvBzrpdjHTdkULBwpNRblkZNE+U8gDHhzAqWtZMiRQpK67n?=
 =?us-ascii?Q?drHwxnGNzMvGm9tejSzFTyyJmybqheJdFqwUT3im7qjpoMAaWs7kvswL2lPC?=
 =?us-ascii?Q?I3ClV1zU5RU9kSZ4AoeR54kpLXeZ/XlRR4OXj6U55T+Zo8bCvM5SXn0J+rOU?=
 =?us-ascii?Q?DV6mwuSVZC8ej7F7qqfCcaapuNHwQ7SlG99OtqtpFxxb+EbeUIgayg3H+uwh?=
 =?us-ascii?Q?7RMWbEizkUeYWwavZ0iAJYWnbD6f6LgzFyTpzcVTn9B8aea9GG1oymIvvTJp?=
 =?us-ascii?Q?QPhX6r269eWKwesIVfBhxqFQgf7dwroUT9zI6WGWZmjj0Sj3H9sHk0N0Xcw6?=
 =?us-ascii?Q?a+i6OU9HPU4e8ZDPz2TVBz9mkbXAJMgyu+cIgypi8qGZRHiawwaRYqdkn9VV?=
 =?us-ascii?Q?OaWDp04zo9TaNKhTESTiIus1lkhgHCKq?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NSYaH7PRyg3m6NSYnEVVRZmgs4WhnVhIcxFBzROqhWjfca0h6nyMC/Cy5uwo?=
 =?us-ascii?Q?s9jrxE2lY52EzmgwQIG1IOlsyF11KCQykMpAv3rHO578TbSNqrwaytRBkP2O?=
 =?us-ascii?Q?EbudN9zo5gnmsAg7FV8YoiE7acDDHvrxRM4hVPEVOn5iMRaY9JXPyP+MrYvs?=
 =?us-ascii?Q?HyoBs8NbZbB5b7pBgTF1X5gWPwyxb3p4Hf5IniryypUdKYO/2eWq4POnPNqN?=
 =?us-ascii?Q?KqY6Wzssf/HsFc35tjkNJs9dyeIDBl31BcPX2bqv4VJz4MQYgf1Mc15AuUaN?=
 =?us-ascii?Q?4aNXLZd/NwguDinr6Sj2D4sEdGcLSPmG4dJI3OTJ1tNqqf3KF4oiLUjWzm0P?=
 =?us-ascii?Q?bc01UvPZCCjfZj1LcSNutsFGCJnD+z+TkYF0mvnvA3ZIibFuNXdVGW0v4jlz?=
 =?us-ascii?Q?BToenDKk4cEBkvvvoP/lePDGeEBPzBlaQ0zAyHFYki2zzINBSgfvBivdFJrm?=
 =?us-ascii?Q?asj6lwu54uB7lBnKhgNt1Dq9Yo9pioCapX359ISv3k/lnPvSFZhpkra8Eqjc?=
 =?us-ascii?Q?SiuUf/nTsYkyu5iyW+lo9WFrakf9XqGZOFy/M+ZsdQlaQ2gi+8w5gSeNyjaQ?=
 =?us-ascii?Q?D3nUu6nFwBgxTYTtEVb5TrF2S2/p0OFEW1jjxQfu+XpIY5TuHa6PAzzB57wX?=
 =?us-ascii?Q?mO7lnd/dCx7BtAkMQMZjdHNJ+chE+N3vMqBhYNBkNQM/RDG0XfFGE+plaWZW?=
 =?us-ascii?Q?TQcUAL/IK+I5JszYzCcF+JTFLGT+k+B/+IXMCzo/sKGSnL5ohR8yqxS1k/NN?=
 =?us-ascii?Q?7p5X0j3zcuYFHOccmXXcCkW/LLcrRUcD/iMuhluWkjAuhUrVrF2tI/c2pZbL?=
 =?us-ascii?Q?XaGcZ3EatVjFyEa9RUqATO4cm928DxTkNc9vk4WGdkW/HbCtPd0c9VWdV06n?=
 =?us-ascii?Q?+zeptd4Nx1yF4eT3Vh+wk+k8FriDTWTgfKeBGOB8RwXWBCzfABaki09YPjzH?=
 =?us-ascii?Q?ij5OPwrSpFlP3kaG3dA6jBQs461KBmvZvhSscHxWGfOe5y+7TvNtjOtTNH21?=
 =?us-ascii?Q?1ko587DrPA6vNHO8mrK+Yhf8swRWqpzwFi5enIyA1w4MTmtci7VMfYoNuXQI?=
 =?us-ascii?Q?M25xa2rZsK6gxhP5Jz9xu8gl8CtNIlxro6TaWaAal2A+oGrwQco/IKFFzBEO?=
 =?us-ascii?Q?8MCOmmRVJdTLv/QiSfYAj1bvU6JV3+5HCEcWnkNPsmfdub793xBqmAGs7WnK?=
 =?us-ascii?Q?DENCotBM/aCLS2E+1XXdITa+PVdo+pz9xomr5b+qdu/h6FeIlvmPOlnwrRF3?=
 =?us-ascii?Q?hOfXHkHIghFCwC37GVRZ+1ijzcSSULNaLhrN7pOUVYF7LgjE1srTL2pg87Ll?=
 =?us-ascii?Q?mnntNeMv64RESxrHJMlVs96F+/Vf5Wrih9i6cRqKziU+ZEBOWkDM1fMfPfMR?=
 =?us-ascii?Q?p665Rx0EKTB/ZA0/lHngpG6a4mXz9rRXckPV8TUDbddxbbLlYQfE4oRwkjlI?=
 =?us-ascii?Q?gm0xEkjxP/T2NqbntZC91piy7t0J+n6+9CypDD2ZaFNIM206C9rKv4MNx3VZ?=
 =?us-ascii?Q?bgHM3NGOeaqs2m8mpb6b55EtV6ZYEr1COiwtkThRqMb0dRqjukiJV0rpep1z?=
 =?us-ascii?Q?2IALaZki4P1RQhK8hooM2X51SPbxyCWSEpDFJ13R9gxzR6FSXzSQTUhwaUFU?=
 =?us-ascii?Q?xw=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c60b59-6bfa-40d0-7bfe-08de1ab2144a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 08:22:08.1429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pkpEkMigHSOkIbRPEO1H7y5pyxdlAeFpZKGSi06QY4kLghnsYEqKzvTTXMuUrbPhMaf6Fj/0KTbdS5JEQM0qFavSF1Zm5Tl4/VK2hOX1sAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB10285
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225628

From: Ross Burton <ross.burton@arm.com>

* Stop looking for modules in cwd (CVE-2024-6655)

(From OE-Core rev: a0a1b4b8992cb3ef7acd72f0de69a0a4bafb9e20)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Cherry-pick-of: f8a5d23dd6eea6b33bfdb2067007b7d441daa2d0
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../gtk+/gtk+3/CVE-2024-6655.patch            | 39 --------
 meta/recipes-gnome/gtk+/gtk+3/opengl.patch    | 97 +++++++++----------
 .../{gtk+3_3.24.42.bb =3D> gtk+3_3.24.43.bb}    |  3 +-
 3 files changed, 48 insertions(+), 91 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/CVE-2024-6655.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.42.bb =3D> gtk+3_3.24.43.bb} (8=
2%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/CVE-2024-6655.patch b/meta/recip=
es-gnome/gtk+/gtk+3/CVE-2024-6655.patch
deleted file mode 100644
index 2460b97b6b..0000000000
--- a/meta/recipes-gnome/gtk+/gtk+3/CVE-2024-6655.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 3bbf0b6176d42836d23c36a6ac410e807ec0a7a7 Mon Sep 17 00:00:00 2001
-From: Matthias Clasen <mclasen@redhat.com>
-Date: Sat, 15 Jun 2024 14:18:01 -0400
-Subject: [PATCH] Stop looking for modules in cwd
-
-This is just not a good idea. It is surprising, and can be misused.
-
-Fixes: #6786
-
-CVE: CVE-2024-6655
-Upstream-Status: Backport [https://launchpad.net/ubuntu/+source/gtk+3.0/3.=
24.33-1ubuntu2.2]
-Signed-off-by: Ashish Sharma <asharma@mvista.com>
-
- gtk/gtkmodules.c | 9 ++-------
- 1 file changed, 2 insertions(+), 7 deletions(-)
-
-diff --git a/gtk/gtkmodules.c b/gtk/gtkmodules.c
-index 704e412aeb5..f93101c272e 100644
---- a/gtk/gtkmodules.c
-+++ b/gtk/gtkmodules.c
-@@ -214,13 +214,8 @@ find_module (const gchar *name)
-   gchar *module_name;
-=20
-   module_name =3D _gtk_find_module (name, "modules");
--  if (!module_name)
--    {
--      /* As last resort, try loading without an absolute path (using syst=
em
--       * library path)
--       */
--      module_name =3D g_module_build_path (NULL, name);
--    }
-+  if (module_name =3D=3D NULL)
-+    return NULL;
-=20
-   module =3D g_module_open (module_name, G_MODULE_BIND_LOCAL | G_MODULE_B=
IND_LAZY);
-=20
---=20
-GitLab
-
diff --git a/meta/recipes-gnome/gtk+/gtk+3/opengl.patch b/meta/recipes-gnom=
e/gtk+/gtk+3/opengl.patch
index 8f2feb0ee7..d846045c24 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/opengl.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/opengl.patch
@@ -1,4 +1,4 @@
-From 4a0716f04fb25b51b08e994bd5a900b2e7f7fed5 Mon Sep 17 00:00:00 2001
+From 24a0d767251b81810767e03aa1db8cc497408db3 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Fri, 16 Oct 2015 16:35:16 +0300
 Subject: [PATCH] Do not try to initialize GL without libGL
@@ -21,7 +21,7 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  docs/tools/widgets.c             |  6 +++++-
  gdk/gdkconfig.h.meson            |  1 +
  gdk/gdkdisplay.c                 |  4 ++++
- gdk/gdkgl.c                      | 10 ++++++++++
+ gdk/gdkgl.c                      | 11 ++++++++++-
  gdk/gdkglcontext.c               |  6 ++++++
  gdk/gdkwindow.c                  | 13 +++++++++++++
  gdk/meson.build                  |  8 +++++++-
@@ -37,10 +37,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com=
>
  meson_options.txt                |  2 ++
  tests/meson.build                |  9 +++++++--
  testsuite/gtk/objects-finalize.c |  2 ++
- 21 files changed, 128 insertions(+), 13 deletions(-)
+ 21 files changed, 128 insertions(+), 14 deletions(-)
=20
 diff --git a/demos/gtk-demo/meson.build b/demos/gtk-demo/meson.build
-index 252da16d05..4b57cff6ac 100644
+index 252da16..4b57cff 100644
 --- a/demos/gtk-demo/meson.build
 +++ b/demos/gtk-demo/meson.build
 @@ -28,7 +28,6 @@ demos =3D files([
@@ -63,7 +63,7 @@ index 252da16d05..4b57cff6ac 100644
    demos +=3D files('pagesetup.c')
  endif
 diff --git a/docs/tools/meson.build b/docs/tools/meson.build
-index 05621ee7ed..3d0a333b32 100644
+index 05621ee..3d0a333 100644
 --- a/docs/tools/meson.build
 +++ b/docs/tools/meson.build
 @@ -2,10 +2,13 @@ if x11_enabled
@@ -83,7 +83,7 @@ index 05621ee7ed..3d0a333b32 100644
                             include_directories: [ confinc, gdkinc, gtkinc=
, testinc, ],
                             dependencies: libgtk_dep)
 diff --git a/docs/tools/widgets.c b/docs/tools/widgets.c
-index 932daf1746..348807e133 100644
+index 932daf1..348807e 100644
 --- a/docs/tools/widgets.c
 +++ b/docs/tools/widgets.c
 @@ -8,7 +8,9 @@
@@ -110,7 +110,7 @@ index 932daf1746..348807e133 100644
 =20
    return info;
 diff --git a/gdk/gdkconfig.h.meson b/gdk/gdkconfig.h.meson
-index 7db19e0470..088651bafa 100644
+index 7db19e0..088651b 100644
 --- a/gdk/gdkconfig.h.meson
 +++ b/gdk/gdkconfig.h.meson
 @@ -15,6 +15,7 @@ G_BEGIN_DECLS
@@ -122,7 +122,7 @@ index 7db19e0470..088651bafa 100644
  G_END_DECLS
 =20
 diff --git a/gdk/gdkdisplay.c b/gdk/gdkdisplay.c
-index 748f54860c..04ef2c09d4 100644
+index fd5e9ea..87b45e7 100644
 --- a/gdk/gdkdisplay.c
 +++ b/gdk/gdkdisplay.c
 @@ -2420,7 +2420,11 @@ gboolean
@@ -138,7 +138,7 @@ index 748f54860c..04ef2c09d4 100644
 =20
  GdkRenderingMode
 diff --git a/gdk/gdkgl.c b/gdk/gdkgl.c
-index 9690077cc2..55f85ef605 100644
+index 0940c06..4b56614 100644
 --- a/gdk/gdkgl.c
 +++ b/gdk/gdkgl.c
 @@ -21,8 +21,9 @@
@@ -152,7 +152,7 @@ index 9690077cc2..55f85ef605 100644
  #include <math.h>
  #include <string.h>
 =20
-@@ -36,6 +37,7 @@
+@@ -36,6 +37,7 @@ gdk_cairo_surface_mark_as_direct (cairo_surface_t *surfa=
ce,
                                 g_object_ref (window),  g_object_unref);
  }
 =20
@@ -160,7 +160,7 @@ index 9690077cc2..55f85ef605 100644
  static const char *
  get_vertex_type_name (int type)
  {
-@@ -208,6 +210,7 @@
+@@ -208,6 +210,7 @@ use_texture_rect_program (GdkGLContextPaintData *paint=
_data)
        glUseProgram (paint_data->current_program->program);
      }
  }
@@ -168,7 +168,7 @@ index 9690077cc2..55f85ef605 100644
 =20
  void
  gdk_gl_texture_quads (GdkGLContext *paint_context,
-@@ -216,6 +219,7 @@
+@@ -216,6 +219,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
                        GdkTexturedQuad *quads,
                        gboolean flip_colors)
  {
@@ -176,7 +176,7 @@ index 9690077cc2..55f85ef605 100644
    GdkGLContextPaintData *paint_data  =3D gdk_gl_context_get_paint_data (p=
aint_context);
    GdkGLContextProgram *program;
    GdkWindow *window =3D gdk_gl_context_get_window (paint_context);
-@@ -289,6 +293,7 @@
+@@ -289,6 +293,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
 =20
    glDisableVertexAttribArray (program->position_location);
    glDisableVertexAttribArray (program->uv_location);
@@ -184,7 +184,7 @@ index 9690077cc2..55f85ef605 100644
  }
 =20
  /* x,y,width,height describes a rectangle in the gl render buffer
-@@ -337,6 +342,7 @@
+@@ -337,6 +342,7 @@ gdk_cairo_draw_from_gl (cairo_t              *cr,
                          int                   width,
                          int                   height)
  {
@@ -192,7 +192,7 @@ index 9690077cc2..55f85ef605 100644
    GdkGLContext *paint_context, *current_context;
    cairo_surface_t *image;
    cairo_matrix_t matrix;
-@@ -703,6 +709,7 @@
+@@ -727,6 +733,7 @@ out:
    if (clip_region)
      cairo_region_destroy (clip_region);
 =20
@@ -200,7 +200,7 @@ index 9690077cc2..55f85ef605 100644
  }
 =20
  /* This is always called with the paint context current */
-@@ -710,6 +717,7 @@
+@@ -734,6 +741,7 @@ void
  gdk_gl_texture_from_surface (cairo_surface_t *surface,
  			     cairo_region_t  *region)
  {
@@ -208,14 +208,14 @@ index 9690077cc2..55f85ef605 100644
    GdkGLContext *paint_context;
    cairo_surface_t *image;
    double device_x_offset, device_y_offset;
-@@ -810,4 +818,5 @@
+@@ -834,4 +842,5 @@ gdk_gl_texture_from_surface (cairo_surface_t *surface,
 =20
    glDisable (GL_SCISSOR_TEST);
    glDeleteTextures (1, &texture_id);
 +#endif
  }
 diff --git a/gdk/gdkglcontext.c b/gdk/gdkglcontext.c
-index 3b23639e1c..1f04f8e0b2 100644
+index cb0ed90..7ed74f3 100644
 --- a/gdk/gdkglcontext.c
 +++ b/gdk/gdkglcontext.c
 @@ -85,7 +85,9 @@
@@ -228,7 +228,7 @@ index 3b23639e1c..1f04f8e0b2 100644
 =20
  typedef struct {
    GdkDisplay *display;
-@@ -243,6 +245,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *contex=
t,
+@@ -246,6 +248,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *contex=
t,
                                 int              height,
                                 guint            texture_target)
  {
@@ -236,7 +236,7 @@ index 3b23639e1c..1f04f8e0b2 100644
    GdkGLContextPrivate *priv =3D gdk_gl_context_get_instance_private (cont=
ext);
 =20
    g_return_if_fail (GDK_IS_GL_CONTEXT (context));
-@@ -286,6 +289,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *contex=
t,
+@@ -289,6 +292,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *contex=
t,
              glTexSubImage2D (texture_target, 0, 0, i, width, 1, GL_BGRA, =
GL_UNSIGNED_INT_8_8_8_8_REV, (unsigned char*) data + (i * stride));
          }
      }
@@ -244,7 +244,7 @@ index 3b23639e1c..1f04f8e0b2 100644
  }
 =20
  static gboolean
-@@ -774,6 +778,7 @@ gdk_gl_context_realize (GdkGLContext  *context,
+@@ -801,6 +805,7 @@ gdk_gl_context_realize (GdkGLContext  *context,
  static void
  gdk_gl_context_check_extensions (GdkGLContext *context)
  {
@@ -252,7 +252,7 @@ index 3b23639e1c..1f04f8e0b2 100644
    GdkGLContextPrivate *priv =3D gdk_gl_context_get_instance_private (cont=
ext);
    gboolean has_npot, has_texture_rectangle;
 =20
-@@ -853,6 +858,7 @@ gdk_gl_context_check_extensions (GdkGLContext *context=
)
+@@ -888,6 +893,7 @@ gdk_gl_context_check_extensions (GdkGLContext *context=
)
                         priv->use_texture_rectangle ? "yes" : "no"));
 =20
    priv->extensions_checked =3D TRUE;
@@ -261,7 +261,7 @@ index 3b23639e1c..1f04f8e0b2 100644
 =20
  /**
 diff --git a/gdk/gdkwindow.c b/gdk/gdkwindow.c
-index 727b0cf1f4..d4d91b0d16 100644
+index 62e0cf8..b8bda71 100644
 --- a/gdk/gdkwindow.c
 +++ b/gdk/gdkwindow.c
 @@ -45,7 +45,9 @@
@@ -321,7 +321,7 @@ index 727b0cf1f4..d4d91b0d16 100644
            cairo_region_destroy (opaque_region);
 =20
 diff --git a/gdk/meson.build b/gdk/meson.build
-index 4bb1bf2b6c..64172b8d3e 100644
+index 297c38c..fc71f8f 100644
 --- a/gdk/meson.build
 +++ b/gdk/meson.build
 @@ -56,7 +56,6 @@ gdk_gir_public_headers =3D files(
@@ -354,7 +354,7 @@ index 4bb1bf2b6c..64172b8d3e 100644
  gdkconfig =3D configure_file(
    input  : 'gdkconfig.h.meson',
 diff --git a/gdk/x11/gdkdisplay-x11.c b/gdk/x11/gdkdisplay-x11.c
-index 7e08f472cc..30fd7b6089 100644
+index 7e08f47..30fd7b6 100644
 --- a/gdk/x11/gdkdisplay-x11.c
 +++ b/gdk/x11/gdkdisplay-x11.c
 @@ -37,7 +37,9 @@
@@ -379,7 +379,7 @@ index 7e08f472cc..30fd7b6089 100644
    display_class->get_default_seat =3D gdk_x11_display_get_default_seat;
 =20
 diff --git a/gdk/x11/gdkvisual-x11.c b/gdk/x11/gdkvisual-x11.c
-index 81479d81f4..3c8c5c02ff 100644
+index 81479d8..3c8c5c0 100644
 --- a/gdk/x11/gdkvisual-x11.c
 +++ b/gdk/x11/gdkvisual-x11.c
 @@ -306,7 +306,12 @@ _gdk_x11_screen_init_visuals (GdkScreen *screen)
@@ -396,7 +396,7 @@ index 81479d81f4..3c8c5c02ff 100644
 =20
  gint
 diff --git a/gdk/x11/gdkwindow-x11.c b/gdk/x11/gdkwindow-x11.c
-index 194bc82e29..0302bb68d4 100644
+index 89f0666..d3e1440 100644
 --- a/gdk/x11/gdkwindow-x11.c
 +++ b/gdk/x11/gdkwindow-x11.c
 @@ -36,7 +36,9 @@
@@ -409,7 +409,7 @@ index 194bc82e29..0302bb68d4 100644
  #include "gdkprivate-x11.h"
  #include "gdk-private.h"
 =20
-@@ -5888,7 +5890,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Clas=
s *klass)
+@@ -5906,7 +5908,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Clas=
s *klass)
    impl_class->set_opaque_region =3D gdk_x11_window_set_opaque_region;
    impl_class->set_shadow_width =3D gdk_x11_window_set_shadow_width;
    impl_class->show_window_menu =3D gdk_x11_window_show_window_menu;
@@ -420,7 +420,7 @@ index 194bc82e29..0302bb68d4 100644
    impl_class->get_unscaled_size =3D gdk_x11_window_get_unscaled_size;
  }
 diff --git a/gdk/x11/gdkx-autocleanups.h b/gdk/x11/gdkx-autocleanups.h
-index edb0ea7dbf..a317d61cca 100644
+index edb0ea7..a317d61 100644
 --- a/gdk/x11/gdkx-autocleanups.h
 +++ b/gdk/x11/gdkx-autocleanups.h
 @@ -30,7 +30,9 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11DeviceXI2, g_object_=
unref)
@@ -434,7 +434,7 @@ index edb0ea7dbf..a317d61cca 100644
  G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Screen, g_object_unref)
  G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Visual, g_object_unref)
 diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx.h
-index 1f64bccb6d..4db6c18351 100644
+index 1f64bcc..4db6c18 100644
 --- a/gdk/x11/gdkx.h
 +++ b/gdk/x11/gdkx.h
 @@ -43,7 +43,9 @@
@@ -448,7 +448,7 @@ index 1f64bccb6d..4db6c18351 100644
  #include <gdk/x11/gdkx11monitor.h>
  #include <gdk/x11/gdkx11property.h>
 diff --git a/gdk/x11/meson.build b/gdk/x11/meson.build
-index 754ae0a615..0318c83877 100644
+index 754ae0a..0318c83 100644
 --- a/gdk/x11/meson.build
 +++ b/gdk/x11/meson.build
 @@ -14,7 +14,6 @@ gdk_x11_sources =3D files(
@@ -480,7 +480,7 @@ index 754ae0a615..0318c83877 100644
  install_headers('gdkx.h', subdir: 'gtk-3.0/gdk/')
 =20
 diff --git a/gtk/gtkglarea.c b/gtk/gtkglarea.c
-index 802303ea9f..6439d7745d 100644
+index 802303e..6439d77 100644
 --- a/gtk/gtkglarea.c
 +++ b/gtk/gtkglarea.c
 @@ -29,7 +29,9 @@
@@ -568,10 +568,10 @@ index 802303ea9f..6439d7745d 100644
 =20
  static gboolean
 diff --git a/gtk/inspector/general.c b/gtk/inspector/general.c
-index 4fd0c3039c..a8e59ed077 100644
+index a3a3419..274600e 100644
 --- a/gtk/inspector/general.c
 +++ b/gtk/inspector/general.c
-@@ -33,8 +33,10 @@
+@@ -35,8 +35,10 @@
 =20
  #ifdef GDK_WINDOWING_X11
  #include "x11/gdkx.h"
@@ -582,7 +582,7 @@ index 4fd0c3039c..a8e59ed077 100644
 =20
  #ifdef GDK_WINDOWING_WIN32
  #include "win32/gdkwin32.h"
-@@ -217,6 +219,7 @@ add_label_row (GtkInspectorGeneral *gen,
+@@ -221,6 +223,7 @@ add_label_row (GtkInspectorGeneral *gen,
    gtk_size_group_add_widget (GTK_SIZE_GROUP (gen->priv->labels), label);
  }
 =20
@@ -590,7 +590,7 @@ index 4fd0c3039c..a8e59ed077 100644
  #ifdef GDK_WINDOWING_X11
  static void
  append_glx_extension_row (GtkInspectorGeneral *gen,
-@@ -226,6 +229,7 @@ append_glx_extension_row (GtkInspectorGeneral *gen,
+@@ -230,6 +233,7 @@ append_glx_extension_row (GtkInspectorGeneral *gen,
    add_check_row (gen, GTK_LIST_BOX (gen->priv->gl_box), ext, epoxy_has_gl=
x_extension (dpy, 0, ext), 0);
  }
  #endif
@@ -598,7 +598,7 @@ index 4fd0c3039c..a8e59ed077 100644
 =20
  #ifdef GDK_WINDOWING_WAYLAND
  static void
-@@ -275,6 +279,7 @@ wayland_get_display (struct wl_display *wl_display)
+@@ -279,6 +283,7 @@ wayland_get_display (struct wl_display *wl_display)
  static void
  init_gl (GtkInspectorGeneral *gen)
  {
@@ -606,7 +606,7 @@ index 4fd0c3039c..a8e59ed077 100644
  #ifdef GDK_WINDOWING_X11
    if (GDK_IS_X11_DISPLAY (gdk_display_get_default ()))
      {
-@@ -301,6 +306,7 @@ init_gl (GtkInspectorGeneral *gen)
+@@ -305,6 +310,7 @@ init_gl (GtkInspectorGeneral *gen)
      }
    else
  #endif
@@ -615,7 +615,7 @@ index 4fd0c3039c..a8e59ed077 100644
    if (GDK_IS_WAYLAND_DISPLAY (gdk_display_get_default ()))
      {
 diff --git a/meson.build b/meson.build
-index aed48fc3f6..bfc33af0f6 100644
+index 67b24e5..c1cc09a 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -137,6 +137,7 @@ wayland_enabled        =3D get_option('wayland_backend=
')
@@ -646,7 +646,7 @@ index aed48fc3f6..bfc33af0f6 100644
  if iso_codes_dep.found()
    cdata.set_quoted('ISO_CODES_PREFIX', iso_codes_dep.get_variable(pkgconf=
ig: 'prefix'))
  else
-@@ -912,9 +917,15 @@ else
+@@ -914,9 +919,15 @@ else
    gio_packages =3D ['gio-2.0', glib_req]
  endif
 =20
@@ -663,7 +663,7 @@ index aed48fc3f6..bfc33af0f6 100644
                       ['fribidi', fribidi_req]))
 =20
  gtk_packages =3D ' '.join([
-@@ -928,7 +939,7 @@ pkgconf.set('GTK_PACKAGES', gtk_packages)
+@@ -930,7 +941,7 @@ pkgconf.set('GTK_PACKAGES', gtk_packages)
  # Requires.private
  pc_gdk_extra_libs +=3D cairo_libs
 =20
@@ -673,7 +673,7 @@ index aed48fc3f6..bfc33af0f6 100644
    gtk_private_packages +=3D ['pangoft2']
  endif
 diff --git a/meson_options.txt b/meson_options.txt
-index 94099aa01e..8bd096896d 100644
+index 94099aa..8bd0968 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -19,6 +19,8 @@ option('profiler', type: 'boolean', value: false,
@@ -686,7 +686,7 @@ index 94099aa01e..8bd096896d 100644
  # Print backends
  option('print_backends', type : 'string', value : 'auto',
 diff --git a/tests/meson.build b/tests/meson.build
-index 586fe2f45e..6ecf317dde 100644
+index 6ff249f..f2a9fba 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
 @@ -5,7 +5,6 @@ gtk_tests =3D [
@@ -697,7 +697,7 @@ index 586fe2f45e..6ecf317dde 100644
    ['listmodel'],
    ['motion-compression'],
    ['styleexamples'],
-@@ -54,7 +53,6 @@ gtk_tests =3D [
+@@ -55,7 +54,6 @@ gtk_tests =3D [
    ['testfullscreen'],
    ['testgeometry'],
    ['testgiconpixbuf'],
@@ -705,7 +705,7 @@ index 586fe2f45e..6ecf317dde 100644
    ['testgmenu'],
    ['testgrid'],
    ['testgrouping'],
-@@ -137,6 +135,13 @@ if x11_enabled
+@@ -138,6 +136,13 @@ if x11_enabled
    ]
  endif
 =20
@@ -720,10 +720,10 @@ index 586fe2f45e..6ecf317dde 100644
    gtk_tests +=3D [['testfontchooserdialog']]
  endif
 diff --git a/testsuite/gtk/objects-finalize.c b/testsuite/gtk/objects-fina=
lize.c
-index 24540e313f..e0f863ab6a 100644
+index 95b565c..7f340c3 100644
 --- a/testsuite/gtk/objects-finalize.c
 +++ b/testsuite/gtk/objects-finalize.c
-@@ -116,7 +116,9 @@ main (int argc, char **argv)
+@@ -109,7 +109,9 @@ main (int argc, char **argv)
  	  all_types[i] !=3D GDK_TYPE_X11_DEVICE_MANAGER_CORE &&
  	  all_types[i] !=3D GDK_TYPE_X11_DEVICE_MANAGER_XI2 &&
  	  all_types[i] !=3D GDK_TYPE_X11_DISPLAY_MANAGER &&
@@ -733,6 +733,3 @@ index 24540e313f..e0f863ab6a 100644
  #endif
  	  /* Not allowed to finalize a GdkPixbufLoader without calling gdk_pixbu=
f_loader_close() */
  	  all_types[i] !=3D GDK_TYPE_PIXBUF_LOADER &&
---=20
-2.30.2
-
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb b/meta/recipes-gnome/=
gtk+/gtk+3_3.24.43.bb
similarity index 82%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb
index 5612e50e8b..a8cc1152c3 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.42.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb
@@ -4,9 +4,8 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-$=
{PV}.tar.xz \
            file://opengl.patch \
-           file://CVE-2024-6655.patch \
            "
-SRC_URI[sha256sum] =3D "50f89f615092d4dd01bbd759719f8bd380e5f149f6fd78a947=
25e2de112377e2"
+SRC_URI[sha256sum] =3D "7e04f0648515034b806b74ae5d774d87cffb1a2a96c468cb5b=
e476d51bf2f3c7"
=20
 S =3D "${WORKDIR}/gtk+-${PV}"
=20
--=20
2.51.0


