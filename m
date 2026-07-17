Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE01DC4451C
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 13:59:25 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13993.1784296347428001293
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 06:52:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=DDnyywWs;
 spf=pass (domain: est.tech, ip: 52.101.66.48, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOQ1t5mjbGODl9/lY9EWL9a5E44XOe+ygQYCo0MSZLDTIJ3JCq26X/xzjrOCL1CkSU3vkfi3+hMQ25RgnWtQL6+kMOBND+3hWFCte6Vz7JflO4t5OB6zXzrLw6L+N1mmg4eAHpvlSM8n7taup85jHF3s3g+rA4IN+yjQgCVcAq1az30HfBlsIrr48Pxn/LHWoLsoVBWwnjS0VElDCse+B5hGBYSec127g6oyakvFpKUm5HJ2Hp0r3Gvnk73WOqIn1QeNFtTb26+O/+pyXJDuc5MfKhjBSYUrISaXL3Man9gauZrTHJw++JnzJW4NKKB6j4+OeFC++rNrzHdfxvI54Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6ywIVmKMYyBwu8Y/s5eUKytntRa4VNvCLj9kErIIvE=;
 b=Ns79TNHjIQKvt+RVhHbre7P6AlHncAsjN8PocmbjbGrp0BiMvuEQxTW0evOr03JcdMUnLcm/DsXrK0GQgOAvXyjdy5DwsWbsTOa4UVem9+UiW1PzwUNp7TF41Pzmn+bp0A/IXbGIxwSBnWFHEQ/5DecnSZhiZySuNL2GigvsXl5OiS5gzHyAjCUqpAUYYFUjYyiiWl31MiYwqMRhlL6AIzKH25wKt6NJQGCAt2E62+k9MjffeKYOwz8zqVbYqDkaNKHDi7hUgLSLrxPYbTWLDpk31TVVHcnBhETwpt9kY2wqNqlJC3nWIpsE06n6vb5dt8MefFervFQNpVE33IHXvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6ywIVmKMYyBwu8Y/s5eUKytntRa4VNvCLj9kErIIvE=;
 b=DDnyywWsDxEvI14AeGcGhDRozl0vv6Kbtpd3rGEnLtuEsLSPCTLMlFRZbfCZ6RAUSdhDmPHFsQYJs8VcPTKhRIPtSCA2dP4AJb4HkZNr8QC6n5SmMdD0JXB2/EzC3TjeZ6d/s86gD0F/i5RZHFSXqZW/rj4N9Vu/6DTR8qZi0tmQXuZF3j7fPfcR0ASB57aWseSiH8fYhhHkYAuxH11a5HX0qkVJqx72igN0NUWtuii3eZS5w94nVEhiLYsCoVYpW7Th3dZc7SSyzrNgYZc4BcxyqwQma2mghC+Ig3FvZFIFnhK3WQ+gUCqbTmIZsozzqBQIu6kIdQGjkTXy8JrF8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by VI0P189MB3639.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.6; Fri, 17 Jul
 2026 13:52:22 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0245.003; Fri, 17 Jul 2026
 13:52:22 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH] libssh2: fix CVE-2026-58050
Date: Fri, 17 Jul 2026 15:52:15 +0200
Message-ID: <20260717135220.869830-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO6P123CA0027.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::19) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|VI0P189MB3639:EE_
X-MS-Office365-Filtering-Correlation-Id: 96af68c4-677f-4a61-7bc0-08dee40aa093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|10067099003|12006099003|6133799003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	3+oRgXnchELqUn0H78fAd700iJXdkzGYYyNtcmsigIvX4HIOrR9l03kyOqAR4tbHnEvlY5C8w74vVNOcP/t4iNjekzB9jAw7oTDPV/0Qoba5t3pfcWwdlxlNplJp/BrCtiJmtzm56K8aLRrmnURnWmXqbXPhFqivtHz5oiZ9U1m9CIw8qQ9wmiZyYVsai5D7ugd0TaJ7GhzHJfXtJ2W6TFWVC0g5tKrAzOTtAkjTWJTlKC/v1nKEBeKE/zTGAlkURTHkS4Txz+7RZzHJOOYCfYpzivYm201w27DPZ/NhB5E0ANLrknK3+IGJU+mTYYsuEZJY2XkTOh23iikY5xw98h8BGo+vyI8KvmJArNdMOuQqx0C8XB8zNM8IMkpIGVATdywWa0mhKal3rBfEfMn/+iNx76g2Ki88GOpYveI1GwnAaHVWd0yYsqOWKpN41ek+9eS9XxSN2OdqpRyhfXJGQxTke0RpiyPEiyI2bbxPcnWtG4rXesWKn9LY8jI3LUeH/l1ORGkLhWzylH2gF1vQXcl88yeCJWPAR3wNJk0uoBkTxRpY45pLcgGQ32MaRJ26eb7scxx0P1DmsfdIa85i+wxOfheqBQQvnVvrvpJH+IMh4tdi7TdpTdXb6Oin7y23WS5JSonK0Y5YO/kxaFgR5nxixA1F6Zdwp2ienqVhDMA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(10067099003)(12006099003)(6133799003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PTDM3kKdVf/AWSr5eeCBsy+n9QcHFVegbueo/jsR13sCkS+OOYc8QEKdoDRz?=
 =?us-ascii?Q?1ODg6OBKicUl0gq2VJ15Qud6bcN5KL0vxpISlca0JtQwNk94ITV/NJgjZAxO?=
 =?us-ascii?Q?4wDc2vsCm9X0XgCtFRwMYCKqN0eBiu4el42ahNUgxDBhxO+724ssNaZxnEiP?=
 =?us-ascii?Q?2Im6xfY90k+XYjNIAM845MnGkBFJr6nU+eqKFpB60sQDBh1ZHRzoekW/hYku?=
 =?us-ascii?Q?WDVvGHAXSzAhKr9Cf+sPaWgEVewsoGPOnlolUgOOUuDgw2cRIdPAK79sqf1d?=
 =?us-ascii?Q?el4nyFHskJLgSm83OYTG/LTRZSyLBfhkPl2uHd9vAVUoKFPRPZKlI7EdTAt2?=
 =?us-ascii?Q?Ms+nM3mV/dULGYzVsWZGE+7hLTI5IXrLboUWZa1ingkvJbDzJz3h3Dnrp+zu?=
 =?us-ascii?Q?1gPS/GTMAUu+ll+ZD5Kni6VvIWvR7sglibj/yDfbj/OfyAdpVv3jGDFvPUp2?=
 =?us-ascii?Q?8Tr0kkZdMLben5kpr7uvRSPm04Hn7pZGDtQgPU3nTQDQ5j66FE3e73KPSSXG?=
 =?us-ascii?Q?B7P1uAcaP8iECblc+jlm8Dgze7l6udn0XBkHSN4lSd2VWi9rokO6zxVMKzog?=
 =?us-ascii?Q?UCUBqFwLv+7gxpSUdagxQFq3cT+XWEZsBdwgBUM27lWWTYGprEzkFp6lcUOV?=
 =?us-ascii?Q?ObrZt9369JKfMr/8KwSiYgwqxlwqw23xVkeoQuDe1GmjdyMudmEXZSv8sVkj?=
 =?us-ascii?Q?3wWEZtFMJ72jAUyPTR3BMIC5fRnlL/iiNguPftMd48I3L7fv5tb9uhEBwNIr?=
 =?us-ascii?Q?fxX6ah8SnDxRW0mw837Jv3oeNkgAjFkheZZQDRCKgEuSdVftZe61pcoxh7Zl?=
 =?us-ascii?Q?sk0vpI04d2O4jIG5E5RMu1XA4kEsjNfv96oqodTsxfLoqjLlcm9Py59P6qiq?=
 =?us-ascii?Q?JLvb3T4I44RJQ8BLWxkqlDZumKgBOOojSIkEv2ZYL2udD4ls9+ChudLnh5o9?=
 =?us-ascii?Q?+kwBOjT5UdsASzBW+fbinuRZAZmMv+dW5Mp/1ApFYlKCvzA15btTVZA00sTc?=
 =?us-ascii?Q?UrvgMEiIEhsINBq0gF8lM0hPbwlcFa1jCMpHQjJl9MjtwbyixrpZw0G6PPsr?=
 =?us-ascii?Q?XXv6j6OGvllxNB8qbBJIp9Nyx4R38M8/PqVf7vOIUMX5rIFwZHLQLpe29TJ9?=
 =?us-ascii?Q?/hNhFs50hXawUfReUraCy+PTPeZg9jWYIEnUGfIuMjFL7Nre2ck0jI5pXR+s?=
 =?us-ascii?Q?JK87wVGRqgRAhiqYUXNdUjTPYlXCPQa2dZnt7MeYatUIlEx5HNpz7VnLsHKb?=
 =?us-ascii?Q?fJk3BVhO17zNAJsBVi6e3bBBdM21MnvjrxUxbHVYaTf8fRSZvAP1tP3UuaLn?=
 =?us-ascii?Q?nrt+/4s5beRq1awswVORE8L4sOJK/qrOafa87A/aGyBn6V57v0ZVIz58HyKU?=
 =?us-ascii?Q?8hGUicbwqAkX/hURdiU4mcBnY+di1gfGvHkAozlAR/i9ZtiH9l7aDvYugQX9?=
 =?us-ascii?Q?5xiIhmcmgTqVOvdkCCUPoCpqo3uegc/mF+Q1AaYT0PLQTTACupuWravXiXfN?=
 =?us-ascii?Q?Qv/zOHyOV3tn64f+m9YqBAe/c/9Mar+3qDEIpR18dtvg1Wnvnb+oLVDzKrlF?=
 =?us-ascii?Q?Bpk+cyuVG2oFl/4e+gf/4mQUxjghZYlqpO5vXM+zHrDAQXOomMhOgduKJrOl?=
 =?us-ascii?Q?FAqad3BfxrS28nI06BrGwkobYU1LDYjYYRYXcNJXDJsyslvOqANKkjq3CiOv?=
 =?us-ascii?Q?T47M5ENqNfDl18qKyNfRSLfvfOqjmd72Nz6bxKHIhBX3fdbKmcBXTjj2mK9j?=
 =?us-ascii?Q?NNCpwDMRv7cTiNfZSPKhaVXCIbRiNrc=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 96af68c4-677f-4a61-7bc0-08dee40aa093
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 13:52:22.9040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2yBKwXgSBEbbPqfHGcKJ8t4uF13OGrlwCgO9Bo/nTzULBUpfNC0wYFeTQXhug/7l40Irw+0sn+87AeqYiAeVOyOjVEIjg6N7EqF1iQL9lk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3639
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 13:59:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241192

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-58050.
https://nvd.nist.gov/vuln/detail/CVE-2026-58050

Upstream fix:
  https://github.com/libssh2/libssh2/commit/7c8a170c6dca3cd4cf24de836f43ba1=
a20e662d5

The upstream commit uses the shortened private-symbol namespace
introduced in commit 076838de2697a4185125bfd601fbcd6e7286bfb6
("src: shorten namespace for private functions and macros"), which is
not present in libssh2 1.11.1. The only change made when backporting was
to spell the helper calls back to the names used in 1.11.1:

  ssh2_err()     -> _libssh2_error()
  ssh2_ntohu32() -> _libssh2_ntohu32()

The added "> LIBSSH2_PACKET_MAXPAYLOAD" cap checks were kept as-is,
written against this tree's existing bounds-check style
(s + len <=3D data + data_len).

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../libssh2/libssh2/CVE-2026-58050.patch      | 177 ++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |   1 +
 2 files changed, 178 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-58050.pat=
ch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-58050.patch b/me=
ta/recipes-support/libssh2/libssh2/CVE-2026-58050.patch
new file mode 100644
index 0000000000..bad801fece
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-58050.patch
@@ -0,0 +1,177 @@
+From ffe23ddb76c6fe320f3a90f5876abd429b6ddc61 Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Sat, 4 Jul 2026 17:18:50 +0200
+Subject: [PATCH] publickey: cap variable-length packet element sizes
+
+To avoid potential offset wrap in 32-bit builds when receiving overly
+large values in length fields. Limit them to the maximum packet size.
+
+Bug: https://github.com/libssh2/libssh2/pull/2205#discussion_r3523193089
+
+Closes #2207
+
+[Cherry-pick adaptation notes]
+
+The upstream commit uses the shortened private-symbol namespace
+introduced in commit 076838de2697a4185125bfd601fbcd6e7286bfb6
+("src: shorten namespace for private functions and macros"), which is
+not present in libssh2 1.11.1. The only change made when backporting was
+to spell the helper calls back to the names used in 1.11.1:
+
+  ssh2_err()     -> _libssh2_error()
+  ssh2_ntohu32() -> _libssh2_ntohu32()
+
+The added "> LIBSSH2_PACKET_MAXPAYLOAD" cap checks were kept as-is,
+written against this tree's existing bounds-check style
+(s + len <=3D data + data_len).
+
+CVE: CVE-2026-58050
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/7c8a1=
70c6dca3cd4cf24de836f43ba1a20e662d5]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ src/publickey.c | 61 +++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 61 insertions(+)
+
+diff --git a/src/publickey.c b/src/publickey.c
+index 9c9fa618..583935fe 100644
+--- a/src/publickey.c
++++ b/src/publickey.c
+@@ -472,6 +472,11 @@ static LIBSSH2_PUBLICKEY *publickey_init(LIBSSH2_SESS=
ION *session)
+                     goto err_exit;
+                 }
+=20
++                if(descr_len > LIBSSH2_PACKET_MAXPAYLOAD) {
++                    _libssh2_error(session, LIBSSH2_ERROR_OUT_OF_BOUNDARY=
,
++                                   "Public key description too large");
++                    goto err_exit;
++                }
+                 if(s + descr_len + 4 <=3D
+                    session->pkeyInit_data + session->pkeyInit_data_len) {
+                     /* description starts here */
+@@ -485,6 +490,11 @@ static LIBSSH2_PUBLICKEY *publickey_init(LIBSSH2_SESS=
ION *session)
+                     goto err_exit;
+                 }
+=20
++                if(lang_len > LIBSSH2_PACKET_MAXPAYLOAD) {
++                    _libssh2_error(session, LIBSSH2_ERROR_OUT_OF_BOUNDARY=
,
++                                   "Public key language too large");
++                    goto err_exit;
++                }
+                 if(s + lang_len <=3D
+                    session->pkeyInit_data + session->pkeyInit_data_len) {
+                     /* lang starts here */
+@@ -912,6 +922,11 @@ libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY * pkey=
, unsigned long *num_keys,
+                 goto err_exit;
+             }
+=20
++            if(descr_len > LIBSSH2_PACKET_MAXPAYLOAD) {
++                _libssh2_error(session, LIBSSH2_ERROR_OUT_OF_BOUNDARY,
++                               "Public key description too large");
++                goto err_exit;
++            }
+             if(pkey->listFetch_s + descr_len + 4 <=3D
+                pkey->listFetch_data + pkey->listFetch_data_len) {
+                 /* description starts at pkey->listFetch_s */
+@@ -925,6 +940,11 @@ libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY * pkey=
, unsigned long *num_keys,
+                 goto err_exit;
+             }
+=20
++            if(lang_len > LIBSSH2_PACKET_MAXPAYLOAD) {
++                _libssh2_error(session, LIBSSH2_ERROR_OUT_OF_BOUNDARY,
++                               "Public key language too large");
++                goto err_exit;
++            }
+             if(pkey->listFetch_s + lang_len <=3D
+                pkey->listFetch_data + pkey->listFetch_data_len) {
+                 /* lang starts at pkey->listFetch_s */
+@@ -988,6 +1008,11 @@ libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY * pke=
y, unsigned long *num_keys,
+                 }
+=20
+                 if(comment_len) {
++                    if(comment_len > LIBSSH2_PACKET_MAXPAYLOAD) {
++                        _libssh2_error(session, LIBSSH2_ERROR_OUT_OF_BOUN=
DARY,
++                                       "Public key comment too large");
++                        goto err_exit;
++                    }
+                     list[keys].num_attrs =3D 1;
+                     list[keys].attrs =3D
+                         LIBSSH2_ALLOC(session,
+@@ -1022,6 +1047,11 @@ libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY * pk=
ey, unsigned long *num_keys,
+                     goto err_exit;
+                 }
+=20
++                if(list[keys].name_len > LIBSSH2_PACKET_MAXPAYLOAD) {
++                    _libssh2_error(session, LIBSSH2_ERROR_OUT_OF_BOUNDARY=
,
++                                   "Public key name too large");
++                    goto err_exit;
++                }
+                 if(pkey->listFetch_s + list[keys].name_len <=3D
+                    pkey->listFetch_data + pkey->listFetch_data_len) {
+                     list[keys].name =3D pkey->listFetch_s;
+@@ -1044,6 +1069,11 @@ libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY * pk=
ey, unsigned long *num_keys,
+                     goto err_exit;
+                 }
+=20
++                if(list[keys].blob_len > LIBSSH2_PACKET_MAXPAYLOAD) {
++                    _libssh2_error(session, LIBSSH2_ERROR_OUT_OF_BOUNDARY=
,
++                                   "Public key blob too large");
++                    goto err_exit;
++                }
+                 if(pkey->listFetch_s + list[keys].blob_len <=3D
+                    pkey->listFetch_data + pkey->listFetch_data_len) {
+                     list[keys].blob =3D pkey->listFetch_s;
+@@ -1069,6 +1094,11 @@ libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY * pk=
ey, unsigned long *num_keys,
+                     goto err_exit;
+                 }
+=20
++                if(list[keys].name_len > LIBSSH2_PACKET_MAXPAYLOAD) {
++                    _libssh2_error(session, LIBSSH2_ERROR_OUT_OF_BOUNDARY=
,
++                                   "Public key name too large");
++                    goto err_exit;
++                }
+                 if(pkey->listFetch_s + list[keys].name_len <=3D
+                    pkey->listFetch_data + pkey->listFetch_data_len) {
+                     list[keys].name =3D pkey->listFetch_s;
+@@ -1091,6 +1116,11 @@ libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY * pk=
ey, unsigned long *num_keys,
+                     goto err_exit;
+                 }
+=20
++                if(list[keys].blob_len > LIBSSH2_PACKET_MAXPAYLOAD) {
++                    _libssh2_error(session, LIBSSH2_ERROR_OUT_OF_BOUNDARY=
,
++                                   "Public key blob too large");
++                    goto err_exit;
++                }
+                 if(pkey->listFetch_s + list[keys].blob_len <=3D
+                    pkey->listFetch_data + pkey->listFetch_data_len) {
+                     list[keys].blob =3D pkey->listFetch_s;
+@@ -1138,6 +1163,14 @@ libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY * pk=
ey, unsigned long *num_keys,
+                             goto err_exit;
+                         }
+=20
++                        if(list[keys].attrs[i].name_len >
++                           LIBSSH2_PACKET_MAXPAYLOAD) {
++                            _libssh2_error(session,
++                                           LIBSSH2_ERROR_OUT_OF_BOUNDARY,
++                                           "Public key attribute name "
++                                           "too large");
++                            goto err_exit;
++                        }
+                         if(pkey->listFetch_s + list[keys].attrs[i].name_l=
en <=3D
+                            pkey->listFetch_data + pkey->listFetch_data_le=
n) {
+                             list[keys].attrs[i].name =3D
+@@ -1164,6 +1197,14 @@ libssh2_publickey_list_fetch(LIBSSH2_PUBLICKEY * pk=
ey, unsigned long *num_keys,
+                             goto err_exit;
+                         }
+=20
++                        if(list[keys].attrs[i].value_len >
++                           LIBSSH2_PACKET_MAXPAYLOAD) {
++                            _libssh2_error(session,
++                                           LIBSSH2_ERROR_OUT_OF_BOUNDARY,
++                                           "Public key attribute value "
++                                           "too large");
++                            goto err_exit;
++                        }
+                         if(pkey->listFetch_s +
+                            list[keys].attrs[i].value_len <=3D
+                            pkey->listFetch_data + pkey->listFetch_data_le=
n) {
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-=
support/libssh2/libssh2_1.11.1.bb
index 2407ed34d9..21e7ed30da 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -13,6 +13,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://CVE-2026-7598.patch \
            file://CVE-2026-55200.patch \
            file://CVE-2026-55199.patch \
+           file://CVE-2026-58050.patch \
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"
--=20
2.34.1


