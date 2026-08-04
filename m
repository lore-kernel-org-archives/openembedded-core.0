Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2AA7C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 13:11:35 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16083.1785849090193362657
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 06:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=tOAUCaLH;
 spf=pass (domain: est.tech, ip: 52.101.65.67, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSdUTmwe6OencxCItVB4jYTG8eKRCE+HOiTZ//Vrtr6tGi0fEiJGPndbNeE1f0XIOhHIV8sibxnEX5tnYgwkoCfcNCxU9XAUgSJmWA0DGEgiYdJOx8HHPr3DKRB1Ofoh6fcRY5bA6v8GQnGJoZb1nqwOsg7+yaDVjWaYTGqMtI1asiocdmRL88uR/r8kLEUlY2eAC0rYgoC5KM7OhZFVjkvhY57+ofrg5kVrwX+yPs+6s0Rld7EPcpqBL5mlLuhxDU62A4QhvTdz/e+yW6RFWI7r+49hrgrB+slmvmaSVlGPmIEqfofi9MVu6NYSV2oPsKHSJu/eCFhu2mjr+wn4Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSgYssN5W/+YpjeJO379S9IsoQesnK4x+LXiKm2UcQQ=;
 b=NRPn/LyeWN5euLTIp7uCjeY0cy5eJvNf6Kg0qg5k/PWRbj+gBdWiCtQU7NcaS9dI0UUQQ5xRGqyJA/jnDHLsG/TGPrVtgHkcMm8oDKBvAxsDfqme6DvGBb1cQmt5fK2RWPZUjAr31rh70NUm4rUrkxwIaoRalQVHYiblk4Nk8WFyR853FBZgJ1ZBDfUT3zJJcKDyfmkG6YUdtyGpSjfE0RGO/p3x82EGz9x68q94ljwYxbI7sE5UYz+KBhun299QYDHdC+9tzNQqpExRkxtjTdVN1utXTWVmny13THQWueoVoGAt8JistvUn1wcrWtbsuuqDc/I9UUz+Fg52lUNWcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSgYssN5W/+YpjeJO379S9IsoQesnK4x+LXiKm2UcQQ=;
 b=tOAUCaLHOvQWv+cfAEHGpTVHgcA4J2N4GA1cW1W7/wNxwTLDmEwjWzf8QK+cCte2/CSx/V/Wz3f4E2NPbOz6iVXWWvAZe2aC2s2O781vERkdUR9nGuiuWR+gy+ok464i40wZcLmCUCjTIXFematqFO3vJKQOUbW78+sTLEQ12b1F8YTeRjYpy7lHKLfSKa7wGLfmwd1rnULY/7dDogWRYaJW08+3pHG75FL7FPWFMHQwImYwnY7yjH9iFE4mPyavCZDciM33VUGS96l6KyCzOVnvljcUWRffJZhNziLZcJ3KFP0n+/OWCqmLcOwxEcUpW/C0OlWE/fcaD/j/Aj81yA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PR3P189MB0858.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 13:11:27 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 13:11:27 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH v2 4/4] libssh2: fix CVE-2026-66035
Date: Tue,  4 Aug 2026 15:11:13 +0200
Message-ID: <20260804131113.3588-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260804131113.3588-1-jaipaul.cheernam@est.tech>
References: <20260803084141.46902-1-jaipaul.cheernam@est.tech>
 <20260804131113.3588-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0018.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::23) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PR3P189MB0858:EE_
X-MS-Office365-Filtering-Correlation-Id: f98b6d9c-979a-4522-fb9c-08def229e48c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|11063799006|4143699003|12006099003|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	Cx9qGRmEs1RbWZAKlbPrYe1M+43X2euwAzDy1hdtOkd/HjTF1qNC+R5ON9t5h9udPQdkVlurmFQbPFP64Ow9rVnQSf3ZjPbV0Uc4V+Ke160Yo7zYk/JOKCwTNJt5bN6n42cxStZt61zWU3aSi/Qcezup12NxXzcFIJ/nC6xCLkCLsrQtjlt3T/lifY1G2jPrp/4ybcIq87AuqG4K3Pux+qqckrsMsHoaQOlsdX/yU+KqTUkZiQfZq7qWmfcG3xwf1xzH/L4UXRAz7X31ZgC5DcgQUzxhlJZnXi0a/qlUU+xLVHXvDDkxqWTcUkdHbxLqFyBUJRrAgu0BnckACWt2hFOtp8fxJXkeovTfn1skZBpElykOlWtMF0dPyhn9VnlSYau+77mYQei5yKY1jfg852Lj+RdmrRDl05SKnfDT7n77OP7NY91y1tJcpTLiWQfxwHa4jI/aNvvEgIPd9Q1duXHsEvkwC326wUD8/HjCd+XYi7BvmOYHh9FZzfSMV4COoknbl95tlSjg4qzAWQCIdlU2DaA3mUReVcyvO5Z4gnRNjQSi96fAkONIJLDW1ogd80SWYtdOydWWsjNfeaCTiOL4FRIm3bKayODVZ40+siCKfu5ZeKSWTUOJQEIzWyTJ1Qs0rhz1HWsNhW/16HRlXhbwDF5OKst08Nh0oFsdoOM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(11063799006)(4143699003)(12006099003)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?whxu8FNPzWckPQAWiHTO5OYB+4BJ/PJg400bb7SJK3Lbarv1aw//n1ZLGdII?=
 =?us-ascii?Q?3UA3LaOY5wPNl3MuSb8CAPOl+ToeO/QN15LvUKbmy5A79jbdhU2z1psR+bEc?=
 =?us-ascii?Q?RBf7C5ZSxJdCMoNfOIOte+4zhYtiYY2tFkqEXRT5XEY/VDL8RNWiWwycaDJT?=
 =?us-ascii?Q?TduYsIuHNMffEj7e4Ax4uczBCX8ps/sxFI3WqPWwJRUAnO4nKFt+8Klug0wn?=
 =?us-ascii?Q?2gOneGn21PdoJG/KFB+Amul6XZP4ZVglsB1WggWUASzsXOgkYfnHwBcRqjKe?=
 =?us-ascii?Q?Pf2Bm9gCVLIZvIUdnVLnQVUbucORKb3HNAvisClvqhBrOZif9pVL5wAJt6MQ?=
 =?us-ascii?Q?ECk4CHXdW1CaAkEGXvtSBXMY1SqISzEB/aDru2b1ckMrNrvPzumTRgLfUz6P?=
 =?us-ascii?Q?xN3jcO4sIazOKwLkiGIbozUrUz0xnfDjTcwH+eoN2NMvHtSdolQEgJzFCs8d?=
 =?us-ascii?Q?wojPzf/eL2nyRMomfNuAx23enoxODt8h9JK5YPzWzgYtbSuQKAzKc+PJUFSe?=
 =?us-ascii?Q?vwBNQAH5LB6lO1JAsh1qbtwkbxXsWutoinJikEsQs0Ip+f6/H2xvTZLNkPAz?=
 =?us-ascii?Q?SnesQ6IXbRjS8wU/C10MXYPSc+x/0JgsCv0ZMez4DCcQpSBY50qBeS/bldij?=
 =?us-ascii?Q?3mTcy4grw4sS1iJcPJiNy2NUSZiSSmRDCckizqK86EkbKb87k9Kzv6YatCNw?=
 =?us-ascii?Q?jRfI+1ceE32QKC/QWBh7JEEqdca1G5AoH+hjH/4wHazswdlRUl2lVwPIhvht?=
 =?us-ascii?Q?ybg+Grnlmmik3ivw887jPmGnixgXxR5WJTuBVpaDsNsoNk1k+6icOa8DRbun?=
 =?us-ascii?Q?G26tRTTRhRb53sP74rBHWwOKmrFVZ27D/1EBcpREOTw7bm5ZTNaQYb89loYi?=
 =?us-ascii?Q?TJXsmAXs32Zg6xmNRajACrgenUKqzweKcyu8PExkgMXcul5a5w7RcK6R7xkV?=
 =?us-ascii?Q?OANRQZROs4XEfwlBkkImlr3WqookPU5XNZK1N3t/Kd7dhjEq5KzhCXF8k5ai?=
 =?us-ascii?Q?qJ+vOadOP/9NjsjSmtT41xD7pS1eIFPwP1Q8q1CIYkv2CYHR6GOsSH9x+Yj6?=
 =?us-ascii?Q?gmGsVRMn4WkfUJLCY6yeYzS8261oV9pFVtx0SOo0CyQsSflNxIWV3pkd6fVc?=
 =?us-ascii?Q?uCmPB3zbL3EbVs0hLOSt1yrGSC7sHwSKfdITt1Xd/zshJLaxKb+dMhggGQwL?=
 =?us-ascii?Q?TK6/Bf0X2c7BH7QvrTgjcDouB8xpye6TC+vwtlLV+eTveQ6jQpzsYHxE3eKj?=
 =?us-ascii?Q?f1BcPgQkUJ/iHUxDKiuRB7HUM6veaBQvmjfeI/HhyH+KZd72iBa3DUpyFviJ?=
 =?us-ascii?Q?/EF2kIwmJpK7d7RYpJhEopqfg5fkj6+bMMV8ZBH0Yu68sMDGgjzlbJaf1rHC?=
 =?us-ascii?Q?RUHo4A4IWCBa8ZFC/ImIlgYQKU7lYGLZr1YOYmK/IPnhwkhcUaCeo/FEg+Se?=
 =?us-ascii?Q?3BdcQmQOhDGwx3U5a4T2Sodn0AhLl+90KueeZQChH4ENfCBYYBCXXb4ItFjh?=
 =?us-ascii?Q?1RUtqSY3NkYWzzuTQCUwwc0HhmXhwQc3Bvy8Tx9b25748TX5yqbJXzrjhlR0?=
 =?us-ascii?Q?gZazNEFGMUosbRkkCAIEzZ3JHygBi5BiTEDjQE64xMgVC+FQ2ompzc/gZgET?=
 =?us-ascii?Q?vwxK0OmDdkQRg9Mv6W62SjnS7DAywqIc1vhr+n6JJuTYsPKGmlety+2HkF5O?=
 =?us-ascii?Q?y6GDhPx9nDDduK6GXpNb9TXNOeNkubhyDJDYxYyTK2vWjz0SDPyJwPbFZS2+?=
 =?us-ascii?Q?oO5vKCdIAEMzzIlOZGIFgBJA+MeyXrs=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f98b6d9c-979a-4522-fb9c-08def229e48c
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 13:11:27.6907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W0YBKigIEzrngXCF6AHfN4fDFdBIHh75lDI7TRlrcmPl4LbJcsKmBNkglMQLJ/e7eUsRNRCadr+/uDgk6ZbsuWpdhg84UH3mGddarDowYVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB0858
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 13:11:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242762

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-66035
https://github.com/libssh2/libssh2/commit/42e33d81577ed4b95d4b4f6f845e5ee8e=
fe5eeb4

libssh2 ptest results (qemux86-64):
  before: PASSED: 1 FAILED: 0 SKIPPED: 0
  after:  PASSED: 1 FAILED: 0 SKIPPED: 0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libssh2/libssh2/CVE-2026-66035.patch      | 56 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66035.pat=
ch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-66035.patch b/me=
ta/recipes-support/libssh2/libssh2/CVE-2026-66035.patch
new file mode 100644
index 0000000000..7c15f92fb6
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-66035.patch
@@ -0,0 +1,56 @@
+From 6671019836476649792eea12868a370133be1abe Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Fri, 3 Jul 2026 18:22:55 +0200
+Subject: [PATCH] transport: fix potential heap overflow on ETM decrypt
+
+Reported-by: Vladimir Eli Tokarev
+Fixes GHSA-6c79-444r-wx26
+
+Closes #2198
+
+Backport adaptations:
+- The upstream fix uses SSH2_SAFEFREE() to safely release allocated
+  memory and reset the pointer. Since SSH2_SAFEFREE() is not available
+  in libssh2 1.11.1, replace its usage with the equivalent NULL check,
+  LIBSSH2_FREE(), and pointer reset sequence.
+- The upstream fix renames decrypt() to transport_decrypt(). Since this
+  rename is not present in libssh2 1.11.1, retain the original
+  decrypt() function name.
+
+CVE: CVE-2026-66035
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/42e33=
d81577ed4b95d4b4f6f845e5ee8efe5eeb4]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/transport.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/src/transport.c b/src/transport.c
+index d147505b..9f386e75 100644
+--- a/src/transport.c
++++ b/src/transport.c
+@@ -242,6 +242,17 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted /=
* 1 or 0 */ )
+                 unsigned char *decrypt_buffer;
+                 int blocksize =3D session->remote.crypt->blocksize;
+=20
++                if(p->total_num < mac_len + 4 + (size_t)blocksize) {
++                    if(p->payload) {
++                        LIBSSH2_FREE(session, p->payload);
++                        p->payload =3D NULL;
++                    }
++                    return LIBSSH2_ERROR_DECRYPT;
++                }
++                decrypt_size =3D (ssize_t)(p->total_num - mac_len - 4);
++
++                first_block[0] =3D 0;
++
+                 rc =3D decrypt(session, p->payload + 4,
+                              first_block, blocksize, FIRST_BLOCK);
+                 if(rc) {
+@@ -249,7 +260,6 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted /*=
 1 or 0 */ )
+                 }
+=20
+                 /* we need buffer for decrypt */
+-                decrypt_size =3D p->total_num - mac_len - 4;
+                 decrypt_buffer =3D LIBSSH2_ALLOC(session, decrypt_size);
+                 if(!decrypt_buffer) {
+                     return LIBSSH2_ERROR_ALLOC;
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-=
support/libssh2/libssh2_1.11.1.bb
index 7d3063d930..faa34ba3eb 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -19,6 +19,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://CVE-2026-66032.patch \
            file://CVE-2026-66033.patch \
            file://CVE-2026-66034.patch \
+           file://CVE-2026-66035.patch \
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"

