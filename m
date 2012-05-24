Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SXfub-0002yZ-I2
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 23:49:38 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 14:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148125522"
Received: from sgarman-ws.jf.intel.com ([10.7.199.160])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 14:38:49 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 14:38:33 -0700
Message-Id: <c8c394bd806978c867f2fe82e4bde65c98764880.1337892418.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
Subject: [PATCH 22/32] quilt: fix perl path in target perl scripts
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
X-List-Received-Date: Thu, 24 May 2012 21:49:39 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

While building on distros like fedora17, which has /bin/perl,
the target perl scripts get perl path also as /bin/perl.
And that is not correction path of perl on the target.

This commit avoids this error.

| error: Failed dependencies:
|       /bin/perl is needed by quilt-0.51-r2.i586
NOTE: package core-image-sato-sdk-1.0-r0: task do_rootfs: Failed
ERROR: Task 8
(/home/nitin/prj/poky.git/meta/recipes-sato/images/core-image-sato-sdk.bb,
do_rootfs) failed with exit code '1'

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/quilt/quilt_0.51.bb |   15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/quilt/quilt_0.51.bb b/meta/recipes-devtools/quilt/quilt_0.51.bb
index 6865cd8..4e51b49 100644
--- a/meta/recipes-devtools/quilt/quilt_0.51.bb
+++ b/meta/recipes-devtools/quilt/quilt_0.51.bb
@@ -4,4 +4,17 @@ RDEPENDS_${PN} += "patch diffstat bzip2 util-linux"
 SRC_URI += "file://aclocal.patch \
             file://gnu_patch_test_fix_target.patch \
            "
-PR = "r3"
+PR = "r4"
+
+PERLPATH = "${bindir}/env perl"
+PERLPATH_virtclass-nativesdk = "/usr/bin/env perl"
+
+# fix build-distro specific perl path in the target perl scripts
+do_install_append() {
+	for perlscript in ${D}${datadir}/quilt/scripts/remove-trailing-ws ${D}${datadir}/quilt/scripts/dependency-graph ${D}${datadir}/quilt/scripts/edmail ${D}${bindir}/guards
+	do
+		if [ -f $perlscript ]; then
+			sed -i -e '1s,#!.*perl,#! ${PERLPATH},' $perlscript
+		fi
+	done
+}
-- 
1.7.9.5



