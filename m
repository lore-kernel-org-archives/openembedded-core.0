Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18137C6FD18
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 06:08:28 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.31173.1681884507066003756
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 23:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Neg2VbIn;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id fw22-20020a17090b129600b00247255b2f40so373432pjb.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 23:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681884506; x=1684476506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0QCtMhbBZnwG153TtHUiejSk82NskjAQ5GwC7g1Uqms=;
        b=Neg2VbIn+teHxGDU4CoqO8FeX8diiGs2l5kDrc1Y17TYeJHYjlTInFytnaDbqVcRwq
         Aa+H/+ZY1MdkzWljRVnYrTt9oIAQ203VSbDXzLUOOe9ZctQs2iUf1PMHwRFV7fOBDINM
         JxeKym2waJFA3B4xyBTNC1WnoxEE6QN0dqIlQuOtwn0iDsxzZI4HbKl9DCXC4auk7556
         SQ1XcX/4Z75QOAAtvmi4urJcpAs2tjgV/poWFM48WDl+4Jw31EHnt61K9Mgk+kFzY6rz
         y87y376NhWLbUzhkTIXllFeOewzn94LrTzZ0v2qQIRpw3LdRmp4hVnzUjXyto2tsj9EL
         hDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681884506; x=1684476506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0QCtMhbBZnwG153TtHUiejSk82NskjAQ5GwC7g1Uqms=;
        b=XANI7gsgsUAHAaHlVFOMmBtdYC9QO+QIUyWnIlPBan3oFhcf/mnOHxxgH0UEKGjYKj
         l0mbYCTIY5LlLFtUDF68RvrH6zodygSXrdshuJe/k1QfJgG/njxrBx0wi4ej+V4+JnSY
         J3vG7kjEfy4jZqn7j+P0J90Ccx7qDrlnAXvnPpDdD2NBwOzEMaN/+s7a4LtSPciQhwWh
         52d6FEf0sG3BsrQ231TNU8N8xuxx04VO8zPc3cBZyma/6SyBEx9s2jXObxbZTW4WYF8d
         BKsu9HWxZHNK+na5CHcbjmIvWIvV5hdvi7XD9jWiMpHBp7tQ/ffxF+CMNnk5sW/eIJzQ
         rHYw==
X-Gm-Message-State: AAQBX9epPZ97CxIiT8UAsfqAEissMCOE1Z4h7NV23pROXQRSTflKzReF
	XJGOqVgXatQQ9rLSZ5sKmonhR4jcIqGuig==
X-Google-Smtp-Source: AKy350YKLWnpIGDTfq27/IUM49N/t7D070nE3xfy2wEUzlr/EeWUbwpOiMDigGobkZ/Pv/byZ1IYzA==
X-Received: by 2002:a05:6a20:734c:b0:f0:e574:d865 with SMTP id v12-20020a056a20734c00b000f0e574d865mr2969530pzc.12.1681884505897;
        Tue, 18 Apr 2023 23:08:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ebd0])
        by smtp.gmail.com with ESMTPSA id 8-20020a630108000000b0051b7bcb6162sm7646249pgb.81.2023.04.18.23.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 23:08:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] apt-util: Fix ptest on musl
Date: Tue, 18 Apr 2023 23:08:22 -0700
Message-Id: <20230419060822.303817-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 06:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180211

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ion-Check-if-transform-is-supported-.patch | 37 +++++++++++++++++++
 meta/recipes-support/apr/apr-util_1.6.3.bb    |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr-util/0001-test_transformation-Check-if-transform-is-supported-.patch

diff --git a/meta/recipes-support/apr/apr-util/0001-test_transformation-Check-if-transform-is-supported-.patch b/meta/recipes-support/apr/apr-util/0001-test_transformation-Check-if-transform-is-supported-.patch
new file mode 100644
index 0000000000..261b78736f
--- /dev/null
+++ b/meta/recipes-support/apr/apr-util/0001-test_transformation-Check-if-transform-is-supported-.patch
@@ -0,0 +1,37 @@
+From 3a97f58cfb40fc1911bbfd067e8457a472613d75 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 18 Apr 2023 22:58:00 -0700
+Subject: [PATCH] test_transformation: Check if transform is supported before
+ using it
+
+This helps in excluding these tests on systems where these are not
+available e.g. musl
+
+Upstream-Status: Submitted [https://bz.apache.org/bugzilla/show_bug.cgi?id=66570]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/testxlate.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/test/testxlate.c b/test/testxlate.c
+index 6981eff..de00fa4 100644
+--- a/test/testxlate.c
++++ b/test/testxlate.c
+@@ -116,8 +116,12 @@ static void test_transformation(abts_case *tc, void *data)
+     }
+ 
+     /* 4. Transformation using charset aliases */
+-    one_test(tc, "UTF-8", "UTF-7", test_utf8, test_utf7, p);
+-    one_test(tc, "UTF-7", "UTF-8", test_utf7, test_utf8, p);
++    if (is_transform_supported(tc, "UTF-8", "UTF-7", p)) {
++        one_test(tc, "UTF-8", "UTF-7", test_utf8, test_utf7, p);
++    }
++    if (is_transform_supported(tc, "UTF-7", "UTF-8", p)) {
++        one_test(tc, "UTF-7", "UTF-8", test_utf7, test_utf8, p);
++    }
+ }
+ 
+ #endif /* APR_HAS_XLATE */
+-- 
+2.40.0
+
diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-support/apr/apr-util_1.6.3.bb
index 7c6fcc699b..1371e262dd 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=158aa0b1efe0c12f23d4b007ddb9a5db \
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configfix.patch \
            file://configure_fixes.patch \
+	   file://0001-test_transformation-Check-if-transform-is-supported-.patch \
            file://run-ptest \
            "
 
-- 
2.40.0


