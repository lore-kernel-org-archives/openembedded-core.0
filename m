Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id C1CEB7D8DE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 May 2019 22:10:21 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id e28so459177wra.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2019 15:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6c0Fa0IypUNZakpU6prIhig9LaPek68S6jZV01KKUxY=;
	b=EVDUCxaxKej2v7lk/cyJQRsspgatjKAMuC5FGbY1GTDCt5a55pXjIXw/NRPGFsR+Q8
	hNpHUHe3cWl5Cx/Y4HQzwXosA0bwKO7dyj+ADuuOFFhAxua+s4RF/4wqA/w4oh/dlMSB
	akhnRI1H912yTzVR2ZPWi8R/JSrbrE9UBwXHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6c0Fa0IypUNZakpU6prIhig9LaPek68S6jZV01KKUxY=;
	b=PTcVqE0aBfjlhJSlbzLllt8bpDmQuH2QJ+3WgRnIRvgd0iWJ3ir5z0hkG8YsVMpLGj
	Y7fTsZ0Jk5+8eEYQvGF6Kj4bIMlY0rxc8/eg2JPjjDIK3X0GNYBqEu2CP7RAof3VwS7w
	GE5uAJF5Ld95tWtJngWPM2ECKEGQ0JmmKt1CEnNZKbnCj355PMLuHI94pqYni6Oh4y56
	gG5W7Xg2Zv1LvLqB+ysfygZKnO92KWC1DkW3Fiort0EBczmetFspTA+9D2foLRoyx6RM
	045wC+pP+Fcn3ywfEzbxC335U6GwPbWcd4ASmHHdJvYBndKHa1+hsJITyahqBPEEpdM6
	hpfQ==
X-Gm-Message-State: APjAAAV9NDz1ltCB9y4H4jIkKZW69+u9u0YoftsT6R0oJ2d78x65Fjtv
	TxCPOzLFjroihHBszqXn/CiXHqEDzHw=
X-Google-Smtp-Source: APXvYqwiNcy81TiShoo9liK/CgraIedkfwexNqDCN/7BzG49dn9aVQwNb1EzinDraKJ6HY/+JNQB3w==
X-Received: by 2002:adf:b611:: with SMTP id f17mr282581wre.162.1556748622116; 
	Wed, 01 May 2019 15:10:22 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c63sm9497720wma.29.2019.05.01.15.10.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 15:10:21 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 May 2019 23:10:20 +0100
Message-Id: <20190501221020.26623-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] elfutils: Fix ptest compile failures on musl
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
X-List-Received-Date: Wed, 01 May 2019 22:10:22 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../elfutils/elfutils_0.176.bb                |  1 +
 ...-err-variable-and-function-conflicts.patch | 43 ++++++++++++++++---
 .../elfutils/files/musl.patch                 | 29 +++++++++++++
 3 files changed, 66 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/elfutils/files/musl.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.176.bb b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
index 19d27cd992a..157551e6af9 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
@@ -31,6 +31,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-skip-the-test-when-gcc-not-deployed.patch \
            file://run-ptest \
            file://ptest.patch \
+           file://musl.patch \
            "
 SRC_URI_append_libc-musl = " file://0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch \
                              file://0001-fix-err-variable-and-function-conflicts.patch \
diff --git a/meta/recipes-devtools/elfutils/files/0001-fix-err-variable-and-function-conflicts.patch b/meta/recipes-devtools/elfutils/files/0001-fix-err-variable-and-function-conflicts.patch
index 4cf54008b79..433db133b25 100644
--- a/meta/recipes-devtools/elfutils/files/0001-fix-err-variable-and-function-conflicts.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-fix-err-variable-and-function-conflicts.patch
@@ -39,10 +39,10 @@ Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
  tests/dwfl-proc-attach.c | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
-diff --git a/tests/dwfl-proc-attach.c b/tests/dwfl-proc-attach.c
-index 102ba18..ad4208e 100644
---- a/tests/dwfl-proc-attach.c
-+++ b/tests/dwfl-proc-attach.c
+Index: elfutils-0.176/tests/dwfl-proc-attach.c
+===================================================================
+--- elfutils-0.176.orig/tests/dwfl-proc-attach.c
++++ elfutils-0.176/tests/dwfl-proc-attach.c
 @@ -76,10 +76,10 @@ main (int argc __attribute__ ((unused)),
        char **argv __attribute__ ((unused)))
  {
@@ -57,6 +57,35 @@ index 102ba18..ad4208e 100644
      error (-1, err, "Couldn't create thread2");
  
    Dwfl *dwfl = dwfl_begin (&proc_callbacks);
--- 
-2.7.4
-
+Index: elfutils-0.176/tests/backtrace.c
+===================================================================
+--- elfutils-0.176.orig/tests/backtrace.c
++++ elfutils-0.176/tests/backtrace.c
+@@ -219,23 +219,23 @@ dump (Dwfl *dwfl)
+ {
+   ptrdiff_t ptrdiff = dwfl_getmodules (dwfl, dump_modules, NULL, 0);
+   assert (ptrdiff == 0);
+-  bool err = false;
++  bool err1 = false;
+   switch (dwfl_getthreads (dwfl, thread_callback, NULL))
+     {
+     case 0:
+       break;
+     case DWARF_CB_ABORT:
+-      err = true;
++      err1 = true;
+       break;
+     case -1:
+       error (0, 0, "dwfl_getthreads: %s", dwfl_errmsg (-1));
+-      err = true;
++      err1 = true;
+       break;
+     default:
+       abort ();
+     }
+   callback_verify (0, 0, 0, NULL, dwfl);
+-  if (err)
++  if (err1)
+     exit (EXIT_FAILURE);
+ }
+ 
diff --git a/meta/recipes-devtools/elfutils/files/musl.patch b/meta/recipes-devtools/elfutils/files/musl.patch
new file mode 100644
index 00000000000..be35791b1af
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/musl.patch
@@ -0,0 +1,29 @@
+Fix error on musl:
+
+| ../../elfutils-0.176/tests/elfstrmerge.c: In function 'main':
+| ../../elfutils-0.176/tests/elfstrmerge.c:370:60: error: 'ALLPERMS' undeclared (first use in this function); did you mean 'EPERM'?
+|        fdnew = open (fnew, O_WRONLY | O_CREAT, st.st_mode & ALLPERMS);
+|                                                             ^~~~~~~~
+|                                                             EPERM
+| ../../elfutils-0.176/tests/elfstrmerge.c:370:60: note: each undeclared identifier is reported only once for each function it appears in
+
+Upstream-Status: Inappropriate [workaround in musl]
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: elfutils-0.176/tests/elfstrmerge.c
+===================================================================
+--- elfutils-0.176.orig/tests/elfstrmerge.c
++++ elfutils-0.176/tests/elfstrmerge.c
+@@ -33,6 +33,11 @@
+ #include ELFUTILS_HEADER(dwelf)
+ #include "elf-knowledge.h"
+ 
++/* for musl */
++#ifndef ALLPERMS
++# define ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO)/* 07777 */
++#endif
++
+ /* The original ELF file.  */
+ static int fd = -1;
+ static Elf *elf = NULL;
-- 
2.20.1


