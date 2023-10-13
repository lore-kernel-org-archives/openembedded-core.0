Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD78CDB482
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:54:03 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.51170.1697234039943331824
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iqrYetxK;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6b77ab73c6fso394638b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697234039; x=1697838839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGK2KdGGDdCdX0agAckOccL+TLk6eZUitZsUR2iHdtk=;
        b=iqrYetxKZXQ6WxMSyT7z1Fb1GSj/8Z2hcfaA30JXt/pmIB045zshDFb5lOGARlP832
         9t38L1sPF4jOfhLy3x2SxNVac16BsR5VmKEwSBwhKwIk6+7bOI1QkCU9IHu2kphLb68L
         1GMx/+7+aGbhi4XN4ifyccTuAIdP1b0P2wuP4MH1ez/wKFQFRBt+nhWdorAaPw+zfG2k
         e/xvNxjY+2DGv9WLGKQWtFfA5YsBWpwnxBojbtE7fQ06kOrJx1TaJD3LIfdyncXta8NC
         E51KEAfSgQcTKk6mqHynV72KoqiKNMKduKTsOmmKcBvAOS2agcD264a1S/GmlIrQ/Obk
         sm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697234039; x=1697838839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGK2KdGGDdCdX0agAckOccL+TLk6eZUitZsUR2iHdtk=;
        b=Rt0QuLr46wFyIZUrrBhotTHzXeysRmQgYIF6xTvDpXvmYcj7QRri7aNpZQu9JtSDOK
         +B/Ed/PWy41Tp8fB4z6SeSASeTolOW4vbIhNNAi0aU5Nr7129N8vYFEy+oo3N420no4l
         VbyKRmRQfblJGtNwzEsTnncNjzEh7n0sjn6DoEq1CLejAsxxNC1PcW9bdle/jxVWOb+A
         B07NWDx4CbZUaocHqAJe6KRO5jgzHDGorBawNq5AJXX5NwRiK9Y8bqcrLkvTcxp1ODSR
         dpi3TOwPlbvHHjR05mvJcJKm4TOpHyLSedq8BWwy/zyk3v6eWWTvLZGpjmdMwKphGgdN
         L2hg==
X-Gm-Message-State: AOJu0Yx3iRog+DkxsdMY9Yy+VXfyxHt8icYKmh3PVY2y6TCZlSJPjq/D
	Tt7XXz2x+MTIwl8DfS3Di9VXhsSTjZ9CXLKwJwc=
X-Google-Smtp-Source: AGHT+IEIq9nEQus2avyTzjeZw2IMlZn0ttQJlZ3Nf1ZPwsjOVi4kTiwDR2C28VQZYgmd0VMt9R1X0w==
X-Received: by 2002:aa7:9533:0:b0:68c:44ed:fb6 with SMTP id c19-20020aa79533000000b0068c44ed0fb6mr1621040pfp.16.1697234039094;
        Fri, 13 Oct 2023 14:53:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.53.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:53:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 23/27] openssl: parallelize tests
Date: Fri, 13 Oct 2023 11:52:47 -1000
Message-Id: <3cd99ff32da3bb85d7ee278fec69504a12c1f715.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189100

From: Alexander Kanavin <alex.kanavin@gmail.com>

This brings them from 15 minutes to just over 4.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9eeee78aa94aaa441da012aeb904a0f1cbcd4d91)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssl/openssl/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl/run-ptest b/meta/recipes-connectivity/openssl/openssl/run-ptest
index 8dff79101f..10c9b49e4a 100644
--- a/meta/recipes-connectivity/openssl/openssl/run-ptest
+++ b/meta/recipes-connectivity/openssl/openssl/run-ptest
@@ -9,4 +9,4 @@ export TOP=.
 # OPENSSL_ENGINES is relative from the test binaries
 export OPENSSL_ENGINES=../engines
 
-perl ./test/run_tests.pl $* | sed -u -r -e '/(.*) \.*.ok/ s/^/PASS: /g' -r -e '/Dubious(.*)/ s/^/FAIL: /g' -e '/(.*) \.*.skipped: (.*)/ s/^/SKIP: /g'
+HARNESS_JOBS=4 perl ./test/run_tests.pl $* | sed -u -r -e '/(.*) \.*.ok/ s/^/PASS: /g' -r -e '/Dubious(.*)/ s/^/FAIL: /g' -e '/(.*) \.*.skipped: (.*)/ s/^/SKIP: /g'
-- 
2.34.1


