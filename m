Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLH7K-0005je-RM
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:55:31 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Apr 2012 09:45:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156167832"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.163])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2012 09:45:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:45:00 -0700
Message-Id: <f74d33367a3aa5ba5fd50412833c36e094f28e47.1334940120.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/43] coreutils_*.bb: Use update alternatives and add missing manual alt links
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
X-List-Received-Date: Fri, 20 Apr 2012 16:55:31 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Coreutils was capable of providing many of the necessary binaries for
the system, however it never told the package manager what was being
provided via the alternatives.  Use the MANUAL_ALTERNATIVE_LINKS to do
this.

It also should have been using the update-alternatives class as that
automatically sets the file rprovides.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

coreutils - 8.14 - update-alt
---
 meta/recipes-core/coreutils/coreutils_6.9.bb  |   34 +++++++++-------------
 meta/recipes-core/coreutils/coreutils_8.14.bb |   38 +++++++++++++------------
 2 files changed, 34 insertions(+), 38 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index 8a47a60..32ea321 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -8,11 +8,11 @@ BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/ls.c;startline=4;endline=16;md5=482a96d4f25010a4e13f8743e0c3685e"
-PR = "r2"
+PR = "r3"
 DEPENDS = "coreutils-native-${PV}"
 DEPENDS_virtclass-native = "gettext-native"
 
-inherit autotools gettext
+inherit update-alternatives autotools gettext
 
 SRC_URI_BASE = "${GNU_MIRROR}/coreutils/${BP}.tar.bz2 \
            file://gnulib_m4.patch \
@@ -30,6 +30,9 @@ SRC_URI_virtclass-native = "${SRC_URI_BASE}"
 SRC_URI[md5sum] = "c9607d8495f16e98906e7ed2d9751a06"
 SRC_URI[sha256sum] = "89c2895ad157de50e53298b22d91db116ee4e1dd3fdf4019260254e2e31497b0"
 
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_LINKS = ""
+
 # [ gets a special treatment and is not included in this
 bindir_progs = "base64 basename cksum comm csplit cut dir dircolors dirname du \
                 env expand expr factor fmt fold groups head hostid id install \
@@ -37,23 +40,26 @@ bindir_progs = "base64 basename cksum comm csplit cut dir dircolors dirname du \
                 pinky pr printenv printf ptx readlink seq sha1sum sha224sum sha256sum \
                 sha384sum sha512sum shred shuf sort split stat sum tac tail tee test \
                 tr tsort tty unexpand uniq unlink users vdir wc who whoami yes"
+ALTERNATIVE_LINKS += "${bindir}/${@' ${bindir}/'.join((d.getVar('bindir_progs', True)).split())}"
 
 # hostname gets a special treatment and is not included in this
 base_bindir_progs = "cat chgrp chmod chown cp date dd echo false kill ln ls mkdir \
                      mknod mv pwd rm rmdir sleep stty sync touch true uname"
+ALTERNATIVE_LINKS += "${base_bindir}/${@' ${base_bindir}/'.join((d.getVar('base_bindir_progs', True)).split())}"
 
 sbindir_progs= "chroot"
+ALTERNATIVE_LINKS += "${sbindir}/${@' ${sbindir}/'.join((d.getVar('sbindir_progs', True)).split())}"
 
-do_install() {
-	autotools_do_install
-
-	for i in ${bindir_progs}; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${PN}; done
+# rprovides for manually controlled alternatives
+MANUAL_ALTERNATIVE_LINKS += "${bindir}/uptime ${base_bindir}/hostname"
+MANUAL_ALTERNATIVE_LINKS += "${bindir}/[:${bindir}/lbracket.${PN}"
 
+do_install_append() {
 	install -d ${D}${base_bindir}
-	for i in ${base_bindir_progs}; do mv ${D}${bindir}/$i ${D}${base_bindir}/$i.${PN}; done
+	for i in ${base_bindir_progs}; do mv ${D}${bindir}/$i ${D}${base_bindir}/$i; done
 
 	install -d ${D}${sbindir}
-	for i in ${sbindir_progs}; do mv ${D}${bindir}/$i ${D}${sbindir}/$i.${PN}; done
+	for i in ${sbindir_progs}; do mv ${D}${bindir}/$i ${D}${sbindir}/$i; done
 
 	# [ requires special handling because [.coreutils will cause the sed stuff
 	# in update-alternatives to fail, therefore use lbracket - the name used
@@ -66,12 +72,6 @@ do_install() {
 }
 
 pkg_postinst_${PN} () {
-	for i in ${bindir_progs}; do update-alternatives --install ${bindir}/$i $i $i.${PN} 100; done
-
-	for i in ${base_bindir_progs}; do update-alternatives --install ${base_bindir}/$i $i $i.${PN} 100; done
-
-	for i in ${sbindir_progs}; do update-alternatives --install ${sbindir}/$i $i $i.${PN} 100; done
-
 	# Special cases. uptime and hostname is broken, prefer busybox's version. [ needs to be treated separately.
 	update-alternatives --install ${bindir}/uptime uptime uptime.${PN} 10
 	update-alternatives --install ${base_bindir}/hostname hostname hostname.${PN} 10
@@ -79,12 +79,6 @@ pkg_postinst_${PN} () {
 }
 
 pkg_prerm_${PN} () {
-	for i in ${bindir_progs}; do update-alternatives --remove $i $i.${PN}; done
-
-	for i in ${base_bindir_progs}; do update-alternatives --remove $i $i.${PN}; done
-
-	for i in ${sbindir_progs}; do update-alternatives --remove $i $i.${PN}; done
-
 	# The special cases
 	update-alternatives --remove hostname hostname.${PN}
 	update-alternatives --remove uptime uptime.${PN}
diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes-core/coreutils/coreutils_8.14.bb
index 688cec9..9ccb813 100644
--- a/meta/recipes-core/coreutils/coreutils_8.14.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.14.bb
@@ -7,11 +7,11 @@ BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
                     file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"
-PR = "r3"
+PR = "r4"
 DEPENDS = "gmp libcap"
 DEPENDS_virtclass-native = ""
 
-inherit autotools gettext
+inherit update-alternatives autotools gettext
 
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
@@ -21,6 +21,9 @@ SRC_URI[sha256sum] = "0d120817c19292edb19e92ae6b8eac9020e03d51e0af9cb116cf82b65d
 
 EXTRA_OECONF_virtclass-native = "--without-gmp"
 
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_LINKS = ""
+
 # [ df mktemp base64 gets a special treatment and is not included in this
 bindir_progs = "basename chcon cksum comm csplit cut dir dircolors dirname du \
                 env expand expr factor fmt fold groups head hostid id install \
@@ -28,37 +31,42 @@ bindir_progs = "basename chcon cksum comm csplit cut dir dircolors dirname du \
                 pinky pr printenv printf ptx readlink runcon seq sha1sum sha224sum sha256sum \
                 sha384sum sha512sum shred shuf sort split stat stdbuf sum tac tail tee test timeout\
                 tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes"
+ALTERNATIVE_LINKS += "${bindir}/${@' ${bindir}/'.join((d.getVar('bindir_progs', True)).split())}"
 
 # hostname gets a special treatment and is not included in this
 base_bindir_progs = "cat chgrp chmod chown cp date dd echo false kill ln ls mkdir \
                      mknod mv pwd rm rmdir sleep stty sync touch true uname"
+ALTERNATIVE_LINKS += "${base_bindir}/${@' ${base_bindir}/'.join((d.getVar('base_bindir_progs', True)).split())}"
 
 sbindir_progs= "chroot"
+ALTERNATIVE_LINKS += "${sbindir}/${@' ${sbindir}/'.join((d.getVar('sbindir_progs', True)).split())}"
 
-do_install_append() {
-	for i in ${bindir_progs} df mktemp base64; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${PN}; done
+# Manual file provides for manually controlled alternatives
+MANUAL_ALTERNATIVE_LINKS += "${base_bindir}/df:${bindir}/df.${PN}"
+MANUAL_ALTERNATIVE_LINKS += "${base_bindir}/mktemp:${bindir}/mktemp.${PN}"
+MANUAL_ALTERNATIVE_LINKS += "${base_bindir}/base64:${bindir}/base64.${PN}"
+MANUAL_ALTERNATIVE_LINKS += "${bindir}/[:${bindir}/lbracket.${PN}"
 
+do_install_append() {
 	install -d ${D}${base_bindir}
-	for i in ${base_bindir_progs}; do mv ${D}${bindir}/$i ${D}${base_bindir}/$i.${PN}; done
+	for i in ${base_bindir_progs}; do mv ${D}${bindir}/$i ${D}${base_bindir}/$i; done
 
 	install -d ${D}${sbindir}
-	for i in ${sbindir_progs}; do mv ${D}${bindir}/$i ${D}${sbindir}/$i.${PN}; done
+	for i in ${sbindir_progs}; do mv ${D}${bindir}/$i ${D}${sbindir}/$i; done
+
+	# Process the special items due to mismatch with busybox
+	for i in df mktemp base64; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${PN}; done
 
 	# [ requires special handling because [.coreutils will cause the sed stuff
 	# in update-alternatives to fail, therefore use lbracket - the name used
 	# for the actual source file.
 	mv ${D}${bindir}/[ ${D}${bindir}/lbracket.${PN}
+
 	install -d ${D}${libdir}/coreutils
 	mv ${D}${libexecdir}/coreutils/libstdbuf.so ${D}${libdir}/coreutils
 }
 
 pkg_postinst_${PN} () {
-	for i in ${bindir_progs}; do update-alternatives --install ${bindir}/$i $i $i.${PN} 100; done
-
-	for i in ${base_bindir_progs}; do update-alternatives --install ${base_bindir}/$i $i $i.${PN} 100; done
-
-	for i in ${sbindir_progs}; do update-alternatives --install ${sbindir}/$i $i $i.${PN} 100; done
-
 	# Special cases. [ needs to be treated separately.
 	update-alternatives --install '${bindir}/[' '[' 'lbracket.${PN}' 100
 	
@@ -69,12 +77,6 @@ pkg_postinst_${PN} () {
 }
 
 pkg_prerm_${PN} () {
-	for i in ${bindir_progs}; do update-alternatives --remove $i $i.${PN}; done
-
-	for i in ${base_bindir_progs}; do update-alternatives --remove $i $i.${PN}; done
-
-	for i in ${sbindir_progs}; do update-alternatives --remove $i $i.${PN}; done
-
 	# The special cases
 	update-alternatives --remove hostname hostname.${PN}
 	update-alternatives --remove uptime uptime.${PN}
-- 
1.7.7.6



