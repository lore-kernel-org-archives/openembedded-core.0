Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4B2C8303F
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 06:43:40 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.8835.1756277016093705441
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 23:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V1ch8vG/;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-24633f57e0bso35282425ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 23:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756277015; x=1756881815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9WaMJSO/SkXObzmoY3Itg+K/dgC538+rV0IKC3WaIaI=;
        b=V1ch8vG/0nOC2TCN15TepSbfA0OviTn7eIPOOTAeYbdtapNWQQEIDM7aWiBKS/G3wn
         QtQ7u2ykBYCWyqn8Ea8aLmrVvP96SivYOfmeRm4+A9Et5IHEgn3B/GvqxIMSpwbzwcfj
         z/9uv9jFKVWwhTW3Zq4ako/R8+1atWcv+ABJhhDqU4PRbehGoqIMphLjpUNx7G1W6p84
         /rQEsIqeQSnVPuzuAsCWFDRDL0M+mkJuNAODKEUrO75q2tk1nxhknGR6W8BrEjq7N7a8
         yAg3osQOWLtxCqkMsfE4T8O1raGhKkIeVoVbntFD5ezoJOQIX2aJXsfy6stxICdI71qm
         jSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756277015; x=1756881815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9WaMJSO/SkXObzmoY3Itg+K/dgC538+rV0IKC3WaIaI=;
        b=ZvZv8uCFg9BmICd5ht6InxcrsWgybYj2ki44OIjolCvwakL3sVe6lqyynhYKD3jaoA
         XF2zxMcdYgjeSg/bQLoKdTOih8oGvIF1HeybT/LXyKAfcH8e8jklFjyQww8agkCdrYcr
         +YLuhw7ZXQ2M31YgEGNcx59pDq6kPoWRc9QzyTwa9BiZDqCnU4eozqg4pPd/tZVSbD46
         fdRCxS2OXDrWBGQI1fW7s9T/8EO3P5eKPHm2AWobwzc+lX/PJnbpLP+ahnIB6e7jpleR
         uyrgtGVcYnMd2pxdvlYAFFBkfOd9oAQufj7tW8RGmFjxI563srth75Eb0OLoysSepTSo
         HFZA==
X-Gm-Message-State: AOJu0YxBNCTcxFq9GFu1hsQr8SAYdqv6lEjNLBc9ZXywn/jqE/BfmNss
	CGYc8X3YgGC+0Mk+7ZzIB1sd3ZLFR3l/l1r4TVGayzXhc+0NVuQmJbuZGS3p7Dk4
X-Gm-Gg: ASbGncsrNPz4RAXMcwyVLU3UzMQ7htt8v1DWiodUYTxWyawAFujOKeOx/gLE9cXj6IB
	gDGyWhj+798lzIsloA8xvNvg4Q0GXiQ/kEizHsLl8MEs6KAQ2DqZqIAX7EwdvcJUCq3WKgMF/K/
	eYCaBJD5GrsS8xc8G5rQ0kN2WcAvv/MaEuAQpHdnccIGAuSHRIRo6f/XJnfEnLTZA1GdbA9/tK3
	1BpPH3gM0AVXEJtDBl2wXzKRvDwLviPP024pLzu7ew5Pj+iCFnQP1+0yz4gQk8exPaqb5+xva/2
	sIuGKjTjDtBVcOOJ1onNp7d5O4RXOjpXjq+rJ/cyvY5XgmFt0M09TvxRdSJ84jBJ7udJpbVqlXv
	5s35YlkxODYVm830d6TzgRDBSwNUGTIrMjjQHKp9fVADUQk+gCd/ISdKHzw9KebCReG5RVMvgkL
	L/LksvkcxrY4m02iG6WR0Esy1YzzFlXEtsQJoamTHKRwS1x5+vamU=
X-Google-Smtp-Source: AGHT+IHLk+SCEpY+GZBkwoWgwSwu7Bf13TPQoav/s2DKc/r0kZnpxezbHUDZbb6ic0Kmb+8DtmnEXQ==
X-Received: by 2002:a17:903:2ecd:b0:246:22e3:6a2a with SMTP id d9443c01a7336-2462ee1a616mr237971155ad.15.1756277015163;
        Tue, 26 Aug 2025 23:43:35 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::cfd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687cbdd7sm113368445ad.65.2025.08.26.23.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 23:43:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libnss-nis: Do not export _nss_nis_getsecretkey when libc does not have xdecrypt
Date: Tue, 26 Aug 2025 23:43:32 -0700
Message-ID: <20250827064332.297325-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 06:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222495

Fixes build errors ( seen with lld particularly )

| x86_64-yoesdk-linux-ld.lld: error: version script assignment of 'NSS_NIS_PRIVATE_2.0' to symbol '_nss_nis_getsecretkey' failed: symbol not defined
| x86_64-yoesdk-linux-clang: error: linker command failed with exit code 1 (use -v to see invocation)
| make[3]: *** [Makefile:642: libnss_nis.la] Error 1
| make[3]: Leaving directory '/mnt/b/yoe/master/build/tmp/work/x86_64-nativesdk-yoesdk-linux/nativesdk-libnss-nis/3.2/build/src'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/libnss-nis/libnss-nis.bb |  1 +
 ...s_getsecretkey-export-conditional-on.patch | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-extended/libnss-nis/libnss-nis/0001-make-ake-_nss_nis_getsecretkey-export-conditional-on.patch

diff --git a/meta/recipes-extended/libnss-nis/libnss-nis.bb b/meta/recipes-extended/libnss-nis/libnss-nis.bb
index 2198606de5e..a7f6545be06 100644
--- a/meta/recipes-extended/libnss-nis/libnss-nis.bb
+++ b/meta/recipes-extended/libnss-nis/libnss-nis.bb
@@ -18,6 +18,7 @@ PV = "3.2"
 SRCREV = "cd0d391af9535b56e612ed227c1b89be269f3d59"
 
 SRC_URI = "git://github.com/thkukuk/libnss_nis;branch=master;protocol=https \
+           file://0001-make-ake-_nss_nis_getsecretkey-export-conditional-on.patch \
           "
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-extended/libnss-nis/libnss-nis/0001-make-ake-_nss_nis_getsecretkey-export-conditional-on.patch b/meta/recipes-extended/libnss-nis/libnss-nis/0001-make-ake-_nss_nis_getsecretkey-export-conditional-on.patch
new file mode 100644
index 00000000000..b9996d32921
--- /dev/null
+++ b/meta/recipes-extended/libnss-nis/libnss-nis/0001-make-ake-_nss_nis_getsecretkey-export-conditional-on.patch
@@ -0,0 +1,78 @@
+From ecc9767fd8c3a1ecbfca5df18714df34995a38a3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 26 Aug 2025 22:45:54 -0700
+Subject: [PATCH] make: Make _nss_nis_getsecretkey export conditional on xdecrypt()
+
+The function _nss_nis_getsecretkey in nis-publickey.c is only
+compiled when xdecrypt() is available. This is controlled by the
+configure check AC_CHECK_FUNCS([xdecrypt]) which defines
+HAVE_XDECRYPT in config.h.
+
+However, the symbol was always listed in src/libnss_nis.map,
+regardless of whether the function was actually built. On systems
+without xdecrypt() (for example musl or certain embedded toolchains),
+this leads to a link failure:
+
+    ld: error: version script assignment of 'NSS_NIS_1.0' to symbol
+    '_nss_nis_getsecretkey' failed: symbol not defined
+
+To fix this mismatch, rename libnss_nis.map to
+libnss_nis.map.in and generate libnss_nis.map at build time:
+
+ - If HAVE_XDECRYPT is defined, the symbol map is copied unchanged.
+ - Otherwise, the _nss_nis_getsecretkey line is stripped out
+   with sed.
+
+Automake rules are added to src/Makefile.am so the correct
+libnss_nis.map is produced, and the linker always sees a version
+script consistent with the compiled objects.
+
+This ensures _nss_nis_getsecretkey is exported only when it exists
+in the object code, preventing build failures on platforms where
+xdecrypt() is missing.
+
+This fixes build with LLD linker which defaults to not accepting
+undefined symbols
+
+Upstream-Status: Submitted [https://github.com/thkukuk/libnss_nis/pull/12]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/Makefile.am                           | 18 +++++++++++++++++-
+ src/{libnss_nis.map => libnss_nis.map.in} |  0
+ 2 files changed, 17 insertions(+), 1 deletion(-)
+ rename src/{libnss_nis.map => libnss_nis.map.in} (100%)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index e1a9bb2..cc32ea9 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -22,8 +22,24 @@ nss_loader_test_LDADD = -ldl
+ 
+ TESTS = $(check_PROGRAMS)
+ 
++# Build the version script from a template, pruning _nss_nis_getsecretkey
++# when xdecrypt() was not detected by configure (i.e., HAVE_XDECRYPT is unset).
++BUILT_SOURCES = libnss_nis.map
++EXTRA_DIST   += libnss_nis.map.in
++CLEANFILES   += libnss_nis.map
++
++libnss_nis.map: $(srcdir)/libnss_nis.map.in $(top_builddir)/config.h
++	$(AM_V_GEN) { \
++	  if grep -q '^[[:space:]]*#define[[:space:]]\+HAVE_XDECRYPT[[:space:]]\+1' $(top_builddir)/config.h ; then \
++	    cp $(srcdir)/libnss_nis.map.in $@ ; \
++	  else \
++	    sed 's/ _nss_nis_getsecretkey;//g' \
++	        $(srcdir)/libnss_nis.map.in > $@ ; \
++	  fi ; \
++	}
++
+ libnss_nis_la_LDFLAGS = -version-info 2:0:0 \
+-	-Wl,--version-script=$(srcdir)/libnss_nis.map
++	-Wl,--version-script=$(builddir)/libnss_nis.map
+ libnss_nis_la_LIBADD = @LIBNSL_LIBS@
+ libnss_nis_la_SOURCES = nis-alias.c nis-ethers.c nis-grp.c nis-hosts.c \
+ 			nis-initgroups.c nis-netgrp.c nis-network.c  \
+diff --git a/src/libnss_nis.map b/src/libnss_nis.map.in
+similarity index 100%
+rename from src/libnss_nis.map
+rename to src/libnss_nis.map.in

