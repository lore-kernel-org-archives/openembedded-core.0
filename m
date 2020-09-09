Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.570.1599668828860415374
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 09:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hoinAKOV;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 34so2416492pgo.13
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 09:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yGBEu3L0E3IUzvoi6oE3AMUJqYyOXQy85QU9lKcnxss=;
        b=hoinAKOV2ngG0HPwHnLkSqxMAPKHTL1SazoqCWNoiOUszKgC+44KAbXvIGVMtUHt7O
         u5ZDRNAhF/h2FEHDJaunEwAILQFMyx1bK+5zdJEjtY+MfTW8DF62QJtxyAStE5VJDOZo
         YagHWOXF42qlEE0QFZaDfbM6VFMFCCySE4ypQd3BdlDmKm9lHtE7b05vUhWpJ4LX6A/j
         gHnIYpRFjaPldWdSY+G4lPeHLHD/+23Aqreqk7PhsHlZuC8GAy/9nbpS3fAlluPb0Tjh
         zEzAnWd1jJfvdrF8HP2XBY/Z/iPMWzF89pcTUpt96NQag3cwG/OqWRSTPVzecXblwnfh
         mkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yGBEu3L0E3IUzvoi6oE3AMUJqYyOXQy85QU9lKcnxss=;
        b=qgGKWwV0jFcf39dBwCEVd27cu83eFz1HviLI6QOQXMYNrsaHKM4k+WS7CNLf+TqdBu
         wPWy2uogrWTHW+NSqJrxk0Y9ahfZMXXkhVZTC2kIIppnouMvieVWY6ax6GVBhls3cdZY
         IFgNKKRMpBzVT3Qnl0Y6H1JRsPdGM0vlKmnxqCP7NWSZK8K50m7mFUgnlq5CTkfGgW2A
         5IySsCyjMly2VL2dvXMOp5VJYTNaQakCIxRF9+NRthW3m+zzGiL+SIlwsvcLUCJgWIJV
         2Gp0FCzqs19K4vrEsTFwpeZzuxX+4QT0OFrW2D2bf1vINSxB8xvz7uV6SNst07cF/O3T
         2vYw==
X-Gm-Message-State: AOAM530TD73PkXtn6pOxjibmpH4fkIZp4N3ZRfizzU93b7RzcvqcmQdk
	G5bf6RL/9j/hAJC1w2A17ZHKVs/JjVMNxw==
X-Google-Smtp-Source: ABdhPJxTI0ZTCS8qRRMqSdc/icnTkI8dwVWfE4vYcfpbZuAq0uSb0WRdPW6m+o/vnxlmwUEpxrHZuQ==
X-Received: by 2002:a63:8e4a:: with SMTP id k71mr1161943pge.326.1599668827828;
        Wed, 09 Sep 2020 09:27:07 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d92c])
        by smtp.gmail.com with ESMTPSA id v91sm2813980pjv.12.2020.09.09.09.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 09:27:07 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Henning Heinold <henning@itconsulting-heinold.de>
Subject: [PATCH v2] weston-init: Redefine weston service and add socket activation option
Date: Wed,  9 Sep 2020 09:27:04 -0700
Message-Id: <20200909162704.2362862-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, weston when autolauched with systemd ends up with seat0
related errors because its launched before seat0 is assigned.

Fixes
[05:16:09.357] logind: failed to get session seat
[05:16:09.358] logind: cannot setup systemd-logind helper (-61), using legacy fallback

The above error results in ptest failures in parselogs, even though
weston has started ok using fallback methods, these errors are still seen in logs

Also fixes weston ptests
RESULTS - weston.WestonTest.test_weston_can_initialize_new_wayland_compositor: PASSED (8.58s)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Henning Heinold <henning@itconsulting-heinold.de>
---
v2: Improve commit msg

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

