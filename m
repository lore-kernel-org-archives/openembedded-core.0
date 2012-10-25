Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TRLg3-0003oL-VP for openembedded-core@lists.openembedded.org;
	Thu, 25 Oct 2012 13:32:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9PBJFpJ016964
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2012 12:19:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16524-05 for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2012 12:19:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9PBJ6Lm016958
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2012 12:19:07 +0100
Message-ID: <1351163946.22340.148.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Oct 2012 12:19:06 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] cogl/clutter: Explicitly depend on libdrm for GLX
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
X-List-Received-Date: Thu, 25 Oct 2012 11:32:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

cogl and clutter explicitly rely on libdrm being present when using the glx
backend. If its not listed in DEPENDS and an alternative to mesa is used, it
may not actually be present. This patch ensures it is and fixes a build
race condition which could see dependencies like clutter-box2d failing to
compile due to missing pkgconfig dependencies.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/clutter/clutter.inc b/meta/recipes-graphics/clutter/clutter.inc
index ce54ac2..5a912af 100644
--- a/meta/recipes-graphics/clutter/clutter.inc
+++ b/meta/recipes-graphics/clutter/clutter.inc
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1+"
 STDDEPENDS = "virtual/libx11 pango glib-2.0 libxfixes libxi json-glib cogl atk"
 BASE_CONF = "${@get_clutter_fpu_setting(bb, d)}"
 
-DEPENDS = "${STDDEPENDS} virtual/libgl"
+DEPENDS = "${STDDEPENDS} virtual/libgl libdrm"
 EXTRA_OECONF = "${BASE_CONF} --with-flavour=glx"
 
 FILESPATH = "${FILE_DIRNAME}/clutter"
diff --git a/meta/recipes-graphics/clutter/cogl.inc b/meta/recipes-graphics/clutter/cogl.inc
index 6878624..26f7889 100644
--- a/meta/recipes-graphics/clutter/cogl.inc
+++ b/meta/recipes-graphics/clutter/cogl.inc
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1+"
 STDDEPENDS = "virtual/libx11 pango glib-2.0 libxfixes gdk-pixbuf libxi"
 BASE_CONF = "${@get_clutter_fpu_setting(bb, d)}"
 
-DEPENDS = "${STDDEPENDS} virtual/libgl libxcomposite libxdamage"
+DEPENDS = "${STDDEPENDS} virtual/libgl libxcomposite libxdamage libdrm"
 EXTRA_OECONF = "${BASE_CONF} --with-flavour=glx"
 
 FILESPATH = "${FILE_DIRNAME}/cogl"




