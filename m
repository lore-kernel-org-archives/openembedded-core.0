Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web11.4793.1588673651307616274
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 03:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=piyx7QZb;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=3877ea1dc=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588673651; x=1620209651;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pj0zcNLtp/bpbG/8Yt7w7yqyxGti5mCw+J1lEoOSrqI=;
  b=piyx7QZbexC8Pm7cBXlgxRpze1auTiGHFkZi9myVoGQk3okQl0UMRVS6
   Fwwedft+jNNxwReQtPYi3ovt3m5dudEpwBDss46DgwFJGEcwLYKXV4oTA
   /IdTuwEp3xTL47UslwRJeHd4O62C9ta/FwWG6a782sUQogVf+pW0I56pQ
   BXa2pzhzL0bVgD1Bho0qJHJCgryvCpcc/NSn/9BT7xGtePt4Qbu6mQoe1
   r2PzaciAbvbeYVpSwcRu7GKEAvCBDKiX123tSU15YraaLGTvZXlJJZ+yA
   XkXZoqG7oUJtdYy6DNEC/TpHDnqzhdAznibU+PhS42Tmzl+LTTOtzoZdu
   A==;
IronPort-SDR: gj7UEgqMwexg3n8e46p6lkXCYAef5EIEY/EpQ0o3oP9Q5flrul8LuCKEdbBp5PxxKTBQ59dywV
 26E+1FNkjLdEWwMWHE0vnrQBs84NDVT27fVwKs4/YYU8iLoiShPUlV2+4QQ72PD8Q+DBn4KS/z
 PHTIBXmgRC8IwXhrIDzuEse6iCcT7AiFRCOoW0pynEdkdNvwramQVEnhzTRBWg7jXiy6+RlN7R
 d3iwO5YASf3iQKD5TVk0buDFANgbmmRrfIU2cE16mjIfg9eR3KoKWRSdR4knFl63mU/ZdzwmIt
 qX0=
X-IronPort-AV: E=Sophos;i="5.73,354,1583190000"; 
   d="scan'208";a="2574943"
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-core@lists.openembedded.org>
CC: Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH] gdbm: add patch to fix link failure against gcc 10
Date: Tue, 5 May 2020 12:13:42 +0200
Message-ID: <20200505101342.137101-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This also makes appending "-fcommon" to CFLAGS obsolete and enables
native builds with a host gcc v10.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 ...gdbm-fix-link-failure-against-gcc-10.patch | 46 +++++++++++++++++++
 meta/recipes-support/gdbm/gdbm_1.18.1.bb      |  3 +-
 2 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/gdbm/files/gdbm-fix-link-failure-against-gcc-10.patch

diff --git a/meta/recipes-support/gdbm/files/gdbm-fix-link-failure-against-gcc-10.patch b/meta/recipes-support/gdbm/files/gdbm-fix-link-failure-against-gcc-10.patch
new file mode 100644
index 0000000000..8ecb16f97e
--- /dev/null
+++ b/meta/recipes-support/gdbm/files/gdbm-fix-link-failure-against-gcc-10.patch
@@ -0,0 +1,46 @@
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
2.26.2

