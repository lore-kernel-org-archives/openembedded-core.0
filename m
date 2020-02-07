Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 169B160EA2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 20:20:09 +0000 (UTC)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 017KK8FQ028724
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Feb 2020 14:20:09 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2020 14:20:07 -0600
Message-Id: <20200207202008.132026-3-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200207202008.132026-1-mark.hatle@kernel.crashing.org>
References: <20200207202008.132026-1-mark.hatle@kernel.crashing.org>
Subject: [PATCH 2/3] package.bbclass: Allow INHIBIT_PACKAGE_STRIP_FILES to skip .ko and static libs
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
X-List-Received-Date: Fri, 07 Feb 2020 20:20:09 -0000

Change the order of the skip processing to happen before any .ko and static
library processing.  This will allow these types of files to be individually
skipped if necessary.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/package.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 46ec9b6b3a..7080d63287 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -955,12 +955,6 @@ python split_and_strip_files () {
         for root, dirs, files in cpath.walk(dvar):
             for f in files:
                 file = os.path.join(root, f)
-                if file.endswith(".ko") and file.find("/lib/modules/") != -1:
-                    kernmods.append(file)
-                    continue
-                if oe.package.is_static_lib(file):
-                    staticlibs.append(file)
-                    continue
 
                 # Skip debug files
                 if debugappend and file.endswith(debugappend):
@@ -971,6 +965,13 @@ python split_and_strip_files () {
                 if file in skipfiles:
                     continue
 
+                if file.endswith(".ko") and file.find("/lib/modules/") != -1:
+                    kernmods.append(file)
+                    continue
+                if oe.package.is_static_lib(file):
+                    staticlibs.append(file)
+                    continue
+
                 try:
                     ltarget = cpath.realpath(file, dvar, False)
                     s = cpath.lstat(ltarget)
-- 
2.17.1


