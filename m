Return-Path: <tobias.olausson@pelagicore.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6B78875FB5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 20:50:16 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so30081228pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+lJQDzmq6/eMYf5siHfDjzAO4KJgIHV9V/IV48YI70g=;
	b=fpHhHS4j0uYFOQ08HSGjU8CSiayNSTnD8XkQxSxRWxn3pdMOBaPmuo9duBullIiyeA
	m+z8nY6IXlMe0wFVUoYa23x+wzEi94ZIuLP3iYQScMgux1gprwnkUv3HWgNWIyeihTld
	XcSY5bKeKZHWzbD0L/KN8SYMPzdn1xQDNqh9DCgAyMmtd3JO2/uiqwHqQR1Qy9Cp6XMU
	RN+lsVgaCToiPlPnsvVISWE/9QGO7NWRWe1cUHiBLH+7h9d3Q/MJeIqSrMr2qVdAwBzp
	qNqDEpMx0aQMzcEVQhEEwP8gWmEQ/lHl1+vA4sgqfKxI5JFI9Ipu7GoiMMJ4CbNgUrWF
	vlsQ==
X-Gm-Message-State: ALoCoQmkcVWByFnxgweSCRBCTgEUid86ttgwLIBTYYPQ7FGmRnSV90B8ufdMi7LgbR+KlXjrysNa
X-Received: by 10.70.87.195 with SMTP id ba3mr111732236pdb.154.1438289416520; 
	Thu, 30 Jul 2015 13:50:16 -0700 (PDT)
Received: from localhost.localdomain ([38.104.105.146])
	by smtp.gmail.com with ESMTPSA id r6sm3765731pdn.24.2015.07.30.13.50.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Jul 2015 13:50:15 -0700 (PDT)
From: Tobias Olausson <tobias.olausson@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 13:50:02 -0700
Message-Id: <1438289403-15083-1-git-send-email-tobias.olausson@pelagicore.com>
X-Mailer: git-send-email 2.1.4
Subject: [fido][PATCH v2 1/2] Revert "mesa: fix do_install_append"
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
X-List-Received-Date: Thu, 30 Jul 2015 20:50:16 -0000

The commit changed an #ifdef to #if defined(), but the source
code for 10.4 branch of mesa still uses #ifdef.

This reverts commit 12e467f436fbc22f274558c753f0ac9756ce1071.

Signed-off-by: Tobias Olausson <tobias.olausson@pelagicore.com>
---
 meta/recipes-graphics/mesa/mesa_10.4.4.bb | 2 +-
 meta/recipes-graphics/mesa/mesa_git.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa_10.4.4.bb b/meta/recipes-graphics/mesa/mesa_10.4.4.bb
index 90cccbe..8140411 100644
--- a/meta/recipes-graphics/mesa/mesa_10.4.4.bb
+++ b/meta/recipes-graphics/mesa/mesa_10.4.4.bb
@@ -11,6 +11,6 @@ S = "${WORKDIR}/Mesa-${PV}"
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install_append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
-        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)/#if ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
     fi
 }
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index 1598019..cbe8911 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -13,6 +13,6 @@ S = "${WORKDIR}/git"
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install_append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
-        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)/#if ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
     fi
 }
-- 
2.1.4


