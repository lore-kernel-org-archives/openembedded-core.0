Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CD13A60420
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 00:40:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 May 2013 17:40:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,717,1363158000"; d="scan'208";a="341405591"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.171])
	by fmsmga002.fm.intel.com with ESMTP; 21 May 2013 17:40:26 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 17:40:19 -0700
Message-Id: <956e704118008aa337ede574febbcc44c43adbf3.1369183108.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1369183108.git.sgw@linux.intel.com>
References: <cover.1369183108.git.sgw@linux.intel.com>
In-Reply-To: <cover.1369183108.git.sgw@linux.intel.com>
References: <cover.1369183108.git.sgw@linux.intel.com>
Subject: [PATCH 1/7] gnupg: Update to 2.0.20
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
X-List-Received-Date: Wed, 22 May 2013 00:40:37 -0000

Removed obsolete patch

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gnupg/gnupg-2.0.19/GnuPG2-CVE-2012-6085.patch  | 63 ----------------------
 .../gnupg/{gnupg_2.0.19.bb => gnupg_2.0.20.bb}     |  8 ++-
 2 files changed, 3 insertions(+), 68 deletions(-)
 delete mode 100644 meta/recipes-support/gnupg/gnupg-2.0.19/GnuPG2-CVE-2012-6085.patch
 rename meta/recipes-support/gnupg/{gnupg_2.0.19.bb => gnupg_2.0.20.bb} (80%)

diff --git a/meta/recipes-support/gnupg/gnupg-2.0.19/GnuPG2-CVE-2012-6085.patch b/meta/recipes-support/gnupg/gnupg-2.0.19/GnuPG2-CVE-2012-6085.patch
deleted file mode 100644
index 64c3034..0000000
--- a/meta/recipes-support/gnupg/gnupg-2.0.19/GnuPG2-CVE-2012-6085.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-commit 498882296ffac7987c644aaf2a0aa108a2925471
-Author: Werner Koch <wk@gnupg.org>
-Date:   Thu Dec 20 09:43:41 2012 +0100
-
-    gpg: Import only packets which are allowed in a keyblock.
-    
-    * g10/import.c (valid_keyblock_packet): New.
-    (read_block): Store only valid packets.
-    --
-    
-    A corrupted key, which for example included a mangled public key
-    encrypted packet, used to corrupt the keyring.  This change skips all
-    packets which are not allowed in a keyblock.
-    
-    GnuPG-bug-id: 1455
-    
-    (cherry-picked from commit 3a4b96e665fa639772854058737ee3d54ba0694e)
-
-Upstream-Status: Backport
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-diff --git a/g10/import.c b/g10/import.c
-index ba2439d..ad112d6 100644
---- a/g10/import.c
-+++ b/g10/import.c
-@@ -347,6 +347,27 @@ import_print_stats (void *hd)
- }
- 
- 
-+/* Return true if PKTTYPE is valid in a keyblock.  */
-+static int
-+valid_keyblock_packet (int pkttype)
-+{
-+  switch (pkttype)
-+    {
-+    case PKT_PUBLIC_KEY:
-+    case PKT_PUBLIC_SUBKEY:
-+    case PKT_SECRET_KEY:
-+    case PKT_SECRET_SUBKEY:
-+    case PKT_SIGNATURE:
-+    case PKT_USER_ID:
-+    case PKT_ATTRIBUTE:
-+    case PKT_RING_TRUST:
-+      return 1;
-+    default:
-+      return 0;
-+    }
-+}
-+
-+
- /****************
-  * Read the next keyblock from stream A.
-  * PENDING_PKT should be initialzed to NULL
-@@ -424,7 +445,7 @@ read_block( IOBUF a, PACKET **pending_pkt, KBNODE *ret_root )
- 	    }
- 	    in_cert = 1;
- 	  default:
--	    if( in_cert ) {
-+	    if (in_cert && valid_keyblock_packet (pkt->pkttype)) {
- 		if( !root )
- 		    root = new_kbnode( pkt );
- 		else
diff --git a/meta/recipes-support/gnupg/gnupg_2.0.19.bb b/meta/recipes-support/gnupg/gnupg_2.0.20.bb
similarity index 80%
rename from meta/recipes-support/gnupg/gnupg_2.0.19.bb
rename to meta/recipes-support/gnupg/gnupg_2.0.20.bb
index 593250a..87acd00 100644
--- a/meta/recipes-support/gnupg/gnupg_2.0.19.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.0.20.bb
@@ -7,15 +7,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
 DEPENDS = "${PTH} libassuan libksba zlib bzip2 readline libgcrypt"
 PTH = "pth"
 PTH_libc-uclibc = "npth"
-PR = "r5"
 
 inherit autotools gettext
 
-SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://GnuPG2-CVE-2012-6085.patch"
+SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "6a8589381ca1b0c1a921e9955f42b016"
-SRC_URI[sha256sum] = "efa23a8a925adb51c7d3b708c25b6d000300f5ce37de9bdec6453be7b419c622"
+SRC_URI[md5sum] = "9d18ee71bb0b10d40d1c8a393bdd7a89"
+SRC_URI[sha256sum] = "6e949b7f062cab8a3cf0910f91ecf04cabaad458c0aeeec66298651b8b04b79a"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
1.8.1.4


