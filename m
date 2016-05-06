Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6072E77011
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 20:44:55 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id f92so62637987qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 13:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=hj4UzWvXPb5trbEUCipFPsVhLr+Dv9hkfWhujtyij9Y=;
	b=KLiU1coc5/woVx3QPyIsL05gb90Y5LIcMl/9W/RrqIVOju5fiOQhH4iMLaKSpqs2WE
	hqzJNcVX6N42ePsD3yXMBrEVqdti9MOLn636uv9rjS/IykqwqwVKBQZXp3/w2bceVnJF
	kl529bZpWC0skjS40I8aPIZ3cHUa05hSsSXwe4ZR1zOhLa+h0kBkDr3/g5LGhWEGE5Tl
	PU4Aq9MZI3Ue8cdN4zJxZNHCczynwLuyeAMhMu8kmvGi+HeV4dJxuzlPL7KYKakFV5Q9
	qmaYBtlHjQpyzRDI/D5MuT7N4gPTDb0k2362QvLBEyV5pG7MpQbMZ0lYmJo2/Siqet0f
	tQ4A==
X-Gm-Message-State: AOPr4FVJmj+wp6wTTOaV5vBu3TsxvfdoWCo2L5OFJH3Ts2IFunKPu2UQKWwsn2NLr64z4g==
X-Received: by 10.140.228.16 with SMTP id y16mr14824094qhb.83.1462567496661;
	Fri, 06 May 2016 13:44:56 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id e11sm6435884qhe.2.2016.05.06.13.44.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 13:44:55 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 17:44:50 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  6 May 2016 17:43:38 -0300
Message-Id: <1462567419-3459-10-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462567419-3459-1-git-send-email-otavio@ossystems.com.br>
References: <1462567419-3459-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v4 09/10] weston: Add Xwayland initialization support using weston-start
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
X-List-Received-Date: Fri, 06 May 2016 20:44:56 -0000

The weston-start script now supports loading modules so the Xwayland
support can be loaded optionally. Use this to load Weston accordingly.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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
index 618d7e4..6cd390c 100644
--- a/meta/recipes-graphics/wayland/weston_1.9.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.9.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-make-error-portable.patch \
            file://libsystemd.patch \
            file://explicit-enable-disable-systemd.patch \
+           file://xwayland.weston-start \
 "
 SRC_URI[md5sum] = "66bbba12f546570b4d97f676bc79a28e"
 SRC_URI[sha256sum] = "9c1b03f3184fa0b0dfdf67e215048085156e1a2ca344af6613fed36794ac48cf"
@@ -88,7 +89,11 @@ do_install_append() {
 
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


