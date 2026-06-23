Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8406DCDB46F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 11:49:44 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.62])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19241.1782215379090045153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 04:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=wkl78siw;
 spf=pass (domain: est.tech, ip: 40.107.162.62, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIkt+LM9EU1OAs6gYVNKbTaSV0F7Y6t0Kj3zoaqaqD3TxPJdbKChN9uZZYThCGk/uQKMFs4ns09Y+c9ZFUJT3pwtmh1hmFzTOmywLWUw6xd90g7YexVDpp6+WHuipYyO67zBTZKIy3TfEsUeWk0ntxhiPgCoEHzm/LU1x7JnvzCdqdXAQH4ljfJxMIf7hjbT52s+ZQreRYhJ3J1F0ahhv1SRO2qOWxNSOL0El7ZaeMUgO+DwRw9usN4TO4auvDG1unncNNH8ua1ih2Kt3jYJEERjock8sWeiVkzLLGzUcaiSQjhUea8EiEXWGieg5Jn7xSHnkOReKQ9JP2oUOblPDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlbgEmHdgsspMm6ulsPPMrfOqnPkLFJh1waQhu4Chgg=;
 b=sb3wsCgYwv9hALaf0jTohwFI2M11iFhK4ZiAAmJ+Q2eTF0hD4RJZ1t0k/NOKnOm3b3cLHFfXsmOFuM5b22lFDT6YXug9ywtJB5onY26QE7zkLGAj/2UnT4laFlgKiWAru6884cQe9FZa84ul9n9lUhdQcbFQsB8MVAF01T/aYE4KcKS3Ji2/KS6ol+HJf3ilo4R59FIzjKPXHGPWeBV2EAPzoV+dPmI1/4sgb70nBU+KJQypxWzDUfdi/nhz0ZevvmInchcP3++V1rdI33JaTs7BdCroQWfcdqV8s40sFr3NmgblVJuXm2yY8/hO/Mp8sNNUgwHz5vwnvgjgsWqsMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlbgEmHdgsspMm6ulsPPMrfOqnPkLFJh1waQhu4Chgg=;
 b=wkl78siwwIE7o6QyILmRHJF1bdF5bfNKrk8cbyARrHjlUqpWupeUm0VJu1byTTFXKsNSz0eduh7DDnTCRn7isQRbglnpTZgR6sjz3+fyXnqcnOCq9LnwOjhGQj6ryNWnp7Wx9mJAtChmRlVPyrO0PJ+iwYlv/VovecUQ8QoTbUh/hJvLMkWNKuXeUAx44HAxW34uxYUJFpihMNwsllvEUacuucYuRtjLv3MTmt3tA+cmR72AA/YGPoKKFvpZGOi8LFQvT9B/vQroWFkscjVZ3hN5yArfUkJ99y0MaTeqTRwCajCoCkkXbaFTiG0dBCPECgJndzL0pKpUf7h95IiOug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB4P189MB2416.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 23 Jun
 2026 11:49:34 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49%8]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 11:49:34 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH] curl: fix CVE-2026-5773 - wrong reuse of SMB connection
Date: Tue, 23 Jun 2026 13:49:26 +0200
Message-ID: <20260623114926.27459-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0015.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::11) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB4P189MB2416:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fa02dc9-d3b7-4799-3682-08ded11d7ebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|56012099006|11063799006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	pcThmorKxVlB0BXOuHyeKzLgm5wtqScT6uWAzKW0zCLazoeweJ0Hx2AHEYBuj2YtRQN2AqArw1idO+7aAPOP0p/YVukVHL3CJjWJaL6manOHx/eZyRwbTCnzkDB8uCls8DVxGXn9qg8WlWx97AFIfJf//+jL5wNDh8QzsqXWv01PPjbwRLyVXbk0AeRaq8soNdDDP3sOEUdoMMk8Q4mQmyTJzBhIjt2Lg7WvkyjtvLxXq5ubn/lVQF9NbSqwDumloDcPIbWrm/h5cNq99dq0ehQRXU5TCXhzD4JcozskhJloRFbmetPc+M02520LngIki7NJJc36ICnnWr0gP5WWiwEeskrvFR8zrUBaOIyGSy6+k5ZAVvCKsdM9I5OPwFpByjpKGWvtDRsIoCBVoNyHG1Bec0hhudKh2p6arH+bxxcXSZACodAKF8hoT0xFcviDXY+oI5dwhnk255Br6Po2B5dwNUHWgKB6lboHwF2z+eAobdKljhu917tf6QNfZplaxhZQnWBNXcpy1MkmvYAmnBp+GQMXKJMaNsa+tIR1L0PTPWSpcuopWnQIVzuRhf/W1HtUhAF9+DsVwBDlrPy7OLcjQQ5U5nSk1V+5cnE88FhZ3cglxQsFz5VTLxByTy/rq28uRjpcoXs/324ORPkkRD/yYqom/UfLie19FjjbtSs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(56012099006)(11063799006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gRcwugeXgRMpsKrY4RzT6MNtso6D2NYvAzhoYovBbzU0HRiBFEcK3pmaZcrs?=
 =?us-ascii?Q?MsN8ySeKeOnSzCXPillSTnUUgmihHPaaEh68PlFxrrTNj7e7GFaIRwRNCbhr?=
 =?us-ascii?Q?llbTsGowyVvsgQZrBy0PlziSPqyVaciWxRaMf8vOHCysOvpH+mt8D2QzJ722?=
 =?us-ascii?Q?S9+FkI6Ho/AzxVU1hzpN/EoAghBKMxBhVOYieEyrjAUZ0y1Xil77Cx2iJcU9?=
 =?us-ascii?Q?F1/aZ0WEUGths5879TWzCOFkoS3qcwKisAULiMGmQPthLtC5GTV9VioHSCtT?=
 =?us-ascii?Q?sFnBRLjSLJLGj0CCAQloz88OsPvYP72+W40Mw4VykpJ9m0i8KiRpdWNANL9k?=
 =?us-ascii?Q?7zb6sX9cL2VPlYmtNPyoeIOUyoIF3CkvzV0wBPpvPnvRabePIr2R+x5BUwNK?=
 =?us-ascii?Q?wzBJ8RTYSF3EtMoApFzw8wl8jyTAOenJScu1GJkB2r3GPQ6M4L4+0baZvPi1?=
 =?us-ascii?Q?BSv6LbyLErjvbw+cNKY2C0dM9AFZ0sT/bJFWfvuJNTGqd9+0yizhLdPIGgOF?=
 =?us-ascii?Q?0lPJ0YhA6NNoNLbj7HJNHR3OTtKBMMl/Ox4z3yrcMYRwPSQ9264FKojtr44k?=
 =?us-ascii?Q?66pPAO+rMYhxvQZQ/m5xwL3/CvWJ7GreJcT16kdPMxP0C14Z6U8/1yt1qs3L?=
 =?us-ascii?Q?L0cbYY6z7QOzDPVZGWsO+/Cy5Z8kEKLr7jwbJsxsbEIA6JEymX3h7gj0v4Hb?=
 =?us-ascii?Q?BCvwzH2cAKIOGHe27irK9RwwvG3ZLjrcSsFtVTWl/6JL25ibUrDCWtBo+hJt?=
 =?us-ascii?Q?dWxUEg5WOtxkpRkWprWors/TmN75zXY1DzQcAUbf731ILaNquTYkoSHiZTEC?=
 =?us-ascii?Q?BNB9wvWutOcDQ5S1IavLwApirCIbHnfPcPwzAhVV817pxa+OQ27zGVkHaLaO?=
 =?us-ascii?Q?um3AFUi+6wWJYG9P+cp0PPDw8asmB2GHt5UrIYcH8Xp0B/W1JWtULoB4NIGh?=
 =?us-ascii?Q?qSB4TYVqEl/7cWiqe4XfOh1kBPfIHXquTkklMNVyVgNmC1CGlOF/PTKUAaS2?=
 =?us-ascii?Q?sz0lLv5pjDF4YNzT+5lFpfqXgjfJsGU3bI1L7iKKQ2NX+KUefCdCVfXJNoZM?=
 =?us-ascii?Q?/PQjz6WuLCM6lLXpONYlFz4C6nSO7znMpwqPD6qXdunsP1HJMcXzUTCMJMGO?=
 =?us-ascii?Q?YhKazcfe5lgpU+OeFA7DZzbm6QEmapMhu6wD7FJwbwRT3ASvq1BEI+XGu7Mj?=
 =?us-ascii?Q?d9X4Z8iwnwDIexcQX1YbPvPzArwzCQy4aZ/8o5uFaqgOVyaRWAC+dcZ00MZ0?=
 =?us-ascii?Q?/vX2fIoMfK7zBxJSsA9qHOgucmN3MXKmqRRay0x2bguDcttSFY4WiGdCIR0q?=
 =?us-ascii?Q?O9otqsQztO3UMOqjDJaCQgH6Ul2F1H1tn+trS/Q88P0HUqKLT6D31I0RQmBn?=
 =?us-ascii?Q?U8gl/utkY9cQnBlr66yFf4DpuPrtCWqxSvgXaIr2vMySLBjM0bLBtXhjAwEc?=
 =?us-ascii?Q?OMdvH95hAQTEgw+paeDC6/GruWCLICeG0GpOxPpnbfRghRJcAsf/ufe2pszZ?=
 =?us-ascii?Q?bagmgX+rW1iGVpWxaVZBnIhqXmosdDC2qcLSl6bUE0mNLICnAJ2m5/1EGz58?=
 =?us-ascii?Q?sqpv9frdqxiglcx6IYuHav5dCjdf+eTCSLh3wVsstKv9nu+Xhfzs53anRzKx?=
 =?us-ascii?Q?BpU22ix+jB0FPSRVB0BytEvimumThgsnVD/xDPr0ZEhUiYB8aJdfVx+LnJBS?=
 =?us-ascii?Q?g6tsnqotfO5a5KXAukhPlGjaBeM6yq/j418ywc/F6zA3AjM9cwDRdRTcLUmM?=
 =?us-ascii?Q?O6bRE+cV9MeRRkIymlBCeLIra3Ckfzs=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa02dc9-d3b7-4799-3682-08ded11d7ebb
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 11:49:34.4991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AD9x6htvlZXPubMePqUEmrPXPCFK9dvSYoUyxHlsY0STpL1gQr1lf/bEbhsofqMUi9lyuiULstirA1RyR6ecjTANpsu2p2N7TowNWK/So0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2416
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 11:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239357

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../curl/curl/CVE-2026-5773.patch             | 44 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5773.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-5773.patch b/meta/reci=
pes-support/curl/curl/CVE-2026-5773.patch
new file mode 100644
index 0000000000..b89efe80e4
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-5773.patch
@@ -0,0 +1,44 @@
+From f13ce17168e6d37b3c6d1116a4fd8f2424c2c1d2 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sun, 5 Apr 2026 18:23:35 +0200
+Subject: [PATCH] smb: disable connection reuse
+
+Connections should only be reused when using the same "share" (and
+perhaps some additional conditions), but instead of fixing this flaw,
+this change completely disables connection reuse for SMB.
+
+Reported-by: Osama Hamad
+Closes #21238
+
+Signed-off-by: Daniel Stenberg <daniel@haxx.se>
+
+CVE: CVE-2026-5773
+Upstream-Status: Backport [https://github.com/curl/curl/commit/74a169575d6=
412dc0ff532acdf94de35a6c2a571]
+
+(cherry picked from commit 74a169575d6412dc0ff532acdf94de35a6c2a571)
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ lib/smb.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/smb.c b/lib/smb.c
+index 00297ad..c15fdce 100644
+--- a/lib/smb.c
++++ b/lib/smb.c
+@@ -1242,7 +1242,7 @@ const struct Curl_scheme Curl_scheme_smb =3D {
+ #endif
+   CURLPROTO_SMB,                        /* protocol */
+   CURLPROTO_SMB,                        /* family */
+-  PROTOPT_CONN_REUSE,                   /* flags */
++  PROTOPT_NONE,                         /* flags */
+   PORT_SMB,                             /* defport */
+ };
+=20
+@@ -1259,6 +1259,6 @@ const struct Curl_scheme Curl_scheme_smbs =3D {
+ #endif
+   CURLPROTO_SMBS,                       /* protocol */
+   CURLPROTO_SMB,                        /* family */
+-  PROTOPT_SSL | PROTOPT_CONN_REUSE,     /* flags */
++  PROTOPT_SSL,                          /* flags */
+   PORT_SMBS,                            /* defport */
+ };
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-suppor=
t/curl/curl_8.19.0.bb
index d58b774011..3326f478b5 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -15,6 +15,7 @@ SRC_URI =3D " \
     file://disable-tests \
     file://no-test-timeout.patch \
     file://CVE-2026-6276.patch \
+    file://CVE-2026-5773.patch \
     file://mbedtls.patch \
 "
=20
--=20
2.34.1


