Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D75B477DE7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 08:08:18 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Sep 2017 01:08:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,444,1500966000"; d="scan'208";a="153854542"
Received: from summit.tm.intel.com ([10.237.55.152])
	by orsmga005.jf.intel.com with ESMTP; 27 Sep 2017 01:08:19 -0700
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Sep 2017 11:08:15 +0300
Message-Id: <20170927080815.18392-3-mikko.ylinen@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170927080815.18392-1-mikko.ylinen@linux.intel.com>
References: <20170926120328.14928-1-mikko.ylinen@linux.intel.com>
	<20170927080815.18392-1-mikko.ylinen@linux.intel.com>
Subject: [PATCH 2/2] package_manager: rpm: improve logging
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
X-List-Received-Date: Wed, 27 Sep 2017 08:08:19 -0000

To be able to better debug remove() behaviour, add more logging
to rpm calls via bb.note(). The change also makes remove() logging
more consistent with other package managers' remove() (e.g., opkg).

Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 994e462..eb0824e 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -614,10 +614,12 @@ class RpmPM(PackageManager):
             self._invoke_dnf(["remove"] + pkgs)
         else:
             cmd = bb.utils.which(os.getenv('PATH'), "rpm")
-            args = ["-e", "--nodeps", "--root=%s" %self.target_rootfs]
+            args = ["-e", "-v", "--nodeps", "--root=%s" %self.target_rootfs]
 
             try:
+                bb.note("Running %s" % ' '.join([cmd] + args + pkgs))
                 output = subprocess.check_output([cmd] + args + pkgs, stderr=subprocess.STDOUT).decode("utf-8")
+                bb.note(output)
             except subprocess.CalledProcessError as e:
                 bb.fatal("Could not invoke rpm. Command "
                      "'%s' returned %d:\n%s" % (' '.join([cmd] + args + pkgs), e.returncode, e.output.decode("utf-8")))
-- 
2.1.4


