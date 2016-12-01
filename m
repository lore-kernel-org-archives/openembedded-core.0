Return-Path: <anibal.limon@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C993C71B25
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 16:32:27 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 01 Dec 2016 08:32:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,282,1477983600"; d="scan'208";a="36237585"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.149])
	by orsmga004.jf.intel.com with ESMTP; 01 Dec 2016 08:32:26 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2016 10:34:25 -0600
Message-Id: <1480610065-25697-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] perl-native: Remove usage of -fstack-protector=strong
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
X-List-Received-Date: Thu, 01 Dec 2016 16:32:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some distributions (like opensuse421) supported by the project
comes with older gcc releases, -fstack-protector=strong is supported
by GCC>=4.9.

This causes a build failure when install perl-native from a sstate that
comes from a machine supporting -fstack-protector=strong [1].

So disable usage of this flag in perl-native builds, this patch could
be removed when all supported distros comes with GCC>=4.9.

[YOCTO #10338]

[1] http://errors.yoctoproject.org/Errors/Details/109589/

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-devtools/perl/perl-native_5.24.0.bb   |   1 +
 ...emove-fstack-protector-strong-for-native-.patch | 103 +++++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/0001-Configure-Remove-fstack-protector-strong-for-native-.patch

diff --git a/meta/recipes-devtools/perl/perl-native_5.24.0.bb b/meta/recipes-devtools/perl/perl-native_5.24.0.bb
index af2ad7b..b1f0179 100644
--- a/meta/recipes-devtools/perl/perl-native_5.24.0.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.24.0.bb
@@ -11,6 +11,7 @@ SRC_URI += "\
            file://debian/errno_ver.diff \
            file://dynaloaderhack.patch \
            file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
+           file://0001-Configure-Remove-fstack-protector-strong-for-native-.patch \
           "
 
 SRC_URI[md5sum] = "59456ae4bd4b06cb6e57cb19a3b2d349"
diff --git a/meta/recipes-devtools/perl/perl/0001-Configure-Remove-fstack-protector-strong-for-native-.patch b/meta/recipes-devtools/perl/perl/0001-Configure-Remove-fstack-protector-strong-for-native-.patch
new file mode 100644
index 0000000..7391ac5
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/0001-Configure-Remove-fstack-protector-strong-for-native-.patch
@@ -0,0 +1,103 @@
+Some distributions (like opensuse421) supported by the project
+comes with older gcc releases, -fstack-protector=strong is supported
+by GCC>=4.9.
+
+This causes a build failure when install perl-native from a sstate that
+comes from a machine supporting -fstack-protector=strong [1].
+
+So disable usage of this flag in perl-native builds, this patch could
+be removed when all supported distros comes with GCC>=4.9.
+
+[YOCTO #10338]
+
+Upstream-status: Inappropriate [configuration]
+
+[1] http://errors.yoctoproject.org/Errors/Details/109589/
+
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+---
+ Configure | 54 ------------------------------------------------------
+ 1 file changed, 54 deletions(-)
+
+diff --git a/Configure b/Configure
+index efbdcfd..d5bd98c 100755
+--- a/Configure
++++ b/Configure
+@@ -5468,30 +5468,6 @@ default|recommended)
+ 		eval $checkccflag
+ 		;;
+ 	esac
+-
+-	# on x86_64 (at least) we require an extra library (libssp) in the
+-	# link command line. This library is not named, so I infer that it is
+-	# an implementation detail that may change. Hence the safest approach
+-	# is to add the flag to the flags passed to the compiler at link time,
+-	# as that way the compiler can do the right implementation dependant
+-	# thing. (NWC)
+-	case "$osname" in
+-	amigaos) ;; # -fstack-protector builds but doesn't work
+-	*)	case "$gccversion" in
+-		?*)	set stack-protector-strong -fstack-protector-strong
+-			eval $checkccflag
+-			case "$dflt" in
+-			*-fstack-protector-strong*) ;; # It got added.
+-			*) # Try the plain/older -fstack-protector.
+-			   set stack-protector -fstack-protector
+-			   eval $checkccflag
+-			   ;;
+-			esac
+-			;;
+-		esac
+-		;;
+-	esac
+-	;;
+ esac
+ 
+ case "$mips_type" in
+@@ -5634,21 +5610,6 @@ case "$ldflags" in
+ 	;;
+ *) dflt="$ldflags";;
+ esac
+-# See note above about -fstack-protector
+-case "$ccflags" in
+-*-fstack-protector-strong*)
+-	case "$dflt" in
+-	*-fstack-protector-strong*) ;; # Don't add it again
+-	*) dflt="$dflt -fstack-protector-strong" ;;
+-	esac
+-	;;
+-*-fstack-protector*)
+-	case "$dflt" in
+-	*-fstack-protector*) ;; # Don't add it again
+-	*) dflt="$dflt -fstack-protector" ;;
+-	esac
+-	;;
+-esac
+ 
+ : Try to guess additional flags to pick up local libraries.
+ for thislibdir in $libpth; do
+@@ -8571,21 +8532,6 @@ EOM
+ 	    ''|' ') dflt='none' ;;
+ 	esac
+ 
+-	case "$ldflags" in
+-	    *-fstack-protector-strong*)
+-		case "$dflt" in
+-		    *-fstack-protector-strong*) ;; # Don't add it again
+-		    *) dflt="$dflt -fstack-protector-strong" ;;
+-		esac
+-		;;
+-	    *-fstack-protector*)
+-		case "$dflt" in
+-		    *-fstack-protector*) ;; # Don't add it again
+-		    *) dflt="$dflt -fstack-protector" ;;
+-		esac
+-		;;
+-	esac
+-
+ 	rp="Any special flags to pass to $ld to create a dynamically loaded library?"
+ 	. ./myread
+ 	case "$ans" in
+-- 
+2.1.4
+
-- 
2.1.4


