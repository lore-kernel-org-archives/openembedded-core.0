Return-Path: <tobias.olausson@pelagicore.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id DC76F764B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 18:23:36 +0000 (UTC)
Received: by padck2 with SMTP id ck2so27309318pad.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 11:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FUhCel1naodmvXhCucSpI5mN1LbtENj1iboVjE7pc+M=;
	b=MvTqKpwXHdKB6dxMFLaSY8p/To9qQWx2tP/qW3YIM9TidxMpH0R9JdVwfd90MN2I/O
	fpi7Ehs5w3v+324aDlrDohdMEj7U3vjlrGKYV3cmyvElZHbHaB+hSA2p2k4absWbv+eR
	/DpjgNdoFym5uHOW7YVa6vnPDAwGTKJtcNU1b9aUURfHKnNq73eDcjC95PuevsGDVI9H
	2Y90FXDFqvJOzebxI5YQmsOkCLm8/Y5+bBmnZYfEkQjDp0XuvOSAWw5zuNejwhru/SQ5
	ZxSxpBQDVV1m5Y6zniqSvGiI2kDzwR1/Wmb3Vf+poPE6VyLD/8VQzm+pa9dzSukNzLns
	WDHg==
X-Gm-Message-State: ALoCoQmRgqOq7fjuNXsmmNC5Xlm+eUgg0mUUgFuRCJGEellloC9ObIPdphe/Pb086TG12RyjPLrh
X-Received: by 10.66.190.168 with SMTP id gr8mr109420093pac.22.1438280616022; 
	Thu, 30 Jul 2015 11:23:36 -0700 (PDT)
Received: from localhost.localdomain ([38.104.105.146])
	by smtp.gmail.com with ESMTPSA id
	ph4sm3392773pdb.43.2015.07.30.11.23.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Jul 2015 11:23:34 -0700 (PDT)
From: Tobias Olausson <tobias.olausson@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 11:23:06 -0700
Message-Id: <1438280587-5379-1-git-send-email-tobias.olausson@pelagicore.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] Revert "mesa: fix do_install_append"
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
X-List-Received-Date: Thu, 30 Jul 2015 18:23:37 -0000

The commit changed an #ifdef to #if defined(), but the source
code for 10.4 branch of mesa still uses #ifdef.

This reverts commit 12e467f436fbc22f274558c753f0ac9756ce1071.
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


