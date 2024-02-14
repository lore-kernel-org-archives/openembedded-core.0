Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C9CC48BC1
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 18:35:23 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.68.1707935717037352382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 10:35:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=uvw5o2nc;
 spf=pass (domain: limonsoftware.com, ip: 209.85.160.48, mailfrom: anibal@limonsoftware.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-21cab5e5528so58542fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 10:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1707935716; x=1708540516; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zxAH5LEvy6l6Yr0gfkPnQBpbNtT1Q200Zrv8EfS78yI=;
        b=uvw5o2ncp784QblxcZCU+9FLZ9+PsaubYkksfoSPdFtlO6vJ6ixfrfwMSxQwhqr1dV
         gi6rFQLn5shqsugUNfIiQfXpszJMBVurB1q/UTO7VukGh6FfMoOOyrnRt1kj1HA0ksU7
         +I077WlpcD6Kjb9WO5I20fVGdAS+fkhjh58l+2RVB2NPqEr8XX5xHcLm6DEfcGNxFPAK
         aVcmn4bvKwQuiyfRlH9RmwuVZi0tbfjTeW+q8QegFovzDZWO39P3NC6dcBivawdTFYeZ
         MpwE9QaWwXn7/Jx4Cu9aTB9jVjtrjbUa2kJsDH6me6X3Rm+orCFruLkS+EwpvDHQhVuh
         nYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707935716; x=1708540516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxAH5LEvy6l6Yr0gfkPnQBpbNtT1Q200Zrv8EfS78yI=;
        b=SACEUMXnyrwXX+xPQvZlXTSGgByLNh9D84iChKcMbT6EafwBumgFlqXQDhQTAPRykj
         UmrwkpForFvrpx7BYIdMszrkNItkqNZyrUEf8tXY8se1ToKuMeHkoa+KL3clCDmftfbg
         BZYYSz9/ri9GDF2q/mB4jYxI2inQJVeL9w1/45rioxiFhLk3FtueklF6yF3ldW3Ltg3n
         xtaUNioX7UhMCMUs1nbnYJMXiIs4+yndBt2+ah9BmE0PXw1kpeWwukhznhTL+CMy62/C
         eI6uhP+VFEBIBl8k24l+I7ll9IGa/s7O+6ECYRvNx1tCo1orKGV6Nj8N7+LEu2UFCDb8
         o38w==
X-Gm-Message-State: AOJu0Yx4T3us5PYXH5ZTPuTMsuWn10A2vuEf42/hn+Wrdj3ewxG2YMnT
	19/9KwYM1rM2KWaXPILYJtuGVwDjNxzAOrCobvvHejm8I59o7LKxsTrDYKFIebVsDtgWBPx86gD
	M
X-Google-Smtp-Source: AGHT+IHRuLf2BHOo9QPt0yaHhfS8mncbIo9oTwdxrQj8dbfNOKhRjOpfqdb5som/PHRvmHmHyZ0/GA==
X-Received: by 2002:a05:6871:5827:b0:214:e186:4d3f with SMTP id oj39-20020a056871582700b00214e1864d3fmr3542202oac.26.1707935714954;
        Wed, 14 Feb 2024 10:35:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU31omWZsxq3j7JWE8bayYpjecH/J/sllwXFr7LR4K4yXhTkq+xfpt63XUFuV7vJQrXKnnx6SAVB3ZiCiXV/as3LpYdW1n1pUsqdP9Kt1UOZXem+VRRfo4/fXYcuS5a
Received: from blackbox.wild-bonito.ts.net (fixed-189-203-87-105.totalplay.net. [189.203.87.105])
        by smtp.gmail.com with ESMTPSA id qb15-20020a056871e78f00b0021a6a09ee38sm1358942oac.1.2024.02.14.10.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 10:35:14 -0800 (PST)
From: Anibal Limon <anibal@limonsoftware.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	JPEWhacker@gmail.com,
	Anibal Limon <anibal@limonsoftware.com>
Subject: [PATCH] ptest-runner: Bump to 2.4.3 (92c1b97)
Date: Wed, 14 Feb 2024 12:35:03 -0600
Message-ID: <20240214183503.878993-1-anibal@limonsoftware.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 18:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195493

Pull small fixed related to secure builds, handling of rc in every ptest
and better tests output when timeout.

Changes,

92c1b97 Do not reset error counter before each test
7de7e2b utils: run_child fix security flags build
6a9fba2 utils.c: get_available_ptests fix security flags compilation
5b8ad9a tests: Ensure that timeouts still print ERROR
d939217 SECURITY.md: Add file

Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
---
 .../{ptest-runner_2.4.2.bb => ptest-runner_2.4.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.2.bb => ptest-runner_2.4.3.bb} (95%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb
similarity index 95%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb
index ff336b3820..e6668da01f 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "4148e75284e443fc8ffaef425c467aa5523528ff"
+SRCREV = "92c1b97bfdb4a94acc1cabcaf97eef52dc29144c"
 PV .= "+git"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
-- 
2.43.0


