Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Q520Z-0008De-AG
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Mar 2011 22:28:51 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p2UKQmML003006
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Mar 2011 13:26:48 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 30 Mar 2011 13:26:47 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <poky@yoctoproject.org>, <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2011 15:29:14 -0500
Message-ID: <9ee39872d36b80888fdea8b2a8e80eb42670656d.1301516765.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1301516765.git.mark.hatle@windriver.com>
References: <cover.1301516765.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 3/3] Workaround for Global C++ Constructor problem on ARM
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
X-List-Received-Date: Wed, 30 Mar 2011 20:28:51 -0000
Content-Type: text/plain

[YOCTO #938]

Workaround for a problem with the order of the global C++ constructors on ARM.
The workaround is simply to avoid defining the ID numbers outside of the
usage of the ID's.

This also has the effect of fixing a problem on MIPS, where "_mips" is a
defined symbol and unavailable on the system for a variable name.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../arm-workaround-global-constructor.patch        |   68 ++++++++++++++++++++
 meta/recipes-extended/libzypp/libzypp_git.bb       |   47 +++++++++++---
 2 files changed, 105 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-extended/libzypp/libzypp/arm-workaround-global-constructor.patch

diff --git a/meta/recipes-extended/libzypp/libzypp/arm-workaround-global-constructor.patch b/meta/recipes-extended/libzypp/libzypp/arm-workaround-global-constructor.patch
new file mode 100644
index 0000000..efcadc9
--- /dev/null
+++ b/meta/recipes-extended/libzypp/libzypp/arm-workaround-global-constructor.patch
@@ -0,0 +1,68 @@
+Workaround a problem with the C++ global constructors on ARM.
+
+As documented in the Yocto Bugzilla bug 938, the global constructors 
+that define DEF_BUILTIN [const IdString _foo ( "foo" );] are not running 
+before the usage of _foo during the initialization of the compatibility 
+table.
+
+The patch, along with a similar change to the recipe generation of the 
+poky-arch.h file, remove the DEF_BUILTIN globals and replace them with
+immediate strings wherever they are used.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff -ur git.orig/zypp/Arch.cc git/zypp/Arch.cc
+--- git.orig/zypp/Arch.cc	2011-03-29 14:15:32.695079271 -0500
++++ git/zypp/Arch.cc	2011-03-29 14:17:22.680910025 -0500
+@@ -152,13 +152,10 @@
+     // NOTE: Thake care CompatBits::IntT is able to provide one
+     //       bit for each architecture.
+     //
+-#define DEF_BUILTIN(A) const IdString  _##A( #A );
+-    DEF_BUILTIN( all );
+-    DEF_BUILTIN( any );
+-    DEF_BUILTIN( noarch );
+ 
+-#include "poky-arch.h"
+-#undef DEF_BUILTIN
++/* Global constructors are not working properly on ARM, avoid the
++ * known bad case and merge constructors in with the usages
++ */
+ 
+     ///////////////////////////////////////////////////////////////////
+     //
+@@ -227,9 +224,9 @@
+         // _noarch must have _idBit 0.
+         // Other builtins have 1-bit set
+         // and are initialized done on the fly.
+-        _compatSet.insert( Arch::CompatEntry( _all, 0 ) );
+-        _compatSet.insert( Arch::CompatEntry( _any, 0 ) );
+-        _compatSet.insert( Arch::CompatEntry( _noarch, 0 ) );
++        _compatSet.insert( Arch::CompatEntry( IdString ( "all" ), 0 ) );
++        _compatSet.insert( Arch::CompatEntry( IdString ( "any" ), 0 ) );
++        _compatSet.insert( Arch::CompatEntry( IdString ( "noarch" ), 0 ) );
+         ///////////////////////////////////////////////////////////////////
+         // Define the CompatibleWith relation:
+         //
+@@ -305,9 +302,9 @@
+   ///////////////////////////////////////////////////////////////////
+ 
+   const Arch Arch_empty ( IdString::Empty );
+-  const Arch Arch_all( _all );
+-  const Arch Arch_any( _any );
+-  const Arch Arch_noarch( _noarch );
++  const Arch Arch_all( IdString ( "all" ) );
++  const Arch Arch_any( IdString ( "any" ) );
++  const Arch Arch_noarch( IdString ( "noarch" ) );
+ 
+ #define POKY_PROTO 1
+ #include "poky-arch.h"
+@@ -316,7 +316,7 @@
+   //	METHOD TYPE : Ctor
+   //
+   Arch::Arch()
+-  : _entry( &ArchCompatSet::instance().assertDef( _noarch ) )
++  : _entry( &ArchCompatSet::instance().assertDef( IdString ( "noarch" ) ) )
+   {}
+ 
+   Arch::Arch( IdString::IdType id_r )
diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
index 809c187..b473b9f 100644
--- a/meta/recipes-extended/libzypp/libzypp_git.bb
+++ b/meta/recipes-extended/libzypp/libzypp_git.bb
@@ -25,6 +25,9 @@ SRC_URI = "git://gitorious.org/opensuse/libzypp.git;protocol=git \
 
 SRC_URI_append_mips = " file://mips-workaround-gcc-tribool-error.patch"
 
+# ARM specific global constructor workaround
+SRC_URI_append_arm  = " file://arm-workaround-global-constructor.patch"
+
 FILES_${PN} += "${libdir}/zypp ${datadir}/zypp ${datadir}/icons"
 FILES_${PN}-dev += "${datadir}/cmake"
 
@@ -32,27 +35,38 @@ EXTRA_OECMAKE += "-DLIB=lib"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+AVOID_CONSTRUCTOR = ""
+
+# Due to an ARM specific compiler issue
+AVOID_CONSTRUCTOR_arm = "true"
+
+# Due to a potential conflict with '_mips' being a define
+AVOID_CONSTRUCTOR_mips = "true"
+
 do_archgen () {
 	# We need to dynamically generate our arch file based on the machine
 	# configuration
 	echo "/* Automatically generated by the libzypp recipes */" 		 > zypp/poky-arch.h
+	echo "/* Avoid Constructor: ${AVOID_CONSTRUCTOR} */" 			 >> zypp/poky-arch.h
 	echo ""									>> zypp/poky-arch.h
 	echo "#ifndef POKY_ARCH_H"						>> zypp/poky-arch.h
 	echo "#define POKY_ARCH_H 1"						>> zypp/poky-arch.h
 	echo "#define Arch_machine Arch_${MACHINE_ARCH}"			>> zypp/poky-arch.h
 	echo "#endif /* POKY_ARCH_H */"						>> zypp/poky-arch.h
 	echo ""									>> zypp/poky-arch.h
-	echo "#ifdef DEF_BUILTIN"						>> zypp/poky-arch.h
-	echo "/* Specify builtin types */"					>> zypp/poky-arch.h
-	for each_arch in ${PACKAGE_ARCHS} ; do
+	if [ "${AVOID_CONSTRUCTOR}" != "true" ]; then
+	  echo "#ifdef DEF_BUILTIN"						>> zypp/poky-arch.h
+	  echo "/* Specify builtin types */"					>> zypp/poky-arch.h
+	  for each_arch in ${PACKAGE_ARCHS} ; do
 		case "$each_arch" in
 			all | any | noarch)
 				continue;;
 		esac
 		echo "    DEF_BUILTIN( ${each_arch} );"				>> zypp/poky-arch.h
-	done
-	echo "#endif /* DEF_BUILTIN */"						>> zypp/poky-arch.h
-	echo ""									>> zypp/poky-arch.h
+	  done
+	  echo "#endif /* DEF_BUILTIN */"						>> zypp/poky-arch.h
+	  echo ""									>> zypp/poky-arch.h
+	fi
 	echo "#ifdef POKY_EXTERN_PROTO"						>> zypp/poky-arch.h
 	echo "/* Specify extern prototypes */"					>> zypp/poky-arch.h
 	for each_arch in ${PACKAGE_ARCHS} ; do
@@ -71,7 +85,11 @@ do_archgen () {
 			all | any | noarch)
 				continue;;
 		esac
-		echo "  const Arch Arch_${each_arch} (_${each_arch});"		>> zypp/poky-arch.h
+		if [ "${AVOID_CONSTRUCTOR}" != "true" ]; then
+		  echo "  const Arch Arch_${each_arch} (_${each_arch});"		>> zypp/poky-arch.h
+		else
+		  echo "  const Arch Arch_${each_arch} ( IdString ( \"${each_arch}\" ) );"		>> zypp/poky-arch.h
+		fi
 	done
 	echo "#endif /* POKY_PROTO */"						>> zypp/poky-arch.h
 	echo ""									>> zypp/poky-arch.h
@@ -89,14 +107,23 @@ do_archgen () {
 			all | any | noarch)
 				shift ; continue;;
 		esac
-		ARCH=_"$1"
+		if [ "${AVOID_CONSTRUCTOR}" != "true" ]; then
+		  ARCH="_$1"
+		else
+		  ARCH="IdString(\"$1\")"
+		fi
 		shift
 		COMPAT=""
 		for each_arch in "$@"; do
+			if [ -z "${AVOID_CONSTRUCTOR}" ]; then
+			  arch_val="_${each_arch}"
+			else
+			  arch_val="IdString(\"${each_arch}\")"
+			fi
 			if [ -z "$COMPAT" ]; then
-				COMPAT=_"$each_arch"
+				COMPAT=${arch_val}
 			else
-				COMPAT=_"$each_arch,$COMPAT"
+				COMPAT="${arch_val},$COMPAT"
 			fi
 		done
 		COMPAT_WITH="${ARCH},${COMPAT} $COMPAT_WITH"
-- 
1.7.3.4



