Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1036CDB46F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 12:09:04 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19193.1782216539138677403
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 05:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=DxE0w0qd;
 spf=pass (domain: est.tech, ip: 40.107.159.53, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCe0GpVdorcAbfrHxanh9UoNdrxuexG7ghoCpde9qDJxDt+3VSCVSQgx5w29dZ6wObooO4rx8uQCF+MDDiVoPlc87aJe0GVxXJd/nRHqed0F0tiRIIh3SEOsbMVkaLSNIULlHTMn26KIThFezuJZfYY6LmzmnHCdAsTemaKsjXtB8nNX0b1JbdFPlf5a93XSdQPIlOyMWUe7st+oCN4MRMnDG+vhnaNHdItxSBggowMVkWgJWKAexVWWftvJMjfjF0A1hm4NFBl4w4fCeGJhUkilYcD42XpsnAZOue4GFNmZ2cVVg4JuFYOlJKFzk/VSm8VuRj4lI8d8tok8ElBaEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QU5TKkC2pZDyVmt0xxEmK/rUl8S59Fjb1MUeJnyiYvc=;
 b=LBXcZXcZFVl36svJ2KVeXyXOX30JtNWrzl562s7xHr9J85XgYIY7lJddoPidAyaB3cmEAE+GzbKMQ9XlLdUHfMoR7TNw8+gc9VP2YPNK0D3n4JOnq+ZRqTdBY+6+z0Wb1A4+dcSE//ph87X2GvvxLvnLJJskK+/PT/lruDPXYotrS+ZH8QsK9L6ykmua/ZrUXCd3z6pl5BYBm0fG3vJgdWAHUTUjB/uuSYyj7z5JPtTscpPCwBHdQs4c7eXIUQ2xJcYJPmWmUuGIEWz0jN/DglsUP5+4MljP1ukIU8SLismA+jeyus8+rklKyd65P2+lfDLv+aEn0e2zoTLUiEF9jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QU5TKkC2pZDyVmt0xxEmK/rUl8S59Fjb1MUeJnyiYvc=;
 b=DxE0w0qdQwcCbU+OM12wI36ivD9vcRioYdSKvaP/RE8Jn8ExG+TOz0pC7oVoEDV65CFAAIW7YHxrAp7qgru2AGsAY3hMfpelUsLnmfu7HFwj59oFDItvdodTICNIAmQQ6XZDEdWoJjh7TTdIen1G/6GWWcCz5Q9oqg9DuYmlemwbob7BaXtDF+UEoa749ogcMtdfUzJD7lOa0F/lZC+KpUp6yppBnodaiWlWSCYOXVmGjJauIdQRSnTqWygot5MgekWZQY6ziNTLgJhLMUnFVib6clah0uG/1t+pTY7gyTj0jl9w95JLZTjxpedTuudkxLEkAMoz+x0jK15zC2gDxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by VI1P189MB2597.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:1c6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 12:08:54 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49%8]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 12:08:53 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH v2] curl: fix CVE-2026-5773 - wrong reuse of SMB connection
Date: Tue, 23 Jun 2026 14:08:50 +0200
Message-ID: <20260623120850.29881-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0022.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::13) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|VI1P189MB2597:EE_
X-MS-Office365-Filtering-Correlation-Id: 3705d60d-070a-4172-ee14-08ded12031bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|3023799007|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Vy9/MJTn4vgT5mGaaL73vbpQbGRJahjiH/Fq6OWOzZgMEew2n3smXvqURo7PmF/XqmkCqxy/IEF+HgEE1fj1mxDxDzPEuM+Ai0dPXcp1ZwAxf/1Z7nHiI/rIOzPADdWt1naTXI8lg0vtnuwHECjP8/2ntxNA6hQ2y5LFcFV85kQBl3GHC2FvYp7YlilCRnKcmpskCXxnulsUs7+Al0qOg4pGYA3hrD9OGetZFP/EdjcrwAeYgGAeDaj3DvQnRRggzBQYcBzlqLVdOVRUC6a/7cuFATNp+L9nuqjGw3RqHpz8yK9A3tCVyPKsZS6BXVz2ydh/Ha/gc+pVN02V3HnXlH01rMDAffLxPOdgrpd3mhI4S937y8fRR25g4dOlSK01Qa0V5/EjyA9bp6CRqDh2UBlFwHVXFYyWM2qMIDVj1Hn6Pk1S7sUvS9/iWoySrtx3deM+CjJdLFqg+QUbj56ug2tgZv4wqxDlc2riVKyoPvJR9WgSColE2TjOQihUDTtzynKAQMnhvJVyK/abEIgBIyICNK/f6xXZBJZB5xtxBcEMsiwhxxCXUHRvC1HdurBqkYR1b8ApIndpe6QAEI7Rk/z6DpCjYhhC/3WkjG7yaN2h9eayztMRRkvATo1avrrTsVbAdj32DzHSUeEub/W+n9jnjcEeZCUW2zDADvkwO20=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(3023799007)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qaBv0XFkICmjEMkNZ1Y9aazGjYdLhpRFt/Ka5Ekr/v8bCxAOi26bhR5zd67H?=
 =?us-ascii?Q?ueDEongwaADY7OQ8a8b9YfQvVnhSYHzT0OOBHKoIF3I+GpXX8Wqp3SJ7cKwe?=
 =?us-ascii?Q?4GPligzRLnp6MiWltt2sktukbM7VDRW1yuM+/Lfe5WY5QFC4nb7MUC1qbkeW?=
 =?us-ascii?Q?zkS32aGqYP2fTkizV6hnvMoLbmwZMUIJ34ixkJZqslI8X2xqunETj/fbVWn1?=
 =?us-ascii?Q?jbZ5BVRjZTybiNoQLa/gGMwjEN0RIlSvdcpuW7l9hQT6zV/p4UwcSnlhHgEn?=
 =?us-ascii?Q?g8ttIdSt4bdGY/OI61Q/GYzLYsHnvcpKGdqVO+enUQs7Flb9pEptq38OaCP6?=
 =?us-ascii?Q?8937psEjdZoE9W/pe34EqRYVuPnRPGfe4duYP3e2U44SeVp/JBaN4w7D/fk5?=
 =?us-ascii?Q?8FfTukb6krXkrSRm4ur25lrA6nXo9eDftDi1txPbZBmfgFCYIF5VgFADCSTr?=
 =?us-ascii?Q?m06aK0B+dy6yChKhgDkbSnJxdVRIW8Qqh8N6s8www3+M9uYW4xzSnM/bWz58?=
 =?us-ascii?Q?Ml2QQZol+oEtmBhg6XGuPDUv6O4CIJk5yYUt4wOhbUGDVOGN7yx0JTMtoC4E?=
 =?us-ascii?Q?m6CHtT7C8BRAk46CabYAVheTV08TXSSo04j3YiRtbd4PX5QaxrZPrpHNu84W?=
 =?us-ascii?Q?vXANMyCv6ki3HMuzp3E4F9/MBevkRCTw735lQ9OvSD9nheETQ8AFUee59T01?=
 =?us-ascii?Q?NpGi3eIZBYkHPq/yi7O7rj/qKS/M2K8n8yWtbL6ttuPNrh05AVYYxh+2+pL4?=
 =?us-ascii?Q?uqUYjTCEJEpmm9T744ohIMN/r9bzBzcLuKtO6jxgGkpggRcUBPYmBqi3Yo/b?=
 =?us-ascii?Q?Ql4W0REzK2APGVw7+brQmqrhq6+6ibfTPmz6QPsefMCvOu1HCzsuqeMkWTeA?=
 =?us-ascii?Q?V+xPB4tOT3TNmPlm8PAmq2jrTcu+8BwS8DiDdJQ/q7wGiXh2L2POgN8bWVaP?=
 =?us-ascii?Q?hlfElCk8N/DPOe2QBAFquPCW9dmuoqGyswtZx9WlSbmOlqNA8jRLEeoeu6si?=
 =?us-ascii?Q?gdWGv4ZwAF/cbsBj+uRdrClmfqNCkfz9LXKv/SBuq9j3ydcMyb7UZSfCj8aT?=
 =?us-ascii?Q?bHpNkI9VIJsJNLF6DZIk2GvFcPYwBGeTKwUyqd+icYmiGaf6GM0tgUr61XA+?=
 =?us-ascii?Q?Wv3ZEoommqMQe8w4FESPyb6FY5rVFtJwHMK4psFbyV3Fqgi0zXQM94V/M7fn?=
 =?us-ascii?Q?603i/nmf9+w4/ci0yRspIJYN948IC5xWi6hJwaJzKTqWp+4Kxyn+5IxLr2KT?=
 =?us-ascii?Q?UcCpuC9b/MDzWXC+fpGmaxiSDDeS2wg6q6x86llNhBD+TQlXpaqgwUoj2R+B?=
 =?us-ascii?Q?PkmE1bKNec/65PKexTdDOuJsF+LGGSn2LWE0hi03Vt5SrHwxxYUI8XTJ3WSf?=
 =?us-ascii?Q?ugmauoZYhurjjpbWEbg0Vdt5by4z6ZlhAEsJwg02EKNPiI3+VktVsOw7/pdk?=
 =?us-ascii?Q?sXnW+CPACfVQo8uUCOd7+9OMOiCk91vu/SC24FEiIm7RWeoTaNWEQwLvELCT?=
 =?us-ascii?Q?CU+wxw9aGjKEty16ltFWR8iBDx/XcNgrejxWHx9xPEHbhw7Lb/j2HmTnJvLF?=
 =?us-ascii?Q?h67XzjJC23Tj6YZG3u54CAbHhlR/9SCRRdBCXQZPqMKhiST8aGc7ntW7LovT?=
 =?us-ascii?Q?FN0dtOGioYqsF27YEBw1OAL6fyXDxczy0vB+CEYILxCDKJAuKdcbXs+MMeyd?=
 =?us-ascii?Q?vlIfsNZPYswVo/6HlGsr5b0LbtPYqXZeGPL4S1udh9U8UyLM4L8JZRrLH1AD?=
 =?us-ascii?Q?rR19XmbsTlkXQkCXelvRG0qtc7GRmmk=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3705d60d-070a-4172-ee14-08ded12031bd
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 12:08:53.8592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJsxuZKIHVeuUJ9GhJm9a4OKCj1memKSOb9NRiQlQqhi794n267QhuKkic6ErDCt+U2HzoZITBOmxV/wVZrx2i8pJHnh2v/5lB3R0cfmDWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P189MB2597
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 12:09:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239365

Remove PROTOPT_CONN_REUSE from SMB handler flags to prevent
connection pooling. Without this, a second SMB request to the same
host reuses a connection authenticated for a different share.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../curl/curl/CVE-2026-5773.patch             | 44 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5773.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-5773.patch b/meta/reci=
pes-support/curl/curl/CVE-2026-5773.patch
new file mode 100644
index 0000000000..c2984de5ff
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-5773.patch
@@ -0,0 +1,44 @@
+From 74a169575d6412dc0ff532acdf94de35a6c2a571 Mon Sep 17 00:00:00 2001
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
+index ccd4f3f69d..2a9f08388f 100644
+--- a/lib/smb.c
++++ b/lib/smb.c
+@@ -1242,7 +1242,7 @@
+ #endif
+   CURLPROTO_SMB,                        /* protocol */
+   CURLPROTO_SMB,                        /* family */
+-  PROTOPT_CONN_REUSE,                   /* flags */
++  PROTOPT_NONE,                         /* flags */
+   PORT_SMB,                             /* defport */
+ };
+=20
+@@ -1259,7 +1259,7 @@
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


