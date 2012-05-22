Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SWut2-0001jU-P0
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 21:36:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4MJQhcJ026932
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2012 12:26:43 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 22 May 2012 12:26:42 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 May 2012 14:30:13 -0500
Message-ID: <6aa18acbbf4496a972ae56cf3f6f128c7e073f4e.1337714416.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1337714416.git.mark.hatle@windriver.com>
References: <cover.1337714416.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 15/30] busybox: use new update-alternatives
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
X-List-Received-Date: Tue, 22 May 2012 19:36:53 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc       |   66 +++++++++------------------
 meta/recipes-core/busybox/busybox_1.19.4.bb |    2 +-
 2 files changed, 23 insertions(+), 45 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 1613878..5b83d32 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -201,36 +201,36 @@ do_install () {
 	install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
 }
 
-python package_do_filedeps_append () {
-	# We need to load the full set of busybox provides from the /etc/busybox.links
-	# The pkg_postinst_ is what creates the actual links
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "50"
 
-	pkg = d.getVar('PN', True)
-	f_busybox = "/bin/busybox"
-	f_busybox_links = "/etc/busybox.links"
+ALTERNATIVE_${PN}-syslog = "syslog-init syslog-startup-conf"
 
-	requires_files = []
-	provides_files = []
+ALTERNATIVE_LINK_NAME[syslog-init] = "${sysconfdir}/init.d/syslog"
 
-	# Load/backup original set
-	filerprovides = d.getVar('FILERPROVIDES_%s_%s' % (f_busybox, pkg), True) or ""
+ALTERNATIVE_LINK_NAME[syslog-startup-conf] = "${sysconfdir}/syslog-startup.conf"
 
-	dep_pipe = os.popen('sed -e "s,^,%s/%s%s Provides: ," %s/%s%s' % (pkgdest, pkg, f_busybox, pkgdest, pkg, f_busybox_links))
+ALTERNATIVE_TARGET = "/bin/busybox"
+
+python do_package_prepend () {
+	# We need to load the full set of busybox provides from the /etc/busybox.links
+	# Use this to see the update-alternatives with the right information
 
-	process_deps(dep_pipe, pkg, provides_files, requires_files)
+	dvar = d.getVar('D', True)
+	pn = d.getVar('PN', True)
+	f = open('%s/etc/busybox.links' % (dvar), 'r')
 
-	# Add the new set
-	filerprovides += d.getVar('FILERPROVIDES_%s_%s' % (f_busybox, pkg), True) or ""
+	for alt_link_name in f:
+		alt_link_name = alt_link_name.strip()
+		alt_name = os.path.basename(alt_link_name)
 
-	# Make sure there is an entry for this item in the FILERPROVIDESFLIST...
-	filerprovidesflist = (d.getVar('FILERPROVIDESFLIST_%s' % pkg, True) or "").split()
-	for file in provides_files:
-		if file not in filerprovidesflist:
-			filerprovidesflist.append(file)
-	d.setVar('FILERPROVIDESFLIST_%s' % pkg, " ".join(filerprovidesflist))
+		# Match coreutils
+		if alt_name == '[':
+			alt_name = 'lbracket'
 
-	# Store the new provides
-	d.setVar('FILERPROVIDES_%s_%s' % (f_busybox, pkg), filerprovides)
+		d.appendVar('ALTERNATIVE_%s' % (pn), ' ' + alt_name)
+		d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link_name)
 }
 
 pkg_postinst_${PN} () {
@@ -239,14 +239,6 @@ pkg_postinst_${PN} () {
 	# (update-alternatives have no problem replacing links later anyway)
 	test -n 2> /dev/null || alias test='busybox test'
 	if test "x$D" = "x"; then while read link; do if test ! -h "$link"; then case "$link" in /*/*/*) to="../../bin/busybox";; /bin/*) to="busybox";; /*/*) to="../bin/busybox";; esac; busybox ln -s $to $link; fi; done </etc/busybox.links; fi
-	
-	# This adds the links, remember that this has to work when building an image too, hence the $D
-	while read link; do case "$link" in /*/*/*) to="../../bin/busybox";; /bin/*) to="busybox";; /*/*) to="../bin/busybox";; esac; bn=`basename $link`; update-alternatives --install $link $bn $to 50; done <$D/etc/busybox.links
-}
-
-pkg_postinst_${PN}-syslog () {
-	update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${BPN} 50
-	update-alternatives --install ${sysconfdir}/syslog-startup.conf syslog-startup-conf syslog-startup.conf.${BPN} 50
 }
 
 pkg_prerm_${PN} () {
@@ -268,17 +260,6 @@ pkg_prerm_${PN} () {
 	ln -s /bin/busybox $tmpdir/sort
 	ln -s /bin/busybox $tmpdir/grep
 	export PATH=$PATH:$tmpdir
-
-	while read link
-	do
-		case "$link" in
-			/*/*/*) to="../../bin/busybox";;
-			/bin/*) to="busybox";;
-			/*/*) to="../bin/busybox";;
-		esac
-		bn=`basename $link`
-		sh /usr/bin/update-alternatives --remove $bn $to
-	done </etc/busybox.links
 }
 
 pkg_prerm_${PN}-syslog () {
@@ -288,7 +269,4 @@ pkg_prerm_${PN}-syslog () {
 			/etc/init.d/syslog stop
 		fi
 	fi
-
-	update-alternatives --remove syslog-init syslog.${BPN}
-	update-alternatives --remove syslog-startup-conf syslog-startup.conf.${BPN}
 }
diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-core/busybox/busybox_1.19.4.bb
index a797ac9..0717075 100644
--- a/meta/recipes-core/busybox/busybox_1.19.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://B921600.patch \
-- 
1.7.3.4



