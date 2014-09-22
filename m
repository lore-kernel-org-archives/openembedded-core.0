Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1A4EE60030
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 12:12:40 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id a1so2535995wgh.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 05:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xwjmkQbV9qJhUVGisnAjAwRGRwEjJ978lm5WsDOenbI=;
	b=jNXEtwlHeaHvAE1H2uGlVP4qeLRcRYxx2NXJLcvaI19OK88A+caNbnrqG+m1vnyLyo
	AkYaEBx+DRjzk+mY8Vsiazmq/+o3L5BtKdXTXpw0WN4ReKBHH3THUjpsA/qdZu8a9Aff
	YreuFvvh/KDmvUujuqrGVH0QpoPk/Sewk4WiS4L/U9HtR7FNcahUoJuQN+pyoX2IO7/H
	9GHOU8zx+qk662FrC8xddPR6FTzRU9D86sviMdPR2dfKEoHaLoKaugSrEwSxMfjv2Ffb
	rtPKAJsFUnXc8uTN96Peko9fxQQ1fnxx5U1e1+pWpIc8iagjDEUBhWMulpiUMKdUU/dO
	a9Kg==
X-Gm-Message-State: ALoCoQkJkD3EPd9mwZAckmTHN+VtSfKTkh21tDR3zmW29RneLUfMwUGt/BPOOZmw6GFQVQORpKTU
X-Received: by 10.194.220.7 with SMTP id ps7mr20238898wjc.28.1411387961286;
	Mon, 22 Sep 2014 05:12:41 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id
	au4sm12119588wjc.15.2014.09.22.05.12.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Sep 2014 05:12:40 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Sep 2014 14:12:32 +0200
Message-Id: <1411387952-22717-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] libpng 1.6.13: fix build for aarch64
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
X-List-Received-Date: Mon, 22 Sep 2014 12:12:42 -0000

The configure override was too restrictive, it needed both 'arm' and 'neon' to trigger, which breaks on aarch64. Since TUNE_FEATURES is the only qualifier that matters, drop the 'arm' override.

Buildtested for 'genericarmv8' and 'qemux86' machines.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-multimedia/libpng/libpng_1.6.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.13.bb b/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
index 0c6fd1f..8798a96 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.13.bb
@@ -19,7 +19,7 @@ BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 inherit autotools binconfig-disabled pkgconfig
 
 # Work around missing symbols
-EXTRA_OECONF_append_arm = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
+EXTRA_OECONF_append = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
 
 PACKAGES =+ "${PN}-tools"
 
-- 
1.9.3


