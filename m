Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1S2E7u-00035l-OU
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 04:53:22 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 27 Feb 2012 19:44:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="71150457"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.62])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Feb 2012 19:44:54 -0800
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2012 11:42:55 +0800
Message-Id: <a69d8383a69e5ab74351cf9409c1daa5fc4e35e2.1330400450.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1330400450.git.lianhao.lu@intel.com>
References: <cover.1330400450.git.lianhao.lu@intel.com>
Subject: [PATCH 1/1] scripts/prserv-tool: Adepted to new bitbake cache.
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
X-List-Received-Date: Tue, 28 Feb 2012 03:53:23 -0000

Adepted to the new bitbake cache mechanism which is based on file
content but not on file timp stamps any more.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 scripts/bitbake-prserv-tool |   28 +++++++++++++++++-----------
 1 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/scripts/bitbake-prserv-tool b/scripts/bitbake-prserv-tool
index 6c0584c..f3855df 100755
--- a/scripts/bitbake-prserv-tool
+++ b/scripts/bitbake-prserv-tool
@@ -9,16 +9,23 @@ help ()
     echo -e "\timport <file>: import the AUTOPR values from the exported file into the PR service."
 }
 
-export ()
+clean_cache()
+{
+    s=`bitbake -e | grep ^CACHE= | cut -f2 -d\"`
+    if [ "x${s}" != "x" ]; then
+        rm -rf ${s}
+    fi
+}
+
+do_export ()
 {
     file=$1
     [ "x${file}" == "x" ] && help && exit 1
     rm -f ${file}
 
-    touch dummy.inc
-    bitbake -R conf/prexport.conf -R dummy.inc -p
-    s=`bitbake -R conf/prexport.conf -R dummy.inc -e | grep ^PRSERV_DUMPFILE= | cut -f2 -d\"`
-    rm -f dummy.inc
+    clean_cache
+    bitbake -R conf/prexport.conf -p
+    s=`bitbake -R conf/prexport.conf -e | grep ^PRSERV_DUMPFILE= | cut -f2 -d\"`
     if [ "x${s}" != "x" ];
     then
        [ -e $s ] && mv -f $s $file && echo "Exporting to file $file succeeded!"
@@ -28,15 +35,14 @@ export ()
     return 1
 }
 
-import ()
+do_import ()
 {
     file=$1
     [ "x${file}" == "x" ] && help && exit 1
 
-    touch dummy.inc
-    bitbake -R conf/primport.conf -R dummy.inc -R $file -p
+    clean_cache
+    bitbake -R conf/primport.conf -R $file -p
     ret=$?
-    rm -f dummy.inc
     [ $ret -eq 0 ] && echo "Importing from file $file succeeded!" || echo "Importing from file $file failed!"
     return $ret
 }
@@ -45,10 +51,10 @@ import ()
 
 case $1 in
 export)
-    export $2
+    do_export $2
     ;;
 import)
-    import $2
+    do_import $2
     ;;
 *)
     help
-- 
1.7.0.4



