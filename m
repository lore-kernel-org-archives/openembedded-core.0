Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 305BAC55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:42:08 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38994.1785746521752005798
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=tlOsEBay;
 spf=pass (domain: est.tech, ip: 40.107.162.66, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dH9qJIrmefeISpekuFtyUBYqqGKr+Q8g3AFTfKfFGMdn5OsiwKE6dSUMkKPH4e74WFl21KK/Q/HG4leP6SJbOctM+zjmIqGJpei8oJCD8xKgjtDdh/3qQq6klgsUFaYAIz66XbRMz19gPILZ1lVEfn+JonVhhDaAmf7PrJUel3mGZQnP7ui86TJg+OLqcejE/T3TGx98JCmjgpuvl8Cl3ftTb9wRiO827KOa22VoIEgAhp/4rfaicNuDs0Ui9vW8d97zkZnJ9X/MqRnflF0nsKqjyfKy8zRu24Mmlo5UsKp+yNW6HoDB6fyTHc3SI/TjIUtNzRIzpeqGMJ1UzKQ/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ug/muZfgng4sA3zW23NllW7kWClP+YDKu9lb+8BIGo=;
 b=RVBRE7oZiFBqF32gVgjDlO/KtWHo62xhlS8nCNWvZIHeQXDgQHHxdmOqYFLjzay9W6iB4+8ACQRpspIhm81vs6sRGBDP0Tai3gBD4uVr5Yjl7O83kto7spBlAezn3IucZSCeZliL4fH6F7JEAca58u3NE4W5DbJswdx6vrLDRZMSdkvfs7jAqwaSrNM+AdGmMHEvi2Indu2/+o6OPK4qI8Y7f7wbf17koZt3VXlkvCH4k3B5V1H7AwHE2IXpdDE2pd+WVVvgfpndTLOtrc3s1g/zBMZcwPcw5eeOoVfj4O4TC3L5IEKDiNkzYI3+6sZRmpMpplC0vGaOfUeUCPFrrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ug/muZfgng4sA3zW23NllW7kWClP+YDKu9lb+8BIGo=;
 b=tlOsEBayW67DHed7W9I2Wuz6SOUarrBXMbmwze6v5mNnW6xpxr6gLqgvRzZSRpS2mgmAoOFVVFCubUvq+r4zhUj7AkSX/wIeCTAbqajni0SczRYxYTB4NnQ71O8Y+VcqaoT98UwmBCfJ9XhCeXSaTWR3a2msrlm8bo2PvwjjN7N9famevsAw60T8vzridQdVbKlLjAIm6RWNl1RBQjxBRxo2k5m6VSgCwS6jGsYJoMUJDQk4GyVY/YE+vf1d8YCGGAkzEEkkifFpmBZAIhe6/zgHgEYD+dSCzm3/cxE2n+AYI89lMJSw7pkmNAQn1ttZQUsZQz7XVPxSd9LtGxvLzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB4P189MB2215.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:380::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 08:42:00 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 08:42:00 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH 3/3] libssh2: fix CVE-2026-66035
Date: Mon,  3 Aug 2026 10:41:41 +0200
Message-ID: <20260803084141.46902-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260803084141.46902-1-jaipaul.cheernam@est.tech>
References: <20260803084141.46902-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0327.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::32) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB4P189MB2215:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c123f6-a122-46c4-6fb4-08def13b159e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|13003099007|56012099006|10067099003|11063799006|12006099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	XEsrJvDtKJw2Q0hbez7hMo2NHJ9R+PCIfV8WjAA5FhaPh5kphnMnNeG8vG7yEw5SfYUg5Lh1mPjU2ObfXg1hpnfYkIDjyvEsLczID5Yg5fRO1RGvWYV1IbaxTteu8eiKRM3RHDia+bkKnwLVsSaSmBMlg3frNBtr12rC2F6QSIMkwQYYRZofwFRC7/3gw9yXGFlpHqz/oygkOFsptHJa742an0gThtJ+w58crI5I+TbKDhOUPJ4Y4PV4+dQx43JrXxklAYK4Qt/FbBOf4hpLIZ23y8yJWNDCCzqEsrjguTJomJ/b8pYgdVp/GV2Wew+EwFw3Nz4YF7yq5MXdoYVwy01Z9kPld85yP/a4qD/VwGbtCz83zeRyC8TOPPJZlz2WYzUAm3QY64kmriyFxJfl0DCXMeueKwsxZM1TEZH6F1VTmgg8FawA4Z6920/g+xyZ0yBqThJ1aEjGeMF59+BAbTt/rYtwN7Oe6R4r3s9zAcNvjuvfg4axI3S+CPwZtbvHxAwsyEa4dw+AV7DAhUWxDl6MUOijGsNQhKRJBOo12ivjVyUBu/ehxhZQHrnx/RoxbOQNBHGtXZLP6QUpboI2gmgnf/T9TlzM26y613g3hS9xZi6cgRSqTDz5pqeNU4ks9KSF/oKdw7eETnIqeifqiH9XB4Eqt9foXDf2Jnrtt8o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(13003099007)(56012099006)(10067099003)(11063799006)(12006099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CZvYO5euw2Eu2vOMGQTj7wbDWg6ok4s2fd6JrBw/NLOTVFWaw8OH0mM6LwqV?=
 =?us-ascii?Q?FrTnimNHHb8JCrTm6QyQYu3RsBUynU2UXzFEAn8Gvu3ylJ11lisdlpdSqOip?=
 =?us-ascii?Q?i1ybICQmuJeYW1TMC+pMJ3xAuj46KwGz2bmqmITZOfPt+zMCyVEG35o9D5WI?=
 =?us-ascii?Q?61whzcD9S7VedUtQL6zQxUvheartYkyBcd0iHcoIaj+IPOOYM7V+kguUwyYU?=
 =?us-ascii?Q?cxELoL/AXg++koFPBM48+Fdip3SW8au6/leBfmUNgb7JXUJxYrx9qMh9F8Ue?=
 =?us-ascii?Q?eckTLAsHU5+K7GiAh15pmA45EyL80mxFT/L3fGwRkpHxXWz/VKaL8eKe8bx7?=
 =?us-ascii?Q?U7llC9LL1SSUAvsjuAJFaP3un10V5qQ6atF2K/tzCH9x6L0TX56c+NuqTAKO?=
 =?us-ascii?Q?Zi+pUl7+HGQPHYGHy28Qg02gKpIoigRcyGNCeg6NkGHKmg0a7jafyR/yC3bg?=
 =?us-ascii?Q?Z4h1ms/FASfCxQ8wOd497jK95ujq4SrKCAe+C9g2m0KoE8dhiahvdGnKb4GI?=
 =?us-ascii?Q?BIMFc7CEjXLRVID/YKYJfVGU5Xve4fjng2KTW2gqi0tOoyZXiqnk/yZa7qFk?=
 =?us-ascii?Q?d5b74J1HGYnJ3IfDxd2aB1zk/8uC6cftNNY/T7joOc7+ZZcNMLMSEDbjwzDu?=
 =?us-ascii?Q?arfTJqMy6Q6sCVTIuobHaIKDTAmRT2abrcTGrQPYBnPf1aTlz6UKDB5mtDJy?=
 =?us-ascii?Q?4NBC4TeKAsOQtlicPnFUdRDkjDyB2Yk6nmj0Pk3LIfGqmHl93SRMTpKxv57W?=
 =?us-ascii?Q?RfuCJ2DqaPySsVGtXume/9GgbcWd0JpfWwJDo/6UDZ1V3zthMP24SsB0xCwx?=
 =?us-ascii?Q?Ptby4JHIVRbLfJf3+wwipYLCRRwi/LKNLTRbjS6Nisj7iboL2loJ1I0wWioE?=
 =?us-ascii?Q?wRf1pvA7qjEwjePIjZYNyBb1tC9kQngusQOXX4ifzfW8rlTKQmfph7L+TMZh?=
 =?us-ascii?Q?aroraqtxpj/1DykVXLOKks91KmlQEzw5Syf8YZaIhl0XNAtmayNF5vXCB5BB?=
 =?us-ascii?Q?SXMEBAUKHZYkR5Dwr6vQKa3QM1ayiuiLadhPECgGhlf0gIdqKHhvk82FmkKv?=
 =?us-ascii?Q?jccj2bqf0vh2rVUI7dV/TGzU2D0NfhJlVWFtsMaNFA7dO4Lu4GddZkS9LEwo?=
 =?us-ascii?Q?AedH/1ThPi/OZnqMTDxWgnWlXnFpm9F+h7+Va57YZbwo4KDCp21OlwTD+zjN?=
 =?us-ascii?Q?vji+pH2IiUw3+YVsnN0+nz25yXQnGRdyLWW6q+0Druw2rBdoNBWkBfay6ne4?=
 =?us-ascii?Q?9FXlT9F/2clFkx0uliWP9LQW+5TyHTrVD2BF+FYVzhZdauliekl2y6vEcUEP?=
 =?us-ascii?Q?2/R03AKsRfEb+ZIFH+RCXBvftfZkGrdte5+NSRt3c64UiV3uDMX+gwADN4e6?=
 =?us-ascii?Q?ncSobzB1PNgjIcjps8zeCTjUO1dgisaNnLg0TaCLrLe6IotCNsEE5Qh3qfnK?=
 =?us-ascii?Q?Bbsmax1USyUbRcUHiB1BkHM2jUF22MKRwbiYfGbe0BEQEn1f9QHng0k+jHFY?=
 =?us-ascii?Q?7eow7waJ7jsSbXC0pdHdkV5uzn1/GARxff5/gWFpltY38ywJRYI29+Nqu9wD?=
 =?us-ascii?Q?Z6iauc+H2V0NH4QTefZt7gyr8+jpgFc+laBcK7CL2uYpyJqflft9Dsps7L6w?=
 =?us-ascii?Q?g9kB+mEAGpvCjqh6w2PqLXPgVq1g/CC+YqSerTDrB+P6zwMW0Ys69wywPVpd?=
 =?us-ascii?Q?bHMVEvmjK1NkED9rWH63slJ9CUB0QkjY/squXZLpG2/s3wvlz2v5/+Bxorus?=
 =?us-ascii?Q?+z2AIiTZIgev6yuM2WrZuI/Bem78iCU=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c123f6-a122-46c4-6fb4-08def13b159e
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 08:42:00.2397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uXVliQX7Zcx7PySEvaTQ7Ld/Sz19XNAOh/uGPADc23dunEZkyn9PzPbhOoHgOIbJyKv4uTU2yI7bm7mZRzq2rgsB083jNeOjgTRqFJb48hI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2215
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 08:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242625

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
index 54022aa879..dad363cac5 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://CVE-2025-15661-3.patch \
            file://CVE-2026-66033.patch \
            file://CVE-2026-66034.patch \
+           file://CVE-2026-66035.patch \
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"

