Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C58C433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 19:23:00 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web12.1697.1642101778931911161
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 11:22:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=lsriub5W;
 spf=pass (domain: linaro.org, ip: 209.85.167.52,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id o15so23004851lfo.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 11:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OPgWpfhsY99Csh74Dg/Kce9O8soAL+HOzI1UynviR88=;
        b=lsriub5WLLrN0XuTNVcmfQ8KQTIGm86ccqsx+F2sP900xlkNJODpoQHE/HKrQi7TNl
         eQAKgbFr03UHeBW7fWIIOUlfxUbCoZmmNQUSUMAiyZHDq3q7dquMFlhO6EXx29VzU9V/
         NqojI7wE/kC0fBD4O0GMpbczbM0brZAQ9oO1FXAlLvOVv2waKhK8tAJRbT0yAVand+0H
         YDjttkxUPdY15uzAT2GnXSJEZvvcc4qwDO8Q4RjvuMJt8PUu7pgbPlUY6bMNuHhxhmds
         7SwZsPug9u1B2QjzFXAKkFLQ5rL6f0VOV66F/laEm1lCR1sCszFA+Eq7pJeXYRRFqSgq
         zOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OPgWpfhsY99Csh74Dg/Kce9O8soAL+HOzI1UynviR88=;
        b=2iG+/xBn/DT6jLDK4LBqqknHCHYCQgC3mPYqQ5W2J7A+Rda2EvzLEhIRgZFMxcq7lg
         NF1hNJpXXR5WeJjORskBZAOFdXqML2HyRDsaWF2JEvLmx7w/yG6BZ5NQ/nYDqxzJnU0K
         Hz5FUHtmMD6TPsehctOul4yZS7H8zxlPPanuX4T4VgZJPwIj7Ui6yEcPeT9Fg7U4QZYE
         MC5LGDkzvm9xBKwYANO4P8ksNrClQ3rI1oY1YeO1D1Ks3fDt1qCZSKfjtEIwaMQahjiC
         37w+wNWE3LoNcNWd7C2k2ZRZYnEyyat5MvOmRkSu4pilz+3rNDpXNaGJI/J6NEV86b9O
         kmxA==
X-Gm-Message-State: AOAM530Jr/d9rq23QpmslvJ+Hxjs8ZmlBkHq6N3J367NEL8DFYVNTyuR
	E5x1v48nmH/mE5ZWIb5ykQQnBZ8dB8bB9w==
X-Google-Smtp-Source: 
 ABdhPJyUu0+FZ64BAPwml73ML6hjf3qblgQQ8x7WpUVr/bWtItj5d+VRBfqk0EFQJxyhoh0sNkqzYA==
X-Received: by 2002:ac2:5581:: with SMTP id v1mr4663578lfg.514.1642101776597;
        Thu, 13 Jan 2022 11:22:56 -0800 (PST)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id
 d36sm369177lfv.213.2022.01.13.11.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 11:22:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH v2] go: fix building without SECURITY_LDFLAGS
Date: Thu, 13 Jan 2022 22:22:49 +0300
Message-Id: <20220113192249.818255-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 19:23:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160530

Commit 9985b17a30bb ("go: correctly set debug-prefix-map and build
directory") has changed CGO_LDFLAGS to the manually crafted version of
LDFLAGS to strip out DEBUG_PREFIX_MAP contents.

However this manually crafted version includes ${SECURITY_LDFLAGS}.

If security_flags.inc is not included, the variable is not defined, thus
CGO_LDFLAGS will include the '${SECURITY_LDFLAGS}' literally. When
building the recipe, the build would break with the follwing message:

aarch64-linaro-linux-gcc: error: ${SECURITY_LDFLAGS}: No such file or directory

So, instead of manually specifying variable contents, perform the
expected action: filter offending arguments out of LDFLAGS.

Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-devtools/go/go-runtime.inc | 3 ++-
 meta/recipes-devtools/go/go-target.inc  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index a08d44dd3a8c..ccb86d4fe9a6 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -10,7 +10,8 @@ DEBUG_PREFIX_MAP = "\
 export CGO_CFLAGS = "${CFLAGS}"
 export CGO_CPPFLAGS = "${CPPFLAGS}"
 export CGO_CXXFLAGS = "${CXXFLAGS}"
-export CGO_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${SECURITY_LDFLAGS}"
+# Filter out -fdebug-prefix-map options as they clash with the GO's build system
+export CGO_LDFLAGS = "${@ ' '.join(filter(lambda f: not f.startswith('-fdebug-prefix-map'), d.getVar('LDFLAGS').split())) }"
 export GOCACHE = "${B}/.cache"
 
 GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index 51f1b79cc320..b0d487ae1c21 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -9,7 +9,8 @@ DEBUG_PREFIX_MAP = "\
 export CGO_CFLAGS = "${CFLAGS}"
 export CGO_CPPFLAGS = "${CPPFLAGS}"
 export CGO_CXXFLAGS = "${CXXFLAGS}"
-export CGO_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${SECURITY_LDFLAGS}"
+# Filter out -fdebug-prefix-map options as they clash with the GO's build system
+export CGO_LDFLAGS = "${@ ' '.join(filter(lambda f: not f.startswith('-fdebug-prefix-map'), d.getVar('LDFLAGS').split())) }"
 
 export GOCACHE = "${B}/.cache"
 GO_LDFLAGS = ""
-- 
2.30.2


