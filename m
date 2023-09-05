Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18DA7CA0FFE
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 16:59:44 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.27273.1693933177951740715
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 09:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=EKolGiDz;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40078c4855fso27189035e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 09:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693933176; x=1694537976; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/JU2AOFiMtjJt9nxjy8Xjf4md5X6Dyo8Xa9UuZQhDM=;
        b=EKolGiDzhzcExF6aXSpNUyzy9sBBbdScUhJPt0Z63xYVYtiIYbGCq8E9kwobXFU5Jh
         4UjlZQuPYKRxwJOa1wB/pTuHjXcxBkPUdgikv8wwvpt0iRS462ZPELLqbZzx5OUezDqq
         xxNi+EYgSvPtCemDkFAymtME4aqnWZAwGjJ0zL94tTIXUd/HliPgEjZh+2kN4T1ypahB
         H9BxYENGJJFNVIQ5gELPyViqFwHrqrGAB9IOceQY3TeDUFBm5wH3fQURwmN1cSO0XY97
         3wk2TgSBJCv5W65wwnXxYQtjIWEO/tbsV7WA09/sdruK226yQfIpUnjidXJ/WbvXF+2z
         kWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693933176; x=1694537976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/JU2AOFiMtjJt9nxjy8Xjf4md5X6Dyo8Xa9UuZQhDM=;
        b=Y4NU9Tg/EXcEi5vjv+dTAV8VIB4GkMJ3jcA56BiH6C33HKzuSsfX7dSH6B/UeYaCXP
         xxrMV4BypbImDlNJmyBEiXO82uJfepxt3lDjAd2c3HGLDwLe/j0Biq3QHDoxviRjULJ7
         rQ7Mm557SAx3PQf8Ow3jB5XWdMp/jR5+82tBvfnlDRASxGuzJ3WAw2mRXzpRRxs8Nsmt
         sqEpVBPgS6MbATG+4E28EZKEgy1MEikvrjZS/mpL427FprVD5qKYgbzY3XH5/OsW6F5M
         733fygzAA7ZTX6LDSJMLm/Tb4Ck6ufdNYr1/sjh7rijrG/jDCd1ax2yod/kt++J6ECFk
         mfKw==
X-Gm-Message-State: AOJu0YzyhtFfmMQqwwmHkXCj1TAXS9oQA3qE1pn/BOMurlLSMibh4NUv
	EqFwHpV7OJ4hxsR15VOU67HB1g5OmMw=
X-Google-Smtp-Source: AGHT+IGqwHNvNArwaym7AkZljj6EAGcgPUm9wAZxHwVN3kMNv266RsJUwBGALhQDf0Ds9/pWo+ywrw==
X-Received: by 2002:a05:600c:ac1:b0:401:b3a5:ec03 with SMTP id c1-20020a05600c0ac100b00401b3a5ec03mr288859wmr.1.1693933176096;
        Tue, 05 Sep 2023 09:59:36 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id c7-20020a5d4147000000b0031de43fe9bfsm18146269wrq.0.2023.09.05.09.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 09:59:35 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [OE-core][PATCH v5 07/14] cmake-example: workaround for pseudo breakeage
Date: Tue,  5 Sep 2023 18:51:16 +0200
Message-ID: <20230905165913.2560907-8-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230905165913.2560907-1-adrian.freihofer@siemens.com>
References: <20230905165913.2560907-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 16:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187239

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


