Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1FB5F6C73A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 17:30:32 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id q58so4543183wes.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2014 09:30:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Fsv1Bh3T1suaie10h693wQkmp/bRktQe58ao9kkbjeY=;
	b=YWGIRXQHnW/enCRuKyzZHY2u8iU+cXF/cBtJc3uOX9lgFxRAFWH7saub45pw004QJY
	6LDV8zY2GEZCJX/ZAnyiNUp96BKYmIX7tuSJsOtXhfgrYwCVsKMh7j4jJqDuaFQgJPns
	3DcsYWiQ5Ph/+24Y49m4w1uiBUT9vN3Zt8tE9aXMLilSanIXETUABi8MJZ7tuaVXPOqG
	7MW1qT6hqcNIStPKKXBFen0liP6dfdt9NIgTF6hVOtTOyUBY3nz7g14rgkIXRxT+Ai62
	ld+RUucRew8ya3txX3YbpMXr8F28TySalqHV3R7+PUJdmAJqTfyrfe37l3/2wb22hcAc
	Iyjg==
X-Gm-Message-State: ALoCoQnuTZdoj7AM6xpxQft2nBb/3+CvNwH0E5JtSsEf3lcGr5c0ve+QL8QwYOXPHpcglCICHnht
X-Received: by 10.194.216.68 with SMTP id oo4mr1332214wjc.79.1391535033537;
	Tue, 04 Feb 2014 09:30:33 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id 12sm54321112wjm.10.2014.02.04.09.30.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Feb 2014 09:30:32 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Feb 2014 17:30:29 +0000
Message-Id: <1391535029-8403-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] distcc: rename systemd service to distcc
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
X-List-Received-Date: Tue, 04 Feb 2014 17:30:33 -0000

The sysv init script is called distcc, so rename the service to match so that in
hybrid systemd/sysvinit images the service correctly masks the init script.

This prevents such images from failing to start the distccd unit with error code
102, as the ports it wants to bind to are already taken.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/distcc/distcc_3.1.bb                   |   10 +++++-----
 .../distcc/files/{distccd.service => distcc.service}         |    0
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/distcc/files/{distccd.service => distcc.service} (100%)

diff --git a/meta/recipes-devtools/distcc/distcc_3.1.bb b/meta/recipes-devtools/distcc/distcc_3.1.bb
index e3b6cda..c69643c 100644
--- a/meta/recipes-devtools/distcc/distcc_3.1.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.1.bb
@@ -22,7 +22,7 @@ SRC_URI = "http://distcc.googlecode.com/files/${BPN}-${PV}.tar.bz2 \
            file://default \
            file://distccmon-gnome.desktop \
            file://distcc \
-           file://distccd.service"
+           file://distcc.service"
 
 SRC_URI[md5sum] = "a1a9d3853df7133669fffec2a9aab9f3"
 SRC_URI[sha256sum] = "f55dbafd76bed3ce57e1bbcdab1329227808890d90f4c724fcd2d53f934ddd89"
@@ -41,7 +41,7 @@ USERADD_PARAM_${PN} = "--system \
 INITSCRIPT_NAME = "distcc"
 
 SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE_${PN} = "distccd.service"
+SYSTEMD_SERVICE_${PN} = "distcc.service"
 
 do_install_append() {
     install -d ${D}${sysconfdir}/init.d/
@@ -49,8 +49,8 @@ do_install_append() {
     install -m 0755 ${WORKDIR}/distcc ${D}${sysconfdir}/init.d/
     install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/distcc
     install -d ${D}${systemd_unitdir}/system/
-    install -m 0644 ${WORKDIR}/distccd.service ${D}${systemd_unitdir}/system
-    sed -i -e 's,@BINDIR@,${bindir},g' ${D}${systemd_unitdir}/system/distccd.service
+    install -m 0644 ${WORKDIR}/distcc.service ${D}${systemd_unitdir}/system
+    sed -i -e 's,@BINDIR@,${bindir},g' ${D}${systemd_unitdir}/system/distcc.service
     ${DESKTOPINSTALL}
 }
 DESKTOPINSTALL = ""
@@ -65,7 +65,7 @@ FILES_${PN} = " ${sysconfdir} \
     ${bindir}/lsdistcc \
 		${bindir}/distccd \
 		${bindir}/distccmon-text \
-		${systemd_unitdir}/system/distccd.service"
+		${systemd_unitdir}/system/distcc.service"
 FILES_distcc-distmon-gnome = "  ${bindir}/distccmon-gnome \
 				${datadir}/distcc"
 
diff --git a/meta/recipes-devtools/distcc/files/distccd.service b/meta/recipes-devtools/distcc/files/distcc.service
similarity index 100%
rename from meta/recipes-devtools/distcc/files/distccd.service
rename to meta/recipes-devtools/distcc/files/distcc.service
-- 
1.7.10.4


