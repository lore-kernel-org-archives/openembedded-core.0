Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.1470.1626403376126661608
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232494700"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="232494700"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:43:11 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="656075587"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.225.206])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:43:10 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 27/28] busybox: add tmpdir option into mktemp applet
Date: Fri, 16 Jul 2021 10:42:25 +0800
Message-Id: <0c51fd928407267a5c1b664aabfdc3527aa92988.1626403078.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626403078.git.anuj.mittal@intel.com>
References: <cover.1626403078.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrej Valek <andrej.valek@siemens.com>

- Make mktemp applet compatible with --tmpdir option in ca-certificate
update script.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3d969e482d29da29828d1510f106f161d2b3d3c0)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../0001-mktemp-add-tmpdir-option.patch       | 81 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.33.1.bb   |  5 +-
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
index 3a70a8056e..4002d6a5c6 100644
--- a/meta/recipes-core/busybox/busybox_1.33.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.33.1.bb
@@ -37,6 +37,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager') == 'busybox-mdev')]} \
            file://syslog.cfg \
            file://unicode.cfg \
+           file://rev.cfg \
+           file://pgrep.cfg \
            file://rcS \
            file://rcK \
            file://makefile-libbb-race.patch \
@@ -44,9 +46,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
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
2.31.1

