Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0EA32731AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 03:22:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0D3MunW021199
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 19:22:56 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.246) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 12 Jan 2016 19:22:56 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jan 2016 11:23:06 +0800
Message-ID: <35fd9829f35bd0486288037c7f0a3cf5ada85948.1452655299.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452655299.git.Qi.Chen@windriver.com>
References: <cover.1452655299.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] cups: upgrade to 2.1.2
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
X-List-Received-Date: Wed, 13 Jan 2016 03:22:58 -0000
Content-Type: text/plain

Add PACKAGECONFIG for systemd. And install our own systemd unit files.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/cups/cups.inc                    | 18 ++++++++++++------
 .../cups/{cups_2.0.4.bb => cups_2.1.2.bb}              |  4 ++--
 2 files changed, 14 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.0.4.bb => cups_2.1.2.bb} (40%)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 5aa365d..c013205 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -27,7 +27,9 @@ GROUPADD_PARAM_${PN} = "--system lpadmin"
 SYSTEMD_SERVICE_${PN} = "cups.socket cups.path cups.service"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+PACKAGECONFIG[systemd] = "--enable-systemd --with-systemd=${systemd_unitdir}/system/,--disable-systemd,systemd"
 PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
 PACKAGECONFIG[pam] = "--enable-pam, --disable-pam, libpam"
@@ -80,11 +82,15 @@ do_install () {
 	fi
 
 	# Install systemd unit files
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/cups.socket ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/cups.path ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/cups.service ${D}${systemd_unitdir}/system
-	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/cups.service
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+	    # Use our own unit files
+	    [ -d ${D}${systemd_unitdir}/system ] && rm -rf ${D}${systemd_unitdir}/system
+	    install -d ${D}${systemd_unitdir}/system
+	    install -m 0644 ${WORKDIR}/cups.socket ${D}${systemd_unitdir}/system
+	    install -m 0644 ${WORKDIR}/cups.path ${D}${systemd_unitdir}/system
+	    install -m 0644 ${WORKDIR}/cups.service ${D}${systemd_unitdir}/system
+	    sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/cups.service
+	fi
 }
 
 python do_package_append() {
diff --git a/meta/recipes-extended/cups/cups_2.0.4.bb b/meta/recipes-extended/cups/cups_2.1.2.bb
similarity index 40%
rename from meta/recipes-extended/cups/cups_2.0.4.bb
rename to meta/recipes-extended/cups/cups_2.1.2.bb
index bad73b3..0c1e75d 100644
--- a/meta/recipes-extended/cups/cups_2.0.4.bb
+++ b/meta/recipes-extended/cups/cups_2.1.2.bb
@@ -2,5 +2,5 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6c5a350596fba02754bd96eb6df3afd0"
 
-SRC_URI[md5sum] = "f5c847d9a4fac6c4c66fb0526a7afaae"
-SRC_URI[sha256sum] = "e1d5e68d9f24faca317aeaebc164c34102813bc0f1d69c00b3a59b49c49f4abd"
+SRC_URI[md5sum] = "b3ba0ca676d56857bbd9b182ef4b14b3"
+SRC_URI[sha256sum] = "bab0ca3ba80eae48319b3a6b19a5b14fad5ce230f30151a0cfa4c0271df281ad"
-- 
1.9.1


