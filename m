Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TirKb-0003Rj-Jz
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 19:46:57 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Dec 2012 10:32:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,267,1355126400"; d="scan'208";a="263101179"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.189])
	by fmsmga002.fm.intel.com with ESMTP; 12 Dec 2012 10:32:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Dec 2012 18:31:37 +0000
Message-Id: <29eace28821e25f2146e8cec3b4246dc74ed6396.1355337025.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1355337025.git.paul.eggleton@linux.intel.com>
References: <cover.1355337025.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1355337025.git.paul.eggleton@linux.intel.com>
References: <cover.1355337025.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v3 13/13] package_rpm: Workaround for 'all' arch multilib package naming
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Dec 2012 18:46:58 -0000

From: Mark Hatle <mark.hatle@windriver.com>

[YOCTO #3565]

All packages should not be multilib specific, however when the multilib
rules run, they automatically rename the 'all' target recipes.  As such
there is no way to know if an 'all' package should or should not contain
the multilib prefix.  We workaround this issue in the translate function
by checking to see if the runtime-reverse file exists or not.

The workaround should be removed once a proper solution to the architectural
issue is in place.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass |   14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 6a0bb91..a00b702 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -80,6 +80,7 @@ translate_smart_to_oe() {
 
 	# Dump installed packages
 	while read pkg arch other ; do
+		found=0
 		if [ -z "$pkg" ]; then
 			continue
 		fi
@@ -101,10 +102,19 @@ translate_smart_to_oe() {
 					else
 						new_pkg="$mlib-$pkg"
 					fi
-					break
+					# Workaround for bug 3565
+					# Simply look to see if we know of a package with that name, if not try again!
+					filename=`ls ${TMPDIR}/pkgdata/*/runtime-reverse/$new_pkg 2>/dev/null | head -n 1`
+					if [ -n "$filename" ] ; then
+						found=1
+						break
+					fi
+					# 'real' code
+					# found=1
+					# break
 				fi
 			done
-			if [ "$arch" = "$cmp_arch" -o "$fixed_arch" = "$cmp_arch" ]; then
+			if [ "$found" = "1" ] && [ "$arch" = "$cmp_arch" -o "$fixed_arch" = "$cmp_arch" ]; then
 				break
 			fi
 		done
-- 
1.7.10.4



