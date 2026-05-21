Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7F2CD5BB1
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 10:10:18 +0000 (UTC)
Received: from mx-relay25-hz12-if1.hornetsecurity.com (mx-relay25-hz12-if1.hornetsecurity.com [94.100.139.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33219.1779358208328762222
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 03:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=MhUSy2p5;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.225, mailfrom: tgaige@witekio.com)
Received: from mail-francecentralazon11023101.outbound.protection.outlook.com ([40.107.162.101]) by mx-gate25-hz12;
 Thu, 21 May 2026 12:10:05 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQhriUQyoDnXlCbYb+nj8Qc6s8CZOOWg9sV440GhBdIeVeeIfpSaEUHYDFmuYymdHMLHU8a391h3bx1c+R43KJIUcFBQDn5BJgN/8YUzvGxPIGXzhOMmp89W9rXXBB3HZPWNaUxVEvinn9Hj3OmTr6sgtftkSfTAwlTQvVhjTsJ6ERthQLLa0moKtLNPDyL0goEMEonpDGYJIxqVfyvmmWgcPa225Oxzg6r9L1qyw0rPpxgDmYILPYrwdKb4bkT0NdTfBbhnvX1LKwIh6rwhCa7j7os2JxjAvXvxPeqIfufAV9P4Ld10PeY8Ma8KaTV/rHXuykVmZxAorMLbCAonFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLxnkrFOzLhqj69KXODt+eAoE/DP762sCLgzeeS/IVg=;
 b=b2LcJTDs2O5ynWEWuV/9JH5pPD71JFxlpJcndbowSXJHbRSZoNR+UwJijwjkH/PSauXWALyGaznnkFFm1KWa3Fy1pbW993doWX6QEQnIOAdnNCrl5JRzmVVeHdKfuHNxh1JU2R8eX6rpztvNrlFaYz5inw+ZW95jGywPIS+bGpHhUVD6aXEEss9jJ1IZ2IuBwnHNiF9VDJ6NPwYIpw/19qrPbarLGn3YJNO7/+69VLrmqNJMpml597BLC3+23gd6VYac158CVgTBFy6YfSeWrrTv1OU5mv9URx94NR+4XZqbyil0u6ruq/ZjUJn1oeZncB3lIShhFYDXwXv6RLjzcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLxnkrFOzLhqj69KXODt+eAoE/DP762sCLgzeeS/IVg=;
 b=MhUSy2p5SwQQsTmp8Y79iMNHu+tfwuSupJhB9X3UQ/t/ULxMm+XWRaNbIuuICAM480NKUyqJAEAn8aqvabC13sCRzZJhaf5UJtIZwkXltiQHHRj8sBi0bSRIcBAfrPnZhV5OXfK2jNe3L6CfBWEFG0D1VqLlY35XzjgEmsxR3ZnzBcsPc9iKSwZV3SQW/otU2jgMKJmf8Xs15E/nglu8UplZsoGYCSrf1YrAhwTR1aIPuC+sqN195V27QMkJKFbziK1R1KaD8JPYmH0QWqEqbFNUKSmTCC7g7+rC2NHTpbv/28y5wfIuyrxsc2h72Af7yuPNs2OCWNWl16mgKkjXIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by AS4P192MB1672.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:507::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 10:09:57 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0025.023; Thu, 21 May 2026
 10:09:57 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [scarthgap][PATCH 01/14] go: patch CVE-2026-27142
Date: Thu, 21 May 2026 12:09:34 +0200
Message-ID: <20260521100949.1299757-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0104.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::19) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|AS4P192MB1672:EE_
X-MS-Office365-Filtering-Correlation-Id: 76a2feac-c12a-49be-afc8-08deb7211c7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|18002099003|56012099003|38350700014|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: 
	VvK89N3eWQNKJNgWdXIQjdNlevNCKzfYoGnpk453er7ZuPnc66oyottyjl8IErBFW4GbNb9FcOgUmS0JjKGyvxbQknSHjFOG5qSQolurrikTtRUr9qYg5xyzU6nZuAOG29Gvh/jpE30NvqT/x0FDP//IAIafUYfUY02KIq10uV6g9ErQTmlHD+UBQIu7mcJi2t4mY7Co7+nRtXND/3XciR2Fgh6WFmqh4IxTjXXLY2ilefxlpHXZfBC0CEGHyHPinK+Nn6eF08upcVpS07Wd1wkGhW+ukbsWmuMBmqD17fhsMAAlvOuIQUZnDZBjLY2HjRVfqyE3ZQLjit/qWg7z6+3LLamywTVKp3oIyHCPEfTTTxtEIpnUPM8SNKKdODU/UuArCoc8iX0VKyYRCwwuvmgt4yE9vD96GfiGDMCwBisurmmtTt6wTTanWMwN1l2pE8sVgKkp7QTharthRGQtayqtYZqwxvfdzhplipPgjvqL5i4LgxcGFQgJcJEa1CRKXyhvdFRS8Y6LewirY6GFxKZmsgOfpYT3z3fVu2KKDv36jhgKC3jOtEPlqlz4i43bCwQafl5OMA8PXFRsG7b0q8ShWJB2FreJqb7H93uvRpTCpbEXSEjtJKbjBdbNl+jit0F98bsyhP1aw2vSmmVdeBD1bZKARCpefhuwQpWuPzJbuKPNwuDou74yVsyhu3o2lH74fWay3olhVeI/0T20xg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(18002099003)(56012099003)(38350700014)(3023799007)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OgRXx9g/IG2+EVi2yco1+nmsRv+QFS0kDVZXmyekM1oEMWqm2jZABUxRgPuA?=
 =?us-ascii?Q?cTREujm1RdER7bmEREzl1N9H7GNuPK7N7B0fI1oPfqB6CuAM4RYL4dbu5A+B?=
 =?us-ascii?Q?Ct30PKp2AEnzWItiZwxWpe3yRVkqhVmC4q/VJmCYOQHyG/yzDdUiigMmnfWD?=
 =?us-ascii?Q?cMdETK+Xyx7mEn8SSAAztXEy6sLzUUE7jBqZTa9bKGWT1B2p1Dt80OcHKQF4?=
 =?us-ascii?Q?N/DMsHEdpPltrvFMlUq7hY8d5Tr0hExz7YLXOHbYj/RqnsQaZmEMX88kW+DR?=
 =?us-ascii?Q?J2YT8KOYxYoGSh3oTxt7ZQtoL9ypdH2f53q2oJ1puTOyZ12u/W07RnzwPBzi?=
 =?us-ascii?Q?jDvwI+xxaKVBaq2xB87V4OpFWLQqRXMSTb/AbCXlXdE+64duwl6K/mTimm1m?=
 =?us-ascii?Q?0sIwhaJmKmzuqE3VXVTnssi4f96HxNI1Vuy7QwJ5vA3VG60NaKmYI3w2QwqU?=
 =?us-ascii?Q?u3fTUDVHAjxhJcOQHesjwKVkEH8QLVEiktK3yjh1aU+YQlIojOnjcSf8sk3q?=
 =?us-ascii?Q?2ZVqEzTGb5afn6cdFDDcXJYwgrXztn3uj9B9pkx3s/JwX7+0dcGVPIEkTkyU?=
 =?us-ascii?Q?NMc3UdJaYD54lkrfPBecIXQzXu43XGhFKEOUnCbXU3FJUBN2emNwmHxCxaap?=
 =?us-ascii?Q?9jgPr8vuuhDfAs9x8GXeizRlGkoWTmCz7pNLGVZUHeVUlh/1pvIYnZ/wLOc9?=
 =?us-ascii?Q?/L2WyD1aTgJLytZehvWEs3zyiRILJHcLKTWh5PCTDJucTCKWHB9BGOyyC3yU?=
 =?us-ascii?Q?HSaVcmvyDcr7Z4KFZMUPtq5P6/MrwsRuRqIEqf1J1o9m/UqVK67OqaL9luaQ?=
 =?us-ascii?Q?XOe6BBqab/OpMgZ63r75QJMuYHxR24rD8zn4xcrFkTmu7C4Q3tmYB//nBGbU?=
 =?us-ascii?Q?JHSp7+6PcVpD+TQpm9jnaxE00lqy1P49peWtis2yY4irFOoAGqxeRFugn+iB?=
 =?us-ascii?Q?9Gz4FFiCDKQBaDpkIkLf3P6i858p78vXxXQTnyyYynwNmuOTQtTF/EkX8O33?=
 =?us-ascii?Q?dTIqaqMAhZYyQS8oALSyK3ABaA7Iqt0+r6ApIxIMc8zj7y6jKt4LwX6VDy6C?=
 =?us-ascii?Q?lVnEQ+tqwuBhlGyqbPPtKP3FvT+WBwh/VeAgjbEl7OSAI8t0pT5eaFtpP5Uw?=
 =?us-ascii?Q?5aeq9ZdEP8yHZ4mfhm94Lb/s1Xsli00JD1UujIvC9OPCVpAeTXWj4AUAlFDb?=
 =?us-ascii?Q?31RRO/2j8QY0vju3l9gAJmcGCzbgxUBWWy0ExMjzABgP7ESvhmjQ8LoHQ0Xh?=
 =?us-ascii?Q?aPdp3TGMGL3sEE167lfQJTzpBOi61yB1sFeyz8jmVyWfLiVQOerxu3bRykUP?=
 =?us-ascii?Q?PNt/+Up7z2olLTmNCpvHdxj9ZUMK68HSDFzK75354q7W6lbOTfV8eqTKfjk7?=
 =?us-ascii?Q?bxvA2WFIp1bB784G9Po4ixo65Q15oGNs6jWaA+YESzRrgj2bFPcZrJCK9KWj?=
 =?us-ascii?Q?SI7XgXOz4GYXOBlEmVLs9qhQccTjh371C96uOLni3Qg+nk5gcDJo7PRkt41M?=
 =?us-ascii?Q?fslrPLGfatas+49Di4FVY/WfwK/j6SVpAyxCOot0gbsZx6THAA+0zuP6Dhw5?=
 =?us-ascii?Q?2PYKRoFj3szciFKysakIr364SFT+bSzw60/l3CNyzflDP/ofglXKV2dGMEeg?=
 =?us-ascii?Q?ReXxXBuRUYtAvG453K1Oaw/zds3QhltWw2cOFAJdR4/U0h0kskWpQDuNFdJa?=
 =?us-ascii?Q?1W1mUyY+hs68nexd72kNQKO9kCn5sR361pbN9+HU5+eYMHlr+aIIJH0dqhd3?=
 =?us-ascii?Q?ER3fqBgkOg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	QWa7kL+ABcPueZZhdjqFRorgTdFhJfW2nzYLs5Aj2KTam3kKDXueMTvLKVAvrWLcAq/zbOTOLPi2XYsbqp01K1GM5gODcP/1LYcohzBwWuGKFYQtlDGO1HFUkK+4q843Z8PouldTu2g9dHSqOmQar/+iIc7xGwsHf69WLLS4wYchycDSfIbpqisru3BbmUDFsDIKhm+7HDlk/9TleSQp3w6FAuIBfIHoKA1qJDkm9B30zV7Ymoe1P8DlQqWnV9bzt9YDC4FiRmFL6aOz6adWI02VmHTVWqhGuHqUvrVuxuebE4N48m2Z4Kxdz89j5lmK+/lPJ/5EWZOskZ71JglOFA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	QQR0UDmOeIs2ByXRYVOriVX4JWk5FRI4btJDptIMbHe8Kq1hFetgYT6v3tsQTQpIVtvEETGnvKzdrCKzrJkkGNW0POWL9uKXuEX3P62WCUJ3kh6ptalQQC35lB1nm+KJZoOFNzem6CbBsKGahGLqMLDLz7/rmRrYgr/AKQ/21/MlR7JswPre1QmLXzdaegAkaNc8wBDQr62jN+OdATbPnO3VGGqibsqa8YQyA2vwEXXM1aJXS5XnH1v+5KiYV8nb/J5TVs6qphvsBZRY5orJsFd7fHhY8GxUb2D7wWQUN8RGDwOODlIQwG72C33dQaWBRFyCxw8qmTYl2go44LB5tbGiteGZuhEFtOJzKYG/a8ROd+3o44vNwrLfqPtEplxQ9GzPLMsC69EDnfkPic+zGRikg3TO9E1R8v7vmrhS3gRIlTDjqFkZnzhycS+kX4hznyMHoZ5ZeLNBqKkKFDVprPT6zns+3r+dOskvmaxw4+RZGX37lXByxQpmnuXBLlyBJFMYisxAw8nAKVL0sji/mdfD6OE9L13OmWAZQQadiSn6R8rr/wVq8WBf0KGugGCd/cQLsspOWrsz5Cwb4DASZvA5FNH4MbsLC2ls8S9FKNrGsg3ZnMdEk2X63D0en2fl
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a2feac-c12a-49be-afc8-08deb7211c7e
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 10:09:57.4880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6pQuk8uxxRY2Wre7UOUZ54xtIHs1OsWCi760t9vRX6htRAuY6gyo+R7bJ3DzvVI+dfh3KcFkupz8lYUoqfA+qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P192MB1672
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate25-hz12 with 4gLkfw4YTbz1X5Hk
X-cloud-security-connect: mail-francecentralazon11023101.outbound.protection.outlook.com[40.107.162.101], TLS=1, IP=40.107.162.101
X-cloud-security-Digest: 17bf5b10dae236555f48ea5c63201cca
X-cloud-security: scantime:1.967
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 10:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237484

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/752081

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-27142.patch                | 386 ++++++++++++++++++
 2 files changed, 387 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-27142.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 3fa421e223..8efa82f862 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -41,6 +41,7 @@ SRC_URI += "\
     file://CVE-2025-68121_p1.patch \
     file://CVE-2025-68121_p2.patch \
     file://CVE-2025-68121_p3.patch \
+    file://CVE-2026-27142.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-27142.patch b/meta/recipes-devtools/go/go/CVE-2026-27142.patch
new file mode 100644
index 0000000000..e735abaf4b
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-27142.patch
@@ -0,0 +1,386 @@
+From 1ac19df75e9c25951c04008a52b23a1cd95e81cc Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Fri, 9 Jan 2026 11:12:01 -0800
+Subject: [PATCH] html/template: properly escape URLs in meta content
+ attributes
+
+The meta tag can include a content attribute that contains URLs, which
+we currently don't escape if they are inserted via a template action.
+This can plausibly lead to XSS vulnerabilities if untrusted data is
+inserted there, the http-equiv attribute is set to "refresh", and the
+content attribute contains an action like `url={{.}}`.
+
+Track whether we are inside of a meta element, if we are inside of a
+content attribute, _and_ if the content attribute contains "url=". If
+all of those are true, then we will apply the same URL escaping that we
+use elsewhere.
+
+Also add a new GODEBUG, htmlmetacontenturlescape, to allow disabling this
+escaping for cases where this behavior is considered safe. The behavior
+can be disabled by setting htmlmetacontenturlescape=0.
+
+Updates #77954
+Fixes #77972
+Fixes CVE-2026-27142
+
+Change-Id: I9bbca263be9894688e6ef1e9a8f8d2f4304f5873
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3360
+Reviewed-by: Neal Patel <nealpatel@google.com>
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3643
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/752081
+Auto-Submit: Gopher Robot <gobot@golang.org>
+Reviewed-by: Cherry Mui <cherryyz@google.com>
+TryBot-Bypass: Gopher Robot <gobot@golang.org>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+
+CVE: CVE-2026-27142
+Upstream-Status: Backport [https://github.com/golang/go/commit/994692847a2cd3efd319f0cb61a07c0012c8a4ff]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ doc/godebug.md                      |  5 +++
+ src/html/template/attr_string.go    |  5 +--
+ src/html/template/context.go        |  8 +++++
+ src/html/template/element_string.go |  5 +--
+ src/html/template/escape.go         | 14 +++++++++
+ src/html/template/escape_test.go    | 34 +++++++++++++++++++++
+ src/html/template/state_string.go   |  8 +++--
+ src/html/template/transition.go     | 47 +++++++++++++++++++++++++----
+ src/internal/godebugs/table.go      |  1 +
+ src/runtime/metrics/doc.go          |  5 +++
+ 10 files changed, 119 insertions(+), 13 deletions(-)
+
+diff --git a/doc/godebug.md b/doc/godebug.md
+index 635597e..07b63cb 100644
+--- a/doc/godebug.md
++++ b/doc/godebug.md
+@@ -126,6 +126,11 @@ for example,
+ see the [runtime documentation](/pkg/runtime#hdr-Environment_Variables)
+ and the [go command documentation](/cmd/go#hdr-Build_and_test_caching).
+ 
++Go 1.26.1 added a new `htmlmetacontenturlescape` setting that controls whether
++html/template will escape URLs in the `url=` portion of the content attribute of
++HTML meta tags. The default `htmlmetacontentescape=1` will cause URLs to be
++escaped. Setting `htmlmetacontentescape=0` disables this behavior.
++
+ Go 1.26 added a new `urlmaxqueryparams` setting that controls the maximum number
+ of query parameters that net/url will accept when parsing a URL-encoded query string.
+ If the number of parameters exceeds the number set in `urlmaxqueryparams`,
+diff --git a/src/html/template/attr_string.go b/src/html/template/attr_string.go
+index 51c3f26..7159fa9 100644
+--- a/src/html/template/attr_string.go
++++ b/src/html/template/attr_string.go
+@@ -14,11 +14,12 @@ func _() {
+ 	_ = x[attrStyle-3]
+ 	_ = x[attrURL-4]
+ 	_ = x[attrSrcset-5]
++	_ = x[attrMetaContent-6]
+ }
+ 
+-const _attr_name = "attrNoneattrScriptattrScriptTypeattrStyleattrURLattrSrcset"
++const _attr_name = "attrNoneattrScriptattrScriptTypeattrStyleattrURLattrSrcsetattrMetaContent"
+ 
+-var _attr_index = [...]uint8{0, 8, 18, 32, 41, 48, 58}
++var _attr_index = [...]uint8{0, 8, 18, 32, 41, 48, 58, 73}
+ 
+ func (i attr) String() string {
+ 	if i >= attr(len(_attr_index)-1) {
+diff --git a/src/html/template/context.go b/src/html/template/context.go
+index b78f0f7..8b3af2f 100644
+--- a/src/html/template/context.go
++++ b/src/html/template/context.go
+@@ -156,6 +156,10 @@ const (
+ 	// stateError is an infectious error state outside any valid
+ 	// HTML/CSS/JS construct.
+ 	stateError
++	// stateMetaContent occurs inside a HTML meta element content attribute.
++	stateMetaContent
++	// stateMetaContentURL occurs inside a "url=" tag in a HTML meta element content attribute.
++	stateMetaContentURL
+ 	// stateDead marks unreachable code after a {{break}} or {{continue}}.
+ 	stateDead
+ )
+@@ -267,6 +271,8 @@ const (
+ 	elementTextarea
+ 	// elementTitle corresponds to the RCDATA <title> element.
+ 	elementTitle
++	// elementMeta corresponds to the HTML <meta> element.
++	elementMeta
+ )
+ 
+ //go:generate stringer -type attr
+@@ -288,4 +294,6 @@ const (
+ 	attrURL
+ 	// attrSrcset corresponds to a srcset attribute.
+ 	attrSrcset
++	// attrMetaContent corresponds to the content attribute in meta HTML element.
++	attrMetaContent
+ )
+diff --git a/src/html/template/element_string.go b/src/html/template/element_string.go
+index db28665..bdf9da7 100644
+--- a/src/html/template/element_string.go
++++ b/src/html/template/element_string.go
+@@ -13,11 +13,12 @@ func _() {
+ 	_ = x[elementStyle-2]
+ 	_ = x[elementTextarea-3]
+ 	_ = x[elementTitle-4]
++	_ = x[elementMeta-5]
+ }
+ 
+-const _element_name = "elementNoneelementScriptelementStyleelementTextareaelementTitle"
++const _element_name = "elementNoneelementScriptelementStyleelementTextareaelementTitleelementMeta"
+ 
+-var _element_index = [...]uint8{0, 11, 24, 36, 51, 63}
++var _element_index = [...]uint8{0, 11, 24, 36, 51, 63, 74}
+ 
+ func (i element) String() string {
+ 	if i >= element(len(_element_index)-1) {
+diff --git a/src/html/template/escape.go b/src/html/template/escape.go
+index 1eace16..b368cab 100644
+--- a/src/html/template/escape.go
++++ b/src/html/template/escape.go
+@@ -165,6 +165,8 @@ func (e *escaper) escape(c context, n parse.Node) context {
+ 
+ var debugAllowActionJSTmpl = godebug.New("jstmpllitinterp")
+ 
++var htmlmetacontenturlescape = godebug.New("htmlmetacontenturlescape")
++
+ // escapeAction escapes an action template node.
+ func (e *escaper) escapeAction(c context, n *parse.ActionNode) context {
+ 	if len(n.Pipe.Decl) != 0 {
+@@ -222,6 +224,18 @@ func (e *escaper) escapeAction(c context, n *parse.ActionNode) context {
+ 		default:
+ 			panic(c.urlPart.String())
+ 		}
++	case stateMetaContent:
++		// Handled below in delim check.
++	case stateMetaContentURL:
++		if htmlmetacontenturlescape.Value() != "0" {
++			s = append(s, "_html_template_urlfilter")
++		} else {
++			// We don't have a great place to increment this, since it's hard to
++			// know if we actually escape any urls in _html_template_urlfilter,
++			// since it has no information about what context it is being
++			// executed in etc. This is probably the best we can do.
++			htmlmetacontenturlescape.IncNonDefault()
++		}
+ 	case stateJS:
+ 		s = append(s, "_html_template_jsvalescaper")
+ 		// A slash after a value starts a div operator.
+diff --git a/src/html/template/escape_test.go b/src/html/template/escape_test.go
+index 497ead8..1970db1 100644
+--- a/src/html/template/escape_test.go
++++ b/src/html/template/escape_test.go
+@@ -734,6 +734,16 @@ func TestEscape(t *testing.T) {
+ 			"<script>var a = `${ var a = \"{{\"a \\\" d\"}}\" }`</script>",
+ 			"<script>var a = `${ var a = \"a \\u0022 d\" }`</script>",
+ 		},
++		{
++			"meta content attribute url",
++			`<meta http-equiv="refresh" content="asd; url={{"javascript:alert(1)"}}; asd; url={{"vbscript:alert(1)"}}; asd">`,
++			`<meta http-equiv="refresh" content="asd; url=#ZgotmplZ; asd; url=#ZgotmplZ; asd">`,
++		},
++		{
++			"meta content string",
++			`<meta http-equiv="refresh" content="{{"asd: 123"}}">`,
++			`<meta http-equiv="refresh" content="asd: 123">`,
++		},
+ 	}
+ 
+ 	for _, test := range tests {
+@@ -1016,6 +1026,14 @@ func TestErrors(t *testing.T) {
+ 			"<script>var tmpl = `asd ${return \"{\"}`;</script>",
+ 			``,
+ 		},
++		{
++			`{{if eq "" ""}}<meta>{{end}}`,
++			``,
++		},
++		{
++			`{{if eq "" ""}}<meta content="url={{"asd"}}">{{end}}`,
++			``,
++		},
+ 
+ 		// Error cases.
+ 		{
+@@ -2194,3 +2212,19 @@ func TestAliasedParseTreeDoesNotOverescape(t *testing.T) {
+ 		t.Fatalf(`Template "foo" and "bar" rendered %q and %q respectively, expected equal values`, got1, got2)
+ 	}
+ }
++
++func TestMetaContentEscapeGODEBUG(t *testing.T) {
++	savedGODEBUG := os.Getenv("GODEBUG")
++	os.Setenv("GODEBUG", savedGODEBUG+",htmlmetacontenturlescape=0")
++	defer func() { os.Setenv("GODEBUG", savedGODEBUG) }()
++
++	tmpl := Must(New("").Parse(`<meta http-equiv="refresh" content="asd; url={{"javascript:alert(1)"}}; asd; url={{"vbscript:alert(1)"}}; asd">`))
++	var b strings.Builder
++	if err := tmpl.Execute(&b, nil); err != nil {
++		t.Fatalf("unexpected error: %s", err)
++	}
++	want := `<meta http-equiv="refresh" content="asd; url=javascript:alert(1); asd; url=vbscript:alert(1); asd">`
++	if got := b.String(); got != want {
++		t.Fatalf("got %q, want %q", got, want)
++	}
++}
+diff --git a/src/html/template/state_string.go b/src/html/template/state_string.go
+index eed1e8b..f5a70b2 100644
+--- a/src/html/template/state_string.go
++++ b/src/html/template/state_string.go
+@@ -36,12 +36,14 @@ func _() {
+ 	_ = x[stateCSSBlockCmt-25]
+ 	_ = x[stateCSSLineCmt-26]
+ 	_ = x[stateError-27]
+-	_ = x[stateDead-28]
++	_ = x[stateMetaContent-28]
++	_ = x[stateMetaContentURL-29]
++	_ = x[stateDead-30]
+ }
+ 
+-const _state_name = "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstateJSTmplLitstateJSRegexpstateJSBlockCmtstateJSLineCmtstateJSHTMLOpenCmtstateJSHTMLCloseCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateErrorstateDead"
++const _state_name = "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstateJSTmplLitstateJSRegexpstateJSBlockCmtstateJSLineCmtstateJSHTMLOpenCmtstateJSHTMLCloseCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateErrorstateMetaContentstateMetaContentURLstateDead"
+ 
+-var _state_index = [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100, 111, 118, 130, 142, 156, 169, 184, 198, 216, 235, 243, 256, 269, 282, 295, 306, 322, 337, 347, 356}
++var _state_index = [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100, 111, 118, 130, 142, 156, 169, 184, 198, 216, 235, 243, 256, 269, 282, 295, 306, 322, 337, 347, 363, 382, 391}
+ 
+ func (i state) String() string {
+ 	if i >= state(len(_state_index)-1) {
+diff --git a/src/html/template/transition.go b/src/html/template/transition.go
+index d5a05f6..5aa3c35 100644
+--- a/src/html/template/transition.go
++++ b/src/html/template/transition.go
+@@ -23,6 +23,8 @@ var transitionFunc = [...]func(context, []byte) (context, int){
+ 	stateRCDATA:         tSpecialTagEnd,
+ 	stateAttr:           tAttr,
+ 	stateURL:            tURL,
++	stateMetaContent:    tMetaContent,
++	stateMetaContentURL: tMetaContentURL,
+ 	stateSrcset:         tURL,
+ 	stateJS:             tJS,
+ 	stateJSDqStr:        tJSDelimited,
+@@ -83,6 +85,7 @@ var elementContentType = [...]state{
+ 	elementStyle:    stateCSS,
+ 	elementTextarea: stateRCDATA,
+ 	elementTitle:    stateRCDATA,
++	elementMeta:     stateText,
+ }
+ 
+ // tTag is the context transition function for the tag state.
+@@ -93,6 +96,11 @@ func tTag(c context, s []byte) (context, int) {
+ 		return c, len(s)
+ 	}
+ 	if s[i] == '>' {
++		// Treat <meta> specially, because it doesn't have an end tag, and we
++		// want to transition into the correct state/element for it.
++		if c.element == elementMeta {
++			return context{state: stateText, element: elementNone}, i + 1
++		}
+ 		return context{
+ 			state:   elementContentType[c.element],
+ 			element: c.element,
+@@ -113,6 +121,8 @@ func tTag(c context, s []byte) (context, int) {
+ 	attrName := strings.ToLower(string(s[i:j]))
+ 	if c.element == elementScript && attrName == "type" {
+ 		attr = attrScriptType
++	} else if c.element == elementMeta && attrName == "content" {
++		attr = attrMetaContent
+ 	} else {
+ 		switch attrType(attrName) {
+ 		case contentTypeURL:
+@@ -162,12 +172,13 @@ func tAfterName(c context, s []byte) (context, int) {
+ }
+ 
+ var attrStartStates = [...]state{
+-	attrNone:       stateAttr,
+-	attrScript:     stateJS,
+-	attrScriptType: stateAttr,
+-	attrStyle:      stateCSS,
+-	attrURL:        stateURL,
+-	attrSrcset:     stateSrcset,
++	attrNone:        stateAttr,
++	attrScript:      stateJS,
++	attrScriptType:  stateAttr,
++	attrStyle:       stateCSS,
++	attrURL:         stateURL,
++	attrSrcset:      stateSrcset,
++	attrMetaContent: stateMetaContent,
+ }
+ 
+ // tBeforeValue is the context transition function for stateBeforeValue.
+@@ -203,6 +214,7 @@ var specialTagEndMarkers = [...][]byte{
+ 	elementStyle:    []byte("style"),
+ 	elementTextarea: []byte("textarea"),
+ 	elementTitle:    []byte("title"),
++	elementMeta:     []byte(""),
+ }
+ 
+ var (
+@@ -612,6 +624,28 @@ func tError(c context, s []byte) (context, int) {
+ 	return c, len(s)
+ }
+ 
++// tMetaContent is the context transition function for the meta content attribute state.
++func tMetaContent(c context, s []byte) (context, int) {
++	for i := 0; i < len(s); i++ {
++		if i+3 <= len(s)-1 && bytes.Equal(bytes.ToLower(s[i:i+4]), []byte("url=")) {
++			c.state = stateMetaContentURL
++			return c, i + 4
++		}
++	}
++	return c, len(s)
++}
++
++// tMetaContentURL is the context transition function for the "url=" part of a meta content attribute state.
++func tMetaContentURL(c context, s []byte) (context, int) {
++	for i := 0; i < len(s); i++ {
++		if s[i] == ';' {
++			c.state = stateMetaContent
++			return c, i + 1
++		}
++	}
++	return c, len(s)
++}
++
+ // eatAttrName returns the largest j such that s[i:j] is an attribute name.
+ // It returns an error if s[i:] does not look like it begins with an
+ // attribute name, such as encountering a quote mark without a preceding
+@@ -638,6 +672,7 @@ var elementNameMap = map[string]element{
+ 	"style":    elementStyle,
+ 	"textarea": elementTextarea,
+ 	"title":    elementTitle,
++	"meta":     elementMeta,
+ }
+ 
+ // asciiAlpha reports whether c is an ASCII letter.
+diff --git a/src/internal/godebugs/table.go b/src/internal/godebugs/table.go
+index 7178df6..90311eb 100644
+--- a/src/internal/godebugs/table.go
++++ b/src/internal/godebugs/table.go
+@@ -31,6 +31,7 @@ var All = []Info{
+ 	{Name: "gocachetest", Package: "cmd/go"},
+ 	{Name: "gocacheverify", Package: "cmd/go"},
+ 	{Name: "gotypesalias", Package: "go/types"},
++	{Name: "htmlmetacontenturlescape", Package: "html/template"},
+ 	{Name: "http2client", Package: "net/http"},
+ 	{Name: "http2debug", Package: "net/http", Opaque: true},
+ 	{Name: "http2server", Package: "net/http"},
+diff --git a/src/runtime/metrics/doc.go b/src/runtime/metrics/doc.go
+index 335f787..f68e386 100644
+--- a/src/runtime/metrics/doc.go
++++ b/src/runtime/metrics/doc.go
+@@ -255,6 +255,11 @@ Below is the full list of supported metrics, ordered lexicographically.
+ 		The number of non-default behaviors executed by the go/types
+ 		package due to a non-default GODEBUG=gotypesalias=... setting.
+ 
++	/godebug/non-default-behavior/htmlmetacontenturlescape:events
++		The number of non-default behaviors executed by
++		the html/template package due to a non-default
++		GODEBUG=htmlmetacontenturlescape=... setting.
++
+ 	/godebug/non-default-behavior/http2client:events
+ 		The number of non-default behaviors executed by the net/http
+ 		package due to a non-default GODEBUG=http2client=... setting.
+-- 
+2.43.0
+
-- 
2.43.0


