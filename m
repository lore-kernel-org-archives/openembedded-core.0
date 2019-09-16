Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 083C07F961
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 22:35:13 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id i1so794148pfa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 15:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yLMdDjU54C6CZpwcZhtJRKdY3qW47+yO2QmDNrFWOJA=;
	b=e9mzo8wCa4WTUBTEyqn8wqFYb9WRvBPkV3ZR8CCbjAhSIomTQamy99fzoeggZNPuEI
	DRxarihCpXSLn19bc5jHPaSVh8eb/sTB4iQDxdFGvSbx3d0CkYclD5fi3Av+mqTyYG4K
	6uacu7Yzg6F9vROcfKubftR8hwaMgh5H3xpnmGG4pf6v2cQOEBvmNq/klK7adnO0Bwvw
	uHQJb1soPJmnspQ1OOh1Y6qhf1v62RGDF9rEbrYFBdy8XhXqwg69zUE/0oEa03cPzNxB
	cYAt3rwOKgGwSK7uXa8DAarLsS0yP0+EJ5iVyA+3JJEN3L5xHGO42st9Bqj/6LNwgtqa
	ZAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yLMdDjU54C6CZpwcZhtJRKdY3qW47+yO2QmDNrFWOJA=;
	b=lwkyKirjvvHNQGOPYdmUcbY9Ct9gQqY1mhf2PH1Aa30zVFFU8wMorwvhNL9nO+e/NT
	id6Yq7K2yBW2Q1ITcQJZY+4hCHv26WzTT4v9fFGd39AGjXrx7OtScpZtir7FNWvI8oog
	lQw3JHWyWFk8rkEc4Oijj79Zg7TapVReYPbDKppiKJAQzuHEV8SMA7lmih5CP27VvR5K
	fNZ2cJBzVGkRsjBQsie/nO6SwGKVTel6S6dKYJNRzCoPHQVNh67XKLf3j6TN8K+zn0if
	Vr7yUouz87KdoxuYXl98lBPZjoM9pi0ale/R3fVSa7piZ+4rwOFORB6/ujrU8RzOihnq
	DQTA==
X-Gm-Message-State: APjAAAWPlt/eGU8mcRz4yeTtz3S8z3VFCbw8NaVAyVJkfyZjpFtF7HiT
	Mx6qUgCjwgQEx0YpZY2+Ph9FOD0GUk0=
X-Google-Smtp-Source: APXvYqzcBN56dSv4DJ0NwTquW8be1PE/8+XjQFM+XcF153opyDdo0DM3EMvrzLUYijyUZbOyF8rAhQ==
X-Received: by 2002:a17:90a:fb85:: with SMTP id
	cp5mr1691146pjb.42.1568673314138; 
	Mon, 16 Sep 2019 15:35:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	q204sm112359pfc.11.2019.09.16.15.35.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Sep 2019 15:35:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2019 15:35:02 -0700
Message-Id: <20190916223502.2966661-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH V5] weston-init: Add possibility to run weston as non-root user
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
X-List-Received-Date: Mon, 16 Sep 2019 22:35:14 -0000
Content-Transfer-Encoding: 8bit

These changes are from meta-96boards primarily
Launch the session via a udev rule based on what kind of display device
is available

delete weston-conf and move the fuctionality into weston-init other
layers are doing same

weston-init installs machine specific weston.ini therefore mark is
machine specific now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
v2: Drop duplicate isntall rule and use systemd_system_unitdir
v3: Use systemd_system_unitdir in FILES section too
v4: Move weston-conf logic into weston-init and delete it
v5: Mark machine specific

 meta/conf/distro/include/maintainers.inc      |  1 -
 meta/recipes-graphics/wayland/weston-conf.bb  | 35 ---------
 meta/recipes-graphics/wayland/weston-init.bb  | 28 +++++--
 .../wayland/weston-init/71-weston-drm.rules   |  2 +
 .../wayland/weston-init/qemux86-64/weston.ini |  2 +
 .../wayland/weston-init/qemux86/weston.ini    |  2 +
 .../wayland/weston-init/weston.ini            | 74 +++++++++++++++++++
 .../wayland/weston-init/weston.service        | 13 ----
 .../wayland/weston-init/weston@.service       | 37 ++++++++++
 meta/recipes-graphics/wayland/weston_7.0.0.bb |  2 +-
 10 files changed, 141 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston-conf.bb
 create mode 100644 meta/recipes-graphics/wayland/weston-init/71-weston-drm.rules
 create mode 100644 meta/recipes-graphics/wayland/weston-init/qemux86-64/weston.ini
 create mode 100644 meta/recipes-graphics/wayland/weston-init/qemux86/weston.ini
 create mode 100644 meta/recipes-graphics/wayland/weston-init/weston.ini
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.service
 create mode 100644 meta/recipes-graphics/wayland/weston-init/weston@.service

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5f21f98b2b..ab0c6c5541 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -718,7 +718,6 @@ RECIPE_MAINTAINER_pn-wayland = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-wayland-protocols = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-webkitgtk = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-weston = "Denys Dmytriyenko <denys@ti.com>"
-RECIPE_MAINTAINER_pn-weston-conf = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-weston-init = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-wget = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-which = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-graphics/wayland/weston-conf.bb b/meta/recipes-graphics/wayland/weston-conf.bb
deleted file mode 100644
index f52200c46a..0000000000
--- a/meta/recipes-graphics/wayland/weston-conf.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "Weston, a Wayland compositor, configuration files"
-HOMEPAGE = "http://wayland.freedesktop.org"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-CONFFILES_${PN} = "${sysconfdir}/xdg/weston/weston.ini"
-
-FILES_${PN} = "${sysconfdir}/xdg/weston/weston.ini"
-
-PACKAGES = "${PN}"
-
-do_configure[noexec] = '1'
-do_compile[noexec] = '1'
-
-do_install() {
-	:
-}
-
-do_install_qemux86() {
-	mkdir -p ${D}/${sysconfdir}/xdg/weston
-	cat << EOF > ${D}/${sysconfdir}/xdg/weston/weston.ini
-[core]
-backend=fbdev-backend.so
-EOF
-}
-
-do_install_qemux86-64() {
-	mkdir -p ${D}/${sysconfdir}/xdg/weston
-	cat << EOF > ${D}/${sysconfdir}/xdg/weston/weston.ini
-[core]
-backend=fbdev-backend.so
-EOF
-}
diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 22ba5f3fb3..8b6689717c 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -2,23 +2,35 @@ SUMMARY = "Startup script and systemd unit file for the Weston Wayland composito
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 SRC_URI = "file://init \
-           file://weston.service \
+           file://weston.ini \
+           file://weston@.service \
+           file://71-weston-drm.rules \
            file://weston-start"
 
 S = "${WORKDIR}"
 
 do_install() {
 	install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
-	install -Dm0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
-
+	install -D -p -m0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
+
+	# Install Weston systemd service and accompanying udev rule
+	install -D -p -m0644 ${WORKDIR}/weston@.service ${D}${systemd_system_unitdir}/weston@.service
+	sed -i -e s:/etc:${sysconfdir}:g \
+		-e s:/usr/bin:${bindir}:g \
+		-e s:/var:${localstatedir}:g \
+		${D}${systemd_unitdir}/system/weston@.service
+	install -D -p -m0644 ${WORKDIR}/71-weston-drm.rules \
+		${D}${sysconfdir}/udev/rules.d/71-weston-drm.rules
 	# Install weston-start script
 	install -Dm755 ${WORKDIR}/weston-start ${D}${bindir}/weston-start
 	sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-start
 	sed -i 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${bindir}/weston-start
 }
 
-inherit allarch update-rc.d distro_features_check systemd
+inherit update-rc.d distro_features_check systemd
 
 # rdepends on weston which depends on virtual/egl
 REQUIRED_DISTRO_FEATURES = "opengl"
@@ -28,4 +40,10 @@ RDEPENDS_${PN} = "weston kbd"
 INITSCRIPT_NAME = "weston"
 INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
 
-SYSTEMD_SERVICE_${PN} = "weston.service"
+FILES_${PN} += "${sysconfdir}/xdg/weston/weston.ini ${systemd_system_unitdir}/weston@.service"
+
+CONFFILES_${PN} += "${sysconfdir}/xdg/weston/weston.ini"
+
+SYSTEMD_SERVICE_${PN} = "weston@%i.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
diff --git a/meta/recipes-graphics/wayland/weston-init/71-weston-drm.rules b/meta/recipes-graphics/wayland/weston-init/71-weston-drm.rules
new file mode 100644
index 0000000000..1a1b8bbda4
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston-init/71-weston-drm.rules
@@ -0,0 +1,2 @@
+ACTION=="add", SUBSYSTEM=="graphics", KERNEL=="fb0", TAG+="systemd", ENV{SYSTEMD_WANTS}+="weston@root.service"
+ACTION=="add", SUBSYSTEM=="drm", KERNEL=="card0", TAG+="systemd", ENV{SYSTEMD_WANTS}+="weston@root.service"
diff --git a/meta/recipes-graphics/wayland/weston-init/qemux86-64/weston.ini b/meta/recipes-graphics/wayland/weston-init/qemux86-64/weston.ini
new file mode 100644
index 0000000000..17ebd7fdab
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston-init/qemux86-64/weston.ini
@@ -0,0 +1,2 @@
+[core]
+backend=fbdev-backend.so
diff --git a/meta/recipes-graphics/wayland/weston-init/qemux86/weston.ini b/meta/recipes-graphics/wayland/weston-init/qemux86/weston.ini
new file mode 100644
index 0000000000..17ebd7fdab
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston-init/qemux86/weston.ini
@@ -0,0 +1,2 @@
+[core]
+backend=fbdev-backend.so
diff --git a/meta/recipes-graphics/wayland/weston-init/weston.ini b/meta/recipes-graphics/wayland/weston-init/weston.ini
new file mode 100644
index 0000000000..1eecf48bc1
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston-init/weston.ini
@@ -0,0 +1,74 @@
+# configuration file for Weston
+
+#[core]
+#modules=xwayland.so,cms-colord.so
+#shell=desktop-shell.so
+#gbm-format=xrgb2101010
+
+#[shell]
+#background-image=/usr/share/backgrounds/gnome/Aqua.jpg
+#background-color=0xff002244
+#background-type=tile
+#clock-format=minutes
+#panel-color=0x90ff0000
+#locking=true
+#animation=zoom
+#startup-animation=fade
+#binding-modifier=ctrl
+#num-workspaces=6
+#cursor-theme=whiteglass
+#cursor-size=24
+
+#lockscreen-icon=/usr/share/icons/gnome/256x256/actions/lock.png
+#lockscreen=/usr/share/backgrounds/gnome/Garden.jpg
+#homescreen=/usr/share/backgrounds/gnome/Blinds.jpg
+#animation=fade
+
+#[launcher]
+#icon=/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
+#path=/usr/bin/gnome-terminal
+
+#[launcher]
+#icon=/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
+#path=/usr/bin/weston-terminal
+
+#[launcher]
+#icon=/usr/share/icons/hicolor/24x24/apps/google-chrome.png
+#path=/usr/bin/google-chrome
+
+#[launcher]
+#icon=/usr/share/icons/gnome/24x24/apps/arts.png
+#path=/build/weston-0lEgCh/weston-1.11.0/weston-flower
+
+#[input-method]
+#path=/usr/lib/weston/weston-keyboard
+
+#[output]
+#name=LVDS1
+#mode=1680x1050
+#transform=90
+#icc_profile=/usr/share/color/icc/colord/Bluish.icc
+
+#[output]
+#name=VGA1
+#mode=173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
+#transform=flipped
+
+#[output]
+#name=X1
+#mode=1024x768
+#transform=flipped-90
+
+#[libinput]
+#enable_tap=true
+
+#[touchpad]
+#constant_accel_factor = 50
+#min_accel_factor = 0.16
+#max_accel_factor = 1.0
+
+#[screen-share]
+#command=/usr/bin/weston --backend=rdp-backend.so --shell=fullscreen-shell.so --no-clients-resize
+
+#[xwayland]
+#path=/usr/bin/Xwayland
diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/meta/recipes-graphics/wayland/weston-init/weston.service
deleted file mode 100644
index 18f72626e0..0000000000
--- a/meta/recipes-graphics/wayland/weston-init/weston.service
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=Weston Wayland Compositor
-RequiresMountsFor=/run
-
-[Service]
-User=root
-PAMName=login
-EnvironmentFile=-/etc/default/weston
-ExecStart=/usr/bin/weston-start -v -e -- $OPTARGS
-
-[Install]
-WantedBy=multi-user.target
-
diff --git a/meta/recipes-graphics/wayland/weston-init/weston@.service b/meta/recipes-graphics/wayland/weston-init/weston@.service
new file mode 100644
index 0000000000..9ecf2ab069
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston-init/weston@.service
@@ -0,0 +1,37 @@
+[Unit]
+Description=Weston Wayland Compositor (on tty7)
+RequiresMountsFor=/run
+Conflicts=getty@tty7.service plymouth-quit.service
+After=systemd-user-sessions.service getty@tty7.service plymouth-quit-wait.service
+
+[Service]
+User=%i
+PermissionsStartOnly=true
+
+# Log us in via PAM so we get our XDG & co. environment and
+# are treated as logged in so we can use the tty:
+PAMName=login
+
+# Grab tty7
+UtmpIdentifier=tty7
+TTYPath=/dev/tty7
+TTYReset=yes
+TTYVHangup=yes
+TTYVTDisallocate=yes
+
+# stderr to journal so our logging doesn't get thrown into /dev/null
+StandardOutput=tty
+StandardInput=tty
+StandardError=journal
+
+EnvironmentFile=-/etc/default/weston
+
+# Weston does not successfully change VT, nor does systemd place us on
+# the VT it just activated for us. Switch manually:
+ExecStartPre=/usr/bin/chvt 7
+ExecStart=/usr/bin/weston --log=${XDG_RUNTIME_DIR}/weston.log $OPTARGS
+
+IgnoreSIGPIPE=no
+
+#[Install]
+#Alias=multi-user.target.wants/weston.service
diff --git a/meta/recipes-graphics/wayland/weston_7.0.0.bb b/meta/recipes-graphics/wayland/weston_7.0.0.bb
index 5d2a9336f3..583798368e 100644
--- a/meta/recipes-graphics/wayland/weston_7.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_7.0.0.bb
@@ -104,7 +104,7 @@ FILES_${PN}-xwayland = "${libdir}/libweston-${WESTON_MAJOR_VERSION}/xwayland.so"
 RDEPENDS_${PN}-xwayland += "xserver-xorg-xwayland"
 
 RDEPENDS_${PN} += "xkeyboard-config"
-RRECOMMENDS_${PN} = "weston-conf liberation-fonts"
+RRECOMMENDS_${PN} = "weston-init liberation-fonts"
 RRECOMMENDS_${PN}-dev += "wayland-protocols"
 
 USERADD_PACKAGES = "${PN}"
-- 
2.23.0


