Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QrfOR-0006py-1S
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 02:14:31 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Aug 2011 17:09:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,359,1309762800"; d="scan'208";a="40701216"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.248])
	by fmsmga001.fm.intel.com with ESMTP; 11 Aug 2011 17:09:57 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 17:09:51 -0700
Message-Id: <49f7822562b925c4ab476bd9bd9f723e6902f6cd.1313107646.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1313107646.git.sgw@linux.intel.com>
References: <cover.1313107646.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313107646.git.sgw@linux.intel.com>
References: <cover.1313107646.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] package_rpm: fix up attemptonly code
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
X-List-Received-Date: Fri, 12 Aug 2011 00:14:31 -0000

[YOCTO #1366]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/package_rpm.bbclass |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 59e8d48..5b76c5d 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -249,7 +249,14 @@ package_install_internal_rpm () {
 		echo "Adding attempt only packages..."
 		for pkg in ${package_attemptonly} ; do
 			echo "Processing $pkg..."
-			pkg_name=$(resolve_package_rpm $pkg ${confbase}.conf)
+
+			archvar=base_archs
+			ml_pkg=$(echo ${pkg} | sed "s,^${MLPREFIX}\(.*\),\1,")
+			if [ "${ml_pkg}" != "${pkg}" ]; then
+				archvar=ml_archs
+			fi
+
+			pkg_name=$(resolve_package_rpm ${confbase}-${archvar}.conf ${ml_pkg})
 			if [ -z "$pkg_name" ]; then
 				echo "Unable to find package $pkg!"
 				exit 1
-- 
1.7.3.4



