Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 947DE7BFAA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 06:40:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0O6dkia000809
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 22:40:06 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 23 Jan 2019 22:39:57 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jan 2019 14:57:32 +0800
Message-ID: <6f03b31c431bed8c7d6fa3e788c725d2c73f3976.1548312985.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1548312985.git.liezhi.yang@windriver.com>
References: <cover.1548312985.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] ccache: Fix Segmentation fault error when gcc -o /dev/null
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
X-List-Received-Date: Thu, 24 Jan 2019 06:40:15 -0000
Content-Type: text/plain

Fixed:
$ export CCACHE_DEBUG=1
$ ccache gcc -c hello.c -o /dev/null

Segmentation fault (core dumped)

This is because failed to open /dev/null.foo (Permission denied), check file
stream before write to it can fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/ccache/ccache_3.6.bb         |  1 +
 ...mentation-fault-error-when-gcc-o-dev-null.patch | 79 ++++++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-devtools/ccache/files/0003-Fix-Segmentation-fault-error-when-gcc-o-dev-null.patch

diff --git a/meta/recipes-devtools/ccache/ccache_3.6.bb b/meta/recipes-devtools/ccache/ccache_3.6.bb
index a12306e..60807be 100644
--- a/meta/recipes-devtools/ccache/ccache_3.6.bb
+++ b/meta/recipes-devtools/ccache/ccache_3.6.bb
@@ -8,4 +8,5 @@ SRC_URI[sha256sum] = "a3f2b91a2353b65a863c5901251efe48060ecdebec46b5eaec8ea8e092
 
 SRC_URI += " \
             file://0002-dev.mk.in-fix-file-name-too-long.patch \
+            file://0003-Fix-Segmentation-fault-error-when-gcc-o-dev-null.patch \
 "
diff --git a/meta/recipes-devtools/ccache/files/0003-Fix-Segmentation-fault-error-when-gcc-o-dev-null.patch b/meta/recipes-devtools/ccache/files/0003-Fix-Segmentation-fault-error-when-gcc-o-dev-null.patch
new file mode 100644
index 0000000..b3012b7
--- /dev/null
+++ b/meta/recipes-devtools/ccache/files/0003-Fix-Segmentation-fault-error-when-gcc-o-dev-null.patch
@@ -0,0 +1,79 @@
+From c51b63758e95247e3c1e2f06e5f5bfb49849e66d Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 22 Jan 2019 16:30:52 +0800
+Subject: [PATCH] Fix Segmentation fault error when gcc -o /dev/null
+
+Fixed:
+$ export CCACHE_DEBUG=1
+$ ccache gcc -c hello.c -o /dev/null
+
+Segmentation fault (core dumped)
+
+This is because failed to open /dev/null.foo (Permission denied), check file
+stream before write to it can fix the problem.
+
+Upstream-Status: Backport [https://github.com/ccache/ccache/commit/4d86e884d07ba1853a0c70507cc4d04107f57c29]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ src/ccache.c | 15 ++++++++++++---
+ src/util.c   |  8 ++++++--
+ 2 files changed, 18 insertions(+), 5 deletions(-)
+
+diff --git a/src/ccache.c b/src/ccache.c
+index b4cdb86..8c227df 100644
+--- a/src/ccache.c
++++ b/src/ccache.c
+@@ -521,9 +521,13 @@ init_hash_debug(struct hash *hash, const char *obj_path, char type,
+ 
+ 	char *path = format("%s.ccache-input-%c", obj_path, type);
+ 	FILE *debug_binary_file = fopen(path, "wb");
+-	hash_enable_debug(hash, section_name, debug_binary_file, debug_text_file);
++	if (debug_binary_file) {
++		hash_enable_debug(hash, section_name, debug_binary_file, debug_text_file);
++		exitfn_add(fclose_exitfn, debug_binary_file);
++	} else {
++		cc_log("Failed to open %s: %s", path, strerror(errno));
++	}
+ 	free(path);
+-	exitfn_add(fclose_exitfn, debug_binary_file);
+ }
+ 
+ static enum guessed_compiler
+@@ -3670,8 +3674,13 @@ ccache(int argc, char *argv[])
+ 	if (conf->debug) {
+ 		char *path = format("%s.ccache-input-text", output_obj);
+ 		debug_text_file = fopen(path, "w");
++		if (debug_text_file) {
++			exitfn_add(fclose_exitfn, debug_text_file);
++		}
++		else {
++			cc_log("Failed to open %s: %s", path, strerror(errno));
++		}
+ 		free(path);
+-		exitfn_add(fclose_exitfn, debug_text_file);
+ 	}
+ 
+ 	struct hash *common_hash = hash_init();
+diff --git a/src/util.c b/src/util.c
+index e442cc4..a49fb4c 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -219,8 +219,12 @@ void
+ cc_dump_log_buffer(const char *path)
+ {
+ 	FILE *file = fopen(path, "w");
+-	(void) fwrite(logbuffer, 1, logsize, file);
+-	fclose(file);
++	if (file) {
++		(void) fwrite(logbuffer, 1, logsize, file);
++		fclose(file);
++	} else {
++		cc_log("Failed to open %s: %s", path, strerror(errno));
++	}
+ }
+ 
+ // Something went badly wrong!
+-- 
+2.7.4
+
-- 
2.7.4


