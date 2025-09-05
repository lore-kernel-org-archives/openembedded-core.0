Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB9ECA1010
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 15:44:58 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.1027.1757087090883513231
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 08:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CUDAn3B6;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-619487c8865so6168989a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 08:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757087089; x=1757691889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SPylGS5gJQF+kbkMywalqU3Cj2Kg5MR8zgVYDX1oatM=;
        b=CUDAn3B6TvPFWjRLLtLwCm+xGEctSJ/hnAmEPICQHbKXw6pPdwziUsng7pbx2UAmXf
         UjhKArRuSCP0hY2T6uEmEkWXeEa0XOF4CrbHd2sV2hIUZCPvljqGWfwFcujunNQjdYrA
         NCWgO2qG3tJ17BVaa2pSiphDUwH/WcuLxeAvPZdq2ZgfeO9CQo8qkG+BnGM/IStJ3h1h
         OvFZcFbYxWTesqa6v2vhn8Z4xGQOllyplZv1+mvoSfnoNsgV80rTE+8df9PD8XEb4hRa
         F792wMu9WF8dbzPBYsAuULV20e5PCsquep9DpJ4KO7+M1GMOleuxKLdDW+n0X4VHJEeN
         78cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757087089; x=1757691889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SPylGS5gJQF+kbkMywalqU3Cj2Kg5MR8zgVYDX1oatM=;
        b=je9iZkqsYyDC9UJBsVWgmK5Ztecj151be8+gbz3vIVdjLIax45G9KQOKH/lHrGJuCI
         pmKIMYYmYj+d0AemokYuSrdx+r9A0l7GDG/VeIvPi7TG76e0AgkQ1yUDMrr9WkbghW6/
         qslP3p0EhjtoNUcJg589368c81QEFK8Yv6CHFXTu9g7AbDPshgy5X5KtkcSsc3qr6L1o
         hPnN8RaxmpFtcxm4LLNMT1jcofdZomEGxgYmc4xpN6G5CBrq/fwHyVvHoIfNOngadSIu
         JMXtNw5zntOaUvj7Aivm4u5MDqpOH08BeP/GeV8QF/4G5lhHTZ8FUusGfeVln54vCD/2
         lMKQ==
X-Gm-Message-State: AOJu0YxGNV5Lxm7K7TgYbjg2tceLTsW30Isvmf0uPcxC8S5S8aWL4HIz
	XtG6zJN69eLh7WDkWy0q/ckqGNrPsw7CiShWHMDMmjOeSyXRx9DLoZnbzvhUOiEn
X-Gm-Gg: ASbGncsCDYn6cM/vCwiyjykR2MAYPYL0biy9ThCTRNA0wWS28gzgxhY9TV143basOK3
	TOS9+nRIvaFl4ZAXG8kxroFFsoNmuJL+/jjQTxM0QpAoZGCLLXu1k6ykIG+/fT47camds5IFObF
	T5/6kM8e6EnkrPBGzWRx3PRH7Lm+SXvriUY6N+k0wwvwKzhOTIkaH3cEA2fIYWQ9IrZYHHMZf3M
	L6FcbNhdGOqiDSTbD64NQvULn6gQ68i6yHWkfO18SQA330ZS5hSuggQlj/Y5g3XmPeqYoEJuFx3
	VlouSkYE8WY8AT+NORuUbvEWsrN6k+CBQ0QStCZ346HFWSHRDfFeTEHQW85s4HCZxes3vyL7kwO
	6Ro3RIgXa5BSZNTR2LPK3eqnlNBLorgs=
X-Google-Smtp-Source: AGHT+IFSYAT+kj7LK1fW2iB2gqO1gI3MkadS694341bUoB1t6uXNZfBkEwifUhsqJAtqHty1iocCvA==
X-Received: by 2002:a17:907:7e8b:b0:afe:ef8a:a48b with SMTP id a640c23a62f3a-b04932a3098mr445349866b.30.1757087088700;
        Fri, 05 Sep 2025 08:44:48 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b042258f4ffsm1326879966b.91.2025.09.05.08.44.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:44:48 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ptest-cargo.bbclass: sort binaries for reproducibility
Date: Fri,  5 Sep 2025 17:44:47 +0200
Message-ID: <20250905154447.2710516-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 15:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223009

When compiling tests with cargo, the produced binaries are created
in a non-deterministic order. The list of binaries themselves are taken from
some of the log info produced by cargo, which contains them in the order
as they were created. The class later writes this list of binaries
in the run-ptest script in the order that it found them.

In case the test suite contains more than 1 or 2 binaries, then the
order of these binaries is different almost each run, making the
resulting ptest package non-reproducible.

To avoid this, sort the list of test binaries before storing them.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/classes-recipe/ptest-cargo.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-cargo.bbclass
index 8351644b0f..30463e117b 100644
--- a/meta/classes-recipe/ptest-cargo.bbclass
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -70,7 +70,7 @@ python do_compile_ptest_cargo() {
     cargo_test_binaries_file = d.getVar('CARGO_TEST_BINARIES_FILES')
     bb.note(f"Found {len(test_bins)} tests, write their paths into {cargo_test_binaries_file}")
     with open(cargo_test_binaries_file, "w") as f:
-        for test_bin in test_bins:
+        for test_bin in sorted(test_bins):
             f.write(f"{test_bin}\n")
 
 }

