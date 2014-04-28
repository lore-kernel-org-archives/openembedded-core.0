Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AA268610CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 22:38:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Apr 2014 15:38:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,947,1389772800"; d="scan'208";a="531213115"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 28 Apr 2014 15:37:57 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Apr 2014 15:37:57 -0700
Message-Id: <1398724677-21683-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] mc: update to 4.8.12
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
X-List-Received-Date: Mon, 28 Apr 2014 22:38:04 -0000

Add PACKAGECONFIG for two optional plugins (smb & sftp), both require
other packages from meta-openembedded

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/mc/{mc_4.8.10.bb => mc_4.8.12.bb} | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.10.bb => mc_4.8.12.bb} (83%)

diff --git a/meta/recipes-extended/mc/mc_4.8.10.bb b/meta/recipes-extended/mc/mc_4.8.12.bb
similarity index 83%
rename from meta/recipes-extended/mc/mc_4.8.10.bb
rename to meta/recipes-extended/mc/mc_4.8.12.bb
index 511771a..b897193 100644
--- a/meta/recipes-extended/mc/mc_4.8.10.bb
+++ b/meta/recipes-extended/mc/mc_4.8.12.bb
@@ -8,12 +8,19 @@ RDEPENDS_${PN} = "ncurses-terminfo"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "eb4bdc23abd4fdfa14911d53d65c8186"
-SRC_URI[sha256sum] = "5f4166fe78fbf4b42f51ed526ca7f79fea8c77d04355c2b97d4df2a6bd2a1b1a"
+SRC_URI[md5sum] = "a64c426364bfaee56b628f6c0738aade"
+SRC_URI[sha256sum] = "1054fcc27a488771cbe5b85d7c10135fa1cd1b7682a19930d44b51a023e39396"
 
 inherit autotools gettext pkgconfig
 
-EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x --without-samba"
+#
+# Both Samba (smb) and sftp require package delivered from meta-openembedded
+#
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[smb] = "--enable-vfs-smb,--disable-vfs-smb,samba,"
+PACKAGECONFIG[sftp] = "--enable-vfs-sftp,--disable-vfs-sftp,libssh2,"
+
+EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x"
 
 FILES_${PN}-dbg += "${libexecdir}/mc/.debug/"
 
-- 
1.8.3.1


