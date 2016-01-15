Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 19EA0731AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 02:29:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0F2THOA018922
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 18:29:18 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 14 Jan 2016 18:29:17 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jan 2016 18:29:12 -0800
Message-ID: <c957f3915b3385c419e1e8282d1bfafde8567470.1452824908.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1452824908.git.liezhi.yang@windriver.com>
References: <cover.1452824908.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] recipes-multimedia/sato/support: cleanup CONFFILES
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
X-List-Received-Date: Fri, 15 Jan 2016 02:29:17 -0000
Content-Type: text/plain

The ${sysconfdir}/* are CONFFILES by default.

[YOCTO #8436]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    8 --------
 .../pulseaudio-client-conf-sato_1.bb               |    1 -
 .../ca-certificates/ca-certificates_20150426.bb    |    4 ----
 3 files changed, 13 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index ec73526..21853b5 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -124,14 +124,6 @@ FILES_${PN}-misc = "${bindir}/* ${libdir}/pulseaudio/libpulsedsp.so"
 # Allow the pulseaudio package to be created empty as a placeholder (-dbg and -dev depend on it)
 ALLOW_EMPTY_${PN} = "1"
 
-CONFFILES_libpulse = "${sysconfdir}/pulse/client.conf"
-
-CONFFILES_pulseaudio-server = "\ 
-  ${sysconfdir}/pulse/default.pa \
-  ${sysconfdir}/pulse/daemon.conf \
-  ${sysconfdir}/pulse/system.pa \
-  "
-
 pkg_postinst_${PN}-server() {
         if [ -z "$D" ] && [ -e ${sysconfdir}/init.d/populate-volatile.sh ] ; then
             ${sysconfdir}/init.d/populate-volatile.sh update
diff --git a/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb b/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb
index e27339f..2ccda38 100644
--- a/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb
+++ b/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb
@@ -14,4 +14,3 @@ do_install() {
 }
 
 FILES_${PN} = "${sysconfdir}/pulse/client.conf.d/50-sato.conf"
-CONFFILES_${PN} = "${sysconfdir}/pulse/client.conf.d/50-sato.conf"
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20150426.bb b/meta/recipes-support/ca-certificates/ca-certificates_20150426.bb
index 716e3df..aca34a4 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20150426.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20150426.bb
@@ -65,10 +65,6 @@ pkg_postinst_${PN} () {
     SYSROOT="$D" update-ca-certificates
 }
 
-CONFFILES_${PN} += "${sysconfdir}/ca-certificates.conf"
-
-# Postinsts don't seem to be run for nativesdk packages when populating SDKs.
-CONFFILES_${PN}_append_class-nativesdk = " ${sysconfdir}/ssl/certs/ca-certificates.crt"
 do_install_append_class-nativesdk () {
     SYSROOT="${D}${SDKPATHNATIVE}" update-ca-certificates
 }
-- 
1.7.9.5


