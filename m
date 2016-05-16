Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id ABD6A606D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 19:13:10 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id l68so15348275qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 12:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=v/tM7B7MOWlonEI0FfyvgByjpZAiZGRoFiTCLH7x2TM=;
	b=BbBZ0j10pfeNuZCkfT3vXXvO0AAuXQ50eEGWnQ2WwFGA3DZpeXNqKiwVlokRC+E5pK
	F+KIEG3+iJlAcmcdcattd68/CaaZP029cI+5/NlRlUP5OdFfoZc9db25J3SkGzncR7lZ
	Uvxt0Nk2HTldzSsCQNYoQir7KpdwYhju4Nhh8W5yhaqk4RIvqAi5ElqB4uSZMvmgnvdm
	s6q28hZwm3jCwTjByd9qodnNSD6DBm0pvSz9o0WQE4AmVhAyBceatoDXE4Mc2HYmm4st
	5NyT81IvoHO8JrXNmWOpW3mfwAOIDqgNieGHTjKtafHyxs81mYBABg1tHOhCl1O8wZ/n
	WjYw==
X-Gm-Message-State: AOPr4FVUxt3KJktoBU4N8GoooQarieaKy1guLb2QX5tY/MZaToeBdSHhu+4Ufv1tRXSBSw==
X-Received: by 10.55.40.219 with SMTP id o88mr23824881qko.23.1463425990735;
	Mon, 16 May 2016 12:13:10 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	b18sm15610827qkc.9.2016.05.16.12.13.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 May 2016 12:13:09 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 16 May 2016 16:13:01 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 16 May 2016 16:12:02 -0300
Message-Id: <1463425932-10080-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
References: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v6 04/14] weston: Add PACKAGECONFIG option for 'clients'
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
X-List-Received-Date: Mon, 16 May 2016 19:13:11 -0000

This allow Weston to be build without the clients.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6: None
Changes in v5: None
Changes in v4:
- New patch.

Changes in v3: None
Changes in v2: None

 meta/recipes-graphics/wayland/weston_1.10.0.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.10.0.bb b/meta/recipes-graphics/wayland/weston_1.10.0.bb
index 5885a7c..2fc5806 100644
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
                 "
@@ -41,7 +38,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
-                  "
+                   clients"
 #
 # Compositor choices
 #
@@ -75,6 +72,8 @@ PACKAGECONFIG[systemd] = "--enable-systemd-login,--disable-systemd-login,systemd
 PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland,libxcb libxcursor cairo"
 # colord CMS support
 PACKAGECONFIG[colord] = "--enable-colord,--disable-colord,colord"
+# Clients support
+PACKAGECONFIG[clients] = "--enable-clients --enable-simple-clients --enable-demo-clients-install,--disable-clients --disable-simple-clients"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-- 
2.8.2


