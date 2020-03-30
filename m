Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.55178.1585587074608208309
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2020 09:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ITCcYfpA;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: rehsack@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id h15so22527299wrx.9
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2020 09:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=Eo9L6agWzZQsafCTxcxLP2HXxw67IaZbgNysYVNV0l4=;
        b=ITCcYfpAQWLgC05SwR2AWpEhIYjtEyJGlUNMzKc/F+5UCn8HUZj4EmTv/i2Vlz6h9T
         12/c8aQrA2wqAgjyBSXPVfWIRCEWrmSyC69asqki4cIy3FkLnaYf1YBp/LxjI8d4ace6
         d1p84xsMUUTYklaC8xNVzOLv4trjW1A6vAqtvkY5lRjrgnwn/o5+HxwSczu+qLs18cnA
         2O1MLVYJa+LLw1j8XXKR0GVEfqmlEmv6pMYLz0QwAP8cEuBDv1sG4XMwMXWdfawvVJ8k
         S088R5vbHIKRufDV1Vsyop6DSSkQY+lbNLIdhdo3ZOsakDvzzZqAU2GnqyihQeWAAzFE
         00NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=Eo9L6agWzZQsafCTxcxLP2HXxw67IaZbgNysYVNV0l4=;
        b=LHmHsQpSh+OQS7lQWBUsmPb/rK5iQxHaTw7015KnnYw1OBcMhfSiLEsGBukiIIztVy
         ugs9L1C23h5Tkysor56Ooqy8RsvxD294ofAbc+Fgpf1Fy9CP8A+Vg7d1T4WyN4E9S1s6
         gPh5a5nSacOgb76Lr3MykIWXjulFWP21wG+RSk8+1uSOLeJrFshCbUU7DRastiK/1OV3
         8mQRKmsuHNaCIyuvyBoiFFY6vjAHzXGMxtR1nrOxLBcn9bzAMO9v1loW+ENSp/mmnu5r
         xpulSHvnn3p7lHER1vrmznB5bmA1TerP3ShkLqUZQ07fWLMeb+QNAdbubcrOoYMnrEi5
         xBYA==
X-Gm-Message-State: ANhLgQ1cl9nZb+Xrrz9y1wXOv98/QPXWKi2dB5wW0/XUf6mZZXP7vOpE
	TQYcYK9uzgFNBnwmbF1hhkBuYiF0
X-Google-Smtp-Source: ADFU+vsnsUWguez+C4+Zbsl0VaPkQWXNjSPncF63frwakoPulEgQYQipfXbDXZD5Pr5eEAvXscA7xg==
X-Received: by 2002:a5d:604a:: with SMTP id j10mr15456767wrt.126.1585587072476;
        Mon, 30 Mar 2020 09:51:12 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from beaker.muppets.liwing.de (p5B25B65E.dip0.t-ipconnect.de. [91.37.182.94])
        by smtp.gmail.com with ESMTPSA id d21sm23985819wrb.51.2020.03.30.09.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 09:51:11 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: "Jens Rehsack" <rehsack@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [OE-core][PATCH] initscripts/init-system-helpers: fix mountnfs.sh dependency
Date: Mon, 30 Mar 2020 18:51:05 +0200
Message-Id: <20200330165105.7151-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1

With commit c9fc9110be33fe0f24bc3a7c242b584a4ca33e04
    Author: Yue Tao <Yue.Tao@windriver.com>
    Date:   Fri May 25 10:48:08 2018 +0800

	initscripts: Avoid starting rpcbind daemon twice

	Check the status before start it to avoid duplicates.

the use of a script {/usr/sbin/}service is introduced - maybe earlier
provided by systemd, nowadays mostly by init-system-helpers from
debian project.

For the very first shot, maybe discussions and improvements based
on that script collection, use just the init-system-helpers-service
in initscripts/mountnfs.sh to avoid problems mounting NFS in later
boot stage.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../initscripts/init-system-helpers_1.57.bb   | 52 +++++++++++++++++++
 .../initscripts/initscripts_1.0.bb            |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-core/initscripts/init-system-helpers_1.57.bb

diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.57.bb b/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
new file mode 100644
index 0000000000..2b09983483
--- /dev/null
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
@@ -0,0 +1,52 @@
+# Copyright (C) 2020 Jens Rehsack <sno@netbsd.org>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "helper tools for all init systems"
+DESCRIPTION = "This package contains helper tools that are necessary for switching between \
+the various init systems that Debian contains (e. g. sysvinit or \
+systemd). An example is deb-systemd-helper, a script that enables systemd unit \
+files without depending on a running systemd. \
+\
+It also includes the \"service\", \"invoke-rc.d\", and \"update-rc.d\" scripts which \
+provide an abstraction for enabling, disabling, starting, and stopping \
+services for all supported Debian init systems as specified by the policy. \
+\
+While this package is maintained by pkg-systemd-maintainers, it is NOT \
+specific to systemd at all. Maintainers of other init systems are welcome to \
+include their helpers in this package."
+HOMEPAGE = "https://salsa.debian.org/debian/init-system-helpers"
+SECTION = "base"
+LICENSE = "BSD-3-clause & GPLv2"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=ee2b1830fcfead84d07bc060ec43e072"
+
+PACKAGES += "${PN}-invoke-rc.d ${PN}-service ${PN}-update-rc.d"
+
+DEPENDS = "perl"
+
+SRCREV = "760c625ec0e1ffebec2e391d891d389da0f65726"
+SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git"
+
+S = "${WORKDIR}/git"
+
+do_configure() {
+	:
+}
+
+do_compile() {
+	:
+}
+
+do_install() {
+	install -d -m 0755 ${D}${sbindir}
+	install -m 0755 ${S}/script/invoke-rc.d ${D}${sbindir}
+	install -m 0755 ${S}/script/service ${D}${sbindir}
+	install -m 0755 ${S}/script/update-rc.d ${D}${sbindir}
+}
+
+FILES_${PN} = ""
+FILES_${PN}-invoke-rc.d = "${sbindir}/invoke-rc.d"
+FILES_${PN}-service = "${sbindir}/service"
+FILES_${PN}-update-rc.d = "${sbindir}/update-rc.d"
+
+RDEPENDS_${PN}-update-rc.d = "perl"
+RRECOMMENDS_${PN} += "${PN}-invoke-rc.d ${PN}-service ${PN}-update-rc.d"
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 1a59b82fbf..4080c4a495 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -50,6 +50,7 @@ PACKAGE_WRITE_DEPS_append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','
 PACKAGES =+ "${PN}-functions ${PN}-sushell"
 RDEPENDS_${PN} = "initd-functions \
                   ${@bb.utils.contains('DISTRO_FEATURES','selinux','${PN}-sushell','',d)} \
+                  init-system-helpers-service \
 		 "
 # Recommend pn-functions so that it will be a preferred default provider for initd-functions
 RRECOMMENDS_${PN} = "${PN}-functions"
-- 
2.17.1

