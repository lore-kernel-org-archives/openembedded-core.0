Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTTbJ-0005m5-KN
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 08:47:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jun 2011 23:44:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,325,1304319600"; 
   d="scan'208";a="7608989"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.187])
	by azsmga001.ch.intel.com with ESMTP; 05 Jun 2011 23:44:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Jun 2011 23:44:11 -0700
Message-Id: <9238ac3d52148e87a394ccd2911a1dc61912cd54.1307342214.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [CONSOLIDATED PULL 07/20] base.bbclass: add cleansstate task between clean and cleanall
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
X-List-Received-Date: Mon, 06 Jun 2011 06:47:49 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* sometimes it's usefull to remove only sstate cache and keep downloaded sources for rebuild

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/base.bbclass |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 8f4ef1e..6f0484e 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -408,10 +408,13 @@ def check_gcc3(data):
 	
 	return False
 
-addtask cleanall after do_clean
-python do_cleanall() {
+addtask cleansstate after do_clean
+python do_cleansstate() {
         sstate_clean_cachefiles(d)
+}
 
+addtask cleanall after do_cleansstate
+python do_cleanall() {
         src_uri = (bb.data.getVar('SRC_URI', d, True) or "").split()
         if len(src_uri) == 0:
             return
-- 
1.7.3.4



