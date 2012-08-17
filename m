Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T2Ml2-0006IL-5l
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 15:38:36 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 Aug 2012 06:26:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,784,1336374000"; d="scan'208";a="135396426"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.90])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Aug 2012 06:26:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 14:26:33 +0100
Message-Id: <1345209993-19303-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] classes/chrpath: improve chrpath failure handling
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
X-List-Received-Date: Fri, 17 Aug 2012 13:38:36 -0000

When chrpath fails, prefix the error message with the name of the recipe
that is being processed, and include the the output from chrpath, as
well as making the calling task actually fail.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/chrpath.bbclass |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index ad61fe0..8922248 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -74,9 +74,11 @@ def process_dir (directory, d):
             if len(new_rpaths):
                 args = ":".join(new_rpaths)
                 #bb.note("Setting rpath for %s to %s" %(fpath, args))
-                ret = sub.call([cmd, '-r', args, fpath])
-                if ret != 0:
-                    bb.error("chrpath command failed with exit code %d" % ret)
+                p = sub.Popen([cmd, '-r', args, fpath],stdout=sub.PIPE,stderr=sub.PIPE)
+                out, err = p.communicate()
+                if p.returncode != 0:
+                    bb.error("%s: chrpath command failed with exit code %d:\n%s%s" % (d.getVar('PN', True), p.returncode, out, err))
+                    raise bb.build.FuncFailed
 
             if perms:
                 os.chmod(fpath, perms)
-- 
1.7.9.5



