Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B338BC64991
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 07:21:51 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.9309.1662016903424891807
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F7BFEks3;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 d12-20020a05600c34cc00b003a83d20812fso869931wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=/AOeRcdhKymT3BQR0dT2edRsGusg3/aqb0JYttvwD7I=;
        b=F7BFEks3jrKAYBjwKyN6p+4A2F3zTokyz/hVOcn2vIJWzZMZ0TQb863S6cjVJWyYgw
         1yV46r2DTia6SMG96b6r8JH4HosfVLabJj2bQHjGWI+yk+Z03l4qd6zYIP6zbD5w44BJ
         VBH8v0A2Uwek4l77FyDKvvbBj0g90P7Jz7JMb7AgcggH+KqqIuvTkyux7JJjIk0KM6mh
         OjqNdJFvcDDfgSJ3nK4riSYZxAS5mqV+71QYSJfKr6i6o6ANUqjWmoGofLX5saAVcGFv
         pc+R0E4E7MMJHkchOPrlpGyCImlSGntsveCmAMhDCzYboAQY4ESyDp66BN4/52FqCgwt
         UmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=/AOeRcdhKymT3BQR0dT2edRsGusg3/aqb0JYttvwD7I=;
        b=VU+08vUyl4flXuqtbN0VeiEAkCBkP+ahCdYPSey6sYDzdfzJQp6iw7qgl25tGpswXD
         u7g2MfY19W9IYfP9XorkmNy4ELf87+O5KWY1YP8766OdKWAHUpOFEs4/ktWe+4vlX+nu
         Q1RZPCl+u4vWbxR8kFzXUmn04hDgnl3QxY03PXgThBJq3fbdFlsAyTJPeelrE5TRKVH/
         ZbGdep61L5v7OHRoOZgq2NTpEXcJp+KYfsphcOTS6oFi0tHioewmVgcK3nvTJvWUFglx
         KxOkbON6aurHK2T+MlsADZkHaftEdjPF1Z9s6hp5IZ3n55qPJeXhY8liVywMoP2Ox6Q8
         piVw==
X-Gm-Message-State: ACgBeo2lE0DBbKNZoylHVU8eg4D3M1dR8YJEkItBzUXSbOdh9UdErav7
	6owFAG3Y6LftNRA/CBa2usf0IPT8lGE=
X-Google-Smtp-Source: 
 AA6agR4ePdFoyiPWeSyu90GY5aImil4XMXF58QVLrBQ6p+P7Mrxm2/nnUeZNVjYYkSVqWfpC/7vpFQ==
X-Received: by 2002:a05:600c:502b:b0:3a5:d36a:8b93 with SMTP id
 n43-20020a05600c502b00b003a5d36a8b93mr4127732wmr.180.1662016902007;
        Thu, 01 Sep 2022 00:21:42 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 c18-20020adffb52000000b00225239d9265sm14022982wrs.74.2022.09.01.00.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 00:21:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/14] python: submit CC to cc_basename patch upstream
Date: Thu,  1 Sep 2022 09:21:18 +0200
Message-Id: <20220901072125.3366367-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901072125.3366367-1-alex@linutronix.de>
References: <20220901072125.3366367-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 07:21:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170149

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-python3-use-cc_basename-to-replace-CC-for-checking-c.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
index 6bb85fcb34..2c7d264da0 100644
--- a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
+++ b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
@@ -14,7 +14,7 @@ x86_64-wrs-linux-gcc: error: unrecognized command line option '-fp-model'
 Here use cc_basename to replace CC for checking compiler to avoid such
 kind of issue.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/python/cpython/pull/96399]
 
 Signed-off-by: Li Zhou <li.zhou@windriver.com>
 
-- 
2.30.2


