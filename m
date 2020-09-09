Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.7598.1599632348382388042
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 23:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BT3qMsrs;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id t7so815794pjd.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2020 23:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yKYh2Rs8IbRaxFc+Mzcnn5P4Q8RMAmX6xoz8xKz2WXU=;
        b=BT3qMsrsBc3zgIVeNO/IT0imv326zRO5nvDDDmY9neyknGcGkc9Y9rTmFw8dXX+keV
         BNOoKrPGmxz2Aqqnnro6zDtDYae+/z6AWx4D+bxsTPKTxoVcha91j4ohXuJdU8YnkYpS
         hiJvVqRJ1/gNFKFHDKLZ0bKTUPHhai2YheHsKXFfOWhWpcFT76E8PEu5bXUWgt3rB0Kv
         R1yn8tubv5vAEy1AdtiKjWjNLJfOSl7ALCEV3mwQq9E0u3S9CR/6ISv74KV8grV+oT17
         JajLiZPnhm4rfa98tgBCa16LmH4WWB5v0BvKbcfiGPZ8J1q4lHH9YskRaukH8aNIL1t5
         z8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yKYh2Rs8IbRaxFc+Mzcnn5P4Q8RMAmX6xoz8xKz2WXU=;
        b=N72F8EWjy690xEcxpM+tjQnU5GsxZazK4iZKzEZXfkX7vLlPeKn0WoJb/6RI/MB8dg
         4ywQtJyipQA/6xO4kU7vpuvmGhtZcJb+M5VVnwzcZ5FXds5eO6ERyzLOnY+0Q6OxRyna
         Ob24244rg0VTHm7eGHo2sdC22rtSz6IhqJMCA+R2L9IOugR1PX8PYGQPn+S5gN7onViP
         M6OaQnIcu5MtABU5pLvP9gE4+GzaJYu2mjV2cRklQrKqgp1qAXHpAyQNyEcJwdPI8NX7
         g0JPe7RA7aOdDLGJimN+aQUjxjsB2OCPmbzdYrCG7fkJjX8AfXlmKC8TBDJC6nsV34hO
         jDMA==
X-Gm-Message-State: AOAM533GJwl1ySRiFpcXo5dX/ar0tlM/84mLd4Ic15lwvrXfACmv4zXA
	Za9COcZod0WokAT7FmyxCJNNNUKAY6qCLg==
X-Google-Smtp-Source: ABdhPJwYvBc+IFejU3TA768uI02zBS8plVlRB3TbVjwp2QoBucVt43jPvtHjTzCcex+C+0BxULufvg==
X-Received: by 2002:a17:90a:e795:: with SMTP id iz21mr2247144pjb.8.1599632347429;
        Tue, 08 Sep 2020 23:19:07 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d92c])
        by smtp.gmail.com with ESMTPSA id l21sm1030270pgb.35.2020.09.08.23.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 23:19:06 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Marek Vasut <marex@denx.de>
Subject: [PATCH] weston-init: Run drm udev rule after systemd multi-seat setup
Date: Tue,  8 Sep 2020 23:19:05 -0700
Message-Id: <20200909061905.724541-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, weston when autolauched with systemd ends up with seat0
related errors because its launched before seat0 is assigned. The udev
rule to install the seat is called 72-seat-drm-pci-0000_00_02_0.rules
which sorts after 71-weston-drm.rules, renaming it to
73-weston-drm.rules ensures the right sequence

Fixes
[05:16:09.357] logind: failed to get session seat
[05:16:09.358] logind: cannot setup systemd-logind helper (-61), using legacy fallback

Also fixes weston ptests
RESULTS - weston.WestonTest.test_weston_can_initialize_new_wayland_compositor: PASSED (8.58s)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Marek Vasut <marex@denx.de>
---
 meta/recipes-graphics/wayland/weston-init.bb  |  8 ++-
 .../wayland/weston-init/weston-autologin      | 11 +++
 .../wayland/weston-init/weston@.service       | 69 ++++++++++++++++---
 .../wayland/weston-init/weston@.socket        | 10 +++
 4 files changed, 87 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston-init/weston-autologin
 create mode 100644 meta/recipes-graphics/wayland/weston-init/weston@.socket

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 40aa76295f..95d75556dc 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -8,7 +8,9 @@ SRC_URI = "file://init \
            file://weston.env \
            file://weston.ini \
            file://weston@.service \
+           file://weston@.socket \
            file://71-weston-drm.rules \
+           file://weston-autologin \
            file://weston-start"
 
 S = "${WORKDIR}"
@@ -20,6 +22,10 @@ do_install() {
 
 	# Install Weston systemd service and accompanying udev rule
 	install -D -p -m0644 ${WORKDIR}/weston@.service ${D}${systemd_system_unitdir}/weston@.service
+	install -D -p -m0644 ${WORKDIR}/weston@.socket ${D}${systemd_system_unitdir}/weston@.socket
+        if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
+		install -D -p -m0644 ${WORKDIR}/weston-autologin ${D}${sysconfdir}/pam.d/weston-autologin
+        fi
 	sed -i -e s:/etc:${sysconfdir}:g \
 		-e s:/usr/bin:${bindir}:g \
 		-e s:/var:${localstatedir}:g \
@@ -50,7 +56,7 @@ RDEPENDS_${PN} = "weston kbd"
 INITSCRIPT_NAME = "weston"
 INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
 
-FILES_${PN} += "${sysconfdir}/xdg/weston/weston.ini ${systemd_system_unitdir}/weston@.service ${sysconfdir}/default/weston"
+FILES_${PN} += "${sysconfdir}/xdg/weston/weston.ini ${systemd_system_unitdir}/weston@.service ${systemd_system_unitdir}/weston@.socket ${sysconfdir}/default/weston ${sysconfdir}/pam.d/"
 
 CONFFILES_${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/default/weston"
 
diff --git a/meta/recipes-graphics/wayland/weston-init/weston-autologin b/meta/recipes-graphics/wayland/weston-init/weston-autologin
new file mode 100644
index 0000000000..f6e6d106de
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston-init/weston-autologin
@@ -0,0 +1,11 @@
+auth      required  pam_nologin.so
+auth      required  pam_unix.so     try_first_pass nullok
+
+account   required  pam_nologin.so
+account   required  pam_unix.so
+
+session   required  pam_env.so
+session   required  pam_unix.so
+-session  optional  pam_systemd.so type=wayland class=user desktop=weston
+-session  optional  pam_loginuid.so
+
diff --git a/meta/recipes-graphics/wayland/weston-init/weston@.service b/meta/recipes-graphics/wayland/weston-init/weston@.service
index 39e193014a..0a1df15bdf 100644
--- a/meta/recipes-graphics/wayland/weston-init/weston@.service
+++ b/meta/recipes-graphics/wayland/weston-init/weston@.service
@@ -1,15 +1,64 @@
+# This is a system unit for launching Weston with auto-login as the
+# user configured here.
+#
+# Weston must be built with systemd support, and your weston.ini must load
+# the plugin systemd-notify.so.
 [Unit]
-Description=Weston Wayland Compositor
-RequiresMountsFor=/run
-Conflicts=plymouth-quit.service
-After=systemd-user-sessions.service plymouth-quit-wait.service
+Description=Weston, a Wayland compositor, as a system service
+Documentation=man:weston(1) man:weston.ini(5)
+Documentation=http://wayland.freedesktop.org/
+
+# Make sure we are started after logins are permitted.
+After=systemd-user-sessions.service
+
+# If Plymouth is used, we want to start when it is on its way out.
+After=plymouth-quit-wait.service
+
+# D-Bus is necessary for contacting logind. Logind is required.
+Wants=dbus.socket
+After=dbus.socket
+
+# Since we are part of the graphical session, make sure we are started before
+# it is complete.
+Before=graphical.target
+
+# Prevent starting on systems without virtual consoles, Weston requires one
+# for now.
+ConditionPathExists=/dev/tty0
 
 [Service]
-User=%i
-PAMName=login
-EnvironmentFile=-/etc/default/weston
+# Requires systemd-notify.so Weston plugin.
+Type=notify
+ExecStart=/usr/bin/weston --modules=systemd-notify.so
+
+# Optional watchdog setup
+TimeoutStartSec=60
+WatchdogSec=20
+
+# The user to run Weston as.
+User=%I
+
+# Make sure working directory is users home directory
+WorkingDirectory=/home/%i
+
+# Set up a full user session for the user, required by Weston.
+PAMName=weston-autologin
+
+# A virtual terminal is needed.
+TTYPath=/dev/tty7
+TTYReset=yes
+TTYVHangup=yes
+TTYVTDisallocate=yes
+
+# Fail to start if not controlling the tty.
+StandardInput=tty-fail
+StandardOutput=journal
 StandardError=journal
-PermissionsStartOnly=true
-IgnoreSIGPIPE=no
 
-ExecStart=/usr/bin/weston-start -v -e -- $OPTARGS
+# Log this user with utmp, letting it show up with commands 'w' and 'who'.
+UtmpIdentifier=tty7
+UtmpMode=user
+
+[Install]
+WantedBy=graphical.target
+DefaultInstance=tty7
diff --git a/meta/recipes-graphics/wayland/weston-init/weston@.socket b/meta/recipes-graphics/wayland/weston-init/weston@.socket
new file mode 100644
index 0000000000..f1790d74a8
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston-init/weston@.socket
@@ -0,0 +1,10 @@
+[Unit]
+Description=Weston Wayland socket
+After=user-runtime-dir@1000.service
+
+[Socket]
+ListenStream=/run/user/1000/wayland-%I
+
+[Install]
+WantedBy=sockets.target
+
-- 
2.28.0

