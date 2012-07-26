Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuTIv-0007X3-35
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:00:57 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Jul 2012 11:49:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="171868454"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.157])
	by orsmga001.jf.intel.com with ESMTP; 26 Jul 2012 11:49:25 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2012 11:49:24 -0700
Message-Id: <1343328564-3644-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] package.bbclass: Let pn be eglibc for eglibc-locale
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
X-List-Received-Date: Thu, 26 Jul 2012 19:00:57 -0000

From: Khem Raj <raj.khem@gmail.com>

eglibc-locale is creating the individual locale files which have
runtime dependency on ${PN} which is 'eglibc-locale' but problem
is that eglibc-locale is an empty package and does not get created
so when one asks for adding locales to image then due to the missing
dependency in the feeds root file system can not be created.

This patch treates eglibc-locale as if it was eglibc and hence
the dependency then is created on libc6 and not not existing
eglibc-locale package.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/package.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 0c7fe80..06e2e04 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -389,6 +389,8 @@ python package_do_split_locales() {
 
     dvar = d.getVar('PKGD', True)
     pn = d.getVar('PN', True)
+    if pn == "eglibc-locale":
+        pn = "eglibc"
 
     if pn + '-locale' in packages:
         packages.remove(pn + '-locale')
-- 
1.7.7.6



