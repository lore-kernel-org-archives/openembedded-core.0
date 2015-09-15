Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1216E73D13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 23:07:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Sep 2015 16:07:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,537,1437462000"; d="scan'208";a="790179105"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by fmsmga001.fm.intel.com with ESMTP; 15 Sep 2015 16:07:18 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Sep 2015 14:59:40 +0000
Message-Id: <bfec72e383e99ef94ded6164ae7a313853c5240e.1442328203.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1442328203.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1442328203.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1442328203.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1442328203.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 3/3] prserv/db: Use DELETE instead of WAL journal mode
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
X-List-Received-Date: Tue, 15 Sep 2015 23:07:27 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Disadvantages of WAL journal mode are explained on [1], but the
one affecting our case is "All processes using a database must be
on the same host computer; WAL does not work over a network filesystem".
Changing the Journal mode into DELETE which is the normal behavior for
rollback journal.

[YOCTO #8215]

[1] https://www.sqlite.org/wal.html

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 bitbake/lib/prserv/db.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/prserv/db.py b/bitbake/lib/prserv/db.py
index 4379580..b3e3a4f 100644
--- a/bitbake/lib/prserv/db.py
+++ b/bitbake/lib/prserv/db.py
@@ -245,7 +245,7 @@ class PRData(object):
         self.connection=sqlite3.connect(self.filename, isolation_level="EXCLUSIVE", check_same_thread = False)
         self.connection.row_factory=sqlite3.Row
         self.connection.execute("pragma synchronous = off;")
-        self.connection.execute("PRAGMA journal_mode = WAL;")
+        self.connection.execute("PRAGMA journal_mode = DELETE;")
         self._tables={}
 
     def __del__(self):
-- 
1.8.4.5


