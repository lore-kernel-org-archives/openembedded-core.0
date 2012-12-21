Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1Tm2Fz-0004ZI-8z
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 14:03:27 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Dec 2012 04:48:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,329,1355126400"; d="scan'208";a="235156040"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.157])
	by azsmga001.ch.intel.com with ESMTP; 21 Dec 2012 04:48:31 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Dec 2012 14:48:56 +0200
Message-Id: <1356094136-22853-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] telepathy-idle: upgrade to 0.1.14
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
X-List-Received-Date: Fri, 21 Dec 2012 13:03:27 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../build-fix-for-make-j-safety.patch              |   39 --------------------
 .../fix-svc-gtk-doc.h-target.patch                 |    0
 ...thy-idle_0.1.12.bb => telepathy-idle_0.1.14.bb} |    9 ++---
 3 files changed, 4 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-connectivity/telepathy/telepathy-idle-0.1.12/build-fix-for-make-j-safety.patch
 rename meta/recipes-connectivity/telepathy/{telepathy-idle-0.1.12 => telepathy-idle-0.1.14}/fix-svc-gtk-doc.h-target.patch (100%)
 rename meta/recipes-connectivity/telepathy/{telepathy-idle_0.1.12.bb => telepathy-idle_0.1.14.bb} (70%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-idle-0.1.12/build-fix-for-make-j-safety.patch b/meta/recipes-connectivity/telepathy/telepathy-idle-0.1.12/build-fix-for-make-j-safety.patch
deleted file mode 100644
index 0aeed09..0000000
--- a/meta/recipes-connectivity/telepathy/telepathy-idle-0.1.12/build-fix-for-make-j-safety.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From b092172e56393fad70e472afa26df4f886dfdbc0 Mon Sep 17 00:00:00 2001
-From: Dan Winship <danw@gnome.org>
-Date: Fri, 24 Aug 2012 12:19:45 -0400
-Subject: [PATCH] build: fix for "make -j" safety
-
-A make rule with multiple (non-pattern) targets just says that each of
-those files can be built by the rule, not that the rule builds all of
-them at once. So under "make -j", extensions/Makefile would run three
-copies of glib-ginterface-gen.py at once, which could end up deleting
-each others' files and causing a make failure. Fix.
-
-Signed-off-by: Jonny Lamb <jonny.lamb@collabora.co.uk>
-
-Upstream-Status: Backport [b092172e56393fad70e472afa26df4f886dfdbc0]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
----
- extensions/Makefile.am |    5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/extensions/Makefile.am b/extensions/Makefile.am
-index 24efb6e..bb837da 100644
---- a/extensions/Makefile.am
-+++ b/extensions/Makefile.am
-@@ -42,7 +42,10 @@ extensions.html: _gen/all.xml $(tools_dir)/doc-generator.xsl
- 		$(tools_dir)/doc-generator.xsl \
- 		$< > $@
- 
--_gen/svc.c _gen/svc.h _gen/svc-gtk-doc.h: _gen/all.xml \
-+_gen/svc.h: _gen/svc.c
-+_gen/svc-gtk-doc.h: _gen/svc.c
-+
-+_gen/svc.c: _gen/all.xml \
- 	$(tools_dir)/glib-ginterface-gen.py
- 	$(AM_V_GEN)$(PYTHON) $(tools_dir)/glib-ginterface-gen.py \
- 		--filename=_gen/svc --signal-marshal-prefix=_idle_ext \
--- 
-1.7.10.4
-
diff --git a/meta/recipes-connectivity/telepathy/telepathy-idle-0.1.12/fix-svc-gtk-doc.h-target.patch b/meta/recipes-connectivity/telepathy/telepathy-idle-0.1.14/fix-svc-gtk-doc.h-target.patch
similarity index 100%
rename from meta/recipes-connectivity/telepathy/telepathy-idle-0.1.12/fix-svc-gtk-doc.h-target.patch
rename to meta/recipes-connectivity/telepathy/telepathy-idle-0.1.14/fix-svc-gtk-doc.h-target.patch
diff --git a/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.12.bb b/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.14.bb
similarity index 70%
rename from meta/recipes-connectivity/telepathy/telepathy-idle_0.1.12.bb
rename to meta/recipes-connectivity/telepathy/telepathy-idle_0.1.14.bb
index c9e8b3b..1e6e3ea 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.12.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.14.bb
@@ -5,14 +5,13 @@ DEPENDS = "glib-2.0 dbus telepathy-glib openssl"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/idle.c;beginline=1;endline=19;md5=b06b1e2594423111a1a7910b0eefc7f9"
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
-           file://fix-svc-gtk-doc.h-target.patch \
-           file://build-fix-for-make-j-safety.patch"
+           file://fix-svc-gtk-doc.h-target.patch"
 
-SRC_URI[md5sum] = "e77e5b84cc8f77cf12d15727c30df366"
-SRC_URI[sha256sum] = "5343aede5f68450735be8e835143795d5d95151b64d35fd7a99c2a24a771e33b"
+SRC_URI[md5sum] = "c292c54aa08f61544ab53fda880d861c"
+SRC_URI[sha256sum] = "df344e7959d99ab4ee4c0bcde82e6fc652cc48dc93ce11fcd024fa2383068fec"
 
 inherit autotools pkgconfig
 
-- 
1.7.10.4



