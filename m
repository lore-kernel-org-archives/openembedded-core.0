Return-Path: <sh0127.shin@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C8AC5AC82
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 09:40:13 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26161.1786354802561471009
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 02:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: sh0127.shin@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.53 with ESMTP; 10 Aug 2026 18:40:00 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: sh0127.shin@lge.com
Received: from unknown (HELO swfarm-oeci-r122-2204..) (156.147.61.178)
	by 156.147.1.121 with ESMTP; 10 Aug 2026 18:40:00 +0900
X-Original-SENDERIP: 156.147.61.178
X-Original-MAILFROM: sh0127.shin@lge.com
From: sh0127.shin@lge.com
To: openembedded-core@lists.openembedded.org,
	sh0127.shin@lge.com
Subject: [PATCH 2/2] npm.bbclass: allow per-recipe exclusions in npm_pack tarball
Date: Mon, 10 Aug 2026 09:39:47 +0000
Message-Id: <20260810093947.2289126-2-sh0127.shin@lge.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260810093947.2289126-1-sh0127.shin@lge.com>
References: <20260810093947.2289126-1-sh0127.shin@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 09:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243121

From: "sh0127.shin" <sh0127.shin@lge.com>

npm_pack() uses tar to archive the source tree before installation.
Large source trees often contain unnecessary files such as test
fixtures, documentation, or pre-built binaries that are not required
for the actual build. Including these files inflates the tarball size.

Add a new NPM_PACK_EXTRA_EXCLUDES variable that recipes can set to a
space-separated list of paths or glob patterns to be excluded from the
tar archive in addition to the always-excluded './node_modules'.

Excluding unnecessary files reduces the tarball size, which lowers
disk I/O during packing and unpacking. The smaller archive also speeds
up subsequent npm install processing, resulting in an overall reduction
in build time.

The variable is passed to npm_pack() via a new optional 'excludes'
parameter, keeping the function signature backward compatible.

Example usage in a recipe:
  NPM_PACK_EXTRA_EXCLUDES = "./test ./docs"

Signed-off-by: sh0127.shin <sh0127.shin@lge.com>
---
 meta/classes-recipe/npm.bbclass | 39 +++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/npm.bbclass b/meta/classes-recipe/npm.bbclass
index f465ff10d7..84ee9ebf7f 100644
--- a/meta/classes-recipe/npm.bbclass
+++ b/meta/classes-recipe/npm.bbclass
@@ -16,6 +16,10 @@
 #
 #  NPM_INSTALL_DEV:
 #       Set to 1 to also install devDependencies.
+#
+#  NPM_PACK_EXTRA_EXCLUDES:
+#       Space-separated list of paths to exclude from ${S} when
+#       creating the npm_pack tarball.
 
 inherit python3native
 
@@ -46,6 +50,20 @@ NPM_CACHE = "${WORKDIR}/npm-cache"
 NPM_BUILD = "${WORKDIR}/npm-build"
 NPM_REGISTRY = "${WORKDIR}/npm-registry"
 
+# Space-separated list of paths or glob patterns to exclude from the
+# npm_pack() tar archive of ${S}, in addition to './node_modules' which
+# is always excluded.
+#
+# Patterns are passed to tar --exclude.  A leading './' anchors the
+# pattern to the top of the source tree; without it the pattern matches
+# at any depth.
+#
+# NOTE: the excluded files do not reach the final package.  The tarball
+# is unpacked into NPM_PACKAGE and installed by 'npm install', so
+# anything dropped here is absent from ${D}.  Do not exclude files the
+# build or the runtime needs.
+NPM_PACK_EXTRA_EXCLUDES ?= ""
+
 def npm_global_configs(d):
     """Get the npm global configuration"""
     configs = []
@@ -61,7 +79,7 @@ def npm_global_configs(d):
 ## 'npm pack' runs 'prepare' and 'prepack' scripts. Support for
 ## 'ignore-scripts' which prevents this behavior has been removed
 ## from nodejs 16.  Use simple 'tar' instead of.
-def npm_pack(env, srcdir, workdir):
+def npm_pack(env, srcdir, workdir, excludes=None):
     """Emulate 'npm pack' on a specified directory"""
     import subprocess
     import os
@@ -81,13 +99,15 @@ def npm_pack(env, srcdir, workdir):
 
     # TODO: real 'npm pack' does not include directories while 'tar'
     # does.  But this does not seem to matter...
-    subprocess.run(['tar', 'czf', tarball,
-                    '--exclude', './node_modules',
-                    '--exclude-vcs',
-                    '--transform', r's,^\./,package/,',
-                    '--mtime', '1985-10-26T08:15:00.000Z',
-                    '.'],
-                   check = True, cwd = srcdir)
+    cmd = ['tar', 'czf', tarball, '--exclude', './node_modules']
+    for e in excludes or []:
+        cmd += ['--exclude', e]
+    cmd += ['--exclude-vcs',
+            '--transform', r's,^\./,package/,',
+            '--mtime', '1985-10-26T08:15:00.000Z',
+            '.']
+
+    subprocess.run(cmd, check = True, cwd = srcdir)
 
     return (tarball, j)
 
@@ -222,7 +242,8 @@ python npm_do_configure() {
 
     # Configure the main package
     with tempfile.TemporaryDirectory() as tmpdir:
-        (tarball, _) = npm_pack(env, d.getVar("S"), tmpdir)
+        excludes = (d.getVar("NPM_PACK_EXTRA_EXCLUDES") or "").split()
+        (tarball, _) = npm_pack(env, d.getVar("S"), tmpdir, excludes)
         npm_unpack(tarball, d.getVar("NPM_PACKAGE"), d)
 
     # Configure the cached manifest file and cached shrinkwrap file
-- 
2.34.1


