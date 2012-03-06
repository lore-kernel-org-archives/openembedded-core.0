Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S4xvo-0003cn-4s
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 18:12:12 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Mar 2012 09:03:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="125714855"
Received: from unknown (HELO swold-mobl.verilan.com) ([10.255.15.180])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2012 09:03:32 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 09:03:13 -0800
Message-Id: <7bc85c20659b1eac73d02000c35695bb84ee455d.1331053126.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331053126.git.sgw@linux.intel.com>
References: <cover.1331053126.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331053126.git.sgw@linux.intel.com>
References: <cover.1331053126.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/20] psplash: Add mising commands module import.
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
X-List-Received-Date: Tue, 06 Mar 2012 17:12:12 -0000

From: Peter Tworek <tworaz666@gmail.com>

Python commands module is used in the recipe, but never imported.
This leads to build errors like:

NameError: global name 'commands' is not defined

ERROR: The stack trace of python calls that resulted in this exception/failure was:
ERROR:   File "do_compile", line 24, in <module>
ERROR:
ERROR:   File "do_compile", line 11, in do_compile
ERROR:
ERROR: The code that was being executed was:
ERROR:      0020:        bb.build.exec_func("oe_runmake", d)
ERROR:      0021:        shutil.copyfile("psplash", outputfile)
ERROR:      0022:
ERROR:      0023:
ERROR:  *** 0024:do_compile(d)
ERROR:      0025:
ERROR: (file: 'do_compile', lineno: 24, function: <module>)
ERROR:      0007:    localfiles = d.getVar('SPLASH_LOCALPATHS', True).split()
ERROR:      0008:    outputfiles = d.getVar('SPLASH_INSTALL', True).split()
ERROR:      0009:    for localfile, outputfile in zip(localfiles, outputfiles):
ERROR:      0010:        if localfile.endswith(".png"):
ERROR:  *** 0011:            outp = commands.getstatusoutput('./make-image-header.sh %s POKY' % localfile)
ERROR:      0012:            print(outp[1])
ERROR:      0013:            fbase = os.path.splitext(os.path.basename(localfile))[0]
ERROR:      0014:            shutil.copyfile("%s-img.h" % fbase, destfile)
ERROR:      0015:        else:

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 meta/recipes-core/psplash/psplash_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 42ea615..bd405f9 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -68,7 +68,7 @@ S = "${WORKDIR}/git"
 inherit autotools pkgconfig update-rc.d
 
 python do_compile () {
-    import shutil
+    import shutil, commands
 
     # Build a separate executable for each splash image
     destfile = "%s/psplash-poky-img.h" % d.getVar('S', True)
-- 
1.7.7.6



