Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PvEl6-0004wH-B4
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 21:04:24 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Mar 2011 12:02:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,259,1297065600"; d="scan'208";a="397158435"
Received: from unknown (HELO localhost) ([10.255.12.102])
	by azsmga001.ch.intel.com with ESMTP; 03 Mar 2011 12:02:44 -0800
Message-Id: <e5662d07e615cfa5879a5d700df2d1e9049a6413.1299182375.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299182375.git.sgw@linux.intel.com>
References: <cover.1299182375.git.sgw@linux.intel.com>
Old-Date: Thu, 3 Mar 2011 19:54:09 +0800
Date: Thu, 03 Mar 2011 12:02:44 -0800
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
X-List-Received-Date: Thu, 03 Mar 2011 20:04:24 -0000

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



