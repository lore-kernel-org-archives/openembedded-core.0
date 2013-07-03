Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3678F61EEB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 15:09:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Jul 2013 08:09:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,988,1363158000"; d="scan'208";a="364232364"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.227])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2013 08:09:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jul 2013 16:09:32 +0100
Message-Id: <1372864172-5346-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH v2] classes/insane: fix libdir check regexes
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
X-List-Received-Date: Wed, 03 Jul 2013 15:09:34 -0000

Ensure these do not pick up e.g. /lib/systemd/system/uuidd.socket, but
ensure we pickup e.g. /usr/lib/libnss3.so.1d (example from Debian). This
also fixes the broken exec_re regex (lib*.).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/insane.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 27c225f..938c84e 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -265,8 +265,8 @@ def package_qa_check_libdir(d):
             full_path = os.path.join(root,file)
             my_files.append(full_path[len(pkgd):])
 
-    lib_re = re.compile("^/lib.*\.so")
-    exec_re = re.compile("^%s.*/lib*.\.so" % exec_prefix)
+    lib_re = re.compile("^lib.+\.so(\..+)?$")
+    exec_re = re.compile("^%s.*/lib.+\.so(\..+)?$" % exec_prefix)
 
     for file in my_files:
         if lib_re.match(file):
-- 
1.8.1.2


