Return-Path: <francescogiancane8@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 43E286FFA4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 09:48:49 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id t69so2240368wmt.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 02:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=peXpa7Vg5GDDAvd8o/nFdri8wwjD0PG2apQ5Z/4xJ2s=;
	b=kbFbgcR1ucwy1Cy+grKINRj6dUPOjRqDQy1MW0wyBu+2oia4l2QlMevl9BU95LtCe0
	+jsB7J2nrxRSZQgWdcAczlSR99q1YD5eGvrzOdFQ+xaewDxUyDfPxflEjCPdbjPRGuUz
	tQEFDdvNzAh8vr8IB2wAaRV8I3NiqjZowqBEdH3HA8ozBR4v9FDHJJT4+CFjFUn5gTTg
	IkoM2CrjeiDNVq2SHptDA7ReR90E34xoEx2xJb8lIPdTJubatlb98R+vM95JXtvI6EwA
	OIUtppB+WtwetULvaBAplpZ6xZQFUvu1HzZGhUgHYbdoMIs+eKkT0QT8G1iRfTzrfJ5u
	bzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=peXpa7Vg5GDDAvd8o/nFdri8wwjD0PG2apQ5Z/4xJ2s=;
	b=nKSkOmfKbhFFPWtbOWZ4T2YsGSLbpM44i5fH57iq7/8nUYHRx6pkd+SF12w146qyNi
	jXUgqklxMrPoMZh27WtzOjlSSJws/XOutHPesQNVREa4r8afKqbzwUnCzNPAAdNB9mL5
	pcYoqnmgKbtY6tpUImpVygMkxE77vodmBzCtxSaQmQQYV3Bzc3cMFEbSKt0rC0GrXw+Z
	9y7ucqhTesDmC/6moehPKO/dGMaUG4IKoYDxuejBDKS7D7Yd41AMYHP/1sQnaSYc1NJ5
	EQRRYuj5sQvqKEw8RbtaFYsUGL+4NCkJJLtBO964hYFMVQkWBcv+I7nJXzXLmf8FUlTZ
	jJMg==
X-Gm-Message-State: AHPjjUj/qpb+2561vDkEe5r2Hy4tf+BmI6BCNsfwrLhut9/NpomJ29iv
	U9GbmdAH6+JKCfqiSsQOedFtgJrt/QI=
X-Google-Smtp-Source: AOwi7QDHRWbqDMxOggdc38ac3uBBItbIjlyXRG4izS6KJaUYARYUe21Ley8F2H7Kq+dKOlxbJoJsTw==
X-Received: by 10.28.165.1 with SMTP id o1mr3927794wme.31.1506678530417;
	Fri, 29 Sep 2017 02:48:50 -0700 (PDT)
Received: from localhost.localdomain (giancanemac.polito.it. [130.192.12.68])
	by smtp.gmail.com with ESMTPSA id
	k126sm3293705wmd.1.2017.09.29.02.48.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 29 Sep 2017 02:48:49 -0700 (PDT)
From: Francesco Giancane <francescogiancane8@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Sep 2017 11:47:02 +0200
Message-Id: <20170929094702.5334-1-francescogiancane8@gmail.com>
X-Mailer: git-send-email 2.13.5
Subject: [openembedded-core][PATCH] xorg-xserver: fix building of the package when different virtual/egl provider are selected
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
X-List-Received-Date: Fri, 29 Sep 2017 09:48:50 -0000

xorg-xserver fails to build when Xwayland feature is enabled on targets which do not fully
support mesa and/or have different vendor-provided openGL stack.

I.e. in the case of raspberry pi 3 the recipe 'userland' provided
virtual/gles2
virtual/egl

Doing some checks revealed that the correct package is egl and NOT libegl,
as wrongly stated in the PACKAGECONFIG[glamor] dependency.

This patch fixes the issue.

Signed-off-by: Francesco Giancane <francescogiancane8@gmail.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 863d80ce43..33fe66844e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -133,7 +133,7 @@ PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2,dri2proto"
 # DRI3 requires xshmfence to also be enabled
 PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3,dri3proto"
 PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,glproto virtual/libgl virtual/libx11"
-PACKAGECONFIG[glamor] = "--enable-glamor,--disable-glamor,libepoxy,libegl"
+PACKAGECONFIG[glamor] = "--enable-glamor,--disable-glamor,libepoxy,egl"
 PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 PACKAGECONFIG[xshmfence] = "--enable-xshmfence,--disable-xshmfence,libxshmfence"
 PACKAGECONFIG[xmlto] = "--with-xmlto, --without-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
-- 
2.13.5


