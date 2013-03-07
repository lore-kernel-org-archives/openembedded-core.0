Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UDf5a-0006kz-V2
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Mar 2013 18:58:51 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Mar 2013 18:42:08 +0100
Message-Id: <1362678128-27865-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libsoup-2.4: make libsoup-gnome optional
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
X-List-Received-Date: Thu, 07 Mar 2013 17:58:56 -0000

* Weakens dependency on libgnome-keyring and sqlite3
* Defaults to no if x11 is in DISTRO_FEATURES

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb
index 9274f8c..53807af 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.40.2.bb
@@ -5,11 +5,14 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-PR = "r0"
+PR = "r1"
 
 SECTION = "x11/gnome/libs"
 
-DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 libgnome-keyring"
+DEPENDS = "glib-2.0 gnutls libxml2 libproxy"
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gnome', '', d)}"
+PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome,libgnome-keyring sqlite3"
 
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-- 
1.7.10.4



