Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BACC433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:57 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.16798.1650095659065576853
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 00:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DPxCNUNh;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so13366784pjn.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 00:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ezi2ncAauLe3HGB5f8hJbHuvZoo42+UMMsvtQh0MqqA=;
        b=DPxCNUNhOB687uifNxxvDNZSbn4tvX1PuPgoSP2LYyL/a5VIV1fHPHKDmVGKxas6Je
         o2smQz4JTge+ScveXCRrRpaESi+LkuNOhksD+KnIXPOPdhTbBamRnvhHQbIaLPzQ21N/
         6eY3d5b4kLmuFqVV2fLGXPwj9o4HCS2IGhgYCIiBwn0CXDVW7GfLKomLM73WR8INw5Jg
         /IH6tN5eabFOf0KHYj8Vl4qUyt6RnnuOk4Rx3pWiLir6z0atz/yF5BENT1GPhFq2t6w9
         WALZVLCjoHWH4Sp1yz9P2L6xaMZgAX24aXP7pPZRFznZF0e2jU02nhLciCAHzf7F9kXv
         x10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ezi2ncAauLe3HGB5f8hJbHuvZoo42+UMMsvtQh0MqqA=;
        b=pNWHZNsSaXWhviAhXwDpqCj0UfmNzabjlQS/APg+vb0QOIfF2mq8Kxe316baC8A2WC
         gMD4WdBkPYfdg3JI1GjIa505XGMhYJHhm1tNFqH5+BgtjbwAeZzjA6i0GC0cAPpXSds4
         /6leXBCMbXZUokCu6W5dChCT3733amrAxval8mlab2y89tT+vqaISDCWbyYqHsBIhwKf
         DEaWmXlSbNzgPlQbDbK3gQOMc8s0MAY9+x09BEZ827r4Xqp1yRcKu0GDkD2h0Q9xpHPY
         UcTfc6OYOlrl3f2b1JeNzkVq8xd5S3DWnp2rjtrnuQounL1zmuiXA8EFsXf/dPEIGAYD
         2LXg==
X-Gm-Message-State: AOAM531ON8z2F7TmWG/p/u9ByqBbfFHb5XqzmO1LQcjWtTkQpObLSnTZ
	cocduTVOVrhz+2U2htBSyUCjJWB8rm7ztg==
X-Google-Smtp-Source: 
 ABdhPJwL6aO6+iIwAFMwL1JmlZCF2qXJ0I+stYW5tov6aPXvV5UH/XEcHZfRukqeLBdYUq2ZQ1AR8g==
X-Received: by 2002:a17:90a:c3:b0:1ca:54c1:a684 with SMTP id
 v3-20020a17090a00c300b001ca54c1a684mr2759015pjd.148.1650095657977;
        Sat, 16 Apr 2022 00:54:17 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 g14-20020a63200e000000b0039d9816238fsm6387339pgg.81.2022.04.16.00.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 00:54:17 -0700 (PDT)
From: pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [PATCH v2] glibc: ptest: Fix glibc-tests package issue
Date: Sat, 16 Apr 2022 00:54:13 -0700
Message-Id: <20220416075413.158057-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164524

The current default DISTRO_FEATURES does not support ptest.
Hence, the following error is generated during "bitbake glibc-tests".
ERROR: glibc-tests-2.35-r0 do_package: QA Issue: glibc-tests:
Files/directories were installed but not shipped in any package
The issue is not reproduced with "DISTRO = Yocto" as DISTRO_FEATURES
in Yocto supports ptest. However, when we run "glibc-tests" using
Open-embedded master sources; it generates the error as default
DISTRO is used.

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-core/glibc/glibc-tests_2.35.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-tests_2.35.bb b/meta/recipes-core/glibc/glibc-tests_2.35.bb
index 8c7ecf89ba..fc6eee91ec 100644
--- a/meta/recipes-core/glibc/glibc-tests_2.35.bb
+++ b/meta/recipes-core/glibc/glibc-tests_2.35.bb
@@ -29,6 +29,8 @@ RRECOMMENDS:${PN} = ""
 RDEPENDS:${PN} = " glibc sed"
 DEPENDS:append = " sed"
 
+DISTRO_FEATURES:append = " ptest"
+
 # Just build tests for target - do not run them
 do_check:append () {
 	oe_runmake -i check run-built-tests=no
-- 
2.35.1


