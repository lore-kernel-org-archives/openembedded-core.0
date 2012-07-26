Received: from ams-iport-3.cisco.com ([144.254.224.146])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1SuJLl-00030i-Nh
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 10:23:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=mertsas@cisco.com; l=2615; q=dns/txt;
	s=iport; t=1343290305; x=1344499905;
	h=from:to:cc:subject:date:message-id;
	bh=RZRmOmf0N2aOhRaIwZOBk+x5qhOyCYkAZlhu8wG3qKI=;
	b=BYnVJnlNy/rX65G6jLwgHUSqrjI1CINoYByuItXSR4y9X9y4XQrkCtmb
	bVBSqhQF4i+iZfZRkhwEjPaWbIDlxdBg9yAB6XlZ5npzrDAKmEn9zxqOv
	BqA/CivAUyKrMbz27bTi74LRkO1hjmNx3q33rPC+59kVYH/vF5Ff4I04j 0=;
X-IronPort-AV: E=Sophos;i="4.77,659,1336348800"; 
   d="scan'208";a="6901856"
Received: from ams-core-2.cisco.com ([144.254.72.75])
	by ams-iport-3.cisco.com with ESMTP; 26 Jul 2012 08:11:42 +0000
Received: from Lan.cisco.com (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-2.cisco.com (8.14.5/8.14.5) with ESMTP id q6Q8BgO0011906;
	Thu, 26 Jul 2012 08:11:42 GMT
From: Martin Ertsaas <mertsas@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2012 10:11:25 +0200
Message-Id: <1343290285-7095-1-git-send-email-mertsas@cisco.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH] gcc: Make it possbile for armcc and gcc to coexist.
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
X-List-Received-Date: Thu, 26 Jul 2012 08:23:14 -0000

Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    2 +-
 .../gcc/gcc-4.7/armcc-coexistence.patch.txt        |   12 ++++++++++++
 .../recipes-devtools/gcc/gcc-configure-runtime.inc |    6 ++++++
 3 files changed, 19 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/armcc-coexistence.patch.txt

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 43d77ec..709d7d8 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r7"
+PR = "r8"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.7.1
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/armcc-coexistence.patch.txt b/meta/recipes-devtools/gcc/gcc-4.7/armcc-coexistence.patch.txt
new file mode 100644
index 0000000..61c04ac
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.7/armcc-coexistence.patch.txt
@@ -0,0 +1,12 @@
+--- /usr/local/oecore-x86_64/sysroots/armv7ahf-vfp-neon-nimbus-linux-gnueabi/usr/include/c++/OE_TARGET_SYS/bits/c++config.h~	2012-06-15 11:47:57.000000000 +0200
++++ /usr/local/oecore-x86_64/sysroots/armv7ahf-vfp-neon-nimbus-linux-gnueabi/usr/include/c++/OE_TARGET_SYS/bits/c++config.h	2012-06-29 11:57:10.000000000 +0200
+@@ -1147,7 +1147,9 @@ namespace std
+ /* #undef _GLIBCXX_VERSION */
+ 
+ /* Define if the compiler supports C++11 atomics. */
++#ifndef __ARMCC_VERSION
+ #define _GLIBCXX_ATOMIC_BUILTINS 1
++#endif
+ 
+ /* Define to use concept checking code from the boost libraries. */
+ /* #undef _GLIBCXX_CONCEPT_CHECKS */
diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
index d40383c..cdb69bf 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
@@ -2,6 +2,8 @@ require gcc-configure-common.inc
 
 CXXFLAGS := "${@oe_filter_out('-fvisibility-inlines-hidden', '${CXXFLAGS}', d)}"
 
+SRC_URI += "file://armcc-coexistence.patch.txt"
+
 EXTRA_OECONF_PATHS = " \
     --with-gxx-include-dir=${includedir}/c++/ \
     --with-sysroot=${STAGING_DIR_TARGET} \
@@ -49,6 +51,10 @@ do_install () {
 			rmdir --ignore-fail-on-non-empty -p ${D}${datadir}/info
 		fi
 	done
+	cd ${D}${prefix}
+	cat ${S}/../armcc-coexistence.patch.txt \
+		| sed -e "s|OE_TARGET_SYS|${TARGET_SYS}|g" \
+		| patch -p7
 	chown -R root:root ${D}
 }
 
-- 
1.7.8.6



