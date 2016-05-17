Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8C6CE731CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 16:38:53 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id n62so1782754qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 09:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=OikmhcAjCwtSObaKCpDK0MNySP+BGfPibiE0+oOQcVw=;
	b=EgtRSObOeEGxH9SlHKA3mHY700aoyWTZ9H4yKrKtOJNc/ekVUfwFOJc4AZk9Z2JuAQ
	PIST1bafEDKNNQedIlk2HbUaPTLMZk5WH/a6w6TjWpdMGv0TLTRmcNnAyRRzYnB/EE5r
	PmSnA+0wKjcESyI5PAOzr0YlQU2JTApGtXWC2iXUD+rYUupU/s5hmtNGDjooi8COXjj6
	dLiF6HfNIZwWWzhjPqwNZJuxRH2k1cyz0CjNQMyY9DOBKC3Ue1jusT3Wy7rxXiPqUnOY
	zffCUbAzax9MsIObDd4QgkdX0iVRFXVux7KLrVvSyYZ5EPD465beZSTUj+mjdTjv9dzR
	ttZA==
X-Gm-Message-State: AOPr4FWhUxwbdNQdbRKp7fOtp3++ropz3gIYabFzZws29C4Na6+HkHA1ReSIiyemzmvRgA==
X-Received: by 10.55.56.133 with SMTP id f127mr2823107qka.51.1463503134036;
	Tue, 17 May 2016 09:38:54 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	x129sm1707429qhc.29.2016.05.17.09.38.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 May 2016 09:38:52 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 17 May 2016 13:38:44 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 17 May 2016 13:36:25 -0300
Message-Id: <1463502985-5428-14-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463502985-5428-1-git-send-email-otavio@ossystems.com.br>
References: <1463502985-5428-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v7 13/13] core-image-weston: If X11 is enabled, add XWayland support
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
X-List-Received-Date: Tue, 17 May 2016 16:38:53 -0000

When the distribution has X11 and Wayland backends, we enable XWayland
support and include XTerm as a test application for the XWayland
backend.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v7: None
Changes in v6:
- Add xterm

Changes in v5: None
Changes in v4: None
Changes in v3:
- New patch.

Changes in v2: None

 meta/recipes-graphics/images/core-image-weston.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/recipes-graphics/images/core-image-weston.bb
index 52e271d..07ae70b 100644
--- a/meta/recipes-graphics/images/core-image-weston.bb
+++ b/meta/recipes-graphics/images/core-image-weston.bb
@@ -9,3 +9,4 @@ inherit core-image distro_features_check
 REQUIRED_DISTRO_FEATURES = "wayland"
 
 CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples gtk+3-demo clutter-1.0-examples"
+CORE_IMAGE_BASE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xserver-xorg-xwayland xterm', '', d)}"
-- 
2.8.2


