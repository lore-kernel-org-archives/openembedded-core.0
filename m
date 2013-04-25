Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UVM7H-0001fQ-Gu for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 15:21:40 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1UVLq6-00048h-ET
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 15:03:54 +0200
Message-ID: <1366895033.14512.89.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2013 14:03:53 +0100
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Subject: [PATCH] gettext: Make ncurses dependency conditional on PACKAGECONFIG[msgcat-curses]
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
X-List-Received-Date: Thu, 25 Apr 2013 13:21:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

According to the documentation, the only reason for needing ncurses is
to support colour output from msgcat.  Make this optional so that
ncurses doesn't need to be built if colour output is not required.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-core/gettext/gettext_0.18.2.bb |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.18.2.bb b/meta/recipes-core/gettext/gettext_0.18.2.bb
index 086f7fa..7b4cc25 100644
--- a/meta/recipes-core/gettext/gettext_0.18.2.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.2.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv3+ & LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 PR = "r0"
-DEPENDS = "gettext-native virtual/libiconv ncurses expat"
+DEPENDS = "gettext-native virtual/libiconv expat"
 DEPENDS_class-native = "gettext-minimal-native"
 PROVIDES = "virtual/libintl virtual/gettext"
 PROVIDES_class-native = "virtual/gettext-native"
@@ -15,6 +15,8 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
 	   file://parallel.patch \
           "
 
+PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${STAGING_LIBDIR}/..,--disable-curses,ncurses,"
+
 LDFLAGS_prepend_libc-uclibc = " -lrt -lpthread "
 
 SRC_URI[md5sum] = "0c86e5af70c195ab8bd651d17d783928"
@@ -30,7 +32,6 @@ EXTRA_OECONF += "--without-lispdir \
                  --disable-openmp \
                  --disable-acl \
                  --with-included-glib \
-                 --with-libncurses-prefix=${STAGING_LIBDIR}/.. \
                  --without-emacs \
                  --without-cvs \
                  --without-git \
-- 
1.7.10.4





