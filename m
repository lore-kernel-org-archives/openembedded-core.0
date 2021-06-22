Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.7517.1624360904249873633
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 04:21:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Aurv4Y17;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id r7so23080847edv.12
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 04:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9AZLX+bfNxjXBb/2GMicCa17RqbzMIIz0EWVeNYqqJE=;
        b=Aurv4Y17zFentAfzh9l+JGrJc6+R7PnQX6E8N2qv6lwGFRo4smtLIp2fm+H/1K2K5F
         T33oUDE3jwmoaTmNsx+mXxAf7RNL6XeehN5NSDPgOUT3ThQf2GJSJau/laf7Hzh/zBii
         m9Nkr4TOlTvWNzG87f6+pLjT59Vtd2c/iz51B0ZiSkJGkCOC8ZHK5Y06yP6LBHHJdQ9a
         JCHWRNKD3H5eD60aK18M/RTTtXq0rSVWbDh5fiJnKQellAtLX4ZjyOTFFyFFCl38oT68
         27lgnn5vXmr0fpUI5ZSxP5nkyBc7sCyCDMGXSO+Tqpw5EnnQkCY08U88i4BonMJJ3DvU
         GJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9AZLX+bfNxjXBb/2GMicCa17RqbzMIIz0EWVeNYqqJE=;
        b=GxqvI5FsblIojSSAxVKBEKtsu3pPb6vbrE2mhVQBtUzWyf58EsT8XI9jh9AzgOPuAj
         EnqAurnSjQChHbCpQcN1fVgIkbaRk37svXKx+swFtqAGraCy7lso6dw3mioG6uSfzA4i
         /ZYWtzzYoKzbalaKjk/6qa6u+jMY5rCyIA/BWS+1ySAdXZCND/+vBPXGrIKvozx70n/O
         sINyQm/Oa/OwPAsfxEPJAKsfqR6PKp4h4hsgmkGUuwL7hYCLxpSbYkbwpbhunzXB+3Pp
         UhPmICZ8bxKQCQaMN0Prmz+dpDlNH1sULZjmI1fa35Up6GMdPKSOZbzmbHk5obNW+mbR
         RTaQ==
X-Gm-Message-State: AOAM530zuX8SKbEApq80FBkwfZxMahCpdo313OwR14SzCEDwadC5nLcp
	VDIIxqiCSd5P6TzFcDr9Yov8N1HufXvSIw==
X-Google-Smtp-Source: ABdhPJxvxlNOJ/JSCwemXeSiKEi2zhRN6SlgBhwLKj03+mwfotY98mDYGikd1bvirAmP8wNzoXyu5A==
X-Received: by 2002:a05:6402:b81:: with SMTP id cf1mr4404054edb.102.1624360902906;
        Tue, 22 Jun 2021 04:21:42 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n2sm11987416edi.32.2021.06.22.04.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 04:21:42 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 19/19] python3: apply test skipping patch unconditionally
Date: Tue, 22 Jun 2021 13:21:26 +0200
Message-Id: <20210622112126.2026646-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622112126.2026646-1-alex.kanavin@gmail.com>
References: <20210622112126.2026646-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Testing IMAGE_FEATURES from component recipes cannot possibly work;
adjusting the test to soft-fail if needed items are not available
is not trivial, so let's just skip unconditionally for now.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python3_3.9.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.9.5.bb b/meta/recipes-devtools/python/python3_3.9.5.bb
index 1717ff737d..503f810fae 100644
--- a/meta/recipes-devtools/python/python3_3.9.5.bb
+++ b/meta/recipes-devtools/python/python3_3.9.5.bb
@@ -31,7 +31,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch \
            file://0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch \
-           ${@bb.utils.contains('IMAGE_FEATURES', 'tools-sdk', '', 'file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch', d)} \
+           file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.31.1

