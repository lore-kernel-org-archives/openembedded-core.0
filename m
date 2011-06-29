Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Qc2mm-00081e-TU
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 23:59:05 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jun 2011 14:55:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,446,1304319600"; d="scan'208";a="22073366"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.13.240])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2011 14:55:11 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 14:55:02 -0700
Message-Id: <a3e09d3d5500b3e8c70c5b22075f9b6db07775da.1309383978.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1309383978.git.josh@linux.intel.com>
References: <cover.1309383978.git.josh@linux.intel.com>
In-Reply-To: <cover.1309383978.git.josh@linux.intel.com>
References: <cover.1309383978.git.josh@linux.intel.com>
Subject: [RFC 1/2] sanity.bbclass: pass the data object to the less frequent test harnesses
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
X-List-Received-Date: Wed, 29 Jun 2011 21:59:05 -0000

By passing the data object to the less frequently run test harnesses
(check_sanity_tmpdir_change(), check_sanity_sstate_dir_change() and
check_sanity_version_change()) we can run tests against BitBake data here
too.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/sanity.bbclass |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index d296c86..720777a 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -21,7 +21,7 @@ def check_conf_exists(fn, data):
             return True
     return False
 
-def check_sanity_sstate_dir_change(sstate_dir):
+def check_sanity_sstate_dir_change(sstate_dir, data):
     # Sanity checks to be done when the value of SSTATE_DIR changes
 
     # Check that SSTATE_DIR isn't on a filesystem with limited filename length (eg. eCryptFS)
@@ -30,14 +30,14 @@ def check_sanity_sstate_dir_change(sstate_dir):
         testmsg = check_create_long_filename(sstate_dir, "SSTATE_DIR")
     return testmsg
 
-def check_sanity_tmpdir_change(tmpdir):
+def check_sanity_tmpdir_change(tmpdir, data):
     # Sanity checks to be done when the value of TMPDIR changes
 
     # Check that TMPDIR isn't on a filesystem with limited filename length (eg. eCryptFS)
     testmsg = check_create_long_filename(tmpdir, "TMPDIR")
     return testmsg
         
-def check_sanity_version_change():
+def check_sanity_version_change(data):
     # Sanity checks to be done when SANITY_VERSION changes
     return ""
 
@@ -266,14 +266,14 @@ def check_sanity(e):
     
     sanity_version = int(data.getVar('SANITY_VERSION', e.data, True) or 1)
     if last_sanity_version < sanity_version: 
-        messages = messages + check_sanity_version_change()
-        messages = messages + check_sanity_tmpdir_change(tmpdir)
-        messages = messages + check_sanity_sstate_dir_change(sstate_dir)
+        messages = messages + check_sanity_version_change(e.data)
+        messages = messages + check_sanity_tmpdir_change(tmpdir, e.data)
+        messages = messages + check_sanity_sstate_dir_change(sstate_dir, e.data)
     else: 
         if last_tmpdir != tmpdir:
-            messages = messages + check_sanity_tmpdir_change(tmpdir)
+            messages = messages + check_sanity_tmpdir_change(tmpdir, e.data)
         if last_sstate_dir != sstate_dir:
-            messages = messages + check_sanity_sstate_dir_change(sstate_dir)
+            messages = messages + check_sanity_sstate_dir_change(sstate_dir, e.data)
 
     if os.path.exists("conf"):
         f = file(sanityverfile, 'w')
-- 
1.7.5.4



