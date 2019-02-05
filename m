Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 085AA6B507
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 15:47:26 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q1so1643587pfi.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2019 07:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=I/DYITkwCZaB3V7CQspM1efeqBt15QkzIKW7dYtRzp8=;
	b=Lhrxi/YP/X/QVDERH4q8FEhmVkeSS583K7IoMOJvSDDo6pbgWlS1Xlpqr4d/yCIDJw
	JsGgmspTb+Fhg5P2S79cylxiVT8XvWQP88zlhURgW+kYSuCusgn/EZYG/9SZnBffAdsY
	dtqqOmGusWrvTN6LYHNgZ6fGmP60pSwNz+IpFHhpkP9QsyIIW8QMrtolHOW2c/1WaYGJ
	nc5Cl3i/33j6chERHPkvgCteaIbQIbTqSzbh8lbYnNiMasA5OLr/i9SrmhYHKwx5hu/C
	Ecix8PikuySk/hnhlhBe5aOSZIYNcdvlzaXBpCOCIGY9HqqcShe/JqamPj1UrCJbUDBp
	LArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=I/DYITkwCZaB3V7CQspM1efeqBt15QkzIKW7dYtRzp8=;
	b=eJVBjAXwrANrqQTbZ9x83RSndLRnI7uxEM1h6xd49ItoinBmXgc0Wv9T2uy7t/GZDi
	mV6VMbAow0/Am/KIc8CamCfpb5u5QYuvxvZZxfnIE+FmMihX/iwfI49Vqn9XYp4ZTsAq
	scTt8N081VW211OZz4jiqtzHPzGilXRgu9xosdfYkh9RN+RH4+kGKJNzkvfPxgJ+nMLJ
	ehTLr5Cqm4RmPkrimkSm45CDpS9wA8qluYe5RNF2cJtp4rkSaVDjJcGDl+QjWi7OUOmP
	kYaILoDPNhFcQApAs17RBleVvgC6AnNb1/ZPMuAQp7cIJMIV9Tins2D4UP96FQQQRDIb
	VJLw==
X-Gm-Message-State: AHQUAubH5idwzKj8d+xPUGNfl/62cklrrwaL0WpaUGr0MhSaGbt+Dwvx
	iYfEZi0CyrZ12OLf6lUYTwy485ZPObc=
X-Google-Smtp-Source: AHgI3IZA4QQhNnKi1P0uv+h/DN8HhcuZlPPHX6D4SyD1g4JByMBKlXb1tQfYQq8dhFGhpdRG/LtMGg==
X-Received: by 2002:a63:d904:: with SMTP id r4mr5118306pgg.207.1549381647838; 
	Tue, 05 Feb 2019 07:47:27 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:a556:75ec:241a:9733])
	by smtp.gmail.com with ESMTPSA id z7sm4474898pga.6.2019.02.05.07.47.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Feb 2019 07:47:27 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2019 07:47:26 -0800
Message-Id: <1549381646-8147-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [V3][PATCH] timezone: refactor to simplify maint
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
X-List-Received-Date: Tue, 05 Feb 2019 15:47:27 -0000

move tzcode and tzdata-native into new dir

Updates are now limited to the common include file.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../timezone.inc}                                   | 21 +++++----------------
 meta/recipes-extended/timezone/tzcode-native.bb     | 17 +++++++++++++++++
 .../{tzdata/tzdata_2018i.bb => timezone/tzdata.bb}  | 12 +-----------
 3 files changed, 23 insertions(+), 27 deletions(-)
 rename meta/recipes-extended/{tzcode/tzcode-native_2018i.bb => timezone/timezone.inc} (63%)
 create mode 100644 meta/recipes-extended/timezone/tzcode-native.bb
 rename meta/recipes-extended/{tzdata/tzdata_2018i.bb => timezone/tzdata.bb} (94%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2018i.bb b/meta/recipes-extended/timezone/timezone.inc
similarity index 63%
rename from meta/recipes-extended/tzcode/tzcode-native_2018i.bb
rename to meta/recipes-extended/timezone/timezone.inc
index f056370..696f02d 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2018i.bb
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -1,10 +1,11 @@
-# note that we allow for us to use data later than our code version
-#
-SUMMARY = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
+SUMMARY = "Timezone data"
+HOMEPAGE = "http://www.iana.org/time-zones"
+SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
-
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
+PV = "2018i"
+
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
            "
@@ -16,15 +17,3 @@ SRC_URI[tzcode.sha256sum] = "aaacdb876ca6fb9d58e244b462cbc7578a496b1b10994381b4b
 SRC_URI[tzdata.md5sum] = "b3f0a1a789480a036e58466cd0702477"
 SRC_URI[tzdata.sha256sum] = "82c45ef84ca3bc01d0a4a397ba8adeb8f7f199c6550740587c6ac5a7108c00d9"
 
-S = "${WORKDIR}"
-
-inherit native
-
-EXTRA_OEMAKE += "cc='${CC}'"
-
-do_install () {
-        install -d ${D}${bindir}/
-        install -m 755 zic ${D}${bindir}/
-        install -m 755 zdump ${D}${bindir}/
-        install -m 755 tzselect ${D}${bindir}/
-}
diff --git a/meta/recipes-extended/timezone/tzcode-native.bb b/meta/recipes-extended/timezone/tzcode-native.bb
new file mode 100644
index 0000000..e3582ba
--- /dev/null
+++ b/meta/recipes-extended/timezone/tzcode-native.bb
@@ -0,0 +1,17 @@
+require timezone.inc
+
+#
+SUMMARY = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
+
+S = "${WORKDIR}"
+
+inherit native
+
+EXTRA_OEMAKE += "cc='${CC}'"
+
+do_install () {
+        install -d ${D}${bindir}/
+        install -m 755 zic ${D}${bindir}/
+        install -m 755 zdump ${D}${bindir}/
+        install -m 755 tzselect ${D}${bindir}/
+}
diff --git a/meta/recipes-extended/tzdata/tzdata_2018i.bb b/meta/recipes-extended/timezone/tzdata.bb
similarity index 94%
rename from meta/recipes-extended/tzdata/tzdata_2018i.bb
rename to meta/recipes-extended/timezone/tzdata.bb
index 4482e89..7542ce5 100644
--- a/meta/recipes-extended/tzdata/tzdata_2018i.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -1,17 +1,7 @@
-SUMMARY = "Timezone data"
-HOMEPAGE = "http://www.iana.org/time-zones"
-SECTION = "base"
-LICENSE = "PD & BSD & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
+require timezone.inc
 
 DEPENDS = "tzcode-native"
 
-SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
-UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
-
-SRC_URI[tzdata.md5sum] = "b3f0a1a789480a036e58466cd0702477"
-SRC_URI[tzdata.sha256sum] = "82c45ef84ca3bc01d0a4a397ba8adeb8f7f199c6550740587c6ac5a7108c00d9"
-
 inherit allarch
 
 RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarctica \
-- 
2.7.4


