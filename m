Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QesVK-0000bo-Ir
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 19:36:46 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Jul 2011 10:32:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,494,1304319600"; d="scan'208";a="23980090"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.202])
	by azsmga001.ch.intel.com with ESMTP; 07 Jul 2011 10:32:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2011 18:32:47 +0100
Message-Id: <2a4386a98ed2f0fa7346bf9eaf1ba8f2b370f424.1310059749.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1310059749.git.paul.eggleton@linux.intel.com>
References: <cover.1310059749.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1310059749.git.paul.eggleton@linux.intel.com>
References: <cover.1310059749.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] insane.bbclass: fix error/warning status being inverted
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
X-List-Received-Date: Thu, 07 Jul 2011 17:36:47 -0000

Fix package_qa_handle_error so that it returns the correct values in order
to determine error/warning status.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/insane.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 1cf7014..1567f36 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -112,10 +112,10 @@ def package_qa_handle_error(error_class, error_msg, d):
     package_qa_write_error(error_msg, d)
     if error_class in (d.getVar("ERROR_QA", True) or "").split():
         bb.error("QA Issue: %s" % error_msg)
-        return True
+        return False
     else:
         bb.warn("QA Issue: %s" % error_msg)
-        return False
+        return True
 
 QAPATHTEST[rpaths] = "package_qa_check_rpath"
 def package_qa_check_rpath(file,name, d, elf, messages):
-- 
1.7.4.1



