Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D643860621
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 16:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JGDC2U002520; Thu, 19 Jan 2017 16:13:13 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jZHkRGOcW7kV; Thu, 19 Jan 2017 16:13:13 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JGD64e002506
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Jan 2017 16:13:07 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cUFKk-0000lH-9M; Thu, 19 Jan 2017 16:13:06 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 16:12:59 +0000
Message-Id: <1484842382-2821-8-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484842382-2821-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484842382-2821-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 08/11] devtool: fix source extraction to work with recipe specific sysroots
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
X-List-Received-Date: Thu, 19 Jan 2017 16:15:17 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

When extracting source for a recipe within devtool (for extract, modify
or upgrade) We need to redirect WORKDIR, STAMPS_DIR etc. under a
temporary directory so that:
 (a) we pick up all files that get unpacked to the WORKDIR, and
 (b) we don't disturb the existing build
However, with recipe-specific sysroots the sysroots for the recipe will
be prepared under WORKDIR, and if we used the system temporary directory
i.e. usually /tmp) as used by mkdtemp by default, then our attempts to
hardlink files into the recipe-specific sysroots will fail on systems
where /tmp is a different filesystem, and we'd have to fall back to
copying the files which is a waste of time. Put the temp directory under
the WORKDIR to prevent that from being a problem.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
[RP: Add needed mkdirhier call]
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/devtool/standard.py | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 8944b0a..30b247f 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -465,7 +465,21 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d, tinfoil):
         os.rmdir(srctree)
 
     initial_rev = None
-    tempdir = tempfile.mkdtemp(prefix='devtool')
+    # We need to redirect WORKDIR, STAMPS_DIR etc. under a temporary
+    # directory so that:
+    # (a) we pick up all files that get unpacked to the WORKDIR, and
+    # (b) we don't disturb the existing build
+    # However, with recipe-specific sysroots the sysroots for the recipe
+    # will be prepared under WORKDIR, and if we used the system temporary
+    # directory (i.e. usually /tmp) as used by mkdtemp by default, then
+    # our attempts to hardlink files into the recipe-specific sysroots
+    # will fail on systems where /tmp is a different filesystem, and it
+    # would have to fall back to copying the files which is a waste of
+    # time. Put the temp directory under the WORKDIR to prevent that from
+    # being a problem.
+    tempbasedir = d.getVar('WORKDIR')
+    bb.utils.mkdirhier(tempbasedir)
+    tempdir = tempfile.mkdtemp(prefix='devtooltmp-', dir=tempbasedir)
     try:
         tinfoil.logger.setLevel(logging.WARNING)
 
-- 
2.7.4


