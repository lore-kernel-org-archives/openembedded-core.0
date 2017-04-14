Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 259FB77E7F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 09:22:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3E9MRfF026275
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 02:22:29 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 14 Apr 2017 02:22:26 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Apr 2017 02:22:25 -0700
Message-ID: <e697053add75e554ed67c2745aa41a6b69481112.1492161522.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1492161522.git.liezhi.yang@windriver.com>
References: <cover.1492161522.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] oe-run-native: print more error messages
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
X-List-Received-Date: Fri, 14 Apr 2017 09:22:29 -0000
Content-Type: text/plain

Fixed:
$ bitbake bmap-tools-native -ccleansstate && bitbake bmap-tools-native && oe-run-native bmap-tools-native bmaptool --help
[snip]
Error: Unable to find '' in <PATH>
[snip]

Note the blank '' word, it was because "tools" was overrided, now fix it.

And also check whether the recipe is a native one or not.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/oe-run-native | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/scripts/oe-run-native b/scripts/oe-run-native
index 12f7ce6..1131122 100755
--- a/scripts/oe-run-native
+++ b/scripts/oe-run-native
@@ -22,7 +22,7 @@
 #
 
 if [ $# -lt 1 -o "$1" = '--help' -o "$1" = '-h' ] ; then
-    echo 'oe-run-native: error: the following arguments are required: <native recipe> <native tool>'
+    echo 'oe-run-native: the following arguments are required: <native recipe> <native tool>'
     echo 'Usage: oe-run-native native-recipe tool [parameters]'
     echo ''
     echo 'OpenEmbedded run-native - runs native tools'
@@ -36,6 +36,13 @@ fi
 
 native_recipe="$1"
 tool="$2"
+
+if [ "${native_recipe%-native}" = "$native_recipe" ]; then
+    echo Error: $native_recipe is not a native recipe
+    echo Error: Use \"oe-run-native -h\" for help
+    exit 1
+fi
+
 shift
 
 SYSROOT_SETUP_SCRIPT=`which oe-find-native-sysroot 2> /dev/null`
@@ -49,12 +56,13 @@ OLD_PATH=$PATH
 
 # look for a tool only in native sysroot
 PATH=$OECORE_NATIVE_SYSROOT/usr/bin:$OECORE_NATIVE_SYSROOT/bin:$OECORE_NATIVE_SYSROOT/usr/sbin:$OECORE_NATIVE_SYSROOT/sbin
-tool=`/usr/bin/which $tool 2>/dev/null`
+tool_find=`/usr/bin/which $tool 2>/dev/null`
 
-if [ -n "$tool" ] ; then
+if [ -n "$tool_find" ] ; then
     # add old path to allow usage of host tools
     PATH=$PATH:$OLD_PATH $@
 else
     echo "Error: Unable to find '$tool' in $PATH"
+    echo "Error: Have you run 'bitbake $native_recipe -caddto_recipe_sysroot'?"
     exit 1
 fi
-- 
2.10.2


