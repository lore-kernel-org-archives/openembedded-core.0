Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlyuP-00028m-Hl
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 09:52:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2011 00:47:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,275,1309762800"; d="scan'208";a="31949342"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2011 00:47:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 00:47:11 -0700
Message-Id: <162c6133188d15bf43820e7671cb641136c14ca2.1311752531.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
Subject: [Consolidated & Tested 21/35] dropbear: Support pam
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
X-List-Received-Date: Wed, 27 Jul 2011 07:52:02 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

I make a patch and some changes in dropbear.inc for supporting pam.
- Enable pam in configure
- Modify file option.h to open pam supporting

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-core/dropbear/dropbear.inc            |    8 ++++++-
 .../dropbear/dropbear/dropbear-enable-pam.patch    |   22 ++++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 526a5a0..5af9ebd 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -9,13 +9,17 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3a5b0c2f0d0c49dfde9558ae2036683c"
 
 DEPENDS = "zlib"
 RPROVIDES = "ssh sshd"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.gz \
 	         file://urandom-xauth-changes-to-options.h.patch \
 	         file://configure.patch \
 	         file://fix-2kb-keys.patch \
 	         file://allow-nopw.patch;apply=no \
-	         file://init"
+	         file://init \
+                 ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} "
+
+PAM_SRC_URI = "file://dropbear-enable-pam.patch"
 
 inherit autotools update-rc.d
 
@@ -28,6 +32,8 @@ LD = "${CC}"
 SBINCOMMANDS = "dropbear dropbearkey dropbearconvert"
 BINCOMMANDS = "dbclient ssh scp"
 EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
+EXTRA_OECONF += "\
+ ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
 
 DISTRO_TYPE ?= "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
 
diff --git a/meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch b/meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch
new file mode 100644
index 0000000..004d773
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch
@@ -0,0 +1,22 @@
+dropbear: We need modify file option.h besides enabling pam in \
+configure if we want dropbear to support pam.
+
+Upstream-Status: Pending
+
+Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
+
+--- a/options.h	2011-07-12 13:27:39.008819183 +0800
++++ b/options.h.new	2011-07-12 13:37:37.780819308 +0800
+@@ -149,9 +149,9 @@
+  * but there's an interface via a PAM module - don't bother using it otherwise.
+  * You can't enable both PASSWORD and PAM. */
+ 
+-#define ENABLE_SVR_PASSWORD_AUTH
++//#define ENABLE_SVR_PASSWORD_AUTH
+ /* PAM requires ./configure --enable-pam */
+-/*#define ENABLE_SVR_PAM_AUTH*/
++#define ENABLE_SVR_PAM_AUTH
+ #define ENABLE_SVR_PUBKEY_AUTH
+ 
+ /* Wether to ake public key options in authorized_keys file into account */
+
-- 
1.7.3.4



