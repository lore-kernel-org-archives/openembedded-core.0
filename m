Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA44CD4F5E
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 10:10:18 +0000 (UTC)
Received: from mx-relay08-hz12-if1.hornetsecurity.com (mx-relay08-hz12-if1.hornetsecurity.com [94.100.139.208])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33222.1779358216615093967
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 03:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=Fup9+gds;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.208, mailfrom: tgaige@witekio.com)
Received: from mail-francecentralazon11023073.outbound.protection.outlook.com ([40.107.162.73]) by mx-gate08-hz12;
 Thu, 21 May 2026 12:10:14 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEzxqmpBeqVtTQXLsEreN/z3YNuREhfFx8/nZJmi+FuIiKQd4xX5/aV27hdPGB3msMu0eNvKsyeh2swqUxMXUzcVPdQ5FLrY8ikuAtdCPjPxYRLzw3ivxkHMJ6jrEn2Rg1Ghr3rVsjOdOyzJdb8O4GTCS9oGDfE2ZAEDbzhtBKnA108AvV/CSVUPD/CjThbJM1bTcA4Kfs6OAUN9Aj4D/5WfkjaCPudmvMBWKlrb+LfGCPOKDmHTTHTUlr9zaVi89ebSLpykOjque78IJtbKABDbc5jFoLJ2Wr6QxUE77p5/PggQ+gIEEOiupehuyOQNv+cge1i9gfRwBv1LZsCsfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHQfpXt2r/9BOx05q0Is2BIK7Gf15UOnQwvduk5qv14=;
 b=cMApj5E9WErfMI7gaKu1JRxrMuiFe0LdfzvKdKQZzt5C11fm7Kgp3bIhoitIe9rS8KVYN13BIqjTtRJB2LY0gCA2lSrANJg9WxiL8FLZuQvpUOVSAsxJ67a0Aw9dsr6b1nkoM/cTKjjTaAF0wQmog1Wp6qyfXsGcqEbqOBeRT5xfJzlEFH5jEF6pfIYW67li7LiagqX0uHhc8AygtoEX+NLhlQMcvsTQMYkS8ttjoQ9Gl2j+wb0HQXyFmwCEQnb9ENyv8+18BYwdrXwLm5ZiR5H/URW/a1YIxYund65uDALnC0Bu3HJPR4peYUeHdFquDR4U1EGLAlGZPXjkxxBjTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LHQfpXt2r/9BOx05q0Is2BIK7Gf15UOnQwvduk5qv14=;
 b=Fup9+gdsGeSROveIBeahw/PQ2U3BNe1Vn5j8DjggyEqP2szW7q6uklf0Mei/93lMnto5YcltbtGl3b0gWF29XnFj83FxoLzkkSiM9SXdY0pyuHs0xvpDRPaTbBjwOZWAl1hMvFTHae+28SKJV7y5tlwEDSZ2C2jYlcnpxBOVUbCIuCb3QO/bbPvUJVjun/UJMP/k6wm7SCpjGwAD8I2hZOnH/s4w1c8Ju/Q3YTAadt1kN9gxqm/w+jTNtAv4qJzm0U/E6WiODva3kwPz9F9E8Srk8fYRTJ+hFZv7aG3kGsVy1GdclKpGjvAx46YMmZrAK4/oEgLRt3t4lQTuAodnhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by AMBP192MB2913.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:6a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 10:10:08 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0025.023; Thu, 21 May 2026
 10:10:08 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [scarthgap][PATCH 08/14] go: patch CVE-2026-39820
Date: Thu, 21 May 2026 12:09:41 +0200
Message-ID: <20260521100949.1299757-8-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521100949.1299757-1-tgaige.opensource@witekio.com>
References: <20260521100949.1299757-1-tgaige.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0104.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::19) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|AMBP192MB2913:EE_
X-MS-Office365-Filtering-Correlation-Id: e0a57ca7-d0b7-47a3-2a3c-08deb7212351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|18002099003|56012099003|22082099003|38350700014|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	Gqg4v7pJmzqS+gm8U0d1cG3xyGyUwBcojwjxz+6j/hP7lXFRCLCW9LjsYSiJXp8en2oOBTBF6yo3QqHeZ9ma5gi5WNL90PfmtjpNmVblUeQfAvdbWCsLiggNuL0qSas+DxG4U74NNPcy55JvJsy6x1aTBuSv4jdrY0Xs0DDx1sTY9/GmqFW/UODQ8jJistIhkR63OG6wIboFPqgxB+n2q8pstqjMEX/3LjmI9MQ8WoJoQd5vXC/m4UxsrDUUAQ3GUJsQUgr4zczjVDwglw62ikGl2iPX0MNUo8GJ5CfUT6x4hzf3GUZDxwHqd3q6fBInQgNq100MTb7UU86oX1RnGPo+ChyGmp8F/96N+dyBotYh8Aoq7Q2J+dH2WYP2xsMDvkEmjZATOKsCJ0fk4IE8feqEfe2irWasbdpiQb2S8m3/smCpc0E6Jft10ppOmMWyU5pOWu1D9Dg0IYZ91sa+u0GBGZ1VftK+bIJRs2dTDU4l3Rr66SxIyF420tBUelx5uX6y93fpjPHOrZlO4muXFeLJtiU4LSkWv//BYP3zbaILdweYs+t2P7uLo/wz2+qPT/e1IHAU32t1x1AfrU+fDbjJRwP7ajSlU7xx9hp21PL4vr9s9CsqfMH7SfHzkMa0kQ6kEy5KX5Xqra9tXGiTMRk4goUnJH3sUEzwH8Pb0dYdBvfBy1xrvVsRj8pyVmJXmYHqU0Nz1JCcygeS9ZBeJQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(18002099003)(56012099003)(22082099003)(38350700014)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?G6/grSvjZ555ZeHXly551aBjev8G1ZbZll3NIrd7dz5vBqG0GfWM2eNvhyWn?=
 =?us-ascii?Q?sj+cqAmp4BZn0SeMzIimrR9CiX+T7saMzj+dCTMVxxk8L6otHGMPu2ZLjIn1?=
 =?us-ascii?Q?ir2Gf/BSgmU5QDRo4IlV8A80Zg2EFkim/VYkm/9QKzs8P+Wrz95Chqarrf4Q?=
 =?us-ascii?Q?809yKBDf9X3Nyu/PLSL+zM/8qL+h87pZ1LT1SYYkcmptRfGceZXQfLQEhfaV?=
 =?us-ascii?Q?S9TSs5d0tlV+9L4/BMqYeyuWDl9LrkRslTfMyf1HIVB9dEDYYKf5dNa9/OM0?=
 =?us-ascii?Q?59gDQeXxNZhA1HHl4k3FBtm1nqBk7ltFK7a8QqcaKJUVa6236w5DLOCUEps8?=
 =?us-ascii?Q?3V8zzrffb0/dGegyc3YQQhy0OzrW7BfA/c+y8uTuN4OOv6iUQUivaDoiC/n7?=
 =?us-ascii?Q?nOjiQAaS6ELnyXt9qhJAN3hA48JZKxGbNWDPu9CbbGyU5JroH2In2vz2J3eF?=
 =?us-ascii?Q?DI+RLcSpD8PwjxCWSK52LZq+aWgZcMxb2HogsQIxMidkpEYmcgyDSbZayVx7?=
 =?us-ascii?Q?VAGz3sdVwjFs9iQMLItLFxdUzAzAVwHcydnp6Sj8AJhXP1n8CvBaSpBb4srd?=
 =?us-ascii?Q?4h/609BAJ0NwTpbAfFqqsZ3s5ENxeeZ94ibR1nbBIzGvzmZYG7rxIvez/kiq?=
 =?us-ascii?Q?b6Cwjqz5xsNDFW86d3JVd6sv5B9Lf8JYcoGGoTreAxPySJTz9vdynU/c5LXz?=
 =?us-ascii?Q?o9/xD6F6d0ek6dlhqb+P3jFL5KYlGkkvreVM/VWloaP7F8ofQP/tqPkhQypu?=
 =?us-ascii?Q?nTA2peHgGBxvtyEdW3f1nQwE4CTIl94mjxh8BV3GZjCv+DZNAYgLp//calj6?=
 =?us-ascii?Q?jH04jcWUfI3HjuA2azz0ftqPXbqRfnsWGougo0HDSROtvlLDYyJQKT3RRmFJ?=
 =?us-ascii?Q?Oi+qIZs9G0p9C2CogCzfxdO61ojE+7SVrQRJ2U5YkjnGLAyMgw/1ZBe0YcQW?=
 =?us-ascii?Q?QM28cwygTGNrLzVTb0iEjXeQvk8cDiMiuJEShQbQiOuBXoZRIs1ZcrTSqdfK?=
 =?us-ascii?Q?utK7GgRlmHvyTh5tLXI4/1iTSmCjq2I3RtZeFJO5p12joR3zE6f0n4e/49BH?=
 =?us-ascii?Q?I0d6C7AcVnvu8KHEqeVRmTqrwwNo0kVD11jRld/Ns+TAqBWdJvMIkmPq5dKm?=
 =?us-ascii?Q?0m9a/8N+/KZeNLnPfTnSGp6pAne21IWtnRmJqryA+gWPpEWjvd/y9BHWsEuY?=
 =?us-ascii?Q?xy88WX8e6LFLw4PIX8lHxWVD1cXp7v1nEMK5jjZxMfBNNGcnFgM5yTSxNLJb?=
 =?us-ascii?Q?Gg6wFtVotoD8y0bGUjusAZCMBzjNq0j6VA72mJjz4huxkMw0OMJqoln+6dOJ?=
 =?us-ascii?Q?qbWL8HzWJYh66zNv3pjkjTEVQSLsK7kcxEF/zBVJpKSS+shoKBB/HqoGlYyk?=
 =?us-ascii?Q?dU95I6GAJcfBCpFS07y+IvOE5KjETBdkY4sNApJwlxngqpXzuby1BfX/0HKz?=
 =?us-ascii?Q?s/g0wVYJc9QoTUTOotagAHBFZ729jHr0Ec1+ppsCt5MvuwgUOyhZTeK4ANH3?=
 =?us-ascii?Q?05j5tc3NT2G/Q51w0yuweyw0y5orpK47nKXoDNMjm5/rQDcdT4OYTeK8ymNO?=
 =?us-ascii?Q?kKLk9LF+NzGJ0LLRQHGZ40AMhn1HMMXwXFCFxjcmCZRbB0X/hIiDhK3RbQg6?=
 =?us-ascii?Q?FjiSgrHQ1M6qpHE44llRiMQYTRTrD2cKN8h256KyStdd4ZEfRC7aMEmR0M9X?=
 =?us-ascii?Q?KqSMTK9u0iQ2EY/UDM+5ZexmFLyL16yHh3XIvA+mtWiwms34+CVTY9jqmwGh?=
 =?us-ascii?Q?XUa7achR5A=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	NkcAOgCbLEkfvIuqz5tdFwlUvW2CmnRfiCRIPuJ81h/xzoZMzbI2Kn5O5QJ//6XSwkmLLGDw7MW0pLACeLK4Dm0Senutasc9lIUTG6pQDsnGxH3uxO+A2Y6N7xwokxkIJpy8WEY29UT/qC371/PDRL4iVewJLIFtDAORX1hUQ99H0WUenvrbJWqgJvOpDb/xpIPzEblF1DaVYQqjqYnLLSjwpA+EantUgJ1TIYNd/4zAiPanK0dnZNeLdaK4Wvz00BT2SME9Y1aMpoqHLCS/0Hfn5BRwbvw5F/77ElVDIUQpyrqQAvKoVrgKlnrw92Ksyhomr/z+pUAfBq0eRrKppA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	64l+l6q5/we/zNIX8xouZJF1NaCU6yBl9EtZpzrj77lLX/j9zfMLUp3rQoDSD2dBsUDuFfjoZ7cXTI2Dytk8sucq/Imy08gAN/QzT8Kpsvol9PSZSLQz//PEzQ04y3q3zzPSDsajvqjHygmvdmC/HVWkixvml5p+FaQTMuqPcUHt7+mxa/+0i5Bj5NsMWSvT9aIcJEWuTbaWgt85OjL2rCIIFwhnOwvEuwvuKZ86fjmn6f37cGxhE8s38KIrd81Gn9/S3qrIsGf7IrYeluCOOZlmQ6O/ovmIatnIseQWzNHbMK1Zx4w6YNhqEQ6wzs86wG7SWP6eWPh66JYpPxfZji+sSN46AlIYoBv1To6JIFS4WF9W6HJloMst57RGogCo8KxfuuX8uJSOxagDpQzJRyHoIVvKnCqiinVJ4TYOcXDWlCbYtudskgcPBf4mqVTtQMfm4hVVsjoFD8I3qKfWBB4xYl/Am6D9f5L8p4/wB1+pWlAXMH+uy3imzVJhgiwIHPSMEkbLiHwcFZmQPOD5ri6WJowyXcIko9nDxlz/cQPL9ZBvdBBdapXZhdJu3hH3rk6yLXh1eTqgUujGQZcaPM+sebnOtwS7oZTRkwI1TmxiPSF75S8JBYt87uuD71Xh
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a57ca7-d0b7-47a3-2a3c-08deb7212351
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 10:10:08.8377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sW57DHmXAJQR3X7dEyBzDFtGZGWUxubI71ZudQcmgYQF+BfckegzW5i12c7onSnqFaEuRI/X9wdSRtSxTgvaeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP192MB2913
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate08-hz12 with 4gLkg55Vpfz4HMKR
X-cloud-security-connect: mail-francecentralazon11023073.outbound.protection.outlook.com[40.107.162.73], TLS=1, IP=40.107.162.73
X-cloud-security-Digest: 731a9930aa06e92ea60cb5630f3acf7b
X-cloud-security: scantime:1.423
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 10:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237487

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1] mentionned in [2]

[1] https://go.dev/cl/759940

[2] https://security-tracker.debian.org/tracker/CVE-2026-39820

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-39820.patch                | 112 ++++++++++++++++++
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39820.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index dba826011b..002d443059 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -48,6 +48,7 @@ SRC_URI += "\
     file://CVE-2026-33811.patch \
     file://CVE-2026-39817.patch \
     file://CVE-2026-39819.patch \
+    file://CVE-2026-39820.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-39820.patch b/meta/recipes-devtools/go/go/CVE-2026-39820.patch
new file mode 100644
index 0000000000..c5f84282a9
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-39820.patch
@@ -0,0 +1,112 @@
+From e459f8fe1061679f866c599210466db386348f08 Mon Sep 17 00:00:00 2001
+From: mohammadmseet-hue <mohammadmseet@gmail.com>
+Date: Sat, 4 Apr 2026 05:17:25 +0000
+Subject: [PATCH] net/mail: fix quadratic complexity in consumeComment
+
+consumeComment builds the comment string by repeated string
+concatenation inside a loop. Each concatenation copies the
+entire string built so far, making the function O(n^2) in the
+depth of nested comments.
+
+Replace the concatenation with a strings.Builder, which
+amortizes allocation by doubling its internal buffer. This
+reduces consumeComment from O(n^2) to O(n).
+
+This is the same bug class as the consumeDomainLiteral fix
+in CVE-2025-61725.
+
+Benchmark results (benchstat, 8 runs):
+
+  name                        old time/op  new time/op  delta
+  ConsumeComment/depth10      2.481us      1.838us      -25.92%
+  ConsumeComment/depth100     86.58us      6.498us      -92.50%
+  ConsumeComment/depth1000    7.963ms      52.82us      -99.34%
+  ConsumeComment/depth10000   897.8ms      521.3us      -99.94%
+
+The quadratic cost becomes visible at depth 100 and dominant
+by depth 1000. At depth 10000, the fix is roughly 1700x
+faster.
+
+Change-Id: I3c927f02646fcab7bab167cb82fd46d3327d6d34
+GitHub-Last-Rev: 7742dad716ee371766543f88e82bd163bd9d7ac2
+GitHub-Pull-Request: golang/go#78393
+Reviewed-on: https://go-review.googlesource.com/c/go/+/759940
+Reviewed-by: Sean Liao <sean@liao.dev>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Auto-Submit: Sean Liao <sean@liao.dev>
+Reviewed-by: David Chase <drchase@google.com>
+Reviewed-by: Junyang Shao <shaojunyang@google.com>
+
+CVE: CVE-2026-39820
+Upstream-Status: Backport [https://github.com/golang/go/commit/0d0799f055dcc9b3b41df74bee3fbe398ae2f0e7]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/net/mail/message.go      |  6 +++---
+ src/net/mail/message_test.go | 19 +++++++++++++++++++
+ 2 files changed, 22 insertions(+), 3 deletions(-)
+
+diff --git a/src/net/mail/message.go b/src/net/mail/message.go
+index fc2a9e46f8..37d7ff5df1 100644
+--- a/src/net/mail/message.go
++++ b/src/net/mail/message.go
+@@ -780,7 +780,7 @@ func (p *addrParser) consumeComment() (string, bool) {
+ 	// '(' already consumed.
+ 	depth := 1
+ 
+-	var comment string
++	var comment strings.Builder
+ 	for {
+ 		if p.empty() || depth == 0 {
+ 			break
+@@ -794,12 +794,12 @@ func (p *addrParser) consumeComment() (string, bool) {
+ 			depth--
+ 		}
+ 		if depth > 0 {
+-			comment += p.s[:1]
++			comment.WriteByte(p.s[0])
+ 		}
+ 		p.s = p.s[1:]
+ 	}
+ 
+-	return comment, depth == 0
++	return comment.String(), depth == 0
+ }
+ 
+ func (p *addrParser) decodeRFC2047Word(s string) (word string, isEncoded bool, err error) {
+diff --git a/src/net/mail/message_test.go b/src/net/mail/message_test.go
+index 1f2f62afbf..1b165317f9 100644
+--- a/src/net/mail/message_test.go
++++ b/src/net/mail/message_test.go
+@@ -6,6 +6,7 @@ package mail
+ 
+ import (
+ 	"bytes"
++	"fmt"
+ 	"io"
+ 	"mime"
+ 	"reflect"
+@@ -1217,3 +1218,21 @@ func TestEmptyAddress(t *testing.T) {
+ 		t.Errorf(`ParseAddressList("") = %v, %v, want nil, error`, list, err)
+ 	}
+ }
++
++func BenchmarkConsumeComment(b *testing.B) {
++	for _, n := range []int{10, 100, 1000, 10000} {
++		b.Run(fmt.Sprintf("depth-%d", n), func(b *testing.B) {
++			// Build a deeply nested comment: (((...a...)))
++			open := strings.Repeat("(", n)
++			close := strings.Repeat(")", n)
++			// consumeComment expects the leading '(' already consumed,
++			// so we start with one fewer opening paren and the parser
++			// will handle nesting from there.
++			input := open[:n-1] + "a" + close
++			for b.Loop() {
++				p := addrParser{s: input}
++				p.consumeComment()
++			}
++		})
++	}
++}
+-- 
+2.43.0
+
-- 
2.43.0


