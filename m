Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
 by mx.groups.io with SMTP id smtpd.web09.3804.1624601449998663368
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jun 2021 23:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.28, mailfrom: andrej.valek@siemens.com)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 15P6AlJ6022454
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Jun 2021 08:10:47 +0200
Received: from dev.vm6.ccp.siemens.com ([144.145.220.59])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 15P6Ak3Z016873;
	Fri, 25 Jun 2021 08:10:47 +0200
Received: from dev.localdomain (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 9FA5A950A87;
	Fri, 25 Jun 2021 08:10:46 +0200 (CEST)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Andrej Valek <andrej.valek@siemens.com>,
        Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] busybox: add tmpdir option into mktemp applet
Date: Fri, 25 Jun 2021 08:10:11 +0200
Message-Id: <20210625061011.10871-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210622121531.13424-1-andrej.valek@siemens.com>
References: <20210622121531.13424-1-andrej.valek@siemens.com>

- Make mktemp applet compatible with --tmpdir option in ca-certificate
update script.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../busybox/0001-mktemp-add-tmpdir-option.patch    | 81 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.33.1.bb        |  5 +-
 2 files changed, 84 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch b/meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch
new file mode 100644
index 0000000000..4a1960dff2
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch
@@ -0,0 +1,81 @@
+From ceb378209f953ea745ed93a8645567196380ce3c Mon Sep 17 00:00:00 2001
+From: Andrej Valek <andrej.valek@siemens.com>
+Date: Thu, 24 Jun 2021 19:13:22 +0200
+Subject: [PATCH] mktemp: add tmpdir option
+
+Make mktemp more compatible with coreutils.
+- add "--tmpdir" option
+- add long variants for "d,q,u" options
+
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2021-June/088932.html]
+
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ coreutils/mktemp.c | 26 ++++++++++++++++++--------
+ 1 file changed, 18 insertions(+), 8 deletions(-)
+
+diff --git a/coreutils/mktemp.c b/coreutils/mktemp.c
+index 5393320a5..05c6d98c6 100644
+--- a/coreutils/mktemp.c
++++ b/coreutils/mktemp.c
+@@ -39,16 +39,17 @@
+ //kbuild:lib-$(CONFIG_MKTEMP) += mktemp.o
+ 
+ //usage:#define mktemp_trivial_usage
+-//usage:       "[-dt] [-p DIR] [TEMPLATE]"
++//usage:       "[-dt] [-p DIR, --tmpdir[=DIR]] [TEMPLATE]"
+ //usage:#define mktemp_full_usage "\n\n"
+ //usage:       "Create a temporary file with name based on TEMPLATE and print its name.\n"
+ //usage:       "TEMPLATE must end with XXXXXX (e.g. [/dir/]nameXXXXXX).\n"
+ //usage:       "Without TEMPLATE, -t tmp.XXXXXX is assumed.\n"
+-//usage:     "\n	-d	Make directory, not file"
+-//usage:     "\n	-q	Fail silently on errors"
+-//usage:     "\n	-t	Prepend base directory name to TEMPLATE"
+-//usage:     "\n	-p DIR	Use DIR as a base directory (implies -t)"
+-//usage:     "\n	-u	Do not create anything; print a name"
++//usage:     "\n	-d			Make directory, not file"
++//usage:     "\n	-q			Fail silently on errors"
++//usage:     "\n	-t			Prepend base directory name to TEMPLATE"
++//usage:     "\n	-p DIR, --tmpdir[=DIR]	Use DIR as a base directory (implies -t)"
++//usage:     "\n				For --tmpdir is a optional one."
++//usage:     "\n	-u			Do not create anything; print a name"
+ //usage:     "\n"
+ //usage:     "\nBase directory is: -p DIR, else $TMPDIR, else /tmp"
+ //usage:
+@@ -72,13 +73,22 @@ int mktemp_main(int argc UNUSED_PARAM, char **argv)
+ 		OPT_t = 1 << 2,
+ 		OPT_p = 1 << 3,
+ 		OPT_u = 1 << 4,
++		OPT_td = 1 << 5,
+ 	};
+ 
+ 	path = getenv("TMPDIR");
+ 	if (!path || path[0] == '\0')
+ 		path = "/tmp";
+ 
+-	opts = getopt32(argv, "^" "dqtp:u" "\0" "?1"/*1 arg max*/, &path);
++	opts = getopt32long(argv, "^"
++	       "dqtp:u\0"
++	       "?1" /* 1 arg max */,
++	       "directory\0" No_argument       "d"
++	       "quiet\0"     No_argument       "q"
++	       "dry-run\0"   No_argument       "u"
++	       "tmpdir\0"    Optional_argument "\xff"
++	       , &path, &path
++	);
+ 
+ 	chp = argv[optind];
+ 	if (!chp) {
+@@ -95,7 +105,7 @@ int mktemp_main(int argc UNUSED_PARAM, char **argv)
+ 		goto error;
+ 	}
+ #endif
+-	if (opts & (OPT_t|OPT_p))
++	if (opts & (OPT_t|OPT_p|OPT_td))
+ 		chp = concat_path_file(path, chp);
+ 
+ 	if (opts & OPT_u) {
+-- 
+2.11.0
+
diff --git a/meta/recipes-core/busybox/busybox_1.33.1.bb b/meta/recipes-core/busybox/busybox_1.33.1.bb
index a71ff530cb..4c2bc1106d 100644
--- a/meta/recipes-core/busybox/busybox_1.33.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.33.1.bb
@@ -38,6 +38,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager') == 'busybox-mdev')]} \
            file://syslog.cfg \
            file://unicode.cfg \
+           file://rev.cfg \
+           file://pgrep.cfg \
            file://rcS \
            file://rcK \
            file://makefile-libbb-race.patch \
@@ -45,9 +47,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
            file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
-           file://rev.cfg \
-           file://pgrep.cfg \
            file://0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch \
+           file://0001-mktemp-add-tmpdir-option.patch \
            "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.11.0

