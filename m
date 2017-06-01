Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 53D1777E17
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 15:37:27 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id w10so58670011oif.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Jun 2017 08:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=No9SOiyoo65oACywIcnQimZ89YPMwnUCKyu0sI6d4To=;
	b=hTB6iHd5Hgo4cTJEUVvUMFEKfPV5CnWTnNp3IDVQvNJlGQOTWVB8nWS/1/fe7U4ZIr
	KLgI7BTO217PatdV/+OLT6Zp7r6WuqlxTfMTwKfzwWd3VwvYSkMEgPv/8wRhbKqAmMGs
	Un0oPMpBUPuQ5atReIb6MjifoDE9Gdo955IXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=No9SOiyoo65oACywIcnQimZ89YPMwnUCKyu0sI6d4To=;
	b=ANVW7qB5pveZlIwxWQdzj5A/OkhbJhW4fg/vnTWEMquKFioe0Bsd2P6Htck6HWAKxx
	G7c3HpaCMVQ73BC20WN3Q8l9t6syTA3wpqAcfxjWf6uEb6Z3Ffuws8+USpEoD2IqPbxc
	vA2Zrmmr1478vJqfIlZJZfuMwf0R61iZ7Rz4XwRpfOlzFgHcJRFMce5XSGcm4rtFzm5+
	1Ad8BAHOq3wm8v8vIj7+Bra7QjScmJddN9r7jAMeg8m0CLJSrI8yNBT67JO6ympk34+j
	7OQQuRwI1LFnzTsdmG2rpFPpL1psd3+SYwvVJgN09TTmRVm5+rceSAUBa3FtyHJhEuo1
	UdNQ==
X-Gm-Message-State: AODbwcDrygNbo5sq6dUr6mYRcGKuLRmuYm9V+RrDKwq9tQpMwGjH8kui
	jnIA9FQCp3fPl4qYKlUfPw==
X-Received: by 10.202.204.141 with SMTP id c135mr1503254oig.187.1496331449171; 
	Thu, 01 Jun 2017 08:37:29 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink67-82.telefonia.InterCable.net. [201.172.67.82])
	by smtp.googlemail.com with ESMTPSA id
	c50sm9088799ote.29.2017.06.01.08.37.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Jun 2017 08:37:28 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 10:37:04 -0500
Message-Id: <1496331426-6553-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/3][pyro] piglit: depend on virtual/egl
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
X-List-Received-Date: Thu, 01 Jun 2017 15:37:28 -0000
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


