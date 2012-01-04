Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RiQhh-0006Hn-A0
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 14:16:30 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RiQab-0002CG-KG
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 14:09:09 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jan 2012 13:09:08 +0000
X-Mailer: Evolution 3.0.2- 
Message-ID: <1325682549.28005.46.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] bitbake.conf: remove some redundant/unnecessary variable exports
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
X-List-Received-Date: Wed, 04 Jan 2012 13:16:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Specifically...

SLOT: apparently redundant, deleted.
STAGING_IDLDIR: likewise
QMAKE_MKSPEC_PATH: no longer exported, moved to qmake_base.bbclass
STAGING_SIPDIR: no longer exported, moved to sip.bbclass

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/qmake_base.bbclass |    1 +
 meta/classes/sip.bbclass        |    2 ++
 meta/conf/bitbake.conf          |    7 -------
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/classes/qmake_base.bbclass b/meta/classes/qmake_base.bbclass
index b61b84c..d1008b6 100644
--- a/meta/classes/qmake_base.bbclass
+++ b/meta/classes/qmake_base.bbclass
@@ -1,3 +1,4 @@
+QMAKE_MKSPEC_PATH ?= "${STAGING_DATADIR_NATIVE}/qmake"
 
 OE_QMAKE_PLATFORM = "${TARGET_OS}-oe-g++"
 QMAKESPEC := "${QMAKE_MKSPEC_PATH}/${OE_QMAKE_PLATFORM}"
diff --git a/meta/classes/sip.bbclass b/meta/classes/sip.bbclass
index de0e2ef..3a00e4d 100644
--- a/meta/classes/sip.bbclass
+++ b/meta/classes/sip.bbclass
@@ -1,6 +1,8 @@
 # Build Class for Sip based Python Bindings
 # (C) Michael 'Mickey' Lauer <mickey@Vanille.de>
 #
+STAGING_SIPDIR ?= "${STAGING_DATADIR_NATIVE}/sip"
+
 DEPENDS  =+ "sip-native"
 RDEPENDS += "python-sip"
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1c21616..b858364 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -606,9 +606,6 @@ export PATCH_GET="0"
 # Not sure about the rest of this yet.
 ##################################################################
 
-# slot - currently unused by OE. portage remnants
-SLOT = "0"
-
 # Other
 
 export PKG_CONFIG_DIR = "${STAGING_DIR_HOST}/${libdir}/pkgconfig"
@@ -617,10 +614,6 @@ export PKG_CONFIG_LIBDIR = "${PKG_CONFIG_DIR}"
 export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR_HOST}"
 export PKG_CONFIG_DISABLE_UNINSTALLED = "yes"
 
-export QMAKE_MKSPEC_PATH = "${STAGING_DATADIR_NATIVE}/qmake"
-export STAGING_SIPDIR = "${STAGING_DATADIR_NATIVE}/sip"
-export STAGING_IDLDIR = "${STAGING_DATADIR}/idl"
-
 # library package naming
 AUTO_LIBNAME_PKGS = "${PACKAGES}"
 
-- 
1.7.4.1





