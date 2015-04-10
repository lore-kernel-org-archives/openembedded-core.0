Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id F06DC73D0B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 10:18:24 +0000 (UTC)
Received: by wgin8 with SMTP id n8so13101575wgi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 03:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ZkFEiDEk0vQ+cN7fo7nRPNFEot64binwhn5/IZpsCiM=;
	b=n9jhTkfqGZNNeRdRUP8w4TzCxgsKLStUlafepLLMa7Y7CUSLk6QMZYh1bDFP/DJXDN
	QENPXW+9henCDTOTyCuIqulc1VF0vtqdxuK3MSyz9537SB1viq3hvo+Ew5+C3McOGYOX
	8awdAjFk2ItiSrZI5qDcw2WO9zANz+T6oDBK84YHRQMj2Cn3+4lS4NJ3vMPLcm6EQODN
	SsKUtQNMxyVRRJEjyZIXK4etwhqmIzGV4nTMY2a7dxk17i0e6pJOkI6lGN9DPnzMK8VM
	2B4gIUIjLbCMG4HJeCF6zDvX2M1QZl8aoYroC/7wr+ANyx41rJgz0ZCJFMJ5tOL4piR2
	rRWg==
X-Received: by 10.194.123.67 with SMTP id ly3mr1644612wjb.105.1428661105249;
	Fri, 10 Apr 2015 03:18:25 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id l10sm2255183wje.15.2015.04.10.03.18.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Apr 2015 03:18:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2015 12:18:28 +0200
Message-Id: <1428661108-7670-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH] elfutils: fix build with -Os
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
X-List-Received-Date: Fri, 10 Apr 2015 10:18:25 -0000

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


