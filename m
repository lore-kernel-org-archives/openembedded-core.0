Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BFAC433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 15:28:17 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.24531.1642001295806714283
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 07:28:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=T2t+/8+V;
 spf=pass (domain: linaro.org, ip: 209.85.167.50,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id e3so6634492lfc.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 07:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZKr88TvzKvSfsPHYt6yzgwgSvG9006TbQYI/FAtbXq0=;
        b=T2t+/8+V/VkoxfZYd9tMzteNCEklpjdQhjrkdbbySjcHMMyfjINzKKVh83hsdnLPHE
         wQIJitDAsrllHQdadxkrw9Xg8XEtZ/fgzwZZ4lPoq2RJVV/fb7iAmc3xJ04hGLjKYD6/
         a0ywHKS5PxmyZL+TyvCWzq+uFPFBnuxjxaPGPkWLA98poRuoAVUr0m4JsPmWRBXYc+pY
         TEVpyENqYcc6FJGdAhdqDtMbJ8NhJWFYw1qUL+G0KzjHyC7wYop5T+g+I1MvGQmLHBkR
         goTgZEm+8ozS58rt/z6cpU8zQQLyGOcSK82ctLMhoudCmRHp27ii25rOqZwVORcPaY9X
         YeCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZKr88TvzKvSfsPHYt6yzgwgSvG9006TbQYI/FAtbXq0=;
        b=holPNyNPNdotBvuDFtiB7U5cuHX8cX9KSGDvgJGyll51RmI10JTkITsO5Z2KNtCC6X
         wpQW/i7Yt2BWQ9X3NwL+t2a1+oV6VStidKY9t6vu2GbImN5OSHn8FAOi0T+KFQDjvuDJ
         k5FBfm6wcb/DTDeTLvnMZfJ4SOf3rzv5sv2Oal5TQJosgkIkVk5YSUndAxF+Xhe5Qj6f
         r7z2LAt94t93mHy2OyPMlKk3u9WrqfUx1jBXj0G8GpdCuJvX742IyuEe1sDLW4xupuRV
         1YhZh2+kTGMbwV/6kl56VvJiKbh/ads7OEg+Xl0F5eLNs2QZ7tUKygNAEoSPIN2uq5aq
         /U+Q==
X-Gm-Message-State: AOAM5321o6imdMaZ5EmCS1EJAbddSstQXtDp549Pzgjtxpt1YGUVG3Co
	c+/rrYkTmKt16/Lt3yCvIR3zHi2CmgUmvA==
X-Google-Smtp-Source: 
 ABdhPJxMDVAOHVYDfmUVn1uaMRUtJUb7btAZhfzipSgaB57KguqANynVCIlRqINNILnIhzX/HHOlqg==
X-Received: by 2002:a2e:b5c1:: with SMTP id g1mr43949ljn.494.1642001293510;
        Wed, 12 Jan 2022 07:28:13 -0800 (PST)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id
 f31sm18457lfv.148.2022.01.12.07.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 07:28:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] go-runtime: fix building without SECURITY_LDFLAGS
Date: Wed, 12 Jan 2022 18:28:06 +0300
Message-Id: <20220112152806.1754604-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 15:28:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160489

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
 1 file changed, 2 insertions(+), 1 deletion(-)

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
-- 
2.30.2


