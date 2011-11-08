Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNrMJ-0002iO-UQ
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 20:29:24 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 Nov 2011 11:23:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,477,1315206000"; d="scan'208";a="34587160"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Nov 2011 11:23:05 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 11:22:56 -0800
Message-Id: <8f64c13828085b5aaabbc875c64435aadd641b02.1320780004.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320780004.git.sgw@linux.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/17] libzypp: fix mishandling of hyphenated arches
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
X-List-Received-Date: Tue, 08 Nov 2011 19:29:24 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

Several hyphen-to-underscore translations were missing, causing
compiler errors trying to build arches with hyphens in their names.
This adds the missing translations.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-extended/libzypp/libzypp_git.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
index 20e8f7c..a6b270c 100644
--- a/meta/recipes-extended/libzypp/libzypp_git.bb
+++ b/meta/recipes-extended/libzypp/libzypp_git.bb
@@ -11,7 +11,7 @@ DEPENDS  = "rpm boost curl libxml2 zlib sat-solver expat openssl udev"
 S = "${WORKDIR}/git"
 SRCREV = "15b6c52260bbc52b3d8e585e271b67e10cc7c433"
 PV = "0.0-git${SRCPV}"
-PR = "r15"
+PR = "r16"
 
 SRC_URI = "git://github.com/openSUSE/libzypp.git;protocol=git \
            file://no-doc.patch \
@@ -98,10 +98,10 @@ do_archgen () {
 		esac
 		if [ "${AVOID_CONSTRUCTOR}" != "true" ]; then
 		  echo -n "  const Arch Arch_${each_arch} " | tr - _		>> zypp/oe-arch.h
-		  echo "(_${each_arch});" 					>> zypp/oe-arch.h
+		  echo "(_${each_arch});" | tr - _				>> zypp/oe-arch.h
 		else
 		  echo -n "  const Arch Arch_${each_arch} " | tr - _		>> zypp/oe-arch.h
-		  echo "( IdString ( \"${each_arch}\" ) );" 			>> zypp/oe-arch.h
+		  echo "( IdString ( \"${each_arch}\" ) );" | tr - _		>> zypp/oe-arch.h
 		fi
 	done
 	echo "#endif /* OE_PROTO */"						>> zypp/oe-arch.h
@@ -142,7 +142,7 @@ do_archgen () {
 		COMPAT_WITH="${CARCH},${COMPAT} $COMPAT_WITH"
 	done
 	for each_compat in ${COMPAT_WITH} ; do
-		echo "        defCompatibleWith( ${each_compat} );"		>> zypp/oe-arch.h
+		echo "        defCompatibleWith( ${each_compat} );" | tr - _	>> zypp/oe-arch.h
 	done
 	echo "#endif /* DEF_COMPAT */"						>> zypp/oe-arch.h
 	echo ""									>> zypp/oe-arch.h
-- 
1.7.6.4



