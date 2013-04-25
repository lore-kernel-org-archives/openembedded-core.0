Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UVLrK-0004wC-5K for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 15:05:13 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1UVLaD-00047w-1b
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 14:47:29 +0200
Message-ID: <1366894048.14512.87.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 25 Apr 2013 13:47:28 +0100
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Subject: [PATCH] alsa-utils: Move alsaconf to its own recipe
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
X-List-Received-Date: Thu, 25 Apr 2013 13:05:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

18575b082a4042376fd1575465e69562dea04ddc added bash as a dependency of
alsa-utils-alsaconf so that the script interpreter will be available at
run time.  However, this has the undesirable side effect of making bash
be a build dependency for alsa-utils and, for those folks who don't need
alsaconf but do want some other part of alsa-utils, this cure is worse
than the original disease.

Fix this by moving alsaconf to a separate recipe so that the bash
dependency only applies when alsaconf is specifically requested.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 .../alsa/alsa-utils-alsaconf_1.0.26.bb             |   22 ++++++++++++++++++++
 meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb  |   12 +++++++----
 2 files changed, 30 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.26.bb

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.26.bb b/meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.26.bb
new file mode 100644
index 0000000..71de085
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.26.bb
@@ -0,0 +1,22 @@
+require alsa-utils_${PV}.bb
+
+THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
+FILESPATH =. "${@base_set_filespath(["${THISDIR}/alsa-utils"], d)}:"
+
+PACKAGES = "${PN}"
+RDEPENDS_${PN} += "bash"
+
+DESCRIPTION_${PN}     = "a bash script that creates ALSA configuration files"
+FILES_${PN} = "${sbindir}/alsaconf"
+
+S = "${WORKDIR}/alsa-utils-${PV}"
+
+do_configure() {
+	# Nothing to configure
+	:
+}
+
+do_install() {
+	install -d ${D}${sbindir}
+	install -m 0755 ${S}/alsaconf/alsaconf ${D}${sbindir}/
+}
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb
index 7fe3bac..e0bf755 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb
@@ -39,7 +39,6 @@ ALSA_UTILS_PKGS = "\
              alsa-utils-speakertest \
              alsa-utils-aseqnet \
              alsa-utils-aseqdump \
-             alsa-utils-alsaconf \
              alsa-utils-alsactl \
              alsa-utils-alsaloop \
              alsa-utils-alsaucm \
@@ -47,7 +46,6 @@ ALSA_UTILS_PKGS = "\
 
 PACKAGES += "${ALSA_UTILS_PKGS}"
 RDEPENDS_${PN} += "${ALSA_UTILS_PKGS}"
-RDEPENDS_alsa-utils-alsaconf += "bash"
 
 FILES_${PN} = ""
 FILES_alsa-utils-aplay       = "${bindir}/aplay ${bindir}/arecord"
@@ -60,7 +58,6 @@ FILES_alsa-utils-aseqnet     = "${bindir}/aseqnet"
 FILES_alsa-utils-iecset      = "${bindir}/iecset"
 FILES_alsa-utils-alsactl     = "${sbindir}/alsactl */udev/rules.d ${systemd_unitdir} ${localstatedir}/lib/alsa ${datadir}/alsa/init/"
 FILES_alsa-utils-aseqdump    = "${bindir}/aseqdump"
-FILES_alsa-utils-alsaconf    = "${sbindir}/alsaconf"
 FILES_alsa-utils-alsaloop    = "${bindir}/alsaloop"
 FILES_alsa-utils-alsaucm     = "${bindir}/alsaucm"
 
@@ -73,9 +70,16 @@ DESCRIPTION_alsa-utils-midi         = "miscalleanous MIDI utilities for ALSA"
 DESCRIPTION_alsa-utils-aconnect     = "ALSA sequencer connection manager"
 DESCRIPTION_alsa-utils-aseqnet      = "network client/server on ALSA sequencer"
 DESCRIPTION_alsa-utils-alsactl      = "saves/restores ALSA-settings in /etc/asound.state"
-DESCRIPTION_alsa-utils-alsaconf     = "a bash script that creates ALSA configuration files"
 DESCRIPTION_alsa-utils-alsaucm      = "ALSA Use Case Manager"
 
 RRECOMMENDS_alsa-utils-alsactl = "alsa-states"
 
 ALLOW_EMPTY_alsa-utils = "1"
+
+do_install() {
+	autotools_do_install
+
+	# We don't ship this here because it requires a dependency on bash.
+	# See alsa-utils-alsaconf_${PV}.bb
+	rm ${D}${sbindir}/alsaconf
+}
-- 
1.7.10.4





