Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.22854.1627645517873279456
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 04:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q0zdpL7q;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id c16so10920089wrp.13
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 04:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HRkerzK1fOIjGX6uvMvCpM3Ni+ag6PvIHvX3NyAgTDQ=;
        b=q0zdpL7qtSjTFWF5KVB4+Atkn5ZZ0Ca5NEgkAufVztIuqTrIdMepWOnr4xoaz23sQz
         SfbVBsy1sUUd2lgt2D9/dlKiN3GFs2yMg2ap8tM0gOTrgZzx1Tc1V+JCQVsMB2TYZv00
         AtSyWpkY4DsJU9GrF8unHuYP61U04FY6F+c2DejtB6SQ6W/h7NQhnTJC3Aa6gvNtyrvJ
         t52sSea9IBorYClEc7XismEKku2XvxY1SQi5P4nNG9u9qXUWXCIsM585hrw+0xj4MW7u
         YmoYFHOYoFo1tkVvjyFxWJ25DdWpXMOIYPUtzCl+hAi2aUn9OuiniGpjI2TkPnOti4PU
         kXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HRkerzK1fOIjGX6uvMvCpM3Ni+ag6PvIHvX3NyAgTDQ=;
        b=Qhl2iiAy0REkP4kScqkZ2rhwhDrZjOmnf1F7tMbPz8eUVlWfhmEW8WtyvzckTDRII7
         z569eI/xHDRfeOTO6bw6KXim/M9rBziJWmss+I5ajbkX6jJzTEXTR/l3Ajv8q8mDvLHi
         6I7S4Bs4IJc48SHYYtlgVdlLZbDWbkPmlZJ9tvetK/0Ig7OLyt+saTdVgWpe1kzRND6D
         b7qfNzi5GfmoLFZaBt7vwPkDGjEJlBzGHRrYxO+DdwwDTNmUijXDqohynFfpq7GSZDEE
         MiN+ED+RQrk18tptTZM49Yy7+RF0mbbr922wfLdPaL/hZ0+ZGiW3MqUHqRSgmV4CWmL0
         N2YQ==
X-Gm-Message-State: AOAM532Ikc6vZdUiCtKw1XgNpVscrygFUvtFL63rzhNziT8bXprhQlnl
	4i+CIIXWeaUIQezn+74VTVWExmDFRbc=
X-Google-Smtp-Source: ABdhPJzryfxe6guNHumbf77ES00kQk/e1YovH+KIXUOprRakva66cv61IFLQvwioryyZV2DXUyWMqw==
X-Received: by 2002:adf:dd8b:: with SMTP id x11mr2512142wrl.357.1627645516304;
        Fri, 30 Jul 2021 04:45:16 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id s9sm1459792wra.80.2021.07.30.04.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 04:45:15 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 6/9] shadow: update 4.8.1 -> 4.9
Date: Fri, 30 Jul 2021 13:45:04 +0200
Message-Id: <20210730114507.732448-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210730114507.732448-1-alex.kanavin@gmail.com>
References: <20210730114507.732448-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a couple backports to fix builds.

Drop 0002-Allow-for-setting-password-in-clear-text.patch;
what it adds is horribly insecure and AB testing didn't reveal any
regressions or use cases for it.

Drop /etc/default/ tweaks as files are no longer installed there.

Drop manpage alternatives as manpages are no longer installed.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...01-Disable-use-of-syslog-for-sysroot.patch |  29 +-
 ...builds-with-respect-to-libsubid-incl.patch | 114 +++++++
 .../0001-libsubid-link-to-PAM-libraries.patch |  31 ++
 ...w-for-setting-password-in-clear-text.patch | 301 ------------------
 ...nexpected-open-failure-in-chroot-env.patch |   6 +-
 meta/recipes-extended/shadow/shadow.inc       |  21 +-
 .../shadow/{shadow_4.8.1.bb => shadow_4.9.bb} |   0
 7 files changed, 167 insertions(+), 335 deletions(-)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch
 create mode 100644 meta/recipes-extended/shadow/files/0001-libsubid-link-to-PAM-libraries.patch
 delete mode 100644 meta/recipes-extended/shadow/files/0002-Allow-for-setting-password-in-clear-text.patch
 rename meta/recipes-extended/shadow/{shadow_4.8.1.bb => shadow_4.9.bb} (100%)

diff --git a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
index ab317b9aa0..95728bcd3f 100644
--- a/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
+++ b/meta/recipes-extended/shadow/files/0001-Disable-use-of-syslog-for-sysroot.patch
@@ -1,4 +1,4 @@
-From fa2d9453656641002802d8165e80adb9e6a729d2 Mon Sep 17 00:00:00 2001
+From 30a3906a0a21120fa6bbc918b6258ab9303fbeaa Mon Sep 17 00:00:00 2001
 From: Scott Garman <scott.a.garman@intel.com>
 Date: Thu, 14 Apr 2016 12:28:57 +0200
 Subject: [PATCH] Disable use of syslog for sysroot
@@ -19,12 +19,12 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  src/groupmems.c | 3 +++
  src/groupmod.c  | 3 +++
  src/useradd.c   | 3 +++
- src/userdel.c   | 3 +++
+ src/userdel.c   | 4 ++++
  src/usermod.c   | 3 +++
- 7 files changed, 21 insertions(+)
+ 7 files changed, 22 insertions(+)
 
 diff --git a/src/groupadd.c b/src/groupadd.c
-index 2dd8eec..e9c4bb7 100644
+index d7f68b1..5fe5f43 100644
 --- a/src/groupadd.c
 +++ b/src/groupadd.c
 @@ -34,6 +34,9 @@
@@ -38,7 +38,7 @@ index 2dd8eec..e9c4bb7 100644
  #include <fcntl.h>
  #include <getopt.h>
 diff --git a/src/groupdel.c b/src/groupdel.c
-index f941a84..5a70056 100644
+index 5c89312..2aefc5a 100644
 --- a/src/groupdel.c
 +++ b/src/groupdel.c
 @@ -34,6 +34,9 @@
@@ -52,7 +52,7 @@ index f941a84..5a70056 100644
  #include <fcntl.h>
  #include <grp.h>
 diff --git a/src/groupmems.c b/src/groupmems.c
-index fc91c8b..2842514 100644
+index 654a8f3..6b2026b 100644
 --- a/src/groupmems.c
 +++ b/src/groupmems.c
 @@ -32,6 +32,9 @@
@@ -66,7 +66,7 @@ index fc91c8b..2842514 100644
  #include <getopt.h>
  #include <grp.h>
 diff --git a/src/groupmod.c b/src/groupmod.c
-index 1dca5fc..bc14438 100644
+index acd6f35..a2c5247 100644
 --- a/src/groupmod.c
 +++ b/src/groupmod.c
 @@ -34,6 +34,9 @@
@@ -80,7 +80,7 @@ index 1dca5fc..bc14438 100644
  #include <fcntl.h>
  #include <getopt.h>
 diff --git a/src/useradd.c b/src/useradd.c
-index 4af0f7c..1b7bf06 100644
+index 127177e..b80e505 100644
 --- a/src/useradd.c
 +++ b/src/useradd.c
 @@ -34,6 +34,9 @@
@@ -94,21 +94,22 @@ index 4af0f7c..1b7bf06 100644
  #include <ctype.h>
  #include <errno.h>
 diff --git a/src/userdel.c b/src/userdel.c
-index cc951e5..153e0be 100644
+index 79a7c89..c1e010a 100644
 --- a/src/userdel.c
 +++ b/src/userdel.c
-@@ -34,6 +34,9 @@
- 
- #ident "$Id$"
+@@ -31,6 +31,10 @@
+  */
  
+ #include <config.h>
++
 +/* Disable use of syslog since we're running this command against a sysroot */
 +#undef USE_SYSLOG
 +
  #include <assert.h>
+ #include <dirent.h>
  #include <errno.h>
- #include <fcntl.h>
 diff --git a/src/usermod.c b/src/usermod.c
-index 05b9871..21c6da9 100644
+index 03bb9b9..e15fdd4 100644
 --- a/src/usermod.c
 +++ b/src/usermod.c
 @@ -34,6 +34,9 @@
diff --git a/meta/recipes-extended/shadow/files/0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch b/meta/recipes-extended/shadow/files/0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch
new file mode 100644
index 0000000000..c577be6505
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch
@@ -0,0 +1,114 @@
+From eced8077b57946fe0b723e7c6c510e8f344ce89b Mon Sep 17 00:00:00 2001
+From: Serge Hallyn <serge@hallyn.com>
+Date: Fri, 23 Jul 2021 17:51:13 -0500
+Subject: [PATCH] Fix out of tree builds with respect to libsubid includes
+
+There's a better way to do this, and I hope to clean that up,
+but this fixes out of tree builds for me right now.
+
+Closes #386
+
+Signed-off-by: Serge Hallyn <serge@hallyn.com>
+Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/537b8cd90be7b47b45c45cfd27765ef85eb0ebf1]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ lib/Makefile.am      | 2 ++
+ libmisc/Makefile.am  | 2 +-
+ libsubid/Makefile.am | 4 ++--
+ src/Makefile.am      | 6 ++++++
+ 4 files changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index ecf3ee25..5ac2e111 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -10,6 +10,8 @@ if HAVE_VENDORDIR
+ libshadow_la_CPPFLAGS += -DVENDORDIR=\"$(VENDORDIR)\"
+ endif
+ 
++libshadow_la_CPPFLAGS += -I$(top_srcdir)
++
+ libshadow_la_SOURCES = \
+ 	commonio.c \
+ 	commonio.h \
+diff --git a/libmisc/Makefile.am b/libmisc/Makefile.am
+index 9766a7ec..9f237e0d 100644
+--- a/libmisc/Makefile.am
++++ b/libmisc/Makefile.am
+@@ -1,7 +1,7 @@
+ 
+ EXTRA_DIST = .indent.pro xgetXXbyYY.c
+ 
+-AM_CPPFLAGS = -I$(top_srcdir)/lib $(ECONF_CPPFLAGS)
++AM_CPPFLAGS = -I$(top_srcdir)/lib -I$(top_srcdir) $(ECONF_CPPFLAGS)
+ 
+ noinst_LTLIBRARIES = libmisc.la
+ 
+diff --git a/libsubid/Makefile.am b/libsubid/Makefile.am
+index 189165b0..cdc41fe6 100644
+--- a/libsubid/Makefile.am
++++ b/libsubid/Makefile.am
+@@ -19,8 +19,8 @@ MISCLIBS = \
+ 	$(LIBTCB)
+ 
+ libsubid_la_LIBADD = \
+-	$(top_srcdir)/lib/libshadow.la \
+-	$(top_srcdir)/libmisc/libmisc.la \
++	$(top_builddir)/lib/libshadow.la \
++	$(top_builddir)/libmisc/libmisc.la \
+ 	$(MISCLIBS) -ldl
+ 
+ AM_CPPFLAGS = \
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 35027013..7c1a3491 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -10,6 +10,7 @@ sgidperms = 2755
+ AM_CPPFLAGS = \
+ 	-I${top_srcdir}/lib \
+ 	-I$(top_srcdir)/libmisc \
++	-I$(top_srcdir) \
+ 	-DLOCALEDIR=\"$(datadir)/locale\"
+ 
+ # XXX why are login and su in /bin anyway (other than for
+@@ -183,6 +184,7 @@ list_subid_ranges_LDADD = \
+ list_subid_ranges_CPPFLAGS = \
+ 	-I$(top_srcdir)/lib \
+ 	-I$(top_srcdir)/libmisc \
++	-I$(top_srcdir) \
+ 	-I$(top_srcdir)/libsubid
+ 
+ get_subid_owners_LDADD = \
+@@ -194,11 +196,13 @@ get_subid_owners_LDADD = \
+ get_subid_owners_CPPFLAGS = \
+ 	-I$(top_srcdir)/lib \
+ 	-I$(top_srcdir)/libmisc \
++	-I$(top_srcdir) \
+ 	-I$(top_srcdir)/libsubid
+ 
+ new_subid_range_CPPFLAGS = \
+ 	-I$(top_srcdir)/lib \
+ 	-I$(top_srcdir)/libmisc \
++	-I$(top_srcdir) \
+ 	-I$(top_srcdir)/libsubid
+ 
+ new_subid_range_LDADD = \
+@@ -210,6 +214,7 @@ new_subid_range_LDADD = \
+ free_subid_range_CPPFLAGS = \
+ 	-I$(top_srcdir)/lib \
+ 	-I$(top_srcdir)/libmisc \
++	-I$(top_srcdir) \
+ 	-I$(top_srcdir)/libsubid
+ 
+ free_subid_range_LDADD = \
+@@ -220,6 +225,7 @@ free_subid_range_LDADD = \
+ 
+ check_subid_range_CPPFLAGS = \
+ 	-I$(top_srcdir)/lib \
++	-I$(top_srcdir) \
+ 	-I$(top_srcdir)/libmisc
+ 
+ check_subid_range_LDADD = \
+-- 
+2.31.1
+
diff --git a/meta/recipes-extended/shadow/files/0001-libsubid-link-to-PAM-libraries.patch b/meta/recipes-extended/shadow/files/0001-libsubid-link-to-PAM-libraries.patch
new file mode 100644
index 0000000000..ea7a99dbf7
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-libsubid-link-to-PAM-libraries.patch
@@ -0,0 +1,31 @@
+From 4f44617af3a0c59be267ac5fcc33586e3783f5e6 Mon Sep 17 00:00:00 2001
+From: Xi Ruoyao <xry111@mengyan1223.wang>
+Date: Fri, 23 Jul 2021 14:38:08 +0800
+Subject: [PATCH] libsubid: link to PAM libraries
+
+libsubid.so links to libmisc.a, which contains several routines referring to
+PAM functions.
+
+Upstream-Status: Backport [https://github.com/shadow-maint/shadow/commit/f4a84efb468b8be21be124700ce35159c444e9d6]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ libsubid/Makefile.am | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libsubid/Makefile.am b/libsubid/Makefile.am
+index cdc41fe6..99308c1f 100644
+--- a/libsubid/Makefile.am
++++ b/libsubid/Makefile.am
+@@ -16,7 +16,8 @@ MISCLIBS = \
+ 	$(LIBCRYPT) \
+ 	$(LIBACL) \
+ 	$(LIBATTR) \
+-	$(LIBTCB)
++	$(LIBTCB) \
++	$(LIBPAM)
+ 
+ libsubid_la_LIBADD = \
+ 	$(top_builddir)/lib/libshadow.la \
+-- 
+2.31.1
+
diff --git a/meta/recipes-extended/shadow/files/0002-Allow-for-setting-password-in-clear-text.patch b/meta/recipes-extended/shadow/files/0002-Allow-for-setting-password-in-clear-text.patch
deleted file mode 100644
index c6332e4f76..0000000000
--- a/meta/recipes-extended/shadow/files/0002-Allow-for-setting-password-in-clear-text.patch
+++ /dev/null
@@ -1,301 +0,0 @@
-From a7d995228491ad5255ad86c1f04ba071f6880897 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Sat, 16 Nov 2013 15:27:47 +0800
-Subject: [PATCH] Allow for setting password in clear text
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
----
- src/Makefile.am |  8 ++++----
- src/groupadd.c  | 20 +++++++++++++++-----
- src/groupmod.c  | 20 +++++++++++++++-----
- src/useradd.c   | 21 +++++++++++++++------
- src/usermod.c   | 20 +++++++++++++++-----
- 5 files changed, 64 insertions(+), 25 deletions(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index f31fd7a..4a317a3 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -103,10 +103,10 @@ chsh_LDADD     = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT_NOPAM)
- chpasswd_LDADD = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT) $(LIBECONF)
- expiry_LDADD = $(LDADD) $(LIBECONF)
- gpasswd_LDADD  = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBCRYPT) $(LIBECONF)
--groupadd_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
-+groupadd_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF) $(LIBCRYPT)
- groupdel_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
- groupmems_LDADD = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
--groupmod_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
-+groupmod_LDADD = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF) $(LIBCRYPT)
- grpck_LDADD    = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
- grpconv_LDADD  = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
- grpunconv_LDADD = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
-@@ -127,9 +127,9 @@ su_SOURCES     = \
- 	suauth.c
- su_LDADD       = $(LDADD) $(LIBPAM) $(LIBAUDIT) $(LIBCRYPT_NOPAM) $(LIBSKEY) $(LIBMD) $(LIBECONF)
- sulogin_LDADD  = $(LDADD) $(LIBCRYPT) $(LIBECONF)
--useradd_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF)
-+useradd_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF) $(LIBCRYPT)
- userdel_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBECONF)
--usermod_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF)
-+usermod_LDADD  = $(LDADD) $(LIBPAM_SUID) $(LIBAUDIT) $(LIBSELINUX) $(LIBSEMANAGE) $(LIBACL) $(LIBATTR) $(LIBECONF) $(LIBCRYPT)
- vipw_LDADD     = $(LDADD) $(LIBAUDIT) $(LIBSELINUX) $(LIBECONF)
- 
- install-am: all-am
-diff --git a/src/groupadd.c b/src/groupadd.c
-index e9c4bb7..d572c00 100644
---- a/src/groupadd.c
-+++ b/src/groupadd.c
-@@ -127,9 +127,10 @@ static /*@noreturn@*/void usage (int status)
- 	(void) fputs (_("  -o, --non-unique              allow to create groups with duplicate\n"
- 	                "                                (non-unique) GID\n"), usageout);
- 	(void) fputs (_("  -p, --password PASSWORD       use this encrypted password for the new group\n"), usageout);
-+	(void) fputs (_("  -P, --clear-password PASSWORD use this clear password for the new group\n"), usageout);
- 	(void) fputs (_("  -r, --system                  create a system account\n"), usageout);
- 	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), usageout);
--	(void) fputs (_("  -P, --prefix PREFIX_DIR       directory prefix\n"), usageout);
-+	(void) fputs (_("  -A, --prefix PREFIX_DIR       directory prefix\n"), usageout);
- 	(void) fputs ("\n", usageout);
- 	exit (status);
- }
-@@ -391,13 +392,14 @@ static void process_flags (int argc, char **argv)
- 		{"key",        required_argument, NULL, 'K'},
- 		{"non-unique", no_argument,       NULL, 'o'},
- 		{"password",   required_argument, NULL, 'p'},
-+		{"clear-password", required_argument, NULL, 'P'},
- 		{"system",     no_argument,       NULL, 'r'},
- 		{"root",       required_argument, NULL, 'R'},
--		{"prefix",     required_argument, NULL, 'P'},
-+		{"prefix",     required_argument, NULL, 'A'},
- 		{NULL, 0, NULL, '\0'}
- 	};
- 
--	while ((c = getopt_long (argc, argv, "fg:hK:op:rR:P:",
-+	while ((c = getopt_long (argc, argv, "fg:hK:op:P:rR:A:",
- 		                 long_options, NULL)) != -1) {
- 		switch (c) {
- 		case 'f':
-@@ -449,12 +451,20 @@ static void process_flags (int argc, char **argv)
- 			pflg = true;
- 			group_passwd = optarg;
- 			break;
-+		case 'P':
-+			pflg = true;
-+			group_passwd = pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
-+			break;
- 		case 'r':
- 			rflg = true;
- 			break;
- 		case 'R': /* no-op, handled in process_root_flag () */
- 			break;
--		case 'P': /* no-op, handled in process_prefix_flag () */
-+		case 'A': /* no-op, handled in process_prefix_flag () */
-+			fprintf (stderr,
-+				 _("%s: -A is deliberately not supported \n"),
-+				 Prog);
-+			exit (E_BAD_ARG);
- 			break;
- 		default:
- 			usage (E_USAGE);
-@@ -588,7 +598,7 @@ int main (int argc, char **argv)
- 	(void) textdomain (PACKAGE);
- 
- 	process_root_flag ("-R", argc, argv);
--	prefix = process_prefix_flag ("-P", argc, argv);
-+	prefix = process_prefix_flag ("-A", argc, argv);
- 
- 	OPENLOG ("groupadd");
- #ifdef WITH_AUDIT
-diff --git a/src/groupmod.c b/src/groupmod.c
-index bc14438..25ccb44 100644
---- a/src/groupmod.c
-+++ b/src/groupmod.c
-@@ -138,8 +138,9 @@ static void usage (int status)
- 	(void) fputs (_("  -o, --non-unique              allow to use a duplicate (non-unique) GID\n"), usageout);
- 	(void) fputs (_("  -p, --password PASSWORD       change the password to this (encrypted)\n"
- 	                "                                PASSWORD\n"), usageout);
-+	(void) fputs (_("  -P, --clear-password PASSWORD change the password to this clear PASSWORD\n"), usageout);
- 	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), usageout);
--	(void) fputs (_("  -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n"), usageout);
-+	(void) fputs (_("  -A, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n"), usageout);
- 	(void) fputs ("\n", usageout);
- 	exit (status);
- }
-@@ -387,11 +388,12 @@ static void process_flags (int argc, char **argv)
- 		{"new-name",   required_argument, NULL, 'n'},
- 		{"non-unique", no_argument,       NULL, 'o'},
- 		{"password",   required_argument, NULL, 'p'},
-+		{"clear-password", required_argument, NULL, 'P'},
- 		{"root",       required_argument, NULL, 'R'},
--		{"prefix",     required_argument, NULL, 'P'},
-+		{"prefix",     required_argument, NULL, 'A'},
- 		{NULL, 0, NULL, '\0'}
- 	};
--	while ((c = getopt_long (argc, argv, "g:hn:op:R:P:",
-+	while ((c = getopt_long (argc, argv, "g:hn:op:P:R:A:",
- 		                 long_options, NULL)) != -1) {
- 		switch (c) {
- 		case 'g':
-@@ -418,9 +420,17 @@ static void process_flags (int argc, char **argv)
- 			group_passwd = optarg;
- 			pflg = true;
- 			break;
-+		case 'P':
-+			group_passwd = pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
-+			pflg = true;
-+			break;
- 		case 'R': /* no-op, handled in process_root_flag () */
- 			break;
--		case 'P': /* no-op, handled in process_prefix_flag () */
-+		case 'A': /* no-op, handled in process_prefix_flag () */
-+			fprintf (stderr,
-+				 _("%s: -A is deliberately not supported \n"),
-+				 Prog);
-+			exit (E_BAD_ARG);
- 			break;
- 		default:
- 			usage (E_USAGE);
-@@ -761,7 +771,7 @@ int main (int argc, char **argv)
- 	(void) textdomain (PACKAGE);
- 
- 	process_root_flag ("-R", argc, argv);
--	prefix = process_prefix_flag ("-P", argc, argv);
-+	prefix = process_prefix_flag ("-A", argc, argv);
- 
- 	OPENLOG ("groupmod");
- #ifdef WITH_AUDIT
-diff --git a/src/useradd.c b/src/useradd.c
-index 1b7bf06..44f09e2 100644
---- a/src/useradd.c
-+++ b/src/useradd.c
-@@ -853,9 +853,10 @@ static void usage (int status)
- 	(void) fputs (_("  -o, --non-unique              allow to create users with duplicate\n"
- 	                "                                (non-unique) UID\n"), usageout);
- 	(void) fputs (_("  -p, --password PASSWORD       encrypted password of the new account\n"), usageout);
-+	(void) fputs (_("  -P, --clear-password PASSWORD clear password of the new account\n"), usageout);
- 	(void) fputs (_("  -r, --system                  create a system account\n"), usageout);
- 	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), usageout);
--	(void) fputs (_("  -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n"), usageout);
-+	(void) fputs (_("  -A, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n"), usageout);
- 	(void) fputs (_("  -s, --shell SHELL             login shell of the new account\n"), usageout);
- 	(void) fputs (_("  -u, --uid UID                 user ID of the new account\n"), usageout);
- 	(void) fputs (_("  -U, --user-group              create a group with the same name as the user\n"), usageout);
-@@ -1133,9 +1134,10 @@ static void process_flags (int argc, char **argv)
- 			{"no-user-group",  no_argument,       NULL, 'N'},
- 			{"non-unique",     no_argument,       NULL, 'o'},
- 			{"password",       required_argument, NULL, 'p'},
-+			{"clear-password", required_argument, NULL, 'P'},
- 			{"system",         no_argument,       NULL, 'r'},
- 			{"root",           required_argument, NULL, 'R'},
--			{"prefix",         required_argument, NULL, 'P'},
-+			{"prefix",         required_argument, NULL, 'A'},
- 			{"shell",          required_argument, NULL, 's'},
- 			{"uid",            required_argument, NULL, 'u'},
- 			{"user-group",     no_argument,       NULL, 'U'},
-@@ -1146,9 +1148,9 @@ static void process_flags (int argc, char **argv)
- 		};
- 		while ((c = getopt_long (argc, argv,
- #ifdef WITH_SELINUX
--		                         "b:c:d:De:f:g:G:hk:K:lmMNop:rR:P:s:u:UZ:",
-+		                         "b:c:d:De:f:g:G:hk:K:lmMNop:P:rR:A:s:u:UZ:",
- #else				/* !WITH_SELINUX */
--		                         "b:c:d:De:f:g:G:hk:K:lmMNop:rR:P:s:u:U",
-+		                         "b:c:d:De:f:g:G:hk:K:lmMNop:P:rR:A:s:u:U",
- #endif				/* !WITH_SELINUX */
- 		                         long_options, NULL)) != -1) {
- 			switch (c) {
-@@ -1320,12 +1322,19 @@ static void process_flags (int argc, char **argv)
- 				}
- 				user_pass = optarg;
- 				break;
-+			case 'P': /* set clear text password */
-+				user_pass = pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
-+				break;
- 			case 'r':
- 				rflg = true;
- 				break;
- 			case 'R': /* no-op, handled in process_root_flag () */
- 				break;
--			case 'P': /* no-op, handled in process_prefix_flag () */
-+			case 'A': /* no-op, handled in process_prefix_flag () */
-+				fprintf (stderr,
-+					 _("%s: -A is deliberately not supported \n"),
-+					 Prog);
-+				exit (E_BAD_ARG);
- 				break;
- 			case 's':
- 				if (   ( !VALID (optarg) )
-@@ -2257,7 +2266,7 @@ int main (int argc, char **argv)
- 
- 	process_root_flag ("-R", argc, argv);
- 
--	prefix = process_prefix_flag("-P", argc, argv);
-+	prefix = process_prefix_flag("-A", argc, argv);
- 
- 	OPENLOG ("useradd");
- #ifdef WITH_AUDIT
-diff --git a/src/usermod.c b/src/usermod.c
-index 21c6da9..cffdb3e 100644
---- a/src/usermod.c
-+++ b/src/usermod.c
-@@ -431,8 +431,9 @@ static /*@noreturn@*/void usage (int status)
- 	                "                                new location (use only with -d)\n"), usageout);
- 	(void) fputs (_("  -o, --non-unique              allow using duplicate (non-unique) UID\n"), usageout);
- 	(void) fputs (_("  -p, --password PASSWORD       use encrypted password for the new password\n"), usageout);
-+	(void) fputs (_("  -P, --clear-password PASSWORD use clear password for the new password\n"), usageout);
- 	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), usageout);
--	(void) fputs (_("  -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n"), usageout);
-+	(void) fputs (_("  -A, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files\n"), usageout);
- 	(void) fputs (_("  -s, --shell SHELL             new login shell for the user account\n"), usageout);
- 	(void) fputs (_("  -u, --uid UID                 new UID for the user account\n"), usageout);
- 	(void) fputs (_("  -U, --unlock                  unlock the user account\n"), usageout);
-@@ -1010,8 +1011,9 @@ static void process_flags (int argc, char **argv)
- 			{"move-home",    no_argument,       NULL, 'm'},
- 			{"non-unique",   no_argument,       NULL, 'o'},
- 			{"password",     required_argument, NULL, 'p'},
-+			{"clear-password", required_argument, NULL, 'P'},
- 			{"root",         required_argument, NULL, 'R'},
--			{"prefix",       required_argument, NULL, 'P'},
-+			{"prefix",       required_argument, NULL, 'A'},
- 			{"shell",        required_argument, NULL, 's'},
- 			{"uid",          required_argument, NULL, 'u'},
- 			{"unlock",       no_argument,       NULL, 'U'},
-@@ -1027,7 +1029,7 @@ static void process_flags (int argc, char **argv)
- 			{NULL, 0, NULL, '\0'}
- 		};
- 		while ((c = getopt_long (argc, argv,
--		                         "abc:d:e:f:g:G:hl:Lmop:R:s:u:UP:"
-+		                         "abc:d:e:f:g:G:hl:Lmop:P:R:s:u:UA:"
- #ifdef ENABLE_SUBIDS
- 		                         "v:w:V:W:"
- #endif				/* ENABLE_SUBIDS */
-@@ -1130,9 +1132,17 @@ static void process_flags (int argc, char **argv)
- 				user_pass = optarg;
- 				pflg = true;
- 				break;
-+			case 'P':
-+				user_pass = pw_encrypt (optarg, crypt_make_salt (NULL, NULL));
-+				pflg = true;
-+				break;
- 			case 'R': /* no-op, handled in process_root_flag () */
- 				break;
--			case 'P': /* no-op, handled in process_prefix_flag () */
-+			case 'A': /* no-op, handled in process_prefix_flag () */
-+				fprintf (stderr,
-+					 _("%s: -A is deliberately not supported \n"),
-+					 Prog);
-+				exit (E_BAD_ARG);
- 				break;
- 			case 's':
- 				if (!VALID (optarg)) {
-@@ -2127,7 +2137,7 @@ int main (int argc, char **argv)
- 	(void) textdomain (PACKAGE);
- 
- 	process_root_flag ("-R", argc, argv);
--	prefix = process_prefix_flag ("-P", argc, argv);
-+	prefix = process_prefix_flag ("-A", argc, argv);
- 
- 	OPENLOG ("usermod");
- #ifdef WITH_AUDIT
diff --git a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
index 9825216369..bd24626a26 100644
--- a/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
+++ b/meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
@@ -1,4 +1,4 @@
-From 66533c7c6f347d257020675a1ed6e0c59cbbc3f0 Mon Sep 17 00:00:00 2001
+From 1422c24f7266b553c82100e3d18a10c55cd91063 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 17 Jul 2014 15:53:34 +0800
 Subject: [PATCH] commonio.c-fix-unexpected-open-failure-in-chroot-env
@@ -21,10 +21,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 12 insertions(+), 4 deletions(-)
 
 diff --git a/lib/commonio.c b/lib/commonio.c
-index 16fa7e7..d6bc297 100644
+index cef404b..66908fb 100644
 --- a/lib/commonio.c
 +++ b/lib/commonio.c
-@@ -632,10 +632,18 @@ int commonio_open (struct commonio_db *db, int mode)
+@@ -646,10 +646,18 @@ int commonio_open (struct commonio_db *db, int mode)
  	db->cursor = NULL;
  	db->changed = false;
  
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 2cbdfbc1cf..51d2ca5f16 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -10,10 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ed80ff1c2b40843cf5768e5229cf16e5 \
 DEPENDS = "virtual/crypt"
 
 UPSTREAM_CHECK_URI = "https://github.com/shadow-maint/shadow/releases"
-SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/${PV}/${BP}.tar.gz \
+SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/v${PV}/${BP}.tar.gz \
            file://shadow-4.1.3-dots-in-usernames.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://shadow-relaxed-usernames.patch \
+           file://0001-Fix-out-of-tree-builds-with-respect-to-libsubid-incl.patch \
+           file://0001-libsubid-link-to-PAM-libraries.patch \
            "
 
 SRC_URI_append_class-target = " \
@@ -23,15 +25,13 @@ SRC_URI_append_class-target = " \
 
 SRC_URI_append_class-native = " \
            file://0001-Disable-use-of-syslog-for-sysroot.patch \
-           file://0002-Allow-for-setting-password-in-clear-text.patch \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            "
 SRC_URI_append_class-nativesdk = " \
            file://0001-Disable-use-of-syslog-for-sysroot.patch \
            "
 
-SRC_URI[md5sum] = "3d97f11e66bfb0b14702b115fa8be480"
-SRC_URI[sha256sum] = "3ee3081fbbcbcfea5c8916419e46bc724807bab271072104f23e7a29e9668f3a"
+SRC_URI[sha256sum] = "6c4627ff9c9422b96664517ae753c944f2902e92809d0698b65f5fef11985212"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
@@ -115,12 +115,6 @@ do_install() {
 	# Use proper encryption for passwords
 	sed -i 's/^#ENCRYPT_METHOD.*$/ENCRYPT_METHOD SHA512/' ${D}${sysconfdir}/login.defs
 
-	# Now we don't have a mail system. Disable mail creation for now.
-	sed -i 's:/bin/bash:/bin/sh:g' ${D}${sysconfdir}/default/useradd
-	sed -i '/^CREATE_MAIL_SPOOL/ s:^:#:' ${D}${sysconfdir}/default/useradd
-
-	# Use users group by default
-	sed -i 's,^GROUP=1000,GROUP=100,g' ${D}${sysconfdir}/default/useradd
 }
 
 do_install_append() {
@@ -184,13 +178,6 @@ ALTERNATIVE_${PN}-base = "newgrp groups login su"
 ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
 ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
 
-ALTERNATIVE_${PN}-doc = "passwd.5 getspnam.3 groups.1 su.1 nologin.8"
-ALTERNATIVE_LINK_NAME[passwd.5] = "${mandir}/man5/passwd.5"
-ALTERNATIVE_LINK_NAME[getspnam.3] = "${mandir}/man3/getspnam.3"
-ALTERNATIVE_LINK_NAME[groups.1] = "${mandir}/man1/groups.1"
-ALTERNATIVE_LINK_NAME[su.1] = "${mandir}/man1/su.1"
-ALTERNATIVE_LINK_NAME[nologin.8] = "${mandir}/man8/nologin.8"
-
 PACKAGE_WRITE_DEPS += "shadow-native"
 pkg_postinst_${PN}_class-target () {
 	if [ "x$D" != "x" ]; then
diff --git a/meta/recipes-extended/shadow/shadow_4.8.1.bb b/meta/recipes-extended/shadow/shadow_4.9.bb
similarity index 100%
rename from meta/recipes-extended/shadow/shadow_4.8.1.bb
rename to meta/recipes-extended/shadow/shadow_4.9.bb
-- 
2.31.1

