Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF00C4451C
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 13:59:15 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14081.1784296223128000337
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 06:50:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=BJEPvQ+7;
 spf=pass (domain: est.tech, ip: 52.101.72.7, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSodfNEZBl63TQqpApnG1LtMS4+OuX9UtS5zHtY6R4Gk1R7JkCwv68zeDymW4jVlYgOJR5pDmNEoztwgnS9L7VwpUHsLEYohmeDgf4tnLt3FJSVvhkNCnY5DH1Nf6YTlMvpQBmghPSVX8c8BJA928pmPIV0ecLQ5I3GxzLIWF6SH0DU1wdA4WKnarkte8hbUzK39wCATVG8ylxIGlF5rapxPVZo5XHU4VL7KOejwkIvXY2O2v9hoEbtBtRMLRuQkX6mMSdml8lwzM8s9zAicClPEjTYFaAUKJJQU0ln4IfOFmSB2OJe5EXfR3MuwTaRYlMuWH/bsuQCjGfC/VK22Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6ywIVmKMYyBwu8Y/s5eUKytntRa4VNvCLj9kErIIvE=;
 b=N8YEfy71rJKGzjedgFcR3ALuAgn+Od2EzxcUMiE5USVgmamlXbVznKngv1jcDBE03ncCJF5diHF/qr+KyEApbjJTS4w1k9v14p4PV6gxHkGljwzFRkvcrBYNORWOoSI8stRb9TjO8iJotLt3EiXaK06HEw+2qW86enKYaVhbAjGdzdlVcsDxLmi1AjSDI+ZrgRbHMOvkwLY2BeOyj5aygTr9f1gXVQkKKj2bIxQ0cP8XT8D1fyZViayg7eziXPwkS9tS57CrY6/+hqOWfkj3vhYKzuM9Ds/5xTXGZagYeA7ay7QzyM02OrxnYDQS3NhdUZ9orvzL3i5Pn8Gj7YEmgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6ywIVmKMYyBwu8Y/s5eUKytntRa4VNvCLj9kErIIvE=;
 b=BJEPvQ+7REOexORP8XTQY0rFp7MaRK0N1K4QPuOmtln746O4YVwh9rg39p7Asb5jZPyD0v426fcHj9R4Jnr/kHhC0lTXwVy0isZy2EsIAuwDoLxPaD39Sdnz/nG3nhNsMewfS3U8cEN7DuwMtk5HcI2AIB4J58Idh0HuCkJpR+MtCbTr2FeHcWDP8xFj/ssLYP5JBpDQTSEsnfqLCcFJs/ytljJ2Gs4zCVpiSDDi2qcjrJw3m0cJC4ger8/QExhtZYtOd0RpSZ3sIDhNs0dM3SJZGET/U6ucGdDgYan1zc0mTUHqp7n/nNIZVtJWCJXhSJo/e3QUVtnSQBfYZwnUKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by VI0P189MB2650.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:249::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.4; Fri, 17 Jul
 2026 13:50:18 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0245.003; Fri, 17 Jul 2026
 13:50:18 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][wrynose][PATCH] libssh2: fix CVE-2026-58050
Date: Fri, 17 Jul 2026 15:50:10 +0200
Message-ID: <20260717135013.869197-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DUZP191CA0017.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::28) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|VI0P189MB2650:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ca1af09-c65e-4df1-c662-08dee40a561d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|10067099003|12006099003|6133799003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	2elbW22xe1Vfqu1S8/snUaNwonGevwdfFcIuuDil4tOMECaYjOFs7S4G4ld4LREGG8gi41VlpjyvFzrDGAjBgCL67UN0TCSvAbL9CcVjACRwdck/N1Dgfw9S3NvBh3KEwNJc+Ak0XvIWndvh6iGNckPKV6WstsrbnScWa6LBbGSJbNjxNVHiPmmoGFtb4rmYqRXai9qoxqe/cHrIaXP2+ZGG//5LyRwAj0AwR7+1FftO1n9Yo8vYgwrjtHgYdaH0fIAsZfclxtO2fVC+f20KIRQrvkln0UZ2xkbkVb6iW3GxH3jz5YqNkvmIGLtbsmYgFkedC715iTh+4blCtcmAwkZi3unxtcMCYoPthVRd8Ywjk4D6NDu6T05W1vzY93ZJlugzffxVH27aAXxQVWB1iibGaye2niYxYuyJy9AQramcs7iJUXwLuKNga26rce4aPVSMpHpLCrATIaJ83cIZT9oQV1FOzl8ExeFBPfJv/Az2L2ex3aRnKNTq9QJg0UfiwWtIJOozH6CNHqdR2EjxdEHaNCXwpHh5Xz0x5DihgjXJpIylmvSsBuLIp68zBpZIp6Uqglp7ZFXqmDDYuOy4QHslkLTouTYmSZ1wprthdHL7OCy9avEFCtgKWNmZhiJHu5QNAOcU/F2vErB2zLNLSszOROWqLUiNy0CmPowiKYU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(12006099003)(6133799003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bBoyClBri9tGfbZUJnrLgfcowogewVqFbw1QQfqWxKHQMPnfLJvw74kQhnAY?=
 =?us-ascii?Q?F6Hwx30VGcw5Fyo0e7+vcoglcHBhzL5lipfPoCIZgUX5KbwDOrn0XtvgdmW3?=
 =?us-ascii?Q?uckCqsemaDGbSZ7M15EV0wzDmT0uQ660bcU/sQHHQCJwpuuv2ja9VWmuZ7IS?=
 =?us-ascii?Q?isDnjBEmhVutQqBgf3ogcLEQR9xvhp7s8tC4ajteGJjZsURGcBhbLJlPa1t5?=
 =?us-ascii?Q?Wwonipk4VaObdBmQa9dzvXgLZjVOAsqdct+v0WCDGPpDHdf2zDIlPonO80tG?=
 =?us-ascii?Q?GFIMi6E7ai29CKT+zaNVQt+9oC7YDmUYVLtauKk9bHpuH7EkW/j9/ADVcrwt?=
 =?us-ascii?Q?qt2LuCuP9HZCOQrjxnE917pp8nMyPJijVoZQ2NRAy7VYO2YFNV7TkK/hDYTq?=
 =?us-ascii?Q?+9EL1Ub5nKLMBMgT1QUhIZ7kgjKSJbNGwwL7WmXBJgCavGOP5rADzjCsYkDH?=
 =?us-ascii?Q?96Gd6hPcERZ4ZcDEMSMJkxmPcnxWOhnWs/A/lpwk32G4SMPDs4pwTkFaG2LH?=
 =?us-ascii?Q?WDvjbQpYmrh3x2p48f2kfiUeN2qHyD0Mdhm7At9Vz+ym/AsO58m3SeU3ZRdr?=
 =?us-ascii?Q?Xg7WjD0flkd/akzyXi1VXEd04nPiTjlRWLPCT181YK/ETmML2u4/M+kWi9+l?=
 =?us-ascii?Q?m5ql70ZUVA3xeUDolUhD3ZlDPP7bxNq/bU6vqb2qUK8IrtsdAmWGFtGOEWL9?=
 =?us-ascii?Q?H/VT3ikhQjI6eeNQCDD6H3etplRIjBhq0PdRiilR/r+mdGVztFDVmwbalPQt?=
 =?us-ascii?Q?3/SWubp4ywklxYHzyGqUGMHoKA7jTfg6dgVGQzUn3gLchu0ToPO3okxJaA3g?=
 =?us-ascii?Q?Ao9xZPB+uKOfc/bT9+tt67b+p8/FQxuDQgbg4SXm0Ywdj8Papl/DhirGN2FQ?=
 =?us-ascii?Q?TSOb03o/VVyVh//qxmBxnXARpTqjfffaFazeKn6Ekb5VZWMOlI1cPTs6YCwA?=
 =?us-ascii?Q?kjQP8viVx9OjXT8iOmAJdryBrCllFxr/JKAe0t1Da9tf+dkkIhFCV5YQXIuv?=
 =?us-ascii?Q?ajv3HW8qWdGOApAsvrAXIhCtQY7pa6ji6GdXhnJGuaKQotMg7Y/x1GIrLCCR?=
 =?us-ascii?Q?y7f3R6RV/hXfyqIJQSJidLr64LvXX7TH0/XQYG55+hhPvUB1CLOdCJAfKeQU?=
 =?us-ascii?Q?1ADd4TyfTn/HaLMUR1Q4HpWaRX8AsJURyddqsDJzK+DaHa1QjashxovXhTZs?=
 =?us-ascii?Q?vsbRU/dpy3eBRZq4HcKefZ4+C9yI2Cc/z+Wlwmf2M2Ljs6LUzv8NVi8OuK7v?=
 =?us-ascii?Q?e2mQvq12E9AIT7hLxf2BkpRhxIQx0sDBOxfQrAi41uC36kdK1yQF15II03AK?=
 =?us-ascii?Q?5nPTe1WFVypOR/roe3PvT2tPSpQdbITGrafQ28h2demYCTYi81u76GxuvQvb?=
 =?us-ascii?Q?mIF1512ClV1+w0vs1To0z4a9gfeHwPVHzwsRto3Yx7H7HlxQFHKjKHFnoigh?=
 =?us-ascii?Q?PBq/Y61V6GJiA3jJANBBCvfOpbF27Co1iyTaPah3Jp/8IgrNlluVmQbt71Rl?=
 =?us-ascii?Q?RLPfTY8io7SIvr8tNt3qrXnZavQrX4Oaa+nM90d6fqBaSh49RELWlGD1lF8Y?=
 =?us-ascii?Q?73Axf2bqz1ykjYQFfvC2GMGM9744LIaQc6DRdYBc3YVWfYnxiN7gxlzf8HH8?=
 =?us-ascii?Q?y9APNejAHc/638UFdPMYtmCOawHA8tWxvUb2RODfHfsiI45YDWGhfJiPnxdT?=
 =?us-ascii?Q?6vYNAdDFD1vaXSBs9fxQaDxe5/maym2hFo1vfLefRsG9tAvVH6fQIG+Too1m?=
 =?us-ascii?Q?PAiUsUyO88iWx69USnRQZkHP0XiA9NijDGTh38RNR0ag3bTCjOq1?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca1af09-c65e-4df1-c662-08dee40a561d
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 13:50:17.9828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJDVpixnJca+VSlMNvhRCDvxm/IpIVeFFol12UkkWb4zmK+eaSB8GKbD1W6tZI3RIuEH3PK0WgtrW/ceJk6UToAbdyloPAqWny2gv0aWYM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB2650
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 13:59:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241191

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


