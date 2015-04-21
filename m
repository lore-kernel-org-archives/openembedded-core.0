Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id AAD006E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 10:53:38 +0000 (UTC)
Received: by wgsk9 with SMTP id k9so208662423wgs.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 03:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ZkFEiDEk0vQ+cN7fo7nRPNFEot64binwhn5/IZpsCiM=;
	b=PZkZKVeHTAPJAgxQW11bdyVSQelD0v9xk3097EChLZcipA5BLA7nMB8O5lJuhOxj+L
	C2hfxlxHYKBH+Ng+j0giaH29Wshz+7JU47YaA08SEl1KtjrXiOElcVJx8Jn8WLmFoTJ9
	fDoZ+jxwsaXxthD50RjL54exrT/S9jdaOUgt6/PQPLlY24CURt1ZzwJPCRA4zffsuHlf
	FIBb8wwwuSZ5nVjrx8OCzTScOuGgPVh6sCqnCw0Xk71rYnC8CbB4w3VfRxZTId5t1mGX
	TjeNO2cYCEcyYc/5aAqO7sLEnuIlwQY+JWkgyw9x1tBShNcB1QWaFvgFkwqUZsabvQFM
	LrIg==
X-Received: by 10.180.73.198 with SMTP id n6mr34374899wiv.3.1429613619674;
	Tue, 21 Apr 2015 03:53:39 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id bx3sm2076258wjc.21.2015.04.21.03.53.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Apr 2015 03:53:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2015 12:53:37 +0200
Message-Id: <1429613620-2989-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [fido][PATCH 1/4] elfutils: fix build with -Os
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Apr 2015 10:53:40 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...m-Silence-Werror-maybe-uninitialized-fals.patch | 35 ++++++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.161.bb   |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.161/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.161/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch b/meta/recipes-devtools/elfutils/elfutils-0.161/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
new file mode 100644
index 0000000..3754c1c
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.161/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
@@ -0,0 +1,35 @@
+From 668accf322fd7185e273bfd50b84320e71d9de5a Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 10 Apr 2015 00:29:18 +0200
+Subject: [PATCH] elf_getarsym: Silence -Werror=maybe-uninitialized false
+ positive
+
+Upstream-Status: Pending
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ libelf/elf_getarsym.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/libelf/elf_getarsym.c b/libelf/elf_getarsym.c
+index d0bb28a..08954d2 100644
+--- a/libelf/elf_getarsym.c
++++ b/libelf/elf_getarsym.c
+@@ -165,8 +165,13 @@ elf_getarsym (elf, ptr)
+       int w = index64_p ? 8 : 4;
+ 
+       /* We have an archive.  The first word in there is the number of
+-	 entries in the table.  */
+-      uint64_t n;
++	 entries in the table.
++	 Set to SIZE_MAX just to silence -Werror=maybe-uninitialized
++	 elf_getarsym.c:290:9: error: 'n' may be used uninitialized in this function
++	 The read_number_entries function doesn't initialize n only when returning
++	 -1 which in turn ensures to jump over usage of this uninitialized variable.
++	 */
++      uint64_t n = SIZE_MAX;
+       size_t off = elf->start_offset + SARMAG + sizeof (struct ar_hdr);
+       if (read_number_entries (&n, elf, &off, index64_p) < 0)
+ 	{
+-- 
+2.3.5
+
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.161.bb b/meta/recipes-devtools/elfutils/elfutils_0.161.bb
index a3c1f36..d8c27f5 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.161.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.161.bb
@@ -15,6 +15,7 @@ SRC_URI += "\
         file://dso-link-change.patch \
         file://Fix_elf_cvt_gunhash.patch \
         file://fixheadercheck.patch \
+        file://0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch \
 "
 
 # pick the patch from debian
-- 
2.3.5


