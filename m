Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 83BFD731DD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 20:01:50 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id y69so14860022pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 13:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=up+9ar8FMGL/jq0fKTJJIHxdEEqPsNor2+xBgXjwEjg=;
	b=nK5KAmmEjLNEV6fXe6JS+bEtYiZ9usxRrxBsOgdYFaudEwJzI5tR41sNxb1vpw50Xl
	Cb8xstpdSI6IxkmAHILC1/aaL3Il7xI0lfqNmJ9gdbHdpZmZJ9zApi9VKDe4L/QoAgpW
	aYE5FfIIguAhbJNj0/BG1tu5WwORMnukKJfsn8M0ItSgvQIua0eNo5JiNJFGDsbd+9Cc
	gnhGD4ha2doXdmMRNDX/hqrl7cBYJ+q312vuEw1L7Losu9qF90I0O7SfyE3VCSAagW3A
	fdflRX0Ha5mqbKNnUTjar69asfpIA8ZprNahuO/bd6LfhUAuY593bmTIbhw/Tqs5QSHa
	tVMQ==
X-Gm-Message-State: AOPr4FWzwiZdw6rxo94igTPkGNLFXzIUK/cWs37UFG/WzEXurf4WqSjywunj2oBK31sepA==
X-Received: by 10.98.93.5 with SMTP id r5mr6225619pfb.15.1462305711539;
	Tue, 03 May 2016 13:01:51 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id 8sm69594pfk.69.2016.05.03.13.01.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 May 2016 13:01:50 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 03 May 2016 17:01:45 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  3 May 2016 17:00:51 -0300
Message-Id: <1462305651-16593-8-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462305651-16593-1-git-send-email-otavio@ossystems.com.br>
References: <1462305651-16593-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v2 7/7] weston: Add Xwayland initialization support using weston-start
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
X-List-Received-Date: Tue, 03 May 2016 20:01:50 -0000

The weston-start script now supports loading modules so the Xwayland
support can be loaded optionally. Use this to load Weston accordingly.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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
index 2e42880..07bb30e 100644
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


