Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64797C4829B
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 19:15:03 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.23471.1706987695991733088
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 11:14:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jZ+X3Ih9;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2954b34ddd0so2657724a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 11:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706987695; x=1707592495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JsI/gvfVMajkTouMFweTXpqbzlizrNjyGZqKRKUtgY8=;
        b=jZ+X3Ih9C/Bq6Jr70y0YkRmH0DCSLUQBXrXQ9Tmr7fhv0Dk85XLOLVQde1dmwdDuC9
         OPbPjpbWYW4mD8QEsULhg0IulQXbOGdgdMNhsRChPRtL6dxLwagMxuNPik9pFbzHEwG3
         fZZ4rwAsGaUGH2jWGqyCo53XpEh5NLCnOkiSdcXaXH+fqXB9v+aFOeRqbIP3qGXfqytB
         i4eAno3YpN+RYx3In88aAMdqSp0/rYhCZxWTjl84YZr7SbVDBOsPogLVlOkQtoyS55sI
         YszQBoBJ0kP81EO+znj9JXxnWyizjUTZ78B0SHq+2ZgIuzDbXED5sjrgxhuDRFQ3B6Z/
         B8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706987695; x=1707592495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JsI/gvfVMajkTouMFweTXpqbzlizrNjyGZqKRKUtgY8=;
        b=nG8fTlJLcBSCWSY8QERwBIs+9d7bnZGrcYNSsl4LmRveJKz7QsQ2lSem/rgV/AATvy
         lkv0Ruo/KVjPtM4foySmg7PBWSxdauSU8wG42PMB/vseFm0JcOhdA+2gUXLAPy/7xOZt
         EpTIu0q88RfLorYJqpqQVyP5e9YisyVMSjHD9W+587QEUZjonwf3DdUA0K1zgBhjE0j7
         CM/s3vowf2JevkrDQpSQ2R+RX5bYLWT3yAC1c24e+7nY62crXmemKydoYdcVlHgXDd1G
         klw7l4clvh6UyYn69oZkWA9qA2+gxa9XgNtuh+HyzTNAejBqtHN26t3LafXXJFLcJqqq
         0zpA==
X-Gm-Message-State: AOJu0Yxgm8u+uNiOSn6zOEafp5LRybXjRmXTC1oL8o+v8PZgywFCLUH3
	P3C3r/JPNBUqHE35OIosCZaq57wVEneD+8iIt+up0ez/KGj8WnPd7ZnJNq3pUu4aV9JaxStYyCy
	MbVI=
X-Google-Smtp-Source: AGHT+IFRL7VJLM+yzIpc37I4h6j4z45NnxMQSi3ezBHDiXqQdIzsVkNEo0MELt2OA+UxNi7FPlsqyA==
X-Received: by 2002:a17:90a:7563:b0:296:3480:c785 with SMTP id q90-20020a17090a756300b002963480c785mr5510390pjk.35.1706987694640;
        Sat, 03 Feb 2024 11:14:54 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id w63-20020a17090a6bc500b00296443780d7sm2376863pjj.47.2024.02.03.11.14.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 11:14:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 03/15] aspell: upgrade 0.60.8 -> 0.60.8.1
Date: Sat,  3 Feb 2024 09:14:30 -1000
Message-Id: <1d7ab8b0bc129efadd9144b87fa5208b4a8fcd6c.1706987549.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706987549.git.steve@sakoman.com>
References: <cover.1706987549.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 19:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194847

From: Wang Mingyu <wangmy@fujitsu.com>

CVE-2019-25051.patch
removed since it's included in 0.60.8.1

Changelog:
============
-Fix memory leak in suggestion code introduced in 0.60.8.
-Various documentation fixes.
-Fix various warnings when compiling with -Wall.
-Fix two buffer overflows found by Google's OSS-Fuzz.
-Other minor updates.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ec3c8642f71b470936b6dd29331afa467ab865c7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...pell_0.60.8.bbappend => aspell_%.bbappend} |   0
 .../{aspell_0.60.8.bb => aspell_0.60.8.1.bb}  |   7 +-
 .../aspell/files/CVE-2019-25051.patch         | 101 ------------------
 3 files changed, 2 insertions(+), 106 deletions(-)
 rename meta-selftest/recipes-test/aspell/{aspell_0.60.8.bbappend => aspell_%.bbappend} (100%)
 rename meta/recipes-support/aspell/{aspell_0.60.8.bb => aspell_0.60.8.1.bb} (83%)
 delete mode 100644 meta/recipes-support/aspell/files/CVE-2019-25051.patch

diff --git a/meta-selftest/recipes-test/aspell/aspell_0.60.8.bbappend b/meta-selftest/recipes-test/aspell/aspell_%.bbappend
similarity index 100%
rename from meta-selftest/recipes-test/aspell/aspell_0.60.8.bbappend
rename to meta-selftest/recipes-test/aspell/aspell_%.bbappend
diff --git a/meta/recipes-support/aspell/aspell_0.60.8.bb b/meta/recipes-support/aspell/aspell_0.60.8.1.bb
similarity index 83%
rename from meta/recipes-support/aspell/aspell_0.60.8.bb
rename to meta/recipes-support/aspell/aspell_0.60.8.1.bb
index 39b55f4ff2..0ea9b063e0 100644
--- a/meta/recipes-support/aspell/aspell_0.60.8.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.8.1.bb
@@ -13,11 +13,8 @@ HOMEPAGE = "http://aspell.net/"
 LICENSE = "LGPL-2.0-only | LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz \
-           file://CVE-2019-25051.patch \
-"
-SRC_URI[md5sum] = "012fa9209203ae4e5a61c2a668fd10e3"
-SRC_URI[sha256sum] = "f9b77e515334a751b2e60daab5db23499e26c9209f5e7b7443b05235ad0226f2"
+SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
+SRC_URI[sha256sum] = "d6da12b34d42d457fa604e435ad484a74b2effcd120ff40acd6bb3fb2887d21b"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses"
diff --git a/meta/recipes-support/aspell/files/CVE-2019-25051.patch b/meta/recipes-support/aspell/files/CVE-2019-25051.patch
deleted file mode 100644
index 8513f6de79..0000000000
--- a/meta/recipes-support/aspell/files/CVE-2019-25051.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 0718b375425aad8e54e1150313b862e4c6fd324a Mon Sep 17 00:00:00 2001
-From: Kevin Atkinson <kevina@gnu.org>
-Date: Sat, 21 Dec 2019 20:32:47 +0000
-Subject: [PATCH] objstack: assert that the alloc size will fit within a chunk
- to prevent a buffer overflow
-
-Bug found using OSS-Fuze.
-
-Upstream-Status: Backport
-[https://github.com/gnuaspell/aspell/commit/0718b375425aad8e54e1150313b862e4c6fd324a]
-CVE: CVE-2019-25051
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
----
- common/objstack.hpp | 18 ++++++++++++++----
- 1 file changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/common/objstack.hpp b/common/objstack.hpp
-index 3997bf7..bd97ccd 100644
---- a/common/objstack.hpp
-+++ b/common/objstack.hpp
-@@ -5,6 +5,7 @@
- #include "parm_string.hpp"
- #include <stdlib.h>
- #include <assert.h>
-+#include <stddef.h>
- 
- namespace acommon {
- 
-@@ -26,6 +27,12 @@ class ObjStack
-   byte * temp_end;
-   void setup_chunk();
-   void new_chunk();
-+  bool will_overflow(size_t sz) const {
-+    return offsetof(Node,data) + sz > chunk_size;
-+  }
-+  void check_size(size_t sz) {
-+    assert(!will_overflow(sz));
-+  }
- 
-   ObjStack(const ObjStack &);
-   void operator=(const ObjStack &);
-@@ -56,7 +63,7 @@ class ObjStack
-   void * alloc_bottom(size_t size)  {
-     byte * tmp = bottom;
-     bottom += size;
--    if (bottom > top) {new_chunk(); tmp = bottom; bottom += size;}
-+    if (bottom > top) {check_size(size); new_chunk(); tmp = bottom; bottom += size;}
-     return tmp;
-   }
-   // This alloc_bottom will insure that the object is aligned based on the
-@@ -66,7 +73,7 @@ class ObjStack
-     align_bottom(align);
-     byte * tmp = bottom;
-     bottom += size;
--    if (bottom > top) {new_chunk(); goto loop;}
-+    if (bottom > top) {check_size(size); new_chunk(); goto loop;}
-     return tmp;
-   }
-   char * dup_bottom(ParmString str) {
-@@ -79,7 +86,7 @@ class ObjStack
-   // always be aligned as such.
-   void * alloc_top(size_t size) {
-     top -= size;
--    if (top < bottom) {new_chunk(); top -= size;}
-+    if (top < bottom) {check_size(size); new_chunk(); top -= size;}
-     return top;
-   }
-   // This alloc_top will insure that the object is aligned based on
-@@ -88,7 +95,7 @@ class ObjStack
-   {loop:
-     top -= size;
-     align_top(align);
--    if (top < bottom) {new_chunk(); goto loop;}
-+    if (top < bottom) {check_size(size); new_chunk(); goto loop;}
-     return top;
-   }
-   char * dup_top(ParmString str) {
-@@ -117,6 +124,7 @@ class ObjStack
-   void * alloc_temp(size_t size) {
-     temp_end = bottom + size;
-     if (temp_end > top) {
-+      check_size(size);
-       new_chunk();
-       temp_end = bottom + size;
-     }
-@@ -131,6 +139,7 @@ class ObjStack
-     } else {
-       size_t s = temp_end - bottom;
-       byte * p = bottom;
-+      check_size(size);
-       new_chunk();
-       memcpy(bottom, p, s);
-       temp_end = bottom + size;
-@@ -150,6 +159,7 @@ class ObjStack
-     } else {
-       size_t s = temp_end - bottom;
-       byte * p = bottom;
-+      check_size(size);
-       new_chunk();
-       memcpy(bottom, p, s);
-       temp_end = bottom + size;
-- 
2.34.1


