Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1940EC433FE
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 09:46:28 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web12.46082.1638092787426225419
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 01:46:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jYMGhWJg;
 spf=pass (domain: gmail.com, ip: 209.85.208.180,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id e11so28307375ljo.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 01:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uHWfou6npMdkQoPjFX3+I2USYqpQtXFF5J3ezOH8c2U=;
        b=jYMGhWJg2Wj8FNFOsMTJ2dkJWQniXzjn3t4NTPpdky1uhthtskBdGb2KC8vx7zRaWE
         QNB4jNJbXvnoXu3yNtVRkXhM4j29lAbe4GcBVexRO98cY4ixOHS21gTUHhqc0qLhE0J4
         ii4oVebbvknW8U2dUMjaam9qtp+osoDkofE+oLX5b1uVQhAVIWxvILMRTnZULxjlFOxp
         srcnO32yPQTmGOxs3g2RvY1k3AUk1HZS6RcY4DR3pkYGiuf0R9mfKpB32bcLkI2Gz/2E
         99kt9gTO9HCmXpk3qxMro+UIMyNS1F+8qSWikj1/7s07904vdzY2hFIYclw6KA3YyEU0
         WnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uHWfou6npMdkQoPjFX3+I2USYqpQtXFF5J3ezOH8c2U=;
        b=MZ+HLSKJ73IAUbYMRKHVD/5dwfO8mZw0VpYGDjtYs/lCFdzFf/LTnjOI6PimeF9NH/
         kVHybUpxeuqG6TP/OAWKHIiKfdldUqzkU97h8AjJdKGAhH6LXSUyobcr33srF/qhTWoM
         6yqSC2iwiYjlYfuUpqNY6XIq57rlmfHOW97Nb9dAD0MzOR8I1SLUV7Ee9jUxXySR+ug/
         fKvpTxWzhRnhLgSSKkp5rqfgVb2Y06z6gAz9vMFCPhdwnu3SpEV0/rd1GOqbAEWo/1UO
         HQ58LKpFznWBct/ZlbUDs2UD9tR6224sVwrJ6YXt5vWuGXsBPJ/Rim4fwuD0dxkd76ZS
         rWLQ==
X-Gm-Message-State: AOAM530PIEUxahjHcTeWPvAOkcU/aybi2styZbsMdnQkpp5ShW97Wwid
	9EzMYFj0GSfiCjWIveof4ZXIrS2eBgL2jw==
X-Google-Smtp-Source: 
 ABdhPJwj+8ANocCKlpLqCPGK9HHVU0H6XxelmA4/4UvgyaqVGuuCPh2awoR6RTylIowWxLm+HkTPhg==
X-Received: by 2002:a2e:8892:: with SMTP id
 k18mr42224383lji.288.1638092785828;
        Sun, 28 Nov 2021 01:46:25 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 k15sm1031749ljg.123.2021.11.28.01.46.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 01:46:25 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 9/9] bitbake.conf: Avoid rpath hack for Java recipes
Date: Sun, 28 Nov 2021 10:45:32 +0100
Message-Id: <20211128094532.1145820-10-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211128094532.1145820-1-jacob.kroon@gmail.com>
References: <20211128094532.1145820-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 09:46:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158876

These shouldn't go in here, they are just here to hightlight that the padding
trick will not work in all recipes.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/conf/bitbake.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9621023354..1cbe4648f8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -592,6 +592,8 @@ export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
                         ${RPATH_PADDING_FLAG} \
                         -Wl,-O1 \
                         -Wl,--build-id=none"
+RPATH_PADDING_FLAG:pn-icedtea7-native = ""
+RPATH_PADDING_FLAG:pn-openjdk-8-native = ""
 
 BUILDSDK_LDFLAGS = "-Wl,-O1"
 

