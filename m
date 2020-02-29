Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id A689D6197C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 20:38:06 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id 2B0936032A;
	Sat, 29 Feb 2020 21:38:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1583008685;
	bh=AyB0P3Ep1EOC63rKSHo1TE7VO3ot+ZI1Xzy4IXQtPNo=;
	h=From:To:Cc:Subject:Date:From;
	b=fqGg8nCkpiU9nOpjuzmmC1n9MuRMJ5afVPtmfJ3il41dFu8o7Ry6oY+AyiiAH7ZUM
	R/VJ+0KMYIP5pj9Yw3jVEMqpiAGiVyjSmLt+8eExnGfraoX9HtLi6r2ALG9cwi8w1B
	0Ixf5F4CLDosvy04mvT0zWYYXUbigmxGFGsFwD0Ky5iYNXstN0OreqDi/uBuURO4Lc
	YPWIgAS4D69BXQ17dURxi+6aPcOSrgWqTFDWB6uvbdSnLAQddBfWhI8reWtI98sRvc
	AeJrssszoy9XX5eyaam0RpSr42ysZB56AKUjnst8Dbq2lr4MlVsUx4LP4h1GrCytZy
	J4vKlUjn/0ckg==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Feb 2020 21:38:01 +0100
Message-Id: <1583008682-4650-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v4 1/2] util-linux: upgrade 2.34 -> 2.35.1
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
X-List-Received-Date: Sat, 29 Feb 2020 20:38:07 -0000

License-Update: add GPLv3 text in README.licensing

Also:
 - Drop upstreamed patch
 - Backport an upstream patch to fix an issue with 'sfdisk'
 - Use 'disable-hwclock-gplv3' explicitly.

Since commit 7a3000f7ba548cf7d74ac77cc63fe8de228a669e ("hwclock: use parse_date function") hwclock is linked
with parse_date.y from gnullib. This gnulib code is distributed with GPLv3.
So, we have to use '--disable-hwclock-gplv3' to exclude this code.

See full changelog https://lore.kernel.org/util-linux/20200131095846.ogjtqrs7ai774tka@ws.net.home/T/#u

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
Changes v3 -> v4
 - Backport an upstream patch to fix an issue with 'sfdisk'

Changes v2 -> v3
 - NONE
 
Changes v1 -> v2
 - bump to 2.35.1 instead of 2.35
 - use disable-hwclock-gplv3 option to not use datetime parsing GPLv3 code
 
FYI, hwclock will be made GPLv2-only again in v2.36, see:
 - https://lore.kernel.org/util-linux/20200127202152.4jh2w4chch37wgee@ws.net.home/T/#e0c176440ca3f7b10693ff8f0afaf114b4b94405d

 meta/recipes-core/util-linux/util-linux.inc        |   3 +-
 ...ript-accept-sector-size-ignore-unknown-he.patch | 137 +++++++++++++++++++++
 ...lsblk-force-to-print-PKNAME-for-partition.patch |  36 ------
 meta/recipes-core/util-linux/util-linux_2.34.bb    |  14 ---
 meta/recipes-core/util-linux/util-linux_2.35.1.bb  |  14 +++
 5 files changed, 153 insertions(+), 51 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-libfdisk-script-accept-sector-size-ignore-unknown-he.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-lsblk-force-to-print-PKNAME-for-partition.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux_2.34.bb
 create mode 100644 meta/recipes-core/util-linux/util-linux_2.35.1.bb

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 179cb3d..0566569 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -8,7 +8,7 @@ SECTION = "base"
 
 LICENSE = "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
 
-LIC_FILES_CHKSUM = "file://README.licensing;md5=972a134f1e14b2b060e365df2fab0099 \
+LIC_FILES_CHKSUM = "file://README.licensing;md5=0fd5c050c6187d2bf0a4492b7f4e33da \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://Documentation/licenses/COPYING.LGPL-2.1-or-later;md5=4fbd65380cdd255951079008b364516c \
@@ -105,6 +105,7 @@ EXTRA_OECONF = "\
 EXTRA_OECONF_append_class-target = " --enable-setpriv"
 EXTRA_OECONF_append_class-native = " --without-cap-ng --disable-setpriv"
 EXTRA_OECONF_append_class-nativesdk = " --without-cap-ng --disable-setpriv"
+EXTRA_OECONF_append = " --disable-hwclock-gplv3"
 
 # enable pcre2 for native/nativesdk to match host distros
 # this helps to keep same expectations when using the SDK or
diff --git a/meta/recipes-core/util-linux/util-linux/0001-libfdisk-script-accept-sector-size-ignore-unknown-he.patch b/meta/recipes-core/util-linux/util-linux/0001-libfdisk-script-accept-sector-size-ignore-unknown-he.patch
new file mode 100644
index 0000000..911f70b
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-libfdisk-script-accept-sector-size-ignore-unknown-he.patch
@@ -0,0 +1,137 @@
+From 00e53f17c8462cb34ece08cc10db60a7da29a305 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 4 Feb 2020 15:11:19 +0100
+Subject: [PATCH] libfdisk: (script) accept sector-size, ignore unknown headers
+
+- add sector-size between supported headers (already in --dump output)
+
+- report unknown headers by -ENOTSUP
+
+- ignore ENOTSUP in sfdisk (but print warning) and in fdisk_script_read_file()
+
+Upstream-Status: Backport [https://github.com/karelzak/util-linux/commit/00e53f17c8462cb34ece08cc10db60a7da29a305]
+
+Addresses: https://github.com/karelzak/util-linux/issues/949
+Signed-off-by: Karel Zak <kzak@redhat.com>
+Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
+---
+ disk-utils/sfdisk.c   |  6 +++++-
+ libfdisk/src/script.c | 49 ++++++++++++++++++++++++++-----------------------
+ 2 files changed, 31 insertions(+), 24 deletions(-)
+
+diff --git a/disk-utils/sfdisk.c b/disk-utils/sfdisk.c
+index bb6e1c6..c0bea70 100644
+--- a/disk-utils/sfdisk.c
++++ b/disk-utils/sfdisk.c
+@@ -1782,7 +1782,11 @@ static int command_fdisk(struct sfdisk *sf, int argc, char **argv)
+ 		}
+ 
+ 		rc = fdisk_script_read_line(dp, stdin, buf, sizeof(buf));
+-		if (rc < 0) {
++		if (rc == -ENOTSUP) {
++			buf[sizeof(buf) - 1] = '\0';
++			fdisk_warnx(sf->cxt, _("Unknown script header '%s' -- ignore."), buf);
++			continue;
++		} else if (rc < 0) {
+ 			DBG(PARSE, ul_debug("script parsing failed, trying sfdisk specific commands"));
+ 			buf[sizeof(buf) - 1] = '\0';
+ 			rc = loop_control_commands(sf, dp, buf);
+diff --git a/libfdisk/src/script.c b/libfdisk/src/script.c
+index a21771b..d3e67fa 100644
+--- a/libfdisk/src/script.c
++++ b/libfdisk/src/script.c
+@@ -805,8 +805,12 @@ static inline int is_header_line(const char *s)
+ /* parses "<name>: value", note modifies @s*/
+ static int parse_line_header(struct fdisk_script *dp, char *s)
+ {
+-	int rc = -EINVAL;
++	size_t i;
+ 	char *name, *value;
++	static const char *supported[] = {
++		"label", "unit", "label-id", "device", "grain",
++		"first-lba", "last-lba", "table-length", "sector-size"
++	};
+ 
+ 	DBG(SCRIPT, ul_debugobj(dp, "   parse header '%s'", s));
+ 
+@@ -816,7 +820,7 @@ static int parse_line_header(struct fdisk_script *dp, char *s)
+ 	name = s;
+ 	value = strchr(s, ':');
+ 	if (!value)
+-		goto done;
++		return -EINVAL;
+ 	*value = '\0';
+ 	value++;
+ 
+@@ -825,32 +829,30 @@ static int parse_line_header(struct fdisk_script *dp, char *s)
+ 	ltrim_whitespace((unsigned char *) value);
+ 	rtrim_whitespace((unsigned char *) value);
+ 
++	if (!*name || !*value)
++		return -EINVAL;
++
++	/* check header name */
++	for (i = 0; i < ARRAY_SIZE(supported); i++) {
++		if (strcmp(name, supported[i]) == 0)
++			break;
++	}
++	if (i == ARRAY_SIZE(supported))
++		return -ENOTSUP;
++
++	/* header specific actions */
+ 	if (strcmp(name, "label") == 0) {
+ 		if (dp->cxt && !fdisk_get_label(dp->cxt, value))
+-			goto done;			/* unknown label name */
++			return -EINVAL;			/* unknown label name */
+ 		dp->force_label = 1;
++
+ 	} else if (strcmp(name, "unit") == 0) {
+ 		if (strcmp(value, "sectors") != 0)
+-			goto done;			/* only "sectors" supported */
+-	} else if (strcmp(name, "label-id") == 0
+-		   || strcmp(name, "device") == 0
+-		   || strcmp(name, "grain") == 0
+-		   || strcmp(name, "first-lba") == 0
+-		   || strcmp(name, "last-lba") == 0
+-		   || strcmp(name, "table-length") == 0) {
+-		;					/* whatever is possible */
+-	} else
+-		goto done;				/* unknown header */
++			return -EINVAL;			/* only "sectors" supported */
+ 
+-	if (*name && *value)
+-		rc = fdisk_script_set_header(dp, name, value);
+-done:
+-	if (rc)
+-		DBG(SCRIPT, ul_debugobj(dp, "header parse error: "
+-				"[rc=%d, name='%s', value='%s']",
+-				rc, name, value));
+-	return rc;
++	}
+ 
++	return fdisk_script_set_header(dp, name, value);
+ }
+ 
+ /* returns zero terminated string with next token and @str is updated */
+@@ -1363,7 +1365,8 @@ int fdisk_script_set_fgets(struct fdisk_script *dp,
+  *
+  * Reads next line into dump.
+  *
+- * Returns: 0 on success, <0 on error, 1 when nothing to read.
++ * Returns: 0 on success, <0 on error, 1 when nothing to read. For unknown headers
++ *          returns -ENOTSUP, it's usually safe to ignore this error.
+  */
+ int fdisk_script_read_line(struct fdisk_script *dp, FILE *f, char *buf, size_t bufsz)
+ {
+@@ -1428,7 +1431,7 @@ int fdisk_script_read_file(struct fdisk_script *dp, FILE *f)
+ 
+ 	while (!feof(f)) {
+ 		rc = fdisk_script_read_line(dp, f, buf, sizeof(buf));
+-		if (rc)
++		if (rc && rc != -ENOTSUP)
+ 			break;
+ 	}
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/util-linux/util-linux/0001-lsblk-force-to-print-PKNAME-for-partition.patch b/meta/recipes-core/util-linux/util-linux/0001-lsblk-force-to-print-PKNAME-for-partition.patch
deleted file mode 100644
index 5d4c148..0000000
--- a/meta/recipes-core/util-linux/util-linux/0001-lsblk-force-to-print-PKNAME-for-partition.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From e3bb9bfb76c17b1d05814436ced62c05c4011f48 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Thu, 27 Jun 2019 09:22:18 +0200
-Subject: [PATCH] lsblk: force to print PKNAME for partition
-
-PKNAME (parent kernel device name) is based on printed tree according
-to parent -> child relationship. The tree is optional and not printed
-if partition specified (.e.g "lsblk -o+PKNAME /dev/sda1"), but old
-versions print the PKNAME also in this case.
-
-Upstream-Status: Backport [https://github.com/karelzak/util-linux/commit/e3bb9bfb76c17b1d05814436ced62c05c4011f48]
-
-Addresses: https://github.com/karelzak/util-linux/issues/813
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Signed-off-by: Liwei Song <liwei.song@windriver.com>
----
- misc-utils/lsblk.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/misc-utils/lsblk.c b/misc-utils/lsblk.c
-index e95af7af0256..3ce6da730264 100644
---- a/misc-utils/lsblk.c
-+++ b/misc-utils/lsblk.c
-@@ -1019,6 +1019,9 @@ static void device_to_scols(
- 	DBG(DEV, ul_debugobj(dev, "add '%s' to scols", dev->name));
- 	ON_DBG(DEV, if (ul_path_isopen_dirfd(dev->sysfs)) ul_debugobj(dev, " %s ---> is open!", dev->name));
- 
-+	if (!parent && dev->wholedisk)
-+		parent = dev->wholedisk;
-+
- 	/* Do not print device more than one in --list mode */
- 	if (!(lsblk->flags & LSBLK_TREE) && dev->is_printed)
- 		return;
--- 
-2.17.1
-
diff --git a/meta/recipes-core/util-linux/util-linux_2.34.bb b/meta/recipes-core/util-linux/util-linux_2.34.bb
deleted file mode 100644
index 557449d..0000000
--- a/meta/recipes-core/util-linux/util-linux_2.34.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require util-linux.inc
-
-SRC_URI += "file://configure-sbindir.patch \
-            file://runuser.pamd \
-            file://runuser-l.pamd \
-            file://ptest.patch \
-            file://run-ptest \
-            file://display_testname_for_subtest.patch \
-            file://avoid_parallel_tests.patch \
-            file://0001-lsblk-force-to-print-PKNAME-for-partition.patch \
-            file://0001-hwclock-fix-for-glibc-2.31-settimeofday.patch \
-"
-SRC_URI[md5sum] = "a78cbeaed9c39094b96a48ba8f891d50"
-SRC_URI[sha256sum] = "743f9d0c7252b6db246b659c1e1ce0bd45d8d4508b4dfa427bbb4a3e9b9f62b5"
diff --git a/meta/recipes-core/util-linux/util-linux_2.35.1.bb b/meta/recipes-core/util-linux/util-linux_2.35.1.bb
new file mode 100644
index 0000000..51964c9
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux_2.35.1.bb
@@ -0,0 +1,14 @@
+require util-linux.inc
+
+SRC_URI += "file://configure-sbindir.patch \
+            file://runuser.pamd \
+            file://runuser-l.pamd \
+            file://ptest.patch \
+            file://run-ptest \
+            file://display_testname_for_subtest.patch \
+            file://avoid_parallel_tests.patch \
+            file://0001-hwclock-fix-for-glibc-2.31-settimeofday.patch \
+            file://0001-libfdisk-script-accept-sector-size-ignore-unknown-he.patch \
+"
+SRC_URI[md5sum] = "7f64882f631225f0295ca05080cee1bf"
+SRC_URI[sha256sum] = "d9de3edd287366cd908e77677514b9387b22bc7b88f45b83e1922c3597f1d7f9"
-- 
2.7.4


