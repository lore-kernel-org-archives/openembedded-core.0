Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SVOAf-0000XG-OG
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 16:28:45 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 May 2012 07:18:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="145583588"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.13.139])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2012 07:18:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 May 2012 17:18:19 +0300
Message-Id: <7a053c2c3b648c2492250b1f92d4363a37f9a886.1337350637.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337350637.git.sgw@linux.intel.com>
References: <cover.1337350637.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337350637.git.sgw@linux.intel.com>
References: <cover.1337350637.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 9/9] sstate.bbclass: Make sure we don't have an empty fixmepath file
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
X-List-Received-Date: Fri, 18 May 2012 14:28:46 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Jason Wessel noticed that a package without any fixmepath entries would
generate a sed warning about no input files.  This patch resolves that
by ensuring that an empty fixmepath file never gets written into the
sstate archive.  Also we avoid a second message by only doing xargs if
we got input.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/sstate.bbclass |   17 ++++++++++++-----
 1 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ccef4a9..ae01937 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -330,20 +330,27 @@ def sstate_hardcode_path(d):
 		sstate_grep_cmd = "grep -l -e '%s'" % (staging_host)
 		sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIRHOST:g'" % (staging_host)
 	
+	fixmefn =  sstate_builddir + "fixmepath"
+
 	sstate_scan_cmd = d.getVar('SSTATE_SCAN_CMD', True)
-	sstate_filelist_cmd = "tee %sfixmepath" % (sstate_builddir)
+	sstate_filelist_cmd = "tee %s" % (fixmefn)
 
 	# fixmepath file needs relative paths, drop sstate_builddir prefix
-	sstate_filelist_relative_cmd = "sed -i -e 's:^%s::g' %sfixmepath" % (sstate_builddir, sstate_builddir)
+	sstate_filelist_relative_cmd = "sed -i -e 's:^%s::g' %s" % (sstate_builddir, fixmefn)
 
 	# Limit the fixpaths and sed operations based on the initial grep search
 	# This has the side effect of making sure the vfs cache is hot
-	sstate_hardcode_cmd = "%s | xargs %s | %s | xargs %s" % (sstate_scan_cmd, sstate_grep_cmd, sstate_filelist_cmd, sstate_sed_cmd)
+	sstate_hardcode_cmd = "%s | xargs %s | %s | xargs --no-run-if-empty %s" % (sstate_scan_cmd, sstate_grep_cmd, sstate_filelist_cmd, sstate_sed_cmd)
 
 	print "Removing hardcoded paths from sstate package: '%s'" % (sstate_hardcode_cmd)
 	os.system(sstate_hardcode_cmd)
-	print "Replacing absolute paths in fixmepath file: '%s'" % (sstate_filelist_relative_cmd)
-	os.system(sstate_filelist_relative_cmd)
+
+        # If the fixmefn is empty, remove it..
+	if os.stat(fixmefn).st_size == 0:
+		os.remove(fixmefn)
+	else:
+		print "Replacing absolute paths in fixmepath file: '%s'" % (sstate_filelist_relative_cmd)
+		os.system(sstate_filelist_relative_cmd)
 
 def sstate_package(ss, d):
     import oe.path
-- 
1.7.7.6



