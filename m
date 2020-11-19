Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web12.17323.1605826740012830247
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 14:59:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RoH1BrAM;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id t143so8262400oif.10
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2020 14:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j3jhUrJ2PW9QZD6ohpWXpGu4ljK3u08NCyqKgW8MP50=;
        b=RoH1BrAM+X44NncxvnOfkJNr6XXSDNwesdxNa+q0qp9Ftw9xZQ6yiDEMbuzz+8fsZa
         pYTylv8AClCTTXVxkA75KfxEvrdtglpkiHi65dPGDEc6YRxbzUhp9rHjDUWVtbDGKjjg
         KaASQxSzwWKjE5MpFVNflFoP8SVOtAgVtM/uc2K1QSg+ICg97QR2SBJVNc5vc9nnCXyg
         3Y/kseMRp0uEa2iYqjMq6MdE0RTqQz2G8jYSXZY3Y6g1zPVstMiOtoau0vzo9wCFR1Rd
         dmWzXSxKWjjcvGbvsCTP8THZ2AC7ZKuUfjJbvVZGByqia/chLD2kx9vc26h4Cl3cnN5N
         DOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j3jhUrJ2PW9QZD6ohpWXpGu4ljK3u08NCyqKgW8MP50=;
        b=rdu9xViRQ+3ojJtNLCX+ieqU7+AbQpf8CMd8p/CB1R4oZIhLgGWA7dcJrBHtB91Pww
         WpX8f9+p8qAdlN7PRJX4P4Or62OJzh2Z0iHs2YeloyUHB1kqJSoVrr4I8zhTPlpFpCgb
         N2/sBOkN4rTD331JxS3zdfjP5S+h4pfpFEqqzHenGvJ8F+Q9aYc/LGFIYTbLpXMqnCM8
         hYxmW3Muuhfz41yWQxM8lAXAHf1zGS5x1SvNmNPeeHCHSl/UaK5AZSHqZLY/3kw3Uv/c
         x8oY1x2SkgCYKfA9hPqcWMBf7Na5q47kcc1ELBITj1WCp7gYRiunY/RywPXh+WGonhkA
         kUqQ==
X-Gm-Message-State: AOAM530OnnAuqIi4VXVADjgFoSuFNSmzpuLlfMVfi8iUAHiGun71wvQf
	ywlAkRwbu5s8qiiN3tl43rIz3ydXO5ykMA==
X-Google-Smtp-Source: ABdhPJy/ACPANLuuRFdPSveVMl7f/QWouTGcGSfqoSJdOVX7BiV4OPGZA/sTuUMIjhhuayvzZiAQ4A==
X-Received: by 2002:aca:a8d4:: with SMTP id r203mr4240775oie.3.1605826738964;
        Thu, 19 Nov 2020 14:58:58 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id g188sm651266oia.19.2020.11.19.14.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 14:58:58 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	alistair@alistair23.me,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][RFC] weston-init: Stop running weston as root
Date: Thu, 19 Nov 2020 16:58:53 -0600
Message-Id: <20201119225853.12645-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Running the weston compositor as the root user is an insecure default
behavior for OE-core. We can do much better, at least when using
systemd. Change the recipe to create a dedicated "weston" user and start
weston as this user. The systemd service and socket units are no longer
template units, as there were several inconsistencies in the templates.
Instead, there is now a global /run/wayland-0 socket that gets created,
and systemd will start weston on demand when a client connects to that
socket or when attempting to reach graphical.target, whichever comes
first. This also allows downstream users to easily change the behavior
so that weston *only* starts on demand by adding a drop file. Access to
the global socket is controlled by a "wayland" group; any user that is a
member of the group can use the socket to talk to the compositor. This
also satisfies another use case where another systemd service might
start a graphical application that needs to display with weston (e.g. a
single function device in kiosk mode). Finally, the udev rules for
starting weston with the existance of a DRM device have been removed.
Being WantedBy= a graphical target should eliminate the need for this
behavior, and having it present makes it difficult for downstream users
to start weston on demand (having to override the udev rules).

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-graphics/wayland/weston-init.bb  | 33 ++++++++++++-------
 .../wayland/weston-init/71-weston-drm.rules   |  2 --
 .../{weston@.service => weston.service}       | 14 +++++---
 .../wayland/weston-init/weston.socket         | 14 ++++++++
 .../wayland/weston-init/weston@.socket        | 10 ------
 5 files changed, 45 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/71-weston-drm.rules
 rename meta/recipes-graphics/wayland/weston-init/{weston@.service => weston.service} (83%)
 create mode 100644 meta/recipes-graphics/wayland/weston-init/weston.socket
 delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston@.socket

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index a616c473ec..65d7b81dc5 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -7,9 +7,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SRC_URI = "file://init \
            file://weston.env \
            file://weston.ini \
-           file://weston@.service \
-           file://weston@.socket \
-           file://71-weston-drm.rules \
+           file://weston.service \
+           file://weston.socket \
            file://weston-autologin \
            file://weston-start"
 
@@ -36,17 +35,15 @@ do_install() {
 	install -Dm644 ${WORKDIR}/weston.env ${D}${sysconfdir}/default/weston
 
 	# Install Weston systemd service and accompanying udev rule
-	install -D -p -m0644 ${WORKDIR}/weston@.service ${D}${systemd_system_unitdir}/weston@.service
-	install -D -p -m0644 ${WORKDIR}/weston@.socket ${D}${systemd_system_unitdir}/weston@.socket
+	install -D -p -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
+	install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${systemd_system_unitdir}/weston.socket
         if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
 		install -D -p -m0644 ${WORKDIR}/weston-autologin ${D}${sysconfdir}/pam.d/weston-autologin
         fi
 	sed -i -e s:/etc:${sysconfdir}:g \
 		-e s:/usr/bin:${bindir}:g \
 		-e s:/var:${localstatedir}:g \
-		${D}${systemd_unitdir}/system/weston@.service
-	install -D -p -m0644 ${WORKDIR}/71-weston-drm.rules \
-		${D}${sysconfdir}/udev/rules.d/71-weston-drm.rules
+		${D}${systemd_unitdir}/system/weston.service
 	# Install weston-start script
 	install -Dm755 ${WORKDIR}/weston-start ${D}${bindir}/weston-start
 	sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-start
@@ -58,11 +55,15 @@ do_install() {
 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'no-idle-timeout', 'yes', 'no', d)}" = "yes" ]; then
 		sed -i -e "/^\[core\]/a idle-time=0" ${D}${sysconfdir}/xdg/weston/weston.ini
 	fi
+
+	install -dm 755 -o weston -g weston ${D}/home/weston
 }
 
 INHIBIT_UPDATERCD_BBCLASS = "${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', '1', '', d)}"
 
-inherit update-rc.d features_check systemd
+inherit update-rc.d features_check systemd useradd
+
+USERADD_PACKAGES = "${PN}"
 
 # rdepends on weston which depends on virtual/egl
 # requires pam enabled if started via systemd
@@ -73,10 +74,18 @@ RDEPENDS_${PN} = "weston kbd"
 INITSCRIPT_NAME = "weston"
 INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
 
-FILES_${PN} += "${sysconfdir}/xdg/weston/weston.ini ${systemd_system_unitdir}/weston@.service ${systemd_system_unitdir}/weston@.socket ${sysconfdir}/default/weston ${sysconfdir}/pam.d/"
+FILES_${PN} += "\
+    ${sysconfdir}/xdg/weston/weston.ini \
+    ${systemd_system_unitdir}/weston.service \
+    ${systemd_system_unitdir}/weston.socket \
+    ${sysconfdir}/default/weston \
+    ${sysconfdir}/pam.d/ \
+    /home/weston \
+    "
 
 CONFFILES_${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/default/weston"
 
-SYSTEMD_SERVICE_${PN} = "weston@%i.service"
-SYSTEMD_AUTO_ENABLE = "disable"
+SYSTEMD_SERVICE_${PN} = "weston.service weston.socket"
+USERADD_PARAM_${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input weston"
+GROUPADD_PARAM_${PN} = "-r wayland"
 
diff --git a/meta/recipes-graphics/wayland/weston-init/71-weston-drm.rules b/meta/recipes-graphics/wayland/weston-init/71-weston-drm.rules
deleted file mode 100644
index 1a1b8bbda4..0000000000
--- a/meta/recipes-graphics/wayland/weston-init/71-weston-drm.rules
+++ /dev/null
@@ -1,2 +0,0 @@
-ACTION=="add", SUBSYSTEM=="graphics", KERNEL=="fb0", TAG+="systemd", ENV{SYSTEMD_WANTS}+="weston@root.service"
-ACTION=="add", SUBSYSTEM=="drm", KERNEL=="card0", TAG+="systemd", ENV{SYSTEMD_WANTS}+="weston@root.service"
diff --git a/meta/recipes-graphics/wayland/weston-init/weston@.service b/meta/recipes-graphics/wayland/weston-init/weston.service
similarity index 83%
rename from meta/recipes-graphics/wayland/weston-init/weston@.service
rename to meta/recipes-graphics/wayland/weston-init/weston.service
index ce8f4fb71a..e09625b31c 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston@.service
+++ b/meta/recipes-graphics/wayland/weston-init/weston.service
@@ -9,6 +9,7 @@ Documentation=man:weston(1) man:weston.ini(5)
 Documentation=http://wayland.freedesktop.org/
 
 # Make sure we are started after logins are permitted.
+Requires=systemd-user-sessions.service
 After=systemd-user-sessions.service
 
 # If Plymouth is used, we want to start when it is on its way out.
@@ -18,6 +19,9 @@ After=plymouth-quit-wait.service
 Wants=dbus.socket
 After=dbus.socket
 
+# Ensure the socket is present
+Requires=weston.socket
+
 # Since we are part of the graphical session, make sure we are started before
 # it is complete.
 Before=graphical.target
@@ -37,10 +41,11 @@ TimeoutStartSec=60
 WatchdogSec=20
 
 # The user to run Weston as.
-User=%I
+User=weston
+Group=weston
 
-# Make sure working directory is users home directory
-WorkingDirectory=/home/%i
+# Make sure the working directory is the users home directory
+WorkingDirectory=/home/weston
 
 # Set up a full user session for the user, required by Weston.
 PAMName=weston-autologin
@@ -61,5 +66,6 @@ UtmpIdentifier=tty7
 UtmpMode=user
 
 [Install]
+# Note: If you only want weston to start on-demand, remove this line with a
+# service drop file
 WantedBy=graphical.target
-DefaultInstance=tty7
diff --git a/meta/recipes-graphics/wayland/weston-init/weston.socket b/meta/recipes-graphics/wayland/weston-init/weston.socket
new file mode 100644
index 0000000000..c1bdc83c05
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston-init/weston.socket
@@ -0,0 +1,14 @@
+[Unit]
+Description=Weston socket
+RequiresMountsFor=/run
+
+[Socket]
+ListenStream=/run/wayland-0
+SocketMode=0775
+SocketUser=weston
+SocketGroup=wayland
+RemoveOnStop=yes
+
+[Install]
+WantedBy=sockets.target
+
diff --git a/meta/recipes-graphics/wayland/weston-init/weston@.socket b/meta/recipes-graphics/wayland/weston-init/weston@.socket
deleted file mode 100644
index f1790d74a8..0000000000
--- a/meta/recipes-graphics/wayland/weston-init/weston@.socket
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=Weston Wayland socket
-After=user-runtime-dir@1000.service
-
-[Socket]
-ListenStream=/run/user/1000/wayland-%I
-
-[Install]
-WantedBy=sockets.target
-
-- 
2.29.2

