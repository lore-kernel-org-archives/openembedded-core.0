Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B60AC7618E
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 03:41:39 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.4040.1682048496002414899
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 20:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=def0DUdf;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-63b60365f53so2303242b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 20:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682048495; x=1684640495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1lYzIsHtNClu68+Jq4kMGEIHzQ0cbQJ4IUCmRy4Mz2c=;
        b=def0DUdf94WXMmN4mCfn8vcOMTPkEWhhPqbFs/k7P/Bbxx21fil3aexruPKMXiyN+d
         5WVfemKU3+p2fcZDD03f+zzCWwYvnLr7irlJsrUsnjmZNcOyy+alObw17AsGxKmu+WbN
         oz0xhQRZ8unkUZXcxlRO8mZXTOB/lQVi3QNeWAlERVLjjhGnm/ZmvFGFTtPAgwqpVToE
         tS/kWwxLFRWCm5mfEHru4v8+zWRrgeuvPXtDv6cskGKNasXieARlFoydF9PYUW/lOv31
         pBA+UCFsSbcKlwjAQ/WRZXPFms296ke0S30wkJg0k4/oGx7JNgLwn8lxU4aeQdwX/f5o
         RE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682048495; x=1684640495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lYzIsHtNClu68+Jq4kMGEIHzQ0cbQJ4IUCmRy4Mz2c=;
        b=EX11twTYnsSZxzfFRGKpwDoOpiXAgFcZt8QzVaya4yq3k2u2SPpz7b1Cbb4tgPxCZK
         7X159KjtY/tZXGjjIvThA98rIqZ6N1wPuRoYn0rKs6h7J2rQEV1Br+nN+PNwk0xSYA6Y
         IsD6qxnbe7YWdazu2J1FftyhrFGnKqratx+DnGfFt1nP1ocaNhdTavrYisY7Sq+RPf9y
         1BuSQ4U0sMFNoegHvQwDmfCKcrH9m2GD7ky4WdnDVbs6TjyxxGqsgV56MOo31sazm+os
         UX484vvG3OGlZorX+VAJn/SigPgoHXASfsNCw4FNt0bsuErYios+eYavBuTw4PhYE40H
         dSzw==
X-Gm-Message-State: AAQBX9fNhS4k2Bxhp/oahXBWp3o+qQcsW9ziCy9Nvr3KnJ6wc11JvuDo
	F43p79EjufSZwX/pHUxpcWI2mDj8dNBx3Q==
X-Google-Smtp-Source: AKy350aMip1UMuSJJmrCYm6GKbLuHrx0NbqkUiZc1JlV/nk8q1crkpKNrA4md/kHpvrfXhBjfT82ng==
X-Received: by 2002:a05:6a00:a8b:b0:63f:484:4bae with SMTP id b11-20020a056a000a8b00b0063f04844baemr4086495pfl.16.1682048495119;
        Thu, 20 Apr 2023 20:41:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ebd0])
        by smtp.gmail.com with ESMTPSA id v11-20020aa7850b000000b0062bc045bf4fsm2027199pfn.19.2023.04.20.20.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 20:41:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] attr: Disable attr.test on musl
Date: Thu, 20 Apr 2023 20:41:31 -0700
Message-Id: <20230421034133.1136343-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 03:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180265

the error message in musl based systems is
EXPECTED: Operation not supported
RECIEVED: Not supported

The test is then marked as failed due to this.
Ignore this test on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/attr/attr.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index ab62563690..8ba865a74a 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -48,6 +48,10 @@ do_install_ptest() {
 	cp -rf ${S}/test/ ${D}${PTEST_PATH}
 }
 
+do_install_ptest:append:libc-musl() {
+        sed -i -e 's|f: Operation n|f: N|g' ${D}${PTEST_PATH}/test/attr.test
+}
+
 RDEPENDS:${PN}-ptest = "attr \
                         bash \
                         coreutils \
-- 
2.40.0


