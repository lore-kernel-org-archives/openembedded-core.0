Received: from mail-la0-f43.google.com ([209.85.215.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tsunb-0007ge-Kt
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 13:30:27 +0100
Received: by mail-la0-f43.google.com with SMTP id eg20so1770258lab.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 04:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=0tCtZ61SotK7lAPdBqRgdgMko0DfpAb+zRr3XQTtJHk=;
	b=Ef+sTNd5AsJMH5jTgEuv2BAUbGo/sKgfg15mjfpXKauph+bmmVUL1QXFigb7JvKDop
	QSng6EJc9MjgZVaFKiBRwEP5PLKNny11nd69rNfE4FnHUN8uXweImHAYmAsm3+YYZfcx
	kQ5qPJyNCSIwlS5O8fM4nGcMu2uhm0Ta4c38Ev9qmjMB+k82ixah2ogpT+UPkZ8QutbN
	tVE+Ixj225XOdtnQXuGqlerx0zpFdSVoRZf4wFy5qTRQ6amnYssVIuL7kfvk1Fb2VqjS
	48dVKxGBOpGlQAnU9dvuDHAS4VsQZG6mLtUMSkt5XJ+dAbBEiJsAWdNwH3lXeuDgpyK0
	iwZg==
X-Received: by 10.152.103.99 with SMTP id fv3mr64077554lab.16.1357733715575;
	Wed, 09 Jan 2013 04:15:15 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id ft8sm25769569lab.9.2013.01.09.04.15.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Jan 2013 04:15:14 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TsuY8-00060W-5F; Wed, 09 Jan 2013 14:14:28 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jan 2013 14:13:53 +0200
Message-Id: <1357733634-23036-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357733634-23036-1-git-send-email-cazfi74@gmail.com>
References: <1357733634-23036-1-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v3 1/2] harfbuzz: add recipe, version 0.9.10
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
X-List-Received-Date: Wed, 09 Jan 2013 12:30:29 -0000

OpenType text shaping engine HarfBuzz is dependency of pango >= 1.32
This depends on all of glib-2.0, cairo, and freetype to consistently
provide all backends. Otherwise it would, in typical case, depend
on build order of these packages. HarfBuzz configure would pick those
backends for which dependencies happen to be built before it.
Similarly graphite is consistenly disabled if there ever happens
to be recipe for it.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../harfbuzz-0.9.10/disable_graphite.patch         |   15 ++++++++++
 meta/recipes-graphics/harfbuzz/harfbuzz_0.9.10.bb  |   29 ++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz-0.9.10/disable_graphite.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz_0.9.10.bb

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz-0.9.10/disable_graphite.patch b/meta/recipes-graphics/harfbuzz/harfbuzz-0.9.10/disable_graphite.patch
new file mode 100644
index 0000000..49938ba
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz-0.9.10/disable_graphite.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Inappropriate [disable feature]
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd harfbuzz-0.9.10/configure.ac harfbuzz-0.9.10/configure.ac
+--- harfbuzz-0.9.10/configure.ac	2013-01-03 08:08:51.000000000 +0200
++++ harfbuzz-0.9.10/configure.ac	2013-01-09 08:18:04.812529418 +0200
+@@ -185,7 +185,7 @@
+
+ dnl ==========================================================================
+
+-PKG_CHECK_MODULES(GRAPHITE2, graphite2, have_graphite=true, have_graphite=false)
++have_graphite=false
+ if $have_graphite; then
+     AC_DEFINE(HAVE_GRAPHITE2, 1, [Have Graphite library])
+ fi
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.10.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.10.bb
new file mode 100644
index 0000000..0dd6301
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.10.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Text shaping library"
+DESCRIPTION = "HarfBuzz is an OpenType text shaping engine."
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/HarfBuzz"
+BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=HarfBuzz"
+
+LICENSE = "Old-MIT | UCDN | ICU | HarfBuzz-old"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
+                    file://src/hb-ucdn/COPYING;md5=994ba0f1295f15b4bda4999a5bbeddef \
+                    file://src/hb-icu-le/COPYING;md5=0ac60acf068e2cc9facdf86169a9c13e \
+                    file://src/hb-icu-le/license.html;md5=9136737088bbfbbf86d9a714da49fb89 \
+                    file://src/hb-old/COPYING;md5=6e8442c12d498ce55cfe39fc60f97981 \
+"
+
+SECTION = "libs"
+
+PR = "r0"
+
+SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-${PV}.tar.bz2 \
+           file://disable_graphite.patch \
+"
+
+SRC_URI[md5sum] = "deec04f2281bef6323f4ad1dabbf75f7"
+SRC_URI[sha256sum] = "1f8c281ded05290fd1964c0e11a2bde607713b33d0c8122a8d230452d99c2e23"
+
+inherit autotools pkgconfig
+
+DEPENDS = "icu glib-2.0 cairo freetype"
+
+BBCLASSEXTEND = "native"
-- 
1.7.10.4



