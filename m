Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id F2E4C73C3F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 17:37:08 +0000 (UTC)
Received: by iebrs15 with SMTP id rs15so26645385ieb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 10:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=fKzBRmH9kSwm/fn4f0E9jx7s+f9TwX6quNpa/FIWS6A=;
	b=LQbvIcWSNYpxuIHX3GgSL2OfvZ6H8y0/58oNozPrdFXBG8CaQRGmA9j3AhpBuvS3LU
	zHtzAb7qoAPiOpRB0rdOGWe1JFYZzVRqxJFjjyoZKV+WwbAfKlcFfBIn8K1yc7NBKnYb
	xAFe7649h/395zVSt4HbLMeAkfy2eGWiFFDIKijZiQTCgLThm3dK1rwIIFF86HrK3Rue
	uf142ueTi6SZ7UZ+dVKoLqJXM09v4hzpwKy+nktMGL+5qsOloTl7fT1t/EnoMgh76J1o
	dwp92fdRr8hsty1NAvuTUEIuLRHAyq2XqCxv5jqcRoSEo4KZnERP4rk6FpGThQMh7oS5
	uDOQ==
X-Received: by 10.50.126.33 with SMTP id mv1mr25389341igb.27.1428341830152;
	Mon, 06 Apr 2015 10:37:10 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id 7sm3063135iol.43.2015.04.06.10.37.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 10:37:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 17:36:39 +0000
Message-Id: <d05f95d3f298d5b3f1e6fbab2c36026302681e7c.1428341478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
References: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428341477.git.raj.khem@gmail.com>
References: <cover.1428341477.git.raj.khem@gmail.com>
Subject: [PATCH 11/24] util-linux: Upgrade to 2.26
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
X-List-Received-Date: Mon, 06 Apr 2015 17:37:10 -0000

Drop backports

Change-Id: I94d442edaf37ab8e685670f0e14ed60031a995fa
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../util-linux/util-linux/CVE-2014-9114.patch      | 174 ---------------------
 .../{util-linux_2.25.2.bb => util-linux_2.26.1.bb} |  15 +-
 2 files changed, 7 insertions(+), 182 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2014-9114.patch
 rename meta/recipes-core/util-linux/{util-linux_2.25.2.bb => util-linux_2.26.1.bb} (66%)

diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2014-9114.patch b/meta/recipes-core/util-linux/util-linux/CVE-2014-9114.patch
deleted file mode 100644
index 5eaa08d..0000000
--- a/meta/recipes-core/util-linux/util-linux/CVE-2014-9114.patch
+++ /dev/null
@@ -1,174 +0,0 @@
-Upstream-Status: Backport
-
-This patch is for CVE-2014-9114.
-This patch should be removed once util-linux is upgraded to 2.26.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
-From 89e90ae7b2826110ea28c1c0eb8e7c56c3907bdc Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Thu, 27 Nov 2014 13:39:35 +0100
-Subject: [PATCH] libblkid: care about unsafe chars in cache
-
-The high-level libblkid API uses /run/blkid/blkid.tab cache to
-store probing results. The cache format is
-
-   <device NAME="value" ...>devname</device>
-
-and unfortunately the cache code does not escape quotation marks:
-
-   # mkfs.ext4 -L 'AAA"BBB'
-
-   # cat /run/blkid/blkid.tab
-   ...
-   <device ... LABEL="AAA"BBB" ...>/dev/sdb1</device>
-
-such string is later incorrectly parsed and blkid(8) returns
-nonsenses. And for use-cases like
-
-   # eval $(blkid -o export /dev/sdb1)
-
-it's also insecure.
-
-Note that mount, udevd and blkid -p are based on low-level libblkid
-API, it bypass the cache and directly read data from the devices.
-
-The current udevd upstream does not depend on blkid(8) output at all,
-it's directly linked with the library and all unsafe chars are encoded by
-\x<hex> notation.
-
-   # mkfs.ext4 -L 'X"`/tmp/foo` "' /dev/sdb1
-   # udevadm info --export-db | grep LABEL
-   ...
-   E: ID_FS_LABEL=X__/tmp/foo___
-   E: ID_FS_LABEL_ENC=X\x22\x60\x2ftmp\x2ffoo\x60\x20\x22
-
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- libblkid/src/read.c | 21 ++++++++++++++++++---
- libblkid/src/save.c | 22 +++++++++++++++++++++-
- misc-utils/blkid.8  |  5 ++++-
- misc-utils/blkid.c  |  4 ++--
- 4 files changed, 45 insertions(+), 7 deletions(-)
-
-diff --git a/libblkid/src/read.c b/libblkid/src/read.c
-index 0e91c9c..81ab0df 100644
---- a/libblkid/src/read.c
-+++ b/libblkid/src/read.c
-@@ -252,15 +252,30 @@ static int parse_token(char **name, char **value, char **cp)
- 	*value = skip_over_blank(*value + 1);
- 
- 	if (**value == '"') {
--		end = strchr(*value + 1, '"');
--		if (!end) {
-+		char *p = end = *value + 1;
-+
-+		/* convert 'foo\"bar'  to 'foo"bar' */
-+		while (*p) {
-+			if (*p == '\\') {
-+				p++;
-+				*end = *p;
-+			} else {
-+				*end = *p;
-+				if (*p == '"')
-+					break;
-+			}
-+			p++;
-+			end++;
-+		}
-+
-+		if (*end != '"') {
- 			DBG(READ, ul_debug("unbalanced quotes at: %s", *value));
- 			*cp = *value;
- 			return -BLKID_ERR_CACHE;
- 		}
- 		(*value)++;
- 		*end = '\0';
--		end++;
-+		end = ++p;
- 	} else {
- 		end = skip_over_word(*value);
- 		if (*end) {
-diff --git a/libblkid/src/save.c b/libblkid/src/save.c
-index 8216f09..5e8bbee 100644
---- a/libblkid/src/save.c
-+++ b/libblkid/src/save.c
-@@ -26,6 +26,21 @@
- 
- #include "blkidP.h"
- 
-+
-+static void save_quoted(const char *data, FILE *file)
-+{
-+	const char *p;
-+
-+	fputc('"', file);
-+	for (p = data; p && *p; p++) {
-+		if ((unsigned char) *p == 0x22 ||		/* " */
-+		    (unsigned char) *p == 0x5c)			/* \ */
-+			fputc('\\', file);
-+
-+		fputc(*p, file);
-+	}
-+	fputc('"', file);
-+}
- static int save_dev(blkid_dev dev, FILE *file)
- {
- 	struct list_head *p;
-@@ -43,9 +58,14 @@ static int save_dev(blkid_dev dev, FILE *file)
- 
- 	if (dev->bid_pri)
- 		fprintf(file, " PRI=\"%d\"", dev->bid_pri);
-+
- 	list_for_each(p, &dev->bid_tags) {
- 		blkid_tag tag = list_entry(p, struct blkid_struct_tag, bit_tags);
--		fprintf(file, " %s=\"%s\"", tag->bit_name,tag->bit_val);
-+
-+		fputc(' ', file);			/* space between tags */
-+		fputs(tag->bit_name, file);		/* tag NAME */
-+		fputc('=', file);			/* separator between NAME and VALUE */
-+		save_quoted(tag->bit_val, file);	/* tag "VALUE" */
- 	}
- 	fprintf(file, ">%s</device>\n", dev->bid_name);
- 
-diff --git a/misc-utils/blkid.8 b/misc-utils/blkid.8
-index 156a14b..c95b833 100644
---- a/misc-utils/blkid.8
-+++ b/misc-utils/blkid.8
-@@ -200,7 +200,10 @@ partitions.  This output format is \fBDEPRECATED\fR.
- .TP
- .B export
- print key=value pairs for easy import into the environment; this output format
--is automatically enabled when I/O Limits (\fB-i\fR option) are requested
-+is automatically enabled when I/O Limits (\fB-i\fR option) are requested.
-+
-+The non-printing characters are encoded by ^ and M- notation and all
-+potentially unsafe characters are escaped.
- .RE
- .TP
- .BI \-O " offset"
-diff --git a/misc-utils/blkid.c b/misc-utils/blkid.c
-index a6ca660..1bd8646 100644
---- a/misc-utils/blkid.c
-+++ b/misc-utils/blkid.c
-@@ -306,7 +306,7 @@ static void print_value(int output, int num, const char *devname,
- 			printf("DEVNAME=%s\n", devname);
- 		fputs(name, stdout);
- 		fputs("=", stdout);
--		safe_print(value, valsz, NULL);
-+		safe_print(value, valsz, " \\\"'$`<>");
- 		fputs("\n", stdout);
- 
- 	} else {
-@@ -315,7 +315,7 @@ static void print_value(int output, int num, const char *devname,
- 		fputs(" ", stdout);
- 		fputs(name, stdout);
- 		fputs("=\"", stdout);
--		safe_print(value, valsz, "\"");
-+		safe_print(value, valsz, "\"\\");
- 		fputs("\"", stdout);
- 	}
- }
--- 
-1.9.1
-
diff --git a/meta/recipes-core/util-linux/util-linux_2.25.2.bb b/meta/recipes-core/util-linux/util-linux_2.26.1.bb
similarity index 66%
rename from meta/recipes-core/util-linux/util-linux_2.25.2.bb
rename to meta/recipes-core/util-linux/util-linux_2.26.1.bb
index 0ff1e7c..58bc90d 100644
--- a/meta/recipes-core/util-linux/util-linux_2.25.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.26.1.bb
@@ -1,6 +1,5 @@
-MAJOR_VERSION = "2.25"
+MAJOR_VERSION = "2.26"
 require util-linux.inc
-PR = "r1"
 
 # To support older hosts, we need to patch and/or revert
 # some upstream changes.  Only do this for native packages.
@@ -14,18 +13,18 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://uclibc-__progname-conflict.patch \
             file://configure-sbindir.patch \
             file://fix-parallel-build.patch \
-            file://CVE-2014-9114.patch \
             ${OLDHOST} \
 "
-
-SRC_URI[md5sum] = "cab3d7be354000f629bc601238b629b3"
-SRC_URI[sha256sum] = "e0457f715b73f4a349e1acb08cb410bf0edc9a74a3f75c357070f31f70e33cd6"
+SRC_URI[md5sum] = "2308850946766677f3fabe0685e85de8"
+SRC_URI[sha256sum] = "22dc1c957262e2cbdfb4d524a63d5cd4f219d3ac9b5eab570fc771076799bb6e"
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
 
 EXTRA_OECONF_class-native = "${SHARED_EXTRA_OECONF} \
-                             --disable-fallocate --disable-use-tty-group \
+                             --disable-fallocate \
+			     --disable-use-tty-group \
 "
 EXTRA_OECONF_class-nativesdk = "${SHARED_EXTRA_OECONF} \
-                                --disable-fallocate --disable-use-tty-group \
+                                --disable-fallocate \
+				--disable-use-tty-group \
 "
-- 
2.1.4


