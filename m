Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795D9C54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 22:22:29 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.60123.1674685344811235677
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 14:22:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YU+pfTHX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id j17so47186wms.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 14:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fit3U5gT5Ysp5LMqPKrqZ/I7rk8jetXrznWbgUceb3k=;
        b=YU+pfTHXU0BFKDnYuU2J86eSbXmrItnYFW+m3XJZr53p3JS2uYhG4IeDu+STPcQPov
         qpXpCXFRkwGflvLUGxsJzB0ea5QCapPxKSIv17XXnTKtxiX5Iyt5prCyGHPEC7Z7pW6I
         2pQwI7U/RFwkWJs4A3Nqsjp/zpcjwbsSLNvfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fit3U5gT5Ysp5LMqPKrqZ/I7rk8jetXrznWbgUceb3k=;
        b=YjQyDKPAjJkTmK0C05Gk9HAffOeI5lV8HIadj08E5QZC4E/2SjqBCRT+pVpGnfJRsl
         VzrUDsKN/YhsK2FnFbDTJdKSzk303C3jnmBqteGGvgmNFCpJ5XI0Y43phnVRqCwdzSv7
         03FxkMWuAbvT2Er0RpctVckSj71oEgEHMWXvI//KyoF8MZy4WYnUQxpiFNDy7OczZfT8
         vk/MiVvOOsmFGd0Xq5tsTeC5msPkCzsI4YeHDL9qYEboOWq2ECATRJRUrhbEQyQRROrS
         ujEQlLz3NJqULWubTiHFrESXM05r37mLLPtV/XlpJkkM5Sg2uX53VjrUW9UI2ckMzEGK
         jkgA==
X-Gm-Message-State: AFqh2kqNvvh7hH0CXtth4BGHhi2t6QS2pHiTtCKdgfmG4AQzw9DQD/+q
	0xJ7NOazvYeAd+hf2AIQf0ygI0ODt2Sh2CFR
X-Google-Smtp-Source: AMrXdXuRtF094y0O3OJD6r0x82F6jNklyOKC/FIx/oUmOkHY65X1Qnvh5uztinletXS7Pg+cRPwnwQ==
X-Received: by 2002:a05:600c:354e:b0:3db:331b:bd57 with SMTP id i14-20020a05600c354e00b003db331bbd57mr21419700wmq.23.1674685342670;
        Wed, 25 Jan 2023 14:22:22 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f2d7:e330:f537:35d8])
        by smtp.gmail.com with ESMTPSA id n13-20020a05600c500d00b003db2b81660esm3154986wmr.21.2023.01.25.14.22.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 14:22:22 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] bitbake.conf: Add METADATA_REVSISION to BB_HASH_CODEPARSER_VALS
Date: Wed, 25 Jan 2023 22:22:19 +0000
Message-Id: <20230125222221.2462169-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 22:22:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176378

This stops the codeparser cache changing ever time a new commit is
added to the main repository.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index c154f271cf8..5aadf6e7078 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -959,7 +959,7 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
     sstate-lockfile-shared prefuncs postfuncs export_func deptask rdeptask \
     recrdeptask nodeprrecs stamp-extra-info sstate-outputdirs filename lineno \
     progress mcdepends number_threads"
-BB_HASH_CODEPARSER_VALS = "LOGFIFO=/ T=/ WORKDIR=/ DATE=1234 TIME=1234 PV=0.0-1 PN=nopn"
+BB_HASH_CODEPARSER_VALS = "LOGFIFO=/ T=/ WORKDIR=/ DATE=1234 TIME=1234 PV=0.0-1 PN=nopn METADATA_REVISION=1234"
 
 MLPREFIX ??= ""
 MULTILIB_VARIANTS ??= ""
-- 
2.37.2


