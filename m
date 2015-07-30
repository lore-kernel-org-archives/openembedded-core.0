Return-Path: <tobias.olausson@pelagicore.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2960B764B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 18:23:59 +0000 (UTC)
Received: by pacan13 with SMTP id an13so27737711pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 11:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5gli2mdLfGOcE3u6Ygqsj+EfLo3YzYjcVsaHbGB3aBw=;
	b=ReS9xzdpqseoQDU96P2vHOs079PNleyXuhoF1EtwxzBeBtujD+bWAE1s5XJchNvu0r
	NzPHvstc/FRoofSY9qU15aNfdPzxAilWW20UJ4A57Sc3Sf69LqzI31s0B41EvkDqzHVh
	2FGwDC4/bpfdOah0NJUqDhpMAJzWk3DhuMlembX+s0dw2Sb/eJgUPLKgoo2durejxzp/
	00o/B6FQoWzZ2i6AfL6IlwHNC5lLUNF1X0A4pZ59Phh/ZSFw5kmll382X0Omnf5qf1I2
	IsPny7laafD6e6O9fzruZ9tOShFD3QrhM+BLkWY3sR5cJjiyFWgEZ3hMoyxOPBrojfoZ
	N4BQ==
X-Gm-Message-State: ALoCoQnVs7oBD9SMOSCsiQ5ro4vw0sIFLVc7HM3Ztb9ku+P4UXxP6Go/Beohc8VbNcNGtW7X5aOm
X-Received: by 10.66.155.36 with SMTP id vt4mr110779019pab.32.1438280639662;
	Thu, 30 Jul 2015 11:23:59 -0700 (PDT)
Received: from localhost.localdomain ([38.104.105.146])
	by smtp.gmail.com with ESMTPSA id
	ph4sm3392773pdb.43.2015.07.30.11.23.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Jul 2015 11:23:58 -0700 (PDT)
From: Tobias Olausson <tobias.olausson@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 11:23:07 -0700
Message-Id: <1438280587-5379-2-git-send-email-tobias.olausson@pelagicore.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1438280587-5379-1-git-send-email-tobias.olausson@pelagicore.com>
References: <1438280587-5379-1-git-send-email-tobias.olausson@pelagicore.com>
Subject: [PATCH 2/2] Backports 9c746017af381884cc20c7cd563fc429c2c66112 to fido
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
X-List-Received-Date: Thu, 30 Jul 2015 18:23:59 -0000

Signed-off-by: Tobias Olausson <tobias.olausson@pelagicore.com>
---
 meta/recipes-graphics/mesa/mesa_10.4.4.bb | 2 +-
 meta/recipes-graphics/mesa/mesa_git.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa_10.4.4.bb b/meta/recipes-graphics/mesa/mesa_10.4.4.bb
index 8140411..da2f5c6 100644
--- a/meta/recipes-graphics/mesa/mesa_10.4.4.bb
+++ b/meta/recipes-graphics/mesa/mesa_10.4.4.bb
@@ -11,6 +11,6 @@ S = "${WORKDIR}/Mesa-${PV}"
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install_append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
-        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS$/#ifdef MESA_EGL_NO_X11_HEADERS || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
     fi
 }
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index cbe8911..5c35159 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -13,6 +13,6 @@ S = "${WORKDIR}/git"
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install_append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
-        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS$/#ifdef MESA_EGL_NO_X11_HEADERS || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
     fi
 }
-- 
2.1.4


