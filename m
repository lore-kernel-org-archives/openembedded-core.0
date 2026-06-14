Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34639CD98DF
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:22 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105058.1781424252130828912
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AuSulO9d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b915ded5so21722855e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424250; x=1782029050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OVJXQNGf1vfGDs5lm7q6pEz5lgEm2SVS8gUWdv8KYGA=;
        b=AuSulO9dFK6+VGcDmDYvP0vu7pCXw/no9kDA+fBfEbwTGDfK6ywG8ip9icZc5hQ6NU
         Krsl66rigjuASnKioet5UW9oq3MopC6guGqf4ysitm0yHH1a6Vo+SBSL/QcRIpojHW5Y
         BBFaYHdsIQmK1dNqBORt14wHFAD0N6+GoQsec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424250; x=1782029050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OVJXQNGf1vfGDs5lm7q6pEz5lgEm2SVS8gUWdv8KYGA=;
        b=lIpBSMSdEf86GgP4NPz28JkmJpLqDMIiQxPgI1DOwnsh9ptYkBRbkAoVUbQKYdj+uw
         SGg9MFQPHR/GE60GH19rIIg6eUBmZ3DL3sw+n+CloNLU36WoJuDJnicJg/W/tBTHOqFU
         f0yFN5O5Y8UI8VT1yM9i7jM/tlg5KMsQeaGmb2IvtuUwer9cndYrgT8GBrn9xCe7xY2V
         W0B+8KE8OXGOZWhIlG+aXSEHRjYZwJ+k5k5WykLvUH4WzTUAdAmez8TOPvo+/wc7QWKy
         pNu6Z7ny0MXJ3XWorClC1n8wee1lK0n1NLrFzrh1x5/UsCQUIxgTgxIVhfn/j41AS3Oa
         wyQA==
X-Gm-Message-State: AOJu0YyPe03qaSJMMDRZ9TnuzkBHtIgeXcNBGUaBAjC+pqgDpWRP7/5T
	Knq8FaHnX4+fyRxJwyxuszPNOanCwQI0F7IkhYTlshBAnPhq+nheb2tIJ8GPBJZ1F0KFrqRVMIw
	O+ktC
X-Gm-Gg: Acq92OHqh8TDocoxV80uG9aYC8qUhu+JhEtvmPAhFjq+IQNqAof+cFLNKB9ekkSe8YO
	xAG/lck35aNmF/iLq6vAt6bvDwJHIH8TGAbWBFBV1vPnMfZ2Ec/sAaM1tW999xmqv/bvvb/WMXb
	yWFp9thCx2noygbVUp71cbxbM4cCrfebu+PhXbwCFH1TCRU3iWotgOAEzgOvGX6JSm5pp20lIAK
	iW7saJcYw7E+H8PZSd3rV3EEqOS0LQE3rpht/aXdaqpStMZsltgtClCB14bx8sESXGo+BWbIKgO
	Fj0MPcqLS9zDRcJtGsMiJiQF+Y59vACwSHwF8WNOf9DaAw8Cis8x+Z5bOvam5OBPcfKCe7b0tn2
	CLKGYH8zTxWC1xFFBQO9KDq4DZoybRWjn8+tvy832+sAdK31J0M3R9q+BDgg0Eq9sexmbhMWbh6
	VFt90b8EgN3Q3n0iHNASW3S4luxdgx5GWdEfF0vZzjnvV4tTcZ6suL
X-Received: by 2002:a05:600c:e547:20b0:490:b58b:a8ca with SMTP id 5b1f17b1804b1-490ec50c366mr78739445e9.27.1781424250346;
        Sun, 14 Jun 2026 01:04:10 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.04.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 39/56] python3-snowballstemmer: upgrade 3.1.0 -> 3.1.1
Date: Sun, 14 Jun 2026 09:02:50 +0100
Message-ID: <20260614080307.4017177-39-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238723

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...nowballstemmer_3.1.0.bb => python3-snowballstemmer_3.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-snowballstemmer_3.1.0.bb => python3-snowballstemmer_3.1.1.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-snowballstemmer_3.1.0.bb b/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-snowballstemmer_3.1.0.bb
rename to meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb
index 52911593ae5..032197008f5 100644
--- a/meta/recipes-devtools/python/python3-snowballstemmer_3.1.0.bb
+++ b/meta/recipes-devtools/python/python3-snowballstemmer_3.1.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/snowballstem/snowball"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=07c3b61d971c3df6e19ce439cfe1fb8c"
 
-SRC_URI[sha256sum] = "fd9e34526b23340cd23ffea6c9f9760974ecc2c2ac9e1d81401443ccdb2a801f"
+SRC_URI[sha256sum] = "e07bbc54a0d798fe6010a12398422e62a8bfbba95c394fd0956ef58cb4d3e260"
 
 PYPI_PACKAGE = "snowballstemmer"
 

