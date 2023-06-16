Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2E9EB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 08:31:21 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.3939.1686904275998875387
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 01:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=R0rxavWn;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-762389a65a3so7576285a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 01:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686904275; x=1689496275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/ikhjn+QRtMcIwmT9YSGaepdooqEOiRK0o6emKjMTg=;
        b=R0rxavWnLcPJu5NE1bENkBhbULUaJ+3YgS2VHWtsG34NGpm9lT4I83eXwpfeVJhqb3
         0WUC9fNbW8MJQoOd+6BLoYL4pT9/1p78Y2l94tVMDcvmPyWgvdDWgzyPRKcyljZOz0Pw
         AcvKqNXp4dEjWnaqJ6WpIXP0tHdfhRe7kK8usIWZzHy8bgGYJJ1I3Iulgm4XfdFJ/nH/
         AtjIMUonPsdTKiHuk1m87+Q5dvB+xf1nPJUvzPVDByPJCYADLFWIDtxfEniR5y7GAzK+
         0JgdrwxdMsprKt1yHoebVy4l4JtAuEc5LJbB30Xi1tY10uKgkZTr5t1Dxawuc5V23avH
         +dJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686904275; x=1689496275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/ikhjn+QRtMcIwmT9YSGaepdooqEOiRK0o6emKjMTg=;
        b=KQ+Rt6XqcnefNz0MkF8jYhjtKFwHAksPJ6Tp47lyG+Bm5bOWht69CV/tFg3g95ctPc
         p65hKzx/B4uNteXOjZLAL+fvzXuRcXGxMNRpb3bcnDXJ8dAQ84zVy9YCTi4OIaQV2xF/
         05bG6r6my/rLyC++5O1zBh3IhSvfkFJe1kCqiglqIFnrmGcEJsPUDiauOgDWeJsYiDdl
         6EX2lJEBhAlKv+wnUo3VnqYeFgyeY7iYqnCi0sjtGwzvF1v9rJbbN05S9UavPAr/+lgT
         LUrthu/Dca9GpGmDTTimkVcXihM1MXFaawWIj+ulpHnV1tCSmRPDoh2eHR3d6wPRlmyp
         axVQ==
X-Gm-Message-State: AC+VfDy16GM6jGSbcLC/a452gWFHbpAhYK79uUxpuyrP0mp+go0CfoHS
	RNusEvjQsstiq8aVphJOwDcQNwhf4hA=
X-Google-Smtp-Source: ACHHUZ6pBKOaYk0xCbhuQVQLztZFSovBvfFY73Ydhfhjq//s/cqLmwb8RxPB48qkECK2Ys5KLVrSow==
X-Received: by 2002:a05:620a:8c85:b0:762:2878:8b2b with SMTP id ra5-20020a05620a8c8500b0076228788b2bmr1009509qkn.18.1686904274786;
        Fri, 16 Jun 2023 01:31:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id s18-20020aa78d52000000b00653dc27acadsm12969145pfe.205.2023.06.16.01.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 01:31:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/5] libxml2: Do not use lld linker when building with tests on rv64
Date: Fri, 16 Jun 2023 01:31:08 -0700
Message-ID: <20230616083111.3007680-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230616083111.3007680-1-raj.khem@gmail.com>
References: <20230616083111.3007680-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 08:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183002

lld ends up with errors on some tests
| riscv64-yoe-linux-ld.lld: error: section size decrease is too large

Therefore do not use lld when building ptests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/libxml/libxml2_2.10.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.10.4.bb b/meta/recipes-core/libxml/libxml2_2.10.4.bb
index 288631504ce..4f3b17093e4 100644
--- a/meta/recipes-core/libxml/libxml2_2.10.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.10.4.bb
@@ -40,6 +40,8 @@ inherit autotools pkgconfig binconfig-disabled ptest
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3targetconfig', '', d)}
 
+LDFLAGS:append:riscv64 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld ptest', ' -fuse-ld=bfd', '', d)}"
+
 RDEPENDS:${PN}-ptest += "bash make locale-base-en-us ${@bb.utils.contains('PACKAGECONFIG', 'python', 'libgcc python3-core python3-logging python3-shell python3-stringold python3-threading python3-unittest ${PN}-python', '', d)}"
 
 RDEPENDS:${PN}-python += "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-core', '', d)}"
-- 
2.41.0


