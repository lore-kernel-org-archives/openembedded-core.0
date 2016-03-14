Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id E0C1B60124
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 18:46:57 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id t4so161907912qge.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 11:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=IXflHauBkj3bo+koZYdhgBuaL5A7lHusEna7WoLoDiw=;
	b=T2KsHVT4gy0BMccU2CMML1EN0t2zsKBd1atAR/J9rfA4gE2hFFxxxHg+IV+PonLeKH
	GxkAlX8oFJCK8J920AJhMtn8ITO44e2hgtkB/s0TIA/R8WoKwaDqQwCw6g2OrjhfSbuY
	OG8YgDFxtF7e23Ya6TdkM2fCt7Z61H2NOG1IPGHP78vSk5/F25guUVAb9mem2nuhPxpB
	NYqOBt1g6jzoCJgtw1KXW7yxl6x0UqIUfHcE660G2JTw8HfLQdqh8WP83JgxxZXN7Pk9
	39GWfodVGjqSfeEcPPrmeBl5VrVVkrXs8de35gqoIGQuC9KQ2hUj7GSt/DlKLPgYhIJM
	s1Rg==
X-Gm-Message-State: AD7BkJJiVkJCMzWlS+VS8IolfVIySSgmmheTkGBSPs1kjtltXJoY3eQ8aADAQZtRjREaIA==
X-Received: by 10.141.7.135 with SMTP id j129mr33994017qhd.71.1457981217916;
	Mon, 14 Mar 2016 11:46:57 -0700 (PDT)
Received: from localhost ([177.127.4.103]) by smtp.gmail.com with ESMTPSA id
	y206sm10868676qhc.0.2016.03.14.11.46.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Mar 2016 11:46:56 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 14 Mar 2016 15:46:52 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Mar 2016 15:46:50 -0300
Message-Id: <1457981210-23532-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.7.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] libsdl: Only enable X11 support when the DISTRO supports it
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
X-List-Received-Date: Mon, 14 Mar 2016 18:46:58 -0000

To allow the use of Framebuffer-only distributions we cannot force the
existence of X11. This fixes:

,----
| ERROR: Nothing PROVIDES 'virtual/libx11-native' (but
|     virtual:native:.../meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
|     DEPENDS on or otherwise requires it)
`----

Error catch by O.S. Systems' autobuilder.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 9c0ec54..775abb9 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -46,7 +46,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d
                    ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-PACKAGECONFIG_class-native = "x11"
+PACKAGECONFIG_class-native = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 
 PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib"
-- 
2.7.3


