Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 2AFA76B8DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 16:14:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 25 Feb 2014 08:14:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,540,1389772800"; d="scan'208";a="481538322"
Received: from unknown (HELO localhost.localdomain) ([10.255.12.165])
	by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2014 08:14:16 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2014 18:14:11 +0200
Message-Id: <1393344851-20938-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH v2] sqlite: rename to match upstream versioning
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
X-List-Received-Date: Tue, 25 Feb 2014 16:14:22 -0000

Since we are re-doing the version from a big number down to a dot
based number we have to bump the Package Epoch (PE).

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../sqlite/{sqlite3_3080301.bb => sqlite3_3.8.3.1.bb}          | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3080301.bb => sqlite3_3.8.3.1.bb} (53%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3080301.bb b/meta/recipes-support/sqlite/sqlite3_3.8.3.1.bb
similarity index 53%
rename from meta/recipes-support/sqlite/sqlite3_3080301.bb
rename to meta/recipes-support/sqlite/sqlite3_3.8.3.1.bb
index 8ed01a9..4f15f5d 100644
--- a/meta/recipes-support/sqlite/sqlite3_3080301.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.8.3.1.bb
@@ -2,12 +2,18 @@ require sqlite3.inc
 
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
 
-SRC_URI = "http://www.sqlite.org/2014/sqlite-autoconf-${PV}.tar.gz"
+def sqlite_download_version(d):
+    pvsplit = d.getVar('PV', True).split('.')
+    return pvsplit[0] + ''.join([part.rjust(2,'0') for part in pvsplit[1:]])
+
+PE = "1"
+SQLITE_PV = "${@sqlite_download_version(d)}"
+SRC_URI = "http://www.sqlite.org/2014/sqlite-autoconf-${SQLITE_PV}.tar.gz"
 
 SRC_URI[md5sum] = "509ff98d8dc9729b618b7e96612079c6"
 SRC_URI[sha256sum] = "de5dc216e9289fabf027f78dbbface32ffc8c6341b7d841d0814b1a452ffdb8c"
 
-S = "${WORKDIR}/sqlite-autoconf-${PV}"
+S = "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
 
 # Provide column meta-data API
 BUILD_CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
-- 
1.8.3.1


