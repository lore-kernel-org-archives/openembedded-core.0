Return-Path: <adarsh.jagadish.kamini@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99669D1953D
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 14:58:50 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12921.1769525920906786786
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 06:58:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=H5tuPNZr;
 spf=pass (domain: est.tech, ip: 52.101.84.5, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdXpaqIu0XnpyOa+lJtUWeUbRAyGuW04oGCKOkjXR7F+QHCaVmGelCRA9a7g+RG51ySyx9XjOmLzedKTY8qPd7Z8x8jjmfKuiJhNAOkBb+NxO1kFj2ENuiu2uS6sPEI84BKvtNmN62QNA/2BQn6241Y3DryDaH9vWFgjpKGktMe31asKoICSAAC5RtOuWIHRxPQVxOlrc53XyIa4T191/erY21QRbKqU2iynJUuOZaqCHXOT58k8/GvIIZXH9ZSSDjAwVMco0jJF2X/1APMFxLQCvtTwTgOsWOahd+NkiRIgDsHnKREd0nTrui8ATKmWKtJcNZ/w90IL8D3PLJuGVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAt194/lF4wHj66nhzfJyLoadbaXKJk2A2vM8rbW1Eo=;
 b=JLu2pODcP7ucsOxvwDnn0fRnMXsGgkIKVFJVtojJ9+Equ5ZeGcDmkycJi3zarEZr2OQ+QghLfE900OYr+eD+ShJXqWhhLqEPxA4r6zksOxTRzsqNnKUphyM7hSwRFM8MlCQGdsLiy+yGLfgehc5x8yq2nph+ym0By1wLCckHFmxdtQRqGmb3l15KZsoUyQ1dm4Wc7k/gLWZk1QWT0yRb1w5BfFm5VEz8Rjdx2qhRetV01c1s3q8LKSsYawoWvKhjUNIR5uyUTZSKmVX/ZBBEL+fXsG8S+zX/S65oToa+85XNEXJiQFJ/uRibo0IBEtLU2Dd+g3cKHXSTH7CTbppIkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAt194/lF4wHj66nhzfJyLoadbaXKJk2A2vM8rbW1Eo=;
 b=H5tuPNZrNS86clInURymSak2KC9iOA71ePcFVfMjYMvMBB8+CGEe699iSVx+/7zzH/TMFzK1zV4n8PjDGEpo4QZDgLKZDZeajXVBhRkZjM/pxHMADI7ho7WJkgBLF2ObU5NCW5L23Lu4RYfCsdcmEhQPQ+EpmOSGLGbgg7JNmH3fVdp06201dlBHbFJnss1YTRxLTmdJhlWNorVU1b2n057K8sJZts+vwgQuxzkkvT61WZAnVxguO5+bGN0Nzjh3IVIv9xJAmdI4NSi7jXmc9M6e898GhkJqonOOY0HvVBQz6Z7bJRas1CwSYjGXGlvtBd4MIH8w4yy0Y2yvm51obw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DU0P189MB2371.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:47b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 14:58:36 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 14:58:36 +0000
From: adarsh.jagadish.kamini@est.tech
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH] avahi: Backport fix for CVE-2025-68276
Date: Tue, 27 Jan 2026 15:58:26 +0100
Message-ID: <20260127145831.90764-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0397.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::6) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DU0P189MB2371:EE_
X-MS-Office365-Filtering-Correlation-Id: ea8163ac-0354-47c3-5274-08de5db48c78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PQOT6OKxJTwk0VMdfz+0JqErTy52Il00+sIYlsNqkUC0tQp8/RVJCEEHwaJ6?=
 =?us-ascii?Q?FFWp/ab5MspRZuLV0cVYJXf+YoLiL+XaZeZo8VKr6nhwLYILZjJnuoc+Fmee?=
 =?us-ascii?Q?LPWaRZl7Pc4Rx1tCzO+H65upV+PKUdK7A51FLrhX0c6zx4BkFOLGB+9mwwi6?=
 =?us-ascii?Q?/SaHFGdUd+saGYellbKoXFp46yjU6st5HX5gDl9WDWz80bLq1aImvLzbF48i?=
 =?us-ascii?Q?PYH2ocTUEerDWaGea6svBXAdglINb465q09y3rzL5hzWfpAqqwFgty50KqSw?=
 =?us-ascii?Q?D5aO34EsJOkytshUW/tLT7ulWrGk2sHnLRjfe0yBaiDJ/aFhYwZkPIn2FFTx?=
 =?us-ascii?Q?biacSo+o7H3RBSh/j3nwg9CjnnvkxmH0lRN2dOyVpCyju/e5rOEjIWYLvQjB?=
 =?us-ascii?Q?wWqBn+GmLjG802N83kC3Y5C7/2lsEWcuiyJnQw1lBPHH2V9CCrzpOTkK7M8V?=
 =?us-ascii?Q?g08jaoD36291NKwLcNSlAKt3+rHvZtaoMOxkWBGYCcqxJP22KnBV14smnaYb?=
 =?us-ascii?Q?+W5NCDUSKX9A/B/P9NdvBh02i12/ZVAlYF57AkNssBV2wR8ldAaZuL97gDWm?=
 =?us-ascii?Q?zuDr9zYvx3zoi1llJ85CGuNIrZ6E3q+uive+T329KDhFe2mcA571jnhgqszT?=
 =?us-ascii?Q?xx25+TkiuU+aDOZx+raAo4/R/25A0AtRlugUjcdEB4J9NIoE/xfCZfWTEdGk?=
 =?us-ascii?Q?KsNlXm4Wjfaaw8XBfopniaB3G0TGOXDUkiemgbmZK5MgZPfrF4WhmLDmELvg?=
 =?us-ascii?Q?UPDy/+78uBOnP8Q20E5J0DcOnkM7EvaTI2fvLbroSfmccU7zmjXoxKU5fEpg?=
 =?us-ascii?Q?6RIsYFGfMFL2VOs5tb3iLEa59luvZt+kgtY9wlm/UuaD0+2NO73mMHvINaC7?=
 =?us-ascii?Q?gxxVyYsnrQJerWsvRH3j9sSdnW++09T6SLlpZ13hJ9LEczqfzfxcW93J5CUN?=
 =?us-ascii?Q?J6Fx5Gsrzr+p54sFAT/kQOC0Vxkzi37kta2Y8Wnz1w8llgg42y+ivoGY0rg/?=
 =?us-ascii?Q?A0mbDs/axqxsk1KfYTy1g/eMHX/zriNz93f5GJR5EaXfsKTwKrpiW4RvP2zg?=
 =?us-ascii?Q?0wZBU9sxnDD7nIGDlR3Dv1sC7pDyqc2YWyvrEvzT7PWW/++h68UDyFn6tYEu?=
 =?us-ascii?Q?MZ0sOnXHFD/tt0cbLis5ER62aarSmgrGA4mwnYJoFDw9mlPcyMlXkzZbM1wX?=
 =?us-ascii?Q?ndW6I5IPWvTyUba+5p9OKRyrc2EqYd56zQ8g5wI3zCSelqB6WWt+uZz4piA0?=
 =?us-ascii?Q?NTIwbjZierK/CCMQ+OcD6C+slQvBEFAz5/LnPTQAqoBaWRzQH1a4EAhfjoAm?=
 =?us-ascii?Q?n9PPftuPUerOuLCIhIx4fTolli9oTURZRQ1KCexXK5g+daMfKTTrQvxFJJwO?=
 =?us-ascii?Q?O0wLcl+RYMPzJlbb/+VQ+hOx1URGjJ7qYuVH0L6YxGfs3e9YhsIdwOiOcppT?=
 =?us-ascii?Q?tJoK43gsuabm9ADxSFTq1v+YZeaPhPd9p3x/XPtOomW9ZMIKu610UBzFRlmw?=
 =?us-ascii?Q?hJRD6RaNgW6KWnpZDAx/vr0CC67CpbuJLr9pKozSZDwXhmWnCUu1Dd0poSm4?=
 =?us-ascii?Q?FiNjAii1fcFt9NNx904Q3i3QnLv2ACyYrMKPRw7q?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?z+YEM4bEiKLojdG74JtYJZ/cgCayt5m1vuOohgKhvVm9H0IVuIuLuC/eApWD?=
 =?us-ascii?Q?ISSc47aP1JbanaOF+rgLQN4HmvqTQLb8ZO1VBj9v8I6//Sp4rS3eR0Uw0/tc?=
 =?us-ascii?Q?tUre0tGN4CJC15HjihBQr5vDT2tOS6EhDGM4STdp0cQqp8uB/2ZNCrXX1DDw?=
 =?us-ascii?Q?UEvNmRyYqQ9Ie7SWaYF58BXbjuP4hO2jxSJCnfBLEfLoNouPrS7qRpWmMVis?=
 =?us-ascii?Q?D6ZQuEWQNtdIH7HCNI3oFPOV3zIrzV852gOZdqKSW9lxv6pW0ueZj7PeWguN?=
 =?us-ascii?Q?wlT1P4Y1BwoKj8Pr4o1jY0v7qUjydKRym3FhZkASruDC383DLb2THrJJWlD0?=
 =?us-ascii?Q?/dSjTuukXODs/vuUNIxliabhgXCltUhvo5la1TjtQfvINguE0YpeHhn/Exr9?=
 =?us-ascii?Q?C609lBwzqU0gUljD3HTD/6L/pgiL5bw+lj14+eDSwlmfmUaSG1dWarz8YGMv?=
 =?us-ascii?Q?pqEbze46OkiZOr5Y89//RWiW79hsLyMYBIiaoypcOQCCLQIdLBYnLWVQr7zI?=
 =?us-ascii?Q?2bw42ACydRUl3iO5ggrw1Pu9Ml0MjnvoOyFt+oPfOLM51Lkg3uF1xeypkhVk?=
 =?us-ascii?Q?wnKhc/gbuR4NdQf76v6cz1hx9TU4GcfkB1Gx5x8vrhl8Ua5dJjwpDrYRrNum?=
 =?us-ascii?Q?O2b0hy2znvhYOoMoImqoKuE+xHFstSdH9LISAVd21WTLn2867ioeQo6OrfqW?=
 =?us-ascii?Q?ff44o1oAQniYvztm+Ntetbhl4q5w4M6tz6mWqK8tk2KwSKM9/Q4SoY4AYbTq?=
 =?us-ascii?Q?gwfW+FKhPG3NlBo2lAAAlvCvfuhSupGfbXtc5pMgBG/Yys70cypvZvLL4PFV?=
 =?us-ascii?Q?V+6fiZ/oPWVsDG8lKgl/VRrLksq3lKn1Yi7kuclz4JBBPHpa7b9HtINV1OlW?=
 =?us-ascii?Q?/Kj9LIhYb5TwcdhOnF9jl7W+j8nXfZg3YtfFgx3rv9v5ZLaQwqznFq+cIDfi?=
 =?us-ascii?Q?LRy5eZrmEAubCmp598D0AFk6RVq6e45S0erWpxRJT5tTDHfz+mbogcn+afeb?=
 =?us-ascii?Q?pFfT+uOF5VBlzu4Pe2g0b0onTaTGoVsMCabsou/1A0srqluU107BS5jMhuH0?=
 =?us-ascii?Q?eGryQgIqOpZji0k/bcXzBRxDtuLSfmq+g5RWZGrkHaMv8PbhwoJAlWuy/gls?=
 =?us-ascii?Q?oiDZTe/n74/t5PVHsE7rBLPuV+H1WdFHuy1k1uMG3LoP6+rL5t+LJW3clAEx?=
 =?us-ascii?Q?zxtIwKZ6waG8W6wiIuRJCArS4xP3+Baor96gTNAoRY7hoXLz0zEPw43wl4sz?=
 =?us-ascii?Q?dgQyg+4hv335weZ7G+M6+T4S9IaTA200uCouOj4eO9MhPhoE+VvKdMf669er?=
 =?us-ascii?Q?0o0qb0DaMuvxZ5nw0lJr6V2lH++6Cec1eUX8UCIrxeWbZ2x2k+GX7NYAIREL?=
 =?us-ascii?Q?u0PDgZ8F/kvebMfftKPUZh3HUOhMDcPtCW4xA9L7H1odEoJ5sFneaS3jHSKU?=
 =?us-ascii?Q?iUhsmSCsLbbFlipPKL50HqHGmNh3ksiXvOptIqhPah+VZBATfnsPsemNahMB?=
 =?us-ascii?Q?Rwb27pLX2VNWILBtg9y06qlgjckczS7U+UMp9P/iwKcHRNkSMkygjfdljkR9?=
 =?us-ascii?Q?d2J4EWBC9EISb4VXz03dp79ZyfBwYrMrpDMQRk+B0P9hNEQSOYy1CL5FZWx8?=
 =?us-ascii?Q?SJ0kH2FZ2SS9k9WFrg5FjVemhH+DmPAUJe+ZsLZoZn6RQPDY98UKSihfhZre?=
 =?us-ascii?Q?iHQ/FKMxuLsD0weYB4U1uZc6OVEyX/h8oRykTqKGHF63HgLmLsFuGIRgsEuT?=
 =?us-ascii?Q?U5M4mCqu05/8hyqSSOIiBRdZ36yn+wI=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ea8163ac-0354-47c3-5274-08de5db48c78
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 14:58:36.7060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SwLcCttUsJhbvjVfzZAYb+BJpfzeqoRGMq4ERO4HfXw9+UCyqkiwFwv7vtKGzNOm5cead+9+nkj9oyxUaRBxW2NN4kQvDX79sG+wLQgO0yU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2371
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 14:58:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230050

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 .../avahi/files/CVE-2025-68276.patch          | 68 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68276.pa=
tch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-co=
nnectivity/avahi/avahi_0.8.bb
index 7930bd3037..bb20fd17cc 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -37,6 +37,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/avahi-${P=
V}.tar.gz \
            file://CVE-2023-38473.patch \
            file://CVE-2024-52616.patch \
            file://CVE-2024-52615.patch \
+           file://CVE-2025-68276.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/avahi/avahi/releases/"
diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch b/m=
eta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
new file mode 100644
index 0000000000..b3e11f9597
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
@@ -0,0 +1,68 @@
+From d5d18ced67e969d6a5052cacdbd7d4b2c97a1a3f Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Wed, 17 Dec 2025 08:11:23 +0000
+Subject: [PATCH] core: refuse to create wide-area record browsers when
+ wide-area is off
+
+It fixes a bug where it was possible for unprivileged local users to
+crash avahi-daemon (with wide-area disabled) by creating record browsers
+with the AVAHI_LOOKUP_USE_WIDE_AREA flag set via D-Bus (either by calling
+the RecordBrowserNew method directly or by creating hostname/address/servi=
ce
+resolvers/browsers that create those browsers internally themselves).
+
+```
+$ gdbus call --system --dest org.freedesktop.Avahi --object-path / --metho=
d org.freedesktop.Avahi.Server.ResolveHostName -- -1 -1 yo.local -1 1
+Error: GDBus.Error:org.freedesktop.DBus.Error.NoReply: Message recipient d=
isconnected from message bus without replying
+```
+```
+dbus-protocol.c: interface=3Dorg.freedesktop.Avahi.Server, path=3D/, membe=
r=3DResolveHostName
+avahi-daemon: wide-area.c:725: avahi_wide_area_scan_cache: Assertion `e' f=
ailed.
+=3D=3D307948=3D=3D
+=3D=3D307948=3D=3D Process terminating with default action of signal 6 (SI=
GABRT)
+=3D=3D307948=3D=3D    at 0x4B3630C: __pthread_kill_implementation (pthread=
_kill.c:44)
+=3D=3D307948=3D=3D    by 0x4ADF921: raise (raise.c:26)
+=3D=3D307948=3D=3D    by 0x4AC74AB: abort (abort.c:77)
+=3D=3D307948=3D=3D    by 0x4AC741F: __assert_fail_base.cold (assert.c:118)
+=3D=3D307948=3D=3D    by 0x48D8B85: avahi_wide_area_scan_cache (wide-area.=
c:725)
+=3D=3D307948=3D=3D    by 0x48C8953: lookup_scan_cache (browse.c:351)
+=3D=3D307948=3D=3D    by 0x48C8B1B: lookup_go (browse.c:386)
+=3D=3D307948=3D=3D    by 0x48C9148: defer_callback (browse.c:516)
+=3D=3D307948=3D=3D    by 0x48AEA0E: expiration_event (timeeventq.c:94)
+=3D=3D307948=3D=3D    by 0x489D3AE: timeout_callback (simple-watch.c:447)
+=3D=3D307948=3D=3D    by 0x489D787: avahi_simple_poll_dispatch (simple-wat=
ch.c:563)
+=3D=3D307948=3D=3D    by 0x489D91E: avahi_simple_poll_iterate (simple-watc=
h.c:605)
+=3D=3D307948=3D=3D
+```
+
+wide-area has been disabled by default since
+9c4214146738146e454f098264690e8e884c39bd (v0.9-rc2).
+
+https://github.com/avahi/avahi/security/advisories/GHSA-mhf3-865v-g5rc
+
+CVE: CVE-2025-68276
+Upstream-Status: Backport [https://github.com/avahi/avahi/pull/806/commits=
/0c013e2e819be3bda74cecf48b5f64956cf8a760]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ avahi-core/browse.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index e8a915e..59d53cb 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -541,6 +541,11 @@ AvahiSRecordBrowser *avahi_s_record_browser_prepare(
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, AVAHI_FLAGS_VALID(flags, AVA=
HI_LOOKUP_USE_WIDE_AREA|AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_FLAG=
S);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, !(flags & AVAHI_LOOKUP_USE_W=
IDE_AREA) || !(flags & AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS=
);
+=20
++    if ((flags & AVAHI_LOOKUP_USE_WIDE_AREA) && !server->wide_area_lookup=
_engine) {
++        avahi_server_set_errno(server, AVAHI_ERR_NOT_SUPPORTED);
++        return NULL;
++    }
++
+     if (!(b =3D avahi_new(AvahiSRecordBrowser, 1))) {
+         avahi_server_set_errno(server, AVAHI_ERR_NO_MEMORY);
+         return NULL;
+--=20
+2.34.1
+
--=20
2.44.0


