Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E712C43602
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:12 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155282.1783358229042771981
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rVpz0KnA;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-476a130c138so3424991f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358227; x=1783963027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQ2Y5vZc8BNIC9VJv6t3OST+wQLvPAhrEqkCAThN4HQ=;
        b=rVpz0KnAf9OKGNo6IdNq7jkPuTQlOaLLfvPAhBqJH6C690oPJK/Tdx6FsI8lo4xdK0
         zme7SsI22d79s5je56KtUWqzTCmAUuYJVQylJqOBIB0678OY7FxOmzI6mAxwRBcdNpMu
         0e+KXIy6La8+4BMUF1lrVZLlL6gpOsFN+MyT80dlwoiTD6zcsMwqp+1eOWLfALHL2tDn
         6tGuuPspwrVmY/c2tmINyJrI4dhi630gdU5A6ut1tVEWjfKpxaKreps/teOouIZHPAtx
         w57o/33rNqlcin809GoOVLKbd33f5lH6Sm4XN70eKaANYF47kmb/Dp/2IHvVgl4RGf0E
         GjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358227; x=1783963027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQ2Y5vZc8BNIC9VJv6t3OST+wQLvPAhrEqkCAThN4HQ=;
        b=gzSpCH1xnLitpn450U0pH1X14cqasFZJAcLXHX0CBvAxw/AKnRQmQ1ua6rKEksbqwj
         bYRiWbXm7vVtKcSVV4/bhRAgqITg8e5YE+pyN+zk+3p0mcCI2X2VRDB4AWfo1Fw1E/wC
         LXoQpp2ciZTd20NREzbcX1xjuQYDm4xnmAqQUSMRxlnZi46fkhg2MMvkru6S9NVAh7tI
         r7RPBm+FcMZt0Xob+gxUsfHYBLTjvSPkjCX8kmcB9ZR/NPj3T0CRw0ZdBg5hT1CSE/+Q
         g7rwrUnMZRtJ/N59b2pMfiT8zmcQ3m0WheJvdC+HSoFbninBnCgeZSXOh7aHGhT5Biiu
         u6NQ==
X-Gm-Message-State: AOJu0YyoLS8YPuuo0+wOWSBbcbLRtRtlcy3lnQu9qhZ8aHT66ryNUsmx
	ZWlSxj1jme6fsvbkw06S3H3a/QosFfsRPpt0KnZ4u100Cy3pnDfHUOtchhboQw==
X-Gm-Gg: AfdE7ck0E3ENYmwjz+9qh9eNXnmgLrlMYtnTr12CSIyt26adj6BD0Zt+IE+Ldi0yhk0
	PkcXKhClMSYmhunJ51FBLeVHr2TC0I+sAnhetS3pvCyIjyNAyFxSmUGVct2eWgFFnfXzYuGsfd1
	Bebwl9HX2XUIg/BvXcan6IT9w9tqGFAsvwMjs5zMRXOVZV7lFVAG6dkr5OsjDhKn0CzEs06TEjZ
	4/8Xqd3CUpOwOot9gZXMlbGWDg7cUXlxT8AAATvdM0zMsNaxmji+uR3YVz/lCRrbZ3ZbXs0J2BB
	Gum+XUVRNtCrT7aWnpA711gVeMDPVjE8jYikTu7vLUnwaEiwErkj3su2pmBZh6UspYh7Z22Hb9C
	YC2+Cozej1RwssTAKFcs2JzMnS+AA3EVMdat+weOL7OISeHMZL5nb6j6uUbK5gOMQ45KZnF5Wi/
	l0M6fXwFxlpADLn2vhfWqavvcuro+LDm9xIeTdu5snpEHeQutH
X-Received: by 2002:a05:600c:83cf:b0:492:490b:a604 with SMTP id 5b1f17b1804b1-493df090d52mr14574545e9.37.1783358227124;
        Mon, 06 Jul 2026 10:17:07 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/45] acl: upgrade 2.3.2 -> 2.4.0
Date: Mon,  6 Jul 2026 19:16:17 +0200
Message-ID: <20260706171701.70536-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240289

From: Alexander Kanavin <alex@linutronix.de>

Backport a patch to tar to avoid name clashes.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...0001-Avoid-acl_-prefix-for-functions.patch | 90 +++++++++++++++++++
 meta/recipes-extended/tar/tar_1.35.bb         | 22 ++---
 ...t_uid-fix-memory-wasting-loop-if-use.patch | 49 ----------
 ...isc.test-Don-t-mix-stdout-and-stderr.patch | 35 --------
 .../attr/{acl_2.3.2.bb => acl_2.4.0.bb}       |  4 +-
 5 files changed, 102 insertions(+), 98 deletions(-)
 create mode 100644 meta/recipes-extended/tar/tar/0001-Avoid-acl_-prefix-for-functions.patch
 delete mode 100644 meta/recipes-support/attr/acl/0001-libmisc-__acl_get_uid-fix-memory-wasting-loop-if-use.patch
 delete mode 100644 meta/recipes-support/attr/acl/0001-test-misc.test-Don-t-mix-stdout-and-stderr.patch
 rename meta/recipes-support/attr/{acl_2.3.2.bb => acl_2.4.0.bb} (90%)

diff --git a/meta/recipes-extended/tar/tar/0001-Avoid-acl_-prefix-for-functions.patch b/meta/recipes-extended/tar/tar/0001-Avoid-acl_-prefix-for-functions.patch
new file mode 100644
index 0000000000..a736d5f229
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/0001-Avoid-acl_-prefix-for-functions.patch
@@ -0,0 +1,90 @@
+From 78a6e620515a0ca7e3481a9d8277225c800262a7 Mon Sep 17 00:00:00 2001
+From: Pavel Cahyna <pcahyna@redhat.com>
+Date: Wed, 24 Jun 2026 18:45:30 +0200
+Subject: [PATCH] Avoid acl_ prefix for functions
+
+The acl.h header from libacl uses acl_ prefix for its functions. Avoid
+defining functions with the same name in order to protect its namespace.
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/tar.git/commit/?id=08c3fc2e9337094aff01a511170fd35fdb8f1ee3]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/xattrs.c | 26 +++++++++++++-------------
+ 1 file changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/src/xattrs.c b/src/xattrs.c
+index 86a7e59..bf2c4f0 100644
+--- a/src/xattrs.c
++++ b/src/xattrs.c
+@@ -139,13 +139,13 @@ static struct
+ #ifdef HAVE_POSIX_ACLS
+ 
+ /* acl-at wrappers, TODO: move to gnulib in future? */
+-static acl_t acl_get_file_at (int, const char *, acl_type_t);
+-static int acl_set_file_at (int, const char *, acl_type_t, acl_t);
++static acl_t tar_acl_get_file_at (int, const char *, acl_type_t);
++static int tar_acl_set_file_at (int, const char *, acl_type_t, acl_t);
+ static int file_has_acl_at (int, char const *, struct stat const *);
+-static int acl_delete_def_file_at (int, char const *);
++static int tar_acl_delete_def_file_at (int, char const *);
+ 
+-/* acl_get_file_at */
+-#define AT_FUNC_NAME acl_get_file_at
++/* tar_acl_get_file_at */
++#define AT_FUNC_NAME tar_acl_get_file_at
+ #define AT_FUNC_RESULT acl_t
+ #define AT_FUNC_FAIL (acl_t)NULL
+ #define AT_FUNC_F1 acl_get_file
+@@ -159,8 +159,8 @@ static int acl_delete_def_file_at (int, char const *);
+ #undef AT_FUNC_POST_FILE_PARAM_DECLS
+ #undef AT_FUNC_POST_FILE_ARGS
+ 
+-/* acl_set_file_at */
+-#define AT_FUNC_NAME acl_set_file_at
++/* tar_acl_set_file_at */
++#define AT_FUNC_NAME tar_acl_set_file_at
+ #define AT_FUNC_F1 acl_set_file
+ #define AT_FUNC_POST_FILE_PARAM_DECLS   , acl_type_t type, acl_t acl
+ #define AT_FUNC_POST_FILE_ARGS          , type, acl
+@@ -170,8 +170,8 @@ static int acl_delete_def_file_at (int, char const *);
+ #undef AT_FUNC_POST_FILE_PARAM_DECLS
+ #undef AT_FUNC_POST_FILE_ARGS
+ 
+-/* acl_delete_def_file_at */
+-#define AT_FUNC_NAME acl_delete_def_file_at
++/* tar_acl_delete_def_file_at */
++#define AT_FUNC_NAME tar_acl_delete_def_file_at
+ #define AT_FUNC_F1 acl_delete_def_file
+ #define AT_FUNC_POST_FILE_PARAM_DECLS
+ #define AT_FUNC_POST_FILE_ARGS
+@@ -299,7 +299,7 @@ xattrs__acls_set (struct tar_stat_info const *st,
+       /* No "default" IEEE 1003.1e ACL set for directory.  At this moment,
+          FILE_NAME may already have inherited default acls from parent
+          directory;  clean them up. */
+-      if (acl_delete_def_file_at (chdir_fd, file_name))
++      if (tar_acl_delete_def_file_at (chdir_fd, file_name))
+         WARNOPT (WARN_XATTR_WRITE,
+                 (0, errno,
+                  _("acl_delete_def_file_at: Cannot drop default POSIX ACLs "
+@@ -316,7 +316,7 @@ xattrs__acls_set (struct tar_stat_info const *st,
+       return;
+     }
+ 
+-  if (acl_set_file_at (chdir_fd, file_name, type, acl) == -1)
++  if (tar_acl_set_file_at (chdir_fd, file_name, type, acl) == -1)
+     /* warn even if filesystem does not support acls */
+     WARNOPT (WARN_XATTR_WRITE,
+ 	     (0, errno,
+@@ -357,10 +357,10 @@ acls_get_text (int parentfd, const char *file_name, acl_type_t type,
+   char *val = NULL;
+   acl_t acl;
+ 
+-  if (!(acl = acl_get_file_at (parentfd, file_name, type)))
++  if (!(acl = tar_acl_get_file_at (parentfd, file_name, type)))
+     {
+       if (errno != ENOTSUP)
+-        call_arg_warn ("acl_get_file_at", file_name);
++        call_arg_warn ("tar_acl_get_file_at", file_name);
+       return;
+     }
+ 
diff --git a/meta/recipes-extended/tar/tar_1.35.bb b/meta/recipes-extended/tar/tar_1.35.bb
index d15e7f8a4e..eb71863231 100644
--- a/meta/recipes-extended/tar/tar_1.35.bb
+++ b/meta/recipes-extended/tar/tar_1.35.bb
@@ -6,7 +6,17 @@ SECTION = "base"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
-SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2"
+SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
+           file://run-ptest \
+           file://0001-tests-fix-TESTSUITE_AT.patch \
+           file://0002-tests-check-for-recently-fixed-bug.patch \
+           file://0003-Exclude-VCS-directory-with-writing-from-an-archive.patch \
+           file://CVE-2026-5704-dependent_p1.patch \
+           file://CVE-2026-5704-dependent_p2.patch \
+           file://CVE-2026-5704.patch \
+           file://CVE-2026-5704-regression.patch \
+           file://0001-Avoid-acl_-prefix-for-functions.patch \
+           "
 
 SRC_URI[sha256sum] = "7edb8886a3dc69420a1446e1e2d061922b642f1cf632d2cd0f9ee7e690775985"
 
@@ -37,16 +47,6 @@ do_install:append:class-target() {
 }
 
 # add for ptest support
-SRC_URI += " \
-    file://run-ptest \
-    file://0001-tests-fix-TESTSUITE_AT.patch \
-    file://0002-tests-check-for-recently-fixed-bug.patch \
-    file://0003-Exclude-VCS-directory-with-writing-from-an-archive.patch \
-    file://CVE-2026-5704-dependent_p1.patch \
-    file://CVE-2026-5704-dependent_p2.patch \
-    file://CVE-2026-5704.patch \
-    file://CVE-2026-5704-regression.patch \
-"
 
 inherit ptest
 
diff --git a/meta/recipes-support/attr/acl/0001-libmisc-__acl_get_uid-fix-memory-wasting-loop-if-use.patch b/meta/recipes-support/attr/acl/0001-libmisc-__acl_get_uid-fix-memory-wasting-loop-if-use.patch
deleted file mode 100644
index 5052bdaa2f..0000000000
--- a/meta/recipes-support/attr/acl/0001-libmisc-__acl_get_uid-fix-memory-wasting-loop-if-use.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 56abe432b65801f31277fb9a3bca0f9e31502315 Mon Sep 17 00:00:00 2001
-From: Matthias Gerstner <matthias.gerstner@suse.de>
-Date: Thu, 25 Apr 2024 12:43:49 +0200
-Subject: [PATCH] libmisc: __acl_get_uid(): fix memory wasting loop if user
- does not exist
-
-I noticed that `acl_from_text()` unexpectedly returns ENOMEM for invalid
-user names. The reason for this is a missing break statement in the for
-loop in `__acl_get_uid()`, which causes the loop to act as if ERANGE was
-returned from `getpwnam_r()`, thereby exponentially increasing the
-buffer size to (in my case) multiple gigabytes, until `grow_buffer()`
-reports ENOMEM, which terminates the `__acl_get_uid()` function.
-
-This is a pretty costly "no such user" lookup that can disturb a
-process's heap memory management, but can also cause a process to fail
-e.g. if it is multithreaded and other threads encounter an ENOMEM,
-before `__acl_get_uid()` frees the gigantic heap buffer and returns.
-The allocated memory isn't actually used. Therefore on Linux it should
-not affect other processes by default, due to its overcommit memory
-and lazy memory allocation strategy.
-
-Fix this by properly terminating the for loop on any conditions except
-an ERANGE error being reported. The same break statement correctly
-exists in `__acl_get_gid()` already.
-
-Fixes: 3737f00 ("use thread-safe getpwnam_r and getgrnam_r")
-Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- libmisc/uid_gid_lookup.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libmisc/uid_gid_lookup.c b/libmisc/uid_gid_lookup.c
-index a4f21f6..74baab4 100644
---- a/libmisc/uid_gid_lookup.c
-+++ b/libmisc/uid_gid_lookup.c
-@@ -91,6 +91,7 @@ __acl_get_uid(const char *token, uid_t *uid_p)
- 		if (err == ERANGE)
- 			continue;
- 		errno = err ? err : EINVAL;
-+		break;
- 	}
- 	free(buffer);
- 	return result ? 0 : -1;
--- 
-2.43.0
-
diff --git a/meta/recipes-support/attr/acl/0001-test-misc.test-Don-t-mix-stdout-and-stderr.patch b/meta/recipes-support/attr/acl/0001-test-misc.test-Don-t-mix-stdout-and-stderr.patch
deleted file mode 100644
index 5aa3f3224c..0000000000
--- a/meta/recipes-support/attr/acl/0001-test-misc.test-Don-t-mix-stdout-and-stderr.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 47f8039ec9bd08b629775c8e788d11e41fa95f14 Mon Sep 17 00:00:00 2001
-From: Andreas Gruenbacher <agruenba@redhat.com>
-Date: Mon, 24 Mar 2025 21:14:09 +0100
-Subject: [PATCH] test/misc.test: Don't mix stdout and stderr
-
-In different environments, we may not get the stdout and stderr output
-in the order the run script expects, so check both separately.
-
-Fixes: https://savannah.nongnu.org/bugs/?66944
-Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- test/misc.test | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/test/misc.test b/test/misc.test
-index 06b3136..57c02e5 100644
---- a/test/misc.test
-+++ b/test/misc.test
-@@ -440,8 +440,9 @@ Dangling symlink test https://savannah.nongnu.org/bugs/?28131
- 	> other::r-x
- 	> 
- 	$ setfacl -R -m u:bin:rw d
--	$ getfacl -RL d
-+	$ getfacl -RL d > /dev/null
- 	> getfacl: d/b: No such file or directory
-+	$ getfacl -RL d 2> /dev/null
- 	> # file: d
- 	> # owner: %TUSER
- 	> # group: %TGROUP
--- 
-2.43.0
-
diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-support/attr/acl_2.4.0.bb
similarity index 90%
rename from meta/recipes-support/attr/acl_2.3.2.bb
rename to meta/recipes-support/attr/acl_2.4.0.bb
index a405cc2692..ef9ee492a0 100644
--- a/meta/recipes-support/attr/acl_2.3.2.bb
+++ b/meta/recipes-support/attr/acl_2.4.0.bb
@@ -16,11 +16,9 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=c781d70ed2b4d48995b790403217a249 \
 DEPENDS = "attr"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/acl/${BP}.tar.gz \
-           file://0001-libmisc-__acl_get_uid-fix-memory-wasting-loop-if-use.patch \
-           file://0001-test-misc.test-Don-t-mix-stdout-and-stderr.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "5f2bdbad629707aa7d85c623f994aa8a1d2dec55a73de5205bac0bf6058a2f7c"
+SRC_URI[sha256sum] = "73c853c3d44e1f693e5a96a986f1bd19d3d0dac2c7d453e796177774bc4e5f6a"
 
 inherit autotools gettext ptest
 
-- 
2.47.3


