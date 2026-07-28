Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC0BEC54F5B
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 22:22:15 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2697.1785277325636650819
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 15:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JMsnfvxw;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so2040015e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 15:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785277324; x=1785882124; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PnAKHqrN0T8ya1Ewwi3FHRCPIc2yNoCL0REgkoh7WFc=;
        b=JMsnfvxw3KVhH5cKf5pCw2wmtN9RAbkiE+sSbooaIsQ2OZz6CYw1JcCPo6KS0KTa77
         jo4ZCj29j08RVHLjoeQDa8PsVzq3GIbNU9FWn30K4Gbb3Wyh1bYZZkSdnqJ68DzOLZ8u
         /oofMYwiZ3Tm1gRcqU1fDgEbpPYx7DRhz2pJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785277324; x=1785882124;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PnAKHqrN0T8ya1Ewwi3FHRCPIc2yNoCL0REgkoh7WFc=;
        b=P7bItzBYvZzS4rgRpHqe51LA9/F0kCIPx8vx/rehQMP1Qk3rk7AaIKdNFXPxX56Mgt
         n2eQ23Tay5VcJQRruWjAIJyxK1Tl9o6TFV3TGAZ14/QLbjpa7SQr90EDW1cuVzTAjWMz
         SLECsAeunmPTmFpz4FSKJFjCL9OuzC8ttWjfuLF/YvkpIfrHybfJEeCJEVNwDYqmPdeA
         xuFBhH2bQDfJsocpf/RfjmaFp7xDpkJ4gPIUdEmU4Z+1uvEtREaDez1Iw2Q9BeTsercH
         K79cVSE9ANWWV03B/oweNgqMQlUrgAhxLOjiTXsvRNqPWZXGqeVhDQ329Xm9jIH9BkV2
         /zHw==
X-Gm-Message-State: AOJu0YwZgYFio7wAFJSfQGgoQSzjJnOi8908l6pZ4XiyAGdvDoXC7yc2
	ouWA8PSGLAT9ENBXjJz096Nms/yPDrebLIUjgxNwfDwd0gfNRFngz2RvFmGVX+keHS/Cyg9Wnih
	ohldGAp4=
X-Gm-Gg: AR+sD10u8U5pZiYRTRcLIeaXm5x0J9zY2yUbRSx50ShTyso2DpmmX9a40VhQVqAV09R
	5lsSHgMquXw7ju2k0jOmlkhYf2ey5LH27hwMlAi2hZsTTNRG40mq3bgsJXGvs/q+s2RPzXkZaQe
	V20lHsj09hhleKI7pCuvKiJvddJ0YWPQ0T9mbPVSdGZ03zbhN+TgH+cSU8cVb8ecbDu/ZDJP0G7
	yf999iM1VH+/dpIYyuVw/aqW9zjxt1GgLnt9vvAdNCRq+Wvv1iXAWdRBw32fzDlYU7Jse0U6GR6
	QAnbkgAPCc9Py47uxP8Hj4R076V2sMAMXCQSQxlc1eo1pIjoopozzXJJnoQhRHbYUlTzVmZPlTN
	IEZIPQZbJd3GH3i8qRsoBqDLRpShwmv1IPY9u5olnz9k542FDT6DCxKoUOA4MGppW7ocq4KqWPV
	UwqvyK3xnv7puZuar9hJ+6jjWM4CHbacO9aXQXZwSWILs67DGokDWRtpStGAjiSvnEIMSudJ52u
	Yf4Q4BKpYCZprrK8RdtTbwR7B0YthuXjxeQRvHI9l5sCoccCTXWiY5tPaYovS0k
X-Received: by 2002:a05:600c:1f8c:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-496c642c7e2mr49745415e9.11.1785277323851;
        Tue, 28 Jul 2026 15:22:03 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd6da4asm7669405e9.1.2026.07.28.15.22.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:22:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/19] libsolv: Fix CVE-2026-9149
Date: Wed, 29 Jul 2026 00:21:36 +0200
Message-ID: <6c39677193adf777b9abe22859842ec692bebdc3.1785277157.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785277157.git.yoann.congal@smile.fr>
References: <cover.1785277157.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 22:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242204

From: Shubham Pushpkar <spushpka@cisco.com>

This patch applies the upstream fix as referenced in [1], using the CVE advisory shown in [2].
[1] https://github.com/openSUSE/libsolv/commit/210386037c892a720972ad35a3d8f7073b4d763b
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-9149

Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
(cherry picked from commit d3fc48836349e81369f5680d808d2e469fce626a)
Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libsolv/libsolv/CVE-2026-9149.patch       | 152 ++++++++++++++++++
 .../libsolv/libsolv_0.7.28.bb                 |   1 +
 2 files changed, 153 insertions(+)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/CVE-2026-9149.patch

diff --git a/meta/recipes-extended/libsolv/libsolv/CVE-2026-9149.patch b/meta/recipes-extended/libsolv/libsolv/CVE-2026-9149.patch
new file mode 100644
index 00000000000..11acf758b58
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/CVE-2026-9149.patch
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
index 63534dce260..4ad8a20e2f4 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.28.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.28.bb
@@ -11,6 +11,7 @@ DEPENDS = "expat zlib zstd"
 SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
            file://CVE-2026-9150.patch \
+           file://CVE-2026-9149.patch \
 "
 
 SRCREV = "c8dbb3a77c86600ce09d4f80a504cf4e78a3c359"

