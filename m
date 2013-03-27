Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1UKj0V-0002Vr-Nc
	for Openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 06:34:47 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 26 Mar 2013 22:16:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,915,1355126400"; d="scan'208";a="312454436"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by fmsmga002.fm.intel.com with ESMTP; 26 Mar 2013 22:16:30 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org,
	elizabeth.flanagan@intel.com
Date: Tue, 26 Mar 2013 22:16:26 -0700
Message-Id: <7a2674b984b5b174f7102d390b58ac4cb9d5563e.1364361172.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1364361172.git.nitin.a.kamble@intel.com>
References: <cover.1364361172.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] psplash_git.bb: fix do_compile by correcting the script path
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
X-List-Received-Date: Wed, 27 Mar 2013 05:34:50 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The recent change in the builddir location is breaking this recipe as
it is trying to run a script (make-image-header.sh) located in sourcedir
from builddir. As the script does not gets to run, the resulting file is
not generated causing error as seen below. This commit fixes the issue, by
providing complete path of the script.

This commit fixes this build error:

ERROR: Error executing a python function in /srv/home/nitin/prj/poky.git/meta/recipes-core/psplash/psplash_git.bb:
IOError: [Errno 2] No such file or directory: 'psplash-tlk-img.h'
ERROR: Task 6 (/srv/home/nitin/prj/poky.git/meta/recipes-core/psplash/psplash_git.bb, do_compile) failed with exit code '1'

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-core/psplash/psplash_git.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 5413b24..2d0cae3 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -74,12 +74,13 @@ python do_compile () {
     import shutil, commands
 
     # Build a separate executable for each splash image
+    convertscript = "%s/make-image-header.sh" % d.getVar('S', True)
     destfile = "%s/psplash-poky-img.h" % d.getVar('S', True)
     localfiles = d.getVar('SPLASH_LOCALPATHS', True).split()
     outputfiles = d.getVar('SPLASH_INSTALL', True).split()
     for localfile, outputfile in zip(localfiles, outputfiles):
         if localfile.endswith(".png"):
-            outp = commands.getstatusoutput('./make-image-header.sh %s POKY' % localfile)
+            outp = commands.getstatusoutput('%s %s POKY' % (convertscript, localfile))
             print(outp[1])
             fbase = os.path.splitext(os.path.basename(localfile))[0]
             shutil.copyfile("%s-img.h" % fbase, destfile)
-- 
1.7.3.4



