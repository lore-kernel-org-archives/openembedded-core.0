Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id C0BAE6CEA7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2013 14:13:34 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id t60so3336355wes.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2013 07:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=OIOjsPDieXkobEXKbaFya+vILc4psWDyye4YlW91oqw=;
	b=V6NPHlusB9u92k6/GdeEVF1jrIKzl47umu7PdSM5yevj3dLImS0v8JFJ2BL7LxGFlz
	R9k5BAN2bpJbfPWDpKims6s6OP7+AtGZxx69fWkYvQeLgqmq2m8qPojgoboGVOIfPQDq
	T4fPKnsT7v6IlyLAV/NAUsMqPsCMJjiNGVT9qZ4iP/2W4fetpI3cmSVqKeMPghqkSljp
	xfoH4lHvJAuLILmmSJ8S8OFLI6iKgWFOEcoBJdXx8JAwfjYRgpiZbcGe1dITJ2P9tCY7
	+sEW4bAFdGMEFSJEge0H+FlpS7IupV8pAlNIgkqrNfxegM8jIP6u2WHkj3rGgRvmIcQs
	IH2g==
X-Gm-Message-State: ALoCoQnTKl7FJNOOLBHuF1i9jqwzwOJwMjYCx/T4mcY1960T0JuYV3ex0cwu2bDdaP1BRLSeBYcD
X-Received: by 10.194.104.71 with SMTP id gc7mr1909566wjb.45.1381241616256;
	Tue, 08 Oct 2013 07:13:36 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id dq11sm5551459wid.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Oct 2013 07:13:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2013 15:13:22 +0100
Message-Id: <1381241603-29429-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381241603-29429-1-git-send-email-ross.burton@intel.com>
References: <1381241603-29429-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/4] pango: fix x11 DISTRO_FEATURE check
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
X-List-Received-Date: Tue, 08 Oct 2013 14:13:35 -0000

--without-x was removed in 1.32.0, so the correct option is now --without-xft.

Also remove --disable-glibtest, as configure.ac doesn't invoke that test.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/pango/pango.inc |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index ea360c7..17006d3 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -13,7 +13,7 @@ X11DEPENDS = "virtual/libx11 libxft"
 DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo harfbuzz"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-PACKAGECONFIG[x11] = "--with-x,--without-x,${X11DEPENDS}"
+PACKAGECONFIG[x11] = "--with-xft,--without-xft,${X11DEPENDS}"
 
 BBCLASSEXTEND = "native"
 DEPENDS_class-native = "glib-2.0-native cairo-native harfbuzz-native"
@@ -34,8 +34,7 @@ EXTRA_AUTORECONF = ""
 # seems to go wrong with default cflags
 FULL_OPTIMIZATION_arm = "-O2"
 
-EXTRA_OECONF = "--disable-glibtest \
-		--disable-introspection \
+EXTRA_OECONF = "--disable-introspection \
 		--enable-explicit-deps=no \
 	        --disable-debug \
 	        --with-mlprefix=${MLPREFIX}"
-- 
1.7.10.4


