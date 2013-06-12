Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 76FD66AAA7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 23:19:41 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id l10so4037582eei.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 16:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=nm2Hu/iLYD0MJIN2NVXwsArx/ng7GXAVfNf3u31FOz4=;
	b=SoUZ3uJS0BPrbpOIIf9/d42kyXBtGstOVgl8FrTQ+ZN60m2Su1xurUGRtaSKPdXT1n
	3aOzEWtzgajCe+SrCJCvPuRtS1aqktJ5wL4IOJxiabhldfv2a6UClZdeBpJw0NMrW0la
	nKu5wwU8HEuzEb4LDJ8tNCyl8BwJIjnKaMa1Sb7Hq6XsAFi+yLc7VC1x8zhEMSVAKm+T
	HjJ/iuQKsHBZhZOsdfzOWKz+n2RuHbtrmv8d09gEw3+qu/NakZi4DJqC4XhmsbAjJMPy
	ejCXZITgyoh8VYuX5EHlXXBO0tg8N2+aVHFTL+zcU24xElG5dAW/AoT2wxhohDnzTjlt
	Liuw==
X-Received: by 10.14.111.129 with SMTP id w1mr23877869eeg.13.1371079182165;
	Wed, 12 Jun 2013 16:19:42 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p43sm39762464eem.11.2013.06.12.16.19.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 16:19:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2013 01:19:55 +0200
Message-Id: <2ef3f01e7c79bb7e499aa8790a25e25b54e6bf05.1371079127.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <4f22f9950f2354b903b37d1739113d5a83841c1f.1371079127.git.Martin.Jansa@gmail.com>
References: <4f22f9950f2354b903b37d1739113d5a83841c1f.1371079127.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1371079127.git.Martin.Jansa@gmail.com>
References: <cover.1371079127.git.Martin.Jansa@gmail.com>
Subject: [PATCH 02/10] mesa: use PACKAGECONFIG instead of DISTRO_FEATURES to define EGL_PLATFORMS
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
X-List-Received-Date: Wed, 12 Jun 2013 23:19:41 -0000

* it makes it easier to change PACKAGECONFIG in .bbappend and get
  consistent EGL_PLATFORMS

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 3f00237..74fddc2 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -42,8 +42,8 @@ EXTRA_OECONF += "--enable-gbm"
 PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1 --disable-gles2"
 
 EGL_PLATFORMS  = "drm"
-EGL_PLATFORMS .="${@base_contains('DISTRO_FEATURES', 'x11', ',x11', '', d)}"
-EGL_PLATFORMS .="${@base_contains('DISTRO_FEATURES', 'wayland', ',wayland', '', d)}"
+EGL_PLATFORMS .="${@base_contains('PACKAGECONFIG', 'x11', ',x11', '', d)}"
+EGL_PLATFORMS .="${@base_contains('PACKAGECONFIG', 'wayland', ',wayland', '', d)}"
 PACKAGECONFIG[egl] = "--enable-egl --with-egl-platforms=${EGL_PLATFORMS}, --disable-egl"
 
 # Multiple virtual/gl providers being built breaks staging
-- 
1.8.2.1


