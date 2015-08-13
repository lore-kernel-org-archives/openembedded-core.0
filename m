Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6E68273D64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 13:38:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Aug 2015 06:38:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,670,1432623600"; d="scan'208";a="783433939"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 13 Aug 2015 06:38:29 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Aug 2015 16:40:01 +0300
Message-Id: <1439473201-27539-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <6591f1a55a50b6417755e7e6720750818dab6532.1439318387.git.jussi.kukkonen@intel.com>
References: <6591f1a55a50b6417755e7e6720750818dab6532.1439318387.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 3/4] nfs-utils: Upgrade 1.3.1 -> 1.3.2
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
X-List-Received-Date: Thu, 13 Aug 2015 13:38:46 -0000

Add PACKAGECONFIG[ipv6] that is enabled based on ipv6 distro feature.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

Changes since v1:
* Add PACKAGECONFIG[ipv6] as Khem suggested

I also modified and force pushed the branch at:
  git://git.yoctoproject.org/poky-contrib jku/nss-openssh-nfsutils
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/nss-openssh-nfsutils


 .../nfs-utils/{nfs-utils_1.3.1.bb => nfs-utils_1.3.2.bb}       | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.3.1.bb => nfs-utils_1.3.2.bb} (92%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.2.bb
similarity index 92%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.2.bb
index 6da8509..0953850 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.2.bb
@@ -33,8 +33,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfs-utils-debianize-start-statd.patch \
 "
 
-SRC_URI[md5sum] = "8de676b9ff34b8f9addc1d0800fabdf8"
-SRC_URI[sha256sum] = "ff79d70b7b58b2c8f9b798c58721127e82bb96022adc04a5c4cb251630e696b8"
+SRC_URI[md5sum] = "4cdffb2c7f7fd2bdceaba55ab1b881da"
+SRC_URI[sha256sum] = "2966bb431c06e9ba35a54f48f89db03a5132bc2d8ed8084ac8ccb34e25a9b739"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
@@ -58,14 +58,16 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
                 --disable-nfsv41 \
                 --enable-uuid \
                 --disable-gss \
-                --disable-tirpc \
                 --disable-nfsdcltrack \
                 --with-statdpath=/var/lib/nfs/statd \
                "
 
-PACKAGECONFIG ??= "tcp-wrappers"
+PACKAGECONFIG ??= "tcp-wrappers \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
+                   "
 PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,--without-tcp-wrappers,tcp-wrappers"
 PACKAGECONFIG[nfsidmap] = "--enable-nfsidmap,--disable-nfsidmap,keyutils"
+PACKAGECONFIG[ipv6] = "--enable-ipv6 --enable-tirpc,--disable-ipv6 --disable-tirpc,libtirpc"
 
 INHIBIT_AUTO_STAGE = "1"
 
-- 
2.1.4


