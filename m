Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.11475.1622631482337230900
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 03:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VSBrTje0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id n17-20020a7bc5d10000b0290169edfadac9so3502158wmk.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jun 2021 03:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aRAFT0IzzMYdLDU0D9sb6hFkH7b12Yw/I5I29+atw5Y=;
        b=VSBrTje0dIIrEZaHp81gi0U1xs+8dDWdH6YagRNmqUeDBMBzzMxF1XpXK1IWQ+/ZTX
         KwrHu3MSX/XBRRaNl9kvy5W5ox4T1Pg0ZPGMmS3Zffk4lj+VUikh+Igi2EThb0iXcwnk
         qpnfd4p6HX74nnEApJ8eUH0/5902zmj/YF45M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aRAFT0IzzMYdLDU0D9sb6hFkH7b12Yw/I5I29+atw5Y=;
        b=UKpXcdjUBhK4cUbsRMlJDIAD5ajkeRn/TU+WBripuf5JvWULaSwd14ivXnCC1iYM9o
         GKBCWhK9edbxC+HFq3b07FUl3JMsAkXnPSOeVFnSXRde0JUBa0qed7d+emcsDfgQqwxw
         Hz9O0JIS9ELd5KD3140D7gdC7MQa2lv+12XkEMAIDqB+v0XDSkJqqGvk1JkU/AyXGAv1
         OuLIL4051clpWHWvEfIN/0wkwi/2u335czMKDLVrVW8U6Iq5GzklOtS+nnk1Ckh1X7o/
         KB8wcSa8KWljyaTdOstBkG88cFa5rSE74PnkCHPUt7pw/PZQe6mwZ3oYv1QXCV9Rupuh
         bCOA==
X-Gm-Message-State: AOAM5323P3mu2YMOVDBLdiDAErmv7LZXgqQnCf38P0TGpmIHVCFXh7+r
	nW9SlZqXvYmwlWqNnMw+oSTR9Cc3IPez/w==
X-Google-Smtp-Source: ABdhPJySAGIaJg8+6l12t+5n984E9XPPwsiLW8J3+7br3wRF/aXUWjlqhnKE1h6K7jEgd128659KEg==
X-Received: by 2002:a7b:c849:: with SMTP id c9mr4623178wml.84.1622631480358;
        Wed, 02 Jun 2021 03:58:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:743:408f:2993:133e])
        by smtp.gmail.com with ESMTPSA id 11sm2337599wmo.24.2021.06.02.03.57.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 03:58:00 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lttng-tools: upgrade 2.12.3 -> 2.12.4
Date: Wed,  2 Jun 2021 11:57:59 +0100
Message-Id: <20210602105759.2913229-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new lttng file to one of the tests to avoid test failures.

Also add a dependency on grep since standalone testing revealed test
failures without this. Normally this was added by other dependencies
in the ptest images so we didn't see this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{lttng-tools_2.12.3.bb => lttng-tools_2.12.4.bb}     | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.12.3.bb => lttng-tools_2.12.4.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb
index 6132daf1a18..133d7561b8c 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.4.bb
@@ -15,7 +15,7 @@ include lttng-platforms.inc
 DEPENDS = "liburcu popt libxml2 util-linux"
 RDEPENDS_${PN} = "libgcc"
 RRECOMMENDS_${PN} += "${LTTNGMODULES}"
-RDEPENDS_${PN}-ptest += "make perl bash gawk babeltrace procps perl-module-overloading coreutils util-linux kmod ${LTTNGMODULES} sed python3-core"
+RDEPENDS_${PN}-ptest += "make perl bash gawk babeltrace procps perl-module-overloading coreutils util-linux kmod ${LTTNGMODULES} sed python3-core grep"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
 RDEPENDS_${PN}-ptest_append_libc-musl = " musl-utils"
 # babelstats.pl wants getopt-long
@@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://determinism.patch \
            "
 
-SRC_URI[sha256sum] = "2890da230edd523fcf497e9eb28133b7606d64fa01bcbffadbfcba42104db153"
+SRC_URI[sha256sum] = "d729f8c2373a41194f171aeb0da0a9bb35ac181f31afa7e260786d19a500dea1"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
@@ -69,7 +69,10 @@ do_install_append () {
 }
 
 do_install_ptest () {
-    for f in Makefile tests/Makefile tests/utils/utils.sh tests/regression/tools/save-load/*.lttng tests/regression/tools/save-load/configuration/load-42*.lttng tests/regression/tools/health/test_health.sh tests/regression/tools/metadata/utils.sh tests/regression/tools/rotation/rotate_utils.sh; do
+    for f in Makefile tests/Makefile tests/utils/utils.sh tests/regression/tools/save-load/*.lttng \
+            tests/regression/tools/save-load/configuration/load-42*.lttng tests/regression/tools/health/test_health.sh \
+            tests/regression/tools/metadata/utils.sh tests/regression/tools/rotation/rotate_utils.sh \
+            tests/regression/tools/base-path/*.lttng; do
         install -D "${B}/$f" "${D}${PTEST_PATH}/$f"
     done
 
-- 
2.30.2

