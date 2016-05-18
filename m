Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id 608BB77085
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 16:41:46 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id f74so4636948qge.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 09:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=W09uFNjNMA0nQy+Pe/lawlPFS1WDqxuvtNyTQwQIiCg=;
	b=ekT+3z6GuZ6XYQrKsGpt6AtFbIACquqo6lk5V7J8/+AJ6FyyYQEOp7R8r7rzgmd90H
	o90b+4vdr3ja+tv2Q9iOu6NvWxhn8gdp8Hjs8bvnXKghgnShUVe44n5S0aJ7h90mpx36
	IgAC4sxpns8wyOFS8B23dwM9rJj2YXFhhJ3aH0q9Qrp2uNdaIzaiG0q2QNRINGuJ1heP
	89kwMhF1X/K+EYWMz4Fq/MBLANICX2kEmGtQRrMVe7qSM0X4rMLdKGSyWOIp2rPf+kgi
	wzDznbcZI/iJXgEYztYeRUN3CJ24ra2dC/a1wJZdE6tWAyYGZux65FxbgJ7s9e37F8B/
	J80A==
X-Gm-Message-State: AOPr4FVfvP7HGDZJqHxJvKUh62WqPWK96+zZD1/kjR6LLKyBufsOZ6v+MsOMWHZ7AlPMbw==
X-Received: by 10.140.218.202 with SMTP id o193mr9018065qhb.33.1463589707162; 
	Wed, 18 May 2016 09:41:47 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	z197sm4509741qhd.35.2016.05.18.09.41.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 May 2016 09:41:44 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 18 May 2016 13:41:36 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 13:40:39 -0300
Message-Id: <1463589648-28641-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
References: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v8 04/13] weston: Enable XWayland when X11 and Wayland support are available
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
X-List-Received-Date: Wed, 18 May 2016 16:41:46 -0000

When the DISTRO has X11 and Wayland support enabled, XWayland ought to
be enabled by default.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8:
- Split XWayland module in a package (Ross)

Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
- Remove PAM requirement

 meta/recipes-graphics/wayland/weston_1.10.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/wayland/weston_1.10.0.bb b/meta/recipes-graphics/wayland/weston_1.10.0.bb
index 16e961d..5771249 100644
--- a/meta/recipes-graphics/wayland/weston_1.10.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.10.0.bb
@@ -38,6 +38,7 @@ EXTRA_OECONF_append_qemux86-64 = "\
 		"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                    clients"
@@ -91,11 +92,15 @@ do_install_append() {
         fi
 }
 
+PACKAGE_BEFORE_PN += "${PN}-xwayland"
 PACKAGES += "${PN}-examples"
 
 FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${libdir}/${BPN}/*.so ${datadir}"
 FILES_${PN}-examples = "${bindir}/*"
 
+FILES_${PN}-xwayland = "${libdir}/${BPN}/xwayland.so"
+RDEPENDS_${PN}-xwayland += "xserver-xorg-xwayland"
+
 RDEPENDS_${PN} += "xkeyboard-config"
 RRECOMMENDS_${PN} = "liberation-fonts"
 RRECOMMENDS_${PN}-dev += "wayland-protocols"
-- 
2.8.2


