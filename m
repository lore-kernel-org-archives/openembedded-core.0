Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D99BC55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:23:24 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14923.1785846200774366114
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=rGcF+gtQ;
 spf=pass (domain: est.tech, ip: 40.107.162.10, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ow55PwE2pIfw1N4LBwUR7lqzwcs4aweY6b0UTOI019o29ORwTXg0M3sKuXbrswFhHzaHXVqwjevSlIcTSlXZXpTgprAEFiyMF+Z3Kxs/GDBVYKqPU6REyuoXy2N6jZd7M37MVEaEDopVKHybvr7tdu9WsaUPmD7brRhiqFoyDAPMIP9pnzEpw1/O+DWpy/lT3zEHq4lUHEX27zHCd/A8F8uqD1gHNSEn5eYhcw0hQVoeH03lpb9zQ8QxD+vj+lAimZVm9kA7joaMT7b44qgKdeZrEmRf+bObnBiWWK1Cre389KaOpAvh6kp74QPU2G88MMErWoLt+RNEw6Yb3o8+wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEjRNk5QQFou3T0VijtPuiL5SmnVrfr0J2q79KiBNSA=;
 b=IW+DIOnii6skePEzo1gRhMQbKWEmSiuymBDsKcE2asFD5xESTkXTL/YZvUC09LfIXRiOUYJkvx9eqyg7m51Q3WIS4AUzUmzcMXRZFVDIH7FYWMIB9LhUf/hLeKoiefwkIuxQk8VuqWnCSBnY8/dRO68u3w/Lwvgh48h0XGdw6xywGL+8xmxnM2SN9sB2rTU5bWdO6UE0ZxgcuBwBXK8rE/tjj51xbatUCHF2JYUJHltoY+h07iP6x/mgvrACxSIgQ230jgA7t2XtjJxW62oEJphqEGvAd6k7AOPlWMvVbOWdG2PWkmiF7t/PKtoCxdlUA3KLgicMV4pdNlWsBHIc5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEjRNk5QQFou3T0VijtPuiL5SmnVrfr0J2q79KiBNSA=;
 b=rGcF+gtQ3RXQP7bsiWeHs8iY9TO+Xoc8mR+x4rEvjyb/KJ2l42f3UtCssb03wCwgd/o3SMD9fhqUYheUdeVbvaIrlL+XyCp5y0bJtkqWiXXnX9oAMkQVy3oP4az1GpCwEg2ooeVVWcQC5c22qDW0gA61xWh4SNe64LQ7BrUJiYmC+M/wsMf/YW/aaVGA6mo0OSG17vmhgKpkXlsqvujW3jiKAS9qYOKUTNAo8to8qCRUncOxhQihQZT9t0l+T6tvAZ9ZJt/1M2zVaZbx9DUim8jntvNxkekGr+Kf1wWZya6kEl7wi1/8BkHd29D5J49r9g0nsUhqO5gkW1gCgYyMLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PAXP189MB1880.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:280::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 12:23:16 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 12:23:16 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH 3/3] libssh2: fix CVE-2026-66035
Date: Tue,  4 Aug 2026 14:22:55 +0200
Message-ID: <20260804122255.3053-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260804122255.3053-1-jaipaul.cheernam@est.tech>
References: <20260804122255.3053-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:54f::20) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PAXP189MB1880:EE_
X-MS-Office365-Filtering-Correlation-Id: ed0eeb3e-81b8-4e5a-0e06-08def223290a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|11063799006|56012099006|12006099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	ztrTmhs/W2FFBiI2zSL7ftJ1qJYedVYREWtO/MBwiW5nnTHNjF1myn7lQXSptq/N0ozGMJEweVKiW01vcVeQapB0bGPZfNkXnW5AluWIA2JXwxQoWXJkYGJzZPpejk56MsdRQypRqoAQ/2H/jbIXiiJj/MmPISM7Z/hgA6vlu+6h3M0pY7L15cBP/biyDdvg9N/+t5zuuKyLvWO2NOaEhhXHVoo51gotW/iM1fKOO8SshsKBFRtsA3oy7jPunJTDcknyryv/TdOcdS+N+0hRSeBawK7vZaOYH6si0nmGr5N6+66K1w5+8gtlPZX6V44RTy+HTSrI3UEpHXVAgKqcFukGzIpw8y5kfxYvJSoaDFKZS71DY6Q+XJVJtB8lrxYYgo+pjG8PVKGMmscSwkl+aPn2dd/aZP9LXcZVUoLIBtw6PCjR9Dzgcfy+DpvK3Ugp+IdwDHZPnmZ98k5bHCZIxExvT+ZBiEomksofNX5S8VwebwfNRXhjoxhZTZseBHnqd/H7GMoxBro9d1Og5VKybcO7gEOKJMkLXDrWIugdbwaOvD6Xu6jofc3moh4CRvukhC6dKpGJYcfWFxGAVpkRdGyBnO1EIZPWRTufvrZHOswvaVC3ooZtE3L2UqrsLxBD9juLZ7JBD6knPVhSRqosMVXUVBFqLLcr96SQ7TcvTFE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(12006099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?r8JY5kZ93FEO5M4pQfIvKFpF+9qWTGaeV9lGp3BZCmYl30UjsErw6t2CD5ax?=
 =?us-ascii?Q?dzUH7vV9eJb/Ubg6TOR0OSyI/fx+L/UB0oDq1ItphBuqfl08KXU7pQnIXe6P?=
 =?us-ascii?Q?m4S+nOfsPuoIOdWwnyxSCIsx7/D5NZQnLUY/ush2yMAeUL3H4W5PYMV1UYAu?=
 =?us-ascii?Q?kysi+o9IRlB1WENMmB86GzUVkjPyI9WyIcxgutKXFPiLMwvooMYGoxxBTypR?=
 =?us-ascii?Q?G3rcj60DBo+Nl3FBOnHCUSQmA3nvEDACgJ1ow2zI1qEYTGQA9cq1bQ4yxgEY?=
 =?us-ascii?Q?Vdx0uGcpneRjNuIgZKg+YuJaMcUPLgY5ENbDR2/ynqvYro37pL3zUJwKdCRZ?=
 =?us-ascii?Q?CVycw//gxDa1w0TNcCpTfhJaOsbMEE+0KXTQUCTk3rzNPNB3W1IzpEpTm5/z?=
 =?us-ascii?Q?Q6+5XxYh+6BW2oVsd9sxTAP3Jvau92M++/FInKaaSXarAjNCPi6l+4m+lZoJ?=
 =?us-ascii?Q?IcuMd4UNFHYNQmaIElIznDp4uw0jZhBqGfad7MbdWPUPjSLdiyzcqyPZpeHI?=
 =?us-ascii?Q?1SDG6fUq088zO69BntZ84bDrunxc/s3A0m6Cp5su12H6+Hn0VHjg+rhMfnkh?=
 =?us-ascii?Q?i0sF1YENlItJy6Y67SF+prDEFS+RQsjPWs7purysCFvMhPhvJ16q3U4yTPgZ?=
 =?us-ascii?Q?XJiV4K2UBaZ1JvrRrRuyL9TGYYcEZHAH20eyvAXdhHtsx02gX/kdJR2/MoDM?=
 =?us-ascii?Q?3Uvq3CPlPMauHhdzX8mqbwrf6J/zI5Ax6YsC0TxGNq8pvdQR6owfc5ITi3Pk?=
 =?us-ascii?Q?MpGtGdD0dwLynPGfpIL8hCotGpX9QRSds7Oxxhb89absYGho82VlqhyAJZP4?=
 =?us-ascii?Q?fSzzm2XCb+P7NQCZtT9kwMXt2aIZNnY5w1aHA4E6CTFH4o/eu3ofpDxhxrNK?=
 =?us-ascii?Q?g/2vkZSERU8RvE7+Nbf1mr0s8/rtEn7GeIUqHVlLaYC+nUphj4MB3yIlwkTL?=
 =?us-ascii?Q?N2uiqr/3FyNcOzwjd2HaC4/eKHIpLg06le8+2fJ2qLevrWaushU/DgGvu9j6?=
 =?us-ascii?Q?Tu4ndl2Zn8rs8CGQBCkoPnGUE1AceNK1QO8b+E/6e/21BjoFBNJnNUSZ4kvB?=
 =?us-ascii?Q?uyEkuZaeDx7UH37P7sSNfjDYcfjknkLzv6cfc5iAPOcyi+eBvdEV8Mfbqbn8?=
 =?us-ascii?Q?VziC99ZAj1QgdP2jwAy0dqoW2N165jSE4OS2WipI6ZEA34v7A9fCD86bbxO+?=
 =?us-ascii?Q?s6i6P/VRWOXrA4TXu9jayVgTtEL7/uvvg435286oz7N/Mn2pXqlI/7QazYs5?=
 =?us-ascii?Q?38YldH8/ZGeLjPeFlBpGFTGZYVIPGOZfXIu/etrT4/MSGYZ4v1EtxPhtaenu?=
 =?us-ascii?Q?IWfx0QBTSXLpyO7Y2aBycfiIuqeg19d9ibYKlGW0WrSh/MkTI3AI8VswWo9+?=
 =?us-ascii?Q?BaoR0rWme4jyMXHnbv0RfByytnPTnUc6dEDsqWaOQgivH4ZeQpv86OLmHgPi?=
 =?us-ascii?Q?yaQSAbRlYipbkHYNmn92z4BuJJuj0pR6NqAZj4tMhs/JBgYeaIgQEfoqCge+?=
 =?us-ascii?Q?QWgC03HW9A7BeDT7l/NJT9aUMndKMeDS1Yp88oSid0mM6v5p3EY4klfcy2tz?=
 =?us-ascii?Q?EiCb0R8dUk9xKLU329sClGuTG5nFbv7NOYoY4Le2g29ctJrRZ5e/FHtz8gpR?=
 =?us-ascii?Q?2z8T5mUjakMLcMDHuqE9qarNoQH8u8lVdtNinkTtNaS8tITJsB9sT+eJyJ7T?=
 =?us-ascii?Q?mgA7zrNhDMohX0Gjzt62Lx/3GYBTh4vfQOYLqR7xIQfO81YnxOtPUyTKpBdA?=
 =?us-ascii?Q?EIpstShtpgFOK+cnmax5RfBGBCYdhGg=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0eeb3e-81b8-4e5a-0e06-08def223290a
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 12:23:16.1111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pC71A3EEtxA7a71DDoc1L334SphznraJYgHp2wmRsaPtqPUs9+b761Oj63oD0EDjobqCOHPmyh5CaIH1X3hibpB1UoNuxCjoGlFMcbsnTo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1880
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242738

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-66035
https://github.com/libssh2/libssh2/commit/42e33d81577ed4b95d4b4f6f845e5ee8e=
fe5eeb4

libssh2 ptest results (qemux86-64):
  before: PASSED: 1 FAILED: 0 SKIPPED: 0
  after:  PASSED: 1 FAILED: 0 SKIPPED: 0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libssh2/libssh2/CVE-2026-66035.patch      | 62 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66035.pat=
ch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-66035.patch b/me=
ta/recipes-support/libssh2/libssh2/CVE-2026-66035.patch
new file mode 100644
index 0000000000..a57d7eac70
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-66035.patch
@@ -0,0 +1,62 @@
+From 9413a58bd9321e09581598591f8744c48639ab93 Mon Sep 17 00:00:00 2001
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
+ src/transport.c | 18 +++++++++++++-----
+ 1 file changed, 13 insertions(+), 5 deletions(-)
+
+diff --git a/src/transport.c b/src/transport.c
+index d147505b..f1a6f27a 100644
+--- a/src/transport.c
++++ b/src/transport.c
+@@ -242,18 +242,26 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted =
/* 1 or 0 */ )
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
+-                if(rc) {
++                if(rc)
+                     return rc;
+-                }
+=20
+                 /* we need buffer for decrypt */
+-                decrypt_size =3D p->total_num - mac_len - 4;
+                 decrypt_buffer =3D LIBSSH2_ALLOC(session, decrypt_size);
+-                if(!decrypt_buffer) {
++                if(!decrypt_buffer)
+                     return LIBSSH2_ERROR_ALLOC;
+-                }
+=20
+                 /* grab padding length and copy anything else
+                    into target buffer */
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-=
support/libssh2/libssh2_1.11.1.bb
index 8783bbd165..68f72f3f90 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -15,6 +15,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://CVE-2026-55199.patch \
            file://CVE-2026-66033.patch \
            file://CVE-2026-66034.patch \
+           file://CVE-2026-66035.patch \
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"

