Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2D72F780F3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 14:51:53 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id p7so6590426oif.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 07:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+9vqCrhooU++hH7LUYZMPJR7aHEvPDwPWC5FlULkAFE=;
	b=J5wGVigQ7Wi6p9b5pRCGLqPgvo8zs8cNTaPlRxWEGvcbxY+7d08O/hhVqTqr7NsyuL
	euEqtrox6D0NXyzJusxdlX5FSIxxmofE6k5vsF3t4AUjO6+ly+cu3ySLCYdXxt8euVeX
	a+ardTP2xyajeeLhX1p/xIZj/9FibgOQ8pL+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+9vqCrhooU++hH7LUYZMPJR7aHEvPDwPWC5FlULkAFE=;
	b=ukQgKG9GbJXKRe3rpXCk4DymhJan69xnLB0xSWQkOIp4Kd6bSbgMZQqgdPYSAvrjAK
	PuWTXzw7m/tyy/q+YrVQIzpgDY9+BIlGRK1GCzSCay31BhIC0q+nl03dB4icEPwiTUJy
	4cNiqNGneFEuJigfNdOcDeIvk7QFG4nfdr4CFCKaO37qX/xoPjDXNLZJTdNPtpbJU1q+
	KzTKz/+8pxs4IxXczftv0pzQYBNZqVIfHkUTQecjBON1b/Tf8vNyFpcPx6b/7lev+ixF
	jhIcsvqwgdsXOaG7HrhIER6j1whKEIgawtrGziodgiJs3+uDuG41bAmaarlGSPs+H5Q+
	huXw==
X-Gm-Message-State: AODbwcAGgg8I76nXyVLTIg5/Usf4uwPBKsqZAf3T/btbiQcsVvNCSS7F
	Rsf/SRYiA2UMQbZhbQPN2Q==
X-Received: by 10.202.80.209 with SMTP id e200mr3194270oib.18.1496847114759;
	Wed, 07 Jun 2017 07:51:54 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink67-82.telefonia.InterCable.net. [201.172.67.82])
	by smtp.googlemail.com with ESMTPSA id
	f35sm986880otd.15.2017.06.07.07.51.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Jun 2017 07:51:53 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 09:51:19 -0500
Message-Id: <1496847081-30528-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/3 v2][pyro] piglit: depend on virtual/egl
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
X-List-Received-Date: Wed, 07 Jun 2017 14:51:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[Backported from master.]

While building for Hikey using Mali 450 driver (r6p0), an
error like the following appears while linking:

  [  1%] Linking C shared library ../../../../lib/libpiglitutil.so
  [...]
  [...]/aarch64-linaro-linux/gcc/aarch64-linaro-linux/6.3.1/ld: cannot find -lEGL
  collect2: error: ld returned 1 exit status
  make[2]: *** [lib/libpiglitutil.so.0] Error 1

Mesa generally provides virtual/egl (along with virtual/libgl,
which satisfies Piglit's current DEPENDS) but that is not the
implementation to use with Mali.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
v2: No change, just resending.
 
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index d6bfb14..eae3eed 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ PV = "1.0+gitr${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "libpng virtual/libx11 libxkbcommon libxrender waffle virtual/libgl libglu python3-mako-native python3-numpy-native python3-six-native"
+DEPENDS = "libpng virtual/libx11 libxkbcommon libxrender waffle virtual/libgl libglu python3-mako-native python3-numpy-native python3-six-native virtual/egl"
 
 inherit cmake python3native distro_features_check bash-completion
 # depends on virtual/libx11
-- 
1.9.1


