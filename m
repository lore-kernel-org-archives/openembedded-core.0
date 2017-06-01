Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 798C377CF1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 18:48:43 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id h4so65321340oib.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Jun 2017 11:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CIyEyce2P4eY7OqCCu6IuBYKRodBO9lGk3uuiUPwZG0=;
	b=Ig6BcpuCyNjnzd71mqF8cZVDJJzweSaDfOcBA0ix+EF1RL0jhrRUlS4oIWg9N5MN91
	YFJXyhexCm7R8TEWok3x6GHv45h1I0BaIUjtjR2UBG3fgE+r//qrO7HXo+0pSZc8e8mN
	cxrjkcncTb+QWmRGX+fKW1gjzaOYhuEmfWTXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CIyEyce2P4eY7OqCCu6IuBYKRodBO9lGk3uuiUPwZG0=;
	b=ZmgpHTI6n5ywjP7r8XrSvkyHoSD0MS4uW8AIbcHDR62DMOQR2cvMpWtFk/Ek5wKynP
	XMnD2JAzez5d/J0eMroRTWlLum2ojPTpk+reFh6W8KP8Qs3D7MzBv6q8vwf9eWNFw08P
	JnmqNX3uNrXxM2q6u+34uPvjullEHNR88pYcyI34Bkbbsu1b9Ji8ib4U9nJCZ27+8zB1
	LZ+oqa7s0lfX/E14yzXrXXOo/lcPvDDQf6FulL2RtNKLPLSpYO+UWmFeZcyh7nmF5EkP
	1mqRsBxs4/nMCIyRKSqqvn9Q7NqovkflpUMCQ5QRR1308laMrnSjxwFFzoVp+qZeTEqm
	Szbw==
X-Gm-Message-State: AKS2vOwjEWuG2OonPDjPMbbc6IUDfKwLmtZ/Plqh6SRERBM/UKa2WLmK
	Ef2gSNfN2pNz70h/HmmEEA==
X-Received: by 10.157.82.134 with SMTP id f6mr2035952oth.24.1496342924865;
	Thu, 01 Jun 2017 11:48:44 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink67-82.telefonia.InterCable.net. [201.172.67.82])
	by smtp.googlemail.com with ESMTPSA id
	s4sm2161146ota.56.2017.06.01.11.48.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Jun 2017 11:48:44 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 13:47:47 -0500
Message-Id: <1496342867-22987-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] piglit: fix building issues regarding gbm_bo_map and a MESA test
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
X-List-Received-Date: Thu, 01 Jun 2017 18:48:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These patches fix a few building problems but are not being
taken into consideration at the moment, even though they have
been reviewed upstream with most of them merged (and accepted
already in OE-core master):
1.- CMake: define GBM_BO_MAP only when symbol is found
2.- util/egl: Honour Surfaceless MESA in get_default_display
3.- egl_mesa_platform_surfaceless: Don't use eglGetPlatformDisplay directly
4.- egl_mesa_platform_surfaceless: Use EXT functions for surfaces

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index eae3eed..2ea5779 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -5,6 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 SRC_URI = "git://anongit.freedesktop.org/piglit \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch \
+           file://0001-CMake-define-GBM_BO_MAP-only-when-symbol-is-found.patch \
+           file://0002-util-egl-Honour-Surfaceless-MESA-in-get_default_disp.patch \
+           file://0003-egl_mesa_platform_surfaceless-Don-t-use-eglGetPlatfo.patch \
+           file://0004-egl_mesa_platform_surfaceless-Use-EXT-functions-for-.patch \
            "
 
 # From 2017-02-06
-- 
1.9.1


