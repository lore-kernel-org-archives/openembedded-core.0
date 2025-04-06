Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C791BC3601A
	for <webhook@archiver.kernel.org>; Sun,  6 Apr 2025 16:49:52 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.86])
 by mx.groups.io with SMTP id smtpd.web10.28465.1743958183537248794
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Apr 2025 09:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=uMAeW2i2;
 spf=pass (domain: oss.nxp.com, ip: 40.107.105.86, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=STifHbHnz/d1i2vZDn8U9dBlm6CenrhVLat5JMIVnxTKdWJkPbFGlWRL4BLXqfMElI3lkUuv4jolv+ayBO/h8ike2B31ymsG/lzEIrGrjdFNHC9N6YA4qWNvj9JA2dLsrlyq9FU8C9qInGiJbX3E1LUdcIx4zOSZZo4TLSmnDIsyoBiwpWkpDOo4Hij0vDi7IcejPEn38i7IQDBE9gj/l50uEDn1FYWABxM/6iNV2FzdQ/xf2jbbhCnF/NAFpqCkkkfkT9rJkOmbAahXl/r366zYfRYLDye1stjIfgCFUmNFKF4eWj/+rr9hgK8Kekzs+ZwpQXrRxhaWlHgVSfVUqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FO87xwqxP7d00iPFCh0YkZyeqnOpOG3yddk373tQ6Q=;
 b=e6wVjf2tCM45sFW2Tkq3zMza4cS4861C0SQ+mzCoh5DOjCFZuVE/3mKoRR/n0nCGIiIgqmwNE+SiO9OYZT+05s6vZe34Mb08AfDIEsc5gJ7QUgVq+8t5F7Lu/ZOUXsBZ4Mtkcz94uVm7ov4sX07mcpnUAAsL4umh0Bq4gafHZ3JHoVpvQVFyE21FhLtC8whzfwvqCYDoUO1/Or3ixuM/T51Aog9QuHXJYBMcxBcFDTa/ubE//+uKNn+NwGXl4tk5oyd8wQPLSHTW/qoS+j97/+0R7J+09KRBYghOXS2SKIJ8AIHRxkjQdGlwcJ5b+qZj3YbdSvENIXZRqPylJkOKZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FO87xwqxP7d00iPFCh0YkZyeqnOpOG3yddk373tQ6Q=;
 b=uMAeW2i22m/jJXZDTjeL515hHEaNFxUkVfkVwpokNEqWSiLY8VSA0UwyEjCHdZsS1fAoBHJ3y0DkqhDNuibif4CRWn2mcpcyhOkGypjCy1WjLM6CKIpI/zGClnkoouXtYI9S2dF7UixhcaNz7ChF8Kt28i+YpJiJ9p15j3sMVwULcSXF16Y6rqUWdMUIMiEKztU7el8b30i8BPn8HHALvhprbhK976OXweOzdk2RmYPlapBlzG/hubyQVgAbvDtGHAqzlYGebGIi6a4G/e9h7/CorI13va8cKgGzA2HUBIYeLhMxv2X6OH9kdjepdM8/boo7FeyHg6nTDteQWq84zQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DB9PR04MB8409.eurprd04.prod.outlook.com (2603:10a6:10:244::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Sun, 6 Apr
 2025 16:49:39 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8606.029; Sun, 6 Apr 2025
 16:49:39 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v4 5/5] meson: Allow user to override setup command options
Date: Sun,  6 Apr 2025 11:49:09 -0500
Message-ID: <20250406164909.270945-5-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250406164909.270945-1-tom.hochstein@oss.nxp.com>
References: <20250406164909.270945-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::34) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DB9PR04MB8409:EE_
X-MS-Office365-Filtering-Correlation-Id: 75acc9ca-e854-4e08-4067-08dd752b056f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3DZVTTOEaMucYZkPsdSP71Jv3y0EZ6VQ8G/WBTkFbRUtWutsyC4zb6n8/v64?=
 =?us-ascii?Q?rcQGb+nLqIJnDEbfoEeS7GHZW8AfZ2hqUP6TPJQ0mg6Uv7IB/+p+vuxiV/6e?=
 =?us-ascii?Q?PW/JZJbNQdf8lO/Uit06mnys18p+pRnYLMp8n2UsXgVe0LZpNrdaksMP+VlG?=
 =?us-ascii?Q?JnSOVr/2PMO0AGYSaEZHOWbb4hSp5OPAyMX6N0hsJm5z1U2nSXRTjLanqzZo?=
 =?us-ascii?Q?IGP2qFPTkC9beJca5dmR/6vZCTGckxEFVgvwb3JDfe7uhRRnimt3z0taZEES?=
 =?us-ascii?Q?Rwb/CRNmY3YmHa0xDt0ZL5T+YI7sVCBJP6A3G8BTq6Q2EauW8nXcAyl93xm6?=
 =?us-ascii?Q?38lnXy1jrqJcj0rKOFIwGiJEk9/IJDVFiOD4wfWNRqfZOoVyBhw0wvCCy/i+?=
 =?us-ascii?Q?tkrGERxEMJTrlEmN7tjx6sqaL4+Yv457B1NMK5EGZUfOVTwQIiYx74++oJnz?=
 =?us-ascii?Q?8JtxVs5JbN4MuPweBjATMOLUMbHNACNZfUshx7zoB/jpqAEe/1sCh3Oprg4m?=
 =?us-ascii?Q?6EEnetUDI23+KJxdCuM30+2LkBbXuT6A1cu88Ii4xc2CXip1Pz3f+NuE0/2q?=
 =?us-ascii?Q?5v4yki9nTK1ciiE54BOWsqX6JG5wFZVfSmEobubw7KBSJb12yRhw0OLsVdtH?=
 =?us-ascii?Q?ngmwdTecwxieJ/zJG2Tq0wk64nLKgja8zZFZVei6kV2kY07EtpI9NtkTd29A?=
 =?us-ascii?Q?NlhQFI3hAEFK8nmih5QQuU1cNrcW9EgtJ8HursYeBgLRlNTVJqxwTkHK7dmY?=
 =?us-ascii?Q?sxKUN7dYNBba4RcWF5TFeiiu1xr+5axugI/bMpbGW9B5sGVLeIIgNK8/kelR?=
 =?us-ascii?Q?H9RyKU9RNxJizknT2NvIkTe+afFzwXsgIBZmV8PzDkj3ZYV/88xtUp76PQBJ?=
 =?us-ascii?Q?yN8t9WaxWfDHEdpY/WchZsq3m41p//NXhtF9MrSBM3KHi1LmWGf0MlHT8JMr?=
 =?us-ascii?Q?FluDFOPQyVT5T0XTOqS0A5lvvbkon2s3qJ0uTRSrTwFtGXdmc0FImEIzm8yO?=
 =?us-ascii?Q?VWANJooTqsVADcziSIbG+5cUKpjWy2XFuGnugP1EaB7mYOCUoWe+Zo/FV0ma?=
 =?us-ascii?Q?1VJ+CmELdhhw3Ma4HpRCAViRquRHYVc0xxQZEhRbbi2eMEzEbPzdbipjHyCf?=
 =?us-ascii?Q?roi3XnM58J3tr1bhZJobtsEn5si8H7feLanOE2PqR+hO8gS5yEwPgTFQWrPm?=
 =?us-ascii?Q?yq7ANrrbFMGUS7ou5vvt1GXw2Sp0IosKevqbP56Mkd9hQqeGFl8193giia5t?=
 =?us-ascii?Q?lz4n3vL/kug6aAe/XmlqwLAB/xBmP+73W8BYBZmQo7u1gMqq7soitjxFY4vs?=
 =?us-ascii?Q?5oOzlh+AuGQhzuriCwz2gVS1VDDJGAuF2fAESEtDE5Rl6/Ji7CrkgHEHoexJ?=
 =?us-ascii?Q?oMkjB5ez4wY6Y9hMtg/leMWqfcYTW34Mk1cjaQ/4GwpYzTu8g4szJDlViRr3?=
 =?us-ascii?Q?cz/mmdjC5ClorCYX1ac6i3pBOkU8wBagUVx7xPj8Qkmmzd+LFwpHPOkmmmFQ?=
 =?us-ascii?Q?4ppMlenK/nwgLfU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7DYfU62osJZOP2vP7fRro/WkR5BXbVrnaljm+uZZqBmiDVnfsxvhXVGQmI7d?=
 =?us-ascii?Q?/Kq/YCNCOIgCfrJME0UqQbKfrx7VOy5Vpfx29+1SGQVemdt0owSfRtUdZetJ?=
 =?us-ascii?Q?fq+mRWgSCDhH295AcyVxSk6ouKY/PN2qy6Wl2UHwbDJIJGsSXLJOwXNWqbv5?=
 =?us-ascii?Q?fNyYbq4JnBBSCBiV1o96GCubaqKuplQWfqZ+ii1zsT8wTzy3GqXQNDLzoXBQ?=
 =?us-ascii?Q?vtjZEMx9sddeWA8eRC7EcfdV52H8+DQtm3aZhXjrQAMcQr3acz+1F9BxrH/w?=
 =?us-ascii?Q?xBHjy1eRwY1p+DboojEsjJlVgJDC0y6UinjVNHl2pN4myHUbcmgh5iblSIv8?=
 =?us-ascii?Q?LL2FF49fPCneEYyXnjrfkADC4sSNk7ufHSZgz73xmhK7kxYKeJK66yRgegFH?=
 =?us-ascii?Q?mwj5rLxb5fZ3cU7B2PaX03rPtmBsg3aVdFl4JBXBzJG2WHRjHsCCXN1XV8Sh?=
 =?us-ascii?Q?4IvcuJYc1W9nJUy+km+/yxQR3ZDMLSubDWaczvFu5YsmwdCpZfIVeMN4NBA6?=
 =?us-ascii?Q?wwgLEowza37gLakyL2NNXt/MV/+z2/L1IkksBdglVMJwNu+OKhewlIEFYmV9?=
 =?us-ascii?Q?aYHcajH7b3pTWf9UbQCGy5xKMfHQFnKsUR/IA9inqHzFQdXqAFPtDzHMG02c?=
 =?us-ascii?Q?p7il1JeoiKAMMHuu9WZrqHTSyJHICvYjDeci8JDRW0R4jT0amkXOxsT9H9dY?=
 =?us-ascii?Q?/q3VC1Cd737XpcBtSo/DEMqajsreNfpOqeaiy3FY1ex5qh9C8v47PUUyV/yi?=
 =?us-ascii?Q?UctMGnftwJoUXgxDU+QdoP9RaTgx4bBgbIipBP4TkD3nm8wnMkDVgD/dHjIY?=
 =?us-ascii?Q?NXAW8pus+H98NkpgDU5d/Cc4bqL3oPp8CUWkyk+uXyr8hJqZ1N3X8fcxz01n?=
 =?us-ascii?Q?hyFSmlCuUJQYP1T7Zl8LwAC1lxwaVETJ6Xq1DCSKhxuNqLZnSJIPTdS1nKh8?=
 =?us-ascii?Q?rKeUVi9fb1WcdabC+pQIPQQT+4UQicQGiCvEQVQUUCsLah+PsLop6nVFJAM0?=
 =?us-ascii?Q?4LeAShk8vZe1TvuqKtMVL5/nKkvGsMQdfnlaU1VtCIDg9A5/Ps+z8YuC6I0e?=
 =?us-ascii?Q?7+u6PK/2I76psg53ExvVtaUkmqgCjDR0beQacl4PJIjxLwXU6Is8JoVPXJnM?=
 =?us-ascii?Q?+vMI1BsqtqsJh6TGyd/lA2JdIL58v/12kdOdo3pm6sJ8b6xuXDAKPpVm8Wrp?=
 =?us-ascii?Q?LSoZBz0BD0xTN52gHIchexHMVFOR55ZydIoEw7beQJzJkB0lS//5Q0iNAs22?=
 =?us-ascii?Q?z3T9l8e+nkvGUxaxnhfXpLnhPEg9z/PQnEZe2MOTwoJKghf2AKHa8EJYq5rh?=
 =?us-ascii?Q?z7MyztsjgW/IC32d0HIEcYcK5+zTR4/rG8UNc2JLrDS802J/eSJHlQCQLmbs?=
 =?us-ascii?Q?Y3mQlVJ5ePMd24qUDkQtnzW3s0K1dsvdhdGfrPue880fA5s/8BT6lE31RzV7?=
 =?us-ascii?Q?83RYM5Ff5oatJePIE5lx1KI4P+fcCA3VitI5U7laXfR84e1mVWAozVLvDeFN?=
 =?us-ascii?Q?ODH3UMVa4HRULvI4apGAouhSHmkswWhb7IGZa/Z5aJ049AwS5UZSw7jMZACP?=
 =?us-ascii?Q?QDQEsbv5CFHV5TDqXlA5ayh6GTXO+PzG+0+z9rnX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75acc9ca-e854-4e08-4067-08dd752b056f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2025 16:49:39.3098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XsL2u900sBVa6kCUrv6MUGkpn/uUvPxG1WcIWcTwQMF+hh35qUiQDacfzq924nSgExmtxjow6ZhswZzxoGUy4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8409
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Apr 2025 16:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214386

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


