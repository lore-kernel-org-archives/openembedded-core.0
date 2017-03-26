Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6AA4677BD0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Mar 2017 19:59:12 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id n37so5102805qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Mar 2017 12:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=owjjsA1Nav8FO8rvF9flrpX3l0YvxUlbYrnIqNESwik=;
	b=M4yQd6etAuKQWn3cS/A79hCZ5KiNHn9Q0r+z/wCGnIE2EMZ9WUNh3ipcNZRPwGob1G
	tViMYmICSlAhdLnihMqHvgtx5CPjRljnrtOR/AJAHQJKg3OnOT4zwCzoFN8Y1NO5CsOD
	mAny+dhmlcR1Qgb30HzNM3wgU6Hs3vYA9iLg8hFM2SfEruxwVj0h1RR3a1ATRvPkUNb8
	0tCqYhoLm5ze2b4aHrCZgznF9iyN3VRIY8Pxe3+iRuCZLGp8Pin9MPW/+su8UXgksWJh
	achd7KjmmvpcTW2KnmZY1CMvDW0uJhlxkKAmHTMrYEUyrMTFpmj9iy2rhtmB5fFHGK+z
	cp4g==
X-Gm-Message-State: AFeK/H16+ZhO9fku2UJLRdLL/e/7/p+yLGVjLWXJ2oNs4P+QhRA2UJsxzAkXPHVAONv2tQ==
X-Received: by 10.237.49.131 with SMTP id 3mr17465218qth.174.1490558354376;
	Sun, 26 Mar 2017 12:59:14 -0700 (PDT)
Received: from localhost ([189.114.111.135]) by smtp.gmail.com with ESMTPSA id
	u63sm6407906qkh.45.2017.03.26.12.59.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 26 Mar 2017 12:59:13 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Sun, 26 Mar 2017 16:59:09 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Mar 2017 16:59:00 -0300
Message-Id: <20170326195900.15990-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170326195900.15990-1-otavio@ossystems.com.br>
References: <20170326195900.15990-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] mesa: Add Etnaviv and i.MX Gallium backend PACKAGECONFIG options
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
X-List-Received-Date: Sun, 26 Mar 2017 19:59:13 -0000

The MESA 17.0 has Etnaviv and i.MX support. Expose them in
PACKAGECONFIG for use.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/mesa/mesa.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 0f3dbb0397..0348bb2dbb 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -27,7 +27,6 @@ EXTRA_OECONF = "--enable-shared-glapi --with-llvm-prefix=${STAGING_BINDIR_NATIVE
 PACKAGECONFIG ??= "gbm egl gles dri \
 		${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)} \
 		"
-
 PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
 
 X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
@@ -52,7 +51,12 @@ EGL_PLATFORMS .="${@bb.utils.contains('PACKAGECONFIG', 'x11', ',x11', '', d)}"
 EGL_PLATFORMS .="${@bb.utils.contains('PACKAGECONFIG', 'wayland', ',wayland', '', d)}"
 PACKAGECONFIG[egl] = "--enable-egl --with-egl-platforms=${EGL_PLATFORMS}, --disable-egl"
 
+PACKAGECONFIG[etnaviv] = ""
+PACKAGECONFIG[imx] = ""
+
 GALLIUMDRIVERS = "swrast"
+GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
+GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'imx', ',imx', '', d)}"
 GALLIUMDRIVERS_LLVM33 = "${@bb.utils.contains('PACKAGECONFIG', 'r600', 'radeonsi,r600', '', d)}"
 PACKAGECONFIG[r600] = ""
 GALLIUMDRIVERS_LLVM33_ENABLED = "${@base_version_less_or_equal('MESA_LLVM_RELEASE', '3.2', False, len('${GALLIUMDRIVERS_LLVM33}') > 0, d)}"
-- 
2.12.1


