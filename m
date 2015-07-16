Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id E5452607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 23:40:45 +0000 (UTC)
Received: by wgav7 with SMTP id v7so4439637wga.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 16:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6ScMpOnKZmoO0miqqX/tHmoOt1mIJ2OyHmNQ39eKExM=;
	b=cFSz44S1R61K09pVdm72GhiD8ah1TL2AUh/dIicIuvXO7tzon3MuyhHEbs/zJFv59U
	+ShpUPz5+erIXnV6PinFjVPNa4B3JpGOKJYwNxIYPckRwSbwWzv+8X/+19BtMizZwJcX
	ThmNzK1m7N5oTHIHUKAYoJf66FcA2HpjfUuYb1+3OwSBCK731s6xl0wdLgsopAtNEtLC
	dpJsJDPnwLPcLFmriJGxw9vYG7vAcSaJtpQs5FrR7IlsvpHqfzarOSj/ATWjZV06Z6A0
	K0Aa5WxzpjiPbyE2UV/vrYDTtPc21Vw488zve5G+TYJi56ddPd2s9tn3w6cM3FbJDAGN
	p6tw==
X-Gm-Message-State: ALoCoQn+Ygcni3hCc75xXV52Wdc0nLRHvKxGrtywCXv/4QddEDiZrUVpivPs406y3vtLIxhKLcCU
X-Received: by 10.194.83.196 with SMTP id s4mr23869537wjy.43.1437090045274;
	Thu, 16 Jul 2015 16:40:45 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	lu5sm15494930wjb.9.2015.07.16.16.40.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Jul 2015 16:40:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jul 2015 00:35:02 +0100
Message-Id: <1437089702-23970-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1437089702-23970-1-git-send-email-ross.burton@intel.com>
References: <1437089702-23970-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] neard: merge .inc file
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
X-List-Received-Date: Thu, 16 Jul 2015 23:40:47 -0000

The .inc file contains so much version-dependent logic (for example behaviour of
libexecdir and location of installed daemon) that there's not really any point
in having the two split.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/neard/neard.inc     | 53 ---------------------------
 meta/recipes-connectivity/neard/neard_0.15.bb | 53 ++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-connectivity/neard/neard.inc

diff --git a/meta/recipes-connectivity/neard/neard.inc b/meta/recipes-connectivity/neard/neard.inc
deleted file mode 100644
index 6ab185c..0000000
--- a/meta/recipes-connectivity/neard/neard.inc
+++ /dev/null
@@ -1,53 +0,0 @@
-SUMMARY = "Linux NFC daemon"
-DESCRIPTION = "A daemon for the Linux Near Field Communication stack"
-HOMEPAGE = "http://01.org/linux-nfc"
-LICENSE = "GPLv2"
-
-DEPENDS = "dbus glib-2.0 libnl"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
- file://src/near.h;beginline=1;endline=20;md5=358e4deefef251a4761e1ffacc965d13 \
- "
-
-inherit autotools pkgconfig systemd update-rc.d bluetooth
-
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
-
-PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_unitdir}/system/ --with-systemduserunitdir=${systemd_unitdir}/user/,--disable-systemd"
-
-EXTRA_OECONF += "--enable-tools"
-
-# This would copy neard start-stop shell and test scripts
-do_install_append() {
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-		install -d ${D}${sysconfdir}/init.d/
-		sed "s:@installpath@:${libexecdir}/nfc:" ${WORKDIR}/neard.in \
-		  > ${D}${sysconfdir}/init.d/neard
-		chmod 0755 ${D}${sysconfdir}/init.d/neard
-	fi
-
-	# Install the tests for neard-tests
-	install -d ${D}${libdir}/neard
-	install -m 0755 ${S}/test/* ${D}${libdir}/${BPN}/
-	install -m 0755 ${B}/tools/nfctool/nfctool ${D}${libdir}/${BPN}/
-}
-
-PACKAGES =+ "${PN}-tests"
-
-FILES_${PN}-tests = "${libdir}/${BPN}/*-test"
-FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
-
-RDEPENDS_${PN} = "dbus python python-dbus python-pygobject"
-
-# Bluez & Wifi are not mandatory except for handover
-RRECOMMENDS_${PN} = "\
-                     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
-                     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
-                    "
-
-RDEPENDS_${PN}-tests = "python python-dbus python-pygobject"
-
-INITSCRIPT_NAME = "neard"
-INITSCRIPT_PARAMS = "defaults 64"
-
-SYSTEMD_SERVICE_${PN} = "neard.service"
diff --git a/meta/recipes-connectivity/neard/neard_0.15.bb b/meta/recipes-connectivity/neard/neard_0.15.bb
index 508c622..8adf70c 100644
--- a/meta/recipes-connectivity/neard/neard_0.15.bb
+++ b/meta/recipes-connectivity/neard/neard_0.15.bb
@@ -1,4 +1,9 @@
-require neard.inc
+SUMMARY = "Linux NFC daemon"
+DESCRIPTION = "A daemon for the Linux Near Field Communication stack"
+HOMEPAGE = "http://01.org/linux-nfc"
+LICENSE = "GPLv2"
+
+DEPENDS = "dbus glib-2.0 libnl"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/nfc/${BP}.tar.xz \
            file://neard.in \
@@ -8,3 +13,49 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/nfc/${BP}.tar.xz \
 SRC_URI[md5sum] = "b746ce62eeef88e8de90765e00a75a1c"
 SRC_URI[sha256sum] = "651f6513d32cdaf8a426255d03aff38a6620a89b0567ec2b36606c6330a93353"
 
+LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
+ file://src/near.h;beginline=1;endline=20;md5=358e4deefef251a4761e1ffacc965d13 \
+ "
+
+inherit autotools pkgconfig systemd update-rc.d bluetooth
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+
+PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_unitdir}/system/ --with-systemduserunitdir=${systemd_unitdir}/user/,--disable-systemd"
+
+EXTRA_OECONF += "--enable-tools"
+
+# This would copy neard start-stop shell and test scripts
+do_install_append() {
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/init.d/
+		sed "s:@installpath@:${libexecdir}/nfc:" ${WORKDIR}/neard.in \
+		  > ${D}${sysconfdir}/init.d/neard
+		chmod 0755 ${D}${sysconfdir}/init.d/neard
+	fi
+
+	# Install the tests for neard-tests
+	install -d ${D}${libdir}/neard
+	install -m 0755 ${S}/test/* ${D}${libdir}/${BPN}/
+	install -m 0755 ${B}/tools/nfctool/nfctool ${D}${libdir}/${BPN}/
+}
+
+PACKAGES =+ "${PN}-tests"
+
+FILES_${PN}-tests = "${libdir}/${BPN}/*-test"
+FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
+
+RDEPENDS_${PN} = "dbus python python-dbus python-pygobject"
+
+# Bluez & Wifi are not mandatory except for handover
+RRECOMMENDS_${PN} = "\
+                     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
+                     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
+                    "
+
+RDEPENDS_${PN}-tests = "python python-dbus python-pygobject"
+
+INITSCRIPT_NAME = "neard"
+INITSCRIPT_PARAMS = "defaults 64"
+
+SYSTEMD_SERVICE_${PN} = "neard.service"
-- 
2.1.4


