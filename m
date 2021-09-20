Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.11124.1632141998880629883
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 05:46:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EpiICQtH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id t8so22315790wri.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 05:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mOzf9KpLrsNROD/srtR1PwTFwmFxpZKbBvV6Gl4dWUE=;
        b=EpiICQtHOBf5OZgcI8duDoO58AS+zQKo5bU8grR+5kjlFuOSPXkjtO+r0DiSZDysNj
         HBt+dcl7gnGhzuLdZamxwYJCRLHNFIOl6H63AD6lkP25eVH0OtouT/C4tC5kFDgGYorV
         h5hUJd7OZ29ns9JrSAqApEIMpNQL2C6tII1z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mOzf9KpLrsNROD/srtR1PwTFwmFxpZKbBvV6Gl4dWUE=;
        b=YRFG+Uz2VpHWeUKjOLiZG8MvMF+C06C3cZRDAM+ww3m+i1wnPA7WG8Lgw9zgVbYJ8U
         WVcpaeiOS6U54XEf/dVglkozTXLYLQvKZ8kGjATFzT+kVoy0C0OcprVENQhNDMmk53gP
         LDpUQuAYWM7IiTwfX5SDsXiPNgb9MHE23qmNXCpyvvGUUVy+TynDPGKL6lRtbYnwgQFH
         pSZRsV1UlDDsQI37dihcNs74suZjriby4JtdfabE5GTP/TymqMyRlVUYOnUQDuMbX8t2
         hQ9xxngahRxOrWb/D2QM9p0o/5TAWBwOYQ5iRV7Rg5FH+LTY1vxXNTzyOygbyw0Qkj/e
         1gjQ==
X-Gm-Message-State: AOAM530cRV4mM/K0BygSNPlqlNLLl9+dAWy+L94u4fnhE8K+LK/Jk2mK
	Gxe6xbyRNKqZx9gi3iugVreHji8HY274QjZI
X-Google-Smtp-Source: ABdhPJxbvvNdAchW5R0H7vIEqyu4yp0r9L/fffx81IWwR1vUdnfhvvdW6+srrIBvoX6HugZphwPD/A==
X-Received: by 2002:a05:600c:17d1:: with SMTP id y17mr29391933wmo.135.1632141997324;
        Mon, 20 Sep 2021 05:46:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7173:466e:b128:3e8b])
        by smtp.gmail.com with ESMTPSA id j21sm15773514wrd.48.2021.09.20.05.46.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 05:46:36 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 14/14] layer.conf: Extend recipes not to install without explict dependencies
Date: Mon, 20 Sep 2021 13:46:21 +0100
Message-Id: <20210920124621.1576702-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are several dependencies which recipes have which are not needed
at runtime, only at build time. Extend the list of these from bison to
include quilt, patch, meson, autoconf, automake and ninja which should
reduce the amount of data being included in native sysroots.

This speeds up and reduces the sstate needed for image builds for example.

If this change breaks recipes, it probably means they're missing an explicit
DEPENDS on something in this list which is a bug in the recipe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 307ad7e2237..b3cc8a249e9 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -48,6 +48,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
 "
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
+  *->patch-native \
   *->quilt-native \
   *->subversion-native \
   *->git-native \
@@ -90,7 +91,16 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
 # (e.g. X -> Y -> binutils-cross -> bison-native) no longer meet the
 # dependency incidentally. This improves determinism and avoids build
 # failures when people switch to external toolchains.
-SSTATE_EXCLUDEDEPS_SYSROOT += ".*->bison-native"
+SSTATE_EXCLUDEDEPS_SYSROOT += "\
+    .*->autoconf-native \
+    .*->automake-native \
+    .*->bison-native \
+    .*->meson-native \
+    .*->ninja-native \
+    .*->patch-native \
+    .*->pkgconfig-native \
+    .*->quilt-native \
+"
 # Nothing needs to depend on libc-initial
 # base-passwd/shadow-sysroot don't need their dependencies
 SSTATE_EXCLUDEDEPS_SYSROOT += "\
-- 
2.32.0

