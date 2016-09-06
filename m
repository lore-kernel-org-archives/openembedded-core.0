Return-Path: <henry.bruce@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 39B9F774AE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 22:11:48 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 06 Sep 2016 15:11:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,293,1470726000"; 
   d="scan'208";a="5709795"
Received: from hbruce-desk3.jf.intel.com ([10.7.198.61])
	by orsmga004.jf.intel.com with ESMTP; 06 Sep 2016 15:11:47 -0700
From: Henry Bruce <henry.bruce@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2016 15:11:45 -0700
Message-Id: <1473199905-13645-2-git-send-email-henry.bruce@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473199905-13645-1-git-send-email-henry.bruce@intel.com>
References: <1473199905-13645-1-git-send-email-henry.bruce@intel.com>
Subject: [PATCH 2/2] utils.bbclass: Added error checking for oe_soinstall
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
X-List-Received-Date: Tue, 06 Sep 2016 22:11:49 -0000

Fixes [YOCTO #10146]

Signed-off-by: Henry Bruce <henry.bruce@intel.com>
---
 meta/classes/utils.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index d56f51e..aa033d5 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -62,15 +62,16 @@ def is_machine_specific(d):
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
+	if [[ "$libname" == *.so ]]; then
+		bbfatal "oe_soinstall: Shared library must haved versioned filename (e.g. libfoo.so.1.2.3)"
+	fi
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


