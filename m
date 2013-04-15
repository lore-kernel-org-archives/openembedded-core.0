Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1URhWn-0007lg-Oq
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 13:25:18 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FB7b62003443; Mon, 15 Apr 2013 12:07:37 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eOwHQ11SAd9z; Mon, 15 Apr 2013 12:07:37 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FB7Y0f003429
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 15 Apr 2013 12:07:35 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1URhFf-0006Ud-PA; Mon, 15 Apr 2013 12:07:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2013 12:07:02 +0100
Message-Id: <1366024028-24911-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1366024028-24911-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1366024028-24911-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH] recipes: Fix ALLOW_EMPTY with no package specified
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
X-List-Received-Date: Mon, 15 Apr 2013 11:25:36 -0000

There are various usages of ALLOW_EMPTY with no packages specified. This
is not recommended syntax, nor is it likely to be supported in the future.
This patch improves the references in OE-Core, either removing them if they're
pointless (e.g. when PACKAGES="") or specifying which package it applies to.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssl/ocf-linux.inc           |    2 +-
 meta/recipes-core/meta/package-index.bb                   |    1 -
 meta/recipes-devtools/installer/adt-installer_1.0.bb      |    2 --
 meta/recipes-extended/psmisc/psmisc.inc                   |    2 +-
 meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb   |    6 +++++-
 meta/recipes-multimedia/gstreamer/gst-plugins-package.inc |    2 --
 6 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/ocf-linux.inc b/meta/recipes-connectivity/openssl/ocf-linux.inc
index dba1f02..4efdc2f 100644
--- a/meta/recipes-connectivity/openssl/ocf-linux.inc
+++ b/meta/recipes-connectivity/openssl/ocf-linux.inc
@@ -20,5 +20,5 @@ do_install() {
     install -m 0644 ${S}/ocf/*.h ${D}${includedir}/crypto/
 }
 
-ALLOW_EMPTY = "1"
+ALLOW_EMPTY_${PN} = "1"
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-core/meta/package-index.bb b/meta/recipes-core/meta/package-index.bb
index 99ac1a8..76bf331 100644
--- a/meta/recipes-core/meta/package-index.bb
+++ b/meta/recipes-core/meta/package-index.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "Rebuild the package index"
 LICENSE = "MIT"
 
 INHIBIT_DEFAULT_DEPS = "1"
-ALLOW_EMPTY = "1"
 PACKAGES = ""
 
 do_fetch[noexec] = "1"
diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index 227e866..0cc3b33 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -26,8 +26,6 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 LICENSE = "MIT"
 
-ALLOW_EMPTY = "1"
-
 PACKAGES = ""
 
 PR = "r11"
diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
index 76af99e..68e0656 100644
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ b/meta/recipes-extended/psmisc/psmisc.inc
@@ -15,7 +15,7 @@ S = "${WORKDIR}/psmisc-${PV}"
 
 inherit autotools gettext
 
-ALLOW_EMPTY = "1"
+ALLOW_EMPTY_${PN} = "1"
 
 PACKAGES =+ "fuser fuser-doc killall killall-doc pstree pstree-doc"
 PACKAGES += "psmisc-extras"
diff --git a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
index 37c70c2..210da37 100644
--- a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
@@ -14,7 +14,11 @@ PACKAGES = "\
     gst-meta-debug \
     gst-meta-video"
 
-ALLOW_EMPTY = "1"
+ALLOW_EMPTY_gst-meta-base = "1"
+ALLOW_EMPTY_gst-meta-x11-base = "1"
+ALLOW_EMPTY_gst-meta-audio = "1"
+ALLOW_EMPTY_gst-meta-debug = "1"
+ALLOW_EMPTY_gst-meta-video = "1"
 
 RDEPENDS_gst-meta-base = "\
     ${@base_contains('DISTRO_FEATURES', 'x11', 'gst-meta-x11-base', '', d)} \
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index f26aca5..3e9ef92 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -24,8 +24,6 @@ python populate_packages_prepend () {
     d.setVar('DESCRIPTION_' + metapkg, pn + ' meta package')
 }
 
-ALLOW_EMPTY = "1"
-
 PACKAGES += "${PN}-apps ${PN}-meta ${PN}-glib"
 FILES_${PN}-apps = "${bindir}"
 
-- 
1.7.10.4



