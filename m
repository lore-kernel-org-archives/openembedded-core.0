Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5181574588
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 11:52:46 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id r63-v6so5422450wma.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2018 04:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=V2i2A0D2ZwcNX1Q5foVvEc0XTq5f4FcImaJVp7UxmXU=;
	b=mRJrt8Ldo725pW+uKEMDDSFkSL6IJDLdDEedD7UVw4zcXJQiS/H2MDyBW/fAQfWBMj
	JwA8EbYdqGcbK5Xgic9Dc5M6YftkqTJOV0K7YOtFkcl1t6oJ/1cKOQGJFpzfwyVo2xhc
	poZ7sxUJ/B5Ijtj61B5SJBm0sno3PgsMz0q0Titqvm8p6k2ttAln5hs2Im3qHyP5/HDY
	VtzoxoyngqhP1XD0rFSfTXBKGYX5qp0DJSyWPaTTV9ybNXsYbR1Dh2Q6hiQF9+8tv4Dq
	ZSy+5k7YzzDKs6DjbinQ8AEEAstzXs4OVNBu3FeEiVOm16jO+rSbCanuMieyb4pP4IUn
	MRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=V2i2A0D2ZwcNX1Q5foVvEc0XTq5f4FcImaJVp7UxmXU=;
	b=DS8FoHACTHBWtLg7Ha5Brf6R3T9wtSKPHza4w5+wMU+O/KzAK61ETfua70ryjSOm1P
	XYT3+nmnAlrsG9h2BcLLAcXR//RC/JusCtd2NA98lr7uzctmawdW233l2dQtXY0kc1CB
	tigP4tiwlf4Gk8fdD11JuXW6i8qsaBQN+vKzv+ScUQ5zwY2yAhchbBAFPQ5N5qYaIx2J
	9XlibiU6it9P8llrZQI27tfEJy+KURueNeVb22KuTPml28nB0XtfWDAnHZKZ2uaY3WZ3
	AmXpVg885ZQJuVyFrrb+t2Zni9QUNHmZOiyhjJtxBGdy4Kb2HiDyn0RrX7bgER/HMfFJ
	v+VQ==
X-Gm-Message-State: ABuFfoh5pWvFGgpGarPI7eTUGzA/tRGXYVTRA7VK3PT6077zKBNj6l2M
	hWwUuOpElcv8/rTPQrdJ2zYnPP8KWEo=
X-Google-Smtp-Source: ACcGV627RFTE+VskpnjNkDls45FNJnhb0/5Ey9Kua9QkAr6e6hTmhaeFK+T+1GvZTJP0kZkh27GUjw==
X-Received: by 2002:a1c:3288:: with SMTP id
	y130-v6mr1211239wmy.11.1538567566651; 
	Wed, 03 Oct 2018 04:52:46 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	64-v6sm1342406wrr.64.2018.10.03.04.52.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 04:52:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2018 12:52:43 +0100
Message-Id: <20181003115243.21013-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] pango: don't disable debugging
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
X-List-Received-Date: Wed, 03 Oct 2018 11:52:46 -0000

By explicitly disabling debugging we get *no* safety checks: the GLib asserts
and checks are all disabled.  This is fine for absolute performance but
something that should be opt-in.

This also breaks the test suite, which relies upon the asserts to work.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/pango/pango_1.42.4.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango_1.42.4.bb b/meta/recipes-graphics/pango/pango_1.42.4.bb
index e73fd28dfda..fc610a9a5f9 100644
--- a/meta/recipes-graphics/pango/pango_1.42.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.42.4.bb
@@ -24,8 +24,6 @@ DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo h
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[x11] = "--with-xft,--without-xft,virtual/libx11 libxft"
 
-EXTRA_OECONF = "--disable-debug"
-
 LEAD_SONAME = "libpango-1.0*"
 LIBV = "1.8.0"
 
-- 
2.11.0


