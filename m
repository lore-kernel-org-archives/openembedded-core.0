Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3405FC433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 16:56:51 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.9814.1637168210738696865
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 08:56:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LVujRZjH;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 nh10-20020a17090b364a00b001a69adad5ebso3121475pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 08:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iQKY3xGkC5I7L97fkLi6cR1QoAKE5TnU7GA34wChipU=;
        b=LVujRZjHeECFSvrEEJW/inpNMmWQMy0NZNGh9g47jvJgsDW6Fe2TxAhz3C6gdptFkg
         SoOICfVWRHHt23ylZOUP3O0XUmpzc3O/gNzhlmdkP0zU4J9dF+2zaSCoph1Zz2LnLSOa
         tVqpq8ajKxorBHjwGM1NLjaCn2MayJMW9Z8l8iZZHa6oXn8pqF4RnTqGFYIKxijc08tM
         Y/q5HaUFhtETWMjQvYCBgWGOVNyyekff2lDa7t6Ur4wZHpbq9oxbpP9vudev5CHQHkO4
         BfpEn1i1prWFlKGTmtjFayXCjRVDG65R2AtZTzQWxYaCyHuYvT0bWFzgLeB+8oQs4a9L
         ajZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iQKY3xGkC5I7L97fkLi6cR1QoAKE5TnU7GA34wChipU=;
        b=B++GdoZLR6u6SurXg2TfJYfAFGcZQcVwyOaiYqcSs+A8IlCyKqp0zRgbltgCINmXUL
         kfx9ST+meht2gmgr6nsZGtMREXG7e1fgEPnycwLWpDOZg8wykV7Td8ETVF6fSbhcnpx9
         m48vAgVipZ9WtSINnMy7bt4dIJbsZ76fsdzfSPK3hZx5Eb6hcdqpiC+evw2wAHK7HD/J
         tdeWsOyEesyxH8JB2Dbwl4iaTlzRWU2rvDQySyanAbDdGyntddHM9YMHYBxYG9ApNBoT
         9XtMH0OJObUCCLKZB8I75s4Pq3Jgkko2IyXw1KEGpJm2eOICNe94tMl5RmYNb8sgDFn1
         PHLw==
X-Gm-Message-State: AOAM530/fGX8BEnWSsLHpuHwdgAxBY0+yqOZGfap9c04j7kbEfNVZq1s
	lZMrIaBGU+X43jEvl5iXusro/RapX1pq1g==
X-Google-Smtp-Source: 
 ABdhPJxuCcxusnDpmMBVvhUAn23MN1K1UkAoxh4KQkJBzv2fQvUMpNSNL78rw2gg6MQVcr6iR7ajOg==
X-Received: by 2002:a17:90b:3889:: with SMTP id
 mu9mr1347500pjb.160.1637168210160;
        Wed, 17 Nov 2021 08:56:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id b4sm226420pfl.60.2021.11.17.08.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 08:56:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] glibc: Append files instead of making then part of main
 SRC_URI
Date: Wed, 17 Nov 2021 08:56:46 -0800
Message-Id: <20211117165646.70015-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211117165646.70015-1-raj.khem@gmail.com>
References: <20211117165646.70015-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 16:56:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158435

This will help later with using devupstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.34.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
index 72064772789..778898f1979 100644
--- a/meta/recipes-core/glibc/glibc_2.34.bb
+++ b/meta/recipes-core/glibc/glibc_2.34.bb
@@ -29,10 +29,6 @@ NATIVESDKFIXES:class-nativesdk = "\
 "
 
 SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
-           file://etc/ld.so.conf \
-           file://generate-supported.mk \
-           file://makedbs.sh \
-           \
            ${NATIVESDKFIXES} \
            file://0009-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch \
            file://0010-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch \
@@ -60,6 +56,12 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0001-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://CVE-2021-43396.patch \
            "
+# Use append instead of += that way patch is applied with devupstream too
+SRC_URI:append = "\
+           file://etc/ld.so.conf \
+           file://generate-supported.mk \
+           file://makedbs.sh \
+"
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
-- 
2.34.0


