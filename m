Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B72EC25B7A
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 10:30:23 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.12072.1715682619437608899
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 May 2024 03:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b2EtXVPw;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-34e667905d2so3651491f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 03:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715682617; x=1716287417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fDyL222cFtODLDeFjHjRClB5TIHVfq+OJc7sBPl0f7Y=;
        b=b2EtXVPwLHoZoQkrhtS2vCAQYfBMBS/83+wfXJ8FBriQCGu5OUkUC44nj8HXtXH2pT
         YsM0JpMSNJrGvbirkZEaP42fI8Bll3s8nI17PoNH7YFbz5ShSVzkIeaUG9vstA7+WVFu
         myQTGuUNxgwSLgcRgWtl1/KgpD+b1Wo41Nb0ZZkDHAr/1485xRLLMnzFpB2j6efrZfQD
         yYgeEI4CB4MHFKC2hDxQJe3zKbyg/EP+KvxWdTNXIwWZWy+2TJYuTqSne8N6sdMFDo+m
         WBGCpilgAy3g0nU98L5RdcrKVKZDq+6XuaEdKf0fpW7HR+c29Q8oPxm+8KZgKSvLrAOE
         O01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715682617; x=1716287417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDyL222cFtODLDeFjHjRClB5TIHVfq+OJc7sBPl0f7Y=;
        b=t5JsokBHQicmOcg2A6fEbOEoKm5bNcGlSdXWc7QA+wW8wWz6xlzUuLpFZ8yR9km0EZ
         zoYsyC0JRffRLBpQ+1RgMECF6gq+O5cNL9cMHlprKPaypjr73tLVr2y2xAMgEvdRUrAX
         d7elEM5Bui07GLvxNDzckk6HgJw1p5XJ2/tebdjl86oF5yPZnvwriH2vHhCITYSXKsrH
         TvnxLB8t3fv9L1Ep2VdmBZsRC+Of/gj95Ge94FfCM3li+qDYxGvECfMN+A7KhVPaHnC/
         prKIGGgj9FYGUWi2lRagcaLK1gg4U5jWQ9xqTMYkMBBmEAx87sOHmhK9VMWbJmLoddbT
         hj6g==
X-Gm-Message-State: AOJu0YyN7xEfa/Vn1t1ndbT1G/2zNOIKAFSlrCEYXNjVEsWcftzmQ8FP
	ObtyOuSbd3gg/DVt7Eq1qhjlH3cIfArdOc/b8Yv6OtFVDcfzOdKcO6JfrnLaycpYf9NN
X-Google-Smtp-Source: AGHT+IF52zJ4Dh+AdFFbkdS2jKh5ZEzkOk1xU+sYZQElNq0KGSrsvBWd03EHPsB3WGn4rwQa64UN7Q==
X-Received: by 2002:adf:faca:0:b0:349:8ba8:e26d with SMTP id ffacd0b85a97d-3504a632d98mr9204286f8f.13.1715682617140;
        Tue, 14 May 2024 03:30:17 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b79bd40sm13429239f8f.4.2024.05.14.03.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 03:30:16 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	Joerg Vehlow <joerg.vehlow@aox.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][kirkstone][PATCH 1/2] go: Always pass interpreter to linker
Date: Tue, 14 May 2024 11:30:10 +0100
Message-ID: <20240514103011.582683-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 10:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199253

From: Joerg Vehlow <joerg.vehlow@aox.de>

When gos internal linker is used, it uses hardcoded paths to the
interpreter (dynamic linker). For x86_64 this hardcoded path is
/lib64/ld-linux-x86-64.so.2, but yocto's default dynamic linker path
is /lib64/ld-linux-x86-64.so.2.
Most of the time, the internal linker is not used and binutils linker
sets the correct path, but sometimes the internal linker is used and
the resulting binary will not work on x86_64.

To ensure the path is always correct, pass  it to the linker.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6b54215074d7f3dbba07f096f16b9c0acf51527c)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes/go.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index d944722309..55f9d8f230 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -1,4 +1,5 @@
 inherit goarch
+inherit linuxloader
 
 GO_PARALLEL_BUILD ?= "${@oe.utils.parallel_make_argument(d, '-p %d')}"
 
@@ -44,7 +45,7 @@ GO_LINKMODE ?= ""
 GO_LINKMODE:class-nativesdk = "--linkmode=external"
 GO_LINKMODE:class-native = "--linkmode=external"
 GO_EXTRA_LDFLAGS ?= ""
-GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} ${GO_EXTRA_LDFLAGS} -extldflags '${GO_EXTLDFLAGS}'"'
+GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} -I ${@get_linuxloader(d)} ${GO_EXTRA_LDFLAGS} -extldflags '${GO_EXTLDFLAGS}'"'
 export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS} -trimpath"
 export GOPATH_OMIT_IN_ACTIONID ?= "1"
 export GOPTESTBUILDFLAGS ?= "${GOBUILDFLAGS} -c"
-- 
2.45.0


