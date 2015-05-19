Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C2DEA6E26B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 01:13:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4J1DUS4016684
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 18:13:30 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Mon, 18 May 2015 18:13:29 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 May 2015 09:08:13 +0800
Message-ID: <e353bdb2b63f15c84a3b20f210a82d521ffe229f.1431997609.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1431997609.git.kai.kang@windriver.com>
References: <cover.1431997609.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 3/4] alsa-utils: upgrade to 1.0.29
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
X-List-Received-Date: Tue, 19 May 2015 01:13:30 -0000
Content-Type: text/plain

Upgrade alsa-utils from 1.0.28 to 1.0.29.

* remove PR
* rename package alsa-utils-alsaconf to alsa-utils-scripts, and add
  script alsa-info.sh

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...lsa-utils-alsaconf_1.0.28.bb => alsa-utils-scripts_1.0.29.bb} | 8 ++++++--
 .../alsa/{alsa-utils_1.0.28.bb => alsa-utils_1.0.29.bb}          | 9 ++++-----
 2 files changed, 10 insertions(+), 7 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils-alsaconf_1.0.28.bb => alsa-utils-scripts_1.0.29.bb} (49%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.0.28.bb => alsa-utils_1.0.29.bb} (95%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.28.bb b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.0.29.bb
similarity index 49%
rename from meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.28.bb
rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.0.29.bb
index 2d49cc5..a98f9b9 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.28.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.0.29.bb
@@ -1,17 +1,21 @@
 require alsa-utils_${PV}.bb
 
-SUMMARY = "Shell script that creates ALSA configuration files"
+SUMMARY = "Shell scripts that show help info and create ALSA configuration files"
+PROVIDES = "alsa-utils-alsaconf"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/alsa-utils:"
 
 PACKAGES = "${PN}"
 RDEPENDS_${PN} += "bash"
 
-FILES_${PN} = "${sbindir}/alsaconf"
+FILES_${PN} = "${sbindir}/alsaconf \
+               ${sbindir}/alsa-info.sh \
+              "
 
 S = "${WORKDIR}/alsa-utils-${PV}"
 
 do_install() {
 	install -d ${D}${sbindir}
 	install -m 0755 ${B}/alsaconf/alsaconf ${D}${sbindir}/
+	install -m 0755 ${S}/alsa-info/alsa-info.sh ${D}${sbindir}/
 }
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.29.bb
similarity index 95%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.0.29.bb
index 506698e..65cae0b 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.29.bb
@@ -16,8 +16,8 @@ SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://alsa-utils-aplay-interrupt-signal-handling.patch \
           "
 
-SRC_URI[md5sum] = "361552d5b1cacd0a1e7ba09e69990211"
-SRC_URI[sha256sum] = "f3ff4c89b0125a7797b1b13cd094cc92276e655458274967386e812d03642acc"
+SRC_URI[md5sum] = "6b289bf874c4c9a63f4b3973093dd404"
+SRC_URI[sha256sum] = "5160058f3e14483ced5de919dd473f93932059454530a9b7ef97dcabd6833e9b"
 
 # lazy hack. needs proper fixing in gettext.m4, see
 # http://bugs.openembedded.org/show_bug.cgi?id=2348
@@ -25,8 +25,6 @@ SRC_URI[sha256sum] = "f3ff4c89b0125a7797b1b13cd094cc92276e655458274967386e812d03
 #
 EXTRA_OECONF_append_libc-uclibc = " --disable-nls"
 
-PR = "r1"
-
 inherit autotools gettext pkgconfig
 
 # This are all packages that we need to make. Also, the now empty alsa-utils
@@ -86,8 +84,9 @@ do_install() {
 	autotools_do_install
 
 	# We don't ship this here because it requires a dependency on bash.
-	# See alsa-utils-alsaconf_${PV}.bb
+	# See alsa-utils-scripts_${PV}.bb
 	rm ${D}${sbindir}/alsaconf
+	rm ${D}${sbindir}/alsa-info.sh
 
 	if ${@bb.utils.contains('PACKAGECONFIG', 'udev', 'false', 'true', d)}; then
 	   # This is where alsa-utils will install its rules if we don't tell it anything else.
-- 
1.9.1


