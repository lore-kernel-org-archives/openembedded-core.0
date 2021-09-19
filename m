Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.9348.1632049077508225471
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Sep 2021 03:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZHRH4/MX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id u18so21586788wrg.5
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Sep 2021 03:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MkCGY+GDbIitbbAhVYBR1iQsWiX4KEHgH6FEt4akJh0=;
        b=ZHRH4/MXc/LKUOnQoRsF28MS/BLbziNdRFW/pFnqjgKqVnjvobhrKkc4jGYeqxjyO3
         AqryxUFFEN/RtJNbvN+kQRqNQDckxsSM3cAaNj4J09tABc6i2kAI/72529fYvKTJGwp7
         KTHEiysIx97EsGagUD8zKaPdSrEs2XuY84SZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MkCGY+GDbIitbbAhVYBR1iQsWiX4KEHgH6FEt4akJh0=;
        b=m/xJxQTHNg6vj7x5+LZ9PEaxAt0TBZLsydq0ODDTL4jKC9GaeTtLxLPvCcLbPZA8Y1
         rekQ9khS3qNWDKY8YnD1d59e1egZPMx9owC3159IkCpVVAwqDF1k3me5OU4LP3b4PBsp
         rNuarTYmEk0Vl5dfZz4RB+Qrjjn1COvquBbGHkZI80dHrqoTIBW6DW19gg8w6qG15waO
         Ma1N+9pbnriCCWOElfHHnZbidXj0+FDfOjhgQypuFMB4o5kzupiywWfGMdhu2AsiT+mU
         NT+KZKnCKJSoOYPLZOdcQnkd/tqbAthe9p2fjX3zpLdeV9N1wyFn6q69GROxHf3/+HUI
         T1cA==
X-Gm-Message-State: AOAM5330ALaZGxXWj2Mjuui4cufsJRj4+5duKUVwuXiekxqglgUKIY3V
	5paT14X6Z9G2ZCnCE2uY5h5QXoQtdu/nc5dw
X-Google-Smtp-Source: ABdhPJzzQor+T8hWVFsxlBl3mOfbHY2UMoNpzjU+VEboEE4IyJeEgwhYMNuhyyvhY6RYgjFvx8ljhg==
X-Received: by 2002:adf:e546:: with SMTP id z6mr22640429wrm.346.1632049075899;
        Sun, 19 Sep 2021 03:57:55 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f583:326e:a3bb:7da1])
        by smtp.gmail.com with ESMTPSA id y9sm19125271wmj.36.2021.09.19.03.57.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 03:57:55 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lttng-tools: Add missing DEPENDS on bison-native
Date: Sun, 19 Sep 2021 11:57:55 +0100
Message-Id: <20210919105755.1543175-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was being provided by other pieces of the dependency chain but is
specifically required by configure and could fail if those pieces come
from sstate. Fix such builds by adding the missing dependency.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb
index 95bb2519d7d..47cab42fcf5 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=40ef17463fbd6f377db3c47b1cbaded8 \
 
 include lttng-platforms.inc
 
-DEPENDS = "liburcu popt libxml2 util-linux"
+DEPENDS = "liburcu popt libxml2 util-linux bison-native"
 RDEPENDS:${PN} = "libgcc"
 RRECOMMENDS:${PN} += "${LTTNGMODULES}"
 RDEPENDS:${PN}-ptest += "make perl bash gawk babeltrace procps perl-module-overloading coreutils util-linux kmod ${LTTNGMODULES} sed python3-core grep"
-- 
2.32.0

