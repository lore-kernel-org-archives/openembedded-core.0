Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B98C54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 18:36:30 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.81276.1673289380152960365
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 10:36:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eigRWOtA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.216.47, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pj1-f47.google.com with SMTP id o7-20020a17090a0a0700b00226c9b82c3aso10637717pjo.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 10:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oJoL0YiybmzBP4cURV4TdMGRkV+Q9rVY23v1BCXJSVI=;
        b=eigRWOtAnJ8UuOOcqwBDB9Ea9kbFuCHxJRzGGt6KmE0AHWrpZVXDhvA2I9Oemn2ORM
         YbvsQinInOZo9Xzp6bhQaHW5PtvQLOiWurd25hVjf8l+rE+loNjO2TN6GHV91dlRE4Ub
         1AA0rxsQZiCnQeVwm/gwu7hjXtFer9Ov0M9QA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJoL0YiybmzBP4cURV4TdMGRkV+Q9rVY23v1BCXJSVI=;
        b=sZCtFenGgjRgB4rvR12UuE5vWr9fkn+DzYp6/kkxBs1iWvbqSqnWpSGuGRobHMAfiR
         zOmRtYPBfAt5cqtDhBZOaC/ncbDtGvLU9++hmyJVwMgpCa8wes5UrZYMNMwtSgdOZxHV
         3SXb5jbiyFqy3NnQZe9KAKrHNitZ2tY4OJasddxUhYA4QQQWuEqRcbkdNJQNGCG9NaI8
         S+hjsdKsC06w5/xWP88Rm60j9LtQ9gzoDJrlKO/wrvGsm+VAawNRoBfdnGzxGg8nUm2Q
         czuXfvh0bivRnlwZFhoDAkeWcY5g5zD9ztWEzQQNGc1aqN6612c6DBWy4VdTvgSAEEgI
         yUew==
X-Gm-Message-State: AFqh2kqnoh/tkVh8p65fN0+r7KTX7U+0GYyPqegLDIG8gJfzStrK7Gxt
	DBnh0J0TwCO3fenTwx/n7or9jmRsPYPu3tjw
X-Google-Smtp-Source: AMrXdXv67RUj68unTibGYfrwaRbv8/2M8MuoRVbhK4RMHykcOLJxn5tgDxPZ8eqRIBnUv3bc4pFOgQ==
X-Received: by 2002:a05:6a21:398b:b0:a7:9f6:b7b3 with SMTP id ad11-20020a056a21398b00b000a709f6b7b3mr72006662pzc.4.1673289378653;
        Mon, 09 Jan 2023 10:36:18 -0800 (PST)
Received: from mhalstead-laptop.taild15c8.ts.net (97-115-65-153.ptld.qwest.net. [97.115.65.153])
        by smtp.gmail.com with ESMTPSA id b17-20020a170903229100b00177faf558b5sm6359293plh.250.2023.01.09.10.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 10:36:17 -0800 (PST)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [OE-core][PATCH] uninative: Upgrade to 3.8 to include libgcc
Date: Mon,  9 Jan 2023 10:36:10 -0800
Message-Id: <20230109183610.47144-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 18:36:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175695

Including libgcc solves issues with libpthread.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 7012db441b..eaed6f81f8 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.36"
-UNINATIVE_VERSION = "3.7"
+UNINATIVE_VERSION = "3.8"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "6a29bcae4b5b716d2d520e18800b33943b65f8a835eac1ff8793fc5ee65b4be6"
-UNINATIVE_CHECKSUM[i686] ?= "3f6d52e64996570c716108d49f8108baccf499a283bbefae438c7266b7a93305"
-UNINATIVE_CHECKSUM[x86_64] ?= "b110bf2e10fe420f5ca2f3ec55f048ee5f0a54c7e34856a3594e51eb2aea0570"
+UNINATIVE_CHECKSUM[aarch64] ?= "6b81da51cc0113056564dd87079f860214d1149ce28ce4d1a6f070c64296e298"
+UNINATIVE_CHECKSUM[i686] ?= "62260d4e923a27f19a5abe24076e97331145e3736e15e090569232b72a36642d"
+UNINATIVE_CHECKSUM[x86_64] ?= "e71e745a3f402a57318af3708c986d81741940b6b949ba7d4ddca835d4fd9cbf"
-- 
2.39.0


