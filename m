Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Sw8KY-0003Iw-91
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 11:01:30 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 31 Jul 2012 01:49:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190969722"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 31 Jul 2012 01:49:53 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 11:49:38 +0300
Message-Id: <0910381748d7d4a957a2d921736aac4f48279013.1343723990.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343723990.git.laurentiu.palcu@intel.com>
References: <cover.1343723990.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1343723990.git.laurentiu.palcu@intel.com>
References: <cover.1343723990.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 6/6] package.bbclass: change RPATHs for nativesdk packages
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
X-List-Received-Date: Tue, 31 Jul 2012 09:01:30 -0000

Change binaries RPATHs, to include $ORIGIN, to make them relocatable.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/package.bbclass |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 6142911..fda8228 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -40,6 +40,7 @@
 
 inherit packagedata
 inherit prserv
+inherit chrpath
 
 PKGD    = "${WORKDIR}/package"
 PKGDEST = "${WORKDIR}/packages-split"
@@ -440,6 +441,10 @@ python perform_packagecopy () {
     subprocess.call('rm -rf %s/*' % (dvar), shell=True)
     # Preserve sparse files and hard links
     subprocess.call('tar -cf - -C %s -ps . | tar -xf - -C %s' % (dest, dvar), shell=True)
+
+    # replace RPATHs for the nativesdk binaries, to make them relocatable
+    if bb.data.inherits_class('nativesdk', d):
+        rpath_replace (dvar, d)
 }
 
 # We generate a master list of directories to process, we start by
-- 
1.7.9.5



