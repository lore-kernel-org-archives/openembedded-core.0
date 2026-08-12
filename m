Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B636AC5B56A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 13:17:45 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7160.1786539108889967896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 05:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=WxuEaTV2;
 spf=pass (domain: est.tech, ip: 52.101.70.47, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xuyZ7zB6Rg2wF20VjS/U0sNJ4W9I8GJkqF10O6w7lYmdCkpkg1l20YT2lM5s+oZtqK+3xpnEJUKh2ziAOYrk3fmPhxO2DoV7E0mBomgFOZzik8Ao/LLiGUrBQWmXsQVnBw+U0C92OtGficycLm8ifoag6paD58Zd0bRVzW6JLGCnHl1O7t5+Ty52YSDh5JFYZ/WidxX5oNdrQH85kk8xSyjizN+z3CJ3z95/TXu598JLVz8LT4hwgivLLXZzHcqKZyjT3SCzkmEcyqCg5HRiwcLkhitya+MutWEWlmptGEdqIL7A/zMbMGzeB9HtZY6KURh6tJruTk3sUe0HV9Ln4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zqb5G1hBI0EsIkjYAxdhmBAVcf8ktIZUg/byZZl4uFs=;
 b=fDFp5W7DXItxpuvvSS8nOg8Q5J2uTZDF0GF4RqsBwXGxBLMrbDRQTi1lXx1Y3jDWpEqJGAOJQSMrybXIob8tSmQ9n8MRCSjthOAJEg1+1S+Z8YytZCS99PDcAfTRquunMkjQyEcbXph3aT8GYQqNWQcyPpHk1PpAiXRDuR5dj/OF+SSm8H0q0TVE9cn5ClarMxEIhL0ickY6ywF0d4dTkEFyJYM5Bq2oHjQpjXwvp+M8DiS1ddNdsTgEpV/Ixl0vrVyYyWxB49F5lPk/hpeBiVfkM0sqFCTv3HA3pXV4ylwypLkKnHlAbJS3uIeH5+pMlG1Wi6/X4iU96+prHJN4QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zqb5G1hBI0EsIkjYAxdhmBAVcf8ktIZUg/byZZl4uFs=;
 b=WxuEaTV2MxlRbs6nkZkQKeEfly3IFdsw3uzf6+G/f5Bn2iqSiq5lYwU95Srw20jWXPlm6jsJPsMT8q4sD99q11VQcJW8Clv3Nvvwyp3hXt9aexcBWD015mrFAOW75TnEJ0Ti+OfH+Wq5bdWzOVRxCjrxUhv+vH8S7JX32E/O/B0o5zuLBzvy3+QY9KXsJSIO62ob4XM71YQ00PH+CpbCn6q+CnEgnli1hk6JTYnVzxdgsEmp5eD3GKVsWnM40pdSrq6ejIQvVM+pBMhWP4t4U0iIow+jfBzc7t55HrRYD111xx/Px8k3pNEvd8/QqE/usxUtQjDbKDmJwelTabPYWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GV2P189MB2308.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:75::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 12:51:42 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0339.002; Wed, 12 Aug 2026
 12:51:42 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v2] libssh2: fix CVE-2026-58050
Date: Wed, 12 Aug 2026 14:51:30 +0200
Message-ID: <20260812125138.343696-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DUZPR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::11) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|GV2P189MB2308:EE_
X-MS-Office365-Filtering-Correlation-Id: 60a7b622-d05c-4516-9325-08def8707571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|13003099007|6133799003|10067099003|56012099006|11063799006|18002099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	k9QzTHI+F8jvpxJJbhpelGTKzKccueZGLxgON+oJLdXYBTws6zeTF7j+Mf3o1mZmIsa/kyhf2Xup0m2ofN4QQlDpvyZ6V8FfHvkuuvlsv/0XFmnTA3/H447hIDzcYVU/wMna0nVhWXCvJ6wjLrJASJXZ470I8fH3y2lxp7rDIsCuXpWCyGDBlVrnbtsX6mqbnlNFTS8nzUr4qlHUNQrCkhMXXai4382qmoveZ6/xPBavTP2kmqQZSmPx3PUFfmFbX+cRKiN3TLIwYDzZPKX9Oh4j0QSrThl8bBm2tDFdcwfOKA81YgdqukvYanazzvORL4ciw/KFyz4pIc0ZBSE/qVyPETyRrmMhwBS2QEbsGmjyW0KInjCOw42o2mTOWVFB0GnPwFxzAWjnlbRS+BdcIbcZ+tjIkUq3fnzRN2q1oXoFySOwKyzMpgQsK1rNXf1ZQFeJnFDCLUhBdNon65fZdZMnuyck2oypmgBgSqkllBW6A03kYVBKuzgDOUZKpYMndJkeezoLslAKJtgJtgy9YJ4Xd0XeOrgkho9lYBqd3/XwgC5YhX+s/+4tnsLGwAOHX61acIxcFwFy/Xa/+CokYltc35twMqhP2j0AfSob6ZgoXlemZ/FfXtNb9vHoPC0oR7i/ufJ5piKeaNNhHpqyNOqO+ZlYSQ525ou64TyGBxw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(13003099007)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(12006099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2Wdxvc+ihf77/23gcYnQ1KgSSLTy4uPgvugd3gMMH4wFhkk5ZJSkyBLdZ49U?=
 =?us-ascii?Q?GcJYRHTYhFi6XII+ac8l/STTU+TF9MCLjIjxzJqP6RzAWHp0l/ctL0R6l050?=
 =?us-ascii?Q?pPYCXZUUxeL3Y1ykHjx+B2iG/STqr3+CKmO5IqX1zwk0WbiaH9dd26GdVvdW?=
 =?us-ascii?Q?WgvqM3csY/GpZuSs2Qofhd2LqjMidq0WkZ0ENoKHleBZ5O14WxCBOSLm37/U?=
 =?us-ascii?Q?ZInMNgKV0BcFrOMzF7m1bqBDQRQ6C29zfnjdICD+EN9TnH4EmWmUUdQPe8tq?=
 =?us-ascii?Q?25VebIKtqzB7/7+ZitQrEc33lkEJLzHUsa8vEMiOSiDSWB9+U4w03dLmKSYl?=
 =?us-ascii?Q?Q8G44FCBH02NmsaTiz75Ia/7FTaP9ckAiUdNxtVQlr4TrQd8g1qgGqmNIwDH?=
 =?us-ascii?Q?B4xN63CMeCEQJx7GQYZ53n69tCsW+qadbNxs7m78rFl9IaM1/fN6VViHBGDz?=
 =?us-ascii?Q?emD0Vrw8tgj/3Ju9WyjdTRHk3dHltRPGbI9jkTBK3yEpLY7Oq/mSrl9ZTXVf?=
 =?us-ascii?Q?HksUsaHpSKTP62ET/6Z1Cm2bx2XI8PU1galpf5PWWLjstiumJC4izu2ZBuDf?=
 =?us-ascii?Q?OKI3/POmniGVR5qfq4Xuyj2XCsfelGem9e3JeIDkr+aQeI+4KAR/IKB6w1VO?=
 =?us-ascii?Q?09l0u5lSiE1r7bIrinpmgD+f6me6rO6pSMIY9UACs0MrA1RlnaxNJOaGrf4V?=
 =?us-ascii?Q?snXl+9xPI/TM2384K9K2zFv7e6V2SHKJ0ctjjrNuiwmMk+Z5nQKKtKEDTfin?=
 =?us-ascii?Q?0yel8B/a+/W54MHXimIX8ww8b0mrKxSNErwi/2qbLR15C2DNxaVzhO5EyO/4?=
 =?us-ascii?Q?Ok3ZFsFdaY12m+6EtN0jkDADzCydsW8DjZkZiCysaUGz9N4HrkA7soZrWI4J?=
 =?us-ascii?Q?ysjFRWiB2OprY4vIKPij4C132+aTfR3gXjpcb6PmGA7kYB1LK35vVlgHZHGJ?=
 =?us-ascii?Q?N+jJ/Uu/uvcxFgL54h34ZD8elI6m6fMqeMDAhOOUhdToPXjTAUahhGbh/BdH?=
 =?us-ascii?Q?OemuMVGnmWVVL58ztfU6KAazL2DQffMRTTX6HUNHHxEW3nCtc5pZi3h4VC3l?=
 =?us-ascii?Q?bbzxEzhdVsFp9ACqzLY8/AeOFW8+zW2UgwfQEx4ayMYSyVotrkrKPBkfYpRe?=
 =?us-ascii?Q?3+P1k14N4ZQPDOr9/RplBDgTOhojytjmG6n+7XQKrPWDjx0+3MNJj8N/AvuX?=
 =?us-ascii?Q?n7zxgOsUcFrulNLkw9INrmfxmcsCuL8k/LDwj5H+yMojtiVY9HcByyw3wRQS?=
 =?us-ascii?Q?koD+Oq/QlqOcCPIpAZc8TZxPE/wXh3sxxyqiWg1oKHCSUWem2yp+kbfFp/x3?=
 =?us-ascii?Q?DErzFZ/bHWcuJDaNzoB/FoKkgNOrDhxsCt271ymwEVvjgfM0BygLqY2tMhn7?=
 =?us-ascii?Q?mJapBs7UJFQh0Gl6iEYNTLVmEwPyemYkHJ/ibFcSa7USlT6hf2z40opbl5FX?=
 =?us-ascii?Q?2WXeygNRzDsJZiHrzmvkxjEN81a8HoKb5QONx1GCkg4yEmEoWhoPHZ8cYEt0?=
 =?us-ascii?Q?8yvnRAfHmV8mUGh8HtvECoxyhQWNCYNpnNLuSJ+5bEBE5d0JGGhHqfZ3NRJc?=
 =?us-ascii?Q?eqHS+fA1kikV96QgQT4CFCK88/89+VvjqDH2Txi8YcPfPRo+CyQT44gQbb2U?=
 =?us-ascii?Q?LiTTFWCl5dLVJ85DB3QX5JeZZ8vhxJ9iGo333K1qugK6IJaVQB0bDTpSmdww?=
 =?us-ascii?Q?IXxXCXj5bEgUDKogelmFQzOedA1R8kKq6Fq7pEnYu5Qybhfl3tksKW3gzBQc?=
 =?us-ascii?Q?ybmy2x4R3WOPWcE/vf1i/XFAS79CDDc=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a7b622-d05c-4516-9325-08def8707571
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 12:51:42.4772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vMTSKowBqMjlPcmLxO9J3zrbtSVUO+daVGcHGigNBupsW/9gUVee1hJpf/s2VPfoCT1V4YMyLykJlXdo0BcJeVlQ+cxBPviWl+49/zRrM7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2308
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 13:17:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243289

Backport patch to fix CVE-2026-58050.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-58050

Upstream fix:
  https://github.com/libssh2/libssh2/commit/34497525929b9a47f03dfb81887ac89=
6202b7e12

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../libssh2/libssh2/CVE-2026-58050.patch      | 45 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-58050.pat=
ch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-58050.patch b/me=
ta/recipes-support/libssh2/libssh2/CVE-2026-58050.patch
new file mode 100644
index 0000000000..0163b379f3
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-58050.patch
@@ -0,0 +1,45 @@
+From 05b2fb4ec89d75235dbd97c5965dc0e46b405a7c Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Sun, 28 Jun 2026 02:12:52 +0200
+Subject: [PATCH] publickey: fix potential multiplication overflow in 32-bi=
t
+ `libssh2_publickey_list_fetch()`
+
+Cap list size at 1024 elements.
+
+Reported-and-initial-patch-by: Mateusz Gierblinski
+Reported-and-initial-patch-by: Behzod Abdullayev
+Reported-by: Sharique Raza
+
+Follow-up to e15f5d97a04cc676ce117dd324fef85b046207a9
+
+Closes #2128
+
+src/publickey.c: replaced ssh2_err() with _libssh2_error() to match
+the stable branch's error-reporting convention.
+
+Assisted-by: kiro:claude-sonnet-5
+
+CVE: CVE-2026-58050
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/34497=
525929b9a47f03dfb81887ac896202b7e12]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ src/publickey.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/publickey.c b/src/publickey.c
+index 9c9fa618..196d2f9f 100644
+--- a/src/publickey.c
++++ b/src/publickey.c
+@@ -1114,6 +1114,11 @@ libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY * pk=
ey, unsigned long *num_keys,
+                 }
+=20
+                 if(list[keys].num_attrs) {
++                    if(list[keys].num_attrs > 1024) {
++                        _libssh2_error(session, LIBSSH2_ERROR_OUT_OF_BOUN=
DARY,
++                                       "Too many publickey attributes");
++                        goto err_exit;
++                    }
+                     list[keys].attrs =3D
+                         LIBSSH2_ALLOC(session,
+                                       list[keys].num_attrs *
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-=
support/libssh2/libssh2_1.11.1.bb
index 960ff71df2..cdf76abac2 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -13,6 +13,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://CVE-2026-7598.patch \
            file://CVE-2026-55200.patch \
            file://CVE-2026-55199.patch \
+	   file://CVE-2026-58050.patch \
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"

