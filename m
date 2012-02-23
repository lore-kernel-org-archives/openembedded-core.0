Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S0eVI-0003ed-0F
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 20:39:00 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 11:30:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120643523"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.61])
	by fmsmga001.fm.intel.com with ESMTP; 23 Feb 2012 11:30:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 19:30:32 +0000
Message-Id: <19fdad413c52b7bcee8a9e1e75bd33d038492898.1330025248.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1330025248.git.paul.eggleton@linux.intel.com>
References: <cover.1330025248.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1330025248.git.paul.eggleton@linux.intel.com>
References: <cover.1330025248.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] psplash: allow building multiple splash executables
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
X-List-Received-Date: Thu, 23 Feb 2012 19:39:00 -0000

Adds a SPLASH_IMAGES variable which you can set to include one or more
images (listed in URI form as they would appear in SRC_URI), and an
executable will be built for each one, with each executable packaged
separately and managed at runtime using the alternatives system. An
optional "outsuffix" parameter can be used to specify the suffix for the
executable/package name. The images themselves can either be
pre-processed image header files (produced using the
make-image-header.sh script that comes with psplash), or alternatively
you can provide a .png and it will be converted using the aforementioned
script on the fly (at the expense of requiring gdk-pixbuf-native at
build time).

This has been implemented in such a way that you can still just provide
your own psplash-poky-img.h in a bbappend and it will work as it did
before; the only change being that the psplash executable is provided
in a "psplash-default" package rather than in the main psplash package,
and an RRECOMMENDS is set up to ensure psplash-default gets pulled in
(if you specify your own file or change the outsuffix you will need to
either install it separately yourself or add your own RRECOMMENDS
relationship.)

Implements [YOCTO #1947]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/psplash/psplash_git.bb |   93 ++++++++++++++++++++++++++++--
 1 files changed, 87 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 9112aa9..42ea615 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -7,27 +7,108 @@ LIC_FILES_CHKSUM = "file://psplash.h;md5=a87c39812c1e37f3451567cc29a29c8f"
 
 SRCREV = "e05374aae945bcfc6d962ed0d7b2774b77987e1d"
 PV = "0.1+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
            file://psplash-init \
-	   file://psplash-poky-img.h"
+           ${SPLASH_IMAGES}"
+
+SPLASH_IMAGES = "file://psplash-poky-img.h;outsuffix=default"
+
+python __anonymous() {
+    oldpkgs = d.getVar("PACKAGES", True).split()
+    splashfiles = d.getVar('SPLASH_IMAGES', True).split()
+    pkgs = []
+    localpaths = []
+    haspng = False
+    for uri in splashfiles:
+        fetcher = bb.fetch2.Fetch([uri], d)
+        flocal = fetcher.localpath(uri)
+        fbase = os.path.splitext(os.path.basename(flocal))[0]
+        outsuffix = fetcher.ud[uri].parm.get("outsuffix")
+        if not outsuffix:
+            if fbase.startswith("psplash-"):
+                outsuffix = fbase[8:]
+            else:
+                outsuffix = fbase
+            if outsuffix.endswith('-img'):
+                outsuffix = outsuffix[:-4]
+        outname = "psplash-%s" % outsuffix
+        if outname == '' or outname in oldpkgs:
+            bb.fatal("The output name '%s' derived from the URI %s is not valid, please specify the outsuffix parameter" % (outname, uri))
+        else:
+            pkgs.append(outname)
+        if flocal.endswith(".png"):
+            haspng = True
+        localpaths.append(flocal)
+
+    # Set these so that we have less work to do in do_compile and do_install_append
+    d.setVar("SPLASH_INSTALL", " ".join(pkgs))
+    d.setVar("SPLASH_LOCALPATHS", " ".join(localpaths))
+
+    if haspng:
+        d.appendVar("DEPENDS", " gdk-pixbuf-native")
+
+    d.prependVar("PACKAGES", "%s " % (" ".join(pkgs)))
+    for p in pkgs:
+        d.setVar("FILES_%s" % p, "${bindir}/%s" % p)
+        d.setVar("ALTERNATIVE_PATH", "${bindir}/%s" % p)
+        d.setVar("ALTERNATIVE_PRIORITY", "100")
+        postinst = d.getVar("psplash_alternatives_postinst", True)
+        d.setVar('pkg_postinst_%s' % p, postinst)
+        postrm = d.getVar("psplash_alternatives_postrm", True)
+        d.setVar('pkg_postrm_%s' % p, postrm)
+        d.appendVar("RDEPENDS_%s" % p, " ${PN}")
+        if p == "psplash-default":
+            d.appendVar("RRECOMMENDS_${PN}", " %s" % p)
+}
 
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig update-rc.d
 
-FILES_${PN} += "/mnt/.psplash"
+python do_compile () {
+    import shutil
 
-do_configure_prepend () {
-	cp -f ${WORKDIR}/psplash-poky-img.h ${S}/
+    # Build a separate executable for each splash image
+    destfile = "%s/psplash-poky-img.h" % d.getVar('S', True)
+    localfiles = d.getVar('SPLASH_LOCALPATHS', True).split()
+    outputfiles = d.getVar('SPLASH_INSTALL', True).split()
+    for localfile, outputfile in zip(localfiles, outputfiles):
+        if localfile.endswith(".png"):
+            outp = commands.getstatusoutput('./make-image-header.sh %s POKY' % localfile)
+            print(outp[1])
+            fbase = os.path.splitext(os.path.basename(localfile))[0]
+            shutil.copyfile("%s-img.h" % fbase, destfile)
+        else:
+            shutil.copyfile(localfile, destfile)
+        # For some reason just updating the header is not enough, we have to touch the .c
+        # file in order to get it to rebuild
+        os.utime("psplash.c", None)
+        bb.build.exec_func("oe_runmake", d)
+        shutil.copyfile("psplash", outputfile)
 }
 
-do_install_prepend() {
+do_install_append() {
 	install -d ${D}/mnt/.psplash/
 	install -d ${D}${sysconfdir}/init.d/
 	install -m 0755 ${WORKDIR}/psplash-init ${D}${sysconfdir}/init.d/psplash.sh
+	install -d ${D}${bindir}
+	for i in ${SPLASH_INSTALL} ; do
+		install -m 0755 $i ${D}${bindir}/$i
+	done
+	rm -f ${D}${bindir}/psplash
 }
 
+psplash_alternatives_postinst() {
+update-alternatives --install ${bindir}/psplash psplash ${ALTERNATIVE_PATH} ${ALTERNATIVE_PRIORITY}
+}
+
+psplash_alternatives_postrm() {
+update-alternatives --remove psplash ${ALTERNATIVE_PATH}
+}
+
+FILES_${PN} += "/mnt/.psplash"
+
 INITSCRIPT_NAME = "psplash.sh"
 INITSCRIPT_PARAMS = "start 0 S . stop 20 0 1 6 ."
-- 
1.7.5.4



