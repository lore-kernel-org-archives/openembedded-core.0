Return-Path: <marius.avram@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 84AD66D14A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 10:49:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Feb 2014 02:49:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,793,1384329600"; d="scan'208";a="478982832"
Received: from mavram-vostro.rb.intel.com ([10.237.105.158])
	by orsmga002.jf.intel.com with ESMTP; 06 Feb 2014 02:49:55 -0800
From: Marius Avram <marius.avram@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2014 12:54:11 +0200
Message-Id: <1391684051-26510-1-git-send-email-marius.avram@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] puzzles: upgrade to r10116
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
X-List-Received-Date: Thu, 06 Feb 2014 10:49:55 -0000

License has not changed.
Contains changes to the building system.

Signed-off-by: Marius Avram <marius.avram@intel.com>
---
 meta/recipes-sato/puzzles/puzzles_r10116.bb |   53 +++++++++++++++++++++++
 meta/recipes-sato/puzzles/puzzles_r9765.bb  |   61 ---------------------------
 2 files changed, 53 insertions(+), 61 deletions(-)
 create mode 100644 meta/recipes-sato/puzzles/puzzles_r10116.bb
 delete mode 100644 meta/recipes-sato/puzzles/puzzles_r9765.bb

diff --git a/meta/recipes-sato/puzzles/puzzles_r10116.bb b/meta/recipes-sato/puzzles/puzzles_r10116.bb
new file mode 100644
index 0000000..842c648
--- /dev/null
+++ b/meta/recipes-sato/puzzles/puzzles_r10116.bb
@@ -0,0 +1,53 @@
+SUMMARY = "Simon Tatham's Portable Puzzle Collection"
+HOMEPAGE = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
+
+DEPENDS = "gtk+ libxt"
+MOD_PV = "${@d.getVar('PV',1)[1:]}"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=33bcd4bce8f3c197f2aefbdbd2d299bc"
+
+SRC_URI = "svn://svn.tartarus.org/sgt;module=puzzles;rev=${MOD_PV}"
+
+S = "${WORKDIR}/${BPN}"
+
+inherit autotools
+
+do_configure_prepend () {
+    ./mkfiles.pl
+}
+
+FILES_${PN} = "${prefix}/bin/* ${datadir}/applications/*"
+FILES_${PN}-dbg += "${prefix}/bin/.debug"
+
+do_install () {
+    rm -rf ${D}/*
+    export prefix=${D}
+    export DESTDIR=${D}
+    install -d ${D}/${prefix}/bin/
+    oe_runmake install
+
+
+    install -d ${D}/${datadir}/applications/
+
+    # Create desktop shortcuts
+    cd ${D}/${prefix}/bin
+    for prog in *; do
+	if [ -x $prog ]; then
+            # Convert prog to Title Case
+            title=$(echo $prog | sed 's/\(^\| \)./\U&/g')
+	    echo "making ${D}/${datadir}/applications/$prog.desktop"
+	    cat <<STOP > ${D}/${datadir}/applications/$prog.desktop
+[Desktop Entry]
+Name=$title
+Exec=${prefix}/bin/$prog
+Icon=applications-games
+Terminal=false
+Type=Application
+Categories=Game;
+StartupNotify=true
+X-MB-SingleInstance=true
+STOP
+        fi
+    done
+}
diff --git a/meta/recipes-sato/puzzles/puzzles_r9765.bb b/meta/recipes-sato/puzzles/puzzles_r9765.bb
deleted file mode 100644
index 5e972ec..0000000
--- a/meta/recipes-sato/puzzles/puzzles_r9765.bb
+++ /dev/null
@@ -1,61 +0,0 @@
-SUMMARY = "Simon Tatham's Portable Puzzle Collection"
-HOMEPAGE = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
-
-DEPENDS = "gtk+ libxt"
-MOD_PV = "${@d.getVar('PV',1)[1:]}"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=31790deb1e1aac4626e7d1bc04587eb0"
-
-# Upstream updates puzzles.tar.gz for the new release, so checksums seem to be changing regularly right now
-SRC_URI = "svn://svn.tartarus.org/sgt;module=puzzles;rev=${MOD_PV}"
-S = "${WORKDIR}/${BPN}"
-
-#SRC_URI = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/puzzles-${PV}.tar.gz"
-#SRC_URI[md5sum] = "9d84769562007e0f99edac77a3b2d27c"
-#SRC_URI[sha256sum] = "b688b5196f8406a23741e973178bdde78e5f8af4d2a88c33ca1ae1cc1a069d15"
-#S = "${WORKDIR}/${BPN}-${PV}"
-
-do_configure () {
-	./mkfiles.pl
-}
-
-do_compile_prepend = " \
-        export XLDFLAGS='${LDFLAGS} `${STAGING_BINDIR_NATIVE}/pkg-config gtk+-2.0 --libs`'; \
-        export XLFLAGS=-lm \
-	export CFLAGS='${CFLAGS} -I./ `${STAGING_BINDIR_NATIVE}/pkg-config gtk+-2.0 --cflags`'; "
-
-FILES_${PN} = "${prefix}/games/* ${datadir}/applications/*"
-FILES_${PN}-dbg += "${prefix}/games/.debug"
-
-do_install () {
-    rm -rf ${D}/*
-    export prefix=${D}
-    export DESTDIR=${D}
-    install -d ${D}/${prefix}/
-    install -d ${D}/${prefix}/games/
-    oe_runmake install
-    
-    install -d ${D}/${datadir}/
-    install -d ${D}/${datadir}/applications/
-
-    cd ${D}/${prefix}/games 
-    for prog in *; do
-	if [ -x $prog ]; then
-            # Convert prog to Title Case
-            title=$(echo $prog | sed 's/\(^\| \)./\U&/g')
-	    echo "making ${D}/${datadir}/applications/$prog.desktop"
-	    cat <<STOP > ${D}/${datadir}/applications/$prog.desktop
-[Desktop Entry]
-Name=$title
-Exec=${prefix}/games/$prog
-Icon=applications-games
-Terminal=false
-Type=Application
-Categories=Game;
-StartupNotify=true
-X-MB-SingleInstance=true
-STOP
-        fi
-    done
-}
-- 
1.7.9.5


