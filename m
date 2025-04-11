Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CDDC369AB
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 17:28:52 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.1])
 by mx.groups.io with SMTP id smtpd.web10.32589.1744392526803705511
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 10:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=dYlSmgwG;
 spf=pass (domain: oss.nxp.com, ip: 52.101.67.1, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqtczUPij1/jaVzaSzhATM1fHvBrY5OhIp03KMHDBJQN53DsmD1wl07gpl7uhiQObr0m3um0bUXw2Q6MbAKu/0uTcnidAx9pC1Z5IJZFYqeXrxnWR+QRpv5TeIW5fM8MHIowHxtMpOIiiZErgvkBIQbGooQnePduSerCes7l47pWXtvw5cZC0uAJj7Et3h0uSm3iXBx7vSywl36EcIOuPw/nckXYGgYekDj8cShMbStYAPmPJdNeH6EIDWNw6mOa40ORUMdzglfXlVkhgLBxBAAmcpJlAIbVwg/k0Q0qFeVqc3ht0T6AiKlBJXB0qZ2Fq2ktnLn2wIIQsZmKC5P2ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqMypGdgO6GkuLJBuV2OepNWXU+kkyThDgdJTrD1JTY=;
 b=BCGruij9Dd/4nhRVmDmlpqrn5NZ0eWsR3CrLlWZzAl+6ov9J5piXFZK/8KvELHUvIGGmf3EYC3Ur7lLFImRMjG0lAhu+fnj7KH9xAJxM7gUMD/edk4jhUrXEnhxKyo+wmXvNuzZ8zNd6jO9Ji1DLdkY4EsSXpi4IwVmHrd42/1PWXNztQO1kYvG2a3zld8rS/HpXh5tj5UPxVIyvOV1od2LUENva4u+sH3B8kzzm0X7MYzahGgDqLiSjKO1DmW/ZyNWuRFzuZu3aaNMzdhUMPFffCYVZ4AUnhSeIkDiOv7M78s8Haz3JHHeabADM0VGCZPwC+CsaMgTaFpxmXEbV+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqMypGdgO6GkuLJBuV2OepNWXU+kkyThDgdJTrD1JTY=;
 b=dYlSmgwGsUQAm8/ZsYCqBbMixz/Tu6ZhR30FtpxtbLfKHMB3Y39ROp6QpBCehRtic25ugC5XQW5o5N29j6gn7flOUJY6P4kc59GmD+ewgjZ9ROs6BHsOYcaIgX/Te9AggTdAgTUoQY6aUmYhZrz5bRcFQbGTyjVkji346RfZ0BYA0e5z834f2A6WSmzsqWz3WE4rPYlvyGwqR6/u6sbdPfRGvH1Q0H0EPnde8x5zE3DMT+1G7ApHCb4MaBQraZ/D38b7h4iw1l6HlmwpooARy6y69n7TYyVXzsyEIb8p7bdjMGjOFk3kME5utcj7BUz481uuczVWPmbVzy8GDEPh9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM9PR04MB8100.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Fri, 11 Apr
 2025 17:28:48 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 17:28:48 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Ross Burton <ross.burton@arm.com>,
	Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v6 5/6] oeqa/sdk/meson: improve test to validate host/build target assignments
Date: Fri, 11 Apr 2025 12:28:02 -0500
Message-ID: <20250411172803.3706607-5-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411172803.3706607-1-tom.hochstein@oss.nxp.com>
References: <20250411172803.3706607-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PH3PEPF000040AF.namprd05.prod.outlook.com
 (2603:10b6:518:1::5a) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM9PR04MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: 64e05e0b-316f-4c7a-c671-08dd791e516a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SAq9/DAqxk7Yy26eHVmO3s9ZuLGQ7jcR31S4VFw2FraTFXabuvJt8/+1PMAL?=
 =?us-ascii?Q?YDm5ZuB4s+NHDrAwlgMeKnCslzVRZgA3vhDMh9nUTgM73LJgsieTAfJ06Y+A?=
 =?us-ascii?Q?mr0BiiygKuJ0kWW44Is7piFZ+vShLMt+UmusAYhd+1bEAGeppAccI8DITPjz?=
 =?us-ascii?Q?eg3PuFcu3WcTf5AqhwjpI+LhWJicMDdOHs0fWosvwwXGj9alR1W7PvLa3I++?=
 =?us-ascii?Q?ig5F7CXSt2RaiG0wtSgTn5FQc+kLg+tSZkIbD/JvZkVQvBLiNFEG4o0e28pn?=
 =?us-ascii?Q?R9IczLbWDK9veWEHkYrSWyM1DxBS1lqDvpCFFBa1UWqaLaEMPy1l24RZDsYF?=
 =?us-ascii?Q?v1sQTWVixUi6gdfPJk+jJih2Jj/+z88TWcQk7STRFkzPBTRiLmbDZ1OgqYn6?=
 =?us-ascii?Q?vijenPaPXWqj7JbsECk0679ZjVj+9moOtqjjswgN2gpt3p1GcdfBULK6yFLM?=
 =?us-ascii?Q?fIZt29cA7AWXPkUOalPEJjSa/aJjrl9DQPU5DXkid63w1KsmCZSIbyZ8i6yp?=
 =?us-ascii?Q?KATlFnErotzERuX8Lr4/6LLRjFWjP1kRg2ReBY9IPlpHeoXdvXlcoXckIDYI?=
 =?us-ascii?Q?8cQmZKpiJddBE4YCblWXImu5tiuqCfvc8PC2CWIl7fAAHMBuwsxuwZiqvDNA?=
 =?us-ascii?Q?QtMvE0VYNAjWS1i97akeqbQBbXw4te+kF4U+VxNmIlRedybQeUwoQgKg0shj?=
 =?us-ascii?Q?f9wGoGpEncw4mGjas9cpELOsHr9WSQS9n6bcP96nB2cY1ovrY5fMXlM9q2ok?=
 =?us-ascii?Q?Guju1xvSSUIY1sqmiBO3ycM8HfdOXmHxXaQ00rlMmVcBX5RlDZYSnpmw4WUF?=
 =?us-ascii?Q?RKyNLLdPcF+a5Wm+e3Pcv2xOaO/AeD6Eo2iByZPkUGuWfkwzaIgNGDj0j72G?=
 =?us-ascii?Q?/UVg/3f2OJjn+TFzTZO5tR31wQOCzdiNx3O+mt7CoDEh+E/EUc59xtbjMcvl?=
 =?us-ascii?Q?U6EUvYVxHYd8CksKeE2XKlwsXnDtg+0T1Qv70+/o4kRvShM3xsRCn3z8yShM?=
 =?us-ascii?Q?oTR4MODOhJSXgfirskq/TXekoppoLL9oKyu4t3MEQBqp4c1Y/XBZYDNY5L8v?=
 =?us-ascii?Q?9tcfLV2J9u0y+ExPmB6sHM7w06P36p35yr+npE+dYzyF3pYmq3vzJHGWQnls?=
 =?us-ascii?Q?+iWH7T5CoPGZ0dmK/4KzV+pFpxZmx6LVx0imnto1J/kyECSlr3SbPWFg9OmV?=
 =?us-ascii?Q?nlMpz04wFqI25OU1DwHFe3QxqO+giFhRfYi4kT1WPjNl200VN5xGYUYv+4Zi?=
 =?us-ascii?Q?CgKWw7MRrOs6WsmecibAeLe2b4FxSFsTl+w7jprrPHOfgU6uycGwvZNaWicH?=
 =?us-ascii?Q?tWIVtfg5LBnsZYhBApX9dTVGt43zKF8rLoxKsj5cO3JZVpTetZoQGRVFtGG7?=
 =?us-ascii?Q?X84+BgdwBahHvPvfnrWPhr8Y4PintHCFV8JjKQyF1Ce5wzWRGIDpFkEamWrp?=
 =?us-ascii?Q?Jbsq6AGqU5ex50hSxNepRnJyec0didD57Vd1VoIS3ijNkZGZ9GeW+qZYYIGQ?=
 =?us-ascii?Q?6YsVwdVqNyxbKEU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xKc5gt+pvpuYyk9d+mOZZUZZl/Jjb+9xxnFu/hUb63mL/eQ2Tm/vIDCD3dJd?=
 =?us-ascii?Q?+fI0cJTrvXbTv8Ne8xPHRTLUprPNwqOp6xVC0I441id81Ul/VfEnKI0i0MFF?=
 =?us-ascii?Q?WiIqAk7HQRM6q8Jpa+u18WjbFwIV9XHOTen/GxT0fcshV5fqr4VQnLyTPYkp?=
 =?us-ascii?Q?2atH6gaUSV3AjUTPpgVlw43v27+wkfulfvk7Wlu4lgFpvCqVz6qVuTjESFbA?=
 =?us-ascii?Q?U4p4LX1230J0s71CaEFyioDRQv0plt5fM+8PIkr19qFgERRC92DU8ra7cpcB?=
 =?us-ascii?Q?PNlNjdcGBLZY2+wswmUNB+VynO0rKj7bK3iuNP6Cf2wdADYRBU6EapbFIG3/?=
 =?us-ascii?Q?WLZoJaEbp9kMvVXJ4r1+dcAybCI5diQ2Ls10/PSAAiMg/NERMU3Tgp2Gr7MA?=
 =?us-ascii?Q?urcxvhEEppQ+pX7kF2xq8aqRVrlBSch/R50Ko98qTNsMGc5b2BMNnlcgyYwm?=
 =?us-ascii?Q?VJPnsgwAvxXnKW6ADPD5AlfGPHNceeyVIr4FJvAvYhw0lemjnrJJV9NSk1zX?=
 =?us-ascii?Q?ns+yCrB1POfEWyJsGlIYHWRYngxW1UDaTdGRSXfmveJzwle60gfRGeygsIes?=
 =?us-ascii?Q?cVh5bEiqGaWIzk8HI5eXZN8FRrZEGVetXiX8FfMWOhe5aqurF5u7gBz6MnHL?=
 =?us-ascii?Q?mhNlrz2DkyMVEY6dfPztVWdiCRDu0Y9+1DJFFpyH2NPrq30WgAL8lXZXYTOJ?=
 =?us-ascii?Q?j6knVyXefp/riZ99pYPhqleKVUvym9mejJtXmnEdqtUUZ+vlq4IjI5RQHOG/?=
 =?us-ascii?Q?Ed6UIHwPnFoAR4uDGIEDVHxM7jtGe+/DHduoHCDZVp8z761YYo4+xg1f/k8e?=
 =?us-ascii?Q?lIPslWpsXwa+xSYObSDYTYkj9lMoEJefYaMDXuteoN6tR4QlLOUlPG0F3kVF?=
 =?us-ascii?Q?BP0P8E75aO6nxrRUK0Gz80+R6Bb3enw3HXhEtjmCq6YiYldv7m2pKCWD4xuk?=
 =?us-ascii?Q?NI4KGl4JYChsjTeUBKlcFaeIu7CY1NTzKu9UumpAHAKrQch5pXQRvEWGaXm2?=
 =?us-ascii?Q?82FdqFOSXE8+6FKkxCw8rZA57Jky+KHQgMI8GH7fO9HZjFupysbuAkMDO3dC?=
 =?us-ascii?Q?rtMyqa3ORxVYgugJq7+cbZJWyKTzk6Wt+7wHZiyLY8c0o3tyWD0rjc+RPeIL?=
 =?us-ascii?Q?a7951meaC7Fqt5tI9XKumN3H+An7118tTIVVudKzxEYeFIKzfOTywJXZLxz0?=
 =?us-ascii?Q?tEE3vBMj92ohpb9ZQVD593QCYzDAJcjph6HS86M++S0plllrAtwhhYk03RcI?=
 =?us-ascii?Q?ISgdiJpINzS0/Y4dTRj7+JB+2gUAY7KZg0ebHt5T1dgeDCwSxBji7BnDfpU5?=
 =?us-ascii?Q?7KzUAom4bhd25QIXFMKcstKBaGtPh392dtZlRTDtmIOWIyEpYH6mdBfEiS2g?=
 =?us-ascii?Q?QtGe1krzvmN++3bhxTPi9FOsN0VkmY8vi91N3ees+D3Wcm9XOY6LvpKqBLgx?=
 =?us-ascii?Q?5CBEAV4Iv4Z6egYIPQjYw/bRSO2J42KX1SLeatKZHRaVj5hSwwer2q5jl8re?=
 =?us-ascii?Q?Q98IrAJ5AD+Vbli2vCCrYQD3DZjXQ2IN0nqr7cgmGCCMPKkVktagMczou7AI?=
 =?us-ascii?Q?raCgbZxsf60ORewg1XSzGomHYwSZajkSegedtq+VA6HeHsQFGVUMUYAUJFqD?=
 =?us-ascii?Q?6A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e05e0b-316f-4c7a-c671-08dd791e516a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:28:47.9889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGHsujo4hGCGh+8VowLquFJnaWbZMxvaHw5aDoxLE+ALdkcDuitUiyHIBfTcfq3d+w+Ass3byb7tgu3IZH9O9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 17:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214751

From: Ross Burton <ross.burton@arm.com>

Use 'meson introspect' to dump JSON describing the build configuration
and validate that the build and host architectures are correctly set in
the meson.cross file.

Also instead of calling ninja directly, call the relevant meson commands.

Fixes: [YOCTO #15485]
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/lib/oeqa/sdk/cases/meson.py | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/meson.py b/meta/lib/oeqa/sdk/cases/mes=
on.py
index 1edf78720a..407b94d242 100644
--- a/meta/lib/oeqa/sdk/cases/meson.py
+++ b/meta/lib/oeqa/sdk/cases/meson.py
@@ -4,6 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
+import json
 import os
 import subprocess
 import tempfile
@@ -39,10 +40,17 @@ class MesonTest(OESDKTestCase):
             self.assertTrue(os.path.isdir(dirs["source"]))
             os.makedirs(dirs["build"])
=20
-            log =3D self._run("meson --warnlevel 1 -Degl=3Dno -Dglx=3Dno -=
Dx11=3Dfalse {build} {source}".format(**dirs))
-            # Check that Meson thinks we're doing a cross build and not a =
native
-            self.assertIn("Build type: cross build", log)
-            self._run("ninja -C {build} -v".format(**dirs))
-            self._run("DESTDIR=3D{install} ninja -C {build} -v install".fo=
rmat(**dirs))
+            log =3D self._run("meson setup --warnlevel 1 -Degl=3Dno -Dglx=
=3Dno -Dx11=3Dfalse {build} {source}".format(**dirs))
+
+            # Check that the host (gcc) and build (cross-gcc) compilers ar=
e different
+            data =3D json.loads(self._run("meson introspect --compilers {b=
uild}".format(**dirs)))
+            self.assertNotEqual(data["build"]["c"]["exelist"], data["host"=
]["c"]["exelist"])
+            # Check that the system architectures were set correctly
+            data =3D json.loads(self._run("meson introspect --machines {bu=
ild}".format(**dirs)))
+            self.assertEqual(data["build"]["cpu"], self.td["SDK_ARCH"])
+            self.assertEqual(data["host"]["cpu"], self.td["HOST_ARCH"])
+
+            self._run("meson compile -C {build} -v".format(**dirs))
+            self._run("meson install -C {build} --destdir {install}".forma=
t(**dirs))
=20
             self.check_elf(os.path.join(dirs["install"], "usr", "local", "=
lib", "libepoxy.so"))
--=20
2.34.1


