Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U67IV-0005tB-Sl
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 23:28:58 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 Feb 2013 14:12:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,666,1355126400"; d="scan'208";a="287425753"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.50])
	by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2013 14:12:51 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Feb 2013 14:12:51 -0800
Message-Id: <1360879971-10995-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] remake: do not create po files
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
X-List-Received-Date: Thu, 14 Feb 2013 22:28:59 -0000

The 'make update' was using wget to get the gmo and other gnu files from
upstream, since need to work cleanly in a non-networked or proxy environment
this does not so well.  Remove the list of languages from the LINGUAS file.

[YOCTO #3745]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/remake/remake_git.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/remake/remake_git.bb b/meta/recipes-devtools/remake/remake_git.bb
index 7e9857e9..42c4d48 100644
--- a/meta/recipes-devtools/remake/remake_git.bb
+++ b/meta/recipes-devtools/remake/remake_git.bb
@@ -13,13 +13,11 @@ DEPENDS += "readline"
 PROVIDES += "make"
 
 do_configure_prepend() {
+    # remove the default LINGUAS since we are not going to generate languages
+    rm po/LINGUAS
+    touch po/LINGUAS
     # create config.rpath which required by configure.ac
     autopoint || touch config.rpath
 }
 
-do_compile_prepend() {
-    # updating .po and other gnu build files
-    make update
-}
-
 BBCLASSEXTEND = "native"
-- 
1.8.0.2



