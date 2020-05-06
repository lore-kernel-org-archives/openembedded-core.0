Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web10.2813.1588756211050303147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 02:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=BgDhi9ti;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=388eec6a1=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1588756211; x=1620292211;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=b4crp9F+UwMsYfH8u5Xu621f60nRsM7AkzvjqhShlcc=;
  b=BgDhi9tiKP7Mp/cSTeCjQRqAwJ6+QL77SS4n0fn2AQKPDBsvTEcvZzvt
   YfUZ4d5qIdns6ESlVFK9O0/wbIEhpIvhHpjhlqhHeJH6JxQYEmO27y7im
   elo8TdzuVKmBa9agY8tUOjhbDLk9y1lagqXlFoVVa7xOvOo3qM6cFqOz3
   mHpytOyLhOIfqdJCvt8UhlAnKhZWzd4oJ8fgkA0RZ7guGQnfXVJK3+txD
   kkeqOzWOgvSpnKgVcI0SKlWaE4EAzLoDjT2TMTzFRCzA6xFNxqaBLon2A
   564pYelynP9WPtochrnheGe7LZanR6SRi/ADbZHdgdDuQhWQbmjZ194NX
   Q==;
IronPort-SDR: WG6OaK7aat2yqnZZI0wbBY1jgjn8F+DcU4/PKE8P2ltLDUu7eEA3MY1AwN7qoCmmh1zkJF6vIe
 NlH4z9ChNtvYhmZplmu58dilUL6AMsuhpVUxc79CMsIS5c01JhmAHw/SBpv7rIXwsTIYONFNtE
 rkHh19hrXeTWpCeW2emTCvohMWHi+WfC/0CBHsQT1Uuorb7CE72LSq3yYZdSMzSwjkBQsOMZuo
 ogP6Z/rxh1OEtg+uWay1egHeTBwwxItSy6WRkmv7+mOwCKvIdO+ZsamLE5VAfs26toyoWAtYj8
 OVg=
X-IronPort-AV: E=Sophos;i="5.73,358,1583190000"; 
   d="scan'208";a="24186867"
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-core@lists.openembedded.org>
CC: Richard Leitner <richard.leitner@skidata.com>
Subject: [PATCH v2 1/2] binutils: add patch to fix issues with gcc 10
Date: Wed, 6 May 2020 11:09:42 +0200
Message-ID: <20200506090943.2111027-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

gcc 10 introduced "-fno-common" as default. Therefore backport the
according binutils patch to fix this issue.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 .../binutils/binutils-2.34.inc                |  1 +
 ...dundant-program_name-definition-fno-.patch | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index 66a3850ef2..f65fdb7328 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -41,6 +41,7 @@ SRC_URI = "\
      file://0014-Detect-64-bit-MIPS-targets.patch \
      file://0015-sync-with-OE-libtool-changes.patch \
      file://0016-Check-for-clang-before-checking-gcc-version.patch \
+     file://0017-binutils-drop-redundant-program_name-definition-fno-.patch \
      file://CVE-2020-0551.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch b/meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch
new file mode 100644
index 0000000000..55af9abc13
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch
@@ -0,0 +1,61 @@
+From 57a3e055605b28a9449b1b27eda7125737c42b00 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <siarheit@google.com>
+Date: Sat, 1 Feb 2020 23:16:11 +0000
+Subject: [PATCH] binutils: drop redundant 'program_name' definition
+ (-fno-common)
+
+	* coffdump.c (program_name): Drop redundant definition.
+	* srconv.c (program_name): Likewise
+	* sysdump.c (program_name): Likewise
+
+Upstream-Status: Accepted (commit 0b398d69ac)
+Signed-off-by: Sergei Trofimovich <siarheit@google.com>
+Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
+---
+ binutils/coffdump.c | 2 --
+ binutils/srconv.c   | 2 --
+ binutils/sysdump.c  | 2 --
+ 3 files changed, 6 deletions(-)
+
+diff --git a/binutils/coffdump.c b/binutils/coffdump.c
+index 531a4e46c3..336da57ca2 100644
+--- a/binutils/coffdump.c
++++ b/binutils/coffdump.c
+@@ -456,8 +456,6 @@ coff_dump (struct coff_ofile *ptr)
+     dump_coff_section (ptr->sections + i);
+ }
+ 
+-char * program_name;
+-
+ static void
+ show_usage (FILE *file, int status)
+ {
+diff --git a/binutils/srconv.c b/binutils/srconv.c
+index 5742b16759..f071794f0a 100644
+--- a/binutils/srconv.c
++++ b/binutils/srconv.c
+@@ -1687,8 +1687,6 @@ prescan (struct coff_ofile *otree)
+     }
+ }
+ 
+-char *program_name;
+-
+ ATTRIBUTE_NORETURN static void
+ show_usage (FILE *ffile, int status)
+ {
+diff --git a/binutils/sysdump.c b/binutils/sysdump.c
+index d433e71ed9..7eebbd61d3 100644
+--- a/binutils/sysdump.c
++++ b/binutils/sysdump.c
+@@ -633,8 +633,6 @@ module (void)
+     }
+ }
+ 
+-char *program_name;
+-
+ ATTRIBUTE_NORETURN static void
+ show_usage (FILE *ffile, int status)
+ {
+-- 
+2.26.2
+
-- 
2.26.2

