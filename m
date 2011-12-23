Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Re7bT-0003eO-Kf
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 17:04:15 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 Dec 2011 07:57:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="50123310"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.71])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Dec 2011 07:57:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Dec 2011 15:57:01 +0000
Message-Id: <ea9f34e714b4222c40666e19279d15a2fcac24f9.1324655504.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1324655504.git.paul.eggleton@linux.intel.com>
References: <cover.1324655504.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1324655504.git.paul.eggleton@linux.intel.com>
References: <cover.1324655504.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] qemu: explicitly disable kvm support for native without kvm header
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
X-List-Received-Date: Fri, 23 Dec 2011 16:04:15 -0000

Addendum to previous fix - instead of just not specifying --enable-kvm,
explicitly specify --disable-kvm when building native version and
kvm header is unavailable. Fixes reported do_configure failure on
earlier CentOS 5.x versions (e.g. 5.4).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc       |    2 +-
 meta/recipes-devtools/qemu/qemu_0.14.0.bb |    2 +-
 meta/recipes-devtools/qemu/qemu_0.15.1.bb |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index bd86b4e..33abf96 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -40,7 +40,7 @@ do_configure_prepend_virtclass-native() {
 
 do_configure() {
     # Handle distros such as CentOS 5 32-bit that do not have kvm support
-    KVMOPTS=""
+    KVMOPTS="--disable-kvm"
     if [ "${PN}" != "qemu-native" ] || [ -f /usr/include/linux/kvm.h ] ; then
         KVMOPTS="--enable-kvm"
     fi
diff --git a/meta/recipes-devtools/qemu/qemu_0.14.0.bb b/meta/recipes-devtools/qemu/qemu_0.14.0.bb
index bc0c16b..a300545 100644
--- a/meta/recipes-devtools/qemu/qemu_0.14.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.14.0.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r5"
+PR = "r6"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
index ae68327..3a6389b 100644
--- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
@@ -3,7 +3,7 @@ require qemu.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-PR = "r1"
+PR = "r2"
 
 FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
 FILESDIR = "${WORKDIR}"
-- 
1.7.5.4



