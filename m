Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6BDC5518F
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:23:08 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.2])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38774.1785745378456652638
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=qtxsevUW;
 spf=pass (domain: est.tech, ip: 52.101.66.2, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCGcPa8+oVmQvSPWQ2uooVmjIVtXczYVzNhvFHrtyDotk9eWpGYAKDae0lErUYnklTQHjV7uCidbjGEJ6Xe3RzCIW5BkZ0IVVJkc5nAifJIc4Jk8qx75IEvmM+QreX71XikKkwv8f0zQJZ+WmrHZ0DodTXJUpeOGcWYkSFirXdvkHqCN+Ss/6/ohseglATP51hZSnMaJCdGxdR+3eJfdRinLChEg8NaZKe0P2ev/oAgJAFRCsk2jaLqSwsDDot4hI4EbuqJci3RATljapZcJexkLGP49ZNwOjjjM4Z0Vsphj771bmWM+FEvPQA59TFCkNzwIKjJKC6gB1Q22+KjjRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nHZYW9YJOtNG3ndD48zyP+5oSmFnbNbMjltLlCRaWo=;
 b=FuFxJyLx4qNfoIgzJQXDZAxzD6al82/DLdRf+MrFzMNQYDspbRTzzllTWVuVBFfHmIk26JNNH51gF8waA6Ypp0Yi9u4oOarXUrDrF3cwDl8T5PzfAxM27aO2cvCUt+pjPXhPzPFqnH0oE5MtT9s2733Sj8kq9xwU0Iop/dqLuHAaq93uq/1XvPizSTrDShN7mMQ7AahlslOqWiDzpVbXwl4fz2W2TpnEND5EYbOYoX6lnoP0L4aCiZNmDBJx3/YtahqI9r0QXQtUjuLi/XKeJobIw6EsKqmxupVpj/2h298AEQoZMiL7AVBleEReK9u8Td5G/wnH/5B4yswwDKl1eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nHZYW9YJOtNG3ndD48zyP+5oSmFnbNbMjltLlCRaWo=;
 b=qtxsevUWltXXiT+ePHGRdRdTxDhk0ZUG5Unuu6ZBKigs+cHvpzVEMYK0mVFwXhAZDWs3YoTeDihhmPFhDPdZ9oArVNzyW9ek7utajAOVD7N7HdBzopCifTtes0uH2XMsM56Qj+reJIvqlnKxNuR5/cRwZr0Yv1u8Hiz0NfpX4bTlMqtdhO9EVu60fJWECswAkNUAYNzcINdr7YvQAc9HPIg8SMMWd9QG0BuI2iHpf+0LiXagkWF5n36NCKIJEd62ahWyyBbq5olHWAI09+SwE/ZSK9yGBBJpcXXMTFu5XtbQNeGgNt3aj/TwC4xalg8ONGtPSuwxGbc8ZP8Z/cxaEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV1P189MB3098.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:25f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 08:22:55 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 08:22:55 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 2/3] libssh2: fix CVE-2026-66034
Date: Mon,  3 Aug 2026 10:22:41 +0200
Message-ID: <20260803082242.44009-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260803082242.44009-1-jaipaul.cheernam@est.tech>
References: <20260803082242.44009-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB8P191CA0024.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::34) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV1P189MB3098:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c293fab-8306-4300-df7e-08def1386b59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|13003099007|10067099003|56012099006|11063799006|12006099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	KkeRHIcXou6J35gzWL6qpziSoCzu2U4hTFw/kM4MXc0eeFwjygTY4zW6LvdHx8Oy1/KF38osK5CGtM9fIfZIgKIkNryOd3tUvHkETT2Rv40m6KmAbCUOC1EW9Fd4pwcyTd6nYjyc348VPpPG9vbabCAjLxquxhoBHGpKFha4vHgy+WM+mWFdVLHOsstgxj3VHrDAUUjzXb67BB+kXw1sTzC/QJUzdySx4yl7zXVkxjKfuWQv1G2h28au8/SbEXojxkejnXYV6CIRo1rVQ16LzDn+tdyH77nxj94EKhfGXL9fBunqjrjmUIOLIi+uMAI+QpMBrv2uQkHi0LxYxVwg917/ar48L8d0V+OaK1i+6vrJJwUo5oH/XG9Q7CsKXMkcyK8dWitw7MeXoyNv6mBiKiBAdwIjcpoSBbwhV4F3ih/hfT2QyVZMP9FSSzsowPDUnTZRDqCbL/R+2YzkVx9Ak251DG0rGd1mia6URvVY++mc+dMbGXyQulHNzpntebLro8YqgSM4ZNa4iO0paW8pvY6pARCS6anZC/x4KXlDiNvpvflKEetYeuAUqUwjidzkK1CpvTkgsqYEQ2bxRUsH/+rBTbpYgvNc2RXKToVzBv0B3ajmf1iM3uswLpsB6QoVMTiFWmkXKBVv2UIDFQwWhsqXzrbfKsLRLjenw11vWDA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(13003099007)(10067099003)(56012099006)(11063799006)(12006099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hByS8hvyvAr7VS89my6UNFaaD9fFItvkJPX9ItGLW8nB0NGAQN5BR9yNIDyl?=
 =?us-ascii?Q?suMTM8BGG07EIVXJ2+dBviuRTxGZM5V8kTNWJlUZlQAK07ggScTMPKJ/xRnY?=
 =?us-ascii?Q?XY3v61eFHWOIuHvnZdMcA4HLoyDNWtmvsBW36mmViuU+3G6Y0UGx/nuhwZ0X?=
 =?us-ascii?Q?DT6rKcMipcHPVH1ZAB5+gjFm/iE9ysx/Lq7keI72i9rNGIuKUBlSEVbIAHEX?=
 =?us-ascii?Q?UUzDZrziBkWIcCowEGJ6q6zyWqNQexXOz2nW9kdR6aXdt8JkFfgp1U2vYI9t?=
 =?us-ascii?Q?5JYM1D8XfnVPzY6/2ZWmyLjr+2hjk6XsiPDBisGSSXebjFJ8o4aRRYGfuBbo?=
 =?us-ascii?Q?svWXWXJc4MOrSfk4gNJL6oxgQ+2d2N9p3T2WWrj6qAFnXwjr375zvjmYFl8c?=
 =?us-ascii?Q?jsJiPbreuaxQ4tczPSRCdqccNv/5TNUdNrncT+7AAXYLm1yuQ0/zWi2O5v2B?=
 =?us-ascii?Q?vHfBmkDGbEFrBvGOLyBLdOsKF2Nz169B03klfrr7igo68e9xuZMW0rTga0PQ?=
 =?us-ascii?Q?idN3P1Q9jso62ib6CKhPa2GJgcoCDqtnMp+jvjEwrk8W7aEf+Fs+biVDOaG/?=
 =?us-ascii?Q?bqe7/aO7DSgoJsLGmKMArmOT1hn3XK0C6R2DefouYjSgEoCbw2jeqy4/kFCG?=
 =?us-ascii?Q?nt55DFsumnjWgQvLLrRZI0ysAYAGQGsmUY1YWuBF6yh8oBVm1jqw1NnPhIi6?=
 =?us-ascii?Q?GOqnyMHavFD3xkF9AyJ0BtmkLEqQ02cdrdsWINUgB1f7Y539Fk4Q0DeZ7Qj3?=
 =?us-ascii?Q?hD12lNbLPif6K04B5d5tO78RW5v4uIG1R16CxOd0WzX/bBERmKa4CQ9IMhBF?=
 =?us-ascii?Q?N3WWN/DVaxH6lc3gSi3SRK69KHPRGpuApAhVvgp0I45ddX7f+R+ZPlrP4uSS?=
 =?us-ascii?Q?Uw1SgxwmTcSFoZdhxeXzhsNJvYawdHKI9aLntAYE9SYHB6vAWoeNHzCz/I2C?=
 =?us-ascii?Q?CgiTj9+fxm/t2gWNTxVt8AtN5JVcAtfwFRF8ELacgShwYzXzoax8HgwSQ64y?=
 =?us-ascii?Q?BpDmKbwrBbRu8TsmKrSLzATR+bsFJZ27FlvvXLOMLCNY7EFFKfNXTBdCv4y4?=
 =?us-ascii?Q?NPknabVcWQqxAjnH3ZALWxQifczc6T0nDnOu6ThUAQRYPa8fhfqaowSZ8uNN?=
 =?us-ascii?Q?cWGEq8XGmE2aWclAGIelKsFenNrVJ2xO0tcPybUf/84FHit82ZNF40llBM9j?=
 =?us-ascii?Q?+HRrtYFpmurwvp5lpboXe18RVf/AiqoLFgyFUE8r7DOv7SndqSFxsemTx99O?=
 =?us-ascii?Q?KwumK5grptiaL8ZXE1Uif3JYSqetFoTQWdhxAoQ/jBAFaXwcN2ZTPsQwl6VL?=
 =?us-ascii?Q?39gmaMBEZ25O3CfFts0ZPR2U3t8RbApyyfWgg+pmJVtgAgVim97yInfuPPfl?=
 =?us-ascii?Q?EXPJuZAtkEkvKdS2iwWsERru8ZACN4uvRrahc1sdb9D2Hh+hQc4LIvdvZ2dD?=
 =?us-ascii?Q?2HcWqxVs/EQHtzL0eiUjAejM8VV3UDpaf4BGcSob6N4wX1delMxCyL6raWu5?=
 =?us-ascii?Q?2ht719Fj7NA4uIAcQTZ63AmqVI9b9IpQlZ/wcEBfQ5QCOe3O97CxPzr/PDi4?=
 =?us-ascii?Q?pLmqisx/W9TQNsF2AZHG8H+mSAGZwI+iLeGZSh3pD2mvnX0zEBByNADBbBl5?=
 =?us-ascii?Q?b/a8DoqXGK3W+B+ZIDo5ECS1mS8cuEd84UsWmdsfTFgAhN8jeTiTbynuOG6U?=
 =?us-ascii?Q?i0w36iH3nPqxWvx1wHosTALsQ01enaZFqgSqmF9VP5Pq/ADo5Uj3P5VaB0pj?=
 =?us-ascii?Q?zcuLHUwS5J+l9VgfPvbO2ce4qpdxzd0=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c293fab-8306-4300-df7e-08def1386b59
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 08:22:55.6434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zoPWt9gIH/mdxrVMD5gMaz+HIm76PkMVWLx4OpIpEOMYUYVPG2JraW/sqplLyvqfYXq+46wByB+5kfAUrEtX5mwVWuaI4Of6Z716726/e0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB3098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 08:23:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242619

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-66034
https://github.com/libssh2/libssh2/commit/a13bb6c773f0d55ad1628cede57e99804=
cd898d9

libssh2 ptest results (qemux86-64):
  before: PASSED: 1 FAILED: 0 SKIPPED: 0
  after:  PASSED: 1 FAILED: 0 SKIPPED: 0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libssh2/libssh2/CVE-2026-66034.patch      | 40 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66034.pat=
ch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-66034.patch b/me=
ta/recipes-support/libssh2/libssh2/CVE-2026-66034.patch
new file mode 100644
index 0000000000..906356baf2
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-66034.patch
@@ -0,0 +1,40 @@
+From 16720054e0b3f02e36f31dd04add534d73d4a18d Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Sat, 4 Jul 2026 11:19:49 +0200
+Subject: [PATCH] publickey: fix potential OOB read in
+ `libssh2_publickey_list_fetch()`
+
+Reported-by: Vladimir Eli Tokarev
+Fixes GHSA-w6g9-cpfp-22gc
+
+Closes #2202
+
+Backport adaptations:
+- The upstream fix uses ssh2_err() which is not available in libssh2
+  1.11.1. Replace with the equivalent _libssh2_error() call.
+
+CVE: CVE-2026-66034
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/a13bb=
6c773f0d55ad1628cede57e99804cd898d9]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/publickey.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/publickey.c b/src/publickey.c
+index 9c9fa618..f3776d2d 100644
+--- a/src/publickey.c
++++ b/src/publickey.c
+@@ -988,6 +988,13 @@ libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY * pkey=
, unsigned long *num_keys,
+                 }
+=20
+                 if(comment_len) {
++                    if(pkey->listFetch_s + comment_len >
++                       pkey->listFetch_data + pkey->listFetch_data_len) {
++                        _libssh2_error(session, LIBSSH2_ERROR_BUFFER_TOO_=
SMALL,
++                                       "ListFetch data too short");
++                        goto err_exit;
++                    }
++
+                     list[keys].num_attrs =3D 1;
+                     list[keys].attrs =3D
+                         LIBSSH2_ALLOC(session,
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-=
support/libssh2/libssh2_1.11.1.bb
index 67dcfb3353..9db1685e39 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://CVE-2025-15661-2.patch \
            file://CVE-2025-15661-3.patch \	  =20
            file://CVE-2026-66033.patch \
+           file://CVE-2026-66034.patch \
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"

