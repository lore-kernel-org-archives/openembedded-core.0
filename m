Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5E374700EB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 14:32:05 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id q184so3202830qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 07:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=gR/LPU1ZnOY68nNyVKtXTFN7z8/xnBc0AZ2u0OuSDu0=;
	b=krhnVF/Ugye/uHjSQKyrcQLLHSGnUc9blgT+qwNlRNG/8YItF1zu+BtUWIRLhGJfG7
	5nGhFOcvns5hLNOcnW4Kpc5Z1K/FlgJ2bOVTK3L7Vwthx90nfizBxMxX35Vs1G95QEDF
	HQVNYtJrzZI+T7kcJ0JaZT7NW+fTI9HqCS1wCDGn7pk4XlTtcPkaZKOHUF5+fp+/dHqf
	ALzSk6aX4vlYLQacLXk7dZXycN7+T8SyZ4lEXQlNewHKlW1/YtaFVmuuz3pbd6vhPPLP
	kbGlxp9KiWEV/nU7vRhrfN/U8DVwHgKs1x/I6xJxk41M9Qlq9sas1GeUT2VkcNWY55DW
	IBMg==
X-Gm-Message-State: AOPr4FWEL5htjpXhK1x3tRtrdM1z4O/naLcjjRxZ3P3C7JRhjPAs5q1Ytjq7o5D3M3cXYQ==
X-Received: by 10.55.71.146 with SMTP id u140mr3998455qka.14.1462977126195;
	Wed, 11 May 2016 07:32:06 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	b198sm426499qkg.44.2016.05.11.07.32.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 May 2016 07:32:05 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 11 May 2016 11:31:59 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 11 May 2016 11:30:41 -0300
Message-Id: <1462977042-7436-11-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462977042-7436-1-git-send-email-otavio@ossystems.com.br>
References: <1462977042-7436-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v5 10/11] weston: Add Xwayland initialization support using weston-start
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
X-List-Received-Date: Wed, 11 May 2016 14:32:05 -0000

The weston-start script now supports loading modules so the Xwayland
support can be loaded optionally. Use this to load Weston accordingly.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
- Move weston-start module to weston package
- Stop using weston-launch

 meta/recipes-graphics/wayland/weston/xwayland.weston-start | 7 +++++++
 meta/recipes-graphics/wayland/weston_1.9.0.bb              | 7 ++++++-
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
diff --git a/meta/recipes-graphics/wayland/weston_1.9.0.bb b/meta/recipes-graphics/wayland/weston_1.9.0.bb
index 8b48f5f..64d728f 100644
--- a/meta/recipes-graphics/wayland/weston_1.9.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.9.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://libsystemd.patch \
            file://explicit-enable-disable-systemd.patch \
            file://make-weston-launch-exit-for-unrecognized-option.patch \
+           file://xwayland.weston-start \
 "
 SRC_URI[md5sum] = "66bbba12f546570b4d97f676bc79a28e"
 SRC_URI[sha256sum] = "9c1b03f3184fa0b0dfdf67e215048085156e1a2ca344af6613fed36794ac48cf"
@@ -89,7 +90,11 @@ do_install_append() {
 
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


