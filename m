Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QS43C-00083L-FS
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 11:18:46 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QS409-00032E-8t
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 11:15:37 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 02 Jun 2011 10:15:36 +0100
Message-ID: <1307006136.2529.166.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-Mailman-Approved-At: Thu, 02 Jun 2011 11:23:21 +0200
Subject: [PATCH] dbus: avoid dependency on x11 for -native build
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
X-List-Received-Date: Thu, 02 Jun 2011 09:18:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The native variant already configures --without-x so the X11 libs are
redundant.  Adjust the DEPENDS to match.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-core/dbus/dbus.inc |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index fb2f6d4..5f9a8a3 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -5,8 +5,11 @@ SECTION = "base"
 LICENSE = "AFL-2 | GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
                     file://dbus/dbus.h;firstline=6;endline=20;md5=6eea2e0c7750dd8e620dcb1437312fa5"
-DEPENDS = "expat virtual/libintl virtual/libx11 libsm"
-DEPENDS_virtclass-nativesdk = "expat virtual/libintl virtual/libx11"
+x11deps = "virtual/libx11 libsm"
+basedeps = "expat virtual/libintl"
+DEPENDS = "${basedeps} ${x11deps}"
+DEPENDS_virtclass-native = "${basedeps}"
+DEPENDS_virtclass-nativesdk = "${basedeps} virtual/libx11"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch; \
-- 
1.7.2.5





