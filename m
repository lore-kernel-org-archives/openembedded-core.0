Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id D4FEC70031
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 14:31:13 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id q184so3200189qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 07:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=ShiWdIPBFJsGaDTtUEfc97YoAojijU47TKdVrq52Ix8=;
	b=FahR/IWCjU7wPHHga2WALR1b3jfryeklhDkSMF0U6BrNWQEHWwsJlMoMg5BVpuQs+u
	ik84IXLEtnV2nKuQvIvIe9hFYw6mYMRG47/Eyoe4CpL6JTUOX8rIft8zk5tTFw9QOp3/
	aEQa51nq7scckj0tjxa98cz3uao6RnhzyQyE46C3X1bHgvV0wk2op14QXXDlm0YcrwIW
	anIXfgYSZqGfGA6jocVG+34wpe+zZ0CJG8/tBHcb6t8bm/JamaYr/Et09fLz4/8U8DfO
	XC/2SSRFmyuPwOi9MUB/oqqJyzGPuWLcGTA8fgWdRXIaKJeHBEK83EOhlYp/6Qe8Yb51
	A+GQ==
X-Gm-Message-State: AOPr4FVuanMrdDV4ctEYfYx/PjeNnJ7nmmOkPhD81qWD93G/33Qm8nyZWFPy84cil4rYjw==
X-Received: by 10.55.180.133 with SMTP id d127mr3926241qkf.131.1462977074264; 
	Wed, 11 May 2016 07:31:14 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	p138sm3505895qhb.46.2016.05.11.07.31.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 May 2016 07:31:13 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 11 May 2016 11:31:07 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 11 May 2016 11:30:34 -0300
Message-Id: <1462977042-7436-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462977042-7436-1-git-send-email-otavio@ossystems.com.br>
References: <1462977042-7436-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v5 03/11] weston: Add PACKAGECONFIG option for 'clients'
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
X-List-Received-Date: Wed, 11 May 2016 14:31:15 -0000

This allow Weston to be build without the clients.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5: None
Changes in v4:
- New patch.

Changes in v3: None
Changes in v2: None

 meta/recipes-graphics/wayland/weston_1.9.0.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.9.0.bb b/meta/recipes-graphics/wayland/weston_1.9.0.bb
index c87f053..f703f39 100644
--- a/meta/recipes-graphics/wayland/weston_1.9.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.9.0.bb
@@ -26,9 +26,6 @@ DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
 DEPENDS += "wayland libinput virtual/egl pango wayland-native"
 
 EXTRA_OECONF = "--enable-setuid-install \
-                --enable-simple-clients \
-                --enable-clients \
-                --enable-demo-clients-install \
                 --disable-rpi-compositor \
                 --disable-rdp-compositor \
                 "
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


