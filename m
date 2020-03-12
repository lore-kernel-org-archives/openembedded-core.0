Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 161C8601D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 23:02:26 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 23so4025273pfj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 16:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Cv3J5QC2vVh/U/WSrX86xABrKtOK7aWU966zSCp4XTs=;
	b=jNnn8Z6ma51Oks9f88YTeIKSbXR0AHfVgQu3g3/iC/iLq/z+wVe8Lo5lpo3a8RgufT
	3MWLgdbIIFCvLAQ93PKHXmwgxol1R25wpx6HZ6RKuDzfIKFBf1mgVRNU2X7Epaek1D79
	yDyQfUlyrVd01fcsFLS4gnqi7gDaFsIXXJbRxzHU+4e+UAobsemeGtbiROYH5l00l7oo
	z1Rw0SVN8YayyhKEDbWytqtiKRBrCmD4DSNwclV2YQ+0mGyB6XEKLEo8oDK0OCw/z/Az
	0if/ygpch3768fcvHSrfBpEjUfgrQtTMPp/LQp8jDjlkZH5So0vyBgMiQJKTw/zlh5sf
	Zr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Cv3J5QC2vVh/U/WSrX86xABrKtOK7aWU966zSCp4XTs=;
	b=NAKJTb82btdxE0S9XnCzPrSD9XfNIDxV03ZaXZmA7HtMLpUDV8nUONtVGehImvOC8k
	xWVahEswuKs6+hcApIULLHDQJwFw/Cg52orGOtJoQxf0yscabNWTuoY/sfgj0yI4ggq+
	hATuu3zegfCx0zMohiH+7EFVUC4HQtEbjsbIlX5AyQ92JTdtJjsTtm/zdqOUYvfKY8YB
	1lLh4DP/YwQM+a2389brmVI58e0jckyvhpBIW2/F4cx4j7kr8BfiAyYNfLnhgWsnm+gd
	p4IUS6Z8vVq4FCTZ+i6BRsL45j8dJLdgT51pX+fKgAtVc8BtnlaxQ2wU7AtbeGec2S3b
	PJww==
X-Gm-Message-State: ANhLgQ1lJd1Th7Z0jFAqat2imN1XeoCi4iZzwImPLbweYB86psfJhBsH
	UWF0BmLhHet76i8o4LDDIm1terqwUIA=
X-Google-Smtp-Source: ADFU+vtpJSDWP8cfZADruHT9PfXD70vQnFZOorszLYVEJsN2b7gtazFj9mNln7WClDlgulvpJjJ+RQ==
X-Received: by 2002:a63:5f41:: with SMTP id t62mr9832045pgb.114.1584054146742; 
	Thu, 12 Mar 2020 16:02:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::94a8])
	by smtp.gmail.com with ESMTPSA id
	j12sm39474864pga.78.2020.03.12.16.02.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Mar 2020 16:02:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Mar 2020 16:02:38 -0700
Message-Id: <20200312230238.413509-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200312230238.413509-1-raj.khem@gmail.com>
References: <20200312230238.413509-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH] weston-init: Launch weston with WESTON_DISABLE_ATOMIC on musl/x86
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
X-List-Received-Date: Thu, 12 Mar 2020 23:02:26 -0000
Content-Transfer-Encoding: 8bit

Since we enabled drm/kms backend for qemux86, it does not work with musl
fdbdev worked ok, we see this error

[18:58:45.628] launching '/usr/libexec/weston-desktop-shell'
[18:58:45.737] atomic: couldn't commit new state: Invalid argument
[18:58:45.737] repaint-flush failed: Invalid argument

There seems to be some problem with atomics in libdrm, until that gets
diagnosed, simple solution is to not use it on musl when drm backend is used
thats why WESTON_DISABLE_ATOMIC=Y is set in environment file for such
cases

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/wayland/weston-init.bb       | 14 ++++++++++++--
 .../wayland/weston-init/weston.env                 |  0
 2 files changed, 12 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston-init/weston.env

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index e3e739e2b7..40aa76295f 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI = "file://init \
+           file://weston.env \
            file://weston.ini \
            file://weston@.service \
            file://71-weston-drm.rules \
@@ -15,6 +16,7 @@ S = "${WORKDIR}"
 do_install() {
 	install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
 	install -D -p -m0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
+	install -Dm644 ${WORKDIR}/weston.env ${D}${sysconfdir}/default/weston
 
 	# Install Weston systemd service and accompanying udev rule
 	install -D -p -m0644 ${WORKDIR}/weston@.service ${D}${systemd_system_unitdir}/weston@.service
@@ -30,6 +32,14 @@ do_install() {
 	sed -i 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${bindir}/weston-start
 }
 
+do_install_append_libc-musl_qemux86() {
+        echo "WESTON_DISABLE_ATOMIC=Y" >> ${D}${sysconfdir}/default/weston
+}
+
+do_install_append_libc-musl_qemux86-64() {
+        echo "WESTON_DISABLE_ATOMIC=Y" >> ${D}${sysconfdir}/default/weston
+}
+
 inherit update-rc.d features_check systemd
 
 # rdepends on weston which depends on virtual/egl
@@ -40,9 +50,9 @@ RDEPENDS_${PN} = "weston kbd"
 INITSCRIPT_NAME = "weston"
 INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
 
-FILES_${PN} += "${sysconfdir}/xdg/weston/weston.ini ${systemd_system_unitdir}/weston@.service"
+FILES_${PN} += "${sysconfdir}/xdg/weston/weston.ini ${systemd_system_unitdir}/weston@.service ${sysconfdir}/default/weston"
 
-CONFFILES_${PN} += "${sysconfdir}/xdg/weston/weston.ini"
+CONFFILES_${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/default/weston"
 
 SYSTEMD_SERVICE_${PN} = "weston@%i.service"
 SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta/recipes-graphics/wayland/weston-init/weston.env b/meta/recipes-graphics/wayland/weston-init/weston.env
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.25.1


