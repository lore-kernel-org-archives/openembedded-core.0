Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qiy4b-000258-Ln
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 02:22:05 +0200
Received: by mail-iw0-f175.google.com with SMTP id 4so3528794iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 17:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=oKm6CjlgewiTor907YEBG+6NlmhM89Ea9OfkLlYymPw=;
	b=R3xuhmTwSe1aGDrK+NBeuvdQXJjKduKFwfMaobfSJneeO0LbNjOMtrY3VlDBmZU2Gg
	tXKymwtwE784AtTVP7EE4XGvNS042DZQkLVXjewi8S7jXiAcZHVjYq5eSSyia0Ud2bsG
	9l99fmexDsjqbYc5XKEB5k56HkAxK59GCEaFY=
Received: by 10.42.131.73 with SMTP id y9mr8001593ics.125.1311034683051;
	Mon, 18 Jul 2011 17:18:03 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id b6sm3248255ibg.14.2011.07.18.17.18.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jul 2011 17:18:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 17:17:35 -0700
Message-Id: <b59388af2f59c27354950b98ab4588836f1768ec.1311034342.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
References: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
In-Reply-To: <cover.1311034342.git.raj.khem@gmail.com>
References: <cover.1311034342.git.raj.khem@gmail.com>
Subject: [PATCH 16/16] mesa-xlib: Dont use locales with uclibc
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
X-List-Received-Date: Tue, 19 Jul 2011 00:22:06 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mesa/mesa-xlib/uclibc_locale.patch             |   18 ++++++++++++++++++
 meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb     |    3 ++-
 2 files changed, 20 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-xlib/uclibc_locale.patch

diff --git a/meta/recipes-graphics/mesa/mesa-xlib/uclibc_locale.patch b/meta/recipes-graphics/mesa/mesa-xlib/uclibc_locale.patch
new file mode 100644
index 0000000..6615895
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-xlib/uclibc_locale.patch
@@ -0,0 +1,18 @@
+We disable locale on uclibc in OE therefore we do not use it if building for uclibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Inappropriate <OE config related>
+
+Index: Mesa-7.10.2/src/glsl/strtod.c
+===================================================================
+--- Mesa-7.10.2.orig/src/glsl/strtod.c	2011-01-03 16:45:51.000000000 -0800
++++ Mesa-7.10.2/src/glsl/strtod.c	2011-07-16 18:18:15.693831691 -0700
+@@ -44,7 +44,7 @@
+ double
+ glsl_strtod(const char *s, char **end)
+ {
+-#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__)
++#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD__) && !defined(__UCLIBC__)
+    static locale_t loc = NULL;
+    if (!loc) {
+       loc = newlocale(LC_CTYPE_MASK, "C", NULL);
diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb b/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
index b77df2c..848c072 100644
--- a/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
+++ b/meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
@@ -1,6 +1,7 @@
 include mesa-common.inc
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
+           file://uclibc_locale.patch \
            "
 
 SRC_URI[md5sum] = "f5de82852f1243f42cc004039e10b771"
@@ -14,6 +15,6 @@ LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes libxml2-nativ
 DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS} makedepend-native"
 
 PE = "1"
-PR = "r0"
+PR = "r1"
 
 EXTRA_OECONF += "--with-driver=xlib"
-- 
1.7.4.1



