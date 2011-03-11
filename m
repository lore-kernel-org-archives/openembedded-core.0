Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PxrzE-0006tP-Sv
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Mar 2011 03:21:53 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Mar 2011 18:20:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,300,1297065600"; d="scan'208";a="666140182"
Received: from unknown (HELO localhost) ([10.255.17.57])
	by fmsmga002.fm.intel.com with ESMTP; 10 Mar 2011 18:20:13 -0800
Message-Id: <dbc752c75786b0985fbeb4986467ae01290f424a.1299809859.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299809859.git.sgw@linux.intel.com>
References: <cover.1299809859.git.sgw@linux.intel.com>
Old-Date: Thu, 10 Mar 2011 11:51:26 -0600
Date: Thu, 10 Mar 2011 18:20:11 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 03/12] package.bbclass: Change the debug directory to avoid conflicts
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
X-List-Received-Date: Fri, 11 Mar 2011 02:21:53 -0000

From: Mark Hatle <mark.hatle@windriver.com>

The debug directory before was below ${WORKDIR}.  Unfortunately if
something was based on a git tree, it meant that "git" was the
directory name being preserved for usr/src/debug usage.  The patch
moves to using "${WORKDIR}/.." as the base, to ensure that the
WORKDIR naming is used in usr/src/debug.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package.bbclass |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 137de09..a7a5894 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -180,6 +180,7 @@ def splitfile(file, debugfile, debugsrcdir, d):
     objcopy = bb.data.getVar("OBJCOPY", d, True)
     debugedit = bb.data.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit", d)
     workdir = bb.data.expand("${WORKDIR}", d)
+    workparentdir = os.path.dirname(workdir)
     sourcefile = bb.data.expand("${WORKDIR}/debugsources.list", d)
 
     # We ignore kernel modules, we don't generate debug info files.
@@ -194,7 +195,7 @@ def splitfile(file, debugfile, debugsrcdir, d):
 
     # We need to extract the debug src information here...
     if debugsrcdir:
-	os.system("%s'%s' -b '%s' -d '%s' -i -l '%s' '%s'" % (pathprefix, debugedit, workdir, debugsrcdir, sourcefile, file))
+	os.system("%s'%s' -b '%s' -d '%s' -i -l '%s' '%s'" % (pathprefix, debugedit, workparentdir, debugsrcdir, sourcefile, file))
 
     bb.mkdirhier(os.path.dirname(debugfile))
 
@@ -222,15 +223,20 @@ def splitfile2(debugsrcdir, d):
     objcopy = bb.data.getVar("OBJCOPY", d, True)
     debugedit = bb.data.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedit", d)
     workdir = bb.data.expand("${WORKDIR}", d)
+    workparentdir = os.path.dirname(workdir)
+    workbasedir = os.path.basename(workdir)
     sourcefile = bb.data.expand("${WORKDIR}/debugsources.list", d)
 
     if debugsrcdir:
        bb.mkdirhier("%s%s" % (dvar, debugsrcdir))
 
        processdebugsrc =  "LC_ALL=C ; sort -z -u '%s' | egrep -v -z '(<internal>|<built-in>)$' | "
+       # We need to ignore files that are not actually ours
+       # we do this by only paying attention to items from this package
+       processdebugsrc += "egrep -z '%s' | "
        processdebugsrc += "(cd '%s' ; cpio -pd0mL '%s%s' 2>/dev/null)"
 
-       os.system(processdebugsrc % (sourcefile, workdir, dvar, debugsrcdir))
+       os.system(processdebugsrc % (sourcefile, workbasedir, workparentdir, dvar, debugsrcdir))
 
        # The copy by cpio may have resulted in some empty directories!  Remove these
        for root, dirs, files in os.walk("%s%s" % (dvar, debugsrcdir)):
-- 
1.7.1.1



