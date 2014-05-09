Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (unknown [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 164E360781
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 00:39:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 08 May 2014 17:39:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1014,1389772800"; d="scan'208";a="528874082"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.214])
	by fmsmga001.fm.intel.com with ESMTP; 08 May 2014 17:39:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 May 2014 17:39:35 -0700
Message-Id: <1399595975-22866-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] update-rc.d: Handle multilib case for initsctipts
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
X-List-Received-Date: Fri, 09 May 2014 00:39:37 -0000

When building multilib, we also have to add the multlib prefix otherwise
we get a WARNING:
WARNING: Multilib QA Issue: lib32-dbus package lib32-dbus - suspicious values 'initscripts-functions' in RDEPENDS

[YOCTO #6164]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/update-rc.d.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 81cc976..56eef4e 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -79,7 +79,8 @@ python populate_packages_updatercd () {
             return
         statement = "grep -q -w '/etc/init.d/functions' %s" % path
         if subprocess.call(statement, shell=True) == 0:
-            d.appendVar('RDEPENDS_' + pkg, ' initscripts-functions')
+            mlprefix = d.getVar('MLPREFIX', True) or ""
+            d.appendVar('RDEPENDS_' + pkg, ' %sinitscripts-functions' % (mlprefix))
 
     def update_rcd_package(pkg):
         bb.debug(1, 'adding update-rc.d calls to preinst/postinst/prerm/postrm for %s' % pkg)
-- 
1.8.3.1


