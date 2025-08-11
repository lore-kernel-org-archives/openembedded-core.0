Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65DF2C87FDB
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 12:58:46 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.47051.1754917121436266622
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 05:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PPSwo/Ru;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6182b3218aeso1660932a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 05:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754917120; x=1755521920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=L7l5Sfm8GTAxlza8KsWxZIRQsfA67MX8p1vPXcpbGu8=;
        b=PPSwo/Ruq+5H7zPoEaQmzz21GGuQFq68oh2Gxnt62B5laZr4dEi+3feCQmMnm9Ubrz
         kwypGvNIdNXO1d+w2IjyCHbqRZDlQNlA0gUEH7GtDdmEYfuw/uaN0iqrlNkWJu7cwo6s
         AhMmsYXR6kQ64DbAVrxqu18cIskD+OhI0NYoTqZiyj/knn2RQT5ttZQ/6QjUIXKklZRm
         LZTH6LqX+FBqG3LnyjFZGH3UvvWaKqPqFIX/G4DjL9txyzQN1AljU8d7I1q73TZrGZwW
         18O6m/3CgkBQd+dhSc8K3hj3F4eVUeZMxYHzTSVaX4D2yLckYm5EzDEWKY738KQ7ONFX
         VdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754917120; x=1755521920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L7l5Sfm8GTAxlza8KsWxZIRQsfA67MX8p1vPXcpbGu8=;
        b=uSWhWK6n4W2EibQ4jGVN+2f9DUhFz4sbYioIsUdbkv/JhVNzFl7eoGkWs4ksB/whMD
         58EZJpv5MPfOxer2JKcfhyXqS4+6WVva8AVFnWPy8GIm/6UdFWGDktz24HaDc7gwvAau
         6KYIRWQmyhDIl4AmLLvq8NeYIeV4FeK1um28CSZy7ouSY6P+jdxec5/pL31u71Hnhre1
         jzNYvbi3Bg65C3QKUtpAUyf8O/SwAk17RlWY907OhyvHyhGAoEtKXYYLu4g/IvpDCAfC
         c4wmbtN2tGRzEAhYoQGo9rIieeoMmyJXviadbMOHFYQHodVad0duse0E/ftEEhtut7LG
         favw==
X-Gm-Message-State: AOJu0Yx+LXLcD2o4s2BnRQvMOnCBE1ASZ/MWkqhBqFDubXG92r/jzOal
	1YP5Ub4nvD6ItkQqyWvrkk4anXupD1PfTj5/mbNpKBtEHE+H+tL5C8MQvAuZ3A==
X-Gm-Gg: ASbGncvDSv4O/RqQAbZbPaL8htsMRpqSlnWeVdXmppCuVqydthYL//zdrutzamwK3HS
	cLghsnfXymVnq6RtV2X46ReCc2T9sC5XG1MNeIWSML0F1954agE8u8HHJMnvIQpUzzrUujN4eoK
	QGETpJI/Z3C+gEuew45PCxOm8mSvUIkaXTS1IDcCL7UwRZeX9sasQiqyoX28HYwU2c2n466uZ92
	voEp7fnRV2Q37AwP34+Dui2ZxUd82s2b28ZZWcZgzjNL9tloC3/H5GehfFknAmVFDPFpM79EF8h
	1DB7i3zNr+bLlhZG5gp4C3jc+I/mGXYvRNObLJPJ6BFn1laRk2T09fSffkDe4W3cNRS22ygxJ7H
	h1PHo3nHwfYqUp2alWJI=
X-Google-Smtp-Source: AGHT+IHWtiDA+prd7zN3Iw9KiKRP72Q3p0GX8uI6HF5Zph7ktnXjeBNd+u/E1bR4C08fjCJuGh/+xg==
X-Received: by 2002:a05:6402:2683:b0:618:1bdb:8515 with SMTP id 4fb4d7f45d1cf-6181bdb8cd2mr4968609a12.29.1754917119524;
        Mon, 11 Aug 2025 05:58:39 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe7a32sm18452915a12.37.2025.08.11.05.58.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:58:39 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] go-helloworld: update to latest revision
Date: Mon, 11 Aug 2025 14:58:38 +0200
Message-ID: <20250811125838.952671-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 12:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221738

Shortlog:
- go.mod: update golang.org/x dependencies
- weave: fix %include parsing, add highlighting
- example/slog-handler-guide: run `make`
- example/weave: update TOC anchors to remove **, _, and `
- slog-handler-guide: remove doubled word
- slog-handler-guide: warn against embedding
- slog-handler-guide: fix typo, tweak phrasing

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index f21cfbdf27..e12dcb15f6 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 SRC_URI = "git://go.googlesource.com/example;branch=master;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}"
-SRCREV = "d7b0ac1278591aea848a99258ccfdee8e4d454c1"
+SRCREV = "8b405629c4a5215871be932097e099c05ec5cb2e"
 UPSTREAM_CHECK_COMMITS = "1"
 
 GO_IMPORT = "golang.org/x/example"

