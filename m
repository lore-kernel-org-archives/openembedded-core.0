Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwYHK-0004qR-E3
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 14:43:54 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 05:31:56 -0700
Received: by wibhr14 with SMTP id hr14so3065646wib.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 05:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=6NOUf9LvEloakxytzB2k31AuHebDfiNsmQfU8RCvqY4=;
	b=m4uy0T4IJzDLcQFw7Yn4c7vMUp0fGaEM/l5olw88kD0NVLGygGa/qxXUyCT1kniWza
	oar58JwF/dX9JxIyU2w9VvpWMJSOYqLh23gNLpGehBpLSNKNQpC44iLpwcWKNK4K3+HR
	YzSmsPhjIc8en0DfKlQ94JbeCiyTCOjxmqs/eWbUxvNZUvRCV3oBCumKXMxLgxnKNNQJ
	/R9Z9QdvHe6ZwxSVOmpMw5YrioR9/nGorO/P3XVvFNhv0s4rdVFq7V9Uba2fwzFp/f41
	sTRBBBydcYMAMH1RPKLJpe8aOsM5i67VJ18C330KClAQC7tfPj2n6eIoZmVx9K7j32is
	fp+A==
Received: by 10.180.86.133 with SMTP id p5mr16168358wiz.17.1343824315007;
	Wed, 01 Aug 2012 05:31:55 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fb20sm8444981wid.1.2012.08.01.05.31.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 05:31:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 13:31:09 +0100
Message-Id: <0bf581dd2e016ded925362c9a5aec2ffa4def49e.1343823907.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343823907.git.ross.burton@intel.com>
References: <cover.1343823907.git.ross.burton@intel.com>
In-Reply-To: <cover.1343823907.git.ross.burton@intel.com>
References: <cover.1343823907.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnBKpVAuzksp+T45NQOdUKNx4Xm03osXIw83MDsEL6zJt+DPF1pB5NBHxxgZNKS1Y9WXtl/
Subject: [PATCH 03/12] mesa: add --enable-shared-glapi, and package it in libglapi
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 12:43:54 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 4aa7f5f..509b021 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,7 +12,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=7a3373c039b6b925c427755a4f779c1d"
 
-INC_PR = "r16"
+INC_PR = "r17"
 PE = "2"
 
 
@@ -31,7 +31,8 @@ inherit autotools pkgconfig pythonnative
 EXTRA_OECONF = "--enable-glu \
                 --disable-glw \
                 --disable-glut \
-                --enable-glx-tls"
+                --enable-glx-tls \
+                --enable-shared-glapi"
 
 # Multiple virtual/gl providers being built breaks staging
 EXCLUDE_FROM_WORLD = "1"
@@ -43,17 +44,21 @@ PACKAGES =+ "libegl libegl-dev libegl-dbg \
              libglu libglu-dev \
              libosmesa libosmesa-dev \
              libgl libgl-dev \
+             libglapi libglapi-dev libglapi-dbg\
             "
 
 FILES_libegl = "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
 FILES_libgl = "${libdir}/libGL.so.*"
+FILES_libglapi = "${libdir}/libglapi.so.*"
 FILES_libglu = "${libdir}/libGLU.so.*"
 FILES_libosmesa = "${libdir}/libOSMesa.so.*"
 
 FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL"
 FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
+FILES_libglapi-dev = "${libdir}/libglapi.*"
 FILES_libglu-dev = "${libdir}/libGLU.* ${includedir}/GL/glu*.h ${libdir}/pkgconfig/glu.pc"
 FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
 
 FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
 FILES_libegl-dbg += "${libdir}/egl/.debug/*"
+FILES_libglapi-dbg += "${libdir}/.debug/libglapi*"
-- 
1.7.10



