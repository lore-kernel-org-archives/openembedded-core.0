Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 1AD886C614
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 20:42:05 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 9E5E42201AA;
	Fri, 23 Nov 2018 09:42:06 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Nov 2018 09:41:57 +1300
Message-Id: <20181122204157.8261-2-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181122204157.8261-1-douglas.royds@taitradio.com>
References: <20181122204157.8261-1-douglas.royds@taitradio.com>
Subject: [PATCH 2/2] reproducible: Don't look for youngest file when no source tarball
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
X-List-Received-Date: Thu, 22 Nov 2018 20:42:06 -0000

Some packages (eg. init-ifupdown) take their source files entirely from
openembedded-core, that is, they download no source tarball.
These recipes either don't use S at all (ie. it is empty at unpack time),
or they set S = WORKDIR (as in init-ifupdown).
Looking at the file timestamps in the WORKDIR causes a non-reproducible
SOURCE_DATE_EPOCH, as files taken from file:// URIs do not have
reproducible timestamps.

If S == WORKDIR, we are better to assume that there is no source tarball,
and to fall back to a fixed timestamp for the SOURCE_DATE_EPOCH.
This makes the init-ifupdown build reproducible.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/reproducible_build.bbclass | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index a0fd4d656b..8788ad7145 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -22,7 +22,10 @@
 # 3. Use the mtime of "known" files such as NEWS, CHANGLELOG, ...
 #    This works for well-kept repositories distributed via tarball.
 #
-# 4. If the above steps fail, use the modification time of the youngest file in the source tree.
+# 4. Use the modification time of the youngest file in the source tree, if there is one.
+#    This will be the newest file from the distribution tarball, if any.
+#
+# 5. Fall back to a fixed timestamp.
 #
 # Once the value of SOURCE_DATE_EPOCH is determined, it is stored in the recipe's SDE_FILE.
 # If none of these mechanisms are suitable, replace the do_deploy_source_date_epoch task
@@ -104,15 +107,15 @@ def get_source_date_epoch_from_git(d, sourcedir):
     return source_date_epoch
 
 def get_source_date_epoch_from_youngest_file(d, sourcedir):
+    if sourcedir == d.getVar('WORKDIR'):
+       # These sources are almost certainly not from a tarball
+       return None
+
     # Do it the hard way: check all files and find the youngest one...
     source_date_epoch = None
     newest_file = None
-    # Just in case S = WORKDIR
-    exclude = set(["build", "image", "license-destdir", "patches", "pseudo",
-                   "recipe-sysroot", "recipe-sysroot-native", "sysroot-destdir", "temp"])
     for root, dirs, files in os.walk(sourcedir, topdown=True):
         files = [f for f in files if not f[0] == '.']
-        dirs[:] = [d for d in dirs if d not in exclude]
 
         for fname in files:
             filename = os.path.join(root, fname)
-- 
2.17.1


