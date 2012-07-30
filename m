Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Svlt6-0005w2-9K
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 11:03:40 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Jul 2012 01:52:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="174758028"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.40])
	by azsmga001.ch.intel.com with ESMTP; 30 Jul 2012 01:52:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2012 09:52:01 +0100
Message-Id: <1343638321-25398-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] scripts/oe-pkgdata-util: exclude unpackaged in glob output
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
X-List-Received-Date: Mon, 30 Jul 2012 09:03:40 -0000

Check for .packaged file and exclude packages if this file does not
exist - this avoids attempting to install empty packages during
complementary package installation within do_rootfs that didn't end up
being created (and failing as a result).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-pkgdata-util |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 2427f10..900c27a 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -112,6 +112,8 @@ def glob(args):
                     fwdfile = fwdpkgdata(mappedpkg)
                     if os.path.exists(fwdfile):
                         mappedpkg = readrenamed(fwdfile)
+                    if not os.path.exists(fwdfile + ".packaged"):
+                        mappedpkg = ""
                 else:
                     # That didn't work, so now get the PN, substitute that, then map in the other direction
                     revlink = revpkgdata(pkg)
@@ -121,6 +123,8 @@ def glob(args):
                         fwdfile = fwdpkgdata(newpkg)
                         if os.path.exists(fwdfile):
                             mappedpkg = readrenamed(fwdfile)
+                        if not os.path.exists(fwdfile + ".packaged"):
+                            mappedpkg = ""
                     else:
                         # Package doesn't even exist...
                         if debug:
-- 
1.7.9.5



