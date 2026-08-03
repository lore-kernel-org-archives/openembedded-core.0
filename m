Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFEAC55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:23:08 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38775.1785745381841804865
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=lVYK+yDz;
 spf=pass (domain: est.tech, ip: 52.101.66.55, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6oNHOdlxNT9eDaPhTEi+icKBOm4VXsqUj4w8Mi0GovNQQCwzo4hZ02jQUFuzBse+SHd+WQaJj6tj5uLKkvs+ZNWlwE8pXk184DDE3XEArjUjwK+IHaLO/WwQ7Ox5S6/Im6siLX9ZnkJZ9+HFK6GPONpEbvpjcmPFdBitv9bPs89EfcRxHmSqqRaanhKy73vvtmF/RAX5v3/AiXDbLWG2soCxF5Wm965CxezirVCvxL5iM3PDHpVUoeQ2FP98qpkZizy6XCR4PN7+vrofpT8yCeMh5IkBVcutaUxEMbASsTGnE+hIRJ8DI4/mKFYlaaLWDZQHWDN3tWkQ+f1OW1qGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYTMUBitL9RHLKuKL8Gns5id5jUAAI3Fs7OCvlFLzSE=;
 b=TBgs2gdBvLV78OWVyOdosc6pbx0veL0VhTJbT03TN8b7417Jg9RuGvhEEeK4BjNkgGPKhjKLl3IVfLJUbGwV/ZAB4C6zOt/txIFviufK6+Q/GscScq2vRxghGn8fpDa9j1QX6xZSpNdmFu3ryfHtE8uWVgl6QwGGsU8ABvaSAkGoFAHWEg/JdtGxQdaTwCgabcj5LJ+jvao9qiB2NQ9I547Vkf1QdkBHCgmLGWRoLw1BXKHNcHYJ9KQczdyO+Fh2LDzOFN8uWoHLBXwaKr88navMdEdy3/a0t7ZnvS3z8dsBFWWTHCw0qMs0chPSdLoGnMxSF0/1naGxWZvKfVH/NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYTMUBitL9RHLKuKL8Gns5id5jUAAI3Fs7OCvlFLzSE=;
 b=lVYK+yDziWkl7LhDXXAS5QVKuDdic9DqAzyUsnEK3GW2GNCmpiDadEC8bpikWwqkhCiqU6XMB8h1+/ET+nkkWZqbt8D6A8LKu5xp5FQaPlT1A/ndLOm7uJ8wUenKqB37GJTIr6YjuGUxVL0unJOGlgn3QyrTGI+RqOlHuLrByEI4UAj4fGLMnrdsJOkGcQEgDQCgijtmMS1/P+gPxH4vovLqIDUXRoR109XQ5uJTGj38fPWX+/0O/oucoGKkFGrZKPq2q2rMYVQ/UpgJAkw+YOuAFNrqjqJdylkI7OpvSMpuuFOYTUhueD9eH8Y+9OnsJ3fGWGhitfR1St0hwZSHxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV1P189MB3098.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:25f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 08:22:59 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 08:22:59 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 3/3] libssh2: fix CVE-2026-66035
Date: Mon,  3 Aug 2026 10:22:42 +0200
Message-ID: <20260803082242.44009-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260803082242.44009-1-jaipaul.cheernam@est.tech>
References: <20260803082242.44009-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0333.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::27) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV1P189MB3098:EE_
X-MS-Office365-Filtering-Correlation-Id: f4752757-38ea-42b1-29a6-08def1386d66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|13003099007|10067099003|56012099006|11063799006|12006099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	jnn4QsDjJ1HjxV6wa3XPjszPtV3eTRKLje66QSj2pnImR+wwJTz6DIm8c7leUqRH9JJ1aDNGtdeccFeyrvFbTzQTweiojZdanqievFfuzhZeK8XN5t2cKeuODHSjr3YeLw8DnSDKThlkGFY08DCqz0K6Af/0yklpjXHeCXAmMcPwJKeU7ka0v/h7mdqEqy4VfoZRuW/oFX2dKwd23zaylvwrJ5w7nvpCZogE+oMImwa1fY99ROhyUCTR91AWSZLIePyOJ0HMHnTHp/5VFjV0ChEIf5JE1j8wRBc4o4do8YYVLp/qgEWIjrv/v2IuAHSBcjn/+Y3oOHDKj/zejnI/+G6IDRbdml0/HK97qEe9bFWxjMROHJmH20E+fQ1j4Cg1l+vX21qyp3LR89/ugRWDWq6sW9ckRa0OZCQpuHobBcCJSFFfkI3Xp+ifgPgN0EsR0pnSoOA9IRpgn4/Na7OeNUD4+tpAEkYttDQH6p70x3V9JVPZqwpwBKWyn4S3TYHgDRSNbKW4CfKC08A5PJJezGOuCDl5iwQNMG90PyRlVS/kklOEJ5Z6ebtHJPHBW7KEMOsbhoiDMRZ4sO0xcnS7eZy1hf5tP+iMO/TtLHYMbHXMhSJEhTjGbCElRINkU+nOsiq1//EIVjYMGLgsGnrri9N0cVSixd0cpN4NF2Q/nJc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(13003099007)(10067099003)(56012099006)(11063799006)(12006099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Qevu4RH9GYBJ/oGBAT15Kf6rYGvVv07MWEds5cyyMVQbhumwQtqKEJfJkZ6N?=
 =?us-ascii?Q?tGq7ieAZKCGgcH0AzQ876cL5D2fmJUAIvTzUL8CmfsSNAS5+bE0J0ZkB0B+z?=
 =?us-ascii?Q?zIfyM5DQnbN7+cE2tGDY+0iIKYBdNCLVLS+zftHqiCKyodkZ47yqE2eC/NJU?=
 =?us-ascii?Q?uIzQeVJUfsnZ4BZytMHQI9vlfECEeo5QcI9EobuVSTWFmwG8q02YuGb4RJMF?=
 =?us-ascii?Q?ISyjU9LtalSSk/Ap3pwfswIo/8uILvHOuRB/oBtPVDlA4hwe8XHEux71L9yK?=
 =?us-ascii?Q?GetwuAsBpyLkCcQW5cKk5cuxYGOtLQOAbWR41fbZl9DVmV/bsMqzHUb02d7b?=
 =?us-ascii?Q?hxomY2igbivRPurYTYWXEEB9YDw2s7n1jMB+cvVTp2Z/06EMXPeeK6JRT0TV?=
 =?us-ascii?Q?mfP/715f+Y0MTrvSrogq7KP3SzALktLn+wALkH9UBvU05xk+XIM/+Jv9NlmF?=
 =?us-ascii?Q?5rbO03q7+YfipBLbCkQ2m6xZqL7Nr5xzmEC/usFRfAnuRLx5UcUuJoVm8oJT?=
 =?us-ascii?Q?9ZZGoDVk+ApZ9ZaKIC4ls71p8ACZbJ/t0C23Q+l+rVNtFcEGla4SIBQ3aCER?=
 =?us-ascii?Q?ZENYC+vdXP4RTAXiRabkd6QN0hMqCdP4oIftkM/itINByE+rzRRG1zDcWrIV?=
 =?us-ascii?Q?65SxLQ0skTXtIWtuTNCITCnnnZ1QhxR/fqffaigPt1nvEhvE+rK4S4fzNyEj?=
 =?us-ascii?Q?Z2WaFu3+zTLxRAwir44Fq+Abq5OHw8bYZMg4+tMXEqc8L0tnN6AlRyvDS7kv?=
 =?us-ascii?Q?7QiGZPPq5H/zrN4IgCew80mVyigk0LFZq6WPQW0xrpIO8qcfiKjNHX3OebR9?=
 =?us-ascii?Q?zyrPb4dsmSl08VLoz8cjK3xcAr0sbGQCuA3XZO+8l23QHJZk2cFXAr/JchnC?=
 =?us-ascii?Q?fjb/oDi+uX6ecjm3YThRngaRBECCarq05SQ8C2z3y2UdwE90DWA191JwUOwC?=
 =?us-ascii?Q?l7GNItvNltKvjwY7Zl5sEii6EEA/XcqxNmSJ0klzn1TgESOULOhnxUhN5vwd?=
 =?us-ascii?Q?SPBfcP761/Ip82ar6qGMiFXUosHtU1KvPAJXX4LRxouMx16Husnt/Z0Qi35m?=
 =?us-ascii?Q?GKYct6IIgxdBXHmePrFFuVz5M+tQmZgcJzS2HsEulDC/IX98dMzoavUFKcjF?=
 =?us-ascii?Q?hkl8BNsYeqwiXr6zLBJDx4/iN4qamwpLxADAf+IeDXPmfG7u84aqKfs54ari?=
 =?us-ascii?Q?XUvbqRZgLBRqcuNi5a6h5zuGstJFS+DsGlQDY9NHvXGGUk6zM2sL2yeqP6gL?=
 =?us-ascii?Q?jgghk88txj8BdDp6D3dh5hghe29GtMsyHEq4z6psS0u2rIHtpQJHAqabk3uB?=
 =?us-ascii?Q?VjUYZQL6/lnRToZTfUb6WlfSRcBF2HS5kttPuIvoQdJ90I8qsKAuxU875kQj?=
 =?us-ascii?Q?JeE4aOzZTvt+11GRdH3dMeRi4NtZIs4m2XK4Bm2PdmJ4LHn+/ztsdJA5QHf2?=
 =?us-ascii?Q?BLs61GmLE9UZEXYTvWz4OLxJdr5d2gcPSpHP/hs5UFrwLNr6UNMk5sDdiPUn?=
 =?us-ascii?Q?WlCWi4MxXLyt/Y86rk9lSza0h5aobww/eq6cOnd5ys0aQ2Givk4S9c49SwEh?=
 =?us-ascii?Q?LR4Zx/V7FuF0T71meAVM8XVnV2XsfCZj4PIoGRd+zuQokMtct/iVTYhQdB/A?=
 =?us-ascii?Q?woY/4Nbid62onY/EXKte1ua9fMbZv2QhAlj9K96pAl94YV4K3EIFbGzVkQJq?=
 =?us-ascii?Q?NU9prSFHfpClPhOuHyVDJpYb44GfvgxbefOYELz8O9yFE+mY7vup+TU/e7Gp?=
 =?us-ascii?Q?UA7uiptp3sAG5wb/JLM6ss3bgTGKQ78=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f4752757-38ea-42b1-29a6-08def1386d66
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 08:22:59.0742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6h08T07hsfu/YFYgnxly/zW/U3M88TZ4rC7QeHJrVt+a1qFdzuZVxXpN6UyWGKKIV562/9UpaVWFXAHT0MXBV2V4losZWF/s9wfqHmRFGo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB3098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 08:23:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242620

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
index 9db1685e39..87352df1ab 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://CVE-2025-15661-3.patch \	  =20
            file://CVE-2026-66033.patch \
            file://CVE-2026-66034.patch \
+           file://CVE-2026-66035.patch \
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"

