Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 23E157D718
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 13:11:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44z0PP5W6Bz60
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 15:11:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557234713;
	bh=XeHpXrcp/uYAlb1HHaBd+1IK5cAH5fyaTRiXCzPa1Jc=;
	h=From:To:Subject:Date:From;
	b=f9pVkIHg12b9ONRM7yseA63QMp2N9pXfCGZ+oXA3ZOJ+ouj7o+9CfmA3a7FbTY0en
	+wthq5/wViwtBqFZR9Nn10pY4mAOPrmTOfxDfV/MTFhRtQF/yvH7Q65MIwgfELlDoH
	PZR130BpS8UKc/v1kxts+OckimEYZa50jksa6bm6p/ugMnJcPmOuw3aci6WVJbFCFq
	HadGBW9eM/qoZw3+221tuHzujjFpMShyPkqwP5YLmYzz1C9MKgOC5ywOlznH2nMkzg
	h6S6vXXA89c7tmiio2laNyg1ErOBVtFwhEFcCkiaoVUGsVBXG8oO82KeftgCngf5Xj
	eYI0qqD2VqCI2S+wrev99CicZxk1XAUJOkksaN4EvbhNTtdcXlgAB1YewS/PTSg8zf
	DXmh7stK0t5uAXLxwTlcPZZlnYOGH5HXVmI9AyGKSboXIeBNdAbJmIz0dlD5wr2xl0
	UHg2D8rspkPdBw649nAH9saTUxVqP9tSzbHRUAtAs7Un9SoSUKUj9u2IDYbH0j4DuV
	ayV+KT2iQAeTTbIYxhfb5Oo8B0Xc6SYofLESQwihnaRMKDio87ur3UTV3v4UP8IRK0
	s8IUg6sn67l9NViflQ5cVBt3W+5WWzfV7B/pRLipUsYK31S1wQPqQ2rWI3MbAidJAQ
	Qd8NY4q2EtzWmnr/09UBMylU=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2019 16:11:45 +0300
Message-Id: <20190507131151.31070-6-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] ccache: upgrade 3.6 -> 3.7.1
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
X-List-Received-Date: Tue, 07 May 2019 13:11:53 -0000

Remove backported patches.
Switch to new download location.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/ccache/ccache.inc       |  2 +-
 meta/recipes-devtools/ccache/ccache_3.6.bb    | 12 ---
 meta/recipes-devtools/ccache/ccache_3.7.1.bb  |  7 ++
 ...002-dev.mk.in-fix-file-name-too-long.patch | 30 -------
 ...tion-fault-error-when-gcc-o-dev-null.patch | 79 -------------------
 5 files changed, 8 insertions(+), 122 deletions(-)
 delete mode 100644 meta/recipes-devtools/ccache/ccache_3.6.bb
 create mode 100644 meta/recipes-devtools/ccache/ccache_3.7.1.bb
 delete mode 100644 meta/recipes-devtools/ccache/files/0002-dev.mk.in-fix-file-name-too-long.patch
 delete mode 100644 meta/recipes-devtools/ccache/files/0003-Fix-Segmentation-fault-error-when-gcc-o-dev-null.patch

diff --git a/meta/recipes-devtools/ccache/ccache.inc b/meta/recipes-devtools/ccache/ccache.inc
index 7f800659a3..e8676437fb 100644
--- a/meta/recipes-devtools/ccache/ccache.inc
+++ b/meta/recipes-devtools/ccache/ccache.inc
@@ -9,7 +9,7 @@ LICENSE = "GPLv3+"
 
 DEPENDS = "zlib"
 
-SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz"
+SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.xz"
 
 inherit autotools
 
diff --git a/meta/recipes-devtools/ccache/ccache_3.6.bb b/meta/recipes-devtools/ccache/ccache_3.6.bb
deleted file mode 100644
index 60807be0ae..0000000000
--- a/meta/recipes-devtools/ccache/ccache_3.6.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ccache.inc
-
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=70762511f9c509cc2a4e4ba2ef687ae3"
-
-SRC_URI[md5sum] = "bd6fd69db28426baf22ec0acdd5c4b2a"
-SRC_URI[sha256sum] = "a3f2b91a2353b65a863c5901251efe48060ecdebec46b5eaec8ea8e092b9e871"
-
-SRC_URI += " \
-            file://0002-dev.mk.in-fix-file-name-too-long.patch \
-            file://0003-Fix-Segmentation-fault-error-when-gcc-o-dev-null.patch \
-"
diff --git a/meta/recipes-devtools/ccache/ccache_3.7.1.bb b/meta/recipes-devtools/ccache/ccache_3.7.1.bb
new file mode 100644
index 0000000000..d2bd7ac903
--- /dev/null
+++ b/meta/recipes-devtools/ccache/ccache_3.7.1.bb
@@ -0,0 +1,7 @@
+require ccache.inc
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=0094c59039cec66b8a4c905204333514"
+
+SRC_URI[md5sum] = "30f5f6fa06a95bba94695e8fa6a05899"
+SRC_URI[sha256sum] = "66fc121a2a33968f9ec428e02f48ff4b8896fbabb759e9c09352267014dcbe65"
diff --git a/meta/recipes-devtools/ccache/files/0002-dev.mk.in-fix-file-name-too-long.patch b/meta/recipes-devtools/ccache/files/0002-dev.mk.in-fix-file-name-too-long.patch
deleted file mode 100644
index 16a6e9d80f..0000000000
--- a/meta/recipes-devtools/ccache/files/0002-dev.mk.in-fix-file-name-too-long.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7dab2995ed8eeccd7b0acd79668bc28f3a2427d5 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Wed, 16 Sep 2015 19:45:40 -0700
-Subject: [PATCH] dev.mk.in: fix file name too long error
-
-The all_cppflags changes path to filename which causes file name too long
-error when the path is longer than NAME_MAX (usually 255). Strip srcdir
-to fix the problem.
-
-Upstream-Status: Backport [https://github.com/ccache/ccache/commit/4d86e884d07ba1853a0c70507cc4d04107f57c29]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
----
- dev.mk.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dev.mk.in b/dev.mk.in
-index 91b0a57..583ade0 100644
---- a/dev.mk.in
-+++ b/dev.mk.in
-@@ -1,7 +1,7 @@
- # GNU make syntax reigns in this file.
- 
- all_cflags += -Werror @more_warnings@
--all_cppflags += -MD -MP -MF .deps/$(subst .._,,$(subst /,_,$<)).d
-+all_cppflags += -MD -MP -MF .deps/$(subst .._,,$(subst /,_,$(subst $(srcdir)/,,$<))).d
- 
- A2X = a2x
- ASCIIDOC = asciidoc
diff --git a/meta/recipes-devtools/ccache/files/0003-Fix-Segmentation-fault-error-when-gcc-o-dev-null.patch b/meta/recipes-devtools/ccache/files/0003-Fix-Segmentation-fault-error-when-gcc-o-dev-null.patch
deleted file mode 100644
index b3012b7e89..0000000000
--- a/meta/recipes-devtools/ccache/files/0003-Fix-Segmentation-fault-error-when-gcc-o-dev-null.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From c51b63758e95247e3c1e2f06e5f5bfb49849e66d Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Tue, 22 Jan 2019 16:30:52 +0800
-Subject: [PATCH] Fix Segmentation fault error when gcc -o /dev/null
-
-Fixed:
-$ export CCACHE_DEBUG=1
-$ ccache gcc -c hello.c -o /dev/null
-
-Segmentation fault (core dumped)
-
-This is because failed to open /dev/null.foo (Permission denied), check file
-stream before write to it can fix the problem.
-
-Upstream-Status: Backport [https://github.com/ccache/ccache/commit/4d86e884d07ba1853a0c70507cc4d04107f57c29]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- src/ccache.c | 15 ++++++++++++---
- src/util.c   |  8 ++++++--
- 2 files changed, 18 insertions(+), 5 deletions(-)
-
-diff --git a/src/ccache.c b/src/ccache.c
-index b4cdb86..8c227df 100644
---- a/src/ccache.c
-+++ b/src/ccache.c
-@@ -521,9 +521,13 @@ init_hash_debug(struct hash *hash, const char *obj_path, char type,
- 
- 	char *path = format("%s.ccache-input-%c", obj_path, type);
- 	FILE *debug_binary_file = fopen(path, "wb");
--	hash_enable_debug(hash, section_name, debug_binary_file, debug_text_file);
-+	if (debug_binary_file) {
-+		hash_enable_debug(hash, section_name, debug_binary_file, debug_text_file);
-+		exitfn_add(fclose_exitfn, debug_binary_file);
-+	} else {
-+		cc_log("Failed to open %s: %s", path, strerror(errno));
-+	}
- 	free(path);
--	exitfn_add(fclose_exitfn, debug_binary_file);
- }
- 
- static enum guessed_compiler
-@@ -3670,8 +3674,13 @@ ccache(int argc, char *argv[])
- 	if (conf->debug) {
- 		char *path = format("%s.ccache-input-text", output_obj);
- 		debug_text_file = fopen(path, "w");
-+		if (debug_text_file) {
-+			exitfn_add(fclose_exitfn, debug_text_file);
-+		}
-+		else {
-+			cc_log("Failed to open %s: %s", path, strerror(errno));
-+		}
- 		free(path);
--		exitfn_add(fclose_exitfn, debug_text_file);
- 	}
- 
- 	struct hash *common_hash = hash_init();
-diff --git a/src/util.c b/src/util.c
-index e442cc4..a49fb4c 100644
---- a/src/util.c
-+++ b/src/util.c
-@@ -219,8 +219,12 @@ void
- cc_dump_log_buffer(const char *path)
- {
- 	FILE *file = fopen(path, "w");
--	(void) fwrite(logbuffer, 1, logsize, file);
--	fclose(file);
-+	if (file) {
-+		(void) fwrite(logbuffer, 1, logsize, file);
-+		fclose(file);
-+	} else {
-+		cc_log("Failed to open %s: %s", path, strerror(errno));
-+	}
- }
- 
- // Something went badly wrong!
--- 
-2.7.4
-
-- 
2.17.1


