Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5370973194
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 22:50:36 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id 90so31816198qgz.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2016 15:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=UU5Ga4UQnpe/uvmBp9IOLTrE8J1WJ/+FDnIhnFdPPzU=;
	b=AYxLRdELVWE8YL12pJtV7eq3xfPVQFKlKrs1I3sddXptDWIwquwXTKZvkx7HJ82jqA
	0NIITJzvujDg/S58/O3jo/ypA21zfAn39WwyIL5KdfObtmD3bLia/8pF+lZYmfWSrd5O
	nO6TWrLKdVxx37mrU7gIUamV3OJMO1BgzScXgWWaU9ExFYP+F5wxpEZmZWBLL1oIr34I
	eHjiRyu2xTafQcEPyVdUXSQUOyZamL5MrSiuZiDTyJxh3rXN/NBkqV0Y4AromHNp3uF8
	tTzz0zxcfi/gpbqS7wRjIy4oUgpuGESdNvar4BVUeJX+3kV5we6EK1zqQct6juJOIiYr
	i6SA==
X-Gm-Message-State: AOPr4FU+Bagdp+kE8PNMTZjl6/fmxHPpmLMK1zA8AwhhzR9I+7zwfOc3vx/Dfty9iVVSxg==
X-Received: by 10.140.216.16 with SMTP id m16mr9794709qhb.37.1462402237561;
	Wed, 04 May 2016 15:50:37 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	g186sm2253977qke.49.2016.05.04.15.50.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 May 2016 15:50:36 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 04 May 2016 19:50:31 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  4 May 2016 19:49:39 -0300
Message-Id: <1462402180-16861-8-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462402180-16861-1-git-send-email-otavio@ossystems.com.br>
References: <1462402180-16861-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v3 7/8] weston: Add Xwayland initialization support using weston-start
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
X-List-Received-Date: Wed, 04 May 2016 22:50:37 -0000

The weston-start script now supports loading modules so the Xwayland
support can be loaded optionally. Use this to load Weston accordingly.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


