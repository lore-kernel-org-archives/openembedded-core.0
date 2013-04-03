Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UNI7G-0000SR-O9
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 09:28:18 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Apr 2013 00:11:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,399,1363158000"; d="scan'208";a="222221662"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.234])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Apr 2013 00:10:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2013 08:10:53 +0100
Message-Id: <1364973053-28019-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] classes/sstate: avoid traceback when no files have been staged
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
X-List-Received-Date: Wed, 03 Apr 2013 07:28:19 -0000

If no files have been staged we want to continue without error instead
of showing a traceback.

Fixes [YOCTO #4056].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sstate.bbclass |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 3f4f43d..67ddc46 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -197,7 +197,8 @@ def sstate_install(ss, d):
 
     # Run the actual file install
     for state in ss['dirs']:
-        oe.path.copytree(state[1], state[2])
+        if os.path.exists(state[1]):
+            oe.path.copytree(state[1], state[2])
 
     for postinst in (d.getVar('SSTATEPOSTINSTFUNCS', True) or '').split():
         bb.build.exec_func(postinst, d)
@@ -448,6 +449,8 @@ def sstate_package(ss, d):
     bb.mkdirhier(sstatebuild)
     bb.mkdirhier(os.path.dirname(sstatepkg))
     for state in ss['dirs']:
+        if not os.path.exists(state[1]):
+            continue
         srcbase = state[0].rstrip("/").rsplit('/', 1)[0]
         for walkroot, dirs, files in os.walk(state[1]):
             for file in files:
-- 
1.7.10.4



