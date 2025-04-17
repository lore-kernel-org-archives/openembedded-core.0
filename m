Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD02C369C9
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 18:10:29 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.44])
 by mx.groups.io with SMTP id smtpd.web10.15633.1744913424008003168
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 11:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=cE1KkqkC;
 spf=pass (domain: oss.nxp.com, ip: 52.101.69.44, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpS3PtgETPfLqVP3EzXEvI9OVzmZwMbxSoQmDMLfnxmt0bkLpCThdFiLrfyxVtgml4jOZ9CFL670wP74TDSnl2f1+aiAM22iPABDhK9aRCKXN8OYQzwVhbyOhojJzzDH2jHvsyAH1ERLVtmV3/Vt3M3IGKnlCjsmtBX/cwaCC/6WjsmKnJQWKQwTXMin6qfbIxRj/ZcJ7aJDywm2aYTo8s8drnwIByvoM4Ho/LGKmYMcgo1muXF8pNgyUrCdKNRFjDU+C6QHR4rQ7bKf+9VsA58nPY2feS/n5UtknJBT9LlcBBatX3ZDjhzbPRJaIZyYCF7Gcv9jVLO6pcwcRlGsDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FO87xwqxP7d00iPFCh0YkZyeqnOpOG3yddk373tQ6Q=;
 b=Bb7leze9k16t86IMQ0gC8nMae4I0LesG0NeTkrZZ2sYJjqIr/0+/zo6QXlukVV8G8WvpoIehXaplTt006Yzayeg4kyQCoz9gkfw7MsROKZnNO07VT5uuxZy3eXHdJm6v0iVhNkMm5t3gTUbB0uInLAgdoYhsqoskFEHMpt2/AMHjX9hrVQsxTx2+IrI8QsM4IRDEMizHZeH17R8zgHWvwMs8kDv9FQ2u7TQVV6a3DTIusMBWoj5la6Dh5v16VZ+DD/Qh55Yvmv9tzgbu4eofM5y+GPG4DhbR7Sveg+6oSYroVGB0w03NEnG4UxCmCzBuzocCW14Azzy6tnsiJuhmRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FO87xwqxP7d00iPFCh0YkZyeqnOpOG3yddk373tQ6Q=;
 b=cE1KkqkCtgzlkjyX4ZKdGOKLQLyvV99iafO+tqfkSHrBiqwrEc1yfYtmmRSugWCxILzOVgmcnZ0kJ2+al3m5cVgC+fC22Gakq4Jvs32cEJ+2IIUC3SjyoSfGmIEDxdnu3JjfzQFswPSSSm2ZI3x3yphb1r98fM4fz92CQDw41ZWSbPjfrnX2zWw50uu3piZYyrp1+qYOFq0V3Nghrso9+XuJRAPpTB1TvfTTzkuafBXFX7HyRmD8BeQIacWmNLbbu38UivUmLdq+Nsep1TKePOFMMo21GmCPU7byz7afF3WTObD4uraFTSkGkhpt/nuIJ7M7qewwfcubhKj4hPC3sQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DB9PR04MB9497.eurprd04.prod.outlook.com (2603:10a6:10:373::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 18:10:19 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 18:10:19 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v7 1/7] meson: Allow user to override setup command options
Date: Thu, 17 Apr 2025 13:08:28 -0500
Message-ID: <20250417180834.1722588-1-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0147.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::21) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DB9PR04MB9497:EE_
X-MS-Office365-Filtering-Correlation-Id: 96862137-947a-4c83-9d92-08dd7ddb1cf4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dBMWn+LgHubirqfRV2FC7s1C8itQ44szFXYTevCB9XJ9Nj7G3IuV2uCYCirn?=
 =?us-ascii?Q?QEBYxA5XdAK67A2ApxFb/UpjcwGRp0cf3aHlMb70N72qqedBOiIRDDSZZOo5?=
 =?us-ascii?Q?VJ0U27rBOS+OeXfPLcZjWCRTFyDavc7R3vu4BCzCBSK0oGgwbCYLwZj0uPWf?=
 =?us-ascii?Q?7+Q/yCT58WNV+gu6tk+RcXAtfndJ6DISbbjWDdiXByHVdwvuYWoZ9kq5aM2d?=
 =?us-ascii?Q?776t0R1SZE8NSYMMRHzTfWvCd32UdwhujKjLTWujXjiON/WHfLg5LwRmAwYE?=
 =?us-ascii?Q?MRbb+Xz4X2eQ7tRaclQJZrI7myNhxbH3RLGWI6UZ243FViHwdHkWU2+kO3NY?=
 =?us-ascii?Q?2ulITCnN1q9LGMbtr1k8rlOyEWrHsyeVjZZIOzXsdIEB6EJ7SSFZgHoIldvn?=
 =?us-ascii?Q?/cJMSyxH8fuokcF+dwZtQnv+269Ftza2O2CYg/4qd/S+4PxEGxq9lcLjOX9Q?=
 =?us-ascii?Q?FmvqhxHCEMkvD0afKtdpg0Z1a3qAq37w3O1VilPPmvvSv+WrPZQsfDTBlO/3?=
 =?us-ascii?Q?piB4RIMhtPSoxLTGs3yTME09zwdJTyHqiD+VCS7qreuYv2YDxiKiZ4mQMOHL?=
 =?us-ascii?Q?wUSjU6HPJi03ysD7Amu9JHR8bzYPEM2t2G8yfLp14+tJeoshM54PAS0SvdBK?=
 =?us-ascii?Q?45nd3W5B2wP5teZT1k7y5C8l2qchZRxM3v4q6pryMnOo7FC/u1u9bix/Mdnr?=
 =?us-ascii?Q?o29Y1RWymqNesmX87mIHeY7lh78MLFZAigrzRQhUT9nrB5+hCezPyHB8K09J?=
 =?us-ascii?Q?xEOr0z6OWrk9vI4Gi7QlDRJahmz7qSK+tJWUzRvXIHMEQwzatXZ/eJ1MtqK7?=
 =?us-ascii?Q?3vJ8emgp2OUo/wSuTBCGEN/C0dBUvvvdzfh0zsSuEflQlBWxWsLxv/saosML?=
 =?us-ascii?Q?H04p5fz6j8bOhbIqyAahdbPMVzeyGhFyldow0WwyU66CNZntsLkeGXQ7G48c?=
 =?us-ascii?Q?l5WES3iVTHk9Fz7GPDIRGRRmHVvadG/fzqQU359Ho7u5FMHCLi8PyY62EBen?=
 =?us-ascii?Q?D9pUM+hubsGJ4crVm9AsJCoRw8jBj7Gl0chTwokDKMpp8xPlHQxSLnaxovJt?=
 =?us-ascii?Q?R+a/mOk5OS+MFtyk3IGU+/Yn5rbrXBIhPrE01c687E46zDm8DzLaVrivNbfO?=
 =?us-ascii?Q?uzB7H0uw6rVjJMrNV3Mi+AuzERXp1JaI7BhsChw+ZPLpH+4ogY1U50u168jJ?=
 =?us-ascii?Q?++fQ8O7Auy2GTXcTmr4rfFpP+QMckPVKSXzvKH+sfavPzdxnzKO1KPz9DCbo?=
 =?us-ascii?Q?Pt9Ud6s77Ec+QD3lCPAHfbhKVXjs2oGt0B9fz+lUuxwlK57cGSocVgGarwxL?=
 =?us-ascii?Q?mUSuCAbTGTg5ReIYMQaj1XPP7FkF572WpZeqBNdkK3OUSYVRMM58rMGBlvCg?=
 =?us-ascii?Q?vh7i76kQ2mObSk/ODukCyp7aV5qBIkBsNFJGf6KwgvKAcOybo/pJghwdd+2z?=
 =?us-ascii?Q?rIk/DVmxMOVleOGZdHmb3S6636kKNS408OsC3oMnGnjnO0+b0Yi/mw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aamvdNF06k0G7cFtf0JdC3qEtC72RP+/k5F7tXX/butvxOUvqUIYW2I3LFhV?=
 =?us-ascii?Q?7za1B1s/litSQUQY0CwhafvqpXr4w4parVRhl+N7Ht7RW7Q1C4EW+C4ZM8PX?=
 =?us-ascii?Q?CbQ2J7+e0WOon79P/RzonhzjJPzHt+62AT2iGZt9Wds+Ov7NekhfZZkDhyay?=
 =?us-ascii?Q?MuEyOQ6TMM3JHJ2uUInhWGkkm1D9XaZpXeaWO6tNhrXz2CfnWbnyvOTBY6l6?=
 =?us-ascii?Q?hgXX4wD4e6i6BXlZ5TDDOKQUkTi/J6Azgcd0n7xlSBB7uOv55hEJdkxlTFyF?=
 =?us-ascii?Q?mwMUK7eUMAxYYon3nv23br4BX8Pay4WwhVQ4kgqyvoAm/wox/eo4V+2IYtKF?=
 =?us-ascii?Q?tGkZjxOYzKZ6QNlskjWB46DztPP0G+VfO47Y5rfIt6rCC43trmMLyhsxFAGy?=
 =?us-ascii?Q?BDv9Hbad+z3gX1wxQtGtBKlpnP/xzAzzX0wyjUX/uP+eyspsgWKLD+cRTgrD?=
 =?us-ascii?Q?3EZMWQ3CFaplPG9yxhjs2kf54gbguu5pn6f3cOjZw+wm8BhX3q7N9t7w/kvF?=
 =?us-ascii?Q?NWBydafS+7pl/VzJU12KDQfip77qMyZMyvcjfpWieN4IwiLxfYwjLsnxyn1j?=
 =?us-ascii?Q?vyjWgSYUXa71uC1LzF8VPyPvKAU0rfO/2B+0AR3rkTxdXhiKhbqZEytSoJpQ?=
 =?us-ascii?Q?maEChGWJXihsdoOLdvxa54FtfXaPG+riaqAR5OPkLaykPnonQE1l1iwam6id?=
 =?us-ascii?Q?UAHN7lPPpvUZV3uNYjtsm2wBwVOF7W96+59UiQBxYf0BJJnb73LflXC8h74Q?=
 =?us-ascii?Q?b5Za2YAuK65Dm5eqkp5BvzUIV0QV/WqzytCV/2aC/yEEMg52tcCm4J32g3ON?=
 =?us-ascii?Q?A5MmD6oKgIfdE73ZpFQG+YF9NQyjawwnXcO3x25Fn+HCsBSnIV46npTsc6Le?=
 =?us-ascii?Q?sJl2COBkxphEL+W5x1I8Vj6VMHjFRCvIwHe/wl05KluGkgDciLc2e0uMkAp6?=
 =?us-ascii?Q?LAC6OmYRO34QQs8mCpSvk3xPq06LDt6hMlhgToZW3PbcQYNPy9W5n2NiGT+6?=
 =?us-ascii?Q?a3/F9lBCJnNlSxRnYLQqtMI3r1lRG8/ZaiLP5VdVfrssL/UfdWdnep+TenNA?=
 =?us-ascii?Q?9GE6PhT5DdlIEFwgB1Zce4VBIIFICFJ+E6EUI/KfyxbCb+p/Yme9dNmdhoBl?=
 =?us-ascii?Q?GxsMsumaXZsqwIyY+PeMrXK+BmZSnt+Uw0VFLyg4xkGzfivWDN0kYq/8UifI?=
 =?us-ascii?Q?rb7g9ga4nyf/b0Ed7qkPEkCbQYs3lolyCyBnjgfmZX5Sca5LexEoSEIg0+0V?=
 =?us-ascii?Q?51GnfHsdr4V+qNBN70mtv1cRfJQunWkfo39GrLrtida7mT+MRzn9msmGoeGX?=
 =?us-ascii?Q?X2ZDLGvAom5dJdz2KUhzUoWQo33PL6bFmBYY7Id2SXlgDJERtzw6pOWUNaGr?=
 =?us-ascii?Q?4w7Pmd4RYhhc65I0B0dToNFOSdGbd/WKRB8UVd+F4KTZhjMMLn7nIAw7aRZt?=
 =?us-ascii?Q?MtOjJtHr8BfljqEdEiH7RU76eODaQIEfVtu/iPE5JI29FH5wJ4lk9buTr+lK?=
 =?us-ascii?Q?ckvxEh7rAftVKX9KveOxgJeN7aYO2jLppxJbVIkDgTFVqqgKUBrrqmUUByCm?=
 =?us-ascii?Q?BExCeVsQWovmHltBHpvzL2LIN++dycWRkOGzFwx/LjPODPtK5q8ZIGtJv3dG?=
 =?us-ascii?Q?Hg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96862137-947a-4c83-9d92-08dd7ddb1cf4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 18:10:19.6688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: izZ2CeqcuLFVQcYFVxHUz+eFQ6qTU8k+mSYrGJ6nLwr7tPOMXFq/LFIC/3mBEZpHEOu2GUis6CQnbZNUIzaY/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9497
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 18:10:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215108

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


