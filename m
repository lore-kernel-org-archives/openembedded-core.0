Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id ACA24607A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 13:02:46 +0000 (UTC)
Received: by wguu7 with SMTP id u7so62660380wgu.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jul 2015 06:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y8Y+aW5TWrmvomcWLO6PJBkoRVpRcl/RBjjMnlAYRaU=;
	b=hr+dT2Qya4Kyb92kghx0dvfVZs5miTL00RY3nZ7oM3pcv25q50fBGywLsW+3Xz2txn
	NXmTWXrMGP9zCm0FFa6tyYXd1ArTWkIMEEm/mN4qLpDoL4HXxVw8DD5+Cs24Wczl+Ndv
	WlRS/YcLettS3E9rJoMKPqvomzuYfVtvAtKT76qXC68kJMpDgFRV4fldZ3DtXJE2/24n
	agb04cNOEjpspO6i/K2mE5/RUfotVWMc9J5/xlxNEbU+TxN8Uw+/clEz/Jv7wiYB7msw
	LuUysx2zA/LkEmsegDrQRh+2gnDPmF9RpOsnT71WtU+6c0zQXLGnxuegUnWqYVeOpvvM
	M7WQ==
X-Received: by 10.180.82.162 with SMTP id j2mr16828881wiy.54.1435842165872;
	Thu, 02 Jul 2015 06:02:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id e4sm8078016wjy.46.2015.07.02.06.02.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Jul 2015 06:02:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jul 2015 15:03:11 +0200
Message-Id: <1435842191-5106-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.4
In-Reply-To: <20150620103730.GD2398@jama>
References: <20150620103730.GD2398@jama>
Subject: [PATCH] mesa: respect MESA_EGL_NO_X11_HEADERS even with x11 in PACKAGECONFIG
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
X-List-Received-Date: Thu, 02 Jul 2015 13:02:47 -0000

* commit a5ebdb6ad8e4f94ac819275d55575230e057e4ae
  Author: Valentin Popa <valentin.popa@intel.com>
  Date:   Tue Feb 18 13:32:16 2014 +0200
  Subject: mesa: upgrade to 9.2.5

  introduced this do_install_append, but doesn't explain why it doesn't
  respect MESA_EGL_NO_X11_HEADERS flag anymore.

  Not respecting MESA_EGL_NO_X11_HEADERS breaks any build which is using
  qtdeclarative+egl in distribution which has x11 in mesa PACKAGECONFIG
  (e.g. my bitbake world builds).

  The problem is that qtdeclarative is using "None" symbol in
  QSGTexture::Filtering enum, it's possible to rename it in qtdeclarative,
  but it's quite invasive and changes qtdeclarative public APIs, see:
  https://github.com/webOS-ports/meta-webos-ports/commit/31aa85787a7513e279165a25f6f06ea72c576314
  so it was rejected by upstream and I don't want to maintain it in
  meta-qt5 - changing public API in OE build is even worse than if upstream
  does it.

* This change returns MESA_EGL_NO_X11_HEADERS flag so it's relatively
  easy to resolve this conflict in such setups by preventing Xlib.h
  inclusion.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa_10.5.8.bb | 2 +-
 meta/recipes-graphics/mesa/mesa_git.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa_10.5.8.bb b/meta/recipes-graphics/mesa/mesa_10.5.8.bb
index 7cfef0c..072cde9 100644
--- a/meta/recipes-graphics/mesa/mesa_10.5.8.bb
+++ b/meta/recipes-graphics/mesa/mesa_10.5.8.bb
@@ -9,6 +9,6 @@ SRC_URI[sha256sum] = "2866b855c5299a4aed066338c77ff6467c389b2c30ada7647be8758663
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install_append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
-        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)/#if ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)$/#if defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
     fi
 }
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index 8f70f67..c034517 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -17,6 +17,6 @@ inherit pythonnative
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install_append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
-        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)/#if ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)$/#if defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
     fi
 }
-- 
2.4.4


