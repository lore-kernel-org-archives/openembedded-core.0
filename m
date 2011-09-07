Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R1KiD-0008Sr-Og
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 18:10:55 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Sep 2011 09:05:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,346,1312182000"; d="scan'208";a="50058164"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.53])
	by fmsmga002.fm.intel.com with ESMTP; 07 Sep 2011 09:05:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2011 17:05:40 +0100
Message-Id: <529b4c300df54eac60f56c2eb9063ea7fc034945.1315411460.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1315411459.git.paul.eggleton@linux.intel.com>
References: <cover.1315411459.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1315411459.git.paul.eggleton@linux.intel.com>
References: <cover.1315411459.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] sanity.bbclass: re-enable DISTRO check
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
X-List-Received-Date: Wed, 07 Sep 2011 16:10:55 -0000

If DISTRO has been specified, ensure it is valid. (Unset or empty string
is valid for DISTRO in OE-core by the use of defaultsetup.conf.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sanity.bbclass |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 44b0688..93008cc 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -269,10 +269,12 @@ def check_sanity(e):
     if os.path.exists(dldir) and not os.access(dldir, os.W_OK):
         messages = messages + "DL_DIR: %s exists but you do not appear to have write access to it. \n" % dldir
     
-    # Check that the DISTRO is valid
+    # Check that the DISTRO is valid, if set
     # need to take into account DISTRO renaming DISTRO
-    #if not ( check_conf_exists("conf/distro/${DISTRO}.conf", e.data) or check_conf_exists("conf/distro/include/${DISTRO}.inc", e.data) ):
-    #    messages = messages + "DISTRO '%s' not found. Please set a valid DISTRO in your local.conf\n" % data.getVar("DISTRO", e.data, True )
+    distro = data.getVar('DISTRO', e.data, True)
+    if distro:
+        if not ( check_conf_exists("conf/distro/${DISTRO}.conf", e.data) or check_conf_exists("conf/distro/include/${DISTRO}.inc", e.data) ):
+            messages = messages + "DISTRO '%s' not found. Please set a valid DISTRO in your local.conf\n" % data.getVar("DISTRO", e.data, True )
 
     missing = ""
 
-- 
1.7.4.1



