Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE386C36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 17:48:37 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.67])
 by mx.groups.io with SMTP id smtpd.web11.15293.1743270512002388538
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 10:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=XbjwL06w;
 spf=pass (domain: oss.nxp.com, ip: 40.107.21.67, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wy0oqQHyJZ8x52sana8ngfXYcnpTiSZxuJi57YDaKNeYLpfxFfPrj2NAJubW+JvgiFV+ZRSKVgSI1//79f/RtWpw7cLizcFAooc6hkasrmHXEZsSVar1EAzH0hyI1MQk1CiEwCH8GJ4BAYbrqqDEQ2ATOIKFb3/qvzTNWHXPT01pM0RYgKh/+VV5xU74YW4Tfyd9K6bCRtbgp+F7dfR17cNzYhq0bhSdMEISzz2bbZvebFVMWLQ+5q5zGDeADjA9qnhJPDhAVuEIGvUKnvpZA9qxnftWDzKMJi4YXxl/qq+/DKKQDpSsbFoyhzMQLSR5DVV+LtVZwBxM0sqeY2sj4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FO87xwqxP7d00iPFCh0YkZyeqnOpOG3yddk373tQ6Q=;
 b=qgHUtH8i9ChFHcegKzstXDL6kDHRexYuoW6HdT/zjdjLQUMG15o54+q0wMgMBrX6Hfl8/Z5YvYCiYdYspBmW/LSkp54BMaGfI2ZUF5hSiJgP6tonkHWYNeG+Hh0kfqjtZfnF+kUu50Rx0UtHxj+lauDWiWcZS6UCDDW3DhaPr/OBWtZtugR8uGQ7vbMHPvmjHsZBtBczT186PMgtrodBWEWpqi1gbEJrWyCXwlu/OrxOPnX6H2Rwxg4C3PfB46+S+mtc/JzNKyFvH4dNRp0vnfrY7SHLsNQFkX1sb+W13vCeudsp9bJs/OYeqGaBnqq+jeWiu8f98zcfxgNSs+1JJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FO87xwqxP7d00iPFCh0YkZyeqnOpOG3yddk373tQ6Q=;
 b=XbjwL06wky85FC8pxgKcmeA/AvVGxInoTaGznD6r/2XMb6dX3SDVn9F90qkKNvh42wuBZ8gPRQmYOuyyz5PuSs/AXgfI5zB0MD39B98eITYtguWsN7gtqXOIohkDi8eshN0lwRjIK+pi9sAa0lMeKn7hpNkNbOyM7GEJj5gZDa0VbA0jScYdQ+QGlMDcyA8arlF7kzuBbPHUFl3tGjXk69uMAGQepC2ni32Hn6dHJbPhbBw/RBLKcZdUjmabxdWJ/em8ec18kaKE5uE7wWyIfm3rRMSg6fXQzFVfbae6uSVQKZUvvRYT968f9crf5DMnIU2/xjz7lqBp99/9AafRJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS8PR04MB8803.eurprd04.prod.outlook.com (2603:10a6:20b:42e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Sat, 29 Mar
 2025 17:48:27 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8534.048; Sat, 29 Mar 2025
 17:48:27 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v3] meson: Allow user to override setup command options
Date: Sat, 29 Mar 2025 12:48:09 -0500
Message-ID: <20250329174809.1057348-1-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PH8PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::17) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AS8PR04MB8803:EE_
X-MS-Office365-Filtering-Correlation-Id: c407898f-fec2-45ef-d740-08dd6ee9e8e5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CZ3bfNG7/MLSl1QbQDZVFyukObmD+FkSrKLID6ImHq5faTi6FHHa0iRqCGfC?=
 =?us-ascii?Q?d4NnBsYLBXuzGUqZacbV/y1Fiwh/4lHudsbgRP38jIQos7zPyYql4sc8m+gy?=
 =?us-ascii?Q?gMPu2tPsMsoXH77fjkFPg+BQsWxBUEURLDW5ED9Z8T8OUY+H6hnv8EBavTX3?=
 =?us-ascii?Q?emOzHRhQSzbtSpV/VnVZisf7/NsaYBPRHk1j3jwK4mC6Z7/vgEC1iC9jP+dn?=
 =?us-ascii?Q?16hSOpDxewIK2E/Qqg7UXgGfpixXFiVvr+07ud/Lj2aV/WHZ5iC7uMT6PGFg?=
 =?us-ascii?Q?gWXL5MJcvn8kpHmiQWy3hBlLvHU5h+UAL9C9QdXXDQu2WYdF2N0Qt4MXY8ha?=
 =?us-ascii?Q?4s7YmUwQHzwK6kj/h5U3vkNw2B72zGB4ZSQ0kSd6hWLvDQzNJQNXlhvxAtXT?=
 =?us-ascii?Q?BIy0kXEtwSmpH9wdrrwTgQGsmJxaFl0v2SQPmrLmpSwnvpzCR3HdN6xhlcrt?=
 =?us-ascii?Q?gEtmA2g2XQkXYYzkxnrhRAnSVsLBeY1ePlMVL9+dL2nyCOkihRrUbXCO6ak8?=
 =?us-ascii?Q?wGhcVKhCj9vMbK66UY74pr51mX1RSnS/el3/O6NBPB+cy4xGF3sroFFJXPF2?=
 =?us-ascii?Q?vJFkh9Cdk/YEV25BKMP4GcJI6OI932nCSNMVaSa+XBajiPaEnp1ZTqd1mVsm?=
 =?us-ascii?Q?VKBoK5F1fG5Jhno7SZIQ2WVmH2zcw9crGmfhupY+nRsImpR45aeTfLp3PYrh?=
 =?us-ascii?Q?Hocl6qFmK7hGOeGtZ4PZ2yxyX4N+WX4Pdn4MAAJiL6Ymijcov71WXDPDfwcW?=
 =?us-ascii?Q?+dfpCyeGuVClOZVLlR97JsbUqitJymzN5NHINidmPRcmAO9Qfd7a+hJCSsek?=
 =?us-ascii?Q?vJZhqNRxw28LWPxw0cPzoJA493eunuG7FMuWpIQMz7FqWV5EavFePZgW3TnL?=
 =?us-ascii?Q?tyWkjrHqkZPHGThQeF0VvJ2PEzTh3zM7UeVjWeT3i+AlWR1x0Wwbaf4vf9bH?=
 =?us-ascii?Q?Cwc/osbDJv7DejKZzXwVKIrajeJKjooC2xyQo/aqxnD2GRL4vNtNF9kfXAkz?=
 =?us-ascii?Q?KLZx7A5HI7jYf2ARDlNgfvl+/bhfojGd7D9PBMah0XaH6370fb+DTJHHMjYA?=
 =?us-ascii?Q?tbbqbil57CIUwbYvoA6mXGtPtIR5zfsaicwJNLt6105gd4lfnnaaiFwmIQSB?=
 =?us-ascii?Q?ECrciW6VPl1bdyLn9KQvMICbI4b8roAfckLjWRtszwUv4ikhLf9AyuXlteFo?=
 =?us-ascii?Q?PmdGYm6kpcoOwm3VOcUEy4Yn0/tLs/Z5mwA96l0AdSoLVfLIec0d7ehKcihF?=
 =?us-ascii?Q?p8OiM5m+6EKo4yk1gocCqF9PU6SOJM71H24tUn+5fGsaJP3RglQr3wpH+vfN?=
 =?us-ascii?Q?ZWNXfD4KQyC73G01imPvSD++JpQSPnnRkkxhWDTSBI/p86ZCFcURcWWPy/4g?=
 =?us-ascii?Q?lwh9g4Dn/Fv2yJ3S3jMrgb9YafKwM7RWWAkDtTmI4YdEZ+dFI+82FFzF4oox?=
 =?us-ascii?Q?lhlkvF/uTu2v1F9YWqepSt+YllFTWwRL?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7+4UkMh6YpAJyIfVSuCfjCbh3mzn1dJJ0pf+bCcnAyEHlFiFyPlPVhSmTGFk?=
 =?us-ascii?Q?Z6irAoT7z4DACwZlIe4WgTbiv291Ikt0pg2kwtq5yRMSKU/vadhOpDsovsNV?=
 =?us-ascii?Q?8r9fD+6JT5GP6kUZNGNUR609qFD1uP/ood3Zq2D197WpvLOmTSyUPNUl7Q2/?=
 =?us-ascii?Q?rrdaZDj/kzctv5GU8qHitFeVwNTYP4HMNrmGjs82zIASUd+UyPWT1AyvLiTH?=
 =?us-ascii?Q?jaFouS6VTQmYVNvwdNYCy6kV80fy3smaGfJVDG5T2oh7/U6Cm2WTUJfDXANk?=
 =?us-ascii?Q?Z2GP5ZGd7lFuzAsAUlwdOtcAtigM7Dyoi1BLT+5PkoH1OTtq7mNdDN005LPy?=
 =?us-ascii?Q?6bhwScbuqOLhv/VsGznkULC+YAejllntWDx3rJl7xBr9zgpZRZ04IHfcL5ve?=
 =?us-ascii?Q?8PKloc5a2h8VEL3hCzRkwHaOdypIL0CTG1fqQ/uzaiJlZO64dPRyUG2TVc17?=
 =?us-ascii?Q?ADvSyZKZZ+wGeqNDJsWkhGOUpjWUa7RYf7Wn/9159loruUWHVFLXDbrMQgmZ?=
 =?us-ascii?Q?OPYqBKke5n9mOQlMqjYcSFvRd+drKJMEBoytbStLyQ75cLLca/SDum1cOmHI?=
 =?us-ascii?Q?PFJ1zXjtWUF5ccNRpjkhF+BzWxnflX052GpP670n9xwpdswgI5YAbuql7xK2?=
 =?us-ascii?Q?r3MzoEyYlww68wI01a8Kb1VzgdQ5mbK0hz5P78fnqHlvo91SUMna3KjcKOTg?=
 =?us-ascii?Q?QUup75CRS1mrJJSZ/lg99+BY3mlYI2Lr3wpB3AUQJr/cppaMZxfiHy+YrDit?=
 =?us-ascii?Q?SljPBo+XLsFTDwKbjSdmZN4SgcTXghH/n4vC3m5crhM6U5zBZr5oK+/GH5uB?=
 =?us-ascii?Q?EtMZz1dHG51rLDqdF5S2PU3jC/CBMZ4r8zOuaBYr2LSomD7510z5CxLAvP+L?=
 =?us-ascii?Q?EhDE8TRH7/VJUBRb/Pxvtp17BwkWfdSUEiy7pgHrb8yH/nZHe3faZX1zmXn5?=
 =?us-ascii?Q?K2yRz4HawMzAQqGVDcFiuYrw5WMzo6jUWP3iWCyJEOZVXnKqNuK+vJNjET2W?=
 =?us-ascii?Q?EfAFT+9aV1BnhC7BFZaMrohqvUv/bvbIsK14INM2UpzBw6Xo4GAl/2qvfTiA?=
 =?us-ascii?Q?yEal/Iv6sXt8WzzWaQhO1thY4wAOTHqTmwZUZuYyEVmaZmZpmdT0GMU7+gHR?=
 =?us-ascii?Q?r2fnzX+DWSwDRa3aeMHS6ye2v066wiJ3wC83MwzESlzXFnxmjwSaZY3IiIfe?=
 =?us-ascii?Q?z38gQiagvxgfFtVjNTp1fwp3H6g6PoOOmebCcRGnLtgAKu1N/sz8iwJcXsVk?=
 =?us-ascii?Q?x5mut/K2w0Y1yTwpLaKt9IxuwCHQD8RufTBqpXgqTYztnOwUZbVOACirfSxS?=
 =?us-ascii?Q?GzWtdTBa6NhzYZusHb0h7MItaQhqWwHSBMK5zqmtUD4hgqHuqK1hjkOc/jxI?=
 =?us-ascii?Q?mjwgQ8bpBUglAUddE51JToejBv7SjY7DJTM9OgC0s7apALwU4k6wyYM5PdBQ?=
 =?us-ascii?Q?ZBqRPtAdzgE83fkXtf7/WehSa3WZBN1lBmRcNJEEtY/cFD2aELkrXMhpeMPc?=
 =?us-ascii?Q?k0/irKvVe1Cof5FWLHN4WHpojGZ6X+oR9+hAg8Bi4fgJh7DzvGhvXDFd0GFz?=
 =?us-ascii?Q?9Bo9YcWJpqheHlYJfK3XyUfSltG+Dw4Li97yZeuhB+/FU+N1hJ9Q/xYduOLb?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c407898f-fec2-45ef-d740-08dd6ee9e8e5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 17:48:27.3258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CtoXVdGYXuJx4f4TT9Vi7jKFvOqd+6WXdq5RftcqJmm3KJFT/++R6jKcmu0WHOK/9IrbaQyS7dFPSH4j5Gh6yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8803
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 17:48:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213888

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


