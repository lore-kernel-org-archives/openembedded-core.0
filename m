Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TBN9H-0007Ts-Fm
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 11:52:51 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 11 Sep 2012 02:40:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,402,1344236400"; d="scan'208";a="143720389"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.164])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Sep 2012 02:40:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 10:40:14 +0100
Message-Id: <e55c5e1c5ff38173479e61f7196afabd51d09a35.1347356375.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1347356375.git.paul.eggleton@linux.intel.com>
References: <cover.1347356375.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1347356375.git.paul.eggleton@linux.intel.com>
References: <cover.1347356375.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] classes/sanity: skip tune checks if machine is invalid
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
X-List-Received-Date: Tue, 11 Sep 2012 09:52:51 -0000

If there is no valid machine configuration it's almost guaranteed that
the tune checks will fail, so just suppress them in that case.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sanity.bbclass |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 8f42fca..1210f14 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -320,13 +320,16 @@ def check_sanity(sanity_data):
         messages = messages + 'Bitbake version %s is required and version %s was found\n' % (minversion, bb.__version__)
 
     # Check that the MACHINE is valid, if it is set
+    machinevalid = True
     if sanity_data.getVar('MACHINE', True):
         if not check_conf_exists("conf/machine/${MACHINE}.conf", sanity_data):
             messages = messages + 'Please set a valid MACHINE in your local.conf or environment\n'
+            machinevalid = False
         else:
             messages = messages + check_sanity_validmachine(sanity_data)
     else:
         messages = messages + 'Please set a MACHINE in your local.conf or environment\n'
+        machinevalid = False
 
     # Check we are using a valid lacal.conf
     current_conf  = sanity_data.getVar('CONF_VERSION', True)
@@ -428,9 +431,10 @@ def check_sanity(sanity_data):
         messages = messages + pseudo_msg + '\n'
 
     check_supported_distro(sanity_data)
-    toolchain_msg = check_toolchain(sanity_data)
-    if toolchain_msg != "":
-        messages = messages + toolchain_msg + '\n'
+    if machinevalid:
+        toolchain_msg = check_toolchain(sanity_data)
+        if toolchain_msg != "":
+            messages = messages + toolchain_msg + '\n'
 
     # Check if DISPLAY is set if IMAGETEST is set
     if not sanity_data.getVar( 'DISPLAY', True ) and sanity_data.getVar( 'IMAGETEST', True ) == 'qemu':
-- 
1.7.9.5



