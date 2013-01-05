Received: from mail-pa0-f46.google.com ([209.85.220.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrHRX-0000V4-Hm
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Jan 2013 01:17:24 +0100
Received: by mail-pa0-f46.google.com with SMTP id bh2so9528527pad.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jan 2013 16:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=IJfXj6U4PC+ttsicZgFoMHdJy+fuK2tsuzg+x4vOKU8=;
	b=MRooId2zD66PXwjnoieGVsXElYTTj1a6Gvc0cpGhtpgPZIytjt7z3ZLWEwvBvNLEOC
	zfwqTaMIfV0Ez+JfvVigLXySyYzy76APUt9E9Xndxe0cjglORbxWQnEKKkWCI75CMDYi
	RXpljerIirw97DAoXSa4XJY3p/+lub2GSa9rBGak3hEWVaXw2JWYJeLDpFnr+FiNa7Dv
	6vcnv6i11kIqhhvblyMUlS3GVmQClQlF4EaHfGCEIZRvvKrZHYCtW9k7SdmkKdH4lTvk
	B0uvRDxc7NmCYcIjVCPK1jWNYwtRWMtVxlO4JHxfi83WUss65/q5kz5Ad5UYAvRvish+
	CTbw==
X-Received: by 10.66.88.198 with SMTP id bi6mr158488024pab.54.1357344109166;
	Fri, 04 Jan 2013 16:01:49 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id nf9sm33017692pbc.17.2013.01.04.16.01.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Jan 2013 16:01:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Jan 2013 16:00:58 -0800
Message-Id: <5c96537b0319af960a917a7b9decb317bbfd4daa.1357343832.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <a199c2dc372f0c5a524685e30d8417f05b3713f9.1357343832.git.raj.khem@gmail.com>
References: <a199c2dc372f0c5a524685e30d8417f05b3713f9.1357343832.git.raj.khem@gmail.com>
In-Reply-To: <cover.1357343832.git.raj.khem@gmail.com>
References: <cover.1357343832.git.raj.khem@gmail.com>
Subject: [PATCH 3/4] cairo: Adds libxext in X11DEPENDS.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Jan 2013 00:17:37 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* cairo was giving redefinition error of struct _XLinearGradient,
struct _XCircle and struct _XRadialGradient.
* cario now depends on libxext. Adding that dependency resolved
above errors.
* Verified it on P2020RDB.
* Bump PR.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/cairo/cairo.inc       |    8 ++++++--
 meta/recipes-graphics/cairo/cairo_1.12.8.bb |    2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 3059fae..919ab2e 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -10,7 +10,7 @@ HOMEPAGE = "http://cairographics.org"
 BUGTRACKER = "http://bugs.freedesktop.org"
 SECTION = "libs"
 LICENSE = "MPL-1 & LGPLv2.1"
-X11DEPENDS = "virtual/libx11 libsm libxrender"
+X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
 DEPENDS = "libpng fontconfig pixman glib-2.0"
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
            ${@base_contains('DISTRO_FEATURES', 'gtk-directfb', 'gtk-directfb', '', d)}"
@@ -21,11 +21,15 @@ BBCLASSEXTEND = "native"
 #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points 
 require cairo-fpu.inc
 EXTRA_OECONF += "${@get_cairo_fpu_setting(bb, d)} \
-                 --enable-tee \
+                 ${TEE} \
                 "
 
+TEE = "--enable-tee"
+TEE_libc-uclibc = "--disable-tee"
 
 inherit autotools pkgconfig
 
 # We don't depend on binutils so we need to disable this
 export ac_cv_lib_bfd_bfd_openr="no"
+
+CFLAGS += "-DCAIRO_NO_MUTEX=1"
diff --git a/meta/recipes-graphics/cairo/cairo_1.12.8.bb b/meta/recipes-graphics/cairo/cairo_1.12.8.bb
index 058854c..567a17f 100644
--- a/meta/recipes-graphics/cairo/cairo_1.12.8.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.12.8.bb
@@ -2,7 +2,7 @@ require cairo.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz"
 
-- 
1.7.9.5



