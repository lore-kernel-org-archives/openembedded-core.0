Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1BD0478AE6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 16:27:27 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id e11-v6so6454699plb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 09:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hgIgImaQ/o217nB1vdWBsOsaZfbwIMQHNpVyabpz7TM=;
	b=YqxI4RvXyuZCSiMqHxqQev98K0QgGP1gpcMyCAahdFR7BsouvqGseYHM6FGXy+JtPR
	ISG/s2LCEB741io12w+56g0IChQjRmv26Lu43YXpcqEqbo1x6AIMJ6nUXersZUctNsPb
	/hnqpU/ryRJuB3M59/SEiI0vlqDq5f14D9SNXG0iAeB5R8npDBqJfy4FXDWOeC/RLrqy
	428qJxVSFN6iF1J5QVAg9TOE6wlYiRBmWUXpbeEGKNlJO6KO108MqpUhQdY5ZR1rTbDV
	gAn6GQLKdDYN6ehx/VnMQf41P1rbZNU0Bd31z18fyczfhUP4lUe8QN3ssdlZjb4S9NiW
	AGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hgIgImaQ/o217nB1vdWBsOsaZfbwIMQHNpVyabpz7TM=;
	b=aqJRao7OGp6gRlQtpfQvIjmGJ6dpQjamRqgwZjFexY91fI84NTmYZsV2m3fxGuKmdO
	i7vHaxc2qMkNJx4LXA3XUQtV1ZXXDd40UxWo5aNbqvluJSQLuF5tC8dpe/f2mqWL++Sy
	YO1TytEKR79pRqWABf0u50V5sqck0TwWGJl2swa4U9qVRW9860Znd7LJ6RufgOGIQfXE
	6IrhVtdZJAnp0p5F+mai3dJq+ib7QWjYm5BcaFsz3pztRTHSm/2i3gATSohxrbDOb4H5
	+Q4qdPouCRQAytAgZ2fbZRwjkZ96CZ+0KmpCPnfi6KMvA/E2zZLTVTK/h2NaP/Z7QZ6M
	5KTA==
X-Gm-Message-State: AOUpUlHIf3cvHQ2o+8bu1ruGCBm+ltFcn7wWWKXDCUqLRtNeMG8XiY6J
	7B27of5uttaZHbsmOMNJHYO9qqkw
X-Google-Smtp-Source: AAOMgpckS/OOvFA/W+NrN0bt31KXaT92F/hdDyNbHn55Rit0+WNWjpm5LYw5QC1mUTgxU5LgSho+PA==
X-Received: by 2002:a17:902:8601:: with SMTP id
	f1-v6mr6375844plo.196.1532190448846; 
	Sat, 21 Jul 2018 09:27:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::8092])
	by smtp.gmail.com with ESMTPSA id
	k26-v6sm14485231pfb.167.2018.07.21.09.27.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jul 2018 09:27:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Jul 2018 09:27:12 -0700
Message-Id: <20180721162715.12611-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180721162715.12611-1-raj.khem@gmail.com>
References: <20180721162715.12611-1-raj.khem@gmail.com>
Subject: [PATCH 4/7] weston: Find wayland-protocol files in proper location during cross compile
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
X-List-Received-Date: Sat, 21 Jul 2018 16:27:28 -0000

| make: *** No rule to make target 'protocol/xdg-shell-unstable-v6-protocol.c', needed by 'all'.  Stop.
| ERROR: oe_runmake failed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...R-for-defining-WAYLAND_PROTOCOLS_DAT.patch | 30 +++++++++++++++++++
 meta/recipes-graphics/wayland/weston_4.0.0.bb |  5 +++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch

diff --git a/meta/recipes-graphics/wayland/weston/0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch b/meta/recipes-graphics/wayland/weston/0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
new file mode 100644
index 0000000000..9e0f4083dc
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
@@ -0,0 +1,30 @@
+From 39c5e397ceb7ac4f9c47d04ab9ed26570742cf6a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Jul 2018 23:02:10 -0700
+Subject: [PATCH] use PKG_CHECK_VAR for defining WAYLAND_PROTOCOLS_DATADIR
+
+This allows to override the wayland-protocols pkgdatadir with the
+WAYLAND_PROTOCOLS_DATADIR from environment.
+
+pkgconfig would return an absolute path in /usr/share/wayland-protocols
+for the pkgdatadir value, which is not suitable for cross-compiling.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 48cf5cb..5cd2b89 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -221,7 +221,7 @@ PKG_CHECK_MODULES(LIBINPUT_BACKEND, [libinput >= 0.8.0])
+ PKG_CHECK_MODULES(COMPOSITOR, [$COMPOSITOR_MODULES])
+ 
+ PKG_CHECK_MODULES(WAYLAND_PROTOCOLS, [wayland-protocols >= 1.13],
+-		  [ac_wayland_protocols_pkgdatadir=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`])
++		  [PKG_CHECK_VAR([ac_wayland_protocols_pkgdatadir], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED], pkgdatadir)])
+ AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, $ac_wayland_protocols_pkgdatadir)
+ 
+ AC_ARG_ENABLE(wayland-compositor, [  --enable-wayland-compositor],,
diff --git a/meta/recipes-graphics/wayland/weston_4.0.0.bb b/meta/recipes-graphics/wayland/weston_4.0.0.bb
index e78b0d9194..c5882d590b 100644
--- a/meta/recipes-graphics/wayland/weston_4.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_4.0.0.bb
@@ -11,7 +11,8 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-make-error-portable.patch \
            file://xwayland.weston-start \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
-"
+           file://0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
+           "
 SRC_URI[md5sum] = "33709aa4d5916f89643fca0fc0064b39"
 SRC_URI[sha256sum] = "a0fc0ae7ef83dfbed12abfe9b8096a24a7dd00705e86fa0db1e619ded18b4b58"
 
@@ -35,6 +36,8 @@ EXTRA_OECONF_append_qemux86 = "\
 EXTRA_OECONF_append_qemux86-64 = "\
 		WESTON_NATIVE_BACKEND=fbdev-backend.so \
 		"
+EXTRA_OEMAKE += "WAYLAND_PROTOCOLS_DATADIR=${STAGING_DATADIR}/wayland-protocols"
+
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd x11', d)} \
-- 
2.18.0


