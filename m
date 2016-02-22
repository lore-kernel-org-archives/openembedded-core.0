Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id ADBE560249
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 11:33:36 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 22 Feb 2016 03:33:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,484,1449561600"; d="scan'208";a="891650890"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.11.110])
	by orsmga001.jf.intel.com with ESMTP; 22 Feb 2016 03:33:22 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Feb 2016 11:33:12 +0000
Message-Id: <1456140792-10903-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] rpm: fix building rpm 5 with internal beecrypt
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
X-List-Received-Date: Mon, 22 Feb 2016 11:33:37 -0000

RPM 5 cannot be built without beecrypt, therefore the EXTRA_OECONF
arguments to pass when the beecrypt PACKAGECONFIG is disabled should
enable the internal/bundled beecrypt.

[YOCTO #9150]

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb | 2 +-
 meta/recipes-devtools/rpm/rpm_5.4.14.bb  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
index 2747a24..660e9df 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
@@ -159,7 +159,7 @@ PACKAGECONFIG[db] = "${WITH_DB},--without-db,db,"
 
 PACKAGECONFIG[sqlite] = "--with-sqlite,--without-sqlite,sqlite3,"
 
-PACKAGECONFIG[beecrypt] = "--with-beecrypt=external,--without-beecrypt,beecrypt,"
+PACKAGECONFIG[beecrypt] = "--with-beecrypt=external,--with-beecrypt=internal,beecrypt,"
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
 PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss,"
 PACKAGECONFIG[gcrypt] = "--with-gcrypt,--without-gcrypt,gcrypt,"
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index 261b280..90c4a35 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -161,7 +161,7 @@ PACKAGECONFIG[db] = "${WITH_DB},--without-db,db,"
 
 PACKAGECONFIG[sqlite] = "--with-sqlite,--without-sqlite,sqlite3,"
 
-PACKAGECONFIG[beecrypt] = "--with-beecrypt=external,--without-beecrypt,beecrypt,"
+PACKAGECONFIG[beecrypt] = "--with-beecrypt=external,--with-beecrypt=internal,beecrypt,"
 PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
 PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss,"
 PACKAGECONFIG[gcrypt] = "--with-gcrypt,--without-gcrypt,gcrypt,"
-- 
2.5.0


