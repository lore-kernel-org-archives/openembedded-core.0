Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TOU5h-0007sF-3Y
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 15:55:21 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TOTsq-0001PN-Tk
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 15:42:05 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2012 14:42:03 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1350481324.3259.185.camel@phil-desktop>
Mime-Version: 1.0
Subject: [RFC PATCH] autotools: Don't install .la files if the distro doesn't want them
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
X-List-Received-Date: Wed, 17 Oct 2012 13:55:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

It's not obvious that libtool's .la files serve any very useful purpose
on a modern system and they can be positively vexatious under some
circumstances.  Make installation of this stuff conditional on the new
"libtool-garbage" flag in DISTRO_FEATURES and backfill it for existing
distros.

Also, perform at least a perfunctory cleaning of unified build directories
when reconfiguring since many packages don't have the right dependency
rules to cause a recompile when this happens.  Making distclean is not
practical since many packages either don't support it at all, or remove
too much (e.g. polkit blows away its documentation which causes the
subsequent license check to fail).

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/classes/autotools.bbclass |   16 ++++++++++++----
 meta/conf/bitbake.conf         |    2 +-
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index e4e034b..adb2bbf 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -93,10 +93,15 @@ CONFIGURESTAMPFILE = "${WORKDIR}/configure.sstate"
 
 autotools_preconfigure() {
 	if [ -n "${CONFIGURESTAMPFILE}" -a -e "${CONFIGURESTAMPFILE}" ]; then
-		if [ "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" -a "${S}" != "${B}" ]; then
-			echo "Previously configured separate build directory detected, cleaning ${B}"
-			rm -rf ${B}
-			mkdir ${B}
+		if [ "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" ]; then
+			if [ "${S}" != "${B}" ]; then
+				echo "Previously configured separate build directory detected, cleaning ${B}"
+				rm -rf ${B}
+				mkdir ${B}
+			else
+				echo "Previously configured source directory detected, cleaning ${S} (slightly)"
+				oe_runmake clean
+			fi
 		fi
 	fi
 }
@@ -201,6 +206,9 @@ autotools_do_install() {
 	if [ -e "${D}${infodir}/dir" ]; then
 		rm -f ${D}${infodir}/dir
 	fi
+	if ${@base_contains('DISTRO_FEATURES', 'libtool-garbage', 'false', 'true', d)}; then
+		find ${D} -name "*.la" -exec rm \{} \;
+	fi
 }
 
 inherit siteconfig
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1ad6ee6..4ad3722 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -728,7 +728,7 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
-DISTRO_FEATURES_BACKFILL = "pulseaudio update-modules"
+DISTRO_FEATURES_BACKFILL = "pulseaudio update-modules libtool-garbage"
 DISTRO_FEATURES_append = "${@oe.utils.features_backfill("DISTRO_FEATURES",d)}"
 
 MACHINE_FEATURES_BACKFILL = "rtc"
-- 
1.7.10.4





