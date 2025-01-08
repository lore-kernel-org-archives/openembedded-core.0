Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DDDE7719A
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 08:42:50 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.14221.1736325762251254877
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 00:42:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DZNQFfO9;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa6c0dbce1fso2300109966b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 00:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325761; x=1736930561; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5HvMQcbYk5bemzVov40uiGKWnjCsCkHpy+nD0Uagbg=;
        b=DZNQFfO9tK17mIoUUbcX+QEPtx3xQ5ExKO+7Bc0VR0TVW3zFYLbHgRoaHwjiNcOK3B
         QDJ+lZbwb0/Ofg1Q9UIeZpX+wP92PulfzPP2lSWiithswoOZBAAjb/je8q96WmDrzpsH
         xhxju8IDIhGcAg0Q38eTW3X4Sd2opH61A8iTVtJomuZgZFZgxyz1FUUNUhIj1dM99mdI
         lwk8kZOesbnF6eIwzJAfp9M8ApqSuDgeQozwaiDUBdUiRlIW6WlPHRF8AYADNPJDnsTF
         s94Ne1E64bYt+7OaMd1A1+grcKwGfXabQGMiWDMgWMeE6FfgFNbM21Cmey0qeNup1jA6
         C/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325761; x=1736930561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d5HvMQcbYk5bemzVov40uiGKWnjCsCkHpy+nD0Uagbg=;
        b=Z6Z2gGfN7dnHhDaQc62jhirFs1Mpc80ChB7hac5m6R9CX+QQek3gFmWndf6Ua1w7Tx
         DvVJ+VGlcanoaUxV+Qi4gx15G9BGY8R0kyYUmLm/GzYyrK4svvKyagx5IUn77USwhWRD
         89A4PDg67dw3S+d9DCV8JQ5gCM9Bc1Lu8zWV1K43v5YBD9xCBekK2EpB0ZrAGlRxSRKq
         CavwlDT0F90FHDoOVrmd4b3kj0jNjNhja7vf/5UVo45uHGkjdnvoKSDi6BedQX5Fy5PW
         x5F3JEOItlX8wbLYNI09/f0lguTS8bK28nhTX2gO/dzX+Ixw/uEa4rNWkhRhbBu6QJBE
         JJBw==
X-Gm-Message-State: AOJu0YyCqskW4rjOGcUkC7+zKjzcCCshmmPxpDM9gE988h9FuYkvizBB
	KIA76HU/h+Jy/HtujKjDongk0wN7hamVrv9O5vgdNbFPnTCsFuWqUX24Gg==
X-Gm-Gg: ASbGncuRO27WZWBm7QLsD4hagjbPTmhFIJM3vUZSuc7kSasPSZ8n+yBY/dpTM3TYSd1
	tNLOt07Dv5FKC3KDfu6hUDmz7KFR6UQY0Ya0tpiLn5BSQp4v7KssBxoO8EPy4AYfRRy4aJwp2Kr
	qBqKglRM6vNnQGErRfX96TT82yYnonlFo+BjmQita3ouhS+/b3EYXv5kd42k5SqiIqZV9VgteeI
	ggC4NaxRAMSJX3RkOd7V+rKqyLJBl0WnJ6O9gFZjDCodbD5N8tGNw/0rUODyuNIs3sc/GbNJk8U
	Ufg1LOO1pnDJxvm8Aw==
X-Google-Smtp-Source: AGHT+IGAG1Sv7y6m3ENjw1Peq1EGtDR5pchWUOJ3LzMA+bgMfAwrpFyTngCaZCs+yY/ju8aJ3eQB4g==
X-Received: by 2002:a05:6402:3216:b0:5d9:d58:bcfa with SMTP id 4fb4d7f45d1cf-5d972e63d9cmr4314188a12.27.1736325760297;
        Wed, 08 Jan 2025 00:42:40 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06c7c2sm2499661766b.188.2025.01.08.00.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:42:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/20] ruby: update 3.3.6 -> 3.4.1
Date: Wed,  8 Jan 2025 09:42:21 +0100
Message-Id: <20250108084226.117178-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108084226.117178-1-alex.kanavin@gmail.com>
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209537

From: Alexander Kanavin <alex@linutronix.de>

License-update: formatting

Exclude aclocal, as aclocal.m4 is hand-maintained
(similar to recent tweaks elsewhere in core).

Find rbconfig.rb directly in ${D}, as grepping ruby's
internal file produces bogus results now.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...x-cross-compilation-of-external-gems.patch |  6 ++--
 ...ine-REG_S1-and-REG_S2-for-musl-riscv.patch |  6 ++--
 ...Obey-LDFLAGS-for-the-link-of-libruby.patch |  6 ++--
 ...doc-build-reproducible-documentation.patch |  2 +-
 ...-list-of-object-files-in-generated-M.patch |  6 ++--
 ...eproducible-change-fixing-784225-too.patch |  6 ++--
 .../0006-Make-gemspecs-reproducible.patch     | 30 +++++++++----------
 .../ruby/{ruby_3.3.6.bb => ruby_3.4.1.bb}     | 10 +++----
 8 files changed, 36 insertions(+), 36 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_3.3.6.bb => ruby_3.4.1.bb} (95%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
index bd8f736247e..f17970e9c9b 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
@@ -1,4 +1,4 @@
-From b74950d4f06bbfb91b2e68044147a226c15f4639 Mon Sep 17 00:00:00 2001
+From 03700ec256789e02de20b58bca080c6fef592336 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 30 Sep 2019 16:57:01 +0100
 Subject: [PATCH] extmk: fix cross-compilation of external gems
@@ -16,10 +16,10 @@ Signed-off-by: André Draszik <andre.draszik@jci.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/ext/extmk.rb b/ext/extmk.rb
-index d9c2417..da14c49 100755
+index 8b6b365..3048f75 100755
 --- a/ext/extmk.rb
 +++ b/ext/extmk.rb
-@@ -428,8 +428,8 @@ else
+@@ -434,8 +434,8 @@ else
  end
  $ruby = [$ruby]
  $ruby << "-I'$(topdir)'"
diff --git a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
index bc1744da82d..799324caeaa 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
@@ -1,4 +1,4 @@
-From f4edf72c76bc06fa92c61f6cb9163cc777912a1f Mon Sep 17 00:00:00 2001
+From f992d781e05b61489bdf5a2a9aee6cc616f1742a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 25 Jan 2022 20:29:14 -0800
 Subject: [PATCH] vm_dump.c: Define REG_S1 and REG_S2 for musl/riscv
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/vm_dump.c b/vm_dump.c
-index 444be4a..8a081a7 100644
+index 5873e52..9eb4db1 100644
 --- a/vm_dump.c
 +++ b/vm_dump.c
-@@ -39,6 +39,11 @@
+@@ -40,6 +40,11 @@
  
  #define MAX_POSBUF 128
  
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
index 6f95685917b..bb67df0f406 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -1,4 +1,4 @@
-From e6267676addd27f3c02667116185211d711ef940 Mon Sep 17 00:00:00 2001
+From 7e2337d8b0daf264785cb06d1d6c7d61e428a11b Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Thu, 5 May 2016 10:59:07 -0700
 Subject: [PATCH] Obey LDFLAGS for the link of libruby
@@ -10,10 +10,10 @@ Upstream-Status: Pending
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/template/Makefile.in b/template/Makefile.in
-index 8c462f2..2200c8c 100644
+index 05432cd..41a05bb 100644
 --- a/template/Makefile.in
 +++ b/template/Makefile.in
-@@ -115,7 +115,7 @@ ENABLE_SHARED = @ENABLE_SHARED@
+@@ -119,7 +119,7 @@ ENABLE_SHARED = @ENABLE_SHARED@
  LDSHARED = @LIBRUBY_LDSHARED@
  DLDSHARED = @DLDSHARED@
  XDLDFLAGS = @DLDFLAGS@
diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
index abbbd35702d..87a1e82516e 100644
--- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
@@ -1,4 +1,4 @@
-From 09a6df0d32e2177406ed391e536c0c7c4b503c5d Mon Sep 17 00:00:00 2001
+From 98071c0b28a45cd21a2cbe6746ce39067932b62f Mon Sep 17 00:00:00 2001
 From: Christian Hofstaedtler <zeha@debian.org>
 Date: Tue, 10 Oct 2017 15:04:34 -0300
 Subject: [PATCH] rdoc: build reproducible documentation
diff --git a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
index f08aaf555f3..4b6771fd268 100644
--- a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
+++ b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
@@ -1,4 +1,4 @@
-From f491fff7d006954c1c51eb7a513a85bdbab0fe5a Mon Sep 17 00:00:00 2001
+From 0887facc4ca5bcb0280b025b35bbc18528e52914 Mon Sep 17 00:00:00 2001
 From: Reiner Herrmann <reiner@reiner-h.de>
 Date: Tue, 10 Oct 2017 15:06:13 -0300
 Subject: [PATCH] lib/mkmf.rb: sort list of object files in generated Makefile
@@ -17,10 +17,10 @@ Signed-off-by: Reiner Herrmann <reiner@reiner-h.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/mkmf.rb b/lib/mkmf.rb
-index 6da7dde..3af30a9 100644
+index 768a152..f16cdd8 100644
 --- a/lib/mkmf.rb
 +++ b/lib/mkmf.rb
-@@ -2368,7 +2368,7 @@ LOCAL_LIBS = #{$LOCAL_LIBS}
+@@ -2480,7 +2480,7 @@ LOCAL_LIBS = #{$LOCAL_LIBS}
  LIBS = #{$LIBRUBYARG} #{$libs} #{$LIBS}
  ORIG_SRCS = #{orig_srcs.collect(&File.method(:basename)).join(' ')}
  SRCS = $(ORIG_SRCS) #{(srcs - orig_srcs).collect(&File.method(:basename)).join(' ')}
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index 248158b6dca..eda45dd862b 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From d2376d94b4d285062b67803dc3278d58c14a5297 Mon Sep 17 00:00:00 2001
+From ff25f6dddcfbbb7b0464485bb5132458866ab51a Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -12,10 +12,10 @@ Upstream-Status: Backport [debian]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index e438669..3ce9af8 100644
+index 8f353ae..095125f 100644
 --- a/lib/rubygems/specification.rb
 +++ b/lib/rubygems/specification.rb
-@@ -1707,7 +1707,9 @@ class Gem::Specification < Gem::BasicSpecification
+@@ -1711,7 +1711,9 @@ class Gem::Specification < Gem::BasicSpecification
                  raise(Gem::InvalidSpecificationException,
                        "invalid date format in specification: #{date.inspect}")
                end
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
index 8a1daba7bdb..121bdcf3abf 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -1,4 +1,4 @@
-From 42f8019e62f392f5bc09c25e90cc63123eb764fe Mon Sep 17 00:00:00 2001
+From d58bdaca3d5379afcb954bb57c690c7736807ec5 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -8,17 +8,17 @@ build unreproducible
 
 Upstream-Status: Backport [debian]
 ---
- ext/bigdecimal/bigdecimal.gemspec | 1 +
- ext/fiddle/fiddle.gemspec         | 1 +
- ext/io/console/io-console.gemspec | 1 +
- lib/ipaddr.gemspec                | 1 +
- lib/rdoc/rdoc.gemspec             | 1 +
+ .bundle/gems/bigdecimal-3.1.8/bigdecimal.gemspec | 1 +
+ ext/fiddle/fiddle.gemspec                        | 1 +
+ ext/io/console/io-console.gemspec                | 1 +
+ lib/ipaddr.gemspec                               | 1 +
+ lib/rdoc/rdoc.gemspec                            | 1 +
  5 files changed, 5 insertions(+)
 
-diff --git a/ext/bigdecimal/bigdecimal.gemspec b/ext/bigdecimal/bigdecimal.gemspec
-index f9f3b45..b9a469d 100644
---- a/ext/bigdecimal/bigdecimal.gemspec
-+++ b/ext/bigdecimal/bigdecimal.gemspec
+diff --git a/.bundle/gems/bigdecimal-3.1.8/bigdecimal.gemspec b/.bundle/gems/bigdecimal-3.1.8/bigdecimal.gemspec
+index b6ef8fd..596b8bb 100644
+--- a/.bundle/gems/bigdecimal-3.1.8/bigdecimal.gemspec
++++ b/.bundle/gems/bigdecimal-3.1.8/bigdecimal.gemspec
 @@ -14,6 +14,7 @@ Gem::Specification.new do |s|
    s.name          = name
    s.version       = source_version
@@ -28,7 +28,7 @@ index f9f3b45..b9a469d 100644
  
    s.summary       = "Arbitrary-precision decimal floating-point number library."
 diff --git a/ext/fiddle/fiddle.gemspec b/ext/fiddle/fiddle.gemspec
-index 8781093..efdca32 100644
+index 0092f52..f77c224 100644
 --- a/ext/fiddle/fiddle.gemspec
 +++ b/ext/fiddle/fiddle.gemspec
 @@ -8,6 +8,7 @@ end
@@ -40,10 +40,10 @@ index 8781093..efdca32 100644
    spec.email         = ["aaron@tenderlovemaking.com", "hsbt@ruby-lang.org"]
  
 diff --git a/ext/io/console/io-console.gemspec b/ext/io/console/io-console.gemspec
-index d4f5276..8f89611 100644
+index 0a19992..4a80529 100644
 --- a/ext/io/console/io-console.gemspec
 +++ b/ext/io/console/io-console.gemspec
-@@ -4,6 +4,7 @@ _VERSION = "0.7.1"
+@@ -12,6 +12,7 @@ end
  Gem::Specification.new do |s|
    s.name = "io-console"
    s.version = _VERSION
@@ -52,7 +52,7 @@ index d4f5276..8f89611 100644
    s.email = "nobu@ruby-lang.org"
    s.description = "add console capabilities to IO instances."
 diff --git a/lib/ipaddr.gemspec b/lib/ipaddr.gemspec
-index 1f4798e..48743cf 100644
+index 5719f83..fe76260 100644
 --- a/lib/ipaddr.gemspec
 +++ b/lib/ipaddr.gemspec
 @@ -18,6 +18,7 @@ end
@@ -64,7 +64,7 @@ index 1f4798e..48743cf 100644
    spec.email         = ["knu@idaemons.org", "ume@mahoroba.org"]
  
 diff --git a/lib/rdoc/rdoc.gemspec b/lib/rdoc/rdoc.gemspec
-index 93a281c..cc5c155 100644
+index 3144df5..65c313f 100644
 --- a/lib/rdoc/rdoc.gemspec
 +++ b/lib/rdoc/rdoc.gemspec
 @@ -7,6 +7,7 @@ end
diff --git a/meta/recipes-devtools/ruby/ruby_3.3.6.bb b/meta/recipes-devtools/ruby/ruby_3.4.1.bb
similarity index 95%
rename from meta/recipes-devtools/ruby/ruby_3.3.6.bb
rename to meta/recipes-devtools/ruby/ruby_3.4.1.bb
index 6751b36a448..09415a31326 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.6.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.4.1.bb
@@ -10,7 +10,7 @@ LICENSE = "Ruby | BSD-2-Clause | BSD-3-Clause | GPL-2.0-only | ISC | MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5b8c87559868796979806100db3f3805 \
                     file://BSDL;md5=8b50bc6de8f586dc66790ba11d064d75 \
                     file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://LEGAL;md5=81e6a4d81533b9263da4c3485a0ad883 \
+                    file://LEGAL;md5=eff3bb1382b590cc5814f1f3de6eb4e5 \
                     "
 
 DEPENDS = "zlib openssl libyaml libffi"
@@ -32,6 +32,7 @@ UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
 inherit autotools ptest pkgconfig
 
+EXTRA_AUTORECONF += "--exclude=aclocal"
 
 # This snippet lets compiled extensions which rely on external libraries,
 # such as zlib, compile properly.  If we don't do this, then when extmk.rb
@@ -47,7 +48,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "8dc48fffaf270f86f1019053f28e51e4da4cce32a36760a0603a9aee67d7fd8d"
+SRC_URI[sha256sum] = "3d385e5d22d368b064c817a13ed8e3cc3f71a7705d7ed1bae78013c33aa7c87f"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
@@ -78,8 +79,7 @@ EXTRA_OECONF:append:libc-musl = "\
 PARALLEL_MAKEINST = ""
 
 do_install:append:class-target () {
-    # Find out rbconfig.rb from .installed.list
-    rbconfig_rb=`grep rbconfig.rb ${B}/.installed.list`
+    rbconfig_rb=`find ${D} -name rbconfig.rb`
     # Remove build host directories
     sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' \
            -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
@@ -88,7 +88,7 @@ do_install:append:class-target () {
            -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
            -e 's:${RECIPE_SYSROOT}::g' \
            -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
-        ${D}$rbconfig_rb
+        $rbconfig_rb
 
     sed -i -e 's|${DEBUG_PREFIX_MAP}||g' \
         ${D}${libdir}/pkgconfig/*.pc
-- 
2.39.5


