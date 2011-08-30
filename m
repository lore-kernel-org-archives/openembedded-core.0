Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QyREL-0003ES-KB
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 18:32:05 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QyR9e-0005UV-9e
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 18:27:14 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Aug 2011 17:27:13 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314721634.19905.154.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] libcap: only enable pam if DISTRO_FEATURES requests it
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
X-List-Received-Date: Tue, 30 Aug 2011 16:32:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-support/libcap/libcap.inc     |    5 +++--
 meta/recipes-support/libcap/libcap_2.22.bb |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
index 67f7579..3506530 100644
--- a/meta/recipes-support/libcap/libcap.inc
+++ b/meta/recipes-support/libcap/libcap.inc
@@ -5,7 +5,8 @@ HOMEPAGE = "http://sites.google.com/site/fullycapable/"
 LICENSE = "BSD | GPLv2"
 LIC_FILES_CHKSUM = "file://License;md5=3f84fd6f29d453a56514cb7e4ead25f1"
 
-DEPENDS = "libpam attr perl-native-runtime"
+DEPENDS = "attr perl-native-runtime"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 # attr and pam are disabled by EXTRA_OEMAKE_virtclass-native
 DEPENDS_virtclass-native = "perl-native-runtime"
 
@@ -20,7 +21,7 @@ do_configure() {
 	sed -e 's,BUILD_CFLAGS ?=,BUILD_CFLAGS := $(BUILD_CFLAGS),' -i Make.Rules
 }
 
-EXTRA_OEMAKE = "LIBATTR=yes PAM_CAP=yes INDENT= SYSTEM_HEADERS=${STAGING_INCDIR} RAISE_SETFCAP=no"
+EXTRA_OEMAKE = "LIBATTR=yes PAM_CAP=${@base_contains('DISTRO_FEATURES', 'pam', 'yes', 'no', d)} INDENT= SYSTEM_HEADERS=${STAGING_INCDIR} RAISE_SETFCAP=no"
 EXTRA_OEMAKE_virtclass-native = "LIBATTR=no PAM_CAP=no INDENT= "
 EXTRA_OEMAKE += " lib=${@os.path.basename('${libdir}')}"
 
diff --git a/meta/recipes-support/libcap/libcap_2.22.bb b/meta/recipes-support/libcap/libcap_2.22.bb
index bb49c03..a31ba3f 100644
--- a/meta/recipes-support/libcap/libcap_2.22.bb
+++ b/meta/recipes-support/libcap/libcap_2.22.bb
@@ -1,6 +1,6 @@
 require libcap.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "ce64058bdb3f086ddbfca8ce6c919845"
 SRC_URI[sha256sum] = "73ebbd4877b5f69dd28b72098e510c5b318bc480f8201c4061ac98b78c04050f"
-- 
1.7.4.1





