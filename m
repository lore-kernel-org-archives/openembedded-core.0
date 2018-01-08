Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2D6A278980
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 16:00:53 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n138so15027133wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jan 2018 08:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CRb6O5ZASxr5XGVlJUyJexsUIrIaojKHRGxDol/9t9A=;
	b=TWaDl3yqel9LaIe8eRdJaLpHp7P5qJD8hgaOTULISlXJ1MWKjo23h6aedQ+XBhyLNn
	DHc2toY3KzeyiIf9a91Lg7x2lyPcm8UlwhGeun24SCPoDq4LHyZprsea//e3A382/Iop
	9gRjj3yhf/lZz6vlbyXk0oYzIfTHY/V03A2XFp5nNOq5I+Yhmxz1RsGqzxo+2QGnSxk2
	i1rL/snMz1P1CF5bPA6Ml3GFpZfK/f2+Vtowdbih887YZ5XLhR/q/IFf47VP+yzX0z2h
	6VTlKktqD1UTDozdf34pBo2nCeRINTau+vJbmUlkP9Khv14aNqdYBbdy8SmYYj3rxh5v
	wzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CRb6O5ZASxr5XGVlJUyJexsUIrIaojKHRGxDol/9t9A=;
	b=kvlPgEuQZ47sHEeZKkVBElU3DBCAZqRT/sAi2wHOQh8fkd1DFrzJ3cHs+SL/Mz0gGO
	rAtijc+tF6tTic+1UGLHRdRXjIYw8DqxdI4i0R6ynZCJnnDGoyJXW+RPW+BH8VORlOIv
	q6Sa+nm38jaZWjP0O0JT+0YhdRiI5ki22r8a+zVBMt8bm1o+7lu/QLUG3K/4hFGhCGzU
	7cQfL82V3nrMY4tilL7dgXV/3rRKGK2TkAkT0P+IP4W3AbMBoQAu44ZSTMTEewrqnzxh
	uHEvf3DnBC6mVtZmipdGDHETB0uHEF3BFfPecQxQmbMlqocFlMFeJ5CTYDyzH3ZU/Apa
	PF0Q==
X-Gm-Message-State: AKGB3mJfx//6mEQhEGQrK6UIiOWmmoLgdw8kDMDhUjfKt6MDVBKKhu5c
	+q1qoO3E0xxIvqqKS8a2ERJdRpop
X-Google-Smtp-Source: ACJfBotRDS4sucVOsFJB5NqfRM8K1gPYYP1GQUyx0E3zLOJblQArF/Ge33/WoV7HeiJYrf2k5Td7gg==
X-Received: by 10.28.105.193 with SMTP id z62mr9575851wmh.136.1515427254436;
	Mon, 08 Jan 2018 08:00:54 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	b15sm11386658wrh.5.2018.01.08.08.00.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 08:00:53 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jan 2018 16:00:21 +0000
Message-Id: <20180108160021.4715-9-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180108160021.4715-1-ross.burton@intel.com>
References: <20180108160021.4715-1-ross.burton@intel.com>
Subject: [PATCH 9/9] gettext: rationalise optional dependencies
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
X-List-Received-Date: Mon, 08 Jan 2018 16:00:54 -0000

gettext has optional dependencies on libxml2, glib, libcroco and libunistring.
If they're not available then gettext will use internal copies, but it can also
use system libraries.

For gettext-native continue to use the internal copies to get this building
sooner rather than later, but for target use the system shared libraries.

Also gettext 0.19.7 onwards swapped expat for libxm2, so remove the build
dependency on expat.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/gettext/gettext_0.19.8.1.bb | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
index 46ea68ff5b5..25ff601a6be 100644
--- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
@@ -8,7 +8,7 @@ SECTION = "libs"
 LICENSE = "GPLv3+ & LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "gettext-native virtual/libiconv expat"
+DEPENDS = "gettext-native virtual/libiconv"
 DEPENDS_class-native = "gettext-minimal-native"
 PROVIDES = "virtual/libintl virtual/gettext"
 PROVIDES_class-native = "virtual/gettext-native"
@@ -33,18 +33,22 @@ EXTRA_OECONF += "--without-lispdir \
                  --disable-native-java \
                  --disable-openmp \
                  --disable-acl \
-                 --with-included-glib \
                  --without-emacs \
                  --without-cvs \
                  --without-git \
-                 --with-included-libxml \
-                 --with-included-libcroco \
-                 --with-included-libunistring \
                 "
 EXTRA_OECONF_append_class-target = " \
                  --with-bisonlocaledir=${datadir}/locale \
 "
 
+PACKAGECONFIG ??= "croco glib libxml libunistring"
+PACKAGECONFIG_class-native = ""
+
+PACKAGECONFIG[croco] = "--without-included-libcroco,--with-included-libcroco,libcroco"
+PACKAGECONFIG[glib] = "--without-included-glib,--with-included-glib,glib-2.0"
+PACKAGECONFIG[libxml] = "--without-included-libxml,--with-included-libxml,libxml2"
+PACKAGECONFIG[libunistring] = "--without-included-libunistring,--with-included-libunistring,libunistring"
+
 acpaths = '-I ${S}/gettext-runtime/m4 \
            -I ${S}/gettext-tools/m4'
 
-- 
2.11.0


