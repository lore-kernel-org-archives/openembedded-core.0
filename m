Return-Path: <tobias.olausson@pelagicore.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id AF2E4764B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 20:50:18 +0000 (UTC)
Received: by pdjr16 with SMTP id r16so30706703pdj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hmyHbLyuTr2ts+w7Uyj+SKcnuXGhyHi3inzu51cyH34=;
	b=hSHbATMEjFh2bGEsJYa3l8+MAkmgMOKqwWWHu9DESx1LjaC645WftBpjs6Xbwmb1FO
	thV0qQU7O1ZFm4OU2z33Md48lgQENIX2LdA3Z9pmvBZ226j+TV21/JtCK1ECUpk5spid
	UIVeNwDRqldf3wz8JhW2+pDeDDUl/DOp3Pww0x79dKgW7fCJeiBtAQCaUGd1XGU5QuJq
	8ER9JaCX59aGfxIkz1j9o3mQp8GWcqwQwwWWQw/c0QZJ6pn9u2VyjE5hhfa7RLOq24b2
	rNPF2KOvuYZqFF1jsMlnAOy3Pj63BkE171vTqpy+LKGJ/MJ4yCf3nrY2c46xu/RDTBul
	/dsw==
X-Gm-Message-State: ALoCoQnYWvBKZ3D5+cTTCb9z2GkYp+vM3wiCXwrtfyGqeQGJbWLGJCDQy47TAIePfI/C+CN1h3VC
X-Received: by 10.70.92.7 with SMTP id ci7mr32180976pdb.34.1438289419230;
	Thu, 30 Jul 2015 13:50:19 -0700 (PDT)
Received: from localhost.localdomain ([38.104.105.146])
	by smtp.gmail.com with ESMTPSA id r6sm3765731pdn.24.2015.07.30.13.50.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Jul 2015 13:50:18 -0700 (PDT)
From: Tobias Olausson <tobias.olausson@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 13:50:03 -0700
Message-Id: <1438289403-15083-2-git-send-email-tobias.olausson@pelagicore.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1438289403-15083-1-git-send-email-tobias.olausson@pelagicore.com>
References: <1438289403-15083-1-git-send-email-tobias.olausson@pelagicore.com>
Subject: [fido][PATCH v2 2/2] mesa: respect MESA_EGL_NO_X11_HEADERS even with x11 in PACKAGECONFIG
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
X-List-Received-Date: Thu, 30 Jul 2015 20:50:18 -0000

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


