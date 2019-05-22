Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3AC797E0D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 18:28:34 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id a5so1462389pls.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 11:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pnWZVRkagcx0U/vfCg/TsqRTm/bbGVa88umtecLUX1c=;
	b=MBKQH3meDChJJY19Bk6zTiabLUWg9RasNuPvhFjBuAZyJXEBb8f54c6pVBRnc1BJQu
	uAbGgittwm0bB6IAsiIrImsxBW5KSLNZz21zgg5xSvuonLGAdhdADifMCOotDUkyi2Er
	tlDe3UAUI99z6D5BRLjGFPOnz0IuiN35Kalgc5d8somMj3zbczAv/t/n7gkXkABC+ZXx
	sdTgtyvMVw5dFf0UugqinIOadQ47OPSgFmy38kcMpEmNQyygjwr84c3m99MX19m0wMjg
	lMLdaHKIJiJouj2LW7GgHHyODFRQ8xSv8gUJuy9NoSMB0YBkizEZYBDOwj0spC5J/S9A
	o9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pnWZVRkagcx0U/vfCg/TsqRTm/bbGVa88umtecLUX1c=;
	b=RHXXCMSsrQ6/AEoQhGrdgGSJom3tlatrpyLziBSuS6yWNg8UNTR7NKhua5/sJVJk1N
	ettbedYTZ89AVeAA7HqLusrCz7WF+mIQvCFLfZ+0c/coq6tBvW8ItwJbCpLnYHoTrtT6
	Yss1zE6RG8CVsAXS4Pow9BBHPOqBfw95lD1eUei5kIwLHvj4tob/deo5P5+NOHO3sEOH
	hB+g8NKkAcKogFy2atmHFjkje4vuC7oiYsszsT4DZozW46xXu+IT1qN6ikdNsNeRXDUK
	6VTM1UDRVxp6w6WYtycZAZhfCfl5hAseTIrfVN83IsU3P26tit0PxU1AX9wHeX5SXSFm
	+BGw==
X-Gm-Message-State: APjAAAW0dySLYLPsv6XgfGvcfTvd8w4kCelCG9i9MQbOy6bo2NnsfoiJ
	47tjLJGizxSpSBKYPLPEYqtNM2VWYvo=
X-Google-Smtp-Source: APXvYqx/YXhlEHpsxcrKKFD7Qj+b81wmWFrb1ak9lgXpbsgqQj5ne+qQm2ZiRTRO6xfxJbffq+9Ftg==
X-Received: by 2002:a17:902:9a4c:: with SMTP id
	x12mr21712535plv.298.1558549714317; 
	Wed, 22 May 2019 11:28:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3506])
	by smtp.gmail.com with ESMTPSA id
	79sm44072001pfz.144.2019.05.22.11.28.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 May 2019 11:28:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2019 11:28:27 -0700
Message-Id: <20190522182827.24463-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH V2] mesa: Fix a case when gbm is enabled but DRIDRIVERS is not defined
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
X-List-Received-Date: Wed, 22 May 2019 18:28:34 -0000
Content-Transfer-Encoding: 8bit

This is a typical scenario with arm platforms, with meson if DRIDRIVERS
is empty then dri is disabled automatically, but gbm needs dri2 enabled
for it to have proper backend, in autotools we could use --enable-gbm
--enable-dri and get correct behaviour but with meson enabling dri2 only
works if DRIDRIVERS is not empty

This fixes mesa-gl build for rpi machines when using userland graphics

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
v2: Add explicit meson knob to enable dri

 ...Allow-enable-DRI-without-DRI-drivers.patch | 45 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  2 +-
 meta/recipes-graphics/mesa/mesa_19.0.3.bb     |  1 +
 3 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-Allow-enable-DRI-without-DRI-drivers.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-Allow-enable-DRI-without-DRI-drivers.patch b/meta/recipes-graphics/mesa/files/0001-Allow-enable-DRI-without-DRI-drivers.patch
new file mode 100644
index 0000000000..52d670a296
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-Allow-enable-DRI-without-DRI-drivers.patch
@@ -0,0 +1,45 @@
+From 8e0a58c8eea7ed70071cac139655700fdfa16445 Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei@gherzan.ro>
+Date: Wed, 22 May 2019 18:32:07 +0100
+Subject: [PATCH] Allow enable DRI without DRI drivers
+
+Upstream-status: Pending
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+---
+ meson.build       | 2 +-
+ meson_options.txt | 6 ++++++
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 53d02e3..9a8578f 100644
+--- a/meson.build
++++ b/meson.build
+@@ -119,7 +119,7 @@ with_dri_r200 = _drivers.contains('r200')
+ with_dri_nouveau = _drivers.contains('nouveau')
+ with_dri_swrast = _drivers.contains('swrast')
+ 
+-with_dri = _drivers.length() != 0 and _drivers != ['']
++with_dri = get_option('dri') or (_drivers.length() != 0 and _drivers != [''])
+ 
+ _drivers = get_option('gallium-drivers')
+ if _drivers.contains('auto')
+diff --git a/meson_options.txt b/meson_options.txt
+index ccf7065..5174320 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -34,6 +34,12 @@ option(
+   choices : ['auto', 'true', 'false'],
+   description : 'enable support for dri3'
+ )
++option(
++  'dri',
++  type : 'boolean',
++  value : false,
++  description : 'enable support for dri'
++)
+ option(
+   'dri-drivers',
+   type : 'array',
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index cd3ddfd822..3ecfb8506c 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -70,7 +70,7 @@ DRIDRIVERS_class-nativesdk = "swrast"
 DRIDRIVERS_append_x86_class-target = ",r100,r200,nouveau,i965,i915"
 DRIDRIVERS_append_x86-64_class-target = ",r100,r200,nouveau,i965,i915"
 # "dri" requires "opengl"
-PACKAGECONFIG[dri] = "-Ddri-drivers=${DRIDRIVERS}, -Ddri-drivers='', xorgproto libdrm"
+PACKAGECONFIG[dri] = "-Ddri=true -Ddri-drivers=${DRIDRIVERS}, -Ddri=false -Ddri-drivers='', xorgproto libdrm"
 PACKAGECONFIG[dri3] = "-Ddri3=true, -Ddri3=false, xorgproto libxshmfence"
 
 # Vulkan drivers need dri3 enabled
diff --git a/meta/recipes-graphics/mesa/mesa_19.0.3.bb b/meta/recipes-graphics/mesa/mesa_19.0.3.bb
index 36faa4a99d..8a72df1014 100644
--- a/meta/recipes-graphics/mesa/mesa_19.0.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.0.3.bb
@@ -3,6 +3,7 @@ require ${BPN}.inc
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
            file://0001-meson.build-make-TLS-GLX-optional-again.patch \
+           file://0001-Allow-enable-DRI-without-DRI-drivers.patch \
            "
 
 SRC_URI[md5sum] = "d03bf14e42c0e54ebae5730712ccc408"
-- 
2.21.0


