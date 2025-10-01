Return-Path: <anna-lena.marx@inovex.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BADCCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 15:29:06 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.4.1759332536208232757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 08:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@inovex.de header.s=google header.b=Zw7njADh;
 spf=pass (domain: inovex.de, ip: 209.85.208.52, mailfrom: anna-lena.marx@inovex.de)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62fc89cd68bso36574a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 08:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inovex.de; s=google; t=1759332534; x=1759937334; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nhDK7GfV8FTpshd+7N1Scqfr3fqaeYEaGC1Fpobuxv4=;
        b=Zw7njADhJnu1McpX9bE3COU4RfRM0I3/64vcTut1Y3itRcoDtfHS4LYbhCerVWDNsS
         15J9T/hr87m0gu0DMuSk7F7cJAfsU64QtzvNTS658FowAxB81AoyUhiEXxeZJ6do8OnP
         dBDGJXpOwgvGl3PlYxChZYc+Leh+e3EI6ILIYKyUtAxOa5DClvpY9nmuNB9OAkOnh97i
         4OwdNT+11gBsiBCwCqNI20b5bH937TMPTTs/tiVpMkh0wAgrDH5JHW/naXANaiuyt6rf
         V8cpI0lzyyTThTbM2ZH42gmYt135tqUHA2rODeyEQMYcqtoQOXtPKErfXRtKCPo1YKYf
         eYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759332534; x=1759937334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhDK7GfV8FTpshd+7N1Scqfr3fqaeYEaGC1Fpobuxv4=;
        b=Rqoe6wC2QwEmmb+s6Qa1P3BZ6SXEOvqdO1f588AG4mjLmBKaNYDrFygG6lVCL5LcrN
         iLdoDPwmtCE6Xm33uL9ell5UXnmwm3ThpReWdH/2YMZgO+RYWFNP5Gs95XT43/CfrWAt
         QQb79jsLZS2OOth6bluZ27GQBYVS4KmqSTaF3UiO7h6t77bL4sVBHrwGlJtEz56ohb2W
         9C9jPaJglN964czvwrcLUMDFsh0sD5CxxIHjOR+9+ayOGcw9ANM7Lj0ohMcZtY/dY2xf
         PJuoywxMyIan7nA+nXH0RXQJYMbOH0kx+wINHIVU2K/01pVI/EWwF2St0X5yjUpNCtT2
         XFWg==
X-Gm-Message-State: AOJu0YzZx98IU3YrfxQc+8I6gv3Kk6PBSocc7Gl84wbJ/qsHZT9H/7dG
	RqNayDmXvATRs/87aIM7KpThGWgaT8VNHqapiZZQob7dQvwgyOi6zwEJ8F43FgspSnTipQ9mBA+
	syAiLx0hMqDvQP+BjyMvzNNeGbu7jol8evfVQuShAq59FE13p4in2uFpRrAfjZoZT8dlIIxJnKI
	zHNgFHmstdZhyRKdumg0FN+G/dx74Vi9aRinogYyxBpSBg3W1l6D9v8XJklc2vdhyAQnlirdI=
X-Gm-Gg: ASbGncu0CGpDAm67aiJ2U7WsinLsQhMxcUyUS3NURomNX8veWjAXiZXhzCdy7N3xvk6
	qiAb+M+EzAr8UzlFVfOf+opr/JvMp5m25fK5UI41XEpHmhXBprvwiyO6Lhck+swW2t+FjEDFnFD
	FPw32ezBbpbIli0fm+diKWN9Em5DuAchYO9bPG6n8fzVW35sMgb+94a9AuMXA7Gd4ArfNmuCr0S
	8UAr1nmYxeUsRvynEXRNmsYQVstX5UIxAp1F1d3ewIHihIAA5AG0R5Gp0snb0H5OACpMF6tN8b/
	f/5NTDnUy9OjmJm8Kbqn+E96AwAZvzGGcBxMOoUUOaRRMEziH5eHI6DgBEh3jVAXS6CgMceqdat
	wz467GYBixe9lBvkrenoKUUSkKeGp5+4SiGMidO7DWAkxqlO97IdZQgAjkx03NzIDUgqRNVX2Gy
	0Msq7kRA4Opov2FEpJx8r/5Sdn9BN5CDzAgCcIZRleGa4X1l7TtA==
X-Google-Smtp-Source: AGHT+IHpp+eEpWO0osQkmg6Z4kDMv/OugypicoKVvkgfnb6WSsjDrhI8F9JK/6KIsN8yxZs1CP6biA==
X-Received: by 2002:a05:6402:2116:b0:634:a244:287e with SMTP id 4fb4d7f45d1cf-63678caec8dmr4304560a12.23.1759332533773;
        Wed, 01 Oct 2025 08:28:53 -0700 (PDT)
Received: from Phoenix.mgmt.kapp.inovex.de (ip-109-090-185-132.um36.pools.vodafone-ip.de. [109.90.185.132])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634c1ca9ac9sm9767384a12.38.2025.10.01.08.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 08:28:53 -0700 (PDT)
From: Anna-Lena Marx <anna-lena.marx@inovex.de>
To: openembedded-core@lists.openembedded.org
Cc: Anna-Lena Marx <anna-lena.marx@inovex.de>
Subject: [PATCH] sqlite3: upgrade 3.48.0 -> 3.50.4
Date: Wed,  1 Oct 2025 17:28:50 +0200
Message-ID: <20251001152850.1342075-1-anna-lena.marx@inovex.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 15:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224308

With the upgrade to 3.50.4, some configure options changed
as the project switched from `autotools` to `autosetup`.
The PACKAGECONFIG "dyn_ext" is not longer available.
Besides, the default CONFIGUREOPTS "target", "exec_prefix"
and "oldincludedir" became invalid.

Changelog: https://sqlite.org/releaselog/3_50_4.html

Signed-off-by: Anna-Lena Marx <anna-lena.marx@inovex.de>
---
 meta/recipes-support/sqlite/sqlite3.inc          | 16 ++++++++++++----
 .../{sqlite3_3.48.0.bb => sqlite3_3.50.4.bb}     |  2 +-
 2 files changed, 13 insertions(+), 5 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.48.0.bb => sqlite3_3.50.4.bb} (69%)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 28a33282ae..8b1d3b1528 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -23,8 +23,8 @@ CVE_PRODUCT = "sqlite"
 inherit autotools pkgconfig siteinfo
 
 # enable those which are enabled by default in configure
-PACKAGECONFIG ?= "fts4 fts5 rtree dyn_ext"
-PACKAGECONFIG:class-native ?= "fts4 fts5 rtree dyn_ext"
+PACKAGECONFIG ?= "fts4 fts5 rtree"
+PACKAGECONFIG:class-native ?= "fts4 fts5 rtree"
 
 PACKAGECONFIG[editline] = "--enable-editline,--disable-editline,libedit"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline ncurses"
@@ -33,15 +33,21 @@ PACKAGECONFIG[fts4] = "--enable-fts4,--disable-fts4"
 PACKAGECONFIG[fts5] = "--enable-fts5,--disable-fts5"
 PACKAGECONFIG[rtree] = "--enable-rtree,--disable-rtree"
 PACKAGECONFIG[session] = "--enable-session,--disable-session"
-PACKAGECONFIG[dyn_ext] = "--enable-dynamic-extensions,--disable-dynamic-extensions"
 PACKAGECONFIG[zlib] = ",,zlib"
 
 CACHED_CONFIGUREVARS += "${@bb.utils.contains('PACKAGECONFIG', 'zlib', '', 'ac_cv_search_deflate=no',d)}"
 
+# The configure options target, exec_prefix and oldincludedir
+# are not supported by sqlite3 anymore.
+CONFIGUREOPTS:remove = "--target=${TARGET_SYS}"
+CONFIGUREOPTS:remove = "--exec_prefix=${exec_prefix}"
+CONFIGUREOPTS:remove = "--oldincludedir=${includedir}"
+
 EXTRA_OECONF = " \
     --enable-shared \
     --enable-threadsafe \
     --disable-static-shell \
+    --soname=legacy \
 "
 
 # pread() is in POSIX.1-2001 so any reasonable system must surely support it
@@ -51,7 +57,7 @@ CFLAGS += "-DUSE_PREAD"
 CFLAGS += "-DSQLITE_ENABLE_COLUMN_METADATA"
 
 # Unless SQLITE_BYTEORDER is predefined, the code falls back to build time
-# huristics, which are not always correct
+# heuristics, which are not always correct
 CFLAGS += "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-DSQLITE_BYTEORDER=1234', '-DSQLITE_BYTEORDER=4321', d)}"
 
 PACKAGES = "lib${BPN} lib${BPN}-dev lib${BPN}-doc ${PN}-dbg lib${BPN}-staticdev ${PN}"
@@ -66,3 +72,5 @@ FILES:lib${BPN}-staticdev = "${libdir}/lib*.a"
 AUTO_LIBNAME_PKGS = "${MLPREFIX}lib${BPN}"
 
 BBCLASSEXTEND = "native nativesdk"
+
+INSANE_SKIP:${MLPREFIX}lib${BPN} = "useless-rpaths"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes-support/sqlite/sqlite3_3.50.4.bb
similarity index 69%
rename from meta/recipes-support/sqlite/sqlite3_3.48.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.50.4.bb
index bd2ac6614d..073f7510c7 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.50.4.bb
@@ -4,5 +4,5 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
+SRC_URI[sha256sum] = "a3db587a1b92ee5ddac2f66b3edb41b26f9c867275782d46c3a088977d6a5b18"
 
-- 
2.51.0


