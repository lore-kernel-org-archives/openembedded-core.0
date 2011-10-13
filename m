Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REJbc-00043l-2v
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 13:37:44 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so435342bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 04:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=yPZYxuzKz7YWVCVRMZAo7w0IM/LgcPXBQGI1d9wJ7M4=;
	b=Cti7g659Y7D7+dUcEEs5bhdzTVW2XJHf8rD8b+v+37f0/e3CsHF80yBDFM4xDmkSTg
	prUEF1/PI9q1a0zF+ltmRsGCOQxdEMGQkb3rshR8wU2ToE8yKmMKsc4uF4hfNKmftfEx
	WGRIYKgdmtlWEdIHIYDHz2FC1jpGctrZ2dynU=
Received: by 10.204.152.201 with SMTP id h9mr2276186bkw.99.1318505521786;
	Thu, 13 Oct 2011 04:32:01 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s12sm3280643bkt.4.2011.10.13.04.31.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 04:32:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 13:30:28 +0200
Message-Id: <aef3363b2dcf92e031b90e6bc5a560d8295c6a2d.1318505196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
References: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318505196.git.Martin.Jansa@gmail.com>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
Subject: [oe-core 10/20] mesa: move shared PROTO_DEPS, LIB_DEPS and DEPENDS to common .inc
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
X-List-Received-Date: Thu, 13 Oct 2011 11:42:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc   |    5 +++++
 meta/recipes-graphics/mesa/mesa-dri_7.11.bb  |    7 ++-----
 meta/recipes-graphics/mesa/mesa-dri_git.bb   |    6 ++----
 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb |    5 -----
 4 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 1596832..89ef0cf 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -18,6 +18,11 @@ PE = "2"
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
 S = "${WORKDIR}/Mesa-${PV}"
 
+PROTO_DEPS = "xf86driproto glproto"
+LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-native"
+
+DEPENDS = "makedepend-native python-native ${PROTO_DEPS} ${LIB_DEPS}"
+
 PROVIDES = "virtual/libgl"
 
 # for mesa-dri and mesa-xlib
diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
index 90873aa..8ab1941 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
@@ -1,11 +1,8 @@
 include mesa-common.inc
 include mesa-${PV}.inc
 
-PROTO_DEPS = "xf86driproto glproto dri2proto"
-LIB_DEPS = "libdrm virtual/libx11 libxext libxxf86vm libxdamage libxfixes expat \
-            libxml2-native"
-
-DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS} makedepend-native python-native"
+PROTO_DEPS += "dri2proto"
+LIB_DEPS += "libdrm expat"
 
 PR = "${INC_PR}.0"
 
diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-graphics/mesa/mesa-dri_git.bb
index c50ba15..10ebd1c 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_git.bb
@@ -6,10 +6,8 @@ SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
 #           file://mesa-DRI2Swapbuffer.patch "
 S = "${WORKDIR}/git"
 
-PROTO_DEPS = "xf86driproto glproto dri2proto"
-LIB_DEPS = "libdrm virtual/libx11 libxext libxxf86vm libxdamage libxfixes expat"
-
-DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS}"
+PROTO_DEPS += "dri2proto"
+LIB_DEPS += "libdrm expat"
 
 SRCREV = "1bf94d419805538ac23a4d0b04d31ac5e4487aca"
 PV = "7.7+git${SRCPV}"
diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb b/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
index 44719a0..08277ac 100644
--- a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
+++ b/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
@@ -1,11 +1,6 @@
 include mesa-common.inc
 include mesa-${PV}.inc
 
-PROTO_DEPS = "xf86driproto glproto"
-LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-native"
-
-DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS} makedepend-native"
-
 PR = "${INC_PR}.0"
 
 EXTRA_OECONF += "--with-driver=xlib --without-gallium-drivers"
-- 
1.7.7



