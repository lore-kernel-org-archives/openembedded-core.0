Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T4RiP-00008A-Iw
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 09:20:29 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by orsmga102.jf.intel.com with ESMTP; 23 Aug 2012 00:08:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,298,1344236400"; d="scan'208";a="137018187"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Aug 2012 00:08:23 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2012 09:13:11 +0300
Message-Id: <1345702391-27078-3-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345702391-27078-1-git-send-email-constantinx.musca@intel.com>
References: <1345702391-27078-1-git-send-email-constantinx.musca@intel.com>
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 2/2] telepathy-idle: upgrade to 0.1.12
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
X-List-Received-Date: Thu, 23 Aug 2012 07:20:30 -0000

Add patch for fixing the _gen/svc-gtk-doc.h target in
the makefiles.

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../fix-svc-gtk-doc.h-target.patch                 |   37 ++++++++++++++++++++
 ...thy-idle_0.1.11.bb => telepathy-idle_0.1.12.bb} |    9 ++---
 2 files changed, 42 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/telepathy/telepathy-idle-0.1.12/fix-svc-gtk-doc.h-target.patch
 rename meta/recipes-connectivity/telepathy/{telepathy-idle_0.1.11.bb => telepathy-idle_0.1.12.bb} (72%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-idle-0.1.12/fix-svc-gtk-doc.h-target.patch b/meta/recipes-connectivity/telepathy/telepathy-idle-0.1.12/fix-svc-gtk-doc.h-target.patch
new file mode 100644
index 0000000..a5efed4
--- /dev/null
+++ b/meta/recipes-connectivity/telepathy/telepathy-idle-0.1.12/fix-svc-gtk-doc.h-target.patch
@@ -0,0 +1,37 @@
+Upstream-Status: Pending
+
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+--- a/extensions/Makefile.am
++++ b/extensions/Makefile.am
+@@ -37,12 +37,12 @@ _gen/all.xml: all.xml $(wildcard $(srcdi
+ 		--xinclude $(tools_dir)/identity.xsl \
+ 		$< > $@
+ 
+-extensions.html: _gen/all.xml $(tools_dir)/doc-generator.xsl
++extensions.html _gen/svc-gtk-doc.h: _gen/all.xml $(tools_dir)/doc-generator.xsl
+ 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROCFLAGS) \
+ 		$(tools_dir)/doc-generator.xsl \
+ 		$< > $@
+ 
+-_gen/svc.c _gen/svc.h _gen/svc-gtk-doc.h: _gen/all.xml \
++_gen/svc.c _gen/svc.h: _gen/all.xml \
+ 	$(tools_dir)/glib-ginterface-gen.py
+ 	$(AM_V_GEN)$(PYTHON) $(tools_dir)/glib-ginterface-gen.py \
+ 		--filename=_gen/svc --signal-marshal-prefix=_idle_ext \
+--- a/extensions/Makefile.in
++++ b/extensions/Makefile.in
+@@ -585,12 +585,12 @@ _gen/all.xml: all.xml $(wildcard $(srcdi
+ 		--xinclude $(tools_dir)/identity.xsl \
+ 		$< > $@
+ 
+-extensions.html: _gen/all.xml $(tools_dir)/doc-generator.xsl
++extensions.html _gen/svc-gtk-doc.h: _gen/all.xml $(tools_dir)/doc-generator.xsl
+ 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROCFLAGS) \
+ 		$(tools_dir)/doc-generator.xsl \
+ 		$< > $@
+ 
+-_gen/svc.c _gen/svc.h _gen/svc-gtk-doc.h: _gen/all.xml \
++_gen/svc.c _gen/svc.h: _gen/all.xml \
+ 	$(tools_dir)/glib-ginterface-gen.py
+ 	$(AM_V_GEN)$(PYTHON) $(tools_dir)/glib-ginterface-gen.py \
+ 		--filename=_gen/svc --signal-marshal-prefix=_idle_ext \
diff --git a/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.11.bb b/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.12.bb
similarity index 72%
rename from meta/recipes-connectivity/telepathy/telepathy-idle_0.1.11.bb
rename to meta/recipes-connectivity/telepathy/telepathy-idle_0.1.12.bb
index 291f4f6..c8163e2 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.11.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.12.bb
@@ -5,12 +5,13 @@ DEPENDS = "glib-2.0 dbus telepathy-glib openssl"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/idle.c;beginline=1;endline=19;md5=b06b1e2594423111a1a7910b0eefc7f9"
-PR = "r1"
+PR = "r0"
 
-SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
+           file://fix-svc-gtk-doc.h-target.patch"
 
-SRC_URI[md5sum] = "be277e8f0bd32ae56af799f0ff4ec72e"
-SRC_URI[sha256sum] = "047ccbec0b91ac187467ede5a90966f9ec881df56fd8c80cb3bce3710f66fda0"
+SRC_URI[md5sum] = "e77e5b84cc8f77cf12d15727c30df366"
+SRC_URI[sha256sum] = "5343aede5f68450735be8e835143795d5d95151b64d35fd7a99c2a24a771e33b"
 
 inherit autotools pkgconfig
 
-- 
1.7.9.5



