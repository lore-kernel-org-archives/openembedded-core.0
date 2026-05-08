Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F98CD3445
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 14:42:41 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15416.1778251352232092552
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 07:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=eXGRyTrA;
 spf=pass (domain: est.tech, ip: 52.101.83.8, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7v1uDoE9wJUBi4a1mRGOU97UwtPkLQuAh+12lBChnxVe7xDSzhv6m/Z5eviZFvSX1SGvyOaxV20QxbqAWCzPp/Ydo5W5olxzN/8B2NRZFQpeFHkA0j1dUPuiLDvv9ilgcf7qJQfOp2bmFlvI3li2DRYU79k6O6+1Hh8io/ct5y6hshjlXPrziiQOcSNR+u/OGqBnzUtvkecsKwpEeKJKCybPLtgMDJ/+AStVjbd/UjQx5t4ZqC6qf5QO4UKGbXd8JZosxZBVKf7ZoBA8rcBCxh/p+Qn8EeX/6ljlisJjcGZF0eOsTIO1JNGXuU64U0mlPf+Pca5BdgkLzIpEHwVYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmZtej4jhIfWPl4kO11E5+GQFYnIbeYTRTQWUX9HU0I=;
 b=N4IM6MyoDKmT5B0PzNW5dP1qIDdzpMS6OWw2gfsrypUvzh/gwRHouTDHmPZ5Cb0OgMBrByG15tcJpVQar2jvBRTDuOX+gKXKg/G/f4nhhwxl9unu6H/GXx9j8HHatF9K1UeXhRinuH9aisFAetDD8fvAm+gAiEiKhDu6vuyZ0TToHDXX6ztevL/n4WsAJ18xcLZawKNdTdWeLgAk5HytoR3tw+RPhWkc05jwjQDc/hLDpB4uaGRyQXMTB57GalMNE0hn+l6kLjSJPbygivHLcxuYZwZ2S8rD5xM7DQ49VNZviuEWsLpUVMl4uRDs2+uaTHI7C659rA4oaE+mq1o07Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmZtej4jhIfWPl4kO11E5+GQFYnIbeYTRTQWUX9HU0I=;
 b=eXGRyTrAJ8Rth5MaZtKLHKGbOANfMuh5g2aZiRkLp7iwW9jlWCserAdhtGldTgASv4Ihl/B1lT+FUkvisMklkNiuIUGUESdRw4ZBR9uh+KnBWqUagaFIO7+gcnIxkbnz4sHOQi1fsSzBsUM8AYn4AWSAElyxecSiwry0xBolCiSIBn3Qpj1tDxVR3hX+SqgKu74dOHJKLa/crUGeFIxoe3UJq00gfNUZLpzaOfKvOyST0RqbJT9LEfXspQ4Ow1/28Qn3Bhs3OdaxuRknhRLY88amKVi9749GiElUVGiWMpe0XuzLow8NdvjYii8dKbVIqkhG/m2bkFFeqoVKw24Tlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by GV1P189MB3050.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:262::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Fri, 8 May
 2026 14:42:25 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 14:42:25 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] go: ptest: fix GOROOT detection and improve cleanup/exit handling
Date: Fri,  8 May 2026 16:42:19 +0200
Message-ID: <20260508144219.28709-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2P250CA0028.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::33) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|GV1P189MB3050:EE_
X-MS-Office365-Filtering-Correlation-Id: 113362bd-bd5a-4024-75a8-08dead100546
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|3023799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	rcjxAg+NWsTBTKIPT+ql/xuvyz9tx0LIZhJutN8oPxQvqbQRDZuPCPu20gSNB3ZZRVPn408Cx1GclcxMBCl2BbSal2EE8nSEn9gu4UC02oUsfcLw7GoEhKFlMTXl1em5Mr2v8dJ5J/O2zUxNIpGTUTBZ6zZcvxTFUaWUBCrvUfNq+SRTSr7kTW+aZAGmdc3Dy+ah7W/Rteeozu+r6b0OSNXbj9p77TSa9uKL5wO7Il39SDdEUAvuDwhrjaRxP9yJ1y2+3fNvAI2B8QT7ejupc9JwLVm/vxxtNSJXgC5Bh2CAdWeDsAfLQpS3f4YvdKQdAA515+GpISbym7K7Q2fhw7IYsGnX2Hx7AqJq78eOU2nOLwgRAFlghaEsmpV/uErMMUFWfkvjolOVDmoz6qhWRS8E+9uoEjIg3WDbMyuQRE4EdNN9HvWSb15NE++vJsbnk6Pcy1Vf7Dc/X+NYapgOMmTrGzfcRCVBz/8XZRoJf7Nf1YbJLC7agcYrOq4DGRwgKZxHhSVZQ2BUEaG2ZwQLX/yma69SvhwC7cLqCcWn8uDJcz4X0OVh3cR/xW4kWSrVBHpj8CM9785NwbRaFNqa6DfCpC4ChDo6iaLh5AQsOb6TuldoUto7SEwUzQelJoPFiSaopcVR2RUPnE61cT9ZrMebL73ccIeiFD5tbM+GsFa9aAsc8HyK1aNmFMblHhxU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(3023799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4N+CNsX6D4pHM++5RpTEiWou68jIozXT42iamdoWC5jTxLbTMmDNU75wCw9Z?=
 =?us-ascii?Q?GmWqvmjDDh+kZVQHmXay+KJKfceKR60NLx7iOaYXrYUQLHBIeLKp9QmptUZO?=
 =?us-ascii?Q?yMp4TPublp5pmW84FwhFQgOYJKEfnYh++zNEbBPOL6RDT/Oy8a+Z9mJ3Li1w?=
 =?us-ascii?Q?bqjMyjDG2JQ2KKzyrlSazG8XA953EBdropB16BZ9wUyCJNbWwEx5SPD1d71W?=
 =?us-ascii?Q?gVh4UN9VxKsoQJeuc90jGHIEv02duoWz3cBVtgr+SDupuNkBKd6M5vgZ3Ym2?=
 =?us-ascii?Q?NOY953MW7pZSTve/qeN4XONqF3serNtLP58NUpEGB6NFq5MHoIerCfYGUlcQ?=
 =?us-ascii?Q?PTHMYbbvshYQTd5hgfyHQFWRMesKVyhBYwhoGt5u8zRV5m1AqsaTKuwnFWbx?=
 =?us-ascii?Q?gUWMrBgjsA534wTIip61nHfjMZtxuRBRyd3+Sixd76f7MjKKFPFrdyngcjKQ?=
 =?us-ascii?Q?3OLKO586DTtgmTt2MiJny4STxokF2ccF5rNOlkb+NEmZpQtjhFgLDDrMwyX3?=
 =?us-ascii?Q?NkPolGfEWzJYMSeacMeqxU8CnX14ehEthmfnk3LTk1ANOM3JOHTWkO/rXPRE?=
 =?us-ascii?Q?eEPJfwKzowAhqBsfswguemCraN8ABIzECYcAO6JKeM3PV2T//kQjPjD+r9gL?=
 =?us-ascii?Q?g2CRAkpk+47Pr6ww8SEshqdP8AlqzcNfVKFgeMt9EabrwsBJt0uG7vktKUqe?=
 =?us-ascii?Q?JVtXxNDq7YBTP2hxHM6gee7BAfPLTl3Wt3WFpprfwz6iS7V1P1deL+no7FMw?=
 =?us-ascii?Q?mivYN2EJCJm/EOEUgfsRLGqwV9NOquhcXCeNsbd3NRhWLpOSI7/eK5yvLtYs?=
 =?us-ascii?Q?4uOHATOjbAdtgKvNEy1GHajRkr1/yXyL3FzUsEI6x9+trDQIQ2kQIBNzPGIx?=
 =?us-ascii?Q?/GBv+xGf/M/X4araT7D0nRPbZl4+I+neGV6VUCp39+dU31I9lN3DmO4xNuSm?=
 =?us-ascii?Q?Xl++E2RH8TvslBEHkmJpdJmeCotzYBkXJ/iFt/hU97BicJnrc/T/niyP+e0j?=
 =?us-ascii?Q?tKpTA8gCaOjAopLmr2I+B7XdBMIlHvKUGL52yI9Bm02noq9md/vearlJ2L+e?=
 =?us-ascii?Q?nqPTwVxMx8Cnch5rLbN2NW5ETWyf5bFa4IHaitBMGOeM+jbRTGqoIELKHPtd?=
 =?us-ascii?Q?s/ye6Gqkp9c8wId04wD+MCnJEtIxeH7doDtTzVBCSs3q10w9krrYhXePcIm+?=
 =?us-ascii?Q?qwnxgwbp/2DRcrDMzOS0ORq6GDPV5YKF1CQk9VpYdsIA8s1j7AVZTY3XhVMs?=
 =?us-ascii?Q?to35+30eJX0co9MpdXWfGpliwhpHM0Jm26VkY/lO85BsO4uhY5r6DyVF3s4b?=
 =?us-ascii?Q?bn/JYkX4lwmyqqpwK/tw0kZnr2yVejj23pbwBz5/8iA+TA1vtWhXf2QGFqMy?=
 =?us-ascii?Q?R62oVKm6kWpPNxttkcnTH/3/G7hrJVG+zPBmo4ixGjCoPp5jXAEBKeG14l+l?=
 =?us-ascii?Q?MqiFiE8TTNYAAoerac5ECbJnTm7Dt6H+LJMcFswg8vwzzsWe1f8i4qOj77pS?=
 =?us-ascii?Q?dFvZwMFTGrN8mrIpGXXmLf3YsjeA/YBwWGR8vHDwtbQUakKKDjEASC23k5k/?=
 =?us-ascii?Q?m6SiNCDeYRNoLy6Y+v9i9t5ACdqca6FA2p5HUO5gJCCUBQgZpIbYc4UMQ28j?=
 =?us-ascii?Q?vqAiFCmQxoeK4adDPPA++kf2etFgXdyGjcHG7ZGjTtmRL4OrSNlT00qro1S/?=
 =?us-ascii?Q?16k/4PL9FtTCg2nRopIElm2GZ3rG09PabvgQCgUjlKkfF6s95nlzGSY98tlh?=
 =?us-ascii?Q?gbLIFI0fjg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 113362bd-bd5a-4024-75a8-08dead100546
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 14:42:25.4088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4DqVZuUdupg63q33QzeF94eUBx8FcS/jQ4aJX9BCgrQ3zHAFyB/FM5I15g0UYAc3+IHzyEiPfFc9GWkkyTmMtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB3050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 14:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236718

Changes:
  - Derive GOROOT dynamically from PTEST_DIR instead of hardcoding
    /usr/lib/go, which breaks on distros using lib64.
  - Track and clean up VERSION and pkg/include files that were copied
    into GOROOT, preventing stale artifacts after ptest runs.
  - Track failures with RC variable and exit non-zero when tests fail,
    consistent with other ptest scripts.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/recipes-devtools/go/go/run-ptest | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/go/go/run-ptest b/meta/recipes-devtools/=
go/go/run-ptest
index b8a080526d..5fc9367570 100755
--- a/meta/recipes-devtools/go/go/run-ptest
+++ b/meta/recipes-devtools/go/go/run-ptest
@@ -2,7 +2,7 @@
 # SPDX-License-Identifier: MIT
=20
 PTEST_DIR=3D$(cd "$(dirname "$0")" && pwd)
-GOROOT=3D/usr/lib/go
+GOROOT=3D$(dirname "$PTEST_DIR")
=20
 export GOROOT
 export PATH=3D$GOROOT/bin:$PATH
@@ -16,11 +16,18 @@ if [ -d "$GOROOT/src" ] && [ ! -L "$GOROOT/src" ]; then
 fi
 ln -sf "$PTEST_DIR/src" "$GOROOT/src"
=20
-if [ -f "$PTEST_DIR/VERSION" ]; then
+CLEANUP_VERSION=3D0
+if [ -f "$PTEST_DIR/VERSION" ] && [ ! -f "$GOROOT/VERSION" ]; then
     cp "$PTEST_DIR/VERSION" "$GOROOT/VERSION"
+    CLEANUP_VERSION=3D1
 fi
+
+CLEANUP_INCLUDE=3D0
 if ls "$PTEST_DIR/pkg/include/"* >/dev/null 2>&1; then
-    mkdir -p "$GOROOT/pkg/include"
+    if [ ! -d "$GOROOT/pkg/include" ]; then
+        mkdir -p "$GOROOT/pkg/include"
+        CLEANUP_INCLUDE=3D1
+    fi
     cp "$PTEST_DIR/pkg/include/"* "$GOROOT/pkg/include/"
 fi
=20
@@ -38,6 +45,7 @@ SKIP_PKGS=3D"debug/dwarf debug/elf debug/pe debug/plan9ob=
j go/types internal/xcoff
=20
 SKIP_REGEX=3D$(echo "$SKIP_PKGS" | sed 's/ /|/g')
=20
+RC=3D0
 for pkg in $(go list std); do
     # Skip package and all its subpackages
     if echo "$pkg" | grep -qE "^($SKIP_REGEX)(/|$)"; then
@@ -52,6 +60,7 @@ for pkg in $(go list std); do
     else
         echo "FAIL: $pkg"
         echo "$output"
+        RC=3D1
     fi
 done
=20
@@ -60,4 +69,12 @@ rm -f "$GOROOT/src"
 if [ -d "$GOROOT/src.orig" ]; then
     mv "$GOROOT/src.orig" "$GOROOT/src"
 fi
+if [ $CLEANUP_VERSION -eq 1 ]; then
+    rm -f "$GOROOT/VERSION"
+fi
+if [ $CLEANUP_INCLUDE -eq 1 ]; then
+    rm -rf "$GOROOT/pkg/include"
+fi
 rm -rf "$GOCACHE"
+
+exit $RC
--=20
2.34.1


