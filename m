Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A868375E80
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 16:20:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t88GK8cO014598
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Sep 2015 09:20:08 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 8 Sep 2015 09:20:07 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Sep 2015 09:20:07 -0700
Message-ID: <1441729207-22458-2-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1441729207-22458-1-git-send-email-jslater@windriver.com>
References: <1441729207-22458-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] dpkg: put start-stop-daemon in its own package
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
X-List-Received-Date: Tue, 08 Sep 2015 16:20:08 -0000
Content-Type: text/plain

Also make it update-alternatives compatible and move
it to where busybox puts its version.

Make dpkg RDEPEND on dpkg-start-stop.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc |   20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 6eec2cd..2d7cad0 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -11,7 +11,7 @@ DEPENDS_class-native = "bzip2-replacement-native zlib-native virtual/update-alte
 RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} xz run-postinsts perl"
 RDEPENDS_${PN}_class-native = "xz-native"
 
-inherit autotools gettext perlnative pkgconfig systemd
+inherit autotools gettext perlnative pkgconfig systemd update-alternatives
 
 python () {
     if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
@@ -43,6 +43,12 @@ do_configure () {
 }
 
 do_install_append () {
+	if [ -e ${D}${sbindir}/start-stop-daemon ]; then
+		mkdir -p ${D}${base_sbindir}
+		mv ${D}${sbindir}/start-stop-daemon ${D}${base_sbindir}/start-stop-daemon
+		rmdir --ignore-fail-on-non-empty ${D}${sbindir}
+	fi
+
 	if [ "${PN}" = "dpkg-native" ]; then
 		# update-alternatives doesn't have an offline mode
 		rm ${D}${bindir}/update-alternatives
@@ -67,6 +73,18 @@ PROV_class-native = ""
 
 PROVIDES += "${PROV}"
 
+# split out start-stop-daemon to its own package
+#
+PACKAGES =+ "${PN}-start-stop"
+FILES_${PN}-start-stop = "${base_sbindir}/start-stop-daemon.dpkg"
+
+ALTERNATIVE_PRIORITY="100"
+ALTERNATIVE_${PN}-start-stop = "start-stop-daemon"
+ALTERNATIVE_LINK_NAME[start-stop-daemon]="${base_sbindir}/start-stop-daemon"
+
+RDEPENDS_${PN} += "${PN}-start-stop"
+#
+
 PACKAGES =+ "update-alternatives-dpkg"
 FILES_update-alternatives-dpkg = "${bindir}/update-alternatives ${localstatedir}/lib/dpkg/alternatives ${sysconfdir}/alternatives"
 RPROVIDES_update-alternatives-dpkg += "update-alternatives"
-- 
1.7.9.5


