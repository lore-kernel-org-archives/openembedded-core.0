Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6ABFC77B61
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 13:04:21 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.50233.1682341460650986075
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 06:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dXTDtvbB;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f18dacd392so25564215e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 06:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682341459; x=1684933459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zFd/u77cDpQ/254hAqQuFvN4En4E30r9dIjLiihS64Y=;
        b=dXTDtvbBbqCmm2iUvwuhfQTuO9YXyY8nrM2CJBQINF01QpzENNk86cQozyVP37Kw7d
         MNLOKGgATdLS/G43aWnsaITujzaJZWmOJabT7JwJIYLC/noZP+38CGr5yKojY0NL6S8F
         8RS9VCEaQysdHe3m7A7aUioMibdhWMiVUkP7m8MokU/QO4EyLb6oKqXSmKqoiq4oV63w
         MkqoFyvUpwaWnv5RZ4kbLV4+nQexnzQagkz22OKbMAMlgwrP1XE+wQ7HSfKaf71Gzq88
         wLBgczdKgO2AhGvqurYQhGuTyh54tSt/TEL8/CiO92ZoXykQcyf/85YChKhIc6KGqGuG
         Bpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682341459; x=1684933459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zFd/u77cDpQ/254hAqQuFvN4En4E30r9dIjLiihS64Y=;
        b=ZZJ60B/9pVP4021Nkca8/K9kWH6W3Su2UjTe0wnZuiENllr+67eGeUtRPpkGTi+rVc
         BvjBYoeF9K69sIpInhLqOUO0d6q4in/rEfPA2R9ex3lrDvDKR5UyvJ66nhatSDNNjj8q
         hjErivRTl7CBL2NvNi6D9Idk3g0Oox6v5STtkQq89qUA59Fu7RaFP2NzNB3xCrJwqLI0
         hS4/lPA1vIyh8Dbl1oI1gFy1i6tPOBG057r8RBeW9u/ypB9kDAp92IxbSIAIVJrn9VEa
         vbJCj6fLwSg6rBVvKUIHw++e1iCu0ilG40QHYO8IbTJ6azwi6bm2ukZ5yvIsv/1YcEBz
         9aXA==
X-Gm-Message-State: AAQBX9fl0i3Tm+JQftmHHki5kMkXixeS5OZQeNV5RvZrhmC9wWOVAzQN
	ZVWG1IJHhezz0yP/IFKS0+/cD5zqzfw=
X-Google-Smtp-Source: AKy350bd47+Dk2md2ccMqY0gsN+uIkhpZeEKP1I1A1lsTN7jc3iPZBrp94zKFGUtLlbhSt4RM5bhfg==
X-Received: by 2002:a7b:cd07:0:b0:3f1:9489:6deb with SMTP id f7-20020a7bcd07000000b003f194896debmr6802854wmj.20.1682341458386;
        Mon, 24 Apr 2023 06:04:18 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:d7e1:16f4:c5d8:fb02])
        by smtp.gmail.com with ESMTPSA id eo9-20020a05600c82c900b003f0ad8d1c69sm9170508wmb.25.2023.04.24.06.04.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 06:04:18 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCHV2 2/3] python3-bcrypt: enable build of unit tests
Date: Mon, 24 Apr 2023 15:04:12 +0200
Message-Id: <9108a98c81a8a351007a4621b1214e6ec2656cd1.1682341336.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682341336.git.frederic.martinsons@gmail.com>
References: <cover.1682341336.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 13:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180353

From: Frederic Martinsons <frederic.martinsons@gmail.com>

The source code of bcrypt extension doesn't define any tests
but it is to show the ptest-cargo usage

Below is the updated test suite output for the recipe (cut):

PASS: tests/test_bcrypt.py:test_invalid_params[password-$2b$04$cVWp4XaNU8a4v1uMRum2SO-513-10-ValueError]
PASS: tests/test_bcrypt.py:test_invalid_params[password-$2b$04$cVWp4XaNU8a4v1uMRum2SO-20-0-ValueError]
PASS: tests/test_bcrypt.py:test_2a_wraparound_bug
============================================================================
Testsuite summary

running 0 tests

test result: ok$<2>. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.01s

root@qemux86-64:/usr/lib/python3-bcrypt/ptest#

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb b/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
index 21f2eb6ba4..b4f245530d 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
@@ -7,12 +7,14 @@ DEPENDS += "${PYTHON_PN}-cffi-native"
 
 SRC_URI[sha256sum] = "27d375903ac8261cfe4047f6709d16f7d18d39b1ec92aaf72af989552a650ebd"
 
-inherit pypi python_setuptools3_rust ptest cargo-update-recipe-crates
+inherit pypi python_setuptools3_rust ptest-cargo cargo-update-recipe-crates
 
 SRC_URI += " \
 	file://run-ptest \
 "
 
+CARGO_SRC_DIR = "src/_bcrypt"
+
 require ${BPN}-crates.inc
 
 RDEPENDS:${PN}-ptest += " \
-- 
2.34.1


