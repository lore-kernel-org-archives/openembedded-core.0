Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4320C05023
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 20:35:55 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.24869.1713386147569051041
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 13:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=I3fS+B/p;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5cf2d73a183so900872a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 13:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713386147; x=1713990947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CbfjK6Er6vHetDwiT1qr8xKuNOYaN1RCofL5rPWSPkY=;
        b=I3fS+B/pHTh1MLxzKPQ8mENcvM6PrphWhH8OYLQ3VNV+tpdD8yVeaaPAdVpnt7c2o8
         COSQVrlubsvlr93z8rVDykGd3HKFOeF0LQQq1DHJGpZ9uwer+2CniF0i+8MLx38q5r40
         OCQQZm8Q6LE4psG/ZBlpAY6UCTqBtJXonzPvzXYqcUaz1Hp3q37r/X7vb+j67yWAemjZ
         f3U6Eb7UMP7yYDyX+USQEsFMZTcrQmUrtijRteUnluoKzfncGIDaJqL3JzXyvpvcTj2D
         zRD61c6KTKQdyAnUWsMcGb3LtW8UjWqSG94WV0ADddAVhdVYOkqXydBpJC9SCSNQ1grE
         jqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713386147; x=1713990947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbfjK6Er6vHetDwiT1qr8xKuNOYaN1RCofL5rPWSPkY=;
        b=enRDaQBLUCgjWk8x1nvGqkBmxHzdVNG6apxtZgiQDG1zik3JEalLZYp+ipLAQPL69O
         /ACCH4/pEWJlhIpEv3zyYshEzF8qkY7wIu5FUemRaFszA96WSggGEzRQRG4N6/8itjtJ
         Fe/QjlhGHVHh1j3A+dH39oHYMt25qIKE1a2xME8MAHBS0oflvsuDIcZRSWvtUxzWCERN
         sNt55V1jSibBM9pgSQvnzaCcoj+WdE8Gq3BhgG34+1noHZqotMXApbB1j061YY2Jdsx5
         jTfGrMnaTKf8fk/Cnt1KP6WMyeX158ojB7l1beBqFzgIFmjHQwD2hOQt/w01Vc5A65FL
         N+/A==
X-Gm-Message-State: AOJu0YzIP0rcAAzg7LWW2ANdaBAOEpH0ysV7Sj5K8K5BUbIBC6BnQ01Q
	ajAiICgGzvwYanrZ99f+4enhesFqicYU+EzlajKLU9WzgRAyN4TWOL5ZdgiHDYIlC6OhQmGczM8
	Uvj8=
X-Google-Smtp-Source: AGHT+IEo9qe/8vNt44Kkkww69DlIB4TSzPxNOwGpHGAGHLKns+obP17jMDOB+eRPZo9Klh3P58OLwQ==
X-Received: by 2002:a17:90a:7e81:b0:2ab:8e59:9da9 with SMTP id j1-20020a17090a7e8100b002ab8e599da9mr308611pjl.6.1713386146749;
        Wed, 17 Apr 2024 13:35:46 -0700 (PDT)
Received: from xps13.. ([199.58.97.236])
        by smtp.gmail.com with ESMTPSA id s22-20020a17090aa11600b002ab664e5e17sm76876pjp.1.2024.04.17.13.35.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:35:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/7] valgrind: skip intermittently failing ptest
Date: Wed, 17 Apr 2024 13:35:29 -0700
Message-Id: <19e7d5e717e6d28e0b64bd382f07b8e709526474.1713385733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713385733.git.steve@sakoman.com>
References: <cover.1713385733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 20:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198482

Intermittent failures on autobuilder:

AssertionError: Failed ptests:
{'valgrind': ['memcheck/tests/linux/timerfd-syscall']}

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/valgrind/valgrind/remove-for-all | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
index cb8d10b18f..226f97b50e 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-all
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
@@ -1,8 +1,10 @@
 none/tests/amd64/fb_test_amd64
 gdbserver_tests/hginfo
+memcheck/tests/linux/timerfd-syscall
 memcheck/tests/supp_unknown
 helgrind/tests/tls_threads
 drd/tests/bar_bad_xml
 drd/tests/pth_barrier_thr_cr
 drd/tests/thread_name_xml
 massif/tests/deep-D
+
-- 
2.34.1


