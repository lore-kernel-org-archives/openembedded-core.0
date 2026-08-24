Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E24C5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 09:59:42 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13313.1787565580373422116
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 02:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IP3OmUUM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4798bea72f9so1408638f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 02:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787565579; x=1788170379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JB8y4pBrN9qd2coUCYG9eCrvC4rZULoool6BrTgWxtA=;
        b=IP3OmUUMhfy1rgqVssDS0ber555sp6bpm82VowXNoWwXvX4L1RzZtdLayH/gNyTYNe
         AIHcJijMM5AtY6nuU6Pvd8HdD6bQzKqW+HKGO2+W0VgPfcccKhjIX+d8Rh1gfgSznYvZ
         ywMO0/86RYxlIXlDdO7x9XtUoqXPbrGj10YmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787565579; x=1788170379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JB8y4pBrN9qd2coUCYG9eCrvC4rZULoool6BrTgWxtA=;
        b=oUsnqy5fRXwRbOCL5ed5b211TAmtHpLC5+ANU2gFXrha3REMUapo9SnU4Wy62QL273
         9pn38LnVoR0MRX0UlN/EXwLe/ByW5aYznQdk8yDHa/x9kqyWlw3MRCU1f7XSqhgx4+Zb
         X7NDBK53J6UA8zpmGu2zvWZXgAjyqxOfq7z3PoqYy4V4SpIH4kNCf84Ov/VIl1EAiJDe
         Z+ndGqWVwqvgzTKN03S7gNNjazS5OwJIgQKXXv/GCHIHdyuuBPJsOJCvdvFi4/6uSFCA
         vovWCfJ3kw61GLgjD6ouZO4atDhCZV41lOzo+ZtX1F0D6hirvp5CiD6L2Qy7WlG0IqVN
         xlzg==
X-Gm-Message-State: AFuF++l+HVUvPsI6FWTj1LgKyKgi/moNlUcWPJ4uo2f0jZ2rcjtWbvBG
	y81RkZ50Vqk41VKQW/RHLDi9fKqFBd8D5fkQogKQYVumj91gLWb3zoLE7LcAj1lHSlkAGQiT+5s
	Dvi8NJso=
X-Gm-Gg: AR+sD1354yLj2Q+a8zKxRqo15w/SiF56Jm/DPwxFKPitaGSaH3NZqpTLq+sFU8EJuFe
	2+yKKnTIesg1cchZdc8jFUoMmQ09DNsPiGyeY3KT7Gtg4mXqcRHVF+10sJKDmqwyUPuXbPHVdLO
	GGkql861vm+sdOz27Fas/iTs5OsL4XOFw1+fnJZpqyGaY13D1IYnQwBdJOgdr3+iWMBC01vQLRe
	6DDD//X/4m8KCjjg2f/xLJOz1YIfP4iNqei9a2eqyRn5Hw4AaX8WlF9D1u4ICC09cuwuLWptcnT
	oePNxjymECLCSuxdEDbu79SgwHlKROovQ7aCTV8HBDHV3iTKfsD9HH/0D08UePBCPZk52b0ZXWD
	DnVlZpwVtOdZWW1CrWINzfL6aNxoLgYAZg457t6mijoUagQ5mR4hDh0tfSBfmdKjdJkea1TY+A/
	KubStm400lshBfWnfBvDF38mCAt7Owq0LVbr+bZzdf1s5I0ervGEMwUkKFcZlNFI/eFN3+qtjVJ
	v4yVNlZRCD9HazR8g==
X-Received: by 2002:a05:6000:1447:b0:47f:f20d:8d4f with SMTP id ffacd0b85a97d-482c0b99930mr29213655f8f.18.1787565578626;
        Mon, 24 Aug 2026 02:59:38 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5c5b:7a15:ab97:8d7f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9c0869bsm7687850f8f.25.2026.08.24.02.59.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 02:59:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] utfcpp: upgrade 4.1.1 -> 4.2.0
Date: Mon, 24 Aug 2026 10:59:33 +0100
Message-ID: <20260824095933.2906404-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824095933.2906404-1-richard.purdie@linuxfoundation.org>
References: <20260824095933.2906404-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 09:59:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244081

2d8e20b Release 4.2.0
44fdb26 Update README with project history link
5caca3f Fix exception type in API_REFERENCE.md
87ca49f next16 properly reports errors
c5585ef Reordered validity checks to preserve the earlier behavior.
4f46292 Fixed some warnings in benchmark.cpp
2f74d3b Removed unused is_overlong_sequence()
ef75b56 Rewrote validate_next that returns a code point.
85d5927 Fix bench/compare_commits.py
3145774 Revert the "minor optimization for ASCII range" as it actually hurts performance.
ca9e9bc Forgot to include the change for benchmark.cpp
ee0712e Fix the benchmarking script
9fb955a Python script to easily compare performance of two commits.
bf99533 A minor optimization for ASCII range.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-support/utfcpp/{utfcpp_4.1.1.bb => utfcpp_4.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/utfcpp/{utfcpp_4.1.1.bb => utfcpp_4.2.0.bb} (94%)

diff --git a/meta/recipes-support/utfcpp/utfcpp_4.1.1.bb b/meta/recipes-support/utfcpp/utfcpp_4.2.0.bb
similarity index 94%
rename from meta/recipes-support/utfcpp/utfcpp_4.1.1.bb
rename to meta/recipes-support/utfcpp/utfcpp_4.2.0.bb
index c2ad0939a1b..c56d03b7c74 100644
--- a/meta/recipes-support/utfcpp/utfcpp_4.1.1.bb
+++ b/meta/recipes-support/utfcpp/utfcpp_4.2.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c \
 SRC_URI = "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v${PV} \
            file://run-ptest"
 
-SRCREV = "819011bb01628fe1aa2f1da9f2c842a48fd5680b"
+SRCREV = "2d8e20b22dcb3e9b3c4f52103182ebda949c6089"
 
 inherit cmake ptest
 

