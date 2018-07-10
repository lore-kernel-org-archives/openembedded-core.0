Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id CC88774EAB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 08:06:55 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p1-v6so13546014wrs.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 01:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=uVDKK0RxBm5k3okbifUAhwP+ZFQ4w0HjV3zZRocWQ1o=;
	b=PsLgxoWr1qFp7v1cbqVoSEnmt0ibNolrcvDH0l+k9Hh5bCMGnP/sVR0P55ZuC+j/aV
	7I/GXMhkgkdet3D1lywIlo+tcwU8pufQPqM6V8PgjjNzw64QYZlS+uf/OsQpad94mnD7
	gPRqcWNDiN+Gg3WTQ9HpKKlpOGs9US7fZpm0to6Kgmd/V6z/HbQQegoo1YVtnCAE0clp
	Ex5NQkt2T1ujAMsXsdZmjXa6u3pudWctIkCzLw/sbwOsNOjXXta2tZzbwTnwzA7IRkF/
	R1E1ZiUZeh24pLrh2AWdNjlf/psSVEVkxo4yxBRC4FdCcTu00uHL2sXvlDFDHuVJOAHc
	4hQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uVDKK0RxBm5k3okbifUAhwP+ZFQ4w0HjV3zZRocWQ1o=;
	b=UXCE+T1c0+56bXObxdkCc7M6XVOCuqcDQEsuSxpkr9gU76x73JTT3Tq5j1u0p/O8ig
	Y/bQ/ohTDx8lOvfh58JUly3T+FbHiJgOgA7uKkRtT1wvxa3Cxy7hL3HBqHDdc5GwXVum
	cwVGap6BcNuo6ky3YLgOqg6UiCt5g4kL08jyEDIyUxfT7wY4ke3bWfh2A+ZyEP7yVYkr
	3oEBj1ncY9rO6qUorYexRAq2WC4DeG71Fb/bFlyRFHy2MoGSdt6xReqi0BOAVl3BVsUg
	a0FG7nYVdEOd25NqIayAOdz7kk0/c1PkYr3VAYxjo22UOJdiHgAdGk+Qpw4nSJ07zujc
	MTgA==
X-Gm-Message-State: APt69E3GVhgo0EKw8HYA1pCcyKjHnfmgQ6ONCdMI8PFYIxPntBI5n61/
	Ga+GoBjmrCMh758vFx9vkQQCWQ==
X-Google-Smtp-Source: AAOMgpfZpIVRazQJD+SQbYylGB1Ct/6Y2Br3MiCFLhOq8iFfK8OlIH4A9Np5vVylLpSS/KTkvjeQSw==
X-Received: by 2002:adf:fdcd:: with SMTP id
	i13-v6mr16171393wrs.276.1531210016390; 
	Tue, 10 Jul 2018 01:06:56 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	g75-v6sm21104791wmd.38.2018.07.10.01.06.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 10 Jul 2018 01:06:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2018 08:07:01 +0000
Message-Id: <20180710080702.20527-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] libdrm: Add PACKAGECONFIG support for all meson options
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
X-List-Received-Date: Tue, 10 Jul 2018 08:06:56 -0000

* Use the same defaults as meson does, with few modifications based on
  previous EXTRA_OEMESON
* move libpciaccess dependency to new intel PACKAGECONFIG
* add dependency on util-macros which was previously pulled by
  libpciaccess, because it's still needed even with intel disabled:
  | configure.ac:34: error: must install xorg-macros 1.12 or later
    before running autoconf/autogen

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/drm/libdrm_2.4.92.bb | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.92.bb b/meta/recipes-graphics/drm/libdrm_2.4.92.bb
index 347090cd5f..1526553254 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.92.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.92.bb
@@ -8,7 +8,7 @@ SECTION = "x11/base"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c530816761e949dc71"
 PROVIDES = "drm"
-DEPENDS = "libpthread-stubs libpciaccess"
+DEPENDS = "libpthread-stubs util-macros"
 
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://musl-ioctl.patch"
@@ -17,12 +17,24 @@ SRC_URI[sha256sum] = "e9e48fdb4de139dc4d9880aa1473158a16ff6aff63d14341367bd30a51
 
 inherit meson pkgconfig manpages
 
-EXTRA_OEMESON = "-Dvalgrind=false \
-                 -Dcairo-tests=false \
-                 -Dinstall-test-programs=true \
-                 -Domap=true \
-                 -Detnaviv=true"
-
+PACKAGECONFIG ??= "libkms intel radeon amdgpu nouveau vmwgfx omap freedreno vc4 etnaviv install-test-programs"
+PACKAGECONFIG[libkms] = "-Dlibkms=true,-Dlibkms=false"
+PACKAGECONFIG[intel] = "-Dintel=true,-Dintel=false,libpciaccess"
+PACKAGECONFIG[radeon] = "-Dradeon=true,-Dradeon=false"
+PACKAGECONFIG[amdgpu] = "-Damdgpu=true,-Damdgpu=false"
+PACKAGECONFIG[nouveau] = "-Dnouveau=true,-Dnouveau=false"
+PACKAGECONFIG[vmwgfx] = "-Dvmwgfx=true,-Dvmwgfx=false"
+PACKAGECONFIG[omap] = "-Domap=true,-Domap=false"
+PACKAGECONFIG[exynos] = "-Dexynos=true,-Dexynos=false"
+PACKAGECONFIG[freedreno] = "-Dfreedreno=true,-Dfreedreno=false"
+PACKAGECONFIG[tegra] = "-Dtegra=true,-Dtegra=false"
+PACKAGECONFIG[vc4] = "-Dvc4=true,-Dvc4=false"
+PACKAGECONFIG[etnaviv] = "-Detnaviv=true,-Detnaviv=false"
+PACKAGECONFIG[freedreno-kgsl] = "-Dfreedreno-kgsl=true,-Dfreedreno-kgsl=false"
+PACKAGECONFIG[valgrind] = "-Dvalgrind=true,-Dvalgrind=false,valgrind"
+PACKAGECONFIG[install-test-programs] = "-Dinstall-test-programs=true,-Dinstall-test-programs=false"
+PACKAGECONFIG[cairo-tests] = "-Dcairo-tests=true,-Dcairo-tests=false"
+PACKAGECONFIG[udev] = "-Dudev=true,-Dudev=false,udev"
 PACKAGECONFIG[manpages] = "-Dman-pages=true,-Dman-pages=false,libxslt-native xmlto-native"
 
 ALLOW_EMPTY_${PN}-drivers = "1"
-- 
2.17.1


