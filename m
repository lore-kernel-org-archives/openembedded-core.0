Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4276F602D9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 22:52:26 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id l68so5084143wml.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 14:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xcbKwQ3tNhgkVqcjWRgV41t1UOhYFJqOjPsH2RAUPuE=;
	b=TPo4hJZKB8UA/wtQbIoCwocvnvVPtk1WNDxgPzKZT+l9asDOefZjGh+RMFWQc116Qe
	cAsMu+79k+U3iBYXNgjazKLoEt4mW9YSLHE4wJnb3FtWRr7ojEc1+eDGD5n+bMdx26er
	L9uQbKL1BWrTLpjDpEJZrh8PDg2o4K+P+Cx+Nv6AH1+5euExvM7QuXvRrqE5+f2EvruH
	LbqA3aPFu3Jny6rrdl5AtQ8/00tpYt87Wwr6cpt9U1Eqz2zcYHpo5DTQjqiOiePskcgQ
	G9YNm82rX53tXLH9wcs6pn5dqgJBy4va/lMPQ/n/DBhD84MOz0rbOdz0Lc3HRc8AC/6m
	35EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xcbKwQ3tNhgkVqcjWRgV41t1UOhYFJqOjPsH2RAUPuE=;
	b=PBPFUFTVwN7Onnn6A1Zsg6YrMdfUotwpCk0CdbMnYg2tqJ2L+v0U7CLFaePYyGQq1t
	b6+twzP53BguTvLLEQuWZ120m9SCPgRg6FV9DTIjIkEUlF2CUlE8QFy/1Pil9vIO6c45
	B7Chtttgq6vB21Szyay8w6fsUh53rfnFqRrfPTzQocHAQv+Ty84iKTPlTO5eB2maqw7t
	b38zYbA7Nz3HsAcL3pKEJ/U8xTPRQtrzlDpVl/azaNHRODxkjXITJ+Lvc+zCYByVLh0u
	xKyzFJTwhoZoQWRSK8mqYl27u+4php7+lqLzUi0z44/UdqJhzGFKEM5VxFkyd3AR184U
	rcXw==
X-Gm-Message-State: AD7BkJJqADXGGYQeov8f6CfobVRrcOJPFJdF7f+TQgLvOBkyXH69iKGU4jHLVI2yhmd4dg==
X-Received: by 10.28.4.210 with SMTP id 201mr14733261wme.51.1457391147164;
	Mon, 07 Mar 2016 14:52:27 -0800 (PST)
Received: from lenovobook.localdomain
	(ipbcc1bda1.dynamic.kabel-deutschland.de. [188.193.189.161])
	by smtp.googlemail.com with ESMTPSA id
	x186sm15789193wmg.19.2016.03.07.14.52.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Mar 2016 14:52:26 -0800 (PST)
From: Johannes Pointner <h4nn35.work@gmail.com>
X-Google-Original-From: Johannes Pointner <johannes.pointner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Mar 2016 23:51:46 +0100
Message-Id: <1457391106-6151-1-git-send-email-johannes.pointner@gmail.com>
X-Mailer: git-send-email 2.7.2
Subject: [Patch] xf86-video-modesetting: Require sufficiently new libdrm
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
X-List-Received-Date: Mon, 07 Mar 2016 22:52:27 -0000

This fixes the check of the libdrm version in the configure script.

Signed-off-by: Johannes Pointner <johannes.pointner@gmail.com>
---
 .../modesetting_libdrm_requirements.patch          | 29 ++++++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.18.0.bb            |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/modesetting_libdrm_requirements.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/modesetting_libdrm_requirements.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/modesetting_libdrm_requirements.patch
new file mode 100644
index 0000000..22b7e6f
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/modesetting_libdrm_requirements.patch
@@ -0,0 +1,29 @@
+From bf23db42a4e5943129501223a47b48884cdeb62f Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Wed, 27 Jan 2016 11:50:13 -0500
+Subject: modesetting: Require sufficiently new libdrm
+
+Bugzilla: https://bugs.freedesktop.org/93883
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
+Reviewed-by: Julien Cristau <jcristau@debian.org>
+
+Upstream-Status: Backport
+
+diff --git a/configure.ac b/configure.ac
+index ac3bb64..312fc69 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2035,8 +2035,7 @@ if test "x$XORG" = xyes; then
+ 
+ 	if test "x$DRM" = xyes; then
+ 		dnl 2.4.46 is required for cursor hotspot support.
+-		PKG_CHECK_EXISTS(libdrm >= 2.4.46)
+-		XORG_DRIVER_MODESETTING=yes
++		PKG_CHECK_EXISTS(libdrm >= 2.4.46, XORG_DRIVER_MODESETTING=yes, XORG_DRIVER_MODESETTING=no)
+ 	fi
+ 
+ 	AC_SUBST([XORG_LIBS])
+-- 
+cgit v0.10.2
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.0.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.0.bb
index e606dac..eb79b40 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.0.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.0.bb
@@ -2,6 +2,7 @@ require xserver-xorg.inc
 
 SRC_URI += "file://configure.ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch \
             file://musl-arm-inb-outb.patch \
+            file://modesetting_libdrm_requirements.patch \
            "
 SRC_URI[md5sum] = "3c1c1057d3ad27380d8dd87ffcc182cd"
 SRC_URI[sha256sum] = "195670819695d9cedd8dde95fbe069be0d0f488a77797a2d409f9f702daf312e"
-- 
2.7.2


