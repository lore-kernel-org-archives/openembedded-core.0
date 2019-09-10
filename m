Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6466160111
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 21:37:58 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id d15so12288875pfo.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 14:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FvJpS72z7/lqeWtAmU5pCMfUpCd5QfD/uQLUOvj+IXE=;
	b=rjcSs9zOl5ni8BL28TnazfMv9wZ0IR80gImwOyaXYWgKGWdDf0Ht+akV4I9IjIjRek
	fHhXC9a0eOkh4+Yhavngo29cNlcdICoWpFtJ1NETuqZBUSn/AoNNjXKGs7DDOYZeOcqZ
	O+WhLTUmD9LbPbrazZ3UyhIdZejSEEwfE5LRQe5Wr/351rG2cc+LyKhXN90qNvX7SSZt
	2ULPSlZl7Zl5uFjhvLTjXC0cWf5uJ6vzFNOU8ythKei7d49eH8strKbq+KKpqD9K+lmG
	k5fMfVOiPbHOpD98LwAGsxVxQvY7+ZlL8vS9FXoIxrZk/sED9n9Z2ZP9rJC8D4cF8VWa
	vjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FvJpS72z7/lqeWtAmU5pCMfUpCd5QfD/uQLUOvj+IXE=;
	b=ud11lFV8Pra6I7JrhMg2vMuAIQxAhOShCbnsyxMxxdKg9SAWPpj8HO4vg/8TOZ5e4r
	Tl5q95bIwMW9TuxIZa1TWsSa+5HbxSTbbAluX5p2MRPZ68C5UNucUDNFzD6umPV/rr4Y
	fVccCRNrXBebgXT7/6w43P/R+1QD7LzDZy+qma26eLYar372jXhueC0ASwzSdlWtnPxp
	x/h/LN9SlIa1YOZCthbGLe+YA/BOa83n9xFq0LiGMkOFVMUwx/FH7yzVc/X4IAepBIzz
	qSiNVYB9GJkOqS3Y3uaD+7C+wMngovHLtTdBFa33xj/QwoTWLvljO7sg3rYF1LzBOp6S
	CcyA==
X-Gm-Message-State: APjAAAUC2qcSU9uR+2uJV9K0vO1dVP9rXERZ/RNMdenymSyUSdM/Q3RW
	fIXfMvGYc4hspLrWyDL8WDNIoq/qliA=
X-Google-Smtp-Source: APXvYqyTtbmaMkBujiwxlrEFDTZuRaYjWsvTaI4A2NC/TIY/iHfg4XyzSoayAkFFrpCIa8AWvZbl1g==
X-Received: by 2002:a63:d04e:: with SMTP id s14mr28408746pgi.189.1568151478676;
	Tue, 10 Sep 2019 14:37:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	a1sm17920059pgd.74.2019.09.10.14.37.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Sep 2019 14:37:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Sep 2019 14:37:50 -0700
Message-Id: <20190910213750.1369567-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] weston-init: Add possibility to run weston as non-root user
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
X-List-Received-Date: Tue, 10 Sep 2019 21:37:58 -0000
Content-Transfer-Encoding: 8bit

These changes are from meta-96boards primarily
Launch the session via a udev rule based on what kind of display device
is available

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-graphics/wayland/weston-init.bb  | 25 ++++++-
 .../wayland/weston-init/71-weston-drm.rules   |  2 +
 .../wayland/weston-init/weston.ini            | 74 +++++++++++++++++++
 .../wayland/weston-init/weston.service        | 13 ----
 .../wayland/weston-init/weston@.service       | 37 ++++++++++
 5 files changed, 134 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston-init/71-weston-drm.rules
 create mode 100644 meta/recipes-graphics/wayland/weston-init/weston.ini
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.service
 create mode 100644 meta/recipes-graphics/wayland/weston-init/weston@.service

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 22ba5f3fb3..86f38fadb4 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -3,15 +3,26 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
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
+	install -Dm0644 ${WORKDIR}/weston@.service ${D}${systemd_system_unitdir}/weston@.service
+	install -D -p -m0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
+
+	# Install Weston systemd service and accompanying udev rule
+	install -D -p -m0644 ${WORKDIR}/weston@.service ${D}${systemd_unitdir}/system/weston@.service
+	sed -i -e s:/etc:${sysconfdir}:g \
+		-e s:/usr/bin:${bindir}:g \
+		-e s:/var:${localstatedir}:g \
+		${D}${systemd_unitdir}/system/weston@.service
+	install -D -p -m0644 ${WORKDIR}/71-weston-drm.rules \
+		${D}${sysconfdir}/udev/rules.d/71-weston-drm.rules
 	# Install weston-start script
 	install -Dm755 ${WORKDIR}/weston-start ${D}${bindir}/weston-start
 	sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-start
@@ -28,4 +39,10 @@ RDEPENDS_${PN} = "weston kbd"
 INITSCRIPT_NAME = "weston"
 INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
 
-SYSTEMD_SERVICE_${PN} = "weston.service"
+FILES_${PN} += "${sysconfdir}/xdg/weston/weston.ini ${systemd_unitdir}/system/weston@.service"
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
-- 
2.23.0


