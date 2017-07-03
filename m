Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id A220A73068
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 20:02:19 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id l38so13907296uaf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 13:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=G+jTETA4aRyM2GdEbJNMkXc5JhwQKwAL6lJlkTsEV40=;
	b=gQ7eA7xq06xZetvLi0pwKfHipWC65AjYa5ONlgu1XKJbtMmJqThZDR2KvgzU4IxBiC
	VoivZj9vOYWyL9+tVK9r33IpYnynYmDp07wQnfgSo0LgpksMLde2VPIacLPJtbLqH8F+
	aDqYIxvAM97NL1AZyQCzposfiUB/HF0oeJxxr9tv41Pg/Jjf14NtXl3/s3/DhyJLTXiW
	ty6Qgx4G45Esm4XaFiNqWH164XWE2eRTy4Tv9NUHVWU4NY+EuTagdm1/erMIADViJKwW
	pk4rCbIpSjSRp9ZOJBkv9Axv9Y09kIprzpcQjxa2RZwcOg/a3hjTVoL8/kOlqsppYyid
	3q4A==
X-Gm-Message-State: AKS2vOzjVE+P09Gn8toIJv8+JmAr6XHIyP2vsI9v/ZiBbwySbUGF0m0+
	by71RaT6HVjoJ2hW
X-Received: by 10.176.9.73 with SMTP id c9mr19207239uah.145.1499112139802;
	Mon, 03 Jul 2017 13:02:19 -0700 (PDT)
Received: from localhost.localdomain ([179.105.243.125])
	by smtp.gmail.com with ESMTPSA id k9sm1159198uai.36.2017.07.03.13.02.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 03 Jul 2017 13:02:18 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 03 Jul 2017 17:02:11 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  3 Jul 2017 17:02:09 -0300
Message-Id: <20170703200210.32229-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.13.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 1/2] mesa: Avoid platform probing when building without EGL
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
X-List-Received-Date: Mon, 03 Jul 2017 20:02:19 -0000

The 17.1.2 release has changed the platform setting and when not
explicitly disabled it assumes x11 support.

Fixes:

| checking for x11-xcb xcb xcb-dri2 >= 1.8 xcb-xfixes... no
| configure: error: Package requirements (x11-xcb xcb xcb-dri2 >= 1.8 xcb-xfixes) were not met:
|
| No package 'x11-xcb' found
| No package 'xcb' found
| No package 'xcb-dri2' found
| No package 'xcb-xfixes' found
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables XCB_DRI2_CFLAGS
| and XCB_DRI2_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.

The issue has been exposed by meta-freescale BSP. Fix tested with
imx6qsabresd machine.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- new patch

 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 41747cffc8..a12ab7ab5b 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -49,7 +49,7 @@ PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1 --disable-
 EGL_PLATFORMS  = "drm"
 EGL_PLATFORMS .="${@bb.utils.contains('PACKAGECONFIG', 'x11', ',x11', '', d)}"
 EGL_PLATFORMS .="${@bb.utils.contains('PACKAGECONFIG', 'wayland', ',wayland', '', d)}"
-PACKAGECONFIG[egl] = "--enable-egl --with-platforms=${EGL_PLATFORMS}, --disable-egl"
+PACKAGECONFIG[egl] = "--enable-egl --with-platforms=${EGL_PLATFORMS}, --disable-egl --with-platforms=''"
 
 PACKAGECONFIG[etnaviv] = ""
 PACKAGECONFIG[imx] = ""
-- 
2.13.2


