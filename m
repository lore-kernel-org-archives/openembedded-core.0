Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 583B977085
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 16:41:34 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n62so4440699qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 09:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=R7ASKm4vtPcwJ9htkZAZeJ+WpWxxVTwnZ3SYFvHMav4=;
	b=HOSYwtVbkOz/X7KyH64erMX41G0XXdCtFU8AFwVwfoUGid5//eR3uhoxkbkjtiKmTo
	xEKvAATojmScjRTkc4swgjb3YcVtc+hDfGrSFVnr3A1AAJzesUse3W1rgF/m1blMN2ti
	fwxmhgTRkKiP9l3s0gVQTYUT9FnzbdGr5hZmCnC31tl1X9riT0yvPATkAvaGLczSQgTS
	2646EUejY5GOnKILqL0TjF9XM5j1XH0SJq8wCjAkGoWf8DI4/Be2EHPRF9FVBLgRUE31
	18LM/W4J7wT/hJXZSG//R3W7vaJWHEacTulDUCBhcJQ8TRYN+AMjfa9SiJoDGG0uzYn/
	oLEQ==
X-Gm-Message-State: AOPr4FVMf87P8Jm79V0mAMr/VFCR4kzpnTpKPcSRptJJoW26Rs8ugvpV+y2cwkh9XTHbuQ==
X-Received: by 10.55.192.71 with SMTP id o68mr8833252qki.27.1463589695504;
	Wed, 18 May 2016 09:41:35 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	e92sm4532698qge.25.2016.05.18.09.41.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 May 2016 09:41:34 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 18 May 2016 13:41:24 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 13:40:38 -0300
Message-Id: <1463589648-28641-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
References: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v8 03/13] weston: Add PACKAGECONFIG option for 'clients'
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
X-List-Received-Date: Wed, 18 May 2016 16:41:35 -0000

This allow Weston to be build without the clients.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8: None
Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4:
- New patch.

Changes in v3: None
Changes in v2: None

 meta/recipes-graphics/wayland/weston_1.10.0.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.10.0.bb b/meta/recipes-graphics/wayland/weston_1.10.0.bb
index d3e2607..16e961d 100644
--- a/meta/recipes-graphics/wayland/weston_1.10.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.10.0.bb
@@ -24,9 +24,6 @@ DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
 DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native"
 
 EXTRA_OECONF = "--enable-setuid-install \
-                --enable-simple-clients \
-                --enable-clients \
-                --enable-demo-clients-install \
                 --disable-rpi-compositor \
                 --disable-rdp-compositor \
                 WAYLAND_PROTOCOLS_SYSROOT_DIR=${STAGING_DIR}/${MACHINE} \
@@ -43,7 +40,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
-                  "
+                   clients"
 #
 # Compositor choices
 #
@@ -77,6 +74,8 @@ PACKAGECONFIG[systemd] = "--enable-systemd-login,--disable-systemd-login,systemd
 PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland,libxcb libxcursor cairo"
 # colord CMS support
 PACKAGECONFIG[colord] = "--enable-colord,--disable-colord,colord"
+# Clients support
+PACKAGECONFIG[clients] = "--enable-clients --enable-simple-clients --enable-demo-clients-install,--disable-clients --disable-simple-clients"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-- 
2.8.2


