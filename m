Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SAjQe-0002Sp-Q3
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 15:55:52 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 15:46:56 +0100
Message-Id: <1332427616-11816-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH] gst-plugins: remove obsolete orcc hack
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
X-List-Received-Date: Thu, 22 Mar 2012 14:55:52 -0000

* The sed script replacing ${bindir}/orcc with
  ${STAGING_BINDIR_NATIVE}/orcc causes orcc to not be found.
  It may have been a workaround for older versions of pkg-config
  or older gst-plugins. Removing it makes gst-plugins use
  orcc from 'orc-native' successfully, if available.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-multimedia/gstreamer/gst-plugins.inc |   10 +---------
 1 files changed, 1 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins.inc b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
index a71a868..d2df58b 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
@@ -6,7 +6,7 @@ DEPENDS = "gstreamer"
 
 inherit autotools pkgconfig
 
-PR = "r1"
+PR = "r2"
 
 FILESPATH =. "${FILE_DIRNAME}/gst-plugins:"
 
@@ -16,14 +16,6 @@ EXTRA_OECONF = "--disable-valgrind --disable-debug --disable-examples "
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
-# orc.m4 calls pkg-config ----variable=orcc orc-0.4 to get the path to orcc,
-# resulting in /usr/bin/orcc. Force it to use the staged orcc.
-do_configure_append() {
- 	for i in $(find ${S} -name "Makefile") ; do
-		sed -i -e s:${bindir}/orcc:${STAGING_BINDIR_NATIVE}/orcc:g $i
- 	done
-}
-
 require gst-plugins-package.inc
 
 PACKAGES_DYNAMIC = "${PN}-*"
-- 
1.7.7



