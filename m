Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T1gtY-0003BY-Sf
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 18:56:37 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Aug 2012 09:44:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,773,1336374000"; d="scan'208";a="181097523"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.76])
	by orsmga001.jf.intel.com with ESMTP; 15 Aug 2012 09:44:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Aug 2012 17:44:33 +0100
Message-Id: <1345049073-27898-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] classes/chrpath: trigger an error if chrpath fails
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
X-List-Received-Date: Wed, 15 Aug 2012 16:56:37 -0000

If chrpath failed here we were just silently ignoring it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/chrpath.bbclass |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index 10b5ca0..ad61fe0 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -74,7 +74,9 @@ def process_dir (directory, d):
             if len(new_rpaths):
                 args = ":".join(new_rpaths)
                 #bb.note("Setting rpath for %s to %s" %(fpath, args))
-                sub.call([cmd, '-r', args, fpath])
+                ret = sub.call([cmd, '-r', args, fpath])
+                if ret != 0:
+                    bb.error("chrpath command failed with exit code %d" % ret)
 
             if perms:
                 os.chmod(fpath, perms)
-- 
1.7.9.5



