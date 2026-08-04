Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9ADC55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 13:11:35 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15930.1785849087911943524
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 06:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=p9wD3JG/;
 spf=pass (domain: est.tech, ip: 52.101.69.0, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xwkVRI7UNHU5tIWX0eWvc42NqpxngTbfH3rE/zPHzYjC3D8QxgH6zTqcHjdP0lGiTGIFSjmtC66fhZiq1WaAXTKuSiOWQCTOc7POki2NtoBGde1+qS13lPjrGizlXfamrR7wH8jyVBd9ikBRiQBlElFjYrUoaUBtqFoNB0zQA9akSeSH7u9xI8XnUw7Avfvk0HR1L/qAHuL9K+Z/cDjXcD0zzEV7sqCmDP+eQvaLzVnVC1sKvmxq6ABMf0D2mr5oIy2oRi0PQHsX2pXoqcyR+rXKO314H9ceUzz0ip8qw5JkaxUAyMVwli18NO3mLitQGCtJZw7PJ1VXJ4nqoAehTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLKlR2Jddiv+cjmm4UNcy9LzVaXsGq3ELFLbGgTku68=;
 b=KZOdSlGbpuJVLYmODvsc316LAp0XUk4byFZszCXZSbnB30Je0h3PQ30BL4t4VppFRw1lGpe21bVuQZxFTjZprxZ7kU1LjDgUKbgDCbFRg/Xh7eb3iQo6XiJyDZdvKtpZaHZMjrO/PTjfE5efAs+t3sAgiDVFERRCodlxlv0c27j8zwcErJG8226LFXqDoyy/lKwwZmFJ9sepMpBPDVulKyuwDZclK+nYTSil+7u4kr46kV9VIttR7i+uXfW13fKXnoI5LHaYnqP1MIKsc4E9I5ie+91pmeAJVATr1GC4pE5DZnFRV+8doeBIh6J3vqnnKBKHkU/gykFG6jOKEDT3Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLKlR2Jddiv+cjmm4UNcy9LzVaXsGq3ELFLbGgTku68=;
 b=p9wD3JG/pjUxXLeLxBrHj+0LzDTZDg8oUEkHZwfXSI/mypZzZ0QJZRn0MQWArsd8sNitQ5/rM4TQL97KxDxHiWuZbM1T+HDXEKW4gIjg0RBZTIiWmdrp5jWrHm66/V3xNewsqt3pvAsqG7DutCbHar4bMAg/clsIaXgdv26lhbD+uFfT7HA9WA8WnhITdXeC7/A7a0Pgtc8HsxoSX5KLE8IqkgGyMesKVQf5uMVM/QSeZlXx1ZXfCgLIwNUx1zyJ1jHN9spse3dWnhW6ZjjKecnde//WiwnzzZFXgm48/PrYxLIhY0f7irDgcCTS8Q1FvwDU5RnPdBIFsYxhlu3A4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PR3P189MB0858.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 13:11:25 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 13:11:25 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH v2 3/4] libssh2: fix CVE-2026-66034
Date: Tue,  4 Aug 2026 15:11:12 +0200
Message-ID: <20260804131113.3588-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260804131113.3588-1-jaipaul.cheernam@est.tech>
References: <20260803084141.46902-1-jaipaul.cheernam@est.tech>
 <20260804131113.3588-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0249.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::10) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PR3P189MB0858:EE_
X-MS-Office365-Filtering-Correlation-Id: a8365115-6002-4bce-7f33-08def229e328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|11063799006|4143699003|12006099003|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	vrzmY0P81N4vzRpQZZP0M/a1Yy43rS6VAn1kmfQpBSTt26cfgaeQqcrisE/Nb5vOjEbmmQYBWovmpzvj1+5iSd80Tun4mVK2XE7L/S7Oj7mxIIP+FaGygoni4jz2T1nkdPSe/vWxArDWTbuC4p6nVYsHj9vlofQ+PDZBM/85wP+a3E35A6KvU+5alKWLwpFYfYhaR17gpOiFWIX5HUkf6QdPAO5QOiVMxtcNJ7oDzPZoUl91Ef9JzgBQ8W5GCIGtLOFrLq+ZX3Tkn5Mlbmvvb9g0PRkz2+tXLxxeFtKfTpTeGC9EYe1vk87Q6XSgihlZ+AWqTuJj4h02e9sR92V9ORZJ847K36RWkHwN58ilthQIEUUeB9Phgx2qJsCZI8LJAc588DpOZYCkpSd1PLiwynOCf7/EGMaPdC6YH+n+lYYJi4p7OZWTa4BYKuBsQ6eB96TqdsXAG7ku8nsWcBK3TzNhHaPOIQ/3BemvHp1m0PzLrOtoX8tvXzyBToZqkCPZcaWT6OfuDSeqUicZBP7uo1IfwydeAAnwb0h2U/1zobRTkYktuoCRlaPXepKtoT/+b6SsJu/1M5HYynOsa2i0FuYuTrzH0yXJMM2qAu1r/nqEJCO47jvXdJ1GBBnrZStw7yib0mMSx6kIVrnCR4nA/9dcQUm1Klb5Tw8KCJ6B0Ok=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(11063799006)(4143699003)(12006099003)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n6qkKbAeY3loYoHy4XaPsbSco1AYzowzNPiHXGeHgtN8FeBKRm0KYblyoJGu?=
 =?us-ascii?Q?26twql8GvkZtUNLOxa6tNZlNxtpENYdpv16JCE9dgGU8Is26M7YR2xUvJfzk?=
 =?us-ascii?Q?oya5sj8UB3YAIJ1nTAexdfjwjdvxcg/83FnhhCwyphg9bGONsHL5UZvUZh1Y?=
 =?us-ascii?Q?CZ/Cjxn4sp0fYnD5z0GFGV5Sv9L3naaEp4W6dstxuBd0/u4J4hIOgnSW3O3w?=
 =?us-ascii?Q?Y+dxRU2MsUW/DJXLn0Klrte5roQfXYRDnnnY+DQI4x7v+0ACoRTmTeefxs0y?=
 =?us-ascii?Q?XMFMFoDdp2eBCSkGfGZrOSmBjuLLP1OHVW0sCLHjDDwchnwUEx5dqk2UVWqT?=
 =?us-ascii?Q?MJC2BEpVG+x+gtEJpw1rJ9GkW0KKMTIqXeXezHI5VYIFN1B0mHN5nv//RJ4a?=
 =?us-ascii?Q?I5KSoNkDLArxc1lkzIg5BKRt/ohuLuECOnbY+gBeHcxngqH/Ix9XKveQqKG8?=
 =?us-ascii?Q?SSENTzhkACOYG+7pJDnGmGEf9QVFcwbxE85Usuemze1GSeLpNr1h9tSckv1E?=
 =?us-ascii?Q?P8djhNlTtGBCJDr9t+YilixF4T+FTpi9uRTsKVFS0GoOjV+M9/sZ81lTh+tc?=
 =?us-ascii?Q?4k5nTDX0YZcZ4fDatIOBi66hDb6G8sL3DJRQfmYqpMxq+QRhmlls5wf0WSw2?=
 =?us-ascii?Q?vzL+P/THfPRjxhFhyUR3Uheo4/OsrCQHHUwmhCHVwSLyT0LTp4BX190V3rJY?=
 =?us-ascii?Q?yKqLqZTEgitrOnFbJksQHu9/4UyTg6cyfjfbMdMIvDCDHoKi9Cji7UHt7bMn?=
 =?us-ascii?Q?dZWj0FF7wA7CsY68UwwpUdvb6V9KbG1IT/hYzYBoNPVHgDw/b3PIXqhobFDC?=
 =?us-ascii?Q?uOqF/gYFmWiT3C5GVRQQBxK+Vj9mCGBcAKWe+bgNbguPdnQDUFasMbt6kWmt?=
 =?us-ascii?Q?ze1nikTt55lg3Mbw1c8m6wuPgkGSN+U5fe6+G9cZ+roSj4hME/Fl+0oX5JDy?=
 =?us-ascii?Q?I3w7Yv4fGrRg3n8csemRySYBJcLuPlhSkjaaqAgBx7SS0zVrebI7RCtIZkhd?=
 =?us-ascii?Q?LseZTkyEkHSoe6f6J7jp4XJmwz8mTil9w6W07yafA/3cg2eViLQmuXhOE9qA?=
 =?us-ascii?Q?MdhFhF+8zygm+lamXXLS6fxAXwLZH/ZFcnQ+w9/G0G64JsOyldVenZMm8SOv?=
 =?us-ascii?Q?kimSvB0u4waJ0m4OOe3bKY24t9f9ZbaV4ex6YiQV2Qwj7HP1Pw/s4eROIzT8?=
 =?us-ascii?Q?b/+I4Zf/siaICT/jiV3nCJrdohTU7uwRmxzLIV+En9HjsbvlX7pqa7jKfAj4?=
 =?us-ascii?Q?F2kGtN7zOWjc8XX2NjNITtPrUYq0YOB4jAJdLQ+30Rk9VIQv+qFDDVOet0ea?=
 =?us-ascii?Q?TbmPejrJAyJ32OzjxrcKYOIG3jk0SGGtjvtUicgwvoTC7DKoGr94NCy/rs6T?=
 =?us-ascii?Q?6eqZdKMmBJ5kLw8lATVG9T/5+G4/vUfipaGHRocieFy5x4yj4j5L3KOn1WQ2?=
 =?us-ascii?Q?oWeeantd/sN56Csq0FbM05J2R0QpeBRAXsriBGqX2dQPIRyuJFe/NWjrygPM?=
 =?us-ascii?Q?OxmBhmMojyautwg9h0ZgysTRdvXzsZTaUg8OwHK7kSGpVJgWFK1TJteeOAyx?=
 =?us-ascii?Q?Ruh5dyaR9tDVOY+AeaOKTRdd5rUv2ZUsOuokgBaYqXcNUQmlzA/oPbtql48W?=
 =?us-ascii?Q?CH+v7RlpV32ftry2j2iEdVxhEfGyFPbGVJtAHln57naVXm39WExR6EzIt5sL?=
 =?us-ascii?Q?pNYc+8/GcA2iT70Dw8HpVi0FoCmQxwogq4wzweHDzlMw8tJWAvI/wzMKi5zi?=
 =?us-ascii?Q?HET4rrvyT0hUZzRomgm2wKPU1weBT2w=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a8365115-6002-4bce-7f33-08def229e328
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 13:11:25.3908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5peHtbqLVzfDHjLntyisl85iSc2DngIILKXa9uludXr+C9vpY0TQGz49ecVwSHgc2phr4D/1KPRhqFcYeS5tGn1ymm7ZIGPaVSGWvIH2eI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB0858
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 13:11:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242761

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
index de435a836d..7d3063d930 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://CVE-2025-15661-3.patch \
            file://CVE-2026-66032.patch \
            file://CVE-2026-66033.patch \
+           file://CVE-2026-66034.patch \
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"

