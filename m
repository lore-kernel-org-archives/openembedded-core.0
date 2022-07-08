Return-Path: <Sana.Kazi@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16995CCA47B
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 10:53:05 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.81])
 by mx.groups.io with SMTP id smtpd.web10.6169.1657277575281405556
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 03:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=Z7SdIu/O;
 spf=pass (domain: kpit.com, ip: 40.107.222.81, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cp9Mgt+rBmcUbwmjqTkpToKgzV/V1gSHFYbuOfDsGqtmoNPTpp3MED8g4TJg5F9RuvSarp0+33XehPo/jXqCfCtmZnzOiVnxwh2zW6lJ1j9fp/DzUggGUheCmKg3Ta1P9xx1N5WmqR/jAYup7dYOtzYqsji4xE4sFCTgfexww63YtXGEYCvbgFEP01zwKbf3U9UaWs4qyTcaDhBt+5o3zNQMdt0wgPbix5G0cSjIV8QELFrD6ghq+8IGSM6DttSmGHmQ/gZ/OyTAtxAtNYhagAKm6uQu/kWFrOovNrzgV63BHREBx7dqtx5C4e/UBTRAr6/kAc2y8qdfpMR7vdWxyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKs3SDlfx11ug/lpiDRflIYwLuJXp+zK20bnXw37CXc=;
 b=ZUArsSgNt0zUVuZk32mb/peA+YijoknK/dVZ5LkXRgUj4WkhP9zzZR0ER4WEJuo90BLF8cuNEEvgzHV2if49q2aooP96HaiztsQEkckECEF2q1y9u9TIn63CN3kmjnQtwx1mMmtnCgodwYpM1V93g87GFwlrOmpgoJETOUZ+NbWjGylZ5ZxvKDlcVlh9Ovrsb0b5j+2nDiIMJhXrjzV5ZczpKfgrj7eThxla9pnUgN6X1g0F5bgp00I9jyWzG8vbM+sbhzCNi7mPs/LGe9OaxPLymtngyJD75kB/jZ1lG/d534GkuelFHXCOhj/ysDlaPxYWnMXVRTb6J5Isc0SsEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKs3SDlfx11ug/lpiDRflIYwLuJXp+zK20bnXw37CXc=;
 b=Z7SdIu/OJQDLULKbDu0E2WpbXGOxNe/NyX/PnEhvdXGi/GzQt6qz1cKtYCVnOfnhdNCzOgyxY9ytSTa53tIwQQnwD3QZIaA9NIkkpuJKJXiQKAzyAAHiwrALfE9rTO1yL3OQJHLy29i8BtmePCK5luJuWX0rRxlCxBdL6FQ2xT0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB7710.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:9f::7)
 by PN3PR01MB7430.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:8d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 8 Jul
 2022 10:52:47 +0000
Received: from PN3PR01MB7710.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ecb8:caac:a8e5:42be]) by PN3PR01MB7710.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ecb8:caac:a8e5:42be%3]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 10:52:47 +0000
From: Sana Kazi <Sana.Kazi@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com
Subject: [meta][dunfell][PATCH] curl: Fix CVEs for curl
Date: Fri,  8 Jul 2022 16:21:46 +0530
Message-Id: <20220708105146.20161-1-Sana.Kazi@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0214.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::9) To PN3PR01MB7710.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bb800a0-5f75-46a9-f620-08da60cffe71
X-MS-TrafficTypeDiagnostic: PN3PR01MB7430:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Fl6FHcxo7s8TQhAAVarnfg7YldCM5VIq5NNiwrgMSCDpCzaadQYv1/zWwt7cl5RyKr/CezxkpLbivxeTi8dcyKolgRifj9QlegMTJocj3MfbWrKWl7k4/eo9WBrd9yYEvaap5TcdhOGfjCQ9UvpjLjEMul/wWKBxiZt5+idfqnj8ZjrCXW4bDgi9qbb88GQlTyE17jTxE+60Ady52ikaRFaUZdPdeoxRyX+wdcsxu8Ft2zhk1MtZZRNXz8OdPo/oMIoqCLgEpNb+CJ0laxILYtmfnxFWEcCiD4tlmYj2wL1SEhav6MPsecpZKZnXEQY4Q2yFG9bpS49YkN9PyIqHE5SxJ2VK3T6mroApUzi7onAen+TEzCxO4T21NNLd1xx8vYujcA/vc2Kh96fyeQofaSeDN6GjvBzzgAPQDpv1n5VKkQ9HelLJx3hPplRHVZ2sHI4KswsH7uqgVRUXTWBj5qWE+hJERuFNAhamVJsd5yq+AEc/DRZXJUgjq3BhSFyqZgL8/K2ifs9qzotyny8h+ZkKgn3IJy0kXbjEX5WHRJEtT/Flvnj5YwzeUDfuY5p0j6lcOmoKjYapfHgTGzM76VO8CRrLAtxBKhFoWHtx8A1LMWaCyRGBlWQn44JaXNpc2AOC4EtpNC3L7pgJbcgNdewy4JrX4HCw74YV3bJ8fur3mndpZdKCCxXak6WtTdJuhuLbgQyob4fgfWj0A94Jdu7/6Yrjs6X4TF2eAoP/tVuefElQTb806jpf8iBAaBzEzIO6ZTvsL9MeN4Jsi6jlMWgMpe3LvIV/dgl/DIhu8/4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB7710.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(376002)(136003)(346002)(396003)(30864003)(5660300002)(2906002)(38100700002)(41300700001)(1076003)(6916009)(52116002)(84970400001)(36756003)(4326008)(966005)(6506007)(8936002)(66476007)(66574015)(186003)(6512007)(83380400001)(6486002)(8676002)(66946007)(66556008)(86362001)(316002)(107886003)(2616005)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UagcnoDtOsjP+uPc/d3bPWp5L+HOfgYX173HC/QSQ7t+jKYKbKket6x8BZoY?=
 =?us-ascii?Q?S2QOHOLofWaRDzmUsLDXOXqpv31cF2vNMt3Zct4sPHvo1Crbj5MTYgoLl65a?=
 =?us-ascii?Q?8mgwiwD1F0vXOow5n/Q3RxUMKk3Oj3gDaw+MOP7rHv8r6m4sEXhGyH0/QqAy?=
 =?us-ascii?Q?Qu5tZzHIvVz3W3Jjjox02xeBJ/+e4GOkduCeaP8j/9UATkJ2pSE8/VsBBBbb?=
 =?us-ascii?Q?oEbdm8sORIT8oGxM64kRJmfBQZ1WtMwbtnTx/asTQrQsYDgwbsQECLYAPu79?=
 =?us-ascii?Q?5B2JR6Bv4EqmsXC47mgQgqzIKneho1HPaOYhuRnko5+cNaEGqbUWvWz/jZ4Q?=
 =?us-ascii?Q?9hQ6VQJc9A7mzCWHUQ7o8QQ287uREm+E1ABkw0WgvZG5mZrVWO59Dd71/uMj?=
 =?us-ascii?Q?9dMBwukOF6ttqjNHmoOPnOkZ0cEAk1kkcOc7e3WeZ436jkHY/crG6xm53vIJ?=
 =?us-ascii?Q?gCKbQKhxllNFUrAYSwbyCUCJDzbEToejuoNbnlp0et/aRISqzk3yDkvssvc9?=
 =?us-ascii?Q?VbHAI8Gr3hOmyrXIiDj7vQYLr28hwOwvKBfDkRdCSIMBNFdvu4GZ7HZF/OWV?=
 =?us-ascii?Q?8oKx5nmUXe2yK3EpVYkKWES/ON1HeiHxFTd4yLGu4Y2e7b0E3kuLuE5+VbZ/?=
 =?us-ascii?Q?cf0qbkpuKjqe0Mfozz43tZTgMNinf0yGuFpCeLf3h7dx5cYhP0Fijz4obPmx?=
 =?us-ascii?Q?4ckx+stOcwEdmMdYriqkUvV+O++maRQbnoZoLdh5iQwj+RYtZl4eOlVt6avN?=
 =?us-ascii?Q?zZWOzqOyrWGIM1nuN34VSz/kKlwlbKxAe4rg/oPu7uRpoMHkhJk6E7U3Ibsc?=
 =?us-ascii?Q?CtY/vqrKs4md+e4hVo3k0heT1QzeH1LwF3gR/B6GXvIUuiUnAOMzcmeuN16E?=
 =?us-ascii?Q?YQCOIHxxMpr3LlG0JTZnHEQF6gft+Qdp/UC/xP+ME6x1Qnw/hlDjHUO7A/T6?=
 =?us-ascii?Q?3ginjTMCoUp5/i+NWtrL0+UMYZLhwiwtwKQmwcPkf1Q03R+gP5YSdrQNgqpN?=
 =?us-ascii?Q?ZwUBf/eeNLGxuoFzTk+vLlpbaYiy0Qj1ho5GpI9+aqUz7Z+6EQg3SRu8+dcg?=
 =?us-ascii?Q?9JeQUF7RvPKomEFbNPK11mNTc2Mmosi3mPSKPk3SsQp0yxwo8Unofz5EJIkd?=
 =?us-ascii?Q?ziBeeYGJimLTuX74/yMCDiN6KcyF9FznHiV0xQwbBKA6Aj1Ugt21CASk4Fai?=
 =?us-ascii?Q?bxFdjKJLrNSd6Uy5CCGtkbm0E5l+21BiBM93XhcqS1LhheHRDeRSGNLjJisn?=
 =?us-ascii?Q?SVWu6hKoeNHFTd2T9gr3PbfsOt2KpHPF6CEuzB26RZRRPtAbH1KgHH2sXJcO?=
 =?us-ascii?Q?fZM29K55xs4Cz2nsIErj9w8uO/H0AahdOGlvaxlLdNA9jZp7fVnQaXdPkB+Y?=
 =?us-ascii?Q?rC9mSaWjXyGTHnasmxwZxJDVa2l5a4zP807dg3Il/rteDhaBFa4LE5nWvyFp?=
 =?us-ascii?Q?tdjSLeDzgyOV2IGZhkbzVbZm5X9o599n35bWG9/mO8ewzN27UMRlN8eVbHbY?=
 =?us-ascii?Q?ywuFgH0SjVu+kO05cL5Wot3JKXtrghboqdWxZ+n2zkozHT9RchdAQuHEkDbI?=
 =?us-ascii?Q?QhFg/BJAKecSSkQTIbqLQTh1wAARp92P9oe0YeaOAn0WbIqk+wZ0B5bwY2uM?=
 =?us-ascii?Q?ESLw4GWWbiDsE62PYDMhSFeQlfCdJANv5CLLFdd9kCjP?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7bb800a0-5f75-46a9-f620-08da60cffe71
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB7710.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 10:52:47.3786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eXcQ9qtSz4o3rH85hjxPWXEcwmy44xu6gFfzaJOhFkCrCBCvTxdy+KwkVmA36dwX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB7430
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Jul 2022 10:53:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167817

Fix below listed CVEs for curl:

1.CVE-2022-32206
Link: http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_7.81.0-1ubuntu=
1.3.debian.tar.xz

2.CVE-2022-32207
Linkh: https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/curl/7.74=
.0-1.3ubuntu2.3/curl_7.74.0-1.3ubuntu2.3.debian.tar.xz

3.CVE-2022-32208
Link: https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/curl/7.68.=
0-1ubuntu2.12/curl_7.68.0-1ubuntu2.12.debian.tar.xz

Signed-off-by: Sana.Kazi <Sana.Kazi@kpit.com>
---
 .../curl/curl/CVE-2022-32206.patch            |  49 +++
 .../curl/curl/CVE-2022-32207.patch            | 288 ++++++++++++++++++
 .../curl/curl/CVE-2022-32208.patch            |  29 ++
 meta/recipes-support/curl/curl_7.69.1.bb      |   3 +
 4 files changed, 369 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32206.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32207.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32208.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2022-32206.patch b/meta/rec=
ipes-support/curl/curl/CVE-2022-32206.patch
new file mode 100644
index 0000000000..d3b015e435
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-32206.patch
@@ -0,0 +1,49 @@
+From 7035676c3daa4f1c3766095561f12e7a0e82c736 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 16 May 2022 16:28:13 +0200
+Subject: [PATCH] content_encoding: return error on too many compression st=
eps
+
+The max allowed steps is arbitrarily set to 5.
+---
+ lib/content_encoding.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+CVE: CVE-2022-32206
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/c/cu=
rl/curl_7.81.0-1ubuntu1.3.debian.tar.xz]
+Comment: Refreshed hunks to fix patch fuzz
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+Index: curl-7.83.1/lib/content_encoding.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- curl-7.83.1.orig/lib/content_encoding.c
++++ curl-7.83.1/lib/content_encoding.c
+@@ -934,6 +934,9 @@
+   return NULL;
+ }
+
++/* allow no more than 5 "chained" compression steps */
++#define MAX_ENCODE_STACK 5
++
+ /* Set-up the unencoding stack from the Content-Encoding header value.
+  * See RFC 7231 section 3.1.2.2. */
+ CURLcode Curl_build_unencoding_stack(struct connectdata *conn,
+@@ -941,6 +944,7 @@
+ {
+   struct Curl_easy *data =3D conn->data;
+   struct SingleRequest *k =3D &data->req;
++  int counter =3D 0;
+
+   do {
+     const char *name;
+@@ -975,6 +979,11 @@
+       if(!encoding)
+         encoding =3D &error_encoding;  /* Defer error at stack use. */
+
++      if(++counter >=3D MAX_ENCODE_STACK) {
++        failf(data, "Reject response due to %u content encodings",
++              counter);
++        return CURLE_BAD_CONTENT_ENCODING;
++      }
+       /* Stack the unencoding stage. */
+       writer =3D new_unencoding_writer(conn, encoding, k->writer_stack);
+       if(!writer)
diff --git a/meta/recipes-support/curl/curl/CVE-2022-32207.patch b/meta/rec=
ipes-support/curl/curl/CVE-2022-32207.patch
new file mode 100644
index 0000000000..8435dfaed0
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-32207.patch
@@ -0,0 +1,288 @@
+Backported of:
+
+From 3782dfda5fc4f45a19b1ce1b01ecf7206a3d304a Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 25 May 2022 10:09:53 +0200
+Subject: [PATCH 1/3] fopen: add Curl_fopen() for better overwriting of fil=
es
+
+---
+ lib/Makefile.inc |   4 +-
+ lib/altsvc.c     |  22 +++-------
+ lib/cookie.c     |  16 ++-----
+ lib/fopen.c      | 106 +++++++++++++++++++++++++++++++++++++++++++++++
+ lib/fopen.h      |  28 +++++++++++++
+ 6 files changed, 152 insertions(+), 46 deletions(-)
+ create mode 100644 lib/fopen.c
+ create mode 100644 lib/fopen.h
+
+CVE: CVE-2022-32207
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary/+=
sourcefiles/curl/7.74.0-1.3ubuntu2.3/curl_7.74.0-1.3ubuntu2.3.debian.tar.xz=
]
+Comment: Removed hsts.c as it is not present in source code and refreshed =
other hunks to fix the patch fuzz
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+diff --git a/lib/Makefile.inc b/lib/Makefile.inc
+index 6d35704..7dac605 100644
+--- a/lib/Makefile.inc
++++ b/lib/Makefile.inc
+@@ -60,7 +60,7 @@
+   openldap.c curl_gethostname.c gopher.c idn_win32.c                    \
+   http_proxy.c non-ascii.c asyn-ares.c asyn-thread.c curl_gssapi.c      \
+   http_ntlm.c curl_ntlm_wb.c curl_ntlm_core.c curl_sasl.c rand.c        \
+-  curl_multibyte.c hostcheck.c conncache.c dotdot.c                     \
++  curl_multibyte.c hostcheck.c conncache.c dotdot.c fopen.c              =
      \
+   x509asn1.c http2.c smb.c curl_endian.c curl_des.c system_win32.c      \
+   mime.c sha256.c setopt.c curl_path.c curl_ctype.c curl_range.c psl.c  \
+   doh.c urlapi.c curl_get_line.c altsvc.c socketpair.c rename.c
+@@ -79,7 +79,7 @@
+   rtsp.h curl_threads.h warnless.h curl_hmac.h curl_rtmp.h              \
+   curl_gethostname.h gopher.h http_proxy.h non-ascii.h asyn.h           \
+   http_ntlm.h curl_gssapi.h curl_ntlm_wb.h curl_ntlm_core.h             \
+-  curl_sasl.h curl_multibyte.h hostcheck.h conncache.h                  \
++  curl_sasl.h curl_multibyte.h hostcheck.h conncache.h fopen.h          \
+   curl_setup_once.h multihandle.h setup-vms.h dotdot.h                  \
+   x509asn1.h http2.h sigpipe.h smb.h curl_endian.h curl_des.h           \
+   curl_printf.h system_win32.h rand.h mime.h curl_sha256.h setopt.h     \
+diff --git a/lib/altsvc.c b/lib/altsvc.c
+index 4ab77fd..97249b2 100644
+--- a/lib/altsvc.c
++++ b/lib/altsvc.c
+@@ -34,7 +34,7 @@
+ #include "parsedate.h"
+ #include "sendf.h"
+ #include "warnless.h"
+-#include "rand.h"
++#include "fopen.h"
+ #include "rename.h"
+
+ /* The last 3 #include files should be in this order */
+@@ -326,8 +326,7 @@
+   struct curl_llist_element *n;
+   CURLcode result =3D CURLE_OK;
+   FILE *out;
+-  char *tempstore;
+-  unsigned char randsuffix[9];
++  char *tempstore =3D NULL;
+
+   if(!altsvc)
+     /* no cache activated */
+@@ -341,16 +340,8 @@
+     /* marked as read-only, no file or zero length file name */
+     return CURLE_OK;
+
+-  if(Curl_rand_hex(data, randsuffix, sizeof(randsuffix)))
+-    return CURLE_FAILED_INIT;
+-
+-  tempstore =3D aprintf("%s.%s.tmp", file, randsuffix);
+-  if(!tempstore)
+-    return CURLE_OUT_OF_MEMORY;
+-
+-  out =3D fopen(tempstore, FOPEN_WRITETEXT);
+-  if(!out)
+-    result =3D CURLE_WRITE_ERROR;
++  result =3D Curl_fopen(data, file, &out, &tempstore);
++  if(!result) {
+   else {
+     fputs("# Your alt-svc cache. https://curl.haxx.se/docs/alt-svc.html\n=
"
+           "# This file was generated by libcurl! Edit at your own risk.\n=
",
+@@ -366,10 +356,10 @@ CURLcode Curl_altsvc_save(struct Curl_easy *data,
+         break;
+     }
+     fclose(out);
+-    if(!result && Curl_rename(tempstore, file))
++    if(!result && tempstore && Curl_rename(tempstore, file))
+       result =3D CURLE_WRITE_ERROR;
+
+-    if(result)
++    if(result && tempstore)
+       unlink(tempstore);
+   }
+   free(tempstore);
+diff --git a/lib/cookie.c b/lib/cookie.c
+index 1d1bf9b..2dc6314 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -99,6 +99,7 @@ Example set of cookies:
+ #include "parsedate.h"
+ #include "rand.h"
+ #include "rename.h"
++#include "fopen.h"
+
+ /* The last 3 #include files should be in this order */
+ #include "curl_printf.h"
+@@ -1524,17 +1524,8 @@
+     use_stdout =3D TRUE;
+   }
+   else {
+-    unsigned char randsuffix[9];
+-
+-    if(Curl_rand_hex(data, randsuffix, sizeof(randsuffix)))
+-      return 2;
+-
+-    tempstore =3D aprintf("%s.%s.tmp", filename, randsuffix);
+-    if(!tempstore)
+-      return 1;
+-
+-    out =3D fopen(tempstore, FOPEN_WRITETEXT);
+-    if(!out)
++    error =3D Curl_fopen(data, filename, &out, &tempstore);
++    if(error)
+       goto error;
+   }
+
+@@ -1581,7 +1572,7 @@
+   if(!use_stdout) {
+     fclose(out);
+     out =3D NULL;
+-    if(Curl_rename(tempstore, filename)) {
++    if(tempstore && Curl_rename(tempstore, filename)) {
+       unlink(tempstore);
+       goto error;
+     }
+diff --git a/lib/fopen.c b/lib/fopen.c
+new file mode 100644
+index 0000000..92dc31d
+--- /dev/null
++++ b/lib/fopen.c
+@@ -0,0 +1,106 @@
++/************************************************************************=
***
++ *                                  _   _ ____  _
++ *  Project                     ___| | | |  _ \| |
++ *                             / __| | | | |_) | |
++ *                            | (__| |_| |  _ <| |___
++ *                             \___|\___/|_| \_\_____|
++ *
++ * Copyright (C) 1998 - 2022, Daniel Stenberg, <daniel@haxx.se>, et al.
++ *
++ * This software is licensed as described in the file COPYING, which
++ * you should have received as part of this distribution. The terms
++ * are also available at https://curl.se/docs/copyright.html.
++ *
++ * You may opt to use, copy, modify, merge, publish, distribute and/or se=
ll
++ * copies of the Software, and permit persons to whom the Software is
++ * furnished to do so, under the terms of the COPYING file.
++ *
++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF =
ANY
++ * KIND, either express or implied.
++ *
++ ************************************************************************=
***/
++
++#include "curl_setup.h"
++
++#if !defined(CURL_DISABLE_COOKIES) && !defined(CURL_DISABLE_ALTSVC) &&  \
++  !defined(CURL_DISABLE_HSTS)
++
++#ifdef HAVE_FCNTL_H
++#include <fcntl.h>
++#endif
++
++#include "urldata.h"
++#include "rand.h"
++#include "fopen.h"
++/* The last 3 #include files should be in this order */
++#include "curl_printf.h"
++#include "curl_memory.h"
++#include "memdebug.h"
++
++/*
++ * Curl_fopen() opens a file for writing with a temp name, to be renamed
++ * to the final name when completed. If there is an existing file using t=
his
++ * name at the time of the open, this function will clone the mode from t=
hat
++ * file.  if 'tempname' is non-NULL, it needs a rename after the file is
++ * written.
++ */
++CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
++                    FILE **fh, char **tempname)
++{
++  CURLcode result =3D CURLE_WRITE_ERROR;
++  unsigned char randsuffix[9];
++  char *tempstore =3D NULL;
++  struct_stat sb, nsb;
++  int fd =3D -1;
++  *tempname =3D NULL;
++
++  if(stat(filename, &sb) =3D=3D -1 || !S_ISREG(sb.st_mode)) {
++    /* a non-regular file, fallback to direct fopen() */
++    *fh =3D fopen(filename, FOPEN_WRITETEXT);
++    if(*fh)
++      return CURLE_OK;
++    goto fail;
++  }
++
++  result =3D Curl_rand_hex(data, randsuffix, sizeof(randsuffix));
++  if(result)
++    goto fail;
++
++  tempstore =3D aprintf("%s.%s.tmp", filename, randsuffix);
++  if(!tempstore) {
++    result =3D CURLE_OUT_OF_MEMORY;
++    goto fail;
++  }
++
++  result =3D CURLE_WRITE_ERROR;
++  fd =3D open(tempstore, O_WRONLY | O_CREAT | O_EXCL, 0600);
++  if(fd =3D=3D -1)
++    goto fail;
++
++  if((fstat(fd, &nsb) !=3D -1) &&
++     (nsb.st_uid =3D=3D sb.st_uid) && (nsb.st_gid =3D=3D sb.st_gid)) {
++    /* if the user and group are the same, clone the original mode */
++    if(fchmod(fd, sb.st_mode) =3D=3D -1)
++      goto fail;
++  }
++
++  *fh =3D fdopen(fd, FOPEN_WRITETEXT);
++  if(!*fh)
++    goto fail;
++
++  *tempname =3D tempstore;
++  return CURLE_OK;
++
++fail:
++  if(fd !=3D -1) {
++    close(fd);
++    unlink(tempstore);
++  }
++
++  free(tempstore);
++
++  *tempname =3D NULL;
++  return result;
++}
++
++#endif /* ! disabled */
+diff --git a/lib/fopen.h b/lib/fopen.h
+new file mode 100644
+index 0000000..1020f3c
+--- /dev/null
++++ b/lib/fopen.h
+@@ -0,0 +1,28 @@
++#ifndef HEADER_CURL_FOPEN_H
++#define HEADER_CURL_FOPEN_H
++/************************************************************************=
***
++ *                                  _   _ ____  _
++ *  Project                     ___| | | |  _ \| |
++ *                             / __| | | | |_) | |
++ *                            | (__| |_| |  _ <| |___
++ *                             \___|\___/|_| \_\_____|
++ *
++ * Copyright (C) 1998 - 2022, Daniel Stenberg, <daniel@haxx.se>, et al.
++ *
++ * This software is licensed as described in the file COPYING, which
++ * you should have received as part of this distribution. The terms
++ * are also available at https://curl.se/docs/copyright.html.
++ *
++ * You may opt to use, copy, modify, merge, publish, distribute and/or se=
ll
++ * copies of the Software, and permit persons to whom the Software is
++ * furnished to do so, under the terms of the COPYING file.
++ *
++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF =
ANY
++ * KIND, either express or implied.
++ *
++ ************************************************************************=
***/
++
++CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
++                    FILE **fh, char **tempname);
++
++#endif
+--
+2.25.1
diff --git a/meta/recipes-support/curl/curl/CVE-2022-32208.patch b/meta/rec=
ipes-support/curl/curl/CVE-2022-32208.patch
new file mode 100644
index 0000000000..324fe874f6
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-32208.patch
@@ -0,0 +1,29 @@
+Backported from:
+
+From 4c3f77e871820d055a5f6c4cd7a6ac47a7f3877d Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 9 Jun 2022 09:27:24 +0200
+Subject: [PATCH] krb5: return error properly on decode errors
+
+CVE: CVE-2022-32208
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary/+=
sourcefiles/curl/7.68.0-1ubuntu2.12/curl_7.68.0-1ubuntu2.12.debian.tar.xz]
+Comment: No change in any hunk
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+diff --git a/lib/krb5.c b/lib/krb5.c
+index f50287a..5b77e35 100644
+--- a/lib/krb5.c
++++ b/lib/krb5.c
+@@ -86,11 +86,8 @@ krb5_decode(void *app_data, void *buf, int len,
+   enc.value =3D buf;
+   enc.length =3D len;
+   maj =3D gss_unwrap(&min, *context, &enc, &dec, NULL, NULL);
+-  if(maj !=3D GSS_S_COMPLETE) {
+-    if(len >=3D 4)
+-      strcpy(buf, "599 ");
++  if(maj !=3D GSS_S_COMPLETE)
+     return -1;
+-  }
+
+   memcpy(buf, dec.value, dec.length);
+   len =3D curlx_uztosi(dec.length);
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-suppor=
t/curl/curl_7.69.1.bb
index 5a597a7dd9..7b67b68f1d 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -35,6 +35,9 @@ SRC_URI =3D "https://curl.haxx.se/download/curl-${PV}.tar=
.bz2 \
            file://CVE-2022-27781.patch \
            file://CVE-2022-27782-1.patch \
            file://CVE-2022-27782-2.patch \
+           file://CVE-2022-32206.patch \
+           file://CVE-2022-32207.patch \
+           file://CVE-2022-32208.patch \
 "

 SRC_URI[md5sum] =3D "ec5fc263f898a3dfef08e805f1ecca42"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

