Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id 393BE731BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 16:37:07 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id f74so1844884qge.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 09:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=X/oPKIuzvstz3LrKaX76o1duZU9Z9UKpexOKtvIb7BA=;
	b=JQDdO8zKKTHCcdXQsntu5jGw0QPxCcR61tEZQswcz8nR8fDfbBGgVBIiYwx1qv5Xqs
	p2Fmjwv22sP6NlXTiIqyVaub8y+AjAuiPm4NcklJCXRWqTiOna/+S0d8F5aZwS9DqtWP
	wGT0MOGE0E7Uh8mKLJ9Dju6ufsbIa3b67aE3S8VS3TzK9OQQy0JmwDEbHlBID+JrZNrj
	rsvzryeT9gjOPgpGyrBExe0gr2ebwHWC5YPsHk9hNbQ6Q5R2/1L3805jbvXMmq+J6bCv
	+Z9s3100nmrUK3YaaSCDdYZ0Q7NyBANAmVaTpykyw7ijkFfpuUJnk6Zb/VK1MiIG7GOh
	U5JQ==
X-Gm-Message-State: AOPr4FUqIA75N1g+S/ijJAUn/WEL45CneJfbZgxm6hZOlqlpWUlKDb1S6dCWH7zsrK/1OQ==
X-Received: by 10.140.32.37 with SMTP id g34mr2649953qgg.31.1463503028657;
	Tue, 17 May 2016 09:37:08 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	r124sm1688216qhr.48.2016.05.17.09.37.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 May 2016 09:37:07 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 17 May 2016 13:36:59 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 17 May 2016 13:36:15 -0300
Message-Id: <1463502985-5428-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463502985-5428-1-git-send-email-otavio@ossystems.com.br>
References: <1463502985-5428-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v7 03/13] weston: Add PACKAGECONFIG option for 'clients'
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
X-List-Received-Date: Tue, 17 May 2016 16:37:09 -0000

This allow Weston to be build without the clients.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


