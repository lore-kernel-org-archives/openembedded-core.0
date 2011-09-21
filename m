Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6JMU-0008DJ-Ce
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 11:45:02 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Sep 2011 02:39:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="51195283"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.170])
	by orsmga002.jf.intel.com with ESMTP; 21 Sep 2011 02:39:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 02:39:30 -0700
Message-Id: <848800e98bbd186f44afd022cc2821541a409830.1316597628.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316597628.git.sgw@linux.intel.com>
References: <cover.1316597628.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316597628.git.sgw@linux.intel.com>
References: <cover.1316597628.git.sgw@linux.intel.com>
Subject: [RC Fixes 14/19] busybox: Enhance to add dynamic per-file provides
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
X-List-Received-Date: Wed, 21 Sep 2011 09:45:04 -0000

From: Mark Hatle <mark.hatle@windriver.com>

When using the RPM package backend, we need a full list of per-file
provides (and requires).  The busybox package provides a number of
command line utilities, such as /usr/bin/env.  However, because
the utilities are created at post install time via scripting the
provide of each of the links was never made.  So any programs,
such as python, that require /usr/bin/env were unable to resolve
the dependency and failed.

This change only affects packaging backends that use per-file
dependency data.  Currently RPM is the only packaging backend
with this ability.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc       |   32 +++++++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.18.5.bb |    2 +-
 2 files changed, 33 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 3f93358..acd635b 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -205,6 +205,38 @@ do_install () {
 	install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
 }
 
+python package_do_filedeps_append () {
+	# We need to load the full set of busybox provides from the /etc/busybox.links
+	# The pkg_postinst_ is what creates the actual links
+
+	pkg = d.getVar('PN', True)
+	f_busybox = "/bin/busybox"
+	f_busybox_links = "/etc/busybox.links"
+
+	requires_files = []
+	provides_files = []
+
+	# Load/backup original set
+	filerprovides = d.getVar('FILERPROVIDES_%s_%s' % (f_busybox, pkg), True) or ""
+
+	dep_pipe = os.popen('sed -e "s,^,Provides: ," %s/%s%s' % (pkgdest, pkg, f_busybox_links))
+
+	process_deps(dep_pipe, pkg, "%s/%s%s" % (pkgdest, pkg, f_busybox), provides_files, requires_files)
+
+	# Add the new set
+	filerprovides += d.getVar('FILERPROVIDES_%s_%s' % (f_busybox, pkg), True) or ""
+
+	# Make sure there is an entry for this item in the FILERPROVIDESFLIST...
+	filerprovidesflist = (d.getVar('FILERPROVIDESFLIST_%s' % pkg, True) or "").split()
+	for file in provides_files:
+		if file not in filerprovidesflist:
+			filerprovidesflist.append(file)
+	d.setVar('FILERPROVIDESFLIST_%s' % pkg, " ".join(filerprovidesflist))
+
+	# Store the new provides
+	d.setVar('FILERPROVIDES_%s_%s' % (f_busybox, pkg), filerprovides)
+}
+
 pkg_postinst_${PN} () {
 	# If we are not making an image we create links for the utilities that doesn't exist
 	# so the update-alternatives script will get the utilities it needs
diff --git a/meta/recipes-core/busybox/busybox_1.18.5.bb b/meta/recipes-core/busybox/busybox_1.18.5.bb
index c0dc1d4..bdafb31 100644
--- a/meta/recipes-core/busybox/busybox_1.18.5.bb
+++ b/meta/recipes-core/busybox/busybox_1.18.5.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
-- 
1.7.6



