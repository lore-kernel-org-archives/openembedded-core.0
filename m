Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195D9CAC59A
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 09:02:16 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.28090.1757926933986596047
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 02:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RNhYTKET;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b046fc9f359so595767366b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 02:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757926932; x=1758531732; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bIzZJxK7N66D8mfbTIlHaPvKlI3GjhMAXH1YxxfKyw=;
        b=RNhYTKETbF2Jcq5mvIZl/BXG7j2C9k8/X2gWt1T6Zr5RKDpliMr1soY8DpDLZK3otq
         fLg9PF2kWo/r3CO4uXz8si+SyO9TsQk0P3Qs2CnIky3W/LBHNCKjsjNOVds5OgA12Io2
         EdKw8pTNZXWvGZ3XTksKoRzEAQyJhobVrCipowFnAdnrrWl4T7vZz/c3JHt2dN6cTyy9
         w7KVeJrXs+of/nlSegDB53qSbMs+66BSJvhnJ6w8M9OOYRry9h22aV5VomiYadx/9swV
         6bwneg21qhgh5luqaEhJab2SLmneRSzFlAc0pQaBCU6dPFSGI6JTLnv/PlLBvMwKm/lg
         5oSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757926932; x=1758531732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bIzZJxK7N66D8mfbTIlHaPvKlI3GjhMAXH1YxxfKyw=;
        b=NPQNIh/vAan7C/ZK9ovzW5JgH9HbjgaXm72lRHp9W+QCRq4IHajUxA8fcdlMcqnNJm
         qh0QKMqCwL9Yecg70a9PYz0jJ3sd4MEmrd7YkewYYGHQJzwXkJmDctXPkdElqKy2XJbN
         10KWY4ftutWmSHxOIJvJa7903n6JpYThiswYcJrY+FwnFz/hH7HksefDqDbqtHi8RByW
         RlvFmCtpQ5dFDN6ETsPEXU7AKzg4Vv8y3i8hzZi/wLXZbeq+K9DUKP757Z7TRx685hJ3
         i9PUhgnd8MWtWtEJr3rrFoAwb+FN+XhzhLzENB/8RZBMmqo+dTGgH6nzo9uEaDpcZz9V
         U9Zw==
X-Gm-Message-State: AOJu0YzpROWSsKNqmjsd4ku103cFbVogHAX362eLfywujev7U5EX898F
	NTgHaHq5vq48nqHdMKFYaawRR5RDLXawGkEuRxTD15b7cHHhvsqZBmwdzuXIow==
X-Gm-Gg: ASbGncuq4HN98rl2Moub05WC4OBXftrh5d6oauP5KqkPV1Otegve8720exIqOuUfyl+
	FtMIoFsR3/aaroWrbTEo2qF3TjmvUjqHUfWb9D8R8xgSHelPYtThDFnwRMoz0CYc3H26acjUWt4
	eqTRL45bKRBKoOKMXPlkpkYZeOu6hf0rmKmb10bx5i5WXz9mzgP0uFaaq3qdnlljEOw0Td4/p8X
	6avvtQoTbMl25s9FhI71Dy+tvt/lU7lsN2xxSZ1dP4Me1zyZzZDgW+nznfqvGLgDkVWKh19tcv1
	t2UvXCVoM3CEjgbA20BLSgLPx5IXGZeEVY+bXklyb5clCbJAx8o1ZHFyfuNJOUIy4eXFNSY474l
	IEVpl9iJfV4GqjsfrdNwT
X-Google-Smtp-Source: AGHT+IFBAqykcjpO73bQM8tk9oZ7ui0y0xLDOINQRx13H3qCx22pCOu+IjgU0Fsb91G/88fy4GhraQ==
X-Received: by 2002:a17:907:9710:b0:b0c:6cae:51f5 with SMTP id a640c23a62f3a-b0c6cae68b5mr658323666b.43.1757926932268;
        Mon, 15 Sep 2025 02:02:12 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32f22b1sm914691566b.86.2025.09.15.02.02.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 02:02:11 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] patchtest: update testdata for selftest
Date: Mon, 15 Sep 2025 11:02:08 +0200
Message-ID: <20250915090208.2007216-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915090208.2007216-1-skandigraun@gmail.com>
References: <20250915090208.2007216-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 09:02:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223394

The test-patch for test_src_uri_left_files selftest got out of date.
This patch updates it to make it apply on the repo again.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../files/TestMetadata.test_src_uri_left_files.fail      | 9 +++------
 .../files/TestMetadata.test_src_uri_left_files.pass      | 7 ++-----
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/meta/lib/patchtest/selftest/files/TestMetadata.test_src_uri_left_files.fail b/meta/lib/patchtest/selftest/files/TestMetadata.test_src_uri_left_files.fail
index 0a402d0a3e..13e1a75a66 100644
--- a/meta/lib/patchtest/selftest/files/TestMetadata.test_src_uri_left_files.fail
+++ b/meta/lib/patchtest/selftest/files/TestMetadata.test_src_uri_left_files.fail
@@ -11,7 +11,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
-index 2dc352d479e..e95270adaeb 100644
+index 0ffe7308ba..bd8f4245a2 100644
 --- a/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 +++ b/meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 @@ -3,8 +3,6 @@ SECTION = "examples"
@@ -20,9 +20,6 @@ index 2dc352d479e..e95270adaeb 100644
  
 -SRC_URI = "file://helloworld.c"
 -
- S = "${WORKDIR}/sources"
- UNPACKDIR = "${S}"
+ S = "${UNPACKDIR}"
  
--- 
-2.45.1
-
+ do_compile() {
diff --git a/meta/lib/patchtest/selftest/files/TestMetadata.test_src_uri_left_files.pass b/meta/lib/patchtest/selftest/files/TestMetadata.test_src_uri_left_files.pass
index a675c028d0..c06580f054 100644
--- a/meta/lib/patchtest/selftest/files/TestMetadata.test_src_uri_left_files.pass
+++ b/meta/lib/patchtest/selftest/files/TestMetadata.test_src_uri_left_files.pass
@@ -36,9 +36,6 @@ index 2dc352d479e..e95270adaeb 100644
  
 -SRC_URI = "file://helloworld.c"
 -
- S = "${WORKDIR}/sources"
- UNPACKDIR = "${S}"
+ S = "${UNPACKDIR}"
  
--- 
-2.45.1
-
+ do_compile() {

