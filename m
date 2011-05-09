Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJKUG-0003hj-N3
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 09:02:36 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2011 23:59:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,339,1301900400"; d="scan'208";a="690004858"
Received: from unknown (HELO localhost) ([10.255.12.42])
	by fmsmga002.fm.intel.com with ESMTP; 08 May 2011 23:59:54 -0700
Message-Id: <371205d21723ec911a77d5e7c1ef51fb26d854f5.1304924223.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304924223.git.sgw@linux.intel.com>
References: <cover.1304924223.git.sgw@linux.intel.com>
Old-Date: Wed, 4 May 2011 12:28:25 -0700
Date: Sun, 08 May 2011 23:59:54 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 16/20] binutils.inc: Switch to TARGET_PREFIX not TARGET_SYS
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
X-List-Received-Date: Mon, 09 May 2011 07:02:36 -0000

From: Tom Rini <tom_rini@mentor.com>

When TARGET_PREFIX and TARGET_SYS didn't match up, the symlinks and
update-alternatives weren't working.  TARGET_PREFIX is what we use when
configuring so it's what we should be using here.

This is 79b497edc0ce5d54db564818e59b690d3391d6ce from OE.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/recipes-devtools/binutils/binutils.inc |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index d9e859e..882fe7b 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -110,7 +110,7 @@ do_install () {
 
 	# Symlinks for ease of running these on the native target
 	for p in ${TARGET_SYS}-* ; do
-		ln -sf $p `echo $p | sed -e s,${TARGET_SYS}-,,`
+		ln -sf $p `echo $p | sed -e s,${TARGET_PREFIX},,`
 	done
 
 	rm ${D}${bindir}/ar ${D}${bindir}/strings
@@ -139,11 +139,11 @@ do_install_virtclass-native () {
 }
 
 pkg_postinst_${PN}-symlinks () {
-	update-alternatives --install ${bindir}/ar ar ${TARGET_SYS}-ar 100
-	update-alternatives --install ${bindir}/strings strings ${TARGET_SYS}-strings 100
+	update-alternatives --install ${bindir}/ar ar ${TARGET_PREFIX}ar 100
+	update-alternatives --install ${bindir}/strings strings ${TARGET_PREFIX}strings 100
 }
 
 pkg_prerm_${PN}-symlinks () {
-	update-alternatives --remove ar ${TARGET_SYS}-ar
-	update-alternatives --remove strings ${TARGET_SYS}-strings
+	update-alternatives --remove ar ${TARGET_PREFIX}ar
+	update-alternatives --remove strings ${TARGET_PREFIX}strings
 }
-- 
1.7.1.1



