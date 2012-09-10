Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TB3lR-0007l3-Rv
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 15:10:58 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Sep 2012 05:58:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,398,1344236400"; d="scan'208";a="190872692"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.193])
	by azsmga001.ch.intel.com with ESMTP; 10 Sep 2012 05:58:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Sep 2012 13:58:10 +0100
Message-Id: <1347281890-23781-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] classes/packageinfo: use better method to check if package exists
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
X-List-Received-Date: Mon, 10 Sep 2012 13:10:58 -0000

Instead of using a rather error-prone method of looking for output
package files in order to determine if a package got created, use the
.packaged file within pkgdata.

This fixes two separate issues:
* Some packages apparently not being found by this code e.g. all
  apm/apmd packages when using ipk packaging.
* Buggy implementation of this checking code which triggered an
  exception during the event handler if PKGV was overridden on a
  per-package basis (as it is with external-sourcery-toolchain), which
  blocked Hob from completing parsing at 99% - fixes [YOCTO #2651].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/packageinfo.bbclass |   34 ++++++++--------------------------
 1 file changed, 8 insertions(+), 26 deletions(-)

diff --git a/meta/classes/packageinfo.bbclass b/meta/classes/packageinfo.bbclass
index 26cce60..bd7b249 100644
--- a/meta/classes/packageinfo.bbclass
+++ b/meta/classes/packageinfo.bbclass
@@ -14,32 +14,14 @@ python packageinfo_handler () {
                 for root, dirs, files in os.walk(pkgdata_dir):
                     for pkgname in files:
                         if pkgname.endswith('.packaged'):
-                            continue
-                        sdata = oe.packagedata.read_pkgdatafile(root + pkgname)
-                        sdata['PKG'] = pkgname
-                        pkgrename = sdata['PKG_%s' % pkgname]
-                        pkgv = sdata['PKGV'].replace('-', '+')
-                        pkgr = sdata['PKGR']
-                        # We found there are some renaming issue with certain architecture.
-                        # For example, armv7a-vfp-neon, it will use armv7a in the rpm file. This is the workaround for it.
-                        arch_tmp = arch.split('-')[0]
-                        if os.path.exists(deploy_dir + '/' + arch + '/' + \
-                                          pkgname + '-' + pkgv + '-' + pkgr + '.' + arch + '.' + packaging) or \
-                           os.path.exists(deploy_dir + '/' + arch + '/' + \
-                                          pkgname + '-' + pkgv + '-' + pkgr + '.' + arch_tmp + '.' + packaging) or \
-                           os.path.exists(deploy_dir + '/' + arch + '/' + \
-                                          pkgrename + '-' + pkgv + '-' + pkgr + '.' + arch + '.' + packaging) or \
-                           os.path.exists(deploy_dir + '/' + arch + '/' + \
-                                          pkgrename + '-' + pkgv + '-' + pkgr + '.' + arch_tmp + '.' + packaging) or \
-                           os.path.exists(deploy_dir + '/' + arch + '/' + \
-                                          pkgname + '_' + pkgv + '-' + pkgr + '_' + arch + '.' + packaging) or \
-                           os.path.exists(deploy_dir + '/' + arch + '/' + \
-                                          pkgname + '_' + pkgv + '-' + pkgr + '_' + arch_tmp + '.' + packaging) or \
-                           os.path.exists(deploy_dir + '/' + arch + '/' + \
-                                          pkgrename + '_' + pkgv + '-' + pkgr + '_' + arch + '.' + packaging) or \
-                           os.path.exists(deploy_dir + '/' + arch + '/' + \
-                                          pkgrename + '_' + pkgv + '-' + pkgr + '_' + arch_tmp + '.' + packaging):
-                            pkginfolist.append(sdata)
+                            pkgname = pkgname[:-9]
+                            pkgdatafile = root + pkgname
+                            try:
+                                sdata = oe.packagedata.read_pkgdatafile(pkgdatafile)
+                                sdata['PKG'] = pkgname
+                                pkginfolist.append(sdata)
+                            except Exception as e:
+                                bb.warn("Failed to read pkgdata file %s: %s: %s" % (pkgdatafile, e.__class__, str(e)))
         bb.event.fire(bb.event.PackageInfo(pkginfolist), e.data)
 }
 
-- 
1.7.9.5



