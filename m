Return-Path: <armccurdy@gmail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id D3E5B60722
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 12:12:34 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id he10so27439466wjc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 04:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=s2rEaMvXF835kQRTQUh9NdJw2RxMaIapOQ/Hof9tfM0=;
	b=XVj21zLJe1YM1UCCVhyxSG7uUqlgY4FvnsrA6PW0E79/8xfp4EwQIJLTZIOsIGl/ts
	o2kQWpPI6UCLSMmyGpKyskwToVvwU9AUTkH/I5JV9MF8aa3/l0VP1y4dofW5wAE49LlB
	NY2xgVFWscvB2C/ula4ry60juUfrPsD+v3hzi0cRVSs16IeQKbpaJnyuIBO8IsqZ9ppT
	KTQHfIU9Tr4YRN1zrY+D8PtNZZqVD7ylQzNky89clrXAtPByKNI36qUCfTzOzx3StxbO
	YZm9iV1XvvCjicpFvM8+ZrTdF0/fhst69P5ZckuDUzdG75PrviAuchS0dxrPckzMJRF1
	NDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=s2rEaMvXF835kQRTQUh9NdJw2RxMaIapOQ/Hof9tfM0=;
	b=m2ionHxBakZbCYTVMoUR05BQKtJ4DhWJ5qm80tlKWRqvjOA9dM517vU9rZtOw29i+k
	6X6bgSApWCow/aIlqllLE7QiPVwKCu4l33ZzVPqaJ20a8Yp68kmFAjpIBSr8JqXlweXn
	rNbc0IDNzXjBad/MntwU5Pig1C16ODH9rthCImeYuPtccdgIgihaHolZQiVLq5d99pUL
	UkgKRjs7Axl4jybfjabTo3fhfhhTy7OAfBrTmaATJ944906muRq9lRjcLWZIqlS3+VaB
	mjJw+o66oHcNUaK5Ej4bDnUd1tRXIljUy3euM83LBvNnMm0hMZBo9tc+v5t4bvIYKbW7
	QyGw==
X-Gm-Message-State: AKaTC03cwac9IbxPrtipBbBM96vmTIFsuApNU0642fhvsRP4CvKk5SnoXaMqMQxCZgwqwQ==
X-Received: by 10.194.246.131 with SMTP id xw3mr17408969wjc.217.1482235955376; 
	Tue, 20 Dec 2016 04:12:35 -0800 (PST)
Received: from localhost.localdomain
	(ip-217-103-177-37.ip.prioritytelecom.net. [217.103.177.37])
	by smtp.gmail.com with ESMTPSA id
	o132sm21783087wmo.17.2016.12.20.04.12.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Dec 2016 04:12:33 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Dec 2016 04:12:27 -0800
Message-Id: <1482235947-4523-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2] glew: build for EGL in non-X11 distros
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
X-List-Received-Date: Tue, 20 Dec 2016 12:12:35 -0000

The glew 2.0.0 release added support for building for EGL:

  http://glew.sourceforge.net/log.html

Add PACKAGECONFIG options for 'opengl' (ie the previous default, with
dependencies on opengl and X11) and 'egl-gles2', which depends on EGL
and GLESv2 and allow glew to be built for non-X11 distros.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-graphics/glew/glew_2.0.0.bb | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-graphics/glew/glew_2.0.0.bb b/meta/recipes-graphics/glew/glew_2.0.0.bb
index 489dd7c..1c93ca0 100644
--- a/meta/recipes-graphics/glew/glew_2.0.0.bb
+++ b/meta/recipes-graphics/glew/glew_2.0.0.bb
@@ -2,12 +2,9 @@ SUMMARY = "OpenGL extension loading library"
 DESCRIPTION = "The OpenGL Extension Wrangler Library (GLEW) is a cross-platform open-source C/C++ extension loading library."
 HOMEPAGE = "http://glew.sourceforge.net/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=67586"
-SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ac251558de685c6b9478d89be3149c2"
 
-DEPENDS = "virtual/libx11 virtual/libgl libglu libxext libxi libxmu"
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
            file://no-strip.patch"
 
@@ -19,12 +16,18 @@ UPSTREAM_CHECK_REGEX = "/glew/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit lib_package pkgconfig distro_features_check
 
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "opengl"
+
+PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', 'egl-gles2', d)}"
+
+# The opengl and egl-XXX options are exclusive, enable only one.
+PACKAGECONFIG[opengl] = "SYSTEM='linux',,virtual/libx11 virtual/libgl libglu libxext libxi libxmu"
+PACKAGECONFIG[egl-gles2] = "SYSTEM='linux-egl' GLEW_NO_GLU='-DGLEW_NO_GLU' LDFLAGS.GL='-lEGL -lGLESv2',,virtual/egl virtual/libgles2"
 
-# Override SYSTEM to avoid calling config.guess, we're cross-compiling.  Pass
-# our CFLAGS via POPT as that's the optimisation variable and safely
-# overwritten.
-EXTRA_OEMAKE = "SYSTEM='linux' \
+# Override SYSTEM (via PACKAGECONFIG_CONFARGS) to avoid calling config.guess,
+# we're cross-compiling. Pass our CFLAGS via POPT as that's the optimisation
+# variable and safely overwritten.
+EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS} \
                 CC='${CC}' LD='${CC}' STRIP='' \
                 LDFLAGS.EXTRA='${LDFLAGS}' \
                 POPT='${CFLAGS}' \
-- 
1.9.1


