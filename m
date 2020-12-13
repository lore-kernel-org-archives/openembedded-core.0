Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.12551.1607819646684598253
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Dec 2020 16:34:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SAywQLx3;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id 131so9626648pfb.9
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Dec 2020 16:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WkW1gKA8dRqIQQpN3evPsPuXtHyDKixNtpliqEYqATI=;
        b=SAywQLx3lj3YsrHQzfWc8NbJg4/0CxWikZfF1K8c8Ji/oC+g76793kcCbrJRmYWrnS
         TjNSW4Ktbsv+7RsxDJXWKLF8gX9J1d908rLMrkwC80R6vVInBBAl1XE019F8ctj7aPEf
         KCJBXu5JvmstMIZ4CB0tjDKFy51V4YhITdULBt+Lsbn6y113UGrqd6JPC35j7hKhWuZ+
         DqZCkR9uuAoWxPYv0cix3ofvoWWAHhMKQ/RyASvahupU5Ua3Vq6ZhmMtBIHKEr9hyX+W
         2d0/gjTmrHDF+KbNU2C3nMQPA98f0QC0WHHiuCK96QgwlZ2H95/FzdSg3TPUbklQWCGn
         asAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WkW1gKA8dRqIQQpN3evPsPuXtHyDKixNtpliqEYqATI=;
        b=Dbm+RHpJHlpMOoyliklTxJIRJiARCLTl2NXcikb/wPdmVzl83PduD489yZDewGoWMM
         xwh88DOZDODOsws6uONVQYc+nE6NcR5e+kMfD+IAGOQQTGziD+LTlVNvK7Cx5FbyDTp/
         RY3cYnCe4uDHV66MzRnUgTy6x9nMneCe/iHxy+HILihyN2GdFiwpjTyRjRT23DIBceoW
         r0OrG7jhkEQYOfcX/3QZI37BYEZ2pIEVbXNlPzn4EJm03otKUlVc/WJRIaSYvuBNgO8X
         FguNV0z9o5hjbc2N/K7XNGFKTnqk2K3l3HAavAunp1ZZOAxxakx2KPq1XK4WcY65BEaA
         hEsA==
X-Gm-Message-State: AOAM530x4n7cWGmPfGhe3duQgu1zpGMzLAuhFVy+bThFM53RauNLqndJ
	wsKFdMoEOC5R6Y7RIICKam4nR8pzK8JQ4Q==
X-Google-Smtp-Source: ABdhPJzhwJMa57Yqa0q2PadwksFzHrl4guGp3CC5NCfzHe0JXmqLsUxTP25vK4esBXzDw6nfwaFC2w==
X-Received: by 2002:a62:5f81:0:b029:19a:89cb:41d8 with SMTP id t123-20020a625f810000b029019a89cb41d8mr18029304pfb.48.1607819645873;
        Sat, 12 Dec 2020 16:34:05 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5bf5])
        by smtp.gmail.com with ESMTPSA id r185sm15632714pfc.53.2020.12.12.16.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Dec 2020 16:34:05 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] systemd: Fix reallocarray check
Date: Sat, 12 Dec 2020 16:34:02 -0800
Message-Id: <20201213003402.3469450-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213003402.3469450-1-raj.khem@gmail.com>
References: <20201213003402.3469450-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Musl brought this latent issue to fore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-meson-Fix-reallocarray-check.patch   | 30 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_247.1.bb    |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-Fix-reallocarray-check.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-meson-Fix-reallocarray-check.patch b/meta/recipes-core/systemd/systemd/0001-meson-Fix-reallocarray-check.patch
new file mode 100644
index 0000000000..1229dd6e17
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
diff --git a/meta/recipes-core/systemd/systemd_247.1.bb b/meta/recipes-core/systemd/systemd_247.1.bb
index 951bffa23f..25d15abf02 100644
--- a/meta/recipes-core/systemd/systemd_247.1.bb
+++ b/meta/recipes-core/systemd/systemd_247.1.bb
@@ -24,6 +24,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
            file://0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch \
            file://0001-meson-set-cxx-variable-before-using-it.patch \
+           file://0001-meson-Fix-reallocarray-check.patch \
            "
 
 # patches needed by musl
-- 
2.29.2

