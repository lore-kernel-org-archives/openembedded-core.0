Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F53CC4450C
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:08 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.140026.1783291380554380149
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=i0tcMtOa;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493d1e8aa46so10713705e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291379; x=1783896179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rISr30Fl96h6/PycNPojAQLWCTS68LQ3lk64oYnw4EM=;
        b=i0tcMtOaXeBtjUgypYfYWO+cjgOdGexK5E8FsCwhvxvqJfgyadaOKh9G6HSKbjH10O
         eLLBhSYr5BaxFb4nwWdNs7TY1zYtUiDCZzsFSSs2jO+QWAV/gjv34j+eJeP4Qi18RnSz
         USQp4f65P+tgQAPAWQPSJBXQhPyiLQTaAv+as=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291379; x=1783896179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rISr30Fl96h6/PycNPojAQLWCTS68LQ3lk64oYnw4EM=;
        b=WgH3DzpzJbCitcIWA3L6y2vFZVgbYsmIlSH2kcUNJGKbp1br25ng5DNNWkPGeUrOds
         7PqOzXWBOVdoZbZUqfivRZw3wbEw1zM14ATYytuesCSIbj3IRbdzw57JggrMhGdAeaqG
         mwPbNN7peiZIvWAMwBaVJBnCngfi6jTeUWrFg2kJYR466JUxgo4lGdaaQ0ePgodz/DcS
         tI0KitGvY7kuQJp6DPBUKsVkAPBaTR2jWDOefv7aVf5itDEh1lJyoeOY4GevTHjjAnKa
         xYSWqKIqSIyxxqTMs/t5IVXVuZvVKR/T04Z3GvnC8oyPbVLBmRMmUtNV4XmdTmSnOntK
         MSPA==
X-Gm-Message-State: AOJu0YztnaW4ak6/p7cI1eFNwBHgEoFs4N/TE5MW3pjrROnPu1AaWh6v
	mcS0WnZR6+WBvPZarDSu4eCWMRifE/oitk/fqfr78YmZ51S4j1iwatyd2W9jtue8u/9moGi3Xnn
	tczP5hUI=
X-Gm-Gg: AfdE7cnXNSlj8YZXe3PRGmvbB0MiRHsJhuhhrlGg9NeufhmK8L/JoajdAZtV/BJlGAr
	4UCQ/msisD7tS+DM2R99CSybv5pofqwcrRuOatTO/ha4PSXRz7qGsG9GQ9NL8xcos/FbnIpMd+W
	9KM9MfBssdII6JRIXZ4FzdqeXvkd1HoF2uAMVRxVp6egUmmnwvClDmw8x53bbQbWvBmkbAhemBb
	w/kVb61A5vnRZdPN/HMme63TdgKtUgibKeOFKwJj0rebnPu2BEFbKjjnGbuFCij9Dy0eh7SFMSF
	2xOil8e1TTw+rxwCyPZBPsZ5scJvVMC0HcizeTzoyl7tA9SmW4fCjJ6YnRNLzVmsmjbDyIn4Ns+
	ueomQZGEmouaIA089f/OywWwmoNONhgSeHK5SLYnhdKRehKKs2tevPSFzME5hJRQ44vFT+viSmj
	4PGCOzznkA/X7nT+Q6v8sKka7xCg==
X-Received: by 2002:a05:600c:3493:b0:493:d115:d835 with SMTP id 5b1f17b1804b1-493d22abbd8mr80367425e9.8.1783291378669;
        Sun, 05 Jul 2026 15:42:58 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.42.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:42:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 27/55] libsolv: Fix CVE-2026-9149
Date: Mon,  6 Jul 2026 00:41:17 +0200
Message-ID: <e182a3ccad90bd055430f4e89a2c7f1587452a2f.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240181

From: Shubham Pushpkar <spushpka@cisco.com>

This patch applies the upstream fix as referenced in [1], using the CVE advisory shown in [2].
[1] https://github.com/openSUSE/libsolv/commit/210386037c892a720972ad35a3d8f7073b4d763b
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-9149

Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libsolv/libsolv/CVE-2026-9149.patch       | 152 ++++++++++++++++++
 .../libsolv/libsolv_0.7.36.bb                 |   1 +
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
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.36.bb b/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
index f3c3738d7c1..cca2511ea57 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;ta
            file://0001-compress_buf-fix-musl-segfaults.patch \
            file://run-ptest \
            file://CVE-2026-9150.patch \
+           file://CVE-2026-9149.patch \
 "
 
 SRCREV = "1e377699be108ec82bb798ec9c223d45d84a733c"

