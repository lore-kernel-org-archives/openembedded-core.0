Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02CD2CAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 16:48:20 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.1268.1758300495581947124
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 09:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=k4ke2KUM;
 spf=pass (domain: baylibre.com, ip: 209.85.219.67, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-78f30dac856so27032356d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 09:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758300494; x=1758905294; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eQzuJDuhG//8IxB7GxWqtibV7U+VlNosNj6ynslHwjA=;
        b=k4ke2KUMU8jLlxwXWtqxcMz/ajum/4ZbFpk2r3780xJw6YMXyroyiNz2nPBfAen1jX
         h7Y3W/DgiSGV+6g8vQR7GOby2C89+cEsoOqvsutAuAtb7rAP9nGVZy6n5Mf6oBBwpD4R
         k4ZaKp6PWyVhUliNO/+G8y/aNhTClMivkY5NiZCP7CqNdDY7zuOtZDKBoYeVw3hLPzrh
         RKEP/8z66v3pxpIqg4r+UjNqPWBYBasuhT7+1nJtltornzFO+MF9nKZk6NFXmfcobD4c
         U+ozQcs1sYKVICBmQD5cRPUDF1igvy437CovnxscwVGR+nR/VsFhPYYI7JDEP0uymxSe
         PrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758300494; x=1758905294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQzuJDuhG//8IxB7GxWqtibV7U+VlNosNj6ynslHwjA=;
        b=upyBOjxbe6KzLCnNXnRyX9udsjacHD05Z76eVGDo4MtVIy/ZVPuTmVGC9Nq/h1uNNG
         kBOimBVQEqk15vHm9uU8Ecxkupz8jierFtHCurmPruk47m4jmsz7GPMG2kDbMq+IOVID
         VplhlyzlLsK8xaUv6pqshiQz3UgYXh9tLgoAd7bX6TDdP+TydKnCBwoD9ZdmBaaSTMNq
         4vOM3MaGJhVxTZL3qe7EY29IjSGx9ZDYcT2AD0aWwcWe9URuaM2yWjIUPQ0XYL1HKhrO
         H00DZdoO1yfzPlAYC0N28LVQ3EsBJUyRVwROGwBSttdbOlemQT8jYdfuJhihrKOZi425
         tF5g==
X-Gm-Message-State: AOJu0YwdgbkMsImJgOB0qZLKg+qnW6elgwvq96pSCevYR4xc+kDqE053
	8RCiyQdVJjpcPgedyMhc9U2BQqj9C7hlHqZutQV77k2bi+Wry9kPTZtLFlEFPbnHAi+jRZJ2ZXU
	yyFR3LnuJLA==
X-Gm-Gg: ASbGncskorvAOAKVB2GEJkeWNVpLFJuXIiU76KrwdldFMcEXDvHmtKiY7P68C4oGxWW
	MpoBnSH4L4j5MF3/gdKRKrIvRfAlDhYxgXTI4phII2iL6wy+N4b4O18U+nE+6Oyd3bUN4N3Md8W
	zsO0Y1tHpBH2+UnbBRr7OultlmwlKiL7DEw4nC7XE7kqqlilR8Q7+VVYmrWtZjCBV2+ejNAgjp6
	4we6TVbRp8F4E2E4tQOIN7MfBaUZSs+kjGotpeUixCb4ZZOqHohR88oeTcuDWEx37CWtk8nm1Nc
	NUOggKRp1kSmdXBzR5tg5Y3gvv4PQcjT69g6HBoVMdYYfcIW7Y1Ch7mMRF53gMdiRc1WOwdYHao
	SndVVecKKfx1+8J5CNXYmCLL7vREgf3bTc0KZcpyIHxP5b+bJDLo4fkS+UlTcikQUK9r9
X-Google-Smtp-Source: AGHT+IFa4AyLT3Sud78EFYEevVlbN/NN8bOJUZXJ8F3l9jjtC5EL8oLzP4HKkZ3s5u81JEiwHTItPw==
X-Received: by 2002:a05:6214:224e:b0:784:bd2b:abbf with SMTP id 6a1803df08f44-79912a787b3mr44607126d6.24.1758300493812;
        Fri, 19 Sep 2025 09:48:13 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7934636f947sm31683416d6.16.2025.09.19.09.48.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 09:48:12 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/6] python3-hypothesis: upgrade 6.138.15 -> 6.139.2
Date: Fri, 19 Sep 2025 12:48:01 -0400
Message-ID: <20250919164803.3174518-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919164803.3174518-1-tgamblin@baylibre.com>
References: <20250919164803.3174518-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 16:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223763

Changelog: (https://hypothesis.readthedocs.io/en/latest/changelog.html#changelog):

6.139.2:

- Internal refactoring for new lint rules.

6.139.1:

- Fixed another typo in error message around function-scoped fixtures.

6.139.0:

- Add get_current_profile_name(), which returns the name of the current settings profile.

6.138.17:

- Fixed typo in error message around function-scoped fixtures.

6.138.16:

- Improved error message for DeadlineExceeded.

Reproducibility OK.

ptests look OK:

|============================================================================
|Testsuite summary
|# TOTAL: 5
|# PASS: 5
|# SKIP: 0
|# XFAIL: 0
|# FAIL: 0
|# XPASS: 0
|# ERROR: 0
|DURATION: 1
|END: /usr/lib/python3-hypothesis/ptest
|2025-09-19T15:53
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...on3-hypothesis_6.138.15.bb => python3-hypothesis_6.139.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.138.15.bb => python3-hypothesis_6.139.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.138.15.bb b/meta/recipes-devtools/python/python3-hypothesis_6.139.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.138.15.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.139.2.bb
index 508f125e43..b03cc22fac 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.138.15.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.139.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "6b0e1aa182eacde87110995a3543530d69ef411f642162a656efcd46c2823ad1"
+SRC_URI[sha256sum] = "2dc2ff36ea977a9cb7fb68f24a5dbf5d673b88a2e502212676eafe09b699f511"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.51.0


