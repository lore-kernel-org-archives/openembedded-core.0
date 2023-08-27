Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B06C83F19
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 19:32:39 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.4405.1693164750234353109
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 12:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WDGlsgN8;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9a2185bd83cso321275466b.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 12:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693164748; x=1693769548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/JU2AOFiMtjJt9nxjy8Xjf4md5X6Dyo8Xa9UuZQhDM=;
        b=WDGlsgN8ZHlKblbFZxIj8NXge6JyrtlWcICiyrTqbKnm8ZOm4l5a9zXAowZl4NxFWq
         exEhuKldx295md9DAu1LEP3OLUopABcNaXyCQxGfNsn3dvGNg0EPUbT2WSUca3s7Q/Hz
         phbmK4wgFnCkkdUH+wT2hSu9FkOqGFHSImquXq7QaZtyAwgQA4Fdt3MOSYfhiS2fKgol
         s1kga42aRzjNIMtNxvgGwF0q7lYZz8AOzlu97OJL6PTnhKZdnP+H/SR9WoO32I/2bS74
         2wunVnftDsoSDr286g+iPbWG1ShHW8tm7EIGDVTQAmEWMwC58Igh+bSiMu3MfHH2PH0I
         8cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693164748; x=1693769548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/JU2AOFiMtjJt9nxjy8Xjf4md5X6Dyo8Xa9UuZQhDM=;
        b=BYprzgKsXifpT0q0cUDNAsUeqBQ6QP9nBXiN4nsb0xsJUS0l1wijG3Ai72MxhoOV5n
         tLUtAMM4H3+FZ+04ezfzJSHh9sH57bXN2LaXohdXGZHfiWHpPxeojVirY1D57yg7cXte
         fUbcdLUGRYHrWQd7l9XIIVDXT28bfL5dhwwTWzTLVjSl7KqBGVwNTzB3UgFqBlpJBTZH
         EvEqfpkH4Hn/fz6Cvffs3uoPnODcEGuQu5+n/kbxEoJetmZkvzRJRUV4W6gNHtI5hxsE
         WXEd5mLW1YEe/AkBWf2tS9slixRUs42lHHh7FfhC379qLwgSg5MSDTZ5AScH0C0IDhWs
         WZPA==
X-Gm-Message-State: AOJu0Ywm34/WpuDxBKzbDHC81lkGSsGY3227DFeOJ8mr7aqIlWCioWTy
	uzhPW8DtiMqiDuarGrztG1uaa8deX3c=
X-Google-Smtp-Source: AGHT+IGRWxiObqR3IcLvjZzeNVo30YK+rrPqzVhONKiAN3SrkDNI+wMfnUpQvumkS0M73rZCsXjQAQ==
X-Received: by 2002:a17:906:8466:b0:9a5:846d:d820 with SMTP id hx6-20020a170906846600b009a5846dd820mr4465435ejc.16.1693164748487;
        Sun, 27 Aug 2023 12:32:28 -0700 (PDT)
Received: from t14s-af._sites.dc._msdcs.ad007.siemens.net ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id lv12-20020a170906bc8c00b009a19701e7b5sm3740261ejb.96.2023.08.27.12.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 12:32:28 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v4 07/13] cmake-example: workaround for pseudo breakeage
Date: Sun, 27 Aug 2023 21:29:49 +0200
Message-ID: <20230827193200.4083340-8-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230827193200.4083340-1-adrian.freihofer@siemens.com>
References: <20230827193200.4083340-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 19:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186787

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


