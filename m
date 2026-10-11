Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9DCCA9ED9
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:40 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23582.1791708094840193614
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UH08cSvI;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c6955a7c3so127386f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708093; x=1792312893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BelhuWgZeTNqIxMMezqPO2dYte6ayPenCdud4jrLP+A=;
        b=UH08cSvIL51fkIUCpqrIYxA+Ylgq/KrzefibPaFdYqgykObvzTLfOSq5piecCZXerX
         Rr1TUg1ZNVCbX/tSU1BIJSzHHQUIk2TErQ+F513gQZJ8Az+G51cT+O/J374qGZaUdy2R
         uVNeqdLMGRp1cmxQIaDuCM2dqmV0D9u3y87xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708093; x=1792312893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BelhuWgZeTNqIxMMezqPO2dYte6ayPenCdud4jrLP+A=;
        b=c2b6IpQ17rAsTG0UdNYVFYlBVdtjixdgjh1QGFU/G0Wr0yIFdYfZJ8c7LPPwRLZGm6
         qXIDXhTdfTJoYLsHoeLLbVZ3xZHnmHb/7FeOHQtkdHVjJusIAoeiLki2KFZjTZrax8xe
         jfR4D8C+gfvqSaU+smqeJyVG8N3G85+BjzlYSuwzNgh9QSkrpt/UphN5JRqWzqTS7hzC
         lFucTA5SGPPe5YNTNsRKexWUKSlCDzW+7v3qCrPog0DYRJDvOQnm/AC/dKNeDuifcg8h
         VvjL03+49mgjaSJSHqZHt1qzmDW9CnjR0b+UIO3JEASIhChoteRjo4LG6Dqpi9YicfE8
         xqPQ==
X-Gm-Message-State: AFq9FYJ7W6EheM/tw7NCq/YpAT6RVsS2dMBCoH/ILEq86KWEYhkNR1l8
	U/ylteYkTaU/qxZVhiKm8jjg5yf/p9UvVBsFnxBRekU5UOF8kJS89FmgP20Ns5VCr3T1r3uZsjz
	ObW0x/6Q=
X-Gm-Gg: AYBFou0mOKMIz7i2pPjx2C+vPN1CU2L8z/5mR0DJU67bradiU45pDH7Plg5vq1+qiUn
	iMxdiT/tDE1dDRVZSjTqLRNoA+KXsxwhmnTE7etWu1fK5vjhUXUXZ6a8uncQyf9RtH6GPNferXR
	hIJrurFm9R4KprVyOST/rxG2LMx2Sdpa25XKiwZ6KbPonabpL4qn8EUgJkly4nax3mQtXtKQWMs
	zmLuIscO/mLDbOPuwcoYBFct2o8+XkpqeF8hZhyYItq/MFnMP+wxU+WALml4qXOUyJnji7aZWqc
	cVmNgmmMRbGm3SHxqoWYXHP+vnXi+uzi133wpi7nLSXS+TwoAgNONTzv2fd8idf5FjN8KwbI2DJ
	KiJ0/OBfHCubrWUcxn6yAG6EKh6W+7KrUacIGSE3QZcLXSxWztOzubvoKmAaBrH4ovVvw9mNfqy
	B3ScfGBbSEV/K9P4hB+9SlVLvHTLDMF8S5MtCTgWabrSoRIfmgS3w7VYju67TKU0c+ORwqHnwza
	v9tV9Bt8xrPJ6bPMAp7TLUitwsZktJSG95GNfEYulpMdoZ/oTWY2RGjSDWkkvSetT4YtIlh0w==
X-Received: by 2002:a05:6000:454b:b0:48c:7143:610c with SMTP id ffacd0b85a97d-48dbad1252fmr7168733f8f.36.1791708093020;
        Sun, 11 Oct 2026 01:41:33 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 50/60] weston: fix VNC backend build with aml 1.0
Date: Sun, 11 Oct 2026 10:40:23 +0200
Message-ID: <6331d7ef8e03226460cc7effc07dc3bfe674cadb.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247559

From: Frieder Schrempf <frieder.schrempf@kontron.de>

meta-oe's aml 1.0 installs aml1.pc, but weston 15 looks for aml 0.3.x, so
enabling the vnc PACKAGECONFIG fails at configure time. Backport the aml
part of the upstream fix from weston 16 and add aml to the vnc
dependencies, as weston uses it directly.

Tested by building weston with PACKAGECONFIG vnc for ARMv7.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../weston/0001-backend-vnc-Use-aml-v1.patch  | 24 +++++++++++++++++++
 .../recipes-graphics/wayland/weston_15.0.0.bb |  3 ++-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-backend-vnc-Use-aml-v1.patch

diff --git a/meta/recipes-graphics/wayland/weston/0001-backend-vnc-Use-aml-v1.patch b/meta/recipes-graphics/wayland/weston/0001-backend-vnc-Use-aml-v1.patch
new file mode 100644
index 00000000000..c752a2b3624
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0001-backend-vnc-Use-aml-v1.patch
@@ -0,0 +1,24 @@
+From: Frieder Schrempf <frieder.schrempf@kontron.de>
+Subject: [PATCH] backend-vnc: Use aml v1
+
+aml 1.0 installs aml1.pc and neatvnc already uses it. Only the aml part
+of the upstream commit is taken, as the rest needs Neat VNC 1.0.
+
+Upstream-Status: Backport [partial, https://gitlab.freedesktop.org/wayland/weston/-/commit/8a1c91e7]
+Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
+---
+ libweston/backend-vnc/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libweston/backend-vnc/meson.build b/libweston/backend-vnc/meson.build
+--- a/libweston/backend-vnc/meson.build
++++ b/libweston/backend-vnc/meson.build
+@@ -8,7 +8,7 @@ if not dep_neatvnc.found()
+ 	error('VNC backend requires neatvnc which was not found. Or, you can use \'-Dbackend-vnc=false\'.')
+ endif
+ 
+-dep_aml = dependency('aml', version: ['>= 0.3.0', '< 0.4.0'], required: false, fallback: ['aml', 'aml_dep'])
++dep_aml = dependency('aml1', version: ['>= 1.0.0', '< 2.0.0'], required: false, fallback: ['aml', 'aml_dep'])
+ if not dep_aml.found()
+ 	error('VNC backend requires libaml which was not found. Or, you can use \'-Dbackend-vnc=false\'.')
+ endif
diff --git a/meta/recipes-graphics/wayland/weston_15.0.0.bb b/meta/recipes-graphics/wayland/weston_15.0.0.bb
index da347659f12..3f9fff51fd4 100644
--- a/meta/recipes-graphics/wayland/weston_15.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_15.0.0.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
 SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
            file://0001-vulkan-renderer-guard-surface-output-creation-with-b.patch \
            file://0001-gl-shaders-Remove-asserts-relying-on-shader-compiler.patch \
+           file://0001-backend-vnc-Use-aml-v1.patch \
            file://weston.png \
            file://weston.desktop \
            file://xwayland.weston-start \
@@ -98,7 +99,7 @@ PACKAGECONFIG[image-jpeg] = "-Dimage-jpeg=true,-Dimage-jpeg=false, jpeg"
 # screencasting via PipeWire
 PACKAGECONFIG[pipewire] = "-Dbackend-pipewire=true,-Dbackend-pipewire=false,pipewire,pipewire"
 # VNC remote screensharing
-PACKAGECONFIG[vnc] = "-Dbackend-vnc=true,-Dbackend-vnc=false,neatvnc libpam"
+PACKAGECONFIG[vnc] = "-Dbackend-vnc=true,-Dbackend-vnc=false,neatvnc aml libpam"
 # Perfetto performance analysis support
 PACKAGECONFIG[perfetto] = "-Dperfetto=true,-Dperfetto=false,libperfetto"
 

