Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12340.1793625396312327579
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 05:16:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=vlD436L2;
 spf=pass (domain: est.tech, ip: 52.101.83.32, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pMyuPaS8XHFx6lGyiagejNjiwySLENIazU5IWyI1+hbO9F5B5DTn4COuZ5WpMVeCaGTGp2f5tAefCz83tWohBO6DD0P9GpCyhyC0+GMrRRKimEj75/JQgQ5KENBOKHTT4eN0CZQoHS3OUkuXn26yCCm0IuIGT1FhaUUwmPAGWQIRtibvv7jcna9KPNsPBWHLmB5uecokYowZkB7MNYlEhQhrTPBNm6sWlAdIXjgNCkztO7bIfJseIN9utGxCmwp+SJrvTndA8XqjIq4tw56H3B51Ca1wnHJGp5P8ZestbQdWtoEM3dJXtmXp1VcUhwwt7RPX1wozGSvCviPy4UQIGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsMmLwvc1PEqHrwK+GVZlwnFxaJld4agBbAXkBkdTo4=;
 b=RcTTIi5oa4aD3qDADA7YnQOaMxxaltqGLG5m/8Iici0mRVWwe5rfQ00qjUkbd4yeyc3zbr/CmnFIHxbMotntshW2yVViyxYoU7l7jOAJtYqE3WJe/eSGk9EeYcOfmTXng+ADPv/qOtc5Qf8PW+E76xPZjvk/kPgc1IdAKnySZKgRdrBdwiWkuF9C++9bInwuUOn/FhaNiUjKbQ8+xHS1yAG8Y4GPPka9lq7iOYj7a0XBWaq8fCbwAYi9LDdwER2Ytd1U3JKIIw8LoojEzKTlBToSfPZM0NWrxo+3BYo0LOI8BWgdNWO0lvmuFJZBwxHOCRFKh8EN1aGwn2ibd1BzGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsMmLwvc1PEqHrwK+GVZlwnFxaJld4agBbAXkBkdTo4=;
 b=vlD436L2K2alefb/GOFHZVxAQVNDKFCpbY6GPd/h2TNY3VfJECPHuWw1t0fH0n+3T9DJyMCqf8js9m83v9ONcVExdGPnBJHLEjEBiOAsIuVBOCoVELjPx1aoyWZAjCNe1u/LyYBU6CuIgyLYkeZFijDfYyPX04P9Uko+mb0i8inWE5WBaeB5X24yLMbyHDPILhHFq6sqFM6+TG2rPnTYmw9DUEg3UviUNold3GVQXHhuaky5ZLrXG2SyIxcOG/K77p0SaOTaBt/00x4r9DyjQw6kYjPxTuARsiOeQSl66m7Evv05flw4/4vGdxZVhBKhFzfydZd/jbqEmfDmaCz+5Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AM7P189MB1044.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 13:16:31 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 13:16:31 +0000
From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] curl: fix CVE-2026-92389
Date: Mon,  2 Nov 2026 14:16:28 +0100
Message-ID: <20261102131628.302769-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7P194CA0021.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::27) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
Return-Path: adarsh.jagadish.kamini@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AM7P189MB1044:EE_
X-MS-Office365-Filtering-Correlation-Id: fcf48445-1449-4dad-ca7f-08df38e382c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|260925022911599003|260925021311599003|260925021911599003|18002099003|56012099006|10067099003|13003099007|261009223027099003|261022115727099003|261022113327099003|261022105027099003|261021133027099003|261021135927099003|261021130227099003|261021123027099003|261021121427099003|261022075727099003|11063799006|261026130827099003|261028144727099003|261026135527099003|261026140227099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: MjNdkLhTYcv45EBrWo8H+Vff5EtPbcVVdV9L8ApMOmjvs9q6Jc1IbTBvHc6fzmj3p/gyZ+enOpN8eFCP21uBkdOVcs0Ty+oy0adOP8nV2K9flBxmGFBY+jm299RxhBp619Za0jZtYgGOkI9cSfAb60YGxQbusxJ1lzpqd3oRQAHa/kTNsadjJigIynosWiYbMVpfX3FX1jnsB548CpKFqsf78cIf+CfqnvfrG+v6RnJUvBD0Qe3Lq/VVd94H/p0OIPP4GiRXY4UGAmd+3OkF7T4xQk/J7Cxc1Uq++dH5GsRxAOr0xdgkLgr1FzLd2slOw2anQo3I/oHmfL5emASNtRQZ2GIJqO3SKXZBNgFkZT674wQH0mGL+ugZIA0J48vZisAToTepabQ10bkxeJ7umj8aWtnBWYZRtzlwnQGRJr5DpYmjxmCiO4DWIVrRctwcTj9U4m+uZyvfHYvkOeM/uYDjnL1Ici2bL42klg79cn+J5X1N6/GwvtffzBoEuOCbMN3IeSF3mLqSKQPP6GCkPeBLQ8IAPj8GZ+f9Td9yex78pcusRR7/gF5yy0g7KS29xbllXF8q6YFKFNKbII3WlTByAdgiien8Iy2gMz9R0VzxZ7jkal43VpjaMT+CNTum
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(260925022911599003)(260925021311599003)(260925021911599003)(18002099003)(56012099006)(10067099003)(13003099007)(261009223027099003)(261022115727099003)(261022113327099003)(261022105027099003)(261021133027099003)(261021135927099003)(261021130227099003)(261021123027099003)(261021121427099003)(261022075727099003)(11063799006)(261026130827099003)(261028144727099003)(261026135527099003)(261026140227099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0XwSU8tqG8Tmpbf/bWa/pmr22BDpMd1mavgbdM98NVU78jVHbwHOgqzFoqCF?=
 =?us-ascii?Q?35sxZeI4by/khkiBoAdhVXVSEqvFGX6xIdLoHXn1aX3npzzckaNqLkH9VykL?=
 =?us-ascii?Q?hv93j84m1Je+Z/nFQze3nw65+Np7PGVbAnlojMsFfTXCG4JlP1K8AIhDLLZP?=
 =?us-ascii?Q?8zAVU5ILyOAqlOmsNz4H4BDOw52u3/R/xcgOjI9DZDZPCeJIpP49nssJo2Zx?=
 =?us-ascii?Q?VzhuoOJ1MldZHxh0E5c3Ur8YCKgWSAwI6XzwVVPf9BJ9NHmXpEe4GGeS9g2R?=
 =?us-ascii?Q?+5EALo6PrHd1sx0U6upi/POPI0Qb8E/2T8ngPyF6RWfvLfFMZ8t5US1uQD0B?=
 =?us-ascii?Q?TsbntjG70MWtAYPQKDJjI+d8LYGGQ8odiTh+NxMiCU37gVFYI3iSq3nk+jcF?=
 =?us-ascii?Q?E11Efo/h85fIo/jOwO+ilhZLPBdMWG5kKtjk43NWGo89ZcXP1JuiI+Suf1qG?=
 =?us-ascii?Q?joUjGv1mfGvthOPmQXTjrBZX0YE8Ff8psfNfzmtYnBa4yyP+gq7zBw4tz3eA?=
 =?us-ascii?Q?K/36bFPwZ2JZ/3KTUgANDV4ARPCM/cmClqFAh+uA7YoSn63fQRbEncuUtfPo?=
 =?us-ascii?Q?tIt1mVW2UIuKlAFlocCyAJxjBEjXvX7ohEoI3L+U3HISXYXSRlcuIgBGWk3G?=
 =?us-ascii?Q?6QUiIkPfZvnb5HfWcXkaHf7Bm29hSXFxNw9pyB40cEEiSZeUA4SnfQwmFqT4?=
 =?us-ascii?Q?jjznwXwEwCLRfLwMDqeUuw6FwLr7gR8x+IR18YahCvf3j3CwjQpQzkCEd5XT?=
 =?us-ascii?Q?5XEh7i3/I/pAV7DNW1SRHre8Vp+N5Nmng6ZeugNz6iQUsRlky6/95iKAR4PX?=
 =?us-ascii?Q?yaWNHtEx0iOOxb3lUFIIsFeV5sPYQU5sShau4UgghBUNu5Bt7KPmnptb887J?=
 =?us-ascii?Q?++AhVGEkbatHLDkdaVxml9A47w2rnkgdblFzYlbK+tbpvNYtQAQDMorAPVtl?=
 =?us-ascii?Q?jhVs8h+uI6YYIBSQClp8kVRhi0+kPtDqHqviIRNCcL+FJ05bJ5oRFgRXYRqO?=
 =?us-ascii?Q?/y0F5mVuV9aUEIXsQdvoLOAdVB8M1Hc+x2iHMllv/0HPfdiyfxzI9NQkqu0q?=
 =?us-ascii?Q?08xWjT1hUEvwSiP/a7U/+WnrgfgFmwvgme4XJPRYK7mhUBhp+oTh/KrZjx30?=
 =?us-ascii?Q?4A5joznfTh04EhzmAwT7Q/87omjrv678YE2ZxUOjcWCEqPmxSPnZlfQxYycn?=
 =?us-ascii?Q?mrKtJwUlEjOCgCe9jnDlELATWAkD7/cNDSvkGahyLWCMgFx5BzQ3bh400tYV?=
 =?us-ascii?Q?HaSlfADeyIB3AwQfzMsDW3yxOIKNhX6Qacx9HeJoifUOUJmZF8bMUhmXkx2e?=
 =?us-ascii?Q?SsN6Nf5yILK+dKJ+gsL34U/FM9LHhJHUGPjAtLrCohOnV7eap/3gZJ4q4VbQ?=
 =?us-ascii?Q?LuyV1ONmF3SZe47ZJWbQ4S9Eb21llnVHc4k7GXu5ROFyPCaXRsTrEZ6s1bm8?=
 =?us-ascii?Q?IMp6jO7KDRiICs3J0wYOqI+RCurmlpuX2Y35pT+jQBUa2gx3V0Hmskat6t/l?=
 =?us-ascii?Q?9cjZYnysu4RK5CwKUUtAMB1JPoJQcT/hvOx/nizsnCDEvqc8OY6rTdPfxXnQ?=
 =?us-ascii?Q?4A6u6uIGXEhjHzQpRvaEHDEKXj58DfHkIFP4hdeEOoGRIbUrGw+TstvtHbOk?=
 =?us-ascii?Q?z8xbOGgXbrqFpv2+9pD9dI+mK5blH3hLkvNi+ZmcksuwKObxCLzftN4v0pJ1?=
 =?us-ascii?Q?Yyhau7Q4+OZMWZbtZ0+16L5/gjLrCGqbjLQrU1xYHlmboQGq5JcunkEqkj6D?=
 =?us-ascii?Q?vwnjvje3hL6t7HuQsgHOIgcGmmGcEkM=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf48445-1449-4dad-ca7f-08df38e382c1
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 13:16:31.3725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJnT6SLCE1g/GYRYpJv7lsq4Cl9OaxnFFFBJSwjFazHA66lVLqTWYNqHdQMeAXIGTtGuQxH0psULFe7wi0ksIBy6VkO0LCmyyW7OG3ksJQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB1044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 13:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249205
Content-Type: text/plain; charset="utf-8"

Backport patch to fix CVE-2026-92389.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-92389

Upstream fix:
  https://github.com/curl/curl/commit/63dd390fab905a239a97e270

Tested with ptest:
Before: PASSED: 857, FAILED: 0, SKIPPED: 0, ABORTED: 0
After: PASSED: 857, FAILED: 0, SKIPPED: 0, ABORTED: 0

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../curl/curl/CVE-2026-92389.patch            | 60 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92389.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-92389.patch b/meta/rec=
ipes-support/curl/curl/CVE-2026-92389.patch
new file mode 100644
index 0000000000..387cca9ee1
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92389.patch
@@ -0,0 +1,60 @@
+From a1705881527f7ee59606a61c4ba52e0737655571 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 16 Sep 2026 23:46:44 +0200
+Subject: [PATCH] tftp: verify direction in a few places
+
+Closes #22974
+
+Conflicts Resolved:
+
+Adaptation notes:
+- Upstream moved tftp_tx() above tftp_connect_for_tx(); kept 8.7.1 layout =
and added the upload check in tftp_tx().
+
+Assisted-by: kiro:claude-opus-5.5
+
+CVE: CVE-2026-92389
+Upstream-Status: Backport [https://github.com/curl/curl/commit/63dd390fab9=
05a239a97e270]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/tftp.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/lib/tftp.c b/lib/tftp.c
+index ff2b7b7457..371902c0d8 100644
+--- a/lib/tftp.c
++++ b/lib/tftp.c
+@@ -545,10 +545,14 @@ static CURLcode tftp_send_first(struct tftp_state_da=
ta *state,
+     break;
+=20
+   case TFTP_EVENT_ACK: /* Connected for transmit */
++    if(!data->state.upload)
++      return CURLE_TFTP_ILLEGAL;
+     result =3D tftp_connect_for_tx(state, event);
+     break;
+=20
+   case TFTP_EVENT_DATA: /* Connected for receive */
++    if(data->state.upload)
++      return CURLE_TFTP_ILLEGAL;
+     result =3D tftp_connect_for_rx(state, event);
+     break;
+=20
+@@ -709,6 +713,9 @@ static CURLcode tftp_tx(struct tftp_state_data *state,=
 tftp_event_t event)
+   char *bufptr;
+   bool eos;
+=20
++  if(!data->state.upload)
++    return CURLE_TFTP_ILLEGAL;
++
+   switch(event) {
+=20
+   case TFTP_EVENT_ACK:
+@@ -1131,6 +1138,8 @@ static CURLcode tftp_receive_packet(struct Curl_easy=
 *data)
+=20
+     switch(state->event) {
+     case TFTP_EVENT_DATA:
++      if(data->state.upload)
++        return CURLE_TFTP_ILLEGAL;
+       /* Don't pass to the client empty or retransmitted packets */
+       if(state->rbytes > 4 &&
+          (NEXT_BLOCKNUM(state->block) =3D=3D getrpacketblock(&state->rpac=
ket))) {
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support=
/curl/curl_8.7.1.bb
index b4db387262..add3030637 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -46,6 +46,7 @@ SRC_URI =3D " \
     file://CVE-2026-92388-1.patch \
     file://CVE-2026-92388-2.patch \
     file://CVE-2026-87864.patch \
+    file://CVE-2026-92389.patch \
 "
=20
 SRC_URI:append:class-nativesdk =3D " \
