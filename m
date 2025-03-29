Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6EAFC36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 18:09:17 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.3])
 by mx.groups.io with SMTP id smtpd.web10.15946.1743271751020567932
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 11:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=Ha8n+yWf;
 spf=pass (domain: oss.nxp.com, ip: 40.107.130.3, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGVElHPWQj6MdiQ2oxi37TjzCV09i6dajXMAdLGDqkOZCLu2JmZPNHUpPBV97TgFRX9hgtYovBSfAzaFoSZfzTu1hlWONc3C1EOnEgoKch5s4Kzuw4WqXiE03CQKcVwP+M7vQr0lqaTLr5tPCdJrkB5s/s7v7zmRGUkr60i4d2k2crturM5g39dwm6ti+xpE58RR0XsHVXfZQOGnASKSH7HHBcIeLc8kJyUX60MPKFh6BSHvvqDYb6fxuib+aC3h6KmUsxVjlxEeWFOCZN4UpFe7flistdKBcP63GpWCfmmy1HWB19hA7cDtCWvVRSOgTfNPbJISkS6KbbrsH13uSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FO87xwqxP7d00iPFCh0YkZyeqnOpOG3yddk373tQ6Q=;
 b=REWMS/boWAphtciEyCufDadgC41Yp3rXc0YbZUWKs0eddHcZMyjnfxhwv5mMjmyUhQaOmMuyqyfPY+qc56qTpeE9BBSoZ3vyRZDqDLjl7nhj6vn8Cept7CRRywt7jnmRubY5JZhIWisuhCrZMs9AyRC5anG1S2Q7OHdtI44YEwrDMU/cQczx6qfaTrp9Vobe8jkCpSdb3rtXCkaXJUPw5ZYWm4THyctND59Rjld3khc0YKMSwIWOjDRptu8ye9n9URXTKBpuJxYnkoFxnA9qAB/I3Fm/ZlC+xc9t0QWowKMhrciJ4hTwzViDol/VUx+3ylBTm913bs8JBWmIYjH8NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FO87xwqxP7d00iPFCh0YkZyeqnOpOG3yddk373tQ6Q=;
 b=Ha8n+yWfnQrwOEg1k2NCA3iYCW/NEgAIEXkoZP7izcRTYHq1J1d02xXmvFDi/m7ewir98mHLeswnInJTFx9nJbhTEFGXraa6Vt+oBj4RMiOEw74cQLekzsf7C4Zdo894yH5NXBwwczpH79nk7Va7f9h9bVAwKjt6Mv8olnth7kt8JYPBk4tipSZUxJKyz7OmqVhIdLHSnCo3ucWDGJpd8FvpEwZVNxk6BgQD02N3WN3DCGuzKx1yPmG3QU4YHujf6REYH9sUTNMBASRCeoRVkKPLv05kINgMEAWf4FLc1gJg4rABAY+Qqk0SzZIAR2vKLKWKr17XH08sJ6GmnonXRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU0PR04MB9394.eurprd04.prod.outlook.com (2603:10a6:10:359::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Sat, 29 Mar
 2025 18:09:11 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8534.048; Sat, 29 Mar 2025
 18:09:11 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v3 4/4] meson: Allow user to override setup command options
Date: Sat, 29 Mar 2025 13:08:53 -0500
Message-ID: <20250329180853.1057381-4-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250329180853.1057381-1-tom.hochstein@oss.nxp.com>
References: <20250329180853.1057381-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::16) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DU0PR04MB9394:EE_
X-MS-Office365-Filtering-Correlation-Id: 65a52d50-44e3-4dd8-b496-08dd6eecceb4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GoF+jJD5NHOnceHF8vGM2wp3SCBui3XyW1n91CI11n8gdrVrsTmtpDv5xR9L?=
 =?us-ascii?Q?bm0pEOE3/I68aMo0fTspvgnOk/bxsiWLj9mhN8A4dEaLjyVBFHt/jgVjbhMk?=
 =?us-ascii?Q?0O04JVpRiCs3caodBqHhj94em+WC6HkBZf63hxfWXZa7HWl1t6QHoiE7e3OO?=
 =?us-ascii?Q?XeiSNA20vih6suMinmP5vz/Fnv0M8vUcy0lzXUNG14LeQLCXX47ZB2aODShQ?=
 =?us-ascii?Q?A88Hgrm8IOy1JyuSQTuXGNAe2+QP7qORgBqEixx0UcN6oSzofXzobz70WzdC?=
 =?us-ascii?Q?2kxmsbezkoHBPQMQz0bp8rcrCp65hOnwfVc+XvqbkYHZ44OiCtSH0yekt3af?=
 =?us-ascii?Q?6Oxf8Ldz0GVlpVOyt89w17wPP89BbGvSqf1j02+9Ij4CCDGf5I66VyBDiMnq?=
 =?us-ascii?Q?GyDapTM9HSaWJK+oJ0dCC8hE7OpVPUJeFufeppm0pDDrGatiUDOr/GxdReD6?=
 =?us-ascii?Q?xbAEEmUhI8vuJ+iHGMs/nOumwLuvEIFoBNXgWpF6i+D3JVgNHbcFUACp8KbM?=
 =?us-ascii?Q?Po3DvXtFnUNtRHVE6ji9Pa6s+7HgLrgX11MKSSvmj41fXJBE7idWsYb2EWJ9?=
 =?us-ascii?Q?otPuLz3DwmI0k848d+mBk51sX9KSZuSO3cx57ycDyrC9H0WpquY4KqbRDzaz?=
 =?us-ascii?Q?Du4uQwcZNsC0DBNUo1uYednkBw6nd8xlmi8mov3y+V7F+0US6K7Qsmn1r5fF?=
 =?us-ascii?Q?BC2keOYBJsMv6kyr+bSqrDeIsZh9Ck2GkbLyTUH4Lh9EqXWo+EwvnnfNBi9Q?=
 =?us-ascii?Q?Udr6twxB0Fu94pgNXygIs62PYC0KMy6mmNfhsxVW7shv9a6AwhHFDVC+/4Ko?=
 =?us-ascii?Q?kHWAfqVdday1IfuRP6q1ky12zxbhU/raOxiLcl6MZGMfUeA/5GNRPjxPp/nh?=
 =?us-ascii?Q?KwJBdWLKdkcONgaGMO2/otCfFNSxalAkrZQSlR8c7XgAAKuXvEKvmqAmLhAS?=
 =?us-ascii?Q?wSNvZMkFstEo+e6ropLJtnBllsHRvXXBj/wGmjaqREg+Hz05axPhCZ1211gX?=
 =?us-ascii?Q?GqIwqpLazzWjbA5AzMpLv/iLRj8+5ghlF/KLC8IiBuOFpWB53oWQEJJP7Qkf?=
 =?us-ascii?Q?3x/XhKx4XNF6OcJYNERHuD12YVpDfwhEJZaRm8+W3DQAUfeeyC9NqJTpbHJd?=
 =?us-ascii?Q?THgSFGv2KPP7nAkkxT3WEA8RhVX6XqMgtQ51vjA4PMiaV3Kg3IbDG8SrHn9G?=
 =?us-ascii?Q?01W+fUDmToouY6YOu/9cECdc7khmRW640JjlcH0UHP0Wph60L99KzLtWWm0C?=
 =?us-ascii?Q?b+0z8lV+nNkSJJsmH09t9AbnzIQEq0SKSvid22+cggMjiedKau7drcybqC5e?=
 =?us-ascii?Q?A7yhiNkF/CwpP0SHkT36ar/SxuDlr9XSrFM7l9rEttgUziNFUh7tlJ1VXX7P?=
 =?us-ascii?Q?1RMfsZ7ltydLkqOaZFjisPofcQolM3YsNAhpTgwH1Xh2xGxatJeoqijAH6wp?=
 =?us-ascii?Q?re5oNvrwMoLk8Ie5GamPDeS56IiDPPVP?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9pL0F4gwwXv/3oLo9ywvcqOFEbgdeeIXQxuGxz+WltPlciMW1RexX83ZqB0y?=
 =?us-ascii?Q?LBV3FJHwScVpGLHlcf3TNRwX3aSKlwck8/Ag10keRMQdF81MwDHmE0uXtZXO?=
 =?us-ascii?Q?jOL+uqrPbEvZk08jansvMh6O/DhkEsMlIxkanbwtTD8RIEW4fjgj9EzqEbXK?=
 =?us-ascii?Q?VDgceB1lWbmTIInwZGb6Vbx+AbtFxW+t6l1RDVpvcPGFI6Tu9wdtrGQazvXI?=
 =?us-ascii?Q?BgIP8gvL7EkMJU9V3rE6bqFk/0TyhH5jAydTfpRFaz3CrvyP/RzeqFLhaLtS?=
 =?us-ascii?Q?PDFNjc/O5bwsJy5slaZbroTCkafEub1SOWvF0d0OnnWqViHN4ITJjhoU+VCW?=
 =?us-ascii?Q?Afb3x5faRLn03sQDiKp5ampSF34QD5ZnI7K2725IY8sseFUbs8ytGQRuzxXC?=
 =?us-ascii?Q?o/WTuxJZ67S8QOMFOT+JabUevhLnU8mvT3gQWuIqiCGo8fjChqLJtgK7WRhj?=
 =?us-ascii?Q?lzLZOjayaIWxtePeLHHRX3PXgDKZpbX/fhUpGpp/ByrAMaWhOb/jYOfLba6e?=
 =?us-ascii?Q?UsdOvc4DbdbjTHqE123TQvW6FToHWOwbni28//LJ2SZbFridRh6XI61YQi6V?=
 =?us-ascii?Q?czgRG70gqbkXV16mDrTlcO3rcX+K1AopVxNNmCvdZL7W9pbbFutTsDfb8TaO?=
 =?us-ascii?Q?a2nhiCCS95VxSWo3OgR/y068uuYAsnVi35gRPOKJT7vXuIMdBBNvOJGrwhB1?=
 =?us-ascii?Q?vGfExzVe7zUM+lPNdkNJqBF17rggR8p7CmwzOwG5du3J2IHSLlNt5widASxf?=
 =?us-ascii?Q?IazJHDylicHt69V9I80Yzm0WV5SHRtHRQDcLJt7jdX114IrMO5BHkpFJOktL?=
 =?us-ascii?Q?0AwnbSOyVpoKIT4BNYGd+A5yOOZ/Wnq4syvw1jAeaUpBTYLSZHgW936qoEST?=
 =?us-ascii?Q?B3GwUlmaxsSHvjhPtH8aEHcJ4du5uI+eeVGnHUbf9ZzWsl72oVMpHCxczGMJ?=
 =?us-ascii?Q?kG3YWF+Lvsm8/Z8G0U6rJHcFmOApTgam4S/58I3LiQ+3gbjEucbbTKsBjX1V?=
 =?us-ascii?Q?qJP+xCatErRdPRzFTIwvblfdaB4r2Krxvx/HfRogLnANpe+oZTp+VAhQ7dfS?=
 =?us-ascii?Q?Mn24gT8fJbQVdTWayGzHH5Mx4EyWdirkA/0UW8ZCfsdZ2F1lF0bkqwvpq9ei?=
 =?us-ascii?Q?yL0vokaRo3zAnMwgjhFk1rcryPYx4efQ5Vqk9NL1CAvjapvUPYB0j0cptVcZ?=
 =?us-ascii?Q?XEusSDbrZ6rqgNIPVapdFsR/zgqf+/9tFXZtrjYmbYLaCILwSYVxfxRoZ5wF?=
 =?us-ascii?Q?Ek7AHKw4lt2C6thn+5ewiCNY/2J3pKOVTwjH0H8azzFO4gBPDPz0ekfoISLN?=
 =?us-ascii?Q?eSqiyBmZVmZnsDQqZu3qm5Js2tYFHmcMnucx85Wi3JNPdqVk9ptAgKpsYJ3g?=
 =?us-ascii?Q?bRNBpBP4yrQm173CnuS+SM2jAileKCeNd0GJxmwR3D9e96iNDyKUuXCl9ViP?=
 =?us-ascii?Q?rq7OhdGMOzzacImmcmyRtfsbj9U5oHI/Dcrwuj7KN/jS7dRzEkOItIZMFPND?=
 =?us-ascii?Q?qx0WXr8ZFLik0gXUUkWkQE+awmPLkKIQQOSLwU+WvajtmiB95Dl/6J/w1RTq?=
 =?us-ascii?Q?JlHYxA2HrHxNmMWSya5P7iJIS5x5ANgTf1yLlJ49?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a52d50-44e3-4dd8-b496-08dd6eecceb4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 18:09:11.7784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iBU3hKfk6kSZ4pGCNElJV6Y+uxqpHypvfXb274ndn52hsJcuHNVg732nDQO67AqLU5nVU9KpEdYoa7iG7BO+sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9394
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 18:09:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213892

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


