Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwymI-0006J7-Mp
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 19:01:38 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 02 Aug 2012 09:49:57 -0700
Received: by weyt11 with SMTP id t11so5421640wey.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 09:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=gcBkCAsQGT3lYcxg9QWRU7Zp7oEDRxv8HTczbdRtBT8=;
	b=DjTp/jzTirVg1SFpuYDW03nvV6DIBIdz+4MGCYEhRfgs1IzOvI/d+jZUt5Yjp0z/f1
	+NYAEb9dhQtstMUSUJl2BAyKGTkSUSqT5HbJA9kFSVK0vIQUsR1LXML1sAJ3YHXrfn+s
	uQ4EpFqGeUGuqveVn4pW9GxNpCB/G4yuIok8M37h5eoVTOOAKId5cTtVfm4nMfffLe7G
	yyIe1Rg9lKoP03S8O/Pchhwb2xSO2R8Gsu0yRsKcrqbrzSCQUYlxQuwFyadb6GPjwk7K
	yHUQ6M1FN5Bmx5q4OzmpMgEFlPF1ZuBSfD87VbeDTdqXcnm2B7LPJcsMoKoM7jW/wD/C
	/TMg==
Received: by 10.216.242.196 with SMTP id i46mr10244638wer.123.1343926195929;
	Thu, 02 Aug 2012 09:49:55 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id z11sm18460713wiv.10.2012.08.02.09.49.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 09:49:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 17:48:58 +0100
Message-Id: <09d4d41554545bd36c9abe49939117ca7c6dc72a.1343926021.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
References: <cover.1343926021.git.ross.burton@intel.com>
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
References: <cover.1343926021.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQm6OJVEMAkh824VE2G7WxGhPfWbzxaHHWVTrMnCTtcNgD7drsRfqNkoUzlCBqsifUJ6f2ne
Subject: [PATCH V3 04/11] mesa: add --enable-shared-glapi, and package it in libglapi
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
X-List-Received-Date: Thu, 02 Aug 2012 17:01:38 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index e508b6d..6582bcf 100644
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
@@ -43,15 +44,18 @@ PACKAGES =+ "libegl libegl-dev libegl-dbg \
              libglu libglu-dev \
              libosmesa libosmesa-dev \
              libgl libgl-dev \
+             libglapi libglapi-dev \
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
 
-- 
1.7.10



