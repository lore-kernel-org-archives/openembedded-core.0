Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 64EC16FD24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 May 2014 04:03:18 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id g10so1578566pdj.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 21:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=m06sHhYxRJWZ4TyU6pnkQcZjVqmKPsRSlKElR0gmRpU=;
	b=i5089ba83pj48k0RYEINguVHMZPMLEjHhfT7CUzBMRhgyIlzNJ1RsIqUBI8/midB2N
	d2Q1gddPpj6OwCxSKMXBnbgSlOMWz7s/uZIUrxIOz/tuiy7AhW/kuZGfQnbGnNuwqDVl
	QhmK6bT6Rrxj5ZZt9jkJPVaZv0KTa+sV6C+3JSx0lECLLUARRxZbVVp97JVJFXbZqZZU
	k3ACMsEGOpLiA3+YvgDVZwICktxMaeJsfoqtzl9BBuleIubOCGjCuTM2Vk15IyINMwdn
	Cv3oYBdPc+ctzAT8DrJD8zTTVJimD6PIXtalUvusJdrWdY/R41SBt1TXOC6/MQHAzEUI
	YEEQ==
X-Gm-Message-State: ALoCoQlFfTaiTwRfhGrRKCg0D4qGhFzVeZyNoFyA5OQ9jICdTtz8grwbaqzeQK1EQjJufl+6do/d
X-Received: by 10.68.136.226 with SMTP id qd2mr23872334pbb.72.1401508999809;
	Fri, 30 May 2014 21:03:19 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55])
	by mx.google.com with ESMTPSA id og3sm8905425pbc.48.2014.05.30.21.03.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 May 2014 21:03:19 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 May 2014 21:03:15 -0700
Message-Id: <1401508996-21323-2-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1401508996-21323-1-git-send-email-akuster@mvista.com>
References: <1401508996-21323-1-git-send-email-akuster@mvista.com>
Subject: [PATCH 1/2] Update tzcode to 2014d for zic fix
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
X-List-Received-Date: Sat, 31 May 2014 04:03:27 -0000

Changes affecting code

    zic no longer generates files containing time stamps well before
    the Big Bang.
    This works around GNOME bug 730332
    <https://bugzilla.gnome.org/show_bug.cgi?id=730332>.
    (Thanks to Leonardo Chiquitto for reporting the bug, and to
    Arthur David Olson and James Cloos for suggesting improvements to
    the fix.)

Changes affecting documentation

    tz-link.htm now mentions GNOME.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-extended/tzcode/tzcode-native.inc     | 15 +++++++++++++
 .../recipes-extended/tzcode/tzcode-native_2014c.bb | 25 ----------------------
 .../recipes-extended/tzcode/tzcode-native_2014d.bb | 11 ++++++++++
 3 files changed, 26 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native.inc
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014c.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2014d.bb

diff --git a/meta/recipes-extended/tzcode/tzcode-native.inc b/meta/recipes-extended/tzcode/tzcode-native.inc
new file mode 100644
index 0000000..f034333
--- /dev/null
+++ b/meta/recipes-extended/tzcode/tzcode-native.inc
@@ -0,0 +1,15 @@
+DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
+LICENSE = "PD & BSD"
+
+LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=0b7570113550eb5d30aa4bd220964b8f"
+
+S = "${WORKDIR}"
+
+inherit native
+
+do_install () {
+        install -d ${D}${bindir}/
+        install -m 755 zic ${D}${bindir}/
+        install -m 755 zdump ${D}${bindir}/
+        install -m 755 tzselect ${D}${bindir}/
+}
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2014c.bb b/meta/recipes-extended/tzcode/tzcode-native_2014c.bb
deleted file mode 100644
index 65a31ae..0000000
--- a/meta/recipes-extended/tzcode/tzcode-native_2014c.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
-LICENSE = "PD & BSD"
-
-LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=0b7570113550eb5d30aa4bd220964b8f"
-
-# note that we allow for us to use data later than our code version
-#
-SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2014c.tar.gz;name=tzdata"
-
-SRC_URI[tzcode.md5sum] = "657636f201ae8b561225afde49d274af"
-SRC_URI[tzcode.sha256sum] = "1461e6f6973797ccf516421b272a28082fe26754e8ae94967d8f931a4c8f011b"
-SRC_URI[tzdata.md5sum] = "fa7f3dc1c6f6238253a6f2b850467e2e"
-SRC_URI[tzdata.sha256sum] = "aa2924e012644de3a6cc3160ffff690cb3afecf350af435daefa43bb669fb8f1"
-
-S = "${WORKDIR}"
-
-inherit native
-
-do_install () {
-        install -d ${D}${bindir}/
-        install -m 755 zic ${D}${bindir}/
-        install -m 755 zdump ${D}${bindir}/
-        install -m 755 tzselect ${D}${bindir}/
-}
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2014d.bb b/meta/recipes-extended/tzcode/tzcode-native_2014d.bb
new file mode 100644
index 0000000..8d20158
--- /dev/null
+++ b/meta/recipes-extended/tzcode/tzcode-native_2014d.bb
@@ -0,0 +1,11 @@
+# note that we allow for us to use data later than our code version
+#
+SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
+           ftp://ftp.iana.org/tz/releases/tzdata2014d.tar.gz;name=tzdata"
+
+SRC_URI[tzcode.md5sum] = "4a0f5f259ba8a2b826fffb1fa26d0134"
+SRC_URI[tzcode.sha256sum] = "e9c775bb76c9700521ada77776277c25f8650a22b56d46c9f00f4147970ef13e"
+SRC_URI[tzdata.md5sum] = "299b86c0368ecfb321f15d5c408a1d9b"
+SRC_URI[tzdata.sha256sum] = "4b4966912f5d4a299b0bdf47e6f3103d82dc6a0b5a6b321e2b9d5662597a62f0"
+
+require tzcode-native.inc
-- 
1.9.1


