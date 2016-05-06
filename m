Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id B4FF26FEFA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 20:44:15 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id r184so67140351qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 13:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=FN26k1G8wGM9XlZCpGUpmpXN2REkmao9UM7DF7W6umw=;
	b=TWSsGSLmasdTC9zKi70U28mS6gyOt4feYa9Samz8kNo2yNcg3Y2SFEucwl1etEx1Zp
	oxa6kNibVbHZnVsQVSkc2iK1ADBF3oGICqgfYfuhBBR5ycPC2ivo8+eOvZuKTWKTwNVj
	di6ToWuLh2XHLfznWVdGnxgWal/OJC8ANDxRlhnsxVAhQT7oIWRl8gVdQzUdhe/pDbSV
	jqftlMnC4DyOyW3qQhby59Sp5P3H6ad39f9JlCsmcwWZZbFUd2xjeqDRKOG71Efpad51
	wTurN2AjrUR/v9COmy9GUAIpktFTYvNYIpZJx96f9+0xAdo4U4iGmixtsol6YIYUHsz3
	l9yg==
X-Gm-Message-State: AOPr4FWiQnuSUB9+ADOSATLgo9YWTP6dsrRLdAkNQnQXBUAIwphqantr3uf77zAEeYQJSg==
X-Received: by 10.55.158.18 with SMTP id h18mr23400268qke.58.1462567456059;
	Fri, 06 May 2016 13:44:16 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id 5sm6539813qkf.4.2016.05.06.13.44.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 13:44:15 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 17:44:09 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  6 May 2016 17:43:33 -0300
Message-Id: <1462567419-3459-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462567419-3459-1-git-send-email-otavio@ossystems.com.br>
References: <1462567419-3459-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v4 04/10] weston: Add PACKAGECONFIG option for 'clients'
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
X-List-Received-Date: Fri, 06 May 2016 20:44:16 -0000

This allow Weston to be build without the clients.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v4:
- New patch.

Changes in v3: None
Changes in v2: None

 meta/recipes-graphics/wayland/weston_1.9.0.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.9.0.bb b/meta/recipes-graphics/wayland/weston_1.9.0.bb
index 2e42880..618d7e4 100644
--- a/meta/recipes-graphics/wayland/weston_1.9.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.9.0.bb
@@ -25,9 +25,6 @@ DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
 DEPENDS += "wayland libinput virtual/egl pango wayland-native"
 
 EXTRA_OECONF = "--enable-setuid-install \
-                --enable-simple-clients \
-                --enable-clients \
-                --enable-demo-clients-install \
                 --disable-rpi-compositor \
                 --disable-rdp-compositor \
                 "
@@ -43,7 +40,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
-                  "
+                   clients"
 #
 # Compositor choices
 #
@@ -77,6 +74,8 @@ PACKAGECONFIG[systemd] = "--enable-systemd-login,--disable-systemd-login,systemd
 PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland"
 # colord CMS support
 PACKAGECONFIG[colord] = "--enable-colord,--disable-colord,colord"
+# Clients support
+PACKAGECONFIG[clients] = "--enable-clients --enable-simple-clients --enable-demo-clients-install,--disable-clients --disable-simple-clients"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-- 
2.8.2


