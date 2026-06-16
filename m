Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72ECBCD8CA8
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 06:31:52 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.148033.1781591509253900633
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 23:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TkZnS/DI;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7754; q=dns/txt;
  s=iport01; t=1781591509; x=1782801109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3jSyfMCKuirRuTRrCn09inOClDuAAOd4Jnyu9A9uMh8=;
  b=TkZnS/DIdZUxqJAz0bzBoFn0e6Lob025fKCh/GBFZ8czPVPo8Q7wq+o4
   HTBGV/pu32TR0se3vorut1hY8w5tZk7QXzBoK/YSbTczmlo/UtM3GAQwl
   Pya6fQ6FHQeeZzqWrBdwOmcB5vstjfPAbipbTyT0CAR6qKqqN8RBFDq+H
   /SjxhjC6L+V86SE5+rYFKEGpeie+lzgiV4Uev/C45pZvvqAnZ30MYS6Ij
   R+RXSvtHWurvFWXxSFcpuveVeC8s/CIhZIkQ0jkQCZws+dMkHhaY/kn4o
   bjnSeB4ucHfcQZCkUafCXFypZOpoMW5VtU9CLTz7411Y/zBSh4Nfd2xS4
   w==;
X-CSE-ConnectionGUID: lBj4PnkTTvmc5hziELITsw==
X-CSE-MsgGUID: QcqLA+vFTTmxqwP/kK9rKQ==
X-IPAS-Result: =?us-ascii?q?A0BHAgCJ7DBq/5H/Ja1aHgEBCxIMggULgld0X0JJlksDn?=
 =?us-ascii?q?huBfg8BAQEPRA0EAQGEQEYCjT8CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgECAQMyARgBLRAcAwECLysjCBmDAgGCcwIBEbFsg?=
 =?us-ascii?q?iyBAYMoATEFCQJDUNssAQsUAQWBM4U/gxwBhQJbGAGEfCcbG4FygRWDaYEFg?=
 =?us-ascii?q?VwBAYE4hm0EgiKBDIFaGAaPG0iBAhwDWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XNFgbBwWBHoIPgQWFDyMfAzl/gW+BJWdmFTA1gQEBER8KOgMLGA1IESw3F?=
 =?us-ascii?q?BsEPm4HjGUXD4FLcnsTARMYL1aBdaMHgiGhDwoog3WMIZU6GjOEBIFXkkCSU?=
 =?us-ascii?q?ZkIizeCU5ZQhGiBaDyBRwsHcBWDIglKGQ+OKg4Lg2CBf8ZDJDUCCTIBAQcCB?=
 =?us-ascii?q?wEBCwEDC4FokAGBfAEB?=
IronPort-Data: A9a23:K8N++qzm6Y2xzCmOG+56t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUFn
 2UaCDyEOanfMzenKooiOYqwpkoEvZbSyoAyHgVvpVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4+aT/H3Ygf/hWYqaz9MscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEUcP9Eg/OVLPX9L/
 qEYOjEgSjG/nP3jldpXSsE07igiBNPgMIVavjRryivUSK52B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cPnWjOX9PYH46tPywm2L/az5RgFmUvqEwpWPUyWSd1ZCxYYaMK4PbGZk9ckCwn
 2nf2026HD8mCNmP0CW9tXGP1/XspHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBVi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:6UXSPa67nGsPhshrcAPXwBbXdLJyesId70hD6qm+c3Nom6uj5q
 aTdZUgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4fTLfCFHZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce36m+okcfng9OXL/f6
 DsnfZ6mw==
X-Talos-CUID: 9a23:F+Fd+25nhzUkkcOSmdss8GQWRvgjcUHh0nLbfk+qCEtNaYGOVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3ACD3eiQ26Z8fNt8Z+DrZbNN3CyjUj2q+3LGlOj7s?=
 =?us-ascii?q?6h8yULDNIfDS+3S6Ue9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,207,1774310400"; 
   d="scan'208";a="494197944"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Jun 2026 06:31:48 +0000
Received: from sjc-ads-3321.cisco.com (sjc-ads-3321.cisco.com [171.68.249.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 3D6531800045F;
	Tue, 16 Jun 2026 06:31:48 +0000 (GMT)
Received: by sjc-ads-3321.cisco.com (Postfix, from userid 1839047)
	id E000ECC1243; Mon, 15 Jun 2026 23:31:47 -0700 (PDT)
From: "Shubham Pushpkar -X (spushpka - E INFOCHIPS PRIVATE LIMITED at Cisco)" <spushpka@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Shubham Pushpkar <spushpka@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH 2/2] libsolv: Fix CVE-2026-9149
Date: Mon, 15 Jun 2026 23:31:36 -0700
Message-Id: <20260616063136.2772168-2-spushpka@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260616063136.2772168-1-spushpka@cisco.com>
References: <20260616063136.2772168-1-spushpka@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3321.cisco.com [171.68.249.19];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.19, sjc-ads-3321.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 06:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238869

From: Shubham Pushpkar <spushpka@cisco.com>

This patch applies the upstream fix as referenced in [1], using the CVE advisory shown in [2].
[1] https://github.com/openSUSE/libsolv/commit/210386037c892a720972ad35a3d8f7073b4d763b
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-9149

Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
---
 .../libsolv/0002-Fix-CVE-2026-9149.patch      | 152 ++++++++++++++++++
 .../libsolv/libsolv_0.7.28.bb                 |   1 +
 2 files changed, 153 insertions(+)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0002-Fix-CVE-2026-9149.patch

diff --git a/meta/recipes-extended/libsolv/libsolv/0002-Fix-CVE-2026-9149.patch b/meta/recipes-extended/libsolv/libsolv/0002-Fix-CVE-2026-9149.patch
new file mode 100644
index 0000000000..11acf758b5
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/0002-Fix-CVE-2026-9149.patch
@@ -0,0 +1,152 @@
+From 175bd2008d3b3a4b54253bd6657cc46948360534 Mon Sep 17 00:00:00 2001
+From: Petr Písař <ppisar@redhat.com>
+Date: Thu, 23 Apr 2026 18:04:24 +0200
+Subject: [PATCH 2/2] Cope with integer overflow in data size arithmetics in
+ repo_add_solv()
+
+When parsing solv files with maliciously large "maxsize" or "allsize"
+data size, e.g. this maxsize value at offset 0x29--0x2E:
+
+    00000000  53 4f 4c 56 00 00 00 08  00 00 00 01 00 00 00 00  |SOLV............|
+    00000010  00 00 00 00 00 00 00 00  00 00 00 01 00 00 00 01  |................|
+    00000020  00 00 00 00 00 00 00 00  00 8f ff ff bf 77 86 8d  |.............w..|
+    00000030  20 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  | ...............|
+    00000040  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
+    *
+    00002030  00                                                |.|
+    00002031
+
+read_id() function will decode and return 4294959095 value, and a subsequent
+assignment:
+
+    int maxsize;
+    [...]
+    maxsize = read_id(&data, 0);
+
+will experience an integer overflow on plaforms where signed int has 4-byte
+size (e.g. x86_64).
+
+The same flaw is possible at the next line:
+
+    allsize = read_id(&data, 0);
+
+Subsequent arithmetics will interpreter the value as a very large negative
+number, possibly doing wrong decisions:
+
+    maxsize += 5; /* so we can read the next schema of an array */
+    if (maxsize > allsize)
+      maxsize = allsize;
+
+and finally, the negative value passed to solv_calloc():
+
+    buf = solv_calloc(maxsize + DATA_READ_CHUNK + 4, 1);  /* 4 extra bytes to detect overflows */
+
+will be coerced to an unsigned type (size_t) leading to allocating a smaller
+buffer then intended. Then writing to the small buffer will experience a heap
+buffer overflow:
+
+    l = maxsize;
+    if (l < DATA_READ_CHUNK)
+      l = DATA_READ_CHUNK;
+    if (l > allsize)
+      l = allsize;
+    if (!l || fread(buf, l, 1, data.fp) != 1)
+
+This flaw can be demostrated by passing that solv file to the dumpsolv tool which
+will crash if compiled with ASAN:
+
+    $ /tmp/b/tools/dumpsolv /tmp/vuln_1_101_1_negative_maxsize.solv
+    =================================================================
+    ==17608==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x7c0a2ede00b1 at pc 0x7fea30451468 b
+    p 0x7ffe07220a50 sp 0x7ffe07220220
+    WRITE of size 8192 at 0x7c0a2ede00b1 thread T0
+	#0 0x7fea30451467 in fread.part.0 (/lib64/libasan.so.8+0x51467) (BuildId: 80bfc4ae44fdec6ef5fecfb01
+    e2b57d28660991c)
+	#1 0x7fea3028eef1 in repo_add_solv /home/test/libsolv/src/repo_solv.c:1034
+	#2 0x0000004041cc in main /home/test/libsolv/tools/dumpsolv.c:471
+	#3 0x7fea3003c680 in __libc_start_call_main (/lib64/libc.so.6+0x3680) (BuildId: c04494d63bca865bedf571a4075ef8867ccf9fa9)
+	#4 0x7fea3003c797 in __libc_start_main@GLIBC_2.2.5 (/lib64/libc.so.6+0x3797) (BuildId: c04494d63bca865bedf571a4075ef8867ccf9fa9)
+	#5 0x000000400694 in _start (/tmp/b/tools/dumpsolv+0x400694) (BuildId: 0a70b5b14e5cd81f90a309bb2ff3219dfbf30bb8)
+
+    0x7c0a2ede00b1 is located 0 bytes after 1-byte region [0x7c0a2ede00b0,0x7c0a2ede00b1)
+    allocated by thread T0 here:
+	#0 0x7fea304ef41f in malloc (/lib64/libasan.so.8+0xef41f) (BuildId: 80bfc4ae44fdec6ef5fecfb01e2b57d28660991c)
+	#1 0x7fea302e4b4c in solv_calloc /home/test/libsolv/src/util.c:77
+	#2 0x7fea3028ee38 in repo_add_solv /home/test/libsolv/src/repo_solv.c:1025
+	#3 0x0000004041cc in main /home/test/libsolv/tools/dumpsolv.c:471
+	#4 0x7fea3003c680 in __libc_start_call_main (/lib64/libc.so.6+0x3680) (BuildId: c04494d63bca865bedf571a4075ef8867ccf9fa9)
+	#5 0x7fea3003c797 in __libc_start_main@GLIBC_2.2.5 (/lib64/libc.so.6+0x3797) (BuildId: c04494d63bca865bedf571a4075ef8867ccf9fa9)
+	#6 0x000000400694 in _start (/tmp/b/tools/dumpsolv+0x400694) (BuildId: 0a70b5b14e5cd81f90a309bb2ff3219dfbf30bb8)
+
+    SUMMARY: AddressSanitizer: heap-buffer-overflow /home/test/libsolv/src/repo_solv.c:1034 in repo_add_solv
+
+This patch catches the integer overflow, sets an error and jumps to the end of
+the function just after deallocation of the buffer (which would contain an
+undefined pointer). This patch also handles a possible integer overflow at
+"maxsize += 5" line.
+
+I originally wanted to replace read_id() with read_u32(), but
+complemtary repowriter_write() function also stored the value as
+a signed integer, so I guess the the Id type is inteded there.
+
+There are probably other ways how to fix it, like passing INT_MAX-5
+limit to read_id(), though the error message would be less
+understandable.
+
+It's also possible to reject this patch with an explanation that loading
+untrusted solv files is not supported. Though some kind of
+fortification would be welcomed by people who debug solver problems
+from reported solv files.
+
+Reported by Aisle Research.
+
+CVE: CVE-2026-9149
+Upstream-Status: Backport [https://github.com/openSUSE/libsolv/commit/210386037c892a720972ad35a3d8f7073b4d763b]
+
+(cherry picked from commit 210386037c892a720972ad35a3d8f7073b4d763b)
+Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
+---
+ src/repo_solv.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/src/repo_solv.c b/src/repo_solv.c
+index 629ac683..00639aa0 100644
+--- a/src/repo_solv.c
++++ b/src/repo_solv.c
+@@ -18,6 +18,7 @@
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <string.h>
++#include <limits.h>
+ 
+ #include "repo_solv.h"
+ #include "util.h"
+@@ -1078,6 +1079,18 @@ repo_add_solv(Repo *repo, FILE *fp, int flags)
+ 
+   maxsize = read_id(&data, 0);
+   allsize = read_id(&data, 0);
++  if (maxsize < 0 || allsize < 0)
++    {
++      data.error = pool_error(pool, SOLV_ERROR_CORRUPT, "negative data size in solv header");
++      id = 0;
++      goto data_error;
++    }
++  if (maxsize > INT_MAX - 5)
++    {
++      data.error = pool_error(pool, SOLV_ERROR_OVERFLOW, "data size overflow in solv header");
++      id = 0;
++      goto data_error;
++    }
+   maxsize += 5;	/* so we can read the next schema of an array */
+   if (maxsize > allsize)
+     maxsize = allsize;
+@@ -1403,6 +1416,7 @@ printf("=> %s %s %p\n", pool_id2str(pool, keys[key].name), pool_id2str(pool, key
+     }
+   solv_free(buf);
+ 
++data_error:
+   if (data.error)
+     {
+       /* free solvables */
+-- 
+2.35.6
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.28.bb b/meta/recipes-extended/libsolv/libsolv_0.7.28.bb
index 2b1b079ce1..4a9dd1278a 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.28.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.28.bb
@@ -11,6 +11,7 @@ DEPENDS = "expat zlib zstd"
 SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
            file://0001-Fix-CVE-2026-9150.patch \
+           file://0002-Fix-CVE-2026-9149.patch \
 "
 
 SRCREV = "c8dbb3a77c86600ce09d4f80a504cf4e78a3c359"
-- 
2.35.6


