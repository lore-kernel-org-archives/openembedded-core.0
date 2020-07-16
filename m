Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.13725.1594900591812641371
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 04:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=Z4gQwHvh;
 spf=pass (domain: burtonini.com, ip: 209.85.128.53, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f53.google.com with SMTP id a6so5182016wmm.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 04:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bW0awOWW1ZotGokaBPnJTokAWJerCwBiZ5gIV89WKI0=;
        b=Z4gQwHvhrlz6f6Q3B0rhJfqYsZc4g7Mpiv5gH+7n1q4kBQfLaA/J8jwhBJtrJtvVS0
         fE6PNHf4Rz6RrOuWplcPDg3vU85uv+DUvp0e/Aklysd4tBH+X8PyyH72xbvcLmkwJ/lW
         AL9ChL5e7qWcpz/2PaQRU45PTcXg5y9F7++7e++ojRBNln4WRvlZ0oLYyIjS8oEWObkF
         n/0KNUFLEMUuD5xCE95HnkZbgjub6d9AGskgW0j5DH/poabFyyQtT8ch4ns9ERe8LxMK
         b/pwD0jQ6ZmN/fnj2GH/mfxYzvOxteEAJx8ZssZ5XQi0fsGNlvmrrGvKeFn8gUZTM6P9
         mapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bW0awOWW1ZotGokaBPnJTokAWJerCwBiZ5gIV89WKI0=;
        b=l0ELrRfb3jIadZvPBsjpSpAVs1nzwX4amJj8mUEOAfTJKQGvL1UQo42DKPpGPLl/Dm
         6JTDp0ZX7URNRkJrCEQZl0oXd69jFYhU8+Fd4W5QuN2fcHUxdanrOx14ath29Fsp/nrp
         UdG6gHu284+LP4LeK3AJMeWrBqnqkKQvK4vhWoJMha3UwxR6Li3bTup5a3Y46KU4BseU
         DjKH8w29xqMKUKZ+TW36YFVFt7BMZdLLtjJCbrPqtsYNId2ZQ6EKCRKSrXSTacWSJeT/
         K2xc8RljR4Xc/c88AV3XynHviSYgHcErjvtzvhCKd5ElDmfCb7Oqhwn0jzQTFCIG7TI6
         0wGw==
X-Gm-Message-State: AOAM530BM0MHoInIxjzTZTFinendnQLWq402Lq3K54W8/hFe5IiZ2ItM
	8sHmYx5I4EpKyeNvDCIvQrsLgPDizEQ=
X-Google-Smtp-Source: ABdhPJxvXc4DLvGZWiFwbIXuUTIbggZlq0E1uXQNSMhRBp2eIylBG5Yo3ZE3F0WzbAgW1+BodGQkxw==
X-Received: by 2002:a1c:48d:: with SMTP id 135mr4198794wme.102.1594900590158;
        Thu, 16 Jul 2020 04:56:30 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id w7sm7914939wmc.32.2020.07.16.04.56.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 04:56:29 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] nasm: fix build with autoconf 2.70
Date: Thu, 16 Jul 2020 12:55:46 +0100
Message-Id: <20200716115546.3724268-4-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200716115546.3724268-1-ross@burtonini.com>
References: <20200716115546.3724268-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

autoconf 2.70 is coming soon which has some small behavioural fixes, so
backport a patch from upstream to fix the build with that release.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...rs.m4-for-development-versions-of-au.patch | 28 +++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.14.02.bb    |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/0001-fix-pa_add_headers.m4-for-development-versions-of-au.patch

diff --git a/meta/recipes-devtools/nasm/nasm/0001-fix-pa_add_headers.m4-for-development-versions-of-au.patch b/meta/recipes-devtools/nasm/nasm/0001-fix-pa_add_headers.m4-for-development-versions-of-au.patch
new file mode 100644
index 0000000000..b52dc5ba7b
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/0001-fix-pa_add_headers.m4-for-development-versions-of-au.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 287964d54b64bed833adba307e1d920f8fcf0cbc Mon Sep 17 00:00:00 2001
+From: Ozkan Sezer <sezero@users.sourceforge.net>
+Date: Wed, 7 Aug 2019 15:50:50 +0300
+Subject: [PATCH] fix pa_add_headers.m4 for development versions of autoconf
+ (bug 3392471)
+
+Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
+---
+ autoconf/m4/pa_add_headers.m4 | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/aclocal.m4 b/aclocal.m4
+index 1af2dd5d..6ce3e6c1 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -169,7 +169,8 @@ dnl --------------------------------------------------------------------------
+ AC_DEFUN(_PA_ADD_HEADER,
+ [AC_CHECK_HEADERS([$1],[ac_includes_default="$ac_includes_default
+ #include <$1>"
+-])])
++])
++])
+ 
+ AC_DEFUN(PA_ADD_HEADERS,
+ [m4_map_args_w([$1],[_PA_ADD_HEADER(],[)])])
diff --git a/meta/recipes-devtools/nasm/nasm_2.14.02.bb b/meta/recipes-devtools/nasm/nasm_2.14.02.bb
index f8a8d76e99..c40be8fbbf 100644
--- a/meta/recipes-devtools/nasm/nasm_2.14.02.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.14.02.bb
@@ -8,6 +8,7 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://CVE-2019-14248.patch \
            file://0001-stdlib-Add-strlcat.patch \
            file://0002-Add-debug-prefix-map-option.patch \
+           file://0001-fix-pa_add_headers.m4-for-development-versions-of-au.patch \
            "
 
 SRC_URI[md5sum] = "3f489aa48ad2aa1f967dc5e293bbd06f"
-- 
2.26.2

