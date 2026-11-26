Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1156.1795710323678515132
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 08:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=oTUhgl3K;
 spf=pass (domain: est.tech, ip: 52.101.70.30, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMqMqsoSl4avve/NRq9dkOkJ11Up18xgk3AsHGg5y0QKwy/EWLwmt1BqTcFUjLqznwEY1c3bcBgdx/RYHzHndcteapUERvu3mGmJne+0Y5m5bACxMRxm+BRAkaOyIWIuwepvrVBDSg+a5rUK5mdCW1+N2CuyxnLo2y9RxfqwC6STfzB6+bzmi8iHo/WaotDS2gHN55Dc4d4s4gxFQE3ZfzK5awW8Ii7bWBbdWsOhLms41fpaEHv9BDlAdCeIN507BWOHHJ1wr4sJPFPfWqwpOM//KNzbDL9kF0pUjcFjSCXCS4tHbByLyGcukPLrg0MANLk3ToRr/AUNG4+ILHKCXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LW0LIn0c9hVDcgy1mvCsvyYPfdzN5cZJqiiuB0BTNEc=;
 b=EGWiunGK+SqLB6Q3Yw1LP4vm0U5GweKk55/NtOf2fBz3R0w0hcWh6b2IUSxhrcex0y63TaFqGloih3xtixQJVqR9XuPE+ZlurhBOG/+ycYiz2iMQpqMqi4N3orAruUUvKjp3JWQQIypbQ/7749qL+Wsj34iJRZfuChvHnGwIQMzMDLlNVsUknbEyTel6V6OVC0+1VRS3+VdMyJEoEupCMKDhaBvtlP3Y6C01gJT7uERXNsiOdUN6nmsIsd3iPRYyt5ozdfU1ueSvzSlGWJGccwcuB4scAlMw9g3KZlukqW6VEf/viT+/KLu6CRbd1R4fd6HLVsZQ8SWwaWwaTWO4Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LW0LIn0c9hVDcgy1mvCsvyYPfdzN5cZJqiiuB0BTNEc=;
 b=oTUhgl3KKthpv/i9UQrvGzivjmYN6ZvpCWVEzoBaIVK/xTwaaX1rsbhxiGvIxVLSKvqBXglnwv+fCLk2cj0u4RXfyBACqGvlsW+CNFiKu6c6p5J9QFz2nrjiyHQm1B9pD0Dy8YqZwuPOKLOVV+0IsoxMKY0g8oTy8Sh4S8Lx2mSIC+R6IMuQ+D9eporJ6o275s1yi/GaT6bQiFyi5ob/EKvoP/IkkV7eBMtHx3lPzwuDVTjgZfxLSZnS1leCkNAph8p873m8CjH3H6DPBn0rxZ9vxi+W4UUdAAtmQ/WfUQzi89gnstETo6KzyW2/9ukUgr2ot03BygxvvQHkMxZ5LA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB9P189MB1834.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:330::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Thu, 26 Nov
 2026 16:25:20 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 16:25:20 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libpcap: show TESTrun errors in ptest log
Date: Thu, 26 Nov 2026 17:25:15 +0100
Message-ID: <20261126162516.93141-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261126162516.93141-1-jaipaul.cheernam@est.tech>
References: <20261125090627.78976-2-jaipaul.cheernam@est.tech>
 <20261126162516.93141-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0300.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::35) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB9P189MB1834:EE_
X-MS-Office365-Filtering-Correlation-Id: f8335e2d-0488-455a-22ab-08df4bd9dd71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|261022105027099003|261026121527099003|4143699003|11063799006|261022075727099003|56012099006|261021123027099003|261021121427099003|261022115727099003|261028144727099003|261102123227099003|10067099003|261102130727099003|261026140227099003|22082099003|18002099003|261009223027099003|3023799007;
X-Microsoft-Antispam-Message-Info: 0idtFdz/rZl3/I8RfKELF9nIAYJj4ifs9+EQbRK/8rqPwLrbIJs0uAoA3DUzsV8wxPhuBOvBeCx8qKzb3ycg2NXSMkjtWUR015DorTKj1Lm7cIklD3smep2R5vpH0oTOEA/m2gftMaL9VhmvDABKhmaSQYpgf1h347Wk/tUfi9p3kCZ66q+0u7BbwgJ5WAT9ces8buA3fLUalr70lyrUJVjBRjQwyiQVAiK4DFN+WibOZpeSIMJumcsCFlBUHK/x9bkTf9xxfFrGWIPtmpLp9du/zw75+PP5yZRHh1z9q1DcqKxAuJYXN/SKBsoCtAJDbm2v5O6K3jVAaYcie/Ia4Ug8AINAww/TwJTW4Mzg0Z1+OaqeVtMusulk9yAsvwuuMdxisXn9ZGNgPLaQ2LeT7fNEaxEtTwjCtxhzHjuZpsFEsXuGkNoGiY2CwRtCo1rzeGV0VzX8t7T7Fgo8NHUhot3SIghB4f72RnlOWim39x+Etv5ZNks/K69Pm2zdo7Ww5ghUAtgYRPk4lH4ZV/bTJ8SNW0fwCXS/rZ6BoTRlZk50b20XFrdtXgDjjpCVWrnffz1TM93QxMu3pZHIqniilsUdYmL22+688FElF5K7S+pjEyq4iKvFcJKPMN6f/K60QpQ1h9YLCMcpjIC6ORNPo2IpZRDG/oMwkOPpcyV7g2w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(261022105027099003)(261026121527099003)(4143699003)(11063799006)(261022075727099003)(56012099006)(261021123027099003)(261021121427099003)(261022115727099003)(261028144727099003)(261102123227099003)(10067099003)(261102130727099003)(261026140227099003)(22082099003)(18002099003)(261009223027099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9ZkoVF0EF6hqzV6pqB1/KEmik0RArvgUewDwhVQHtBqscs/uZU53S6KJfNWf?=
 =?us-ascii?Q?cTopTZM+Ye7TIuNIG8/rOZnixxnhnpjFrNSjsdJ2JufwcAE0ZhuEEJ123xWz?=
 =?us-ascii?Q?s5j70lRph+IXEoEwSI8N7Uf+31TsKLro+XHWJtoydowXauwUARTOLfuVpYK/?=
 =?us-ascii?Q?FSKdZIqrgNr1oW7P/RtBg0BGWHssUFL+HVp/22dd88S1197LXjdZtgRQtj8l?=
 =?us-ascii?Q?zF01+P6+cMMH8lPNOBTmnrbW1eUnvvESrtoLv9MbIK8BBZcF03YdxUOFqKa1?=
 =?us-ascii?Q?UDrpfEsSNP8fuT51/ulgR/ltp2Y0ctBlIVP/89ayx9h281rJQVH58QaF7jpR?=
 =?us-ascii?Q?BrFlI+KJouxNlTgiCgjScFzWL2v0vdB7NvHS1EHWlp3RyHGefdoouvkyXrEK?=
 =?us-ascii?Q?0ajH0fFTlpFhXm1wxWQbw+VUjgoyHraM9Opz3Cf8E5vetji7ZzSXZr2rAuw6?=
 =?us-ascii?Q?7uuJDC+9t4C6VMc/lP4SaJhDAoAmNWsh/3FWzx48J06aIeeiDw8wkJE6fTAk?=
 =?us-ascii?Q?7H8QQ/djvP2xD+jobSVrWdri6wIPcnxJYWwH2AzdKEwcNG5VR63dW5XlUTVM?=
 =?us-ascii?Q?PGs/eaV7gkFS2J8i/WTi9jMk1zCuoUPOGyF1GUD524fJlPXEvaSotrolE4XT?=
 =?us-ascii?Q?jzAbfzw7NYoMhLY5GjsTac9+/WPGAdAzFMMdlifH3FxrlVa18/ZZr1GEzx5D?=
 =?us-ascii?Q?XkZORz/eG5vj8mwntyuPpu1KdV1Ka3QUpu1DHnHjrHKVlquWxt7f7gD4W15X?=
 =?us-ascii?Q?ukMPJuoAKwM5fLAm7d38+BQfdk/WskgIPAxLhfbX/XYr1Lnsp8LvrWSBlBT3?=
 =?us-ascii?Q?J3QgNWZnOGwLYnFj/C8BiK93eDCLKr/lPV+ppbBCsrHX/H3YPVkuwnTPlKrg?=
 =?us-ascii?Q?Xqu0iAye38MCFW61DeVbc6A3bBtzsIauiKWXyoUJ7W/292OGpetExKcK6g28?=
 =?us-ascii?Q?lFgffgN+ANrRPAo/TMitoz6nr1VTvbIrvY1ZBY/vGDUSWh06z5fJx5f7ludY?=
 =?us-ascii?Q?3xs8yAT7zd/uXM1ch6WcKHcrLaRVXTd5asJDgDJJr0dbEj2IBOwYcwhW0oJD?=
 =?us-ascii?Q?RW84ag4tXsjTZgsPwuc+OV9V6kzG0r1NhbeKBc/BqGsbPeVv0UxBYe7BEKFg?=
 =?us-ascii?Q?PUxkSrZ+lwQukOhg+hfe1h7stNCXH/AWzRWbuhKyw2B2GZAwMnaJCjO2CwQ9?=
 =?us-ascii?Q?Py/anAFLvpHFSQZn7DZ0suTxeN5VDszlu6vFKZVTnH+RxKybP253hoFCph46?=
 =?us-ascii?Q?O6LF3fzr/CF1LaRvE3Iqa+n+l+E+kAK69w7ZVs6YQQLAqyhRNaGj8uNoIOBR?=
 =?us-ascii?Q?i9nKlPU4VmaB4g7UWKG2NV3F/DFO3RnprvlawnVRhM2kSqwHP+5J7TNOz2oW?=
 =?us-ascii?Q?mGiTgQ+bYAihc+haXLNQoKxqe2OsCQDscPdfXLjUcIWKHc2by3J6zG5ZY7V/?=
 =?us-ascii?Q?+FOfPjSQ0SdWScdX0bx3kkZHnqym02sgKoelR7T38ONJmbM77mNb02WTYEFB?=
 =?us-ascii?Q?SepvUtEji+7N74HT7l/2h2Uw+VY8ADKrbxF/AttNiW2V6BlZv0ADy7HqDJ+S?=
 =?us-ascii?Q?fFmEjXqAFKPiKBHK67ei76s5dhpqfIHPXn6ppk3Z1r2rMoeqDNKv2i5FROHh?=
 =?us-ascii?Q?HpIW7yJmqPPRKxVw12jneEijoZlah89FbhT7JDHIZnPMGXEaIKiMPfkLsZk6?=
 =?us-ascii?Q?ihTXTj8+XrifGSR/P+j8S6aX+1rkVNnQnjnIUKXwbtAsFraqMM+2kRdhip4y?=
 =?us-ascii?Q?+8oMP+nurA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f8335e2d-0488-455a-22ab-08df4bd9dd71
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:25:20.6803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nL60W1qfR5yx/UodpSpvMHcTFeRXyDNAxOpsVVaIwu9mdqC6ZA6fPTVDL5agOCcP1Q+qZjPSjLSuGPfH7+jfntnJ8FX8z9ZGH1kCjirHhnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB1834
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 16:25:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251319
Content-Type: text/plain; charset="utf-8"

Replace awk with sed in run-ptest to preserve TESTrun error
output. Report FAIL: libpcap when TESTrun exits non-zero.

For example, with fcodetest (split out of filtertest in 1.11.1)
missing from the image, ptest-runner.log only showed:

  BEGIN: /usr/lib/libpcap/ptest
  DURATION: 0
  END: /usr/lib/libpcap/ptest

and now with change shows:

  BEGIN: /usr/lib/libpcap/ptest
  ERROR: './testprogs/fcodetest -h' exit status was not 0.
  FAIL: libpcap
  DURATION: 1
  END: /usr/lib/libpcap/ptest

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libpcap/files/run-ptest                   | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-connectivity/libpcap/files/run-ptest b/meta/recip=
es-connectivity/libpcap/files/run-ptest
index c4b869d541e..d6c76f52a81 100644
--- a/meta/recipes-connectivity/libpcap/files/run-ptest
+++ b/meta/recipes-connectivity/libpcap/files/run-ptest
@@ -8,18 +8,7 @@ ENUMERATETEST_BIN=3D"./enumeratetest"
 CONFIG_H=3D"../config.h"
 export FILTERTEST_BIN TRANSLATETEST_BIN ENUMERATETEST_BIN CONFIG_H
=20
-./TESTrun --passed --skipped 2>&1 | awk '
-    /^Passed tests:/  { section =3D "PASS"; next }
-    /^Skipped tests:/ { section =3D "SKIP"; next }
-    /^Failed tests:/  { section =3D "FAIL"; next }
-    /^-+$/            { section =3D ""; next }
-    section !=3D "" && /^    / {
-        c =3D index($0, ": ")
-        if (c >=3D 45) {
-            label =3D substr($0, 5, c - 5)
-            sub(/[[:space:]]+$/, "", label)
-            if (label !=3D "")
-                print section ": " label
-        }
-    }
-'
+{ ./TESTrun --passed --skipped 2>&1 || echo "FAIL: libpcap"; } | sed \
+    -e '/^Passed tests:$/,/^$/ s/^    \([^ ][^ ]*\) *: .*/PASS: \1/' \
+    -e '/^Skipped tests:$/,/^$/ s/^    \([^ ][^ ]*\) *: .*/SKIP: \1/' \
+    -e '/^Failed tests:$/,/^INFO: / s/^    \([^ ][^ ]*\) *: .*/FAIL: \1/'
