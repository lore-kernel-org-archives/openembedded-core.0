Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 2D3076A2F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 14:37:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 23 May 2013 07:37:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,728,1363158000"; d="scan'208";a="338891616"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.171])
	by fmsmga001.fm.intel.com with ESMTP; 23 May 2013 07:37:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2013 07:37:12 -0700
Message-Id: <1369319832-24797-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] siteinfo: add existiance check for site config file
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
X-List-Received-Date: Thu, 23 May 2013 14:37:13 -0000

There is a condition where ncurses adds a site config file to CONFIG_SITE list
and then binutils configure tries to use the siteinfo list before ncurses has
installed the file.  The existance test is there in the BBPATH search, but not
in the SYSROOTCACHE check, so add it here.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/siteinfo.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 09f88c6..87a4225 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -139,7 +139,8 @@ def siteinfo_get_files(d, no_cache = False):
     if os.path.isdir(path_siteconfig):
         for i in os.listdir(path_siteconfig):
             filename = os.path.join(path_siteconfig, i)
-            sitefiles += filename + " "
+            if os.path.exists(filename):
+                sitefiles += filename + " "
 
     return sitefiles
 
-- 
1.8.1.4


