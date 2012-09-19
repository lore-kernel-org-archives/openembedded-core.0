Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TEIz0-00015d-MI
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 14:02:22 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Sep 2012 04:49:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,447,1344236400"; d="scan'208";a="194489257"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by azsmga001.ch.intel.com with ESMTP; 19 Sep 2012 04:49:41 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2012 14:49:24 +0300
Message-Id: <854e4261283991cdc56f176c6f97dee9acf718fd.1348052899.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1348052899.git.laurentiu.palcu@intel.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1348052899.git.laurentiu.palcu@intel.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
Subject: [RFC 6/7] sato-icon-theme: make use of the gtk-icon-cache postinst scriptlet
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
X-List-Received-Date: Wed, 19 Sep 2012 12:02:23 -0000

This patch is for reusing the postint scriptlet of the
gtk-icon-cache.bbclass.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../sato-icon-theme/sato-icon-theme.inc            |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
index 9fd1012..3017e11 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
@@ -6,7 +6,7 @@ LICENSE = "CC-BY-SA-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=56a830bbe6e4697fe6cbbae01bb7c2b2"
 
 SECTION = "x11"
-DEPENDS = ""
+DEPENDS = "gtk+-native"
 
 inherit autotools pkgconfig allarch
 
@@ -14,12 +14,13 @@ FILES_${PN} += "${datadir}"
 
 EXTRA_OECONF += "--with-iconmap=${STAGING_LIBDIR_NATIVE}/../libexec/icon-name-mapping"
 
+inherit gtk-icon-cache
+
 #explictly setting "Sato" as default icon theme to avoid icon missing due to
 #tricky race condition
 pkg_postinst_${PN} () {
-        if [ "x$D" != "x" ]; then
-                exit 1
-        fi
-        gtk-update-icon-cache -q /usr/share/icons/Sato
-        echo 'gtk-icon-theme-name = "Sato"' >> /etc/gtk-2.0/gtkrc
+	if [ ! -d $D/etc/gtk-2.0 ]; then
+		mkdir $D/etc/gtk-2.0
+	fi
+	echo 'gtk-icon-theme-name = "Sato"' >> $D/etc/gtk-2.0/gtkrc
 }
-- 
1.7.9.5



