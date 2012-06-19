Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sh11P-00027z-Ma
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:11:16 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 09:00:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155520302"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 09:00:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 08:59:33 -0700
Message-Id: <34622da0e7aabf81fd888572e4c3dc343f763d73.1340121099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
Subject: [PATCH 15/39] db: Ensure the library version matches package version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jun 2012 16:11:17 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/db/db_5.3.15.bb |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/db/db_5.3.15.bb b/meta/recipes-support/db/db_5.3.15.bb
index a34ad24..0df874e 100644
--- a/meta/recipes-support/db/db_5.3.15.bb
+++ b/meta/recipes-support/db/db_5.3.15.bb
@@ -45,15 +45,16 @@ B = "${WORKDIR}/db-${PV}/build_unix"
 # The executables go in a separate package - typically there
 # is no need to install these unless doing real database
 # management on the system.
-PACKAGES += " ${PN}-bin"
+inherit lib_package
 
 # Package contents
-FILES_${PN} = "${libdir}/libdb-5*so*"
 FILES_${PN}-bin = "${bindir}/*"
 # The dev package has the .so link (as in db3) and the .a's -
 # it is therefore incompatible (cannot be installed at the
-# same time) as the db3 package, allow the default packaging
-# to sort out ${libdir}
+# same time) as the db3 package
+# sort out the .so since they do version prior to the .so
+SOLIBS = "-5*.so"
+FILES_SOLIBSDEV = "${libdir}/libdb.so"
 
 #configuration - set in local.conf to override
 # All the --disable-* options replace --enable-smallbuild, which breaks a bunch of stuff (eg. postfix)
-- 
1.7.7.6



