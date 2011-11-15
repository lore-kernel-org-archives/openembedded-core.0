Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RQQBz-0001Vi-2p
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 22:05:19 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 15 Nov 2011 12:58:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,517,1315206000"; d="scan'208";a="37410720"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Nov 2011 12:58:53 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2011 12:58:41 -0800
Message-Id: <c1c1c1796ea7139ac1124aef3656ae030d1bcb7b.1321389699.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321389699.git.sgw@linux.intel.com>
References: <cover.1321389699.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321389699.git.sgw@linux.intel.com>
References: <cover.1321389699.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/16] gnu-config: update to git HEAD
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
X-List-Received-Date: Tue, 15 Nov 2011 21:05:21 -0000

Licence has update timestamp and Copyright year.
This change needs a coresponding change to ASSUME_PROVIDED
to add git-native

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gnu-config/config-guess-uclibc.patch           |  145 +++++++++-----------
 .../{gnu-config_20080123.bb => gnu-config_git.bb}  |   15 +-
 2 files changed, 75 insertions(+), 85 deletions(-)
 rename meta/recipes-devtools/gnu-config/{gnu-config_20080123.bb => gnu-config_git.bb} (73%)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config/config-guess-uclibc.patch b/meta/recipes-devtools/gnu-config/gnu-config/config-guess-uclibc.patch
index f862c83..dc15d91 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config/config-guess-uclibc.patch
+++ b/meta/recipes-devtools/gnu-config/gnu-config/config-guess-uclibc.patch
@@ -4,12 +4,14 @@ Patch courtesy gentoo-portage/sys-devel/gnuconfig/files/automake-1.8.5-config-gu
 
 updated to 20050516 by Marcin 'Hrw' Juszkiewicz (by hand)
 updated to 20080123 by Nitin A Kamble (by hand)
+updated to 20111001 by Saul Wold (by hand)
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
-Index: config/config.guess
+Index: git/config.guess
 ===================================================================
---- config.orig/config.guess
-+++ config/config.guess
-@@ -139,6 +139,19 @@ UNAME_RELEASE=`(uname -r) 2>/dev/null` |
+--- git.orig/config.guess	2011-10-20 15:15:25.000000000 -0700
++++ git/config.guess	2011-10-20 16:56:43.810830229 -0700
+@@ -140,6 +140,19 @@
  UNAME_SYSTEM=`(uname -s) 2>/dev/null`  || UNAME_SYSTEM=unknown
  UNAME_VERSION=`(uname -v) 2>/dev/null` || UNAME_VERSION=unknown
  
@@ -29,14 +31,26 @@ Index: config/config.guess
  # Note: order is significant - the case branches are not exclusive.
  
  case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
-@@ -840,13 +853,13 @@ EOF
+@@ -871,15 +884,15 @@
+ 	  EV68*) UNAME_MACHINE=alphaev68 ;;
+ 	esac
+ 	objdump --private-headers /bin/sh | grep -q ld.so.1
+-	if test "$?" = 0 ; then LIBC="libc1" ; else LIBC="" ; fi
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu${LIBC}
++	if test "$?" = 0 ; then LIBC="gnulibc1" ; else LIBC="" ; fi
++	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
+ 	exit ;;
+     arm*:Linux:*:*)
+ 	eval $set_cc_for_build
  	if echo __ARM_EABI__ | $CC_FOR_BUILD -E - 2>/dev/null \
  	    | grep -q __ARM_EABI__
  	then
 -	    echo ${UNAME_MACHINE}-unknown-linux-gnu
 +	    echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
  	else
- 	    echo ${UNAME_MACHINE}-unknown-linux-gnueabi
+ 	    if echo __ARM_PCS_VFP | $CC_FOR_BUILD -E - 2>/dev/null \
+ 		| grep -q __ARM_PCS_VFP
+@@ -891,19 +904,19 @@
  	fi
  	exit ;;
      avr32*:Linux:*:*)
@@ -44,13 +58,25 @@ Index: config/config.guess
 +	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
  	exit ;;
      cris:Linux:*:*)
- 	echo cris-axis-linux-gnu
-@@ -855,16 +868,16 @@ EOF
- 	echo crisv32-axis-linux-gnu
+-	echo cris-axis-linux-gnu
++	echo cris-axis-linux-${LIBC}
+ 	exit ;;
+     crisv32:Linux:*:*)
+-	echo crisv32-axis-linux-gnu
++	echo crisv32-axis-linux-${LIBC}
  	exit ;;
      frv:Linux:*:*)
--    	echo frv-unknown-linux-gnu
-+    	echo frv-unknown-linux-${LIBC}
+-	echo frv-unknown-linux-gnu
++	echo frv-unknown-linux-${LIBC}
+ 	exit ;;
+     hexagon:Linux:*:*)
+-	echo hexagon-unknown-linux-gnu
++	echo hexagon-unknown-linux-${LIBC}
+ 	exit ;;
+     i*86:Linux:*:*)
+ 	LIBC=gnu
+@@ -917,13 +930,13 @@
+ 	echo "${UNAME_MACHINE}-pc-linux-${LIBC}"
  	exit ;;
      ia64:Linux:*:*)
 -	echo ${UNAME_MACHINE}-unknown-linux-gnu
@@ -64,21 +90,12 @@ Index: config/config.guess
 -	echo ${UNAME_MACHINE}-unknown-linux-gnu
 +	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
  	exit ;;
-     mips:Linux:*:*)
+     mips:Linux:*:* | mips64:Linux:*:*)
  	eval $set_cc_for_build
-@@ -887,7 +900,7 @@ EOF
- 		s: ::g
- 		p
- 	    }'`"
--	test x"${CPU}" != x && { echo "${CPU}-unknown-linux-gnu"; exit; }
-+	test x"${CPU}" != x && { echo "${CPU}-unknown-linux-${LIBC}"; exit; }
- 	;;
-     mips64:Linux:*:*)
- 	eval $set_cc_for_build
-@@ -910,16 +923,16 @@ EOF
- 		s: ::g
- 		p
- 	    }'`"
+@@ -942,54 +955,54 @@
+ 	#endif
+ EOF
+ 	eval `$CC_FOR_BUILD -E $dummy.c 2>/dev/null | grep '^CPU'`
 -	test x"${CPU}" != x && { echo "${CPU}-unknown-linux-gnu"; exit; }
 +	test x"${CPU}" != x && { echo "${CPU}-unknown-linux-${LIBC}"; exit; }
  	;;
@@ -86,24 +103,13 @@ Index: config/config.guess
 -	echo or32-unknown-linux-gnu
 +	echo or32-unknown-linux-${LIBC}
  	exit ;;
-     ppc:Linux:*:*)
--	echo powerpc-unknown-linux-gnu
-+	echo powerpc-unknown-linux-${LIBC}
- 	exit ;;
-     ppc64:Linux:*:*)
--	echo powerpc64-unknown-linux-gnu
-+	echo powerpc64-unknown-linux-${LIBC}
+     padre:Linux:*:*)
+-	echo sparc-unknown-linux-gnu
++	echo sparc-unknown-linux-${LIBC}
  	exit ;;
-     alpha:Linux:*:*)
- 	case `sed -n '/^cpu model/s/^.*: \(.*\)/\1/p' < /proc/cpuinfo` in
-@@ -932,40 +945,40 @@ EOF
- 	  EV68*) UNAME_MACHINE=alphaev68 ;;
-         esac
- 	objdump --private-headers /bin/sh | grep ld.so.1 >/dev/null
--	if test "$?" = 0 ; then LIBC="libc1" ; else LIBC="" ; fi
--	echo ${UNAME_MACHINE}-unknown-linux-gnu${LIBC}
-+	if test "$?" = 0 ; then LIBC="gnulibc1" ; fi
-+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
+     parisc64:Linux:*:* | hppa64:Linux:*:*)
+-	echo hppa64-unknown-linux-gnu
++	echo hppa64-unknown-linux-${LIBC}
  	exit ;;
      parisc:Linux:*:* | hppa:Linux:*:*)
  	# Look for CPU level
@@ -116,16 +122,20 @@ Index: config/config.guess
 +	  *)    echo hppa-unknown-linux-${LIBC} ;;
  	esac
  	exit ;;
-     parisc64:Linux:*:* | hppa64:Linux:*:*)
--	echo hppa64-unknown-linux-gnu
-+	echo hppa64-unknown-linux-${LIBC}
+     ppc64:Linux:*:*)
+-	echo powerpc64-unknown-linux-gnu
++	echo powerpc64-unknown-linux-${LIBC}
+ 	exit ;;
+     ppc:Linux:*:*)
+-	echo powerpc-unknown-linux-gnu
++	echo powerpc-unknown-linux-${LIBC}
  	exit ;;
      s390:Linux:*:* | s390x:Linux:*:*)
  	echo ${UNAME_MACHINE}-ibm-linux
  	exit ;;
      sh64*:Linux:*:*)
--    	echo ${UNAME_MACHINE}-unknown-linux-gnu
-+    	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu
++	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
  	exit ;;
      sh*:Linux:*:*)
 -	echo ${UNAME_MACHINE}-unknown-linux-gnu
@@ -135,42 +145,21 @@ Index: config/config.guess
 -	echo ${UNAME_MACHINE}-unknown-linux-gnu
 +	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
  	exit ;;
+     tile*:Linux:*:*)
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu
++	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
+ 	exit ;;
      vax:Linux:*:*)
- 	echo ${UNAME_MACHINE}-dec-linux-gnu
+-	echo ${UNAME_MACHINE}-dec-linux-gnu
++	echo ${UNAME_MACHINE}-dec-linux-${LIBC}
  	exit ;;
      x86_64:Linux:*:*)
 -	echo x86_64-unknown-linux-gnu
 +	echo x86_64-unknown-linux-${LIBC}
  	exit ;;
      xtensa*:Linux:*:*)
--    	echo ${UNAME_MACHINE}-unknown-linux-gnu
-+    	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu
++	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
  	exit ;;
-     i*86:Linux:*:*)
- 	# The BFD linker knows what the default object file format is, so
-@@ -980,20 +993,21 @@ EOF
- 				    p'`
-         case "$ld_supported_targets" in
- 	  elf32-i386)
--		TENTATIVE="${UNAME_MACHINE}-pc-linux-gnu"
-+		TENTATIVE="${UNAME_MACHINE}-pc-linux-${LIBC}"
- 		;;
- 	  a.out-i386-linux)
--		echo "${UNAME_MACHINE}-pc-linux-gnuaout"
-+		echo "${UNAME_MACHINE}-pc-linux-${LIBC}aout"
- 		exit ;;
- 	  coff-i386)
--		echo "${UNAME_MACHINE}-pc-linux-gnucoff"
-+		echo "${UNAME_MACHINE}-pc-linux-${LIBC}coff"
- 		exit ;;
- 	  "")
- 		# Either a pre-BFD a.out linker (linux-gnuoldld) or
- 		# one that does not give us useful --help.
--		echo "${UNAME_MACHINE}-pc-linux-gnuoldld"
-+		echo "${UNAME_MACHINE}-pc-linux-${LIBC}oldld"
- 		exit ;;
- 	esac
-+	if [ $LIBC != "gnu" -o $LIBC != "gnulibc1" ];then echo "$TENTATIVE" && exit; fi
- 	# Determine whether the default compiler is a.out or elf
- 	eval $set_cc_for_build
- 	sed 's/^	//' << EOF >$dummy.c
+     i*86:DYNIX/ptx:4*:*)
+ 	# ptx 4.0 does uname -s correctly, with DYNIX/ptx in there.
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
similarity index 73%
rename from meta/recipes-devtools/gnu-config/gnu-config_20080123.bb
rename to meta/recipes-devtools/gnu-config/gnu-config_git.bb
index f93d342..0fdee66 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_20080123.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -1,21 +1,22 @@
 SUMMARY = "gnu-configize"
 DESCRIPTION = "Tool that installs the GNU config.guess / config.sub into a directory tree"
 SECTION = "devel"
-LICENSE = "GPLv1+"
-LIC_FILES_CHKSUM = "file://config.guess;endline=39;md5=a089987af4a25cb0419d1c2fd6d495e3"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://config.guess;endline=39;md5=0e6ca0501b27177f3bc640f7225e3ead"
 
 DEPENDS_virtclass-native = "perl-native-runtime"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-FIXEDSRCDATE = "${@d.getVar('FILE', 1).split('_')[-1].split('.')[0]}"
-PV = "0.1+cvs${FIXEDSRCDATE}"
-PR = "r4"
+SRCREV = "a47f842264fc19837f8a00eb1d2d254a4c527334"
+PV = "1.0+git${SRCPV}"
+PR = "r0"
 
-SRC_URI = "cvs://anonymous@cvs.sv.gnu.org/cvsroot/config;module=config;method=pserver;date=${FIXEDSRCDATE} \
+SRC_URI = "git://git.sv.gnu.org/config.git;protocol=git \
 	   file://config-guess-uclibc.patch \
            file://gnu-configize.in"
-S = "${WORKDIR}/config"
+
+S = "${WORKDIR}/git"
 
 do_compile() {
 	:
-- 
1.7.6.4



