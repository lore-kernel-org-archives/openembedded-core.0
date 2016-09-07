Return-Path: <henry.bruce@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 8A687762B4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 21:09:56 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 07 Sep 2016 14:09:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,297,1470726000"; 
   d="scan'208";a="6137807"
Received: from hbruce-desk3.jf.intel.com ([10.7.198.61])
	by orsmga004.jf.intel.com with ESMTP; 07 Sep 2016 14:09:56 -0700
From: Henry Bruce <henry.bruce@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2016 14:09:54 -0700
Message-Id: <1473282594-28873-1-git-send-email-henry.bruce@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473199905-13645-2-git-send-email-henry.bruce@intel.com>
References: <1473199905-13645-2-git-send-email-henry.bruce@intel.com>
Subject: [PATCH 2/2 v2] utils.bbclass: Added error checking for oe_soinstall
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
X-List-Received-Date: Wed, 07 Sep 2016 21:09:57 -0000

Fixes [YOCTO #10146]

Signed-off-by: Henry Bruce <henry.bruce@intel.com>
---
 meta/classes/utils.bbclass | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index d56f51e..3c2a14f 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -62,15 +62,18 @@ def is_machine_specific(d):
 oe_soinstall() {
 	# Purpose: Install shared library file and
 	#          create the necessary links
-	# Example:
-	#
-	# oe_
-	#
-	#bbnote installing shared library $1 to $2
-	#
+	# Example: oe_soinstall libfoo.so.1.2.3 ${D}${libdir}
 	libname=`basename $1`
+	case "$libname" in
+	    *.so)
+	        bbfatal "oe_soinstall: Shared library must haved versioned filename (e.g. libfoo.so.1.2.3)"
+	        ;;
+	esac
 	install -m 755 $1 $2/$libname
 	sonamelink=`${HOST_PREFIX}readelf -d $1 |grep 'Library soname:' |sed -e 's/.*\[\(.*\)\].*/\1/'`
+	if [ -z $sonamelink ]; then
+		bbfatal "oe_soinstall: $libname is missing ELF tag 'SONAME'."
+	fi
 	solink=`echo $libname | sed -e 's/\.so\..*/.so/'`
 	ln -sf $libname $2/$sonamelink
 	ln -sf $libname $2/$solink
-- 
2.7.4


