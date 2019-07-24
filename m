Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id 96D707D3A6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 20:33:57 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id 33378102833;
	Wed, 24 Jul 2019 20:33:58 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2019 22:33:50 +0200
Message-Id: <20190724203350.26659-1-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] pulseaudio: Backport upstream fix new alsa compatibility.
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
X-List-Received-Date: Wed, 24 Jul 2019 20:33:58 -0000
Content-Transfer-Encoding: 8bit

Recent alsa upgrade stripped /usr/include/alsa directory from include
path reported by pkgconfig. Due to this pulseaudio 12.2 configure script
can find alsa's use-case.h header which in turn results in HAVE_ALSA_UCM
being undefined. This turn results in pa_alsa_ucm_device_update_available
symbol missing even though libalsa-util.so needs it. Once could argue
pulseaudio should not allow undefined symmbols in its shared modules.
Unfortunately it does and due to this current OE builds of pulseaudio
crash when the server tries to dlopen any module using libalsa-util.so.

Fix this by backporting ustream alsa header include fix.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 ...001-alsa-Fix-inclusion-of-use-case.h.patch | 46 +++++++++++++++++++
 .../pulseaudio/pulseaudio_12.2.bb             |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-alsa-Fix-inclusion-of-use-case.h.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-alsa-Fix-inclusion-of-use-case.h.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-alsa-Fix-inclusion-of-use-case.h.patch
new file mode 100644
index 0000000000..15026a2f83
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-alsa-Fix-inclusion-of-use-case.h.patch
@@ -0,0 +1,46 @@
+From b89d33bb182c42db5ad3987b0e91b7bf62f421e8 Mon Sep 17 00:00:00 2001
+From: Takashi Iwai <tiwai@suse.de>
+Date: Sun, 21 Apr 2019 11:59:30 +0200
+Subject: [PATCH] alsa: Fix inclusion of use-case.h
+
+The recent change in ALSA upstream stripped -I$include/alsa path from
+pkgconfig.  We already fixed for this change in some places but still
+the code for UCM was overlooked, and this resulted in the unresolved
+symbols in alsa card module. Fix them as well.
+
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Upstream-Status: Backport
+---
+ configure.ac                | 2 +-
+ src/modules/alsa/alsa-ucm.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c004bd70d..b44ed1595 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -826,7 +826,7 @@ AS_IF([test "x$enable_alsa" = "xyes" && test "x$HAVE_ALSA" = "x0"],
+ AS_IF([test "x$HAVE_ALSA" = "x1"],
+     [
+         save_CPPFLAGS="$CPPFLAGS"; CPPFLAGS="$CPPFLAGS $ASOUNDLIB_CFLAGS"
+-        AC_CHECK_HEADERS([use-case.h], HAVE_ALSA_UCM=1, HAVE_ALSA_UCM=0)
++        AC_CHECK_HEADERS([alsa/use-case.h], HAVE_ALSA_UCM=1, HAVE_ALSA_UCM=0)
+         CPPFLAGS="$save_CPPFLAGS"
+     ],
+     HAVE_ALSA_UCM=0)
+diff --git a/src/modules/alsa/alsa-ucm.h b/src/modules/alsa/alsa-ucm.h
+index 53abf3f90..c926f3cc3 100644
+--- a/src/modules/alsa/alsa-ucm.h
++++ b/src/modules/alsa/alsa-ucm.h
+@@ -23,7 +23,7 @@
+ ***/
+ 
+ #ifdef HAVE_ALSA_UCM
+-#include <use-case.h>
++#include <alsa/use-case.h>
+ #else
+ typedef void snd_use_case_mgr_t;
+ #endif
+-- 
+2.21.0
+
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_12.2.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_12.2.bb
index c020fbd4f6..88b4975a66 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_12.2.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_12.2.bb
@@ -3,6 +3,7 @@ require pulseaudio.inc
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
            file://0001-introduce-a-special-build-flag-to-explicitly-disable.patch \
+           file://0001-alsa-Fix-inclusion-of-use-case.h.patch \
            file://0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch \
            file://volatiles.04_pulse \
            "
-- 
2.21.0


