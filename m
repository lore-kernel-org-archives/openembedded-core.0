Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id BCE3B62136
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 19:13:20 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id n62so8757500qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 12:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=AmTiJa3e8hHWwb6os/IO3uZsyITRgSFzlKrrX4q91f0=;
	b=cuXnOi73s5uSJTmGnjXP61BKQuc/CBt9UHomKJ9YlJB7r8gXuvK2d55zZQ2PQMEHaG
	Nt5EX0lJj7Bae24mvwJJDprV7t2jqQy8SKA3CWYRMMXu3MWHY3OenulLWAILZaKynCtz
	Zi/VSnm6HhsslBcA1iYtjaPobeTQUIgeB2G4R3yGANxblR3ta8DW3Jqu3QBa1bxzWB3B
	IG/VWeG3+e/ZvE1BR/o7heQiNmhrd8ie2wbO5KY8lGXFsc9XND0OYHhmaO8TwbpzVT1e
	ABupFCa3Q5k4rBhOzJh7LcNHCWKlEvvgQkVx44z2qfXwDCfBhzWrh3pz8tSPnB3OQdpJ
	LHrw==
X-Gm-Message-State: AOPr4FWxyHYr8Phg0JRhpvGbXqbmlcVPp2zDRCqXDIuAk0Sf7kxqyhgrw8FQaLNEZH5beA==
X-Received: by 10.55.132.3 with SMTP id g3mr33095421qkd.126.1463426001571;
	Mon, 16 May 2016 12:13:21 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	e63sm15433566qga.17.2016.05.16.12.13.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 May 2016 12:13:19 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 16 May 2016 16:13:11 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 16 May 2016 16:12:03 -0300
Message-Id: <1463425932-10080-6-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
References: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v6 05/14] weston: Enable XWayland when X11 and Wayland support are available
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
X-List-Received-Date: Mon, 16 May 2016 19:13:20 -0000

When the DISTRO has X11 and Wayland support enabled, XWayland ought to
be enabled by default.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
- Remove PAM requirement

 meta/recipes-graphics/wayland/weston_1.10.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/wayland/weston_1.10.0.bb b/meta/recipes-graphics/wayland/weston_1.10.0.bb
index 2fc5806..1e89a8e 100644
--- a/meta/recipes-graphics/wayland/weston_1.10.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.10.0.bb
@@ -36,6 +36,7 @@ EXTRA_OECONF_append_qemux86-64 = "\
 		"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                    clients"
-- 
2.8.2


