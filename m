Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RNRba-0006TM-0F
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 16:59:26 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 07 Nov 2011 07:53:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,470,1315206000"; d="scan'208";a="34084380"
Received: from unknown (HELO localhost) ([10.255.15.253])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Nov 2011 07:53:11 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 09:53:35 -0600
Message-Id: <4fc815d427cbc2573f4c8e55479770ba98ce2672.1320638388.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1803ea4bfa2a0cb07cf4cbcf4ca76f5beec75fea.1320638388.git.tom.zanussi@intel.com>
References: <1803ea4bfa2a0cb07cf4cbcf4ca76f5beec75fea.1320638388.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1320638388.git.tom.zanussi@intel.com>
References: <cover.1320638388.git.tom.zanussi@intel.com>
Subject: [PATCH 5/6] libzypp: fix mishandling of hyphenated arches
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
X-List-Received-Date: Mon, 07 Nov 2011 15:59:26 -0000

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
1.7.0.4



