Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0700C70179
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 22:49:56 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id r184so34523304qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2016 15:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=OP4z2w4riKbEotZNlSaUvJzXyeNQJCek4gLpQwj0r84=;
	b=IF4nlNpQ1CzRM2dibBx2UY7m53I0qTrMbmMmiRppKxAN2IYyEl7eMsypYKJsM7Ic5D
	eJjBBD/otUOvFibiGc4lcZRJ1AQNE/ldw07jX+W6GfSVHmSQfxMf2JsbfbByMhz+SEkL
	f+ztvojZ6KXXE3XPO7fdsts8eHTfN7FfByXBKhIxP0nZIdrdy/P/uKFKPRfs5/BV7jk3
	3/PL6ApnswnmRq8DLYyfjh6DAr5BPgej+v3PxuUE94bW/rrxVFXdrvR1wVDZiW51G0jg
	AFfrSj1sG4Pje4G4ytGXoJdNEkkIplCE90mlZcfMf4WE2LqepYGC8+aEMJFS6o7dnF7V
	qOOQ==
X-Gm-Message-State: AOPr4FW8Itgfxl0fhjJzo4R+p361FxIO848+j0QIR30EM0NhwcHdYbnN0tM6MwZ1WF3tBw==
X-Received: by 10.55.123.130 with SMTP id w124mr12021549qkc.164.1462402197633; 
	Wed, 04 May 2016 15:49:57 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	f65sm2245318qke.46.2016.05.04.15.49.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 May 2016 15:49:56 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 04 May 2016 19:49:50 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  4 May 2016 19:49:33 -0300
Message-Id: <1462402180-16861-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462402180-16861-1-git-send-email-otavio@ossystems.com.br>
References: <1462402180-16861-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v3 1/8] weston: Enable XWayland when X11 and Wayland support are available
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
X-List-Received-Date: Wed, 04 May 2016 22:49:58 -0000

When the DISTRO has X11 and Wayland support enabled, XWayland ought to
be enabled by default.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3: None
Changes in v2:
- Remove PAM requirement

 meta/recipes-graphics/wayland/weston_1.9.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/wayland/weston_1.9.0.bb b/meta/recipes-graphics/wayland/weston_1.9.0.bb
index 16a788d..124a16c 100644
--- a/meta/recipes-graphics/wayland/weston_1.9.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.9.0.bb
@@ -40,6 +40,7 @@ EXTRA_OECONF_append_qemux86-64 = "\
 		"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                   "
-- 
2.8.2


