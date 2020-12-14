Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.30953.1607925700813459218
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 22:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NEUwXLm3;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id q22so11379257pfk.12
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Dec 2020 22:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uOgamSLy2qNuBEfyhqkmisI1dbQZcc+UFsv0brxHzlU=;
        b=NEUwXLm3Uh/PBslAAo2nVznPC6Qowr63aGVSWnlFddwWOAAe5seRgoeWLGZZvCWIpG
         xtWjwQA4hDyyJkexduNgUlN621qAHtalpU9tVATB8yZxWiyKIZcZYWv+6b2HBVH4VNu+
         b211BbaW5/55RfkMPuTFenVLybGvI7iah2dRznckuGlHFJDUQa2YAuBqKBpQBVPTGH/y
         eoHUWwTAZ7JI68YoGvo6AnhIQ5aB8wfhqK9g73FxtwrBoC5Qu/VIGq2W9AnrLOsDUXIF
         LNCiWmafFZMEuCDXtRF9k5/Fic5ppLlfQrhqPMleQfmQgfsSwbBBFlT226VmQxkf/XGV
         Monw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uOgamSLy2qNuBEfyhqkmisI1dbQZcc+UFsv0brxHzlU=;
        b=QXoYZIxLrUws6RmvOMCd/w/mzcjjTQb9oVQ46OVk5PvYPudv2kJIUPbWfenYOXPvHm
         a7m2iPt+m+SaZ4hE/C2nCbaKMXBxZAx1Aratp8rMy8z2qmNCIvI4ihvd8E2OHQ3jHf9K
         QfDkIVrOfAgsLQCgRHeLP9x5a/yZ2AOS+8yTUwtBDAGAVzqTg6GNCggmgtfFoOgCvfNu
         oRhIG/b4TC0gQagakWzkYjhC3EnHd47CTJ+xhzVcO/3gWHB9+9sSWie6i2izdsoPPq1B
         9zOkoDYlO6bzsBQJwvRMg1gaKn5ng1jz/QTrfzW8ZZ2Dnc42UDlPDICqYzX5qCIVlzml
         0sKg==
X-Gm-Message-State: AOAM532Kv2iE7FUTImpnrpJDenNgpU/Fk9SjVqAXGhsV0aEXzFrPf+Un
	vBcqNvJh/QdCqczH0xaD8cM0NSUIz8hYzg==
X-Google-Smtp-Source: ABdhPJyjSuZqTQVko4YzaD4S8guqfpYPqMZhFWIqEcC6OPfTHFD6/9rx7wwr4roEWnW+7vAubNjyFQ==
X-Received: by 2002:a62:7d15:0:b029:1a4:a29b:815f with SMTP id y21-20020a627d150000b02901a4a29b815fmr6532376pfc.17.1607925699012;
        Sun, 13 Dec 2020 22:01:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::64a3])
        by smtp.gmail.com with ESMTPSA id l13sm11663016pgq.51.2020.12.13.22.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 22:01:38 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 3/3] systemd: Fix reallocarray check
Date: Sun, 13 Dec 2020 22:01:27 -0800
Message-Id: <20201214060127.1727-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214060127.1727-1-raj.khem@gmail.com>
References: <20201214060127.1727-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Musl brought this latent issue to fore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-meson-Fix-reallocarray-check.patch   | 30 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_246.6.bb    |  1 +
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
diff --git a/meta/recipes-core/systemd/systemd_246.6.bb b/meta/recipes-core/systemd/systemd_246.6.bb
index d9e7b1a00c..b89eff6be2 100644
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

