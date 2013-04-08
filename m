Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UPF3Y-0007rr-JR
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 18:36:37 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Apr 2013 09:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,432,1363158000"; d="scan'208";a="291827932"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.125])
	by orsmga001.jf.intel.com with ESMTP; 08 Apr 2013 09:18:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Apr 2013 17:18:44 +0100
Message-Id: <1365437924-22949-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] scripts/oe-pkgdata-util: find complementary packages for split packages
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
X-List-Received-Date: Mon, 08 Apr 2013 16:36:38 -0000

Check after getting the original package name (e.g. undoing Debian
renaming) if there is a complementary package for that name, e.g. if
the glob is *-dev, then libudev0 -> libudev -> libudev-dev.

Fixes [YOCTO #4136].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-pkgdata-util |   13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 900c27a..629b2d5 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -115,14 +115,21 @@ def glob(args):
                     if not os.path.exists(fwdfile + ".packaged"):
                         mappedpkg = ""
                 else:
-                    # That didn't work, so now get the PN, substitute that, then map in the other direction
                     revlink = revpkgdata(pkg)
                     if os.path.exists(revlink):
-                        pn = readpn(revlink)
-                        newpkg = g.replace("*", pn)
+                        # Check if we can map after undoing the package renaming (by resolving the symlink)
+                        origpkg = os.path.basename(os.readlink(revlink))
+                        newpkg = g.replace("*", origpkg)
                         fwdfile = fwdpkgdata(newpkg)
                         if os.path.exists(fwdfile):
                             mappedpkg = readrenamed(fwdfile)
+                        else:
+                            # That didn't work, so now get the PN, substitute that, then map in the other direction
+                            pn = readpn(revlink)
+                            newpkg = g.replace("*", pn)
+                            fwdfile = fwdpkgdata(newpkg)
+                            if os.path.exists(fwdfile):
+                                mappedpkg = readrenamed(fwdfile)
                         if not os.path.exists(fwdfile + ".packaged"):
                             mappedpkg = ""
                     else:
-- 
1.7.10.4



