Return-Path: <otavio.salvador@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9D33370688
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 13:38:30 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id id10so7305736vcb.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 06:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=mZuLW35Ce6+zwortHleNqwiBbPUYlTeEkJRhC+vj3XU=;
	b=SjA22M/fPd2oa5MLiWXtyl/IRPy8glxMc5E9+hG8wPOGOgBdf7q/dbm+mVZvGlNul7
	xLY/+ufOfDBWvA2ucgYv6nIsHBz+tGdp4GhZeur4p24anzE9PheC55cntbFVkBZBsA7w
	8S/9CaJXYwIb2oakEV53Fbzuz+hxcsNOZ298uEf7mK9TMjASko6UVJPOGc7sKHFIJvV1
	gDbLi1Ys+u3rSNQJ3FY8wXL8RC9+hQui6gjSzbCFtRix+W0xqUf7hZNWHpk3UZBBnOJd
	cNx7sD8uL9VOCPYqYUCJxJM7wnDYZzki1zMfXdBDLWwNWXPHROj6pGvtNAwHUjVK5Zwt
	ubXg==
X-Received: by 10.221.24.135 with SMTP id re7mr2225458vcb.53.1406295511788;
	Fri, 25 Jul 2014 06:38:31 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.35.70.10])
	by mx.google.com with ESMTPSA id
	yx13sm2338740vdc.12.2014.07.25.06.38.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jul 2014 06:38:31 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 9EEF61C1F66DE; Fri, 25 Jul 2014 10:38:27 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Jul 2014 10:38:26 -0300
Message-Id: <1406295506-29531-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.0.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] cogl-1.0: Add libcogl-path package
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
X-List-Received-Date: Fri, 25 Jul 2014 13:38:34 -0000

The new library needs to be put in a specific package, or rootfs
generation fails as:

,----[ Error in rootfs generation ]
| Updating cache...               ########################### [100%]
| Computing transaction...error: Can't install
|   libclutter-1.0-0-1.18.2-r0@cortexa9hf_vfp_neon_mx6: unable to
|   install provider for libcogl-path.so.20:
|      error: libcogl-path20-1.18.2-r0@cortexa9hf_vfp_neon_mx6 is
|        conflicted by libcogl20-1.18.2-r0@cortexa9hf_vfp_neon_mx6
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index e25968e..b763dd5 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -8,7 +8,8 @@ DEPENDS = "glib-2.0 gdk-pixbuf"
 PACKAGES =+ "${PN}-examples \
              libcogl libcogl-dev \
              libcogl-gles2 libcogl-gles2-dev \
-             libcogl-pango libcogl-pango-dev"
+             libcogl-pango libcogl-pango-dev \
+             libcogl-path libcogl-path-dev"
 AUTOTOOLS_AUXDIR = "${S}/build"
 
 # Extra DEPENDS for PACKAGECONFIG
@@ -75,6 +76,12 @@ FILES_libcogl-pango-dev = "${includedir}/cogl/cogl-pango \
                            ${libdir}/libcogl-pango.la \
                            ${libdir}/pkgconfig/cogl-pango-1.0.pc"
 
+FILES_libcogl-path = "${libdir}/libcogl-path${SOLIBS}"
+FILES_libcogl-path-dev = "${includedir}/cogl/cogl-path \
+                          ${libdir}/libcogl-path${SOLIBSDEV} \
+                          ${libdir}/libcogl-path.la \
+                          ${libdir}/pkgconfig/cogl-path-1.0.pc"
+
 # For backwards compatibility after Debian-renaming
 RPROVIDES_libcogl = "cogl-1.0"
 RCONFLICTS_libcogl = "cogl-1.0"
-- 
2.0.0


