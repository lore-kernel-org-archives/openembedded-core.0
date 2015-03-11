Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDB6B73ABF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 06:46:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2B6kvPd028701
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 23:46:57 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 10 Mar 2015 23:46:57 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Mar 2015 14:47:08 +0800
Message-ID: <49e8d2c378b1eb379152fa7ffa1bed1435cc6834.1426056350.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1426056350.git.Qi.Chen@windriver.com>
References: <cover.1426056350.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] util-linux: fix CVE-2014-9114
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
X-List-Received-Date: Wed, 11 Mar 2015 06:46:59 -0000
Content-Type: text/plain

Backport a patch to fix CVE-2014-9114.
The patch has been integrated in util-linux-2.26.

[YOCTO #7180]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../util-linux/util-linux/CVE-2014-9114.patch      | 174 +++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.25.2.bb  |   1 +
 2 files changed, 175 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2014-9114.patch

diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2014-9114.patch b/meta/recipes-core/util-linux/util-linux/CVE-2014-9114.patch
new file mode 100644
index 0000000..5eaa08d
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2014-9114.patch
@@ -0,0 +1,174 @@
+Upstream-Status: Backport
+
+This patch is for CVE-2014-9114.
+This patch should be removed once util-linux is upgraded to 2.26.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+From 89e90ae7b2826110ea28c1c0eb8e7c56c3907bdc Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 27 Nov 2014 13:39:35 +0100
+Subject: [PATCH] libblkid: care about unsafe chars in cache
+
+The high-level libblkid API uses /run/blkid/blkid.tab cache to
+store probing results. The cache format is
+
+   <device NAME="value" ...>devname</device>
+
+and unfortunately the cache code does not escape quotation marks:
+
+   # mkfs.ext4 -L 'AAA"BBB'
+
+   # cat /run/blkid/blkid.tab
+   ...
+   <device ... LABEL="AAA"BBB" ...>/dev/sdb1</device>
+
+such string is later incorrectly parsed and blkid(8) returns
+nonsenses. And for use-cases like
+
+   # eval $(blkid -o export /dev/sdb1)
+
+it's also insecure.
+
+Note that mount, udevd and blkid -p are based on low-level libblkid
+API, it bypass the cache and directly read data from the devices.
+
+The current udevd upstream does not depend on blkid(8) output at all,
+it's directly linked with the library and all unsafe chars are encoded by
+\x<hex> notation.
+
+   # mkfs.ext4 -L 'X"`/tmp/foo` "' /dev/sdb1
+   # udevadm info --export-db | grep LABEL
+   ...
+   E: ID_FS_LABEL=X__/tmp/foo___
+   E: ID_FS_LABEL_ENC=X\x22\x60\x2ftmp\x2ffoo\x60\x20\x22
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ libblkid/src/read.c | 21 ++++++++++++++++++---
+ libblkid/src/save.c | 22 +++++++++++++++++++++-
+ misc-utils/blkid.8  |  5 ++++-
+ misc-utils/blkid.c  |  4 ++--
+ 4 files changed, 45 insertions(+), 7 deletions(-)
+
+diff --git a/libblkid/src/read.c b/libblkid/src/read.c
+index 0e91c9c..81ab0df 100644
+--- a/libblkid/src/read.c
++++ b/libblkid/src/read.c
+@@ -252,15 +252,30 @@ static int parse_token(char **name, char **value, char **cp)
+ 	*value = skip_over_blank(*value + 1);
+ 
+ 	if (**value == '"') {
+-		end = strchr(*value + 1, '"');
+-		if (!end) {
++		char *p = end = *value + 1;
++
++		/* convert 'foo\"bar'  to 'foo"bar' */
++		while (*p) {
++			if (*p == '\\') {
++				p++;
++				*end = *p;
++			} else {
++				*end = *p;
++				if (*p == '"')
++					break;
++			}
++			p++;
++			end++;
++		}
++
++		if (*end != '"') {
+ 			DBG(READ, ul_debug("unbalanced quotes at: %s", *value));
+ 			*cp = *value;
+ 			return -BLKID_ERR_CACHE;
+ 		}
+ 		(*value)++;
+ 		*end = '\0';
+-		end++;
++		end = ++p;
+ 	} else {
+ 		end = skip_over_word(*value);
+ 		if (*end) {
+diff --git a/libblkid/src/save.c b/libblkid/src/save.c
+index 8216f09..5e8bbee 100644
+--- a/libblkid/src/save.c
++++ b/libblkid/src/save.c
+@@ -26,6 +26,21 @@
+ 
+ #include "blkidP.h"
+ 
++
++static void save_quoted(const char *data, FILE *file)
++{
++	const char *p;
++
++	fputc('"', file);
++	for (p = data; p && *p; p++) {
++		if ((unsigned char) *p == 0x22 ||		/* " */
++		    (unsigned char) *p == 0x5c)			/* \ */
++			fputc('\\', file);
++
++		fputc(*p, file);
++	}
++	fputc('"', file);
++}
+ static int save_dev(blkid_dev dev, FILE *file)
+ {
+ 	struct list_head *p;
+@@ -43,9 +58,14 @@ static int save_dev(blkid_dev dev, FILE *file)
+ 
+ 	if (dev->bid_pri)
+ 		fprintf(file, " PRI=\"%d\"", dev->bid_pri);
++
+ 	list_for_each(p, &dev->bid_tags) {
+ 		blkid_tag tag = list_entry(p, struct blkid_struct_tag, bit_tags);
+-		fprintf(file, " %s=\"%s\"", tag->bit_name,tag->bit_val);
++
++		fputc(' ', file);			/* space between tags */
++		fputs(tag->bit_name, file);		/* tag NAME */
++		fputc('=', file);			/* separator between NAME and VALUE */
++		save_quoted(tag->bit_val, file);	/* tag "VALUE" */
+ 	}
+ 	fprintf(file, ">%s</device>\n", dev->bid_name);
+ 
+diff --git a/misc-utils/blkid.8 b/misc-utils/blkid.8
+index 156a14b..c95b833 100644
+--- a/misc-utils/blkid.8
++++ b/misc-utils/blkid.8
+@@ -200,7 +200,10 @@ partitions.  This output format is \fBDEPRECATED\fR.
+ .TP
+ .B export
+ print key=value pairs for easy import into the environment; this output format
+-is automatically enabled when I/O Limits (\fB-i\fR option) are requested
++is automatically enabled when I/O Limits (\fB-i\fR option) are requested.
++
++The non-printing characters are encoded by ^ and M- notation and all
++potentially unsafe characters are escaped.
+ .RE
+ .TP
+ .BI \-O " offset"
+diff --git a/misc-utils/blkid.c b/misc-utils/blkid.c
+index a6ca660..1bd8646 100644
+--- a/misc-utils/blkid.c
++++ b/misc-utils/blkid.c
+@@ -306,7 +306,7 @@ static void print_value(int output, int num, const char *devname,
+ 			printf("DEVNAME=%s\n", devname);
+ 		fputs(name, stdout);
+ 		fputs("=", stdout);
+-		safe_print(value, valsz, NULL);
++		safe_print(value, valsz, " \\\"'$`<>");
+ 		fputs("\n", stdout);
+ 
+ 	} else {
+@@ -315,7 +315,7 @@ static void print_value(int output, int num, const char *devname,
+ 		fputs(" ", stdout);
+ 		fputs(name, stdout);
+ 		fputs("=\"", stdout);
+-		safe_print(value, valsz, "\"");
++		safe_print(value, valsz, "\"\\");
+ 		fputs("\"", stdout);
+ 	}
+ }
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/util-linux/util-linux_2.25.2.bb b/meta/recipes-core/util-linux/util-linux_2.25.2.bb
index 697b900..0ff1e7c 100644
--- a/meta/recipes-core/util-linux/util-linux_2.25.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.25.2.bb
@@ -14,6 +14,7 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://uclibc-__progname-conflict.patch \
             file://configure-sbindir.patch \
             file://fix-parallel-build.patch \
+            file://CVE-2014-9114.patch \
             ${OLDHOST} \
 "
 
-- 
1.9.1


