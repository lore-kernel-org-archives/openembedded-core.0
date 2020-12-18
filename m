Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web09.4974.1608263872736230028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 19:57:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AzjYi0bt;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id y19so1867995lfa.13
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 19:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/9ZajTn+NC91rQS8WcOjajWdY7GymwuBMyYpA/j7fHM=;
        b=AzjYi0btE2BgY4S/eXrsfDs71/TFS/wVLg/BGBARglmQSO3lp9Hat5AD391ClZ/jQE
         ngjWgAyZzAnNggVFuJlPcU2lj80qpOE/l6e208n/CClfyCRuXZTbI2MJDMOQ+iO3/Xdj
         Bznx0F7MKCu4pXguxVR/u76YWKt12u1iqIsVTbenS4TdfYq208HB057FQLZkvFa5i2oy
         XGBHzqBbuAHm/A7ygbup8NRHBKOM7qjnXgIZIVEA3sJ8xFegZPlIdGoOPW5yok7X+0kk
         olCC/SgYjWB3g5uyHPD4LnvrJCmVHQWq6uqy4dWcMzYsd0jEuNOxhPsJJUkQ8bBxjtSt
         0Rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/9ZajTn+NC91rQS8WcOjajWdY7GymwuBMyYpA/j7fHM=;
        b=XRJFpplhy1ySbWzHf6ltdsGZbBgqbc14ogtObe4BrFiYil1gM1RyP1Q3B2VaBNy/aJ
         aOU2RZjiXFI1l2Zi7wdFAaEO+2/gQJVdIFsfB/U6UXidLH+iK5McrGaVG7vG+tn+Swz+
         ljiztSsRLMXoanWw3hr/Nh9t0npLmVTRUUU03rn4GzpKtx9OCG47edQJRddZJIEGWpXd
         DURgi+JpCYCvnsQ43qFQfZny9wUFeB1h0Hh7zfwdZlDMsH8/BBRnor81kCZeVaozka7h
         SMbtCfn6y5yD/JTTC2RVTZhnI5YgHTbvT+UuW8+iTRWTDwz1c3fvyG7BDzrNc+7kXPYC
         jkvQ==
X-Gm-Message-State: AOAM5309a2HjldD9Y8NsmvimwtrfJFURVWej3xqTmWAmZzK+GO5SdXYd
	R/qoRuQ+yWucoX21rTLNLGGmG2casm6KQA==
X-Google-Smtp-Source: ABdhPJzGwB430l/Qtys8qaSiGMs4N/JPqWSMUPjiVKhsBUoYnJo/D1n3w4wMkxrAsibsBgsmXKnDMw==
X-Received: by 2002:a19:416:: with SMTP id 22mr766241lfe.507.1608263870700;
        Thu, 17 Dec 2020 19:57:50 -0800 (PST)
Return-Path: <dbaryshkov@gmail.com>
Received: from umbar.lan ([188.162.64.233])
        by smtp.gmail.com with ESMTPSA id c136sm792772lfg.306.2020.12.17.19.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 19:57:50 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH] systemd: Fix reallocarray check
Date: Fri, 18 Dec 2020 06:57:49 +0300
Message-Id: <20201218035749.9850-1-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Musl brought this latent issue to fore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-meson-Fix-reallocarray-check.patch   | 30 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_246.6.bb    |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-Fix-reallocarray-check.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-meson-Fix-reallocarray-check.patch b/meta/recipes-core/systemd/systemd/0001-meson-Fix-reallocarray-check.patch
new file mode 100644
index 000000000000..1229dd6e175a
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-meson-Fix-reallocarray-check.patch
@@ -0,0 +1,30 @@
+From 1ebf1a1df17afd8b89f84b1928a89069035bf20b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 12 Dec 2020 16:15:57 -0800
+Subject: [PATCH] meson: Fix reallocarray check
+
+reallocarray() is defined in stdlib.h, so that would be right header to
+check for its presense.
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/17951]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index d205f846c7..e0a3c53529 100644
+--- a/meson.build
++++ b/meson.build
+@@ -517,7 +517,7 @@ foreach ident : [
+                                  #include <sys/stat.h>
+                                  #include <unistd.h>'''],
+         ['explicit_bzero' ,   '''#include <string.h>'''],
+-        ['reallocarray',      '''#include <malloc.h>'''],
++        ['reallocarray',      '''#include <stdlib.h>'''],
+         ['set_mempolicy',     '''#include <stdlib.h>
+                                  #include <unistd.h>'''],
+         ['get_mempolicy',     '''#include <stdlib.h>
+-- 
+2.29.2
+
diff --git a/meta/recipes-core/systemd/systemd_246.6.bb b/meta/recipes-core/systemd/systemd_246.6.bb
index d9e7b1a00c3a..b89eff6be2e4 100644
--- a/meta/recipes-core/systemd/systemd_246.6.bb
+++ b/meta/recipes-core/systemd/systemd_246.6.bb
@@ -24,6 +24,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
            file://selinux-hook-handling-to-enumerate-nexthop.patch \
            file://0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch \
+           file://0001-meson-Fix-reallocarray-check.patch \
            "
 
 # patches needed by musl
-- 
2.29.2

