Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1SxOWw-00071K-OB
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 22:31:30 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Aug 2012 13:19:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193014115"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 03 Aug 2012 13:19:48 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Aug 2012 23:19:37 +0300
Message-Id: <8db627a00e95e0f72a8c18eb31ddd5c06df99454.1344022584.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1344022584.git.laurentiu.palcu@intel.com>
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1344022584.git.laurentiu.palcu@intel.com>
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/5] sato-icon-theme: make postinst scriplet run at do_rootfs time
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
X-List-Received-Date: Fri, 03 Aug 2012 20:31:31 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../sato-icon-theme/sato-icon-theme.inc            |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
index 9fd1012..ba15514 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
@@ -6,7 +6,7 @@ LICENSE = "CC-BY-SA-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=56a830bbe6e4697fe6cbbae01bb7c2b2"
 
 SECTION = "x11"
-DEPENDS = ""
+DEPENDS = "gtk+-native"
 
 inherit autotools pkgconfig allarch
 
@@ -17,9 +17,9 @@ EXTRA_OECONF += "--with-iconmap=${STAGING_LIBDIR_NATIVE}/../libexec/icon-name-ma
 #explictly setting "Sato" as default icon theme to avoid icon missing due to
 #tricky race condition
 pkg_postinst_${PN} () {
-        if [ "x$D" != "x" ]; then
-                exit 1
+        gtk-update-icon-cache -q $D/usr/share/icons/Sato
+        if [ ! -d $D/etc/gtk-2.0 ]; then
+            mkdir -p $D/etc/gtk-2.0
         fi
-        gtk-update-icon-cache -q /usr/share/icons/Sato
-        echo 'gtk-icon-theme-name = "Sato"' >> /etc/gtk-2.0/gtkrc
+        echo 'gtk-icon-theme-name = "Sato"' >> $D/etc/gtk-2.0/gtkrc
 }
-- 
1.7.9.5



