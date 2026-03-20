Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F76F1099B58
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 23:07:43 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1901.1774048049606057271
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 16:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nq7v+Zo0;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b9b1900bso806549f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 16:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774048048; x=1774652848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hxelKFxRqWGVK4+RwE4zvIHRKCo8E1Bf7FNnNntmM4I=;
        b=nq7v+Zo0G1ArxaQitRKLvIFed8BmwMFchXidrb+xVWoXJqE09ud7iBS3fODe7UB0+V
         U7ksBIw+z95VXdJwZItnDeDXceYGTobs4/bDqLoTO4ABkm90lgonM7s35glwb+Zl1LCW
         kCIDiUjJxVjRzLiartAp2Hn6CHsj57CbPkVkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774048048; x=1774652848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hxelKFxRqWGVK4+RwE4zvIHRKCo8E1Bf7FNnNntmM4I=;
        b=i/028SlhjdwFP9i3choGQRsOKiCsmKL66fhvBMayO7sWOdkfgHUFeB1VlaYHEua3zy
         UlF0PLP0UOIWAlPTUn71LaptUmCPOks7uqR+n+y/cl3ax1rytlB1/nfTFOwcIIWdQFlR
         SS8Avsd6oL5uJ9GBo8tiL+3Y0WcTY/67c8hKeSd/Bf3UXANqMSenOpuE6KsDASOp/qZ3
         aXrLGrexHH7WEEsnLjNWbv+RsIBsYCEjq1wERGG9jZUKVXi2Gb/5MaIAYNMhxI7qmPvn
         LiEMZOMf6Gv8eA1JrkVeEgqbLKmp3LsSd6S2JF5nwtPCaFHlz0Pl9QIzuelDMwaXLvzu
         gR4g==
X-Gm-Message-State: AOJu0YyasxT0mm2BFH2K2zO6jYiWUJ3LCWAaDmqyvwBW/p0uQpUexvOx
	9WYETlAlE+qv5hMud90XwR02GlvJ1wphGD4lOEAlPHn8e3d/zMCdVKZYDl4H2QnqjkeaIU5bcuV
	7/eQ6
X-Gm-Gg: ATEYQzx1qzIA8sjgZMoRZX7L+0m6NTHOJyHfvCVyqyvE/pxYfIVNPKlURRMWLewSXf/
	KDFY2gTdGU4x29m+y2RZCmVlS/Iudzn2mZTN7FndgfbYSMdg9To9EkJp65osd70q5xSTza/JSGC
	JDkALBY+TW+73mwWP/sSTDdQpr0opX2zrueHsWqQ/ozwIbE+k69vZe3yAKMAHsjURE/sGYrvyw6
	LTedzilkokrSCds/faOw3hrn9/AxI8wE4D752/iosqjEQejiSky7lqZUCgMWelTD2CXmr3F2GDd
	WGa2Z3AIPPNoWcLt/0IrW3cCvH+dQ0Ka8p0Xkwk4Kna3IEesi3oDNG4vHzpcae8DuzzHl4HSrik
	GeMkXX1/KQM7o9n5vgDONvYkjl0NpSoLz3fFtoYV/J86mkdbEMnb8Wlhvg/KWlMxQidL1OydtB4
	b+asOJWKAQnDJ94bixlnC4vaeGAAeiO8kWhLkWMgyvWyb1IJeUvAM3a92dDAGseIUZ60wV8MLo9
	MBP5a8geqFPikAF9/vUUFS1LUU=
X-Received: by 2002:a5d:588c:0:b0:43b:410d:c4ad with SMTP id ffacd0b85a97d-43b642815e7mr7866348f8f.42.1774048047643;
        Fri, 20 Mar 2026 16:07:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6425eeb4sm9238332f8f.0.2026.03.20.16.07.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 16:07:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 3/7] python3-pip: drop unused Windows distlib launcher templates
Date: Sat, 21 Mar 2026 00:07:18 +0100
Message-ID: <5e37c0345bccc3c732217aecf800f1d48bda0235.1774047909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774047909.git.yoann.congal@smile.fr>
References: <cover.1774047909.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 23:07:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233639

From: Krupal Ka Patel <krkapate@cisco.com>

pip vendors distlib which ships Windows launcher template binaries
(*.exe) under pip/_vendor/distlib. These files are only used on
Windows systems but are installed and packaged for target, native,
and nativesdk builds.

Remove the distlib *.exe templates when not building for a mingw
(mingw32/mingw64) host to avoid shipping unused Windows binaries and
reduce package noise.

Signed-off-by: Krupal Ka Patel <krkapate@cisco.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 90d208fbb06b6e6b5aaddb0048fd6e2e1d46c8bd)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-pip_25.2.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pip_25.2.bb b/meta/recipes-devtools/python/python3-pip_25.2.bb
index 496eff1f15d..901c0152dfb 100644
--- a/meta/recipes-devtools/python/python3-pip_25.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_25.2.bb
@@ -30,6 +30,15 @@ SRC_URI += "file://no_shebang_mangling.patch \
 
 SRC_URI[sha256sum] = "578283f006390f85bb6282dffb876454593d637f5d1be494b5202ce4877e71f2"
 
+do_install:append(){
+	# pip vendors distlib which ships Windows launcher templates (*.exe).
+	# Keep them only when building for a Windows (mingw) host.
+	case "${HOST_OS}" in
+		mingw32|mingw64) ;;
+		*) rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/pip/_vendor/distlib/*.exe ;;
+	esac
+}
+
 RDEPENDS:${PN} = "\
   python3-compile \
   python3-html \

