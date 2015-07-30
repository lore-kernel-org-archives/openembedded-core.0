Return-Path: <tobias.olausson@pelagicore.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id A4B8076527
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 20:48:39 +0000 (UTC)
Received: by pdbnt7 with SMTP id nt7so30084632pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:48:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hmyHbLyuTr2ts+w7Uyj+SKcnuXGhyHi3inzu51cyH34=;
	b=ALWbuibtjVfBkGdm/mk+AhA/3Y0YD5CTjiv8c5KoDhiqQSYFs3yCIXhe2hUx7WfCLo
	BEltYchE6ZEbLEZ+xTnHvtxVjZ5a/8HfTmahtthi04uFYZLPc6XBvsTeXikic0hlDjOU
	wbeRdhigj1RQp6ES+99JIffMvFASWpKDiZcAsC4uIqma48g2y6Be1nLMERKQhWYZ2SvA
	50iSu4/2rbVkexUNmbe+mVbIcL/FyvAd7ecXoKH0vloMfMfq5lBU8LQPtoolC8UNmPZ6
	fL7Wq/v8KMijfmK/JViEJYkXvzeRCY5CK9Uu4u34rxEb8Bl3m139J1W+RkjmTb52CHuU
	j43w==
X-Gm-Message-State: ALoCoQlh3duM46vIadHGRqYY7ryykt0diE5Z3+XL9r1nf0cxRoxxqtl7/PVdqDvlOuXJgHGGEXA/
X-Received: by 10.70.55.1 with SMTP id n1mr108488120pdp.21.1438289320280;
	Thu, 30 Jul 2015 13:48:40 -0700 (PDT)
Received: from localhost.localdomain ([38.104.105.146])
	by smtp.gmail.com with ESMTPSA id
	ow5sm3751200pdb.30.2015.07.30.13.48.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Jul 2015 13:48:38 -0700 (PDT)
From: Tobias Olausson <tobias.olausson@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 13:47:49 -0700
Message-Id: <1438289269-14804-2-git-send-email-tobias.olausson@pelagicore.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1438289269-14804-1-git-send-email-tobias.olausson@pelagicore.com>
References: <1438289269-14804-1-git-send-email-tobias.olausson@pelagicore.com>
Subject: [PATCH v2 2/2] mesa: respect MESA_EGL_NO_X11_HEADERS even with x11 in PACKAGECONFIG
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
X-List-Received-Date: Thu, 30 Jul 2015 20:48:42 -0000

From: Martin Jansa <martin.jansa@gmail.com>

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
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Tobias Olausson <tobias.olausson@pelagicore.com>
---
 meta/recipes-graphics/mesa/mesa_10.4.4.bb | 2 +-
 meta/recipes-graphics/mesa/mesa_git.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa_10.4.4.bb b/meta/recipes-graphics/mesa/mesa_10.4.4.bb
index 8140411..077cdbe 100644
--- a/meta/recipes-graphics/mesa/mesa_10.4.4.bb
+++ b/meta/recipes-graphics/mesa/mesa_10.4.4.bb
@@ -11,6 +11,6 @@ S = "${WORKDIR}/Mesa-${PV}"
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install_append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
-        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS$/#if defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
     fi
 }
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index cbe8911..31a2b6d 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -13,6 +13,6 @@ S = "${WORKDIR}/git"
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install_append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
-        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS$/#if defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
     fi
 }
-- 
2.1.4


