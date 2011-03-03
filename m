Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PvHN4-0005h6-BV
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 23:51:46 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Mar 2011 14:50:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,260,1297065600"; d="scan'208";a="608842900"
Received: from unknown (HELO localhost) ([10.255.12.102])
	by orsmga002.jf.intel.com with ESMTP; 03 Mar 2011 14:49:19 -0800
Message-Id: <732c81e35c4936d54c7fb495420cbb5c67c474ba.1299192495.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299192495.git.sgw@linux.intel.com>
References: <cover.1299192495.git.sgw@linux.intel.com>
Old-Date: Thu, 3 Mar 2011 19:54:09 +0800
Date: Thu, 03 Mar 2011 14:49:18 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 03/10] sato-icon-theme: Explictly use "Sato" as gtk icon theme
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
X-List-Received-Date: Thu, 03 Mar 2011 22:51:46 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

There is a tricky race condition that "Sato" icons got missing on
matchbox-desktop as low priority "hicolor" theme was chosen. Explictly
settting "Sato" in gtk config file to avoid this.

[BUGID #456] got fixed.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../sato-icon-theme/sato-icon-theme.inc            |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
index a1669c6..0eff9dd 100644
--- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
+++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
@@ -16,9 +16,12 @@ PACKAGE_ARCH = "all"
 
 EXTRA_OECONF += "--with-iconmap=${STAGING_LIBDIR_NATIVE}/../libexec/icon-name-mapping"
 
+#explictly setting "Sato" as default icon theme to avoid icon missing due to
+#tricky race condition
 pkg_postinst_${PN} () {
         if [ "x$D" != "x" ]; then
                 exit 1
         fi
         gtk-update-icon-cache -q /usr/share/icons/Sato
+        echo 'gtk-icon-theme-name = "Sato"' >> /etc/gtk-2.0/gtkrc
 }
-- 
1.7.1.1



