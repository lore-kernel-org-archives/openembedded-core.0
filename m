Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5AB9C6018C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 19:14:12 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id e35so14532360qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 12:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=egKv2RGWXrqUr7FC8fTvjZHgcev+W33+BuhrBL5qUS4=;
	b=CKo0nbSukexM6ssoPs4L3tSW9urLf+2IIGxRVpsRbNdPqNvV1GUB0SWFUrDYZ2srQ3
	X0673Bu2Py0R6b+97ftuvoDxi51XDZrRxsw88jioNRgOpjrKONzzyk8f2QEWQcvCzVIn
	xbjsXbjC6JbZMw8G80bWbKs0hR01Pt5Cojku4h+mXDU45X6MqIvgwurJNs8rIiXDss88
	+V03BUFrILi0s9+DaVIhtiWy6XRTmMxUecoIQK0owSl2oiCq6OTVpkYWzxwVxeYsYgkH
	NmEDKy0fMY7YX+LFST3k1SjE06wBqB504XuwN3YT4QC4r+aWDC1NwGaNTF6vX1vhgT6d
	RI0Q==
X-Gm-Message-State: AOPr4FUC+YeWNlwbPa26aDyX1lvBOt3eRyZQBwggza/fT9W+PmDuZkdrupK1L9iF2fVFhw==
X-Received: by 10.140.19.131 with SMTP id 3mr31015851qgh.83.1463426052926;
	Mon, 16 May 2016 12:14:12 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	c2sm15461999qkb.41.2016.05.16.12.14.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 May 2016 12:14:11 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 16 May 2016 16:14:03 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 16 May 2016 16:12:08 -0300
Message-Id: <1463425932-10080-11-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
References: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v6 10/14] weston: Add Xwayland initialization support using weston-start
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
X-List-Received-Date: Mon, 16 May 2016 19:14:12 -0000

The weston-start script now supports loading modules so the Xwayland
support can be loaded optionally. Use this to load Weston accordingly.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
- Move weston-start module to weston package
- Stop using weston-launch

 meta/recipes-graphics/wayland/weston/xwayland.weston-start | 7 +++++++
 meta/recipes-graphics/wayland/weston_1.10.0.bb             | 7 ++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/wayland/weston/xwayland.weston-start

diff --git a/meta/recipes-graphics/wayland/weston/xwayland.weston-start b/meta/recipes-graphics/wayland/weston/xwayland.weston-start
new file mode 100644
index 0000000..b483c97
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/xwayland.weston-start
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+if type Xwayland  >/dev/null 2>/dev/null; then
+	mkdir -p /tmp/.X11-unix
+
+	add_weston_argument "--modules=xwayland.so"
+fi
diff --git a/meta/recipes-graphics/wayland/weston_1.10.0.bb b/meta/recipes-graphics/wayland/weston_1.10.0.bb
index 7190b90..77f6e93 100644
--- a/meta/recipes-graphics/wayland/weston_1.10.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.10.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://make-libwebp-explicitly-configurable.patch \
            file://0001-make-error-portable.patch \
            file://0001-configure.ac-Use-PKG_CONFIG_SYSROOT_DIR-for-protocol.patch \
+           file://xwayland.weston-start \
            file://make-weston-launch-exit-for-unrecognized-option.patch \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
 "
@@ -90,7 +91,11 @@ do_install_append() {
 
 		install -d ${D}${datadir}/icons/hicolor/48x48/apps
 		install ${WORKDIR}/weston.png ${D}${datadir}/icons/hicolor/48x48/apps
-        fi
+	fi
+
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'yes', 'no', d)}" = "yes" ]; then
+		install -Dm 644 ${WORKDIR}/xwayland.weston-start ${D}${datadir}/weston-start/xwayland
+	fi
 }
 
 PACKAGES += "${PN}-examples"
-- 
2.8.2


