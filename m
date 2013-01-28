Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tzkou-0002Qu-Vk
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 10:16:05 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Jan 2013 01:00:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,550,1355126400"; d="scan'208";a="277383213"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga002.jf.intel.com with ESMTP; 28 Jan 2013 01:00:24 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 11:01:20 +0200
Message-Id: <1359363680-4588-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] migrate_localcount.bbclass: use PRAUTOINX instead of PN & PV
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Jan 2013 09:16:05 -0000

- we need to use PRAUTOINX (it covers all cases)
- it addresses bumped PE issues

[YOCTO #3071]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/classes/migrate_localcount.bbclass | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/classes/migrate_localcount.bbclass b/meta/classes/migrate_localcount.bbclass
index 59f14e8..3916ad4 100644
--- a/meta/classes/migrate_localcount.bbclass
+++ b/meta/classes/migrate_localcount.bbclass
@@ -18,14 +18,13 @@ python migrate_localcount_handler () {
         if not revs or not counts:
             return
 
-        srcrev = bb.fetch2.get_srcrev(e.data)
-        bpv = pv[:pv.find(srcrev)]
-
         if len(revs) != len(counts):
             bb.warn("The number of revs and localcounts don't match in %s" % pn)
             return
 
-        version = 'AUTOINC-%s-%s' % (pn, bpv)
+        version = e.data.getVar('PRAUTOINX', True)
+        srcrev = bb.fetch2.get_srcrev(e.data)
+        base_ver = 'AUTOINC-%s' % version[:version.find(srcrev)]
         pkgarch = e.data.getVar('PACKAGE_ARCH', True)
         value = max(int(count) for count in counts)
 
@@ -40,7 +39,7 @@ python migrate_localcount_handler () {
         flock = bb.utils.lockfile("%s.lock" % df)
         with open(df, 'a') as fd:
             fd.write('PRAUTO$%s$%s$%s = "%s"\n' %
-                    (version, pkgarch, srcrev, str(value)))
+                    (base_ver, pkgarch, srcrev, str(value)))
         bb.utils.unlockfile(flock)
 }
 
-- 
1.7.11.7



