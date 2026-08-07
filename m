Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E56C5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 07:53:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37860.1786088608847103081
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 00:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lJT3kx2j;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26793a5159=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677302kS1654569
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Aug 2026 07:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=8uHxrsCql
	DjaYJ4UK/CYydgROQZYrweLeNAF0Kuxv08=; b=lJT3kx2jAKHSCneHV7Uu1j8Jl
	Ok/AoWotTFFxVoP7CsK1r37sC0nezB0O2i9iCjyvixRq33hAGGiHDN5a8fxCWkTK
	G8dKgz7rnmYBmlj39b69ThRwLJXqzhuXqVpTFJdw02chV4Oze/hzh6gTqrpzGlrP
	Zb3YNn0E/JX11C9JFGjfEdbNPFhIDhpn3vcJDAj5+v144UzPVp0e5o4naqRq92C+
	maEvPlCHdBRLWFsXImbrwBjJ1FrGm4DFGGWO89vuRmq9ndwgLc7rieBS/NVa+y0Y
	A/7KVc4BzvnM5Mr488PAgb+yH/2zHqZ/hejC1kxGFTrP+iBHE1rxlcRAONpoQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fvpq929qs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 07:43:27 +0000 (GMT)
Received: from ala-p2exch02.corp.ad.wrs.com (10.11.226.102) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 7 Aug 2026 00:43:26 -0700
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-p2exch02.corp.ad.wrs.com (10.11.226.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Fri, 7 Aug 2026 00:43:26 -0700
Received: from oak-lpgbuild10.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 7 Aug 2026 00:43:26 -0700
From: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <Shiva.Komati@windriver.com>,
        Himani Barde
	<himani.barde@windriver.com>
Subject: [PATCH] libarchive: backport fix for archive_read_append_filter test failure
Date: Fri, 7 Aug 2026 07:43:22 +0000
Message-ID: <20260807074322.3270763-1-HimaniRamesh.Barde@windriver.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a758c9f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8 a=3uWsZ661AAAA:8 a=t7CeM3EgAAAA:8
 a=tyuvAb6jAAAA:8 a=BNUgh-rdlzo89TnIHOUA:9 a=fYNom5PXsM5enKJDCoVv:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=vMd6T1JfvD_20K6YSfI9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1NiBTYWx0ZWRfX6RbDGEVMEMNt
 K/k5ecYe8NTBEQahScD9JpTN8dmS9PKhgyYVZfxJxoFWmpazQPLguT7efQ0d2JW8Xbk81yzzylh
 +bdXdElxNOpkbl+vkxzJ9ndKiJ0dXEVqMn9pkPIdUEMIOUU3bZYw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1NiBTYWx0ZWRfX/EPyL4YRJ3ds
 MtBb6OYg0P3GU8AvYIOLHZ2l9SedrE1uJxFLsIZ4imv7xg0T1IXBGVPOSL/kUr2yxAbbphSDvsH
 d4s/+t5Oi8gHqJjP6mCSPi+Jnjsy5fX0J+jwxNZXMK1ttXzD3ue2ooM56tI4Me5XiW7EFKS+h4N
 ufNHGGAbWgHIgGcUXSCQ6lsfxqqwXr4iYxG9XniNG50fHxSktZR4n9fhsefozo8COqQEgfCFqv5
 FdcYmPhpcNZRoNhWgERR/CaYNjfzNFLMAh9McIaqWvr+ENrpXEMfFdipv/p+df1X1Fx4ks+LBzC
 mx34xvzQanbod2Fb1Jf2aC2wd1TlNZCaou7nEdgwc32E8lqT79zWlwOYi+scZgvymiTzERF/Zzw
 CDWMOme6GY2xShoanXrY0xME32QiwD7GQ+bZkzIeRT7kQyNl9zf2ehkNPFUIC57DS7jTmjuMNA8
 r/TtL0Swt9WhBe2uuZg==
X-Proofpoint-ORIG-GUID: 57hH5LGGDVeifc2q8H6Fgs6Ll9O6CF8E
X-Proofpoint-GUID: 57hH5LGGDVeifc2q8H6Fgs6Ll9O6CF8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070056
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 07:53:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242989

From: Himani Barde <himani.barde@windriver.com>

Backport upstream commit 50b585bb ('append_filter: Use last bidder for
filter') to fix test_read_append_rpm_filter ptest failure.

The archive_read_append_filter() function used a name-based bidder
lookup loop that could fail to locate the correct bidder due to a
desync between the loop index and the bidder array. The fix replaces
this with get_last_bidder() which returns the most recently registered
bidder.

Upstream: https://github.com/libarchive/libarchive/commit/50b585bb

Signed-off-by: Himani Barde <himani.barde@windriver.com>
---
 ...nd_filter-Use-last-bidder-for-filter.patch | 188 ++++++++++++++++++
 .../libarchive/libarchive_3.8.9.bb            |   1 +
 2 files changed, 189 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-append_filter-Use-last-bidder-for-filter.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Use-last-bidder-for-filter.patch b/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Use-last-bidder-for-filter.patch
new file mode 100644
index 0000000000..8e1eb0e938
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-append_filter-Use-last-bidder-for-filter.patch
@@ -0,0 +1,188 @@
+From 50b585bb55484cdc70bd92852a477178dc43485c Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Sun, 2 Aug 2026 14:27:17 +0200
+Subject: [PATCH] append_filter: Use last bidder for filter
+
+Appending a filter implies appending a bidder. Always use the last added
+bidder, since it was just added. This avoids desync situations where
+previously added bidders could erroneously match.
+
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/50b585bb]
+---
+ libarchive/archive_read_append_filter.c | 72 ++++++++-----------------
+ 1 file changed, 22 insertions(+), 50 deletions(-)
+
+diff --git a/libarchive/archive_read_append_filter.c b/libarchive/archive_read_append_filter.c
+index 8de1b2ea..9dd9f536 100644
+--- a/libarchive/archive_read_append_filter.c
++++ b/libarchive/archive_read_append_filter.c
+@@ -33,14 +33,25 @@
+ #include "archive_private.h"
+ #include "archive_read_private.h"
+ 
++static struct archive_read_filter_bidder *
++get_last_bidder(struct archive_read *a)
++{
++  size_t i;
++
++  for (i = 0; i < sizeof(a->bidders) / sizeof(a->bidders[0]); i++)
++  {
++    if (a->bidders[i].vtable == NULL)
++      break;
++  }
++
++  return a->bidders + (i - 1);
++}
++
+ int
+ archive_read_append_filter(struct archive *_a, int code)
+ {
+-  int r1, r2, number_bidders, i;
+-  const char *str;
+-  struct archive_read_filter_bidder *b;
+-  struct archive_read_filter *f;
+   struct archive_read *a = (struct archive_read *)_a;
++  int r1, r2;
+ 
+   r2 = (ARCHIVE_OK);
+   switch (code)
+@@ -53,15 +64,12 @@ archive_read_append_filter(struct archive *_a, int code)
+       r1 = (ARCHIVE_OK);
+       break;
+     case ARCHIVE_FILTER_GZIP:
+-      str = "gzip";
+       r1 = archive_read_support_filter_gzip(_a);
+       break;
+     case ARCHIVE_FILTER_BZIP2:
+-      str = "bzip2";
+       r1 = archive_read_support_filter_bzip2(_a);
+       break;
+     case ARCHIVE_FILTER_COMPRESS:
+-      str = "compress (.Z)";
+       r1 = archive_read_support_filter_compress(_a);
+       break;
+     case ARCHIVE_FILTER_PROGRAM:
+@@ -69,43 +77,33 @@ archive_read_append_filter(struct archive *_a, int code)
+           "Cannot append program filter using archive_read_append_filter");
+       return (ARCHIVE_FATAL);
+     case ARCHIVE_FILTER_LZMA:
+-      str = "lzma";
+       r1 = archive_read_support_filter_lzma(_a);
+       break;
+     case ARCHIVE_FILTER_XZ:
+-      str = "xz";
+       r1 = archive_read_support_filter_xz(_a);
+       break;
+     case ARCHIVE_FILTER_UU:
+-      str = "uu";
+       r1 = archive_read_support_filter_uu(_a);
+       break;
+     case ARCHIVE_FILTER_RPM:
+-      str = "rpm";
+       r1 = archive_read_support_filter_rpm(_a);
+       break;
+     case ARCHIVE_FILTER_LZ4:
+-      str = "lz4";
+       r1 = archive_read_support_filter_lz4(_a);
+       break;
+     case ARCHIVE_FILTER_ZSTD:
+-      str = "zstd";
+       r1 = archive_read_support_filter_zstd(_a);
+       break;
+     case ARCHIVE_FILTER_LZIP:
+-      str = "lzip";
+       r1 = archive_read_support_filter_lzip(_a);
+       break;
+     case ARCHIVE_FILTER_LZOP:
+-      str = "lzop";
+       r1 = archive_read_support_filter_lzop(_a);
+       break;
+     case ARCHIVE_FILTER_LRZIP:
+-      str = "lrzip";
+       r1 = archive_read_support_filter_lrzip(_a);
+       break;
+     case ARCHIVE_FILTER_GRZIP:
+-      str = "grzip";
+       r1 = archive_read_support_filter_grzip(_a);
+       break;
+     default:
+@@ -114,22 +112,10 @@ archive_read_append_filter(struct archive *_a, int code)
+       return (ARCHIVE_FATAL);
+   }
+ 
+-  if (code != ARCHIVE_FILTER_NONE)
++  if (r1 > ARCHIVE_FATAL && code != ARCHIVE_FILTER_NONE)
+   {
+-    number_bidders = sizeof(a->bidders) / sizeof(a->bidders[0]);
+-
+-    b = a->bidders;
+-    for (i = 1; i < number_bidders; i++, b++)
+-    {
+-      if (!b->name || !strcmp(b->name, str))
+-        break;
+-    }
+-    if (!b->name || strcmp(b->name, str))
+-    {
+-      archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
+-          "Internal error: Unable to append filter");
+-      return (ARCHIVE_FATAL);
+-    }
++    struct archive_read_filter_bidder *b;
++    struct archive_read_filter *f;
+ 
+     f = calloc(1, sizeof(*f));
+     if (f == NULL)
+@@ -137,6 +123,7 @@ archive_read_append_filter(struct archive *_a, int code)
+       archive_set_error(&a->archive, ENOMEM, "Out of memory");
+       return (ARCHIVE_FATAL);
+     }
++    b = get_last_bidder(a);
+     f->bidder = b;
+     f->archive = a;
+     f->upstream = a->filter;
+@@ -162,37 +149,22 @@ int
+ archive_read_append_filter_program_signature(struct archive *_a,
+   const char *cmd, const void *signature, size_t signature_len)
+ {
+-  int r, number_bidders, i;
++  struct archive_read *a = (struct archive_read *)_a;
+   struct archive_read_filter_bidder *b;
+   struct archive_read_filter *f;
+-  struct archive_read *a = (struct archive_read *)_a;
++  int r;
+ 
+   if (archive_read_support_filter_program_signature(_a, cmd, signature,
+     signature_len) != (ARCHIVE_OK))
+     return (ARCHIVE_FATAL);
+ 
+-  number_bidders = sizeof(a->bidders) / sizeof(a->bidders[0]);
+-
+-  b = a->bidders;
+-  for (i = 0; i < number_bidders; i++, b++)
+-  {
+-    /* Program bidder name set to filter name after initialization */
+-    if (b->data && !b->name)
+-      break;
+-  }
+-  if (!b->data)
+-  {
+-    archive_set_error(&a->archive, ARCHIVE_ERRNO_PROGRAMMER,
+-        "Internal error: Unable to append program filter");
+-    return (ARCHIVE_FATAL);
+-  }
+-
+   f = calloc(1, sizeof(*f));
+   if (f == NULL)
+   {
+     archive_set_error(&a->archive, ENOMEM, "Out of memory");
+     return (ARCHIVE_FATAL);
+   }
++  b = get_last_bidder(a);
+   f->bidder = b;
+   f->archive = a;
+   f->upstream = a->filter;
+-- 
+2.54.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
index 63c66eea81..35b724ca39 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
@@ -31,6 +31,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://run-ptest \
+           file://0001-append_filter-Use-last-bidder-for-filter.patch \
            file://0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch \
           "
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
-- 
2.54.0


