Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0EF79700F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 14:31:20 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id l68so3184369qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 07:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=AE5qadnHNkifsKmkfArS/pO5YbZnoN/1Eg7JK8JrNWI=;
	b=GTC8Rb7K/c0KUT6PO+BVufpRonLDJI3D4olbKP5TWYjvxF8pn5pftAmZaVyovu4KUN
	/UyAB7CEpd/Yr0McMMVwn46FSjJxKgXgn2GbUyB19MqO3GrCupOiZtWaPdRvRwmVhJLy
	irkJ725lp/Z2h5skbUv9OFX1BCo9qJb4fK7wN8gaiJJLTQXIdqX+D261Ciqc/ZMaXRhu
	uX9aaEv6OprvGBaENDWwJm3/kZz2/6mE6BphOsavTF68hXNYWhJ7X5e/rOOftrUkY3jy
	lWKtryOoEDOsU0GvQbWBgP7gr1dP+YBAVe/qdUWuGns/0GgtYUZ/ayev6ntYwy36PkSx
	xntA==
X-Gm-Message-State: AOPr4FWx2b2lCPRxjTklP/VTkyaOV+HSjUlobFl1ab1JpruJYirdyhW8mrgWxgwzsDcp4A==
X-Received: by 10.55.80.131 with SMTP id e125mr4039208qkb.62.1462977081827;
	Wed, 11 May 2016 07:31:21 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	z197sm3514601qhd.35.2016.05.11.07.31.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 May 2016 07:31:20 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 11 May 2016 11:31:14 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 11 May 2016 11:30:35 -0300
Message-Id: <1462977042-7436-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462977042-7436-1-git-send-email-otavio@ossystems.com.br>
References: <1462977042-7436-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v5 04/11] weston: Enable XWayland when X11 and Wayland support are available
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
X-List-Received-Date: Wed, 11 May 2016 14:31:21 -0000

When the DISTRO has X11 and Wayland support enabled, XWayland ought to
be enabled by default.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
- Remove PAM requirement

 meta/recipes-graphics/wayland/weston_1.9.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/wayland/weston_1.9.0.bb b/meta/recipes-graphics/wayland/weston_1.9.0.bb
index f703f39..beaa3f2 100644
--- a/meta/recipes-graphics/wayland/weston_1.9.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.9.0.bb
@@ -38,6 +38,7 @@ EXTRA_OECONF_append_qemux86-64 = "\
 		"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                    clients"
-- 
2.8.2


