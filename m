Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E30C5479D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:21 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.9366.1672830360745063970
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OhYn9fnJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id d9so3992317wrp.10
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctXjaCPks7uFD5VPLRNMmQOjDuIw77VafCwMjZ6Ac7c=;
        b=OhYn9fnJL/AjrrcrxAQVOmjuT+TbTLSBFsFqrQZeHjNjt07YvlapLwFKyEXw4V44wU
         r4y+j8+Vz35S6CSb9LX8O95O9SS/NDHqOylfQH5xg6rdyZaq13ZTxBJzXQwg3rPv0yhT
         eQAgSExVHd3MaCAzFdiaXvFEo2Bp4olC66yCrhq5Bj/YIvleN9mdVXxRZnNQ50c4X9ga
         8rmaiKiviF2u+GxqGvy/Xm/3MyvNQIasMuk9wajgUNlHNz//5hWHHWJirNJUS8XCqckN
         ijxDyCgdstd4gfxPyGnc4Z+WCbS2D4LwADW0dwYMbCXZL9MOvT+Bi7YANH0EeaAnfxFn
         dGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctXjaCPks7uFD5VPLRNMmQOjDuIw77VafCwMjZ6Ac7c=;
        b=zrjga8DopG6K95SdxDxz5zwisAoItH+pgkK14aAN6hooWOR3n6NQJ3WToVE+/wiMMy
         eF4/uJpKJXlmR2zdXHoNToPRLI5bKmhRu8hiMmYQJ4RtajplV/gLaHQEmP9jT8/6Hg0N
         cpveVQvw1Tx9hNtwhp921f2J2JRa0T6q/jvliORGRMHVxM4gdwrY8KP/mhBcRY3xsJZy
         SuLywJygSiweV0x+4Q4Y7K+oJ44VOzywoBrBl5FZxqNz6yGSMyY88nRqVn7KOn6FwVN+
         BA6//fBy/mDbs+XNJ4uC3m8IvcFQwDifR0HzF4hmX/p5E/iuWnGmrIhWwXucgbXLAQbr
         njQw==
X-Gm-Message-State: AFqh2kr24+TBWxHoKZelEEAP2PSu6xA1Obr8NMZjS9v5+4J5ER7nzzap
	I2LQfSzUQsx8pEBNtL3cLuj0fyDIKcE=
X-Google-Smtp-Source: AMrXdXvlOhmz+8HDBUxj6mFN1Unv/8gdZbLP3N4mXs5WQtX/Sy6W15W+eVvjjeRIBu4icP637ERlww==
X-Received: by 2002:a5d:44ca:0:b0:242:1926:782c with SMTP id z10-20020a5d44ca000000b002421926782cmr30689137wrr.43.1672830379514;
        Wed, 04 Jan 2023 03:06:19 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 35/77] python3-numpy: upgrade 1.23.4 -> 1.24.1
Date: Wed,  4 Jan 2023 12:05:06 +0100
Message-Id: <20230104110548.2537259-35-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175420

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...y-do-not-write-full-path-to-output-f.patch | 28 -------------------
 ...umpy_1.23.4.bb => python3-numpy_1.24.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-numpy/0001-generate_umath.py-do-not-write-full-path-to-output-f.patch
 rename meta/recipes-devtools/python/{python3-numpy_1.23.4.bb => python3-numpy_1.24.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-generate_umath.py-do-not-write-full-path-to-output-f.patch b/meta/recipes-devtools/python/python3-numpy/0001-generate_umath.py-do-not-write-full-path-to-output-f.patch
deleted file mode 100644
index 41dea89682..0000000000
--- a/meta/recipes-devtools/python/python3-numpy/0001-generate_umath.py-do-not-write-full-path-to-output-f.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 3c7deaa3a961a0f3ce4ff108468e3d70118f17b3 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Thu, 9 Jun 2022 17:23:42 +0200
-Subject: [PATCH] generate_umath.py: do not write full path to output files
-
-This helps reproducibility as those paths vary in automated
-build environments.
-
-Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/21707]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- numpy/core/code_generators/generate_umath.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/numpy/core/code_generators/generate_umath.py b/numpy/core/code_generators/generate_umath.py
-index 292d9e0..df37941 100644
---- a/numpy/core/code_generators/generate_umath.py
-+++ b/numpy/core/code_generators/generate_umath.py
-@@ -1233,7 +1233,7 @@ def make_code(funcdict, filename):
- 
-         return 0;
-     }
--    """) % (filename, code1, code2, code3)
-+    """) % (os.path.basename(filename), code1, code2, code3)
-     return code
- 
- 
diff --git a/meta/recipes-devtools/python/python3-numpy_1.23.4.bb b/meta/recipes-devtools/python/python3-numpy_1.24.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-numpy_1.23.4.bb
rename to meta/recipes-devtools/python/python3-numpy_1.24.1.bb
index 679a6f4081..83b8ac4232 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.23.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.24.1.bb
@@ -11,9 +11,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
-           file://0001-generate_umath.py-do-not-write-full-path-to-output-f.patch \
            "
-SRC_URI[sha256sum] = "ed2cc92af0efad20198638c69bb0fc2870a58dabfba6eb722c933b48556c686c"
+SRC_URI[sha256sum] = "2386da9a471cc00a1f47845e27d916d5ec5346ae9696e01a8a34760858fe9dd2"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.30.2


