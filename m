Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD1D3CA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 14:41:25 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.22704.1756392079720740814
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 07:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JUU1X6OI;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b476c67c5easo748905a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 07:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756392079; x=1756996879; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hA8PjZ6ueqR+YXgRCC+2pg6m0V03y+YucuNsBfPY+Mk=;
        b=JUU1X6OIkHqvIRp5lfXx74isnRrJrudbo3+wN2R+MRPaB0Kei/Yy6fz9ohV4bkNsxO
         253cHH1FITdsPFcKDKvEFwZ605nHco+LaGSpbqnjZGnpgQXpy1tj9fxcOCabma9PnJsD
         6icDWiImtmBvUw1TS6XAOsDRtL0fJce9VuaBaWEdJA8e0MZ3R1wQ4l/k93ChmP2QNF82
         +qHu5cmT/P8EocwJM/tM83+6pzLbYi+JQHhhPaEGWT9G/y0CCDHyIKJHa1EjrsKPWlDx
         bK8E38cR88cDYFMLgAAItALDlbyFVQMYFO+oJ77yWBDWsx+G0N/I7xIrwMAEQq7vNbon
         wmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756392079; x=1756996879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hA8PjZ6ueqR+YXgRCC+2pg6m0V03y+YucuNsBfPY+Mk=;
        b=Qgtwz7Z8/uCq8zO5R5V55SOAp02lrL93q511WOhVowZKUGyxtLBj8hKlsZN1/qnfKD
         No1LVoeJwPtLMr4XayOmAgjAlfPp0jbvK3bpY5PeHj0H7tGckis+AKXZTQLn2APWFTok
         SlLdUOLb/wmAqLTKOrVcEdRcFpAw2rVWiS5O1qkFhbEDmVgBN7ayQaB5wGpW+cX2ujHP
         5B9BvJWAL2mQyUG4pb+Z0GdvE1kWnEY1QDa+bsqb5exmQIb6GLEL8f9jFqZQiZ3mY15h
         zqq7f5atGxE/8c7hC4VJOhqv0cTQq4q7pRjInRxxqzjGXZvIXFohtTVrI4mnjzSFLF9X
         Ef0Q==
X-Gm-Message-State: AOJu0YwbzhlZvweVEmjewsnZGhLSLLlGlMTMnyUFNiyi4xvzGLYh8Dce
	gN08RrBY1jf2nAn+oGDSPzNtkJH9Dcnjb4TIW+5AhdGyHmA4Jto1q9Sq09gXGfdt
X-Gm-Gg: ASbGncslt98HYLdtOVXb1lPieqJrg/YFd9yvHaWYjU8FFNZQnG8TZyQVwo6hpWJOPcB
	uGIQhp2w7EVXcxQ3rDcGY0UokW613R87kii36qMsDZa10bUMDll2S+B3cOfEOEtk+/30qeAhEzU
	qF4Bd2nsXHLIJutqWvAeRjTTUY2H+fQvJMYSxWmTm/QHBsJSmX0GBw0+Aa6swSkBcjbOIWty5Lm
	z0z13HiT5TusmDcXJYEMTgnWpTi/rak4ntnJkwG7CV0GLI3CclhrLije7tDqmt/ElrXHya4+xne
	CCQmo+EtAmc9ldYVzOWvpkkbGi5EDmwNTLi2YEIVWGsNwwqou4PRjhMxYrY3PmqkBSCIQtQzml3
	fFv7zTV7KPTLQ1QvVSxhslf5Kv4xs+g3gJF+HdqB9ao3oubCgSiN78ZmYtl+8IW2xDNYgFTeN53
	82qlbXwTiLZb2JNKMPrrC0GK9oXmBr8TJvAl5T0wAX9E9r8pT9YDA=
X-Google-Smtp-Source: AGHT+IHYlgv+5XilStgKaI2mLregZUfJZQJ5s5nwlVkmqUSFn7Y4nxyd2jCekqud5gKOFF8Spfv5SQ==
X-Received: by 2002:a17:90b:2fcd:b0:327:ba3f:cdae with SMTP id 98e67ed59e1d1-327ba3fda12mr2347992a91.15.1756392078399;
        Thu, 28 Aug 2025 07:41:18 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::cfd6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327ab0fed32sm2707526a91.28.2025.08.28.07.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 07:41:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libnss-nis: Upgrade to 3.4
Date: Thu, 28 Aug 2025 07:41:15 -0700
Message-ID: <20250828144115.4131848-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 14:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222579

Bring following changes on top of 3.2

* 3c206b7 (origin/master, origin/HEAD) Release version 3.4
* 09f6be4 fix: Leak in nis-initgroups.c:_nss_nis_initgroups_dyn()
* d141952 Release version 3.3
* 9a5fb67 Update autoconf files
* f062d8e Remove nis-publickey.c

Drop the lld patch, its fixed upstream by dropping the concerned code

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...s_getsecretkey-export-conditional-on.patch | 78 -------------------
 .../{libnss-nis.bb => libnss-nis_3.4.bb}      |  9 +--
 2 files changed, 2 insertions(+), 85 deletions(-)
 delete mode 100644 meta/recipes-extended/libnss-nis/libnss-nis/0001-make-ake-_nss_nis_getsecretkey-export-conditional-on.patch
 rename meta/recipes-extended/libnss-nis/{libnss-nis.bb => libnss-nis_3.4.bb} (82%)

diff --git a/meta/recipes-extended/libnss-nis/libnss-nis/0001-make-ake-_nss_nis_getsecretkey-export-conditional-on.patch b/meta/recipes-extended/libnss-nis/libnss-nis/0001-make-ake-_nss_nis_getsecretkey-export-conditional-on.patch
deleted file mode 100644
index b9996d32921..00000000000
--- a/meta/recipes-extended/libnss-nis/libnss-nis/0001-make-ake-_nss_nis_getsecretkey-export-conditional-on.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From ecc9767fd8c3a1ecbfca5df18714df34995a38a3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 26 Aug 2025 22:45:54 -0700
-Subject: [PATCH] make: Make _nss_nis_getsecretkey export conditional on xdecrypt()
-
-The function _nss_nis_getsecretkey in nis-publickey.c is only
-compiled when xdecrypt() is available. This is controlled by the
-configure check AC_CHECK_FUNCS([xdecrypt]) which defines
-HAVE_XDECRYPT in config.h.
-
-However, the symbol was always listed in src/libnss_nis.map,
-regardless of whether the function was actually built. On systems
-without xdecrypt() (for example musl or certain embedded toolchains),
-this leads to a link failure:
-
-    ld: error: version script assignment of 'NSS_NIS_1.0' to symbol
-    '_nss_nis_getsecretkey' failed: symbol not defined
-
-To fix this mismatch, rename libnss_nis.map to
-libnss_nis.map.in and generate libnss_nis.map at build time:
-
- - If HAVE_XDECRYPT is defined, the symbol map is copied unchanged.
- - Otherwise, the _nss_nis_getsecretkey line is stripped out
-   with sed.
-
-Automake rules are added to src/Makefile.am so the correct
-libnss_nis.map is produced, and the linker always sees a version
-script consistent with the compiled objects.
-
-This ensures _nss_nis_getsecretkey is exported only when it exists
-in the object code, preventing build failures on platforms where
-xdecrypt() is missing.
-
-This fixes build with LLD linker which defaults to not accepting
-undefined symbols
-
-Upstream-Status: Submitted [https://github.com/thkukuk/libnss_nis/pull/12]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/Makefile.am                           | 18 +++++++++++++++++-
- src/{libnss_nis.map => libnss_nis.map.in} |  0
- 2 files changed, 17 insertions(+), 1 deletion(-)
- rename src/{libnss_nis.map => libnss_nis.map.in} (100%)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index e1a9bb2..cc32ea9 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -22,8 +22,24 @@ nss_loader_test_LDADD = -ldl
- 
- TESTS = $(check_PROGRAMS)
- 
-+# Build the version script from a template, pruning _nss_nis_getsecretkey
-+# when xdecrypt() was not detected by configure (i.e., HAVE_XDECRYPT is unset).
-+BUILT_SOURCES = libnss_nis.map
-+EXTRA_DIST   += libnss_nis.map.in
-+CLEANFILES   += libnss_nis.map
-+
-+libnss_nis.map: $(srcdir)/libnss_nis.map.in $(top_builddir)/config.h
-+	$(AM_V_GEN) { \
-+	  if grep -q '^[[:space:]]*#define[[:space:]]\+HAVE_XDECRYPT[[:space:]]\+1' $(top_builddir)/config.h ; then \
-+	    cp $(srcdir)/libnss_nis.map.in $@ ; \
-+	  else \
-+	    sed 's/ _nss_nis_getsecretkey;//g' \
-+	        $(srcdir)/libnss_nis.map.in > $@ ; \
-+	  fi ; \
-+	}
-+
- libnss_nis_la_LDFLAGS = -version-info 2:0:0 \
--	-Wl,--version-script=$(srcdir)/libnss_nis.map
-+	-Wl,--version-script=$(builddir)/libnss_nis.map
- libnss_nis_la_LIBADD = @LIBNSL_LIBS@
- libnss_nis_la_SOURCES = nis-alias.c nis-ethers.c nis-grp.c nis-hosts.c \
- 			nis-initgroups.c nis-netgrp.c nis-network.c  \
-diff --git a/src/libnss_nis.map b/src/libnss_nis.map.in
-similarity index 100%
-rename from src/libnss_nis.map
-rename to src/libnss_nis.map.in
diff --git a/meta/recipes-extended/libnss-nis/libnss-nis.bb b/meta/recipes-extended/libnss-nis/libnss-nis_3.4.bb
similarity index 82%
rename from meta/recipes-extended/libnss-nis/libnss-nis.bb
rename to meta/recipes-extended/libnss-nis/libnss-nis_3.4.bb
index a7f6545be06..eac385f6d1c 100644
--- a/meta/recipes-extended/libnss-nis/libnss-nis.bb
+++ b/meta/recipes-extended/libnss-nis/libnss-nis_3.4.bb
@@ -13,13 +13,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS += "libtirpc libnsl2"
 
-PV = "3.2"
-
-SRCREV = "cd0d391af9535b56e612ed227c1b89be269f3d59"
-
-SRC_URI = "git://github.com/thkukuk/libnss_nis;branch=master;protocol=https \
-           file://0001-make-ake-_nss_nis_getsecretkey-export-conditional-on.patch \
-          "
+SRCREV = "3c206b762ac8557dab3c40ff3a297c9d1bff0d83"
+SRC_URI = "git://github.com/thkukuk/libnss_nis;branch=master;protocol=https;tag=v${PV}"
 
 inherit autotools pkgconfig
 

