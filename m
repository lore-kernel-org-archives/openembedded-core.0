Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QjCNl-0003fp-2s
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 17:38:49 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6JFYhMh027827
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 10:34:43 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 08:34:43 -0700
Message-Id: <62b8c5fd8ff32ab79c41704500442eb1d5890ed6.1311089204.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311089204.git.tom_rini@mentor.com>
References: <cover.1311089204.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311089204.git.tom_rini@mentor.com>
References: <cover.1311089204.git.tom_rini@mentor.com>
Subject: [PATCH 2/4] gnome-doc-utils: Package up python site packages, bump PR
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
X-List-Received-Date: Tue, 19 Jul 2011 15:38:49 -0000

Add python-dir to the inherits list so we can grab the python site packages
files as well.  This fixes a 'installed but not packaged' QA problem with
the python site package files.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/recipes-gnome/gnome/gnome-doc-utils.inc       |    4 ++--
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils.inc b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
index 7f1ab83..bd7c615 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils.inc
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
@@ -2,7 +2,7 @@ LICENSE = "GPL & LGPL"
 DEPENDS = "libxml2 libxslt libxslt-native gnome-doc-utils-native"
 DEPENDS_virtclass-native = "libxml2-native libxslt-native intltool-native"
 
-inherit gnome gettext
+inherit gnome gettext python-dir
 
 EXTRA_OECONF = "--disable-scrollkeeper"
 
@@ -13,7 +13,7 @@ do_install_append() {
 	chown -R root:root ${D}
 }
 
-FILES_${PN} += "${datadir}/xml*"
+FILES_${PN} += "${datadir}/xml* ${PYTHON_SITEPACKAGES_DIR}/*"
 
 RDEPENDS_${PN} = "bash"
 
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
index 0019f45..4554122 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
@@ -1,7 +1,7 @@
 require gnome-doc-utils.inc
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
 		    file://COPYING.LGPL;md5=a6f89e2100d9b6cdffcea4f398e37343"
-PR = "r2"
+PR = "r3"
 
 SRC_URI += "file://xsltproc_nonet.patch"
 
-- 
1.7.0.4



