Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SFlPP-0002YZ-E6
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 14:03:23 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Apr 2012 04:54:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="128996400"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by orsmga002.jf.intel.com with ESMTP; 05 Apr 2012 04:54:09 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 19:49:20 +0800
Message-Id: <0e25605bf5ef290a098abc577c99607a99493df5.1333626413.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1333626413.git.lianhao.lu@intel.com>
References: <cover.1333626413.git.lianhao.lu@intel.com>
Subject: [PATCH 1/2] package_ipk.bbclass: fixing muttilib prefix extracting.
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
X-List-Received-Date: Thu, 05 Apr 2012 12:03:23 -0000

Fixed an error in multilib prefix extracting.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/package_ipk.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index e4a217b..b3560cf 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -74,7 +74,7 @@ package_tryout_install_multilib_ipk() {
 		local pkgname_prefix="${item}-"
 		local pkgname_len=${#pkgname_prefix}
 		for pkg in ${INSTALL_PACKAGES_MULTILIB_IPK}; do
-			local pkgname=$(echo $pkg | awk -v var=$pkgname_len '{ pkgname=substr($1, 1, var - 1); print pkgname; }' )
+			local pkgname=$(echo $pkg | awk -v var=$pkgname_len '{ pkgname=substr($1, 1, var); print pkgname; }' )
 			if [ ${pkgname} = ${pkgname_prefix} ]; then
 			    selected_pkg="${selected_pkg} ${pkg}"
 			fi
@@ -97,7 +97,7 @@ split_multilib_packages() {
 		for item in ${MULTILIB_VARIANTS}; do
 			local pkgname_prefix="${item}-"
 			local pkgname_len=${#pkgname_prefix}
-			local pkgname=$(echo $pkg | awk -v var=$pkgname_len '{ pkgname=substr($1, 1, var - 1); print pkgname; }' )
+			local pkgname=$(echo $pkg | awk -v var=$pkgname_len '{ pkgname=substr($1, 1, var); print pkgname; }' )
 			if [ ${pkgname} = ${pkgname_prefix} ]; then
 				is_multilib=1
 				break
-- 
1.7.0.4



