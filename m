Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 21D5871DED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 22:39:15 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Jan 2017 14:39:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,223,1477983600"; d="scan'208";a="30213753"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by orsmga002.jf.intel.com with ESMTP; 13 Jan 2017 14:39:15 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 14:35:41 +0000
Message-Id: <2dde66003778acc6e06a06fe707ee5efee14a37e.1484318112.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1484318112.git.mariano.lopez@linux.intel.com>
References: <cover.1484318112.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] lib/oe/package_manager.py: Fix extract for ipk and deb
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
X-List-Received-Date: Fri, 13 Jan 2017 22:39:15 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

With the move to use lists instead of strings in subprocess
calls, package extraction was broken for ipk and deb. This
fixes this issue.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index a8644cc..a02bff4 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1545,11 +1545,15 @@ class OpkgDpkgPM(PackageManager):
         tmp_dir = tempfile.mkdtemp()
         current_dir = os.getcwd()
         os.chdir(tmp_dir)
+        if self.d.getVar('IMAGE_PKGTYPE') == 'deb':
+            data_tar = 'data.tar.xz'
+        else:
+            data_tar = 'data.tar.gz'
 
         try:
             cmd = [ar_cmd, 'x', pkg_path]
             output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
-            cmd = [tar_cmd, 'xf', 'data.tar.*']
+            cmd = [tar_cmd, 'xf', data_tar]
             output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
             bb.utils.remove(tmp_dir, recurse=True)
-- 
2.6.6


