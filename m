Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4BB2A7D007
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 21:10:56 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id x3so1393190pff.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 14:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=m2JO36mGU8p2TRoV4nQiX/Oy1+4Hm9YD5hCuTAH++3I=;
	b=nWaL8Z07oU3U9giSxSG/EkP24pY8lH49sMEpPKzXVvfT4HOvvM2nh6mhW5RyOeeW1/
	iwh7LB2aQTOlwy0VDood8n0v93F3FT7GZZB4X/TZWR7NDA+akGsf7yo7YF7nWg/pggof
	Ru1Lkmar5LxA38S29A2yyAPe/7l/Hh4aZZLT0GERVc+7CMx3kiwaZHFNQs96BYnxqXZn
	8fTyKENw6hUh3TQwZyp/M7vG+pyaWDXMm1bChzfo/BwFfFqALyld2SYNVc0z51tlI/2q
	EWiLqaFyueV9EroHVCcj0tEnOnGuUmibD0BUTD9W3DqjmkzLYAT58Fl3A32AgfIZxN9z
	9Sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m2JO36mGU8p2TRoV4nQiX/Oy1+4Hm9YD5hCuTAH++3I=;
	b=ntAEr/bG/xvrdmAc9vXJbvqiwZj4yUeN9irQ6mrXko5r8JErEYFXrkSbueX882v6eo
	luBJRtPJWGXPQq/Jqz80EpNerpTkxYG/SXVktIRR5pY7afRerm5A0zEuE6xWNhAnk603
	2A20yyRpDupySjT4QFOdshq0SVoH7MudS82oBf0w6kon/VKBU+2l60ex9Sff8B4VOX5S
	TejgBvdiK4DPhtv6uzHM/2Y81E/f7z+qA8PBmyyv7U0itcyv22sUVhxwDaA48qrQZnhx
	cm8VUBiyDaYGTs4+uyYLjScddEcjVxdWvuMvQblrwwjYCZ9wT+96DbHAALVpTC7pDtPC
	/uqg==
X-Gm-Message-State: APjAAAX/EmFJBQvp88eXEABDnbtUatKHFo4bzOaISubCKPvOc+mFaNJF
	O2qQaDAMlbvcCJKr4uAHSuzp/dOi
X-Google-Smtp-Source: APXvYqwIuvcVZMANPiUrypomq8P1BqWZV3pqrw5mQIb7NILJZcuoXTDqR+iRqh7ZbOnyqEwiQvFKsg==
X-Received: by 2002:aa7:8145:: with SMTP id d5mr12939885pfn.11.1559337057254; 
	Fri, 31 May 2019 14:10:57 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d8eb:da43:9914:3fc9])
	by smtp.gmail.com with ESMTPSA id c9sm6130010pje.3.2019.05.31.14.10.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 31 May 2019 14:10:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 14:10:54 -0700
Message-Id: <1559337054-16560-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH] cairo: fix CVE-2018-19876 CVE-2019-6461 CVE-2019-6462
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
X-List-Received-Date: Fri, 31 May 2019 21:10:56 -0000

From: Ross Burton <ross.burton@intel.com>

Source: OpenEmbedded.org
MR: 97538, 97543
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/openembedded-core/commit/meta/recipes-graphics/cairo?h=warrior&id=078e4d5c2114d942806cd0d5ad501805a011e841
ChangeID: fa8bdd44ad8613bb0679a1f6d9d670c3b47a0677
Description:

CVE-2018-19876 is a backport from upstream.

CVE-2019-6461 and CVE-2019-6462 are patches taken from Clear Linux.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Dropped CVE-2018-19876, not affected]
Issue was introduced in 1.15.8 by:
commit 721b7ea0a785afaa04b6da63f970c3c57666fdfe

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-graphics/cairo/cairo/CVE-2019-6461.patch | 19 +++++++++++++++++++
 .../recipes-graphics/cairo/cairo/CVE-2019-6462.patch | 20 ++++++++++++++++++++
 meta/recipes-graphics/cairo/cairo_1.14.12.bb         |  2 ++
 3 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
 create mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch

diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch b/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
new file mode 100644
index 0000000..5232cf7
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
@@ -0,0 +1,19 @@
+There is a potential infinite-loop in function _arc_error_normalized().
+
+CVE: CVE-2019-6461
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/src/cairo-arc.c b/src/cairo-arc.c
+index 390397bae..f9249dbeb 100644
+--- a/src/cairo-arc.c
++++ b/src/cairo-arc.c
+@@ -99,7 +99,7 @@ _arc_max_angle_for_tolerance_normalized (double tolerance)
+     do {
+ 	angle = M_PI / i++;
+ 	error = _arc_error_normalized (angle);
+-    } while (error > tolerance);
++    } while (error > tolerance && error > __DBL_EPSILON__);
+ 
+     return angle;
+ }
diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch b/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
new file mode 100644
index 0000000..4e4598c
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
@@ -0,0 +1,20 @@
+There is an assertion in function _cairo_arc_in_direction().
+
+CVE: CVE-2019-6462
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/src/cairo-arc.c b/src/cairo-arc.c
+index 390397bae..1bde774a4 100644
+--- a/src/cairo-arc.c
++++ b/src/cairo-arc.c
+@@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t	  *cr,
+     if (cairo_status (cr))
+         return;
+ 
+-    assert (angle_max >= angle_min);
++    if (angle_max < angle_min)
++       return;
+ 
+     if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRCLES) {
+ 	angle_max = fmod (angle_max - angle_min, 2 * M_PI);
diff --git a/meta/recipes-graphics/cairo/cairo_1.14.12.bb b/meta/recipes-graphics/cairo/cairo_1.14.12.bb
index 18b9479..08026c4 100644
--- a/meta/recipes-graphics/cairo/cairo_1.14.12.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.14.12.bb
@@ -25,6 +25,8 @@ DEPENDS = "fontconfig glib-2.0 libpng pixman zlib"
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
            file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \ 
            file://0001-cairo-Fix-CVE-2017-9814.patch \
+           file://CVE-2019-6461.patch \
+           file://CVE-2019-6462.patch \
           "
 
 SRC_URI[md5sum] = "9f0db9dbfca0966be8acd682e636d165"
-- 
2.7.4


