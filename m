Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 36BE77807E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 18:22:43 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id w10so65141109oif.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 11:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=t22SN/Mi5qMM4duCzsAJsKbLiC9LzWNfowoacKODTCI=;
	b=TrnOrb76JFoe+GG2z8FWZmHrPbw6Wl4Ks3flp2z9G4rQDxm7fb+7BeWYLCWzkTNpAY
	KhqP61lLoeyrLjDTrkU3G66KfBk5OSjPXUrFy+Ktmw2hqPET37NmlcFg79H4UYPj8HIK
	3ctqluL4BxiF3r9Q6eDlextQ1r0/XmIdbG9D4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=t22SN/Mi5qMM4duCzsAJsKbLiC9LzWNfowoacKODTCI=;
	b=lmLsLOUD4eGmowPUC86VBOLJUN4Fmmsu4iyzl4QxnW+EtgKGyRBBLoL/71lOh4RmFM
	H3agluiU1XiaF2c+cWQWb95PVhHY968Zbp7xnSFt8lSbsfmMAZC23OHexd/hi4yc1Xi+
	772PGj6Vp0nP8mEe6+esB/8mY+AgINjVUkaukt9OiJDeF4DZpGPX33JOw6oIc4MkTytT
	gLln1TCRyiNdfT0x93/ENyqszcZuZtnYThO/bdT9K7opOORR/hM7s14HBO9rq1o+Y+w+
	E2qke19MmxGjWl/TntekDunaPq7VFzndLoD/ylWCANPi0mZ1fPZJhbmMB7SvSwpfp93V
	7BDg==
X-Gm-Message-State: AODbwcDClqK00pZxLdlnM8eDKOt8umy+yK4eMj87XqkCJ3bSDSM2Icbq
	YB1rKAcYrxyofAzN
X-Received: by 10.157.48.116 with SMTP id w49mr3482169otd.142.1495131765152;
	Thu, 18 May 2017 11:22:45 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink67-82.telefonia.InterCable.net. [201.172.67.82])
	by smtp.googlemail.com with ESMTPSA id
	c10sm2863501otb.38.2017.05.18.11.22.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 May 2017 11:22:44 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 May 2017 13:22:35 -0500
Message-Id: <1495131757-7261-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/3] piglit: depend on virtual/egl
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
X-List-Received-Date: Thu, 18 May 2017 18:22:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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


