Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 77BE17FC9A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2020 22:10:45 +0000 (UTC)
IronPort-SDR: 6M99gWqxOeYhtHh8oJjxr4tBrA8S9qiSp7ly1obS1/yEfwWQtVXXtRhGeewefs8Iu0cfhvdv91
	4hHrmYuIXgoPUJZXBJuWxiXbDRYm6bwQB6TDNLEHZ+c0OSRdcWIF7TKL1zqTwVny9+l0ISLGhK
	4a4ag4pyJVbEZWcCU7CKfBUjTJe8QIcQaYMK3VoZ4tpTiK/ikxszt0RKk/cRoM50wi0bB/WXKo
	K7UGTdR9NztPxAWpHySg2Flb7OwbP0NuWmI86n41yV05fQ4FgeiYrteIBihklfs6fWvr1d+yG+
	tns=
X-IronPort-AV: E=Sophos;i="5.69,407,1571695200"; 
   d="scan'208";a="4156492"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jan 2020 23:10:42 +0100
Message-Id: <20200107221043.18575-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [master][zeus][warrior][PATCH 1/2] sanity.bbclass: Move sanity_info from conf to cache
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
X-List-Received-Date: Tue, 07 Jan 2020 22:10:45 -0000
Content-Transfer-Encoding: 8bit

Since this file is written during recipe parsing, having it in the
${BUILDDIR}/conf directory, which is covered by an inotify watcher,
will trigger a re-parse the next time bitbake is run and the resident
bitbake server is enabled. This causes the sanity_info file to be
updated again, which triggers a new parse the next time bitbake is run
ad infinitum. Moving it to ${BUILDDIR}/cache should avoid this.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/sanity.bbclass     | 2 +-
 meta/lib/oeqa/buildperf/base.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 63ab6cf3df..5c2f8f9d75 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -929,7 +929,7 @@ def check_sanity(sanity_data):
     last_tmpdir = ""
     last_sstate_dir = ""
     last_nativelsbstr = ""
-    sanityverfile = sanity_data.expand("${TOPDIR}/conf/sanity_info")
+    sanityverfile = sanity_data.expand("${TOPDIR}/cache/sanity_info")
     if os.path.exists(sanityverfile):
         with open(sanityverfile, 'r') as f:
             for line in f:
diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 3b2fed549f..5f1805d86c 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -462,7 +462,7 @@ class BuildPerfTestCase(unittest.TestCase):
     def rm_tmp(self):
         """Cleanup temporary/intermediate files and directories"""
         log.debug("Removing temporary and cache files")
-        for name in ['bitbake.lock', 'conf/sanity_info',
+        for name in ['bitbake.lock', 'cache/sanity_info',
                      self.bb_vars['TMPDIR']]:
             oe.path.remove(name, recurse=True)
 
-- 
2.21.1


