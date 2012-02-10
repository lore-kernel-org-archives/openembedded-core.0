Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1RvlBa-0008TM-QO
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 08:46:27 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Feb 2012 23:38:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="108538285"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by orsmga002.jf.intel.com with ESMTP; 09 Feb 2012 23:38:13 -0800
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 15:37:54 +0800
Message-Id: <c78c9fa1adaadd399a114a7d41bf10baa5e67c8f.1328859334.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1328859334.git.lianhao.lu@intel.com>
References: <cover.1328859334.git.lianhao.lu@intel.com>
Subject: [PATCH 1/1] guile: fix cross configure failure
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
X-List-Received-Date: Fri, 10 Feb 2012 07:46:27 -0000

[YOCTO #1978]
Fixing the cross configure failure by not searching libltdl and libgmp
in includedir and libdir.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-devtools/guile/guile_2.0.3.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/guile/guile_2.0.3.bb b/meta/recipes-devtools/guile/guile_2.0.3.bb
index f6f7a8e..729aed0 100644
--- a/meta/recipes-devtools/guile/guile_2.0.3.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.3.bb
@@ -24,7 +24,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.gz \
 SRC_URI[md5sum] = "3b8b4e1083037f29d2c4704a6d55f2a8"
 SRC_URI[sha256sum] = "a53b21159befe3e89bbaca71e9e62cf00af0f49fcca297c407944b988d59eb08"
 
-PR = "r2"
+PR = "r3"
 
 inherit autotools gettext
 BBCLASSEXTEND = "native"
@@ -33,6 +33,8 @@ DEPENDS = "libunistring bdwgc gmp libtool libffi"
 # add guile-native only to the target recipe's DEPENDS
 DEPENDS += "${@['guile-native', ''][d.getVar('PN', 1) != 'guile']}"
 
+EXTRA_OECONF += "${@['--without-libltdl-prefix --without-libgmp-prefix', ''][bb.data.inherits_class('native',d)]}"
+
 do_configure_prepend() {
 	mkdir -p po
 }
-- 
1.7.0.4



