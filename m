Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.25366.1591983208488072757
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 10:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id j32so7700815qte.10
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 10:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=WqMElrPbBUurNIcyK+o4gUDI7SlnRr2Cqjc5Jyf9AUo=;
        b=MsxXMsscC5V1l47WcSJkPL822I9S4SChCqCZOMgg7TysYuSDQ7vFuJUl13apyvubFY
         VAOP7V7z2pXqX3Er8oZjqCcaGcjBLfsqKapbE8tH/xKuT5pCHSu+NS3EvQztiPfSPcHF
         hu6bQfDR+EAS4cfD3zFDmCZlXEt4q/xrHCLsTULnrdqJtSKopvqzsQwiESXSXd73SKV+
         P7lUc4+0KPMvqJ2wHtLidJ1cmQJwXM1xOwZyQlpWTr9rcSGuaw/yrkNcRnSxl+pZY83w
         d+nqnQLC4UQ7TnZ1CRhDuweBbTA2uWiDFsoR/8RC1QiAOgHPuoz9ID7MWFTTgc/Y2xzL
         UfjQ==
X-Gm-Message-State: AOAM5330HYGNIMprMVC7Sb6HqgjWvjitqjxQ1PixHOshKRwewkyYxptP
	+u/n2iUS/3k8nolgepLq7aZNeF7r+gY=
X-Google-Smtp-Source: ABdhPJyasfyuj2FcAPDQBX9X1fRk4joopxw3mqdNnvYqCHNsC7zootCP/6yJfE1R8Ex7IL7EXpm2tQ==
X-Received: by 2002:aed:2a19:: with SMTP id c25mr4133806qtd.345.1591983207300;
        Fri, 12 Jun 2020 10:33:27 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id o66sm4937166qka.60.2020.06.12.10.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 10:33:26 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Richard Leitner <richard.leitner@skidata.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport PATCH 1/9] gdbm: add patch to fix link failure against gcc 10
Date: Fri, 12 Jun 2020 14:33:10 -0300
Message-Id: <20200612173318.103232-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Richard Leitner <richard.leitner@skidata.com>

This also makes appending "-fcommon" to CFLAGS obsolete and enables
native builds with a host gcc v10.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7717b35265e6ef8ef71a4eca4074294dfcc2110c)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...gdbm-fix-link-failure-against-gcc-10.patch | 47 +++++++++++++++++++
 meta/recipes-support/gdbm/gdbm_1.18.1.bb      |  3 +-
 2 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/gdbm/files/gdbm-fix-link-failure-against-gcc-10.patch

diff --git a/meta/recipes-support/gdbm/files/gdbm-fix-link-failure-against-gcc-10.patch b/meta/recipes-support/gdbm/files/gdbm-fix-link-failure-against-gcc-10.patch
new file mode 100644
index 0000000000..c1580418dc
--- /dev/null
+++ b/meta/recipes-support/gdbm/files/gdbm-fix-link-failure-against-gcc-10.patch
@@ -0,0 +1,47 @@
+From f993697af81c37df9c55e0ebedeb1b8b880506ae Mon Sep 17 00:00:00 2001
+From: Richard Leitner <richard.leitner@skidata.com>
+Date: Tue, 5 May 2020 11:59:42 +0200
+Subject: [PATCH] gdbm: fix link failure against gcc-10
+
+Copied from gentoo's solution at https://bugs.gentoo.org/show_bug.cgi?id=705898
+Original patch by Sergei Trofimovich <slyfox@gentoo.org>
+
+Original description:
+
+Before the change on gcc-10 link failed as:
+```
+  CCLD     gdbmtool
+ld: ./libgdbmapp.a(parseopt.o):(.bss+0x8): multiple definition of `parseopt_program_args';
+  gdbmtool.o:(.data.rel.local+0x260): first defined here
+ld: ./libgdbmapp.a(parseopt.o):(.bss+0x10): multiple definition of `parseopt_program_doc';
+  gdbmtool.o:(.data.rel.local+0x268): first defined here
+```
+
+gcc-10 will change the default from -fcommon to fno-common:
+    https://gcc.gnu.org/PR85678.
+
+The fix is to avoid multiple definition and rely on
+declarations only.
+
+Upstream-Status: Pending
+Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
+---
+ src/parseopt.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/parseopt.c b/src/parseopt.c
+index 268e080..a4c8576 100644
+--- a/src/parseopt.c
++++ b/src/parseopt.c
+@@ -255,8 +255,6 @@ print_option_descr (const char *descr, size_t lmargin, size_t rmargin)
+ }
+ 
+ char *parseopt_program_name;
+-char *parseopt_program_doc;
+-char *parseopt_program_args;
+ const char *program_bug_address = "<" PACKAGE_BUGREPORT ">";
+ void (*parseopt_help_hook) (FILE *stream);
+ 
+-- 
+2.26.2
+
diff --git a/meta/recipes-support/gdbm/gdbm_1.18.1.bb b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
index 5cb7c558b8..fbb1fe72d7 100644
--- a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=241da1b9fe42e642cbb2c24d5e0c4d24"
 SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
            file://run-ptest \
            file://ptest.patch \
+           file://gdbm-fix-link-failure-against-gcc-10.patch \
           "
 
 SRC_URI[md5sum] = "988dc82182121c7570e0cb8b4fcd5415"
@@ -23,8 +24,6 @@ CACHED_CONFIGUREVARS += "ac_cv_lib_ndbm_main=no ac_cv_lib_dbm_main=no"
 
 BBCLASSEXTEND = "native nativesdk"
 
-CFLAGS += "-fcommon"
-
 do_install_append () {
     # Create a symlink to ndbm.h and gdbm.h in include/gdbm to let other packages to find
     # these headers
-- 
2.27.0

