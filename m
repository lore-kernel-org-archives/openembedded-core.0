Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A98F2C7618E
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 00:27:32 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.35793.1678494448111642464
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 16:27:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C1Ggimsg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id t15so6556359wrz.7
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 16:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678494446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pltEuvpbnvUPvuzZ607arWUbgKbpsHK1NeoPPMQ1M2s=;
        b=C1GgimsgHNevNBeWMMAyzV3MLalHapNUO2n5foyYRdthpYb2WfvrNsodAx0RRbfYry
         fgL0VVP5bkg6EDcm1kKraeulx1P/ZGx5ZcOyfhiMrVqeRuAtV0x4rAkxzqz7uJZwm4OW
         awRpayFhnTzfP0cNOo6YlI/cp9bY7NAJwn69c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678494446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pltEuvpbnvUPvuzZ607arWUbgKbpsHK1NeoPPMQ1M2s=;
        b=jYP8XIlpFZhDM9oUInyFHuYwqveccaTcj5M1vGpUg2owwAOCC3dlsrbX/zrKO4fJ80
         pPrYa66CWA7JbqCGT3JrgoyMM1dg2ituP/ObL1uYa7TeQWHdOutIUq5uOYvcOxZi5/hU
         f3YF/1QB3M9iWjtLZL0cgXGVhPaLXt7rri5ACm23mqhBZyNO3TuatT3AUhUWKVJU0K52
         R2pRIw3nBTWMNHu6ronbOe8meNf8pPO+ocJOmyuD9Z3lhMj8UzaSXC8Iuzmdx8nOERKd
         sACv9d1Pq81QRQz0B+dQhdyRC07Ir3cq9oY6j5oBLYD7TFGPzWNFjoz8umL9tIJhscnB
         USLQ==
X-Gm-Message-State: AO0yUKWkC3hWNjpKUE7cX6HbiHxiNxmIv3fBKQAN9xZlUNaGxA1CcTE1
	Rhoxs3RXmI+4NXx7f6u27QNE+r8P5xzskG6/PUs=
X-Google-Smtp-Source: AK7set9fOvtSr6xWtu9gX3qollKpYmCTD1MCtk+5w6ah9RQrQyK0Db9WQ2OEaWH0HVBpeY944OJG7g==
X-Received: by 2002:adf:dd4c:0:b0:2c3:f026:9085 with SMTP id u12-20020adfdd4c000000b002c3f0269085mr17227577wrm.13.1678494446478;
        Fri, 10 Mar 2023 16:27:26 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d400f000000b002cea299a575sm291736wrp.101.2023.03.10.16.27.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 16:27:26 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/16] acl/attr: ptest fixes and improvements
Date: Sat, 11 Mar 2023 00:27:11 +0000
Message-Id: <20230311002722.3211118-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
References: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 00:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178349

Add a missing perl module dependency for the ptest packages and also
improve the run-ptest script so that the error log is saved allowing
easier debugging if this fails in future.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/attr/acl/run-ptest  | 6 ++++++
 meta/recipes-support/attr/acl_2.3.1.bb   | 1 +
 meta/recipes-support/attr/attr.inc       | 1 +
 meta/recipes-support/attr/attr/run-ptest | 7 +++++++
 4 files changed, 15 insertions(+)

diff --git a/meta/recipes-support/attr/acl/run-ptest b/meta/recipes-support/attr/acl/run-ptest
index 43128233654..3af75c84fea 100644
--- a/meta/recipes-support/attr/acl/run-ptest
+++ b/meta/recipes-support/attr/acl/run-ptest
@@ -7,4 +7,10 @@
 mkdir -p /tmp/acl-ptest/test
 cp test/test.* /tmp/acl-ptest/test
 
+set +e
 make test-suite.log
+exitcode=$?
+if [ $exitcode -ne 0 -a -e test-suite.log ]; then
+    cat test-suite.log
+fi
+exit $exitcode
diff --git a/meta/recipes-support/attr/acl_2.3.1.bb b/meta/recipes-support/attr/acl_2.3.1.bb
index 5fb8f9ae355..9cb19ed72f5 100644
--- a/meta/recipes-support/attr/acl_2.3.1.bb
+++ b/meta/recipes-support/attr/acl_2.3.1.bb
@@ -65,6 +65,7 @@ RDEPENDS:${PN}-ptest = "acl \
                         bash \
                         coreutils \
                         perl \
+                        perl-module-constant \
                         perl-module-filehandle \
                         perl-module-getopt-std \
                         perl-module-posix \
diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index 53d9dccb27e..ab62563690b 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -51,6 +51,7 @@ do_install_ptest() {
 RDEPENDS:${PN}-ptest = "attr \
                         bash \
                         coreutils \
+                        perl-module-constant \
                         perl-module-filehandle \
                         perl-module-getopt-std \
                         perl-module-posix \
diff --git a/meta/recipes-support/attr/attr/run-ptest b/meta/recipes-support/attr/attr/run-ptest
index f64244f2393..3e7a3a17a04 100644
--- a/meta/recipes-support/attr/attr/run-ptest
+++ b/meta/recipes-support/attr/attr/run-ptest
@@ -1,3 +1,10 @@
 #!/bin/sh
 
+set +e
 make test-suite.log
+exitcode=$?
+if [ $exitcode -ne 0 -a -e test-suite.log ]; then
+    cat test-suite.log
+fi
+exit $exitcode
+
-- 
2.38.1


