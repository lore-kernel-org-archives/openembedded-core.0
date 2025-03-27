Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D814C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 23:00:48 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.64])
 by mx.groups.io with SMTP id smtpd.web10.384.1743116439367686510
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 16:00:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=ZVSj+JT2;
 spf=pass (domain: oss.nxp.com, ip: 40.107.20.64, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJ1K5iI5AwmjnWxxRz8wdylf3VJ9fqE8p9LHLZaMbzvUlMffaruL/M9RFMy4+eenHBPIhi1Os2KuyxgwCsHkWz7h7N0W5cQhYG69NBqht0fb5n2IGf7IrBKO3pdVARrnEYbLWLPA4r+7/iAfNfcM7173w92j0SfP09cLUX82Op4Kwbv4z/1R2APnuMUMuFd6kt/nLVJkUoWRYOzbXtwvqsa2ucWCOkCFLCE0IjwQ2b8lSkDPAeUG9wdYdC0VOFX/858vFYXtaNeOYXHcvWnhaZd3ciNTHNtA/zg2zPAqaYLfwmP/A+zYKkQKebEx1sEABoxoswCf0jwLBdteb8dKlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FO87xwqxP7d00iPFCh0YkZyeqnOpOG3yddk373tQ6Q=;
 b=YG0oSpnr460RWsM7xbU3LjnIvTXxWuBxlAZjeWCxoaJZJ8Eo6ECXC9kchi3wXm7DhzaKWNEX6x0GxkCoO1vCBWJnNnFkaLm6arE5SSAEIBOHBMJKEQpFu3+VHrBpq43+32eOd9PX3W76D7NurL4IJZJKaYOYOwGQnbbyRvN2mOWUc5QblBmeTBNxcEzDhlPKZ4F9CO2uDinQbutpspyUDyixpsRd0aQEwYrqgNArD+F9xmTYNMlIPOtxQnUEmMPS1mDbDbuFOHli9aUIe5j5HxI3QipqrkyNj9woOvAQzxFlWKxVGHsG7nE59mXvbiX4c/jKeYFiKcbfiPIb8ZuVBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FO87xwqxP7d00iPFCh0YkZyeqnOpOG3yddk373tQ6Q=;
 b=ZVSj+JT2WRHfOhNroHp+wRxb7pZjNM8EbJXiQZFeszYa351ZnnFmRoge6lmiwYIst9GtD6u+U+VaUVVtC2Lxa56qn4VQd8xFPy5c8TFmo7pH36DbgfUFrr8AEfzJJ4unY+LsKzUFIWRaofrHGkBNhxTitPQxL9tTscmU9i+aTb9oOgJkDxthl3vzFr81VtGHmt0wmMugSZnMC1kjBtUCBkwLzOi43+K1rNRVwf7sPrPtYCIFfKjTnWKbvtinBkH+dbq02omGsKOxwMuyOid72wWIvZqu+Tzn34c1tG5fCFUxb//67uVAZG+pg2hvtcrYBD21LvBfpHnGp9TXmsP2Vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS8PR04MB8801.eurprd04.prod.outlook.com (2603:10a6:20b:42c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Thu, 27 Mar
 2025 23:00:36 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 23:00:35 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH 1/2] meson: Allow user to override setup command options
Date: Thu, 27 Mar 2025 17:59:58 -0500
Message-ID: <20250327225959.3611495-1-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:40::22) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AS8PR04MB8801:EE_
X-MS-Office365-Filtering-Correlation-Id: 20bbef57-ff18-480d-2d89-08dd6d832f23
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?us/sJPDZTvqI4sTIiIICtKOMqYYNSQejGPO35qXjf3W53MeP4ptM7gAtNXtq?=
 =?us-ascii?Q?r2IdZl8JqHElwWkEc1PIjYmd3jEhKHC6/rB9Lo0+p/ovYeO4uoXhI8YA3sII?=
 =?us-ascii?Q?kFj+qwCGVB9H95mxK+RSjQTNktE/tp7DRFPZpF0nGs15jmBOONXoXkldA4lI?=
 =?us-ascii?Q?IqsDRYa5wpJrOk+wnwW8LPkXbTXmjUexxM1Ho/0bk0HfF5icCoolvFehShX0?=
 =?us-ascii?Q?eAlgz0DXUBTQhn10p0A8DDo0akaGOLeDAVH1vFD6Nkbetmywl9659xiviqZG?=
 =?us-ascii?Q?7CPE7/upIEJ01fsNLNikvHlLXpiY5f4v3Du67Ofa3fgWIKFWzcihcbnj5gW7?=
 =?us-ascii?Q?uRG45HaqZgIW+GR5RvF+g4hEG+w9kFOheED19O2VA85esi63iRWbgEA/I/Yd?=
 =?us-ascii?Q?SakANv0CPAZ24hjkJIiUcSsomai3w7O4gxlR5TtazKJi3eIp1K08K7pEwSEW?=
 =?us-ascii?Q?0o4uHABO4rrRIdnRoSGrbjw19hj46nhp6mOSUTqaMPrgr9d1V60hGyq6OZNB?=
 =?us-ascii?Q?b0T1hzzOOp7FgSg7/0JclLfsUapTddLRabfYMN1SgqHAJFd4s2xO0Kyjil/0?=
 =?us-ascii?Q?CECiuCeMtNYfCDdQGRKwEwOD85uDZrAipU+3kskwOFluosOEAdwqD1ukoqOS?=
 =?us-ascii?Q?BhWA7KPoZxwxmPB7XzZxRs6Z3DhWVQ40VZ4Lguq7IBAdSZJsWy6iG7Jy8ihy?=
 =?us-ascii?Q?TjdXgXauofpMJa+Oh5U/TlinN6Npk8dwN5OBxwgHclFfRureLlxf9LfaQ8oJ?=
 =?us-ascii?Q?fvSIlhUWvPIV4fAJ6rS5YR7I5AKwqZl+cgPBA4HlCiRmrwa5ihHmmc7aNVh3?=
 =?us-ascii?Q?ZHCLwMhWEXdHiXYmSkm4vp+5VAlSwtuwVhx4LRJWihrI3SjgFwmmEdIhYpNj?=
 =?us-ascii?Q?evxHBHtKsR1aNXH8/LU9dXnp9umA+Gcj92aGMm3IXS64Q8RalM4Hs0aeiJzS?=
 =?us-ascii?Q?yCzAx7LvVETYarb+xehQRg0Zzlk6RFinZKyCYxPhwAuA3MI94jhKHXSP1e8w?=
 =?us-ascii?Q?tf6ua9/SYg++vqTr7h7hpbMoSGcztmMsbMzcma+b7Dc1B1E9fQYKDzqrLq4K?=
 =?us-ascii?Q?QmtZenFWrNy+E4+n0Sb2y+uDF4E45uWB9JmxiIawX+/oGLr4xvgMyOtXvi1R?=
 =?us-ascii?Q?tojfyOqwREYV7/ecpWLRbYuW+ubSKtOqXqbonwfs91MlPkpbH/+WvOhZ2spm?=
 =?us-ascii?Q?aTFjd/3sbWpcdaR/YqkCqb/wjBk8sl/MLYSPbGUMC85EBCZEcOQWBwq6hEyD?=
 =?us-ascii?Q?ErIo/OvXjn3CC4K4iSND9EMKmphUVfCtQ9EQWOSMEs7KrojaqXe5cBps7qpz?=
 =?us-ascii?Q?/Nl8B3GtJwufI8ERigUezk3/Y2uhExw2rdMsH9q3UlabZYBR7gEzY8xSMNNZ?=
 =?us-ascii?Q?Yob2iPh1MaGF5HbLXYToVWw2waYZExGV1FD5PRejJu1dBtllmxLgc9RLuBUE?=
 =?us-ascii?Q?WkYf/wfDGeSE1n5zB5GoNMPlzUKZi35Q?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?e7/vlmXo45zZ6qmqsfkQS/+gkQAAbnf9KDjBuMYS4mOwtkYuZF+k3XIOStAf?=
 =?us-ascii?Q?K+HEDT7j1dB+Fm+98nJ2LxmmPkltf63VifbgiSV4uFNMBum94bdYIJP6jLvo?=
 =?us-ascii?Q?6wpZxe79h8/DKYpRDe9FOteQfUKg600Hk7WWZudt/NHuVtRNmAaeqmG8l29D?=
 =?us-ascii?Q?Os/2I7/hgeu5j2yLNvUJdW9ASbe9Hb8p9a/pI34Ruhn/bVSzeHMl+rEfeiVQ?=
 =?us-ascii?Q?m4EGF31wGEEA6m5GGQ/3lpewpWVo/aEnK096Hv0/eEC2SvnHPN3TUYZdreLG?=
 =?us-ascii?Q?YoFkilvgH6pY411wukMgV05Vf0y4Kppq4QjQ95nZOE5Fjs+fnwPHBYawdTpS?=
 =?us-ascii?Q?5axtWlbaI8LuZAk724znqD1Pbi3SfMnAXcNSTqHA7YnvHoe1kkTyyyqQlV/B?=
 =?us-ascii?Q?4vyKnIg0jIVH56ldFoujpQho3qoC/fj/ZJRZG2skpS/zb+6qpIQtMYiCl5h7?=
 =?us-ascii?Q?9TyKTdG30A2SVJKEznfwQCXLmz7s/6AoQEGKldt2QCo6q6UgRxwY07rFJk0h?=
 =?us-ascii?Q?KjNonUIzSTEnSYJRE/vvw4OUFWbhEoAkEKO4PqBZkuFR8zaM5BFVJXeGbahC?=
 =?us-ascii?Q?iVGn0wO9LpXfLnmKZIMDYT+zsFgBEDgIKHBUxYyx+S5+FPWmZY2yrdcgl5We?=
 =?us-ascii?Q?+uNodXcGfRwOrb3b28FLiH68tsuYoyy6fCeSeLvRm93sSGa43pkwJNyH0VHD?=
 =?us-ascii?Q?Kep3hMgHp7llH3+oyW32NzmR2c/6i56I3RSfscZabXz4iHSRTiPX+hIvXl5b?=
 =?us-ascii?Q?m81q7ky0qrEPQ6lL0m4C3wrFkzHOIL+Hh+JrSRwDXQ8Q29y4TeFwVXvJNOLo?=
 =?us-ascii?Q?5gg/Chvv0rJgHcLVZ1OV/U0icJsaw1cXjCkmirzPEyAIRnlxA+IdcCEG7wkY?=
 =?us-ascii?Q?zLWnuaDK6j04iYsuRIcG9zEevevF9bFlxdJcHnx0RyPxjZ4YRKtCaEXM9h8f?=
 =?us-ascii?Q?mDYEH7I8e96SPo+KRoW+zmk778gFvKzkuLefgKsjxbQVBHl8YXloymToYHZ7?=
 =?us-ascii?Q?zKBSU5H9UIhgOFmBq9pJjhQYbajG0yc/uxn1pk7R95ByG16TQTr2E9UJaQoW?=
 =?us-ascii?Q?aCz8MB69P75kXUFmEPw6lxnzDlAO1ha2PlAhpc0VhnmW7FMbIrZfUhw2EnMm?=
 =?us-ascii?Q?k9Gs2t8H4GDQHOcA9Vvnz7yi0NqFMCGcMnJo4e7De/B6ZNh2rLf2T84tpkoE?=
 =?us-ascii?Q?LxoWg7fgty0SvY013F8xA0k3D7BBUD+Gwn0r0qha3uVM6JbaNFi7R+qdHEv+?=
 =?us-ascii?Q?7SSeSligO5ZvaXzpSo/cgS+8aKwj1CU8wPDtze0vc8tjPgJX1MgMAXIfR4K/?=
 =?us-ascii?Q?evqW0Qs7QgOfIOU86ZTGtkglMQ1drZJr0rzkPJ4QQzXlKZ0ktH2jUU2wFxgn?=
 =?us-ascii?Q?SJkKov66L2DiWK7lRGFpOIfyWdnz39+AS9+DFyLA2Xb4Lkyu0H1/JFL234wg?=
 =?us-ascii?Q?KuL5Q2OMHXqXZAnIORf33RkEaUSyiUFwLKFtSIljPAdaLnOWnbyCkEe8uiSl?=
 =?us-ascii?Q?kcvnq8QvN6PAzVhxXY9kqPF4Cy+5IjDS916l306+8dZ0FHXPQTtPkvCP9mZO?=
 =?us-ascii?Q?2SkcDYzgkLHc+eQhotnGZfGQ1lSUlUFNrNXoOBgo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20bbef57-ff18-480d-2d89-08dd6d832f23
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 23:00:35.8808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FCxDcQ7Vde+7Sr3Nsm6kCnz6AxzgZquMt9r7xSeEEk7fK8SngiNcLagw90Z1Tq6vzfVKxuCic95HgrC38hePLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8801
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 23:00:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213801

The user cannot override the setup command options --cross-file and
--native-file because the meson-wrapper places these options on the
command line after the user options. This problem was noticed when
trying to build with an SDK using a custom cross-file.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-devtools/meson/meson/meson-wrapper | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes=
-devtools/meson/meson/meson-wrapper
index 7455985297..3aa1a93520 100755
--- a/meta/recipes-devtools/meson/meson/meson-wrapper
+++ b/meta/recipes-devtools/meson/meson/meson-wrapper
@@ -14,8 +14,14 @@ fi
 unset CC CXX CPP LD AR NM STRIP
=20
 case "$1" in
-setup|configure|dist|install|introspect|init|test|wrap|subprojects|rewrite=
|compile|devenv|env2mfile|help) MESON_CMD=3D"$1" ;;
-*) echo meson-wrapper: Implicit setup command assumed; MESON_CMD=3Dsetup ;=
;
+setup|configure|dist|install|introspect|init|test|wrap|subprojects|rewrite=
|compile|devenv|env2mfile|help)
+    MESON_CMD=3D"$1"
+    shift
+    ;;
+*)
+    MESON_CMD=3Dsetup
+    echo meson-wrapper: Implicit setup command assumed
+    ;;
 esac
=20
 if [ "$MESON_CMD" =3D "setup" ]; then
@@ -27,5 +33,6 @@ if [ "$MESON_CMD" =3D "setup" ]; then
 fi
=20
 exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
-    "$@" \
-    $MESON_SETUP_OPTS
+    $MESON_CMD \
+    $MESON_SETUP_OPTS \
+    "$@"
--=20
2.34.1


