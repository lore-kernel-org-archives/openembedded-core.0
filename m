Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCDAFEEB590
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 16:19:29 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.39054.1694362764685517392
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Sep 2023 09:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Y13rl4Ik;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-31dca134c83so3629164f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 09:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694362763; x=1694967563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/JU2AOFiMtjJt9nxjy8Xjf4md5X6Dyo8Xa9UuZQhDM=;
        b=Y13rl4Ikgaj1RRl4JzQSgfRrAow38fn52O7QAQM9MSCHVtLrVF+HyYhn/Ci5zyL8Kl
         /jX6BOAnwJgchkXA8tPgmw9K3grAen7kwfpZ2kJk2gtEOXO21c8sjZSVpzpItQcT6fF1
         8mapWzFG58DWKqXCrnX3MkOiA1GjBEMCsEhPRcWn8qR0ZzHLdozTC0dGjVDNG5kXEu5V
         Zfdntc3qYC0brnA65fT+/C2OUpxBbEhwT+fNFVqcO+cVGq2OEdaC7lTPALGHy5ldtUAt
         7jf/SpbF/8L4Mz8jsG3uX1Las5HZpbPu/CZWwM3klNPUp0Q5aS3P43r826Bv56FF1QE1
         KJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694362763; x=1694967563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/JU2AOFiMtjJt9nxjy8Xjf4md5X6Dyo8Xa9UuZQhDM=;
        b=WVplonVc77ny6UK6MgyAV8XLAwK9G5dUEAvKxHqCgj645c9wpSLQgy4av32Ppi69Wh
         EbssqgibSq7B2Eyua0EKZpbRECBpbNTgdQeCldrsbH6Xm7YNsUrxAbAXJHO1iM4BnfVv
         tIFNKCoY5HOsID5M+OB+ayBxlfBj00Hut4ot9cOlbtCHs/C3r2Fi3yPir6I5meOtqnG2
         JSX5Wcu9bi1BbvqNqgPumbYHjxCZ1P5oO6vvrOQQ4BYLHZksbOU7+BngcMHrdk3EtL4E
         Zdwq5fNLJct221MxS6dy+K9uZOeHzPX0syqaWj8MtUtwfcTNHSHgub9HCvh2fdQaodu+
         mrfA==
X-Gm-Message-State: AOJu0Yz7HDp86khOPYc0yhUsMpsP417juBSu37aDkkzFgBrCS/lpLV3K
	oxzeb3gmA0hxchZEVP+lxBr8Rttbzfw=
X-Google-Smtp-Source: AGHT+IEbfD15/Q0SSWJLfhRgl/dwePK9BisAW6LgGgTIC5NUKjIn5exHOdfJgQA5zhe4VJJkAiNh3g==
X-Received: by 2002:a5d:65c5:0:b0:314:3bd7:6a0c with SMTP id e5-20020a5d65c5000000b003143bd76a0cmr5187736wrw.33.1694362762907;
        Sun, 10 Sep 2023 09:19:22 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:dcf2:2f65:9442:83f])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d408c000000b003142ea7a661sm7605431wrp.21.2023.09.10.09.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 09:19:22 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH v6 05/12] cpp-example: workaround for pseudo breakeage
Date: Sun, 10 Sep 2023 17:52:31 +0200
Message-ID: <20230910161850.4032227-6-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230910161850.4032227-1-adrian.freihofer@siemens.com>
References: <20230910161850.4032227-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Sep 2023 16:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187463

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta-selftest/recipes-test/cpp/cmake-example.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-selftest/recipes-test/cpp/cmake-example.bb b/meta-selftest/recipes-test/cpp/cmake-example.bb
index 96d543180b4..fbf1f266721 100644
--- a/meta-selftest/recipes-test/cpp/cmake-example.bb
+++ b/meta-selftest/recipes-test/cpp/cmake-example.bb
@@ -15,3 +15,9 @@ SRC_URI += "\
 "
 
 FILES:${PN}-ptest += "${bindir}/test-cmake-example"
+
+# This is a workaround for packages with sources in-tree
+# Without this bitbake ... does not work after running the install script.
+# newenv['PSEUDO_IGNORE_PATHS'] = newenv['PSEUDO_IGNORE_PATHS'] + ""
+# path mismatch [3 links]: ino 37529096 db '/home/adrian/projects/oss/meta-yocto-upstream/projects/poky-oe-glibc-sd/tmp/work/cortexa57-poky-linux/cmake-example/1.0-r0/package/usr/src/debug/cmake-example/1.0-r0/oe-local-files/cmake-example-lib.cpp' req '/home/adrian/projects/oss/meta-yocto-upstream/projects/poky-oe-glibc-sd/workspace/sources/cmake-example/oe-local-files/cmake-example-lib.cpp'.
+PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
-- 
2.41.0


