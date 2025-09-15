Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 051C7CAC599
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 09:02:16 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.28243.1757926932795200078
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 02:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LESRjUKc;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b03fa5c5a89so604786866b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 02:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757926931; x=1758531731; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2vRWGT0f8rearr9PJi8+jE3KHYV2gHtUpKnvpKB2kTI=;
        b=LESRjUKctWjSS5GGMoE7aSJjx82UnPb39P1KUk2P7QJQHx6qdFRG97tMbZ3rH/tIrl
         2VgfOeUh17XvHGgHOmsq1qIz0t5tG19lH2+5gcaDYCoxDrQ3r03RkF1yA9DwgNpG5Vkm
         xkod2ATw5MfYkd7D5FeK5z7VUDnF51307viNbVvGgLoHQFjds12PqCRu4ewnBN0f3QMS
         rarioYFcQkrigUhE8/QBauMEb5WQ6B2fNj7ylmuswBF0OigUT/iQiCc51OoQtmdED6mS
         +k8+J8+fFCLTTFc2j6jCsxOegzFKeaItTlNcMakmFkkrXM/d0xXeWm2LJdcsZSn5XJ9b
         MdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757926931; x=1758531731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vRWGT0f8rearr9PJi8+jE3KHYV2gHtUpKnvpKB2kTI=;
        b=JX1oqq7RnVUl40PiEknEkmDGcuaR/hmW5yDL7Ew1J1AyxvtdugFOedIbcYPc7uUO/p
         Tvpt17eMQKUWzKkp5pDpVwAbplaffbRDjKhBsK90LYcE7FRncAwcK/7WEZ9x462Nh1xT
         5EEMKA4Es+yIqWVjh4LOBGWebTDFiSckbVjneuvMAcYKYdY/inivuaNUfg9VWoN0A18m
         qEe6fnQHFQV+zdfmj33XRYXxysQiPWIDQpThxxkKWUyiItemIJjx27lPvpIOYrVBw0ds
         y5uxhKeqgeGrrZoBrfqiORzm24ESPn1wjNlkK54ieq32vIaMKwab1O4EctbDMZeFEgw5
         jBAw==
X-Gm-Message-State: AOJu0YxGZP9Y3RBoRCeXtqH8PgUG7tflblI+DzvxCVZoHqyANSQVPdLO
	db74hOWXyhpK8EKls4zwHC4zVdqDB9swyeo80LZqnknLAhGCI7QgBWx+hnRQqQ==
X-Gm-Gg: ASbGncu/RCvcinhMxFpW2c0aWqrcB/dLTlsBMN1Ju0RABUwISsnGd9MzyyKUfLVVXOQ
	muGHjs8y5idQXgHW1iCRas3Ng3JQ8ferwNsrRFIa0eXCnl1q6x4Z3NA67jpQdzxFEWI71VA5wYp
	Wt7kCUoFLomybybLoRqYz7/eu/GvYRdp0kcz2ieE5xqqulKEhijPCK7edn2DmUttv3xBLsSGTLE
	yzaCl/GQGYF/dmmlzgjHBcJor2EfqlubbYc/HR6wnk15G1dVL/JVevVreZFYd35CQ+avCBzs/Xw
	eBUhVqtQ7PbSi9BnVtDX11NeYQG3hcxAbk3WKNkCzYK+/uE0CaJMsofjpW2xSLu/luJSAOpnQY4
	1SumwW/lsbe27bGNf5UhWybrJRe9v1yc=
X-Google-Smtp-Source: AGHT+IGY9smVtCahSJwK4cIuYH2teWfrcSs+9beTKDe9cyn1K3YiV2ZiA6ixtISOdy8tQ55EvcsoQQ==
X-Received: by 2002:a17:906:b310:b0:b07:de2c:1268 with SMTP id a640c23a62f3a-b07de2c15famr620124566b.5.1757926930810;
        Mon, 15 Sep 2025 02:02:10 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32f22b1sm914691566b.86.2025.09.15.02.02.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 02:02:10 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] patchtest: fix repo.canbemerged usage
Date: Mon, 15 Sep 2025 11:02:06 +0200
Message-ID: <20250915090208.2007216-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915090208.2007216-1-skandigraun@gmail.com>
References: <20250915090208.2007216-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 09:02:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223392

Call it like a function to avoid it being interpreted as True always.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/lib/patchtest/tests/test_mbox.py     | 2 +-
 meta/lib/patchtest/tests/test_metadata.py | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_mbox.py b/meta/lib/patchtest/tests/test_mbox.py
index dab733ea77..714c9b30af 100644
--- a/meta/lib/patchtest/tests/test_mbox.py
+++ b/meta/lib/patchtest/tests/test_mbox.py
@@ -90,7 +90,7 @@ class TestMbox(base.Base):
                 " for master branch. Target detected is %s"
                 % PatchtestParser.repo.patch.branch
             )
-        if not PatchtestParser.repo.canbemerged:
+        if not PatchtestParser.repo.canbemerged():
             commithash, author, date, shortlog = headlog()
             self.fail(
                 "Series does not apply on top of target branch %s"
diff --git a/meta/lib/patchtest/tests/test_metadata.py b/meta/lib/patchtest/tests/test_metadata.py
index 2dee80b002..63d01819e7 100644
--- a/meta/lib/patchtest/tests/test_metadata.py
+++ b/meta/lib/patchtest/tests/test_metadata.py
@@ -110,7 +110,7 @@ class TestMetadata(base.Metadata):
 
     def pretest_src_uri_left_files(self):
         # these tests just make sense on patches that can be merged
-        if not PatchtestParser.repo.canbemerged:
+        if not PatchtestParser.repo.canbemerged():
             self.skip("Patch cannot be merged")
         if not self.modified:
             self.skip('No modified recipes, skipping pretest')
@@ -127,7 +127,7 @@ class TestMetadata(base.Metadata):
 
     def test_src_uri_left_files(self):
         # these tests just make sense on patches that can be merged
-        if not PatchtestParser.repo.canbemerged:
+        if not PatchtestParser.repo.canbemerged():
             self.skip("Patch cannot be merged")
         if not self.modified:
             self.skip('No modified recipes, skipping pretest')

