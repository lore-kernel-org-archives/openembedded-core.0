Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RYZhB-0007dK-5i
	for openembedded-core@openembedded.org; Thu, 08 Dec 2011 09:51:13 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Dec 2011 00:44:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99987696"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by fmsmga002.fm.intel.com with ESMTP; 08 Dec 2011 00:44:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  8 Dec 2011 00:44:01 -0800
Message-Id: <63b619fd7a3d0ca55a965f0a5b99f6e9c8584ea4.1323333676.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323333676.git.sgw@linux.intel.com>
References: <cover.1323333676.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323333676.git.sgw@linux.intel.com>
References: <cover.1323333676.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 01/17] rootfs_ipk: implement FEED_DEPLOYDIR_BASE_URI support
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
X-List-Received-Date: Thu, 08 Dec 2011 08:51:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Eric Bénard <eric@eukrea.com>

this feature was present in OE-classic, is documented in OE-core
but its implementation is actually missing.
The present implementation is directly copied from OE-classic
and tested on an arm926 machine.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 meta/classes/rootfs_ipk.bbclass |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index b4b95c5..ec01951 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -205,7 +205,18 @@ ipk_insert_feed_uris () {
 
 		# insert new feed-sources
 		echo "src/gz $feed_name $feed_uri" >> ${IPKGCONF_TARGET}
-        done
+	done
+
+	# Allow to use package deploy directory contents as quick devel-testing
+	# feed. This creates individual feed configs for each arch subdir of those
+	# specified as compatible for the current machine.
+	# NOTE: Development-helper feature, NOT a full-fledged feed.
+	if [ -n "${FEED_DEPLOYDIR_BASE_URI}" ]; then
+		for arch in ${PACKAGE_ARCHS}
+		do
+			echo "src/gz local-$arch ${FEED_DEPLOYDIR_BASE_URI}/$arch" >> ${IMAGE_ROOTFS}/etc/opkg/local-$arch-feed.conf
+	    done
+	fi
 }
 
 python () {
-- 
1.7.6.4



