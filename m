Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E0BCCA486
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:15 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.51620.1658306710937743847
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jzsacOar;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id oy13so31717126ejb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HFaaquxKyT5dJUWfR6XhvYX3XDaBvR81msHReUYaf2o=;
        b=jzsacOarls39+EncKkwYV1YlwNQllYcUXGa+m3wHqUh1g24TcuYMBmKYE3b+a6yEfk
         tXT7IymnrJlB3tov+4dnDexzBil9Tqif1yjxT8Q05OBUTsQX95o6lXzawfL3V6gUymVb
         C2WKqAUmEmfkzuDlQBMgxfbV7LLQ6KkM8IQVSPuY+HOmp3mnVC3OXQrnjLUhq8Ra577I
         Ley127Xq/yiRKHPW8C9+3DHdqz6HHmjxiTRWYFQPJFAUdJJJx+KHDgAuFf+uhOUCzv2j
         N8HQviHKV+X3SP/L5KmN8/fcBfrOKOD9Ubm7+XXSRH7TIL6DZoZ9z1SyUBMW02xymT8e
         RQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HFaaquxKyT5dJUWfR6XhvYX3XDaBvR81msHReUYaf2o=;
        b=pyh/Nndqwlg8S3VXRniYjYYFgVNCbIm2e517fWLvrKmf33tXI9B0pbJwMn5MY2yRFI
         RfudS98r0ZO8Bs+uIZXTW2Kj43j02kt7dWnuVhveEPxLNnvyuBkEoq72lEEOimxdfUba
         N6IqLdjMvKivILu57/dfSL9pr7b1OTHf52/IvFJK1um2TB9DiA3EFP8th6GaUl6BTIjM
         64kSCPcoB/Oq7b+LwDxOLjtUIuM6oRKi70Z83Acf/326RQ+NSsZqSaC5DS0lrb9P5+67
         9aHvqnqU5w+2ND5w9s+5Yxczha5uVpffkzzm1diuxdQ1dCuUHmsFcd0v55QHkFoU3fIA
         +BNQ==
X-Gm-Message-State: AJIora/OJ/JDmIW4aGgePcWLlG82J7dfMtaQ/uZJeQod24QGS8LzZzKg
	Q2fASeTvHYk+1J1JaX5T0jt3k4xEqTw=
X-Google-Smtp-Source: 
 AGRyM1um9wmGq+8d31T5C3dMNnmjOI5F1LJmbDbFr375wA/X0ITq5s5ggYPX3UU+lkaLpPr+o8lpzg==
X-Received: by 2002:a17:907:7fa7:b0:72e:f88c:db16 with SMTP id
 qk39-20020a1709077fa700b0072ef88cdb16mr23902021ejc.366.1658306709509;
        Wed, 20 Jul 2022 01:45:09 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/51] llvm: update 14.0.4 -> 14.0.6
Date: Wed, 20 Jul 2022 10:44:11 +0200
Message-Id: <20220720084442.2940187-20-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168314

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 meta/recipes-devtools/llvm/llvm_git.bb      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 860671e2de..4477689157 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -26,7 +26,7 @@ QEMUVERSION ?= "7.0%"
 GOVERSION ?= "1.18%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
-LLVMVERSION ?= "14.0.4"
+LLVMVERSION ?= "14.0.6"
 RUSTVERSION ?= "1.62%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 2ec5c1e1c0..bdea95db96 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,14 +19,14 @@ inherit cmake pkgconfig
 
 PROVIDES += "llvm${PV}"
 
-PV = "14.0.4"
+PV = "14.0.6"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "29f1039a7285a5c3a9c353d054140bf2556d4c4d"
+SRCREV = "f28c006a5895fc0e329fe15fead81e37457cb1d1"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
-- 
2.30.2


