Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50105C3ABA3
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 05:43:50 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.5183.1746078224339735197
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 22:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KHgsWm1J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso536998f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 22:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746078222; x=1746683022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=39XJSv9vH0pWNIylWGAWSsCAngxcI5APKlhFsauLdeE=;
        b=KHgsWm1JzCXpbx0OnygFr9xfCsoAm0fpFG8Q2P93zkdl3NNruS0vpJDG5afUtiRuZT
         6RAZQ6PpQRvQLKOQHy6QT9q4ywYgzowVid+VeUVw5vv/5VMJijIy7ikPZa1dIHROOLN7
         ponnvbdooTOQ/tb6cjSGKjQMrkQzHiEeukgrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746078222; x=1746683022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39XJSv9vH0pWNIylWGAWSsCAngxcI5APKlhFsauLdeE=;
        b=qicp+kcZxXHWhkJG11Q3V0jYthH78aSg9f1p3qpCfpcbuU7swDErmLo1SUUbVWjqTx
         5HQREJ/66iMGVtTXCzBo3iOBNeY3JDee+rELjYCxKsa6eP2lWVAnC0BKBcsj74rBxgIM
         DuSeJShYn9Bpnu8VVOUGDvjTtcg8mvPwjEgFVH2z3+4cQ5IhpAQjxbk5Q7idMJz5dCqn
         Jj5DwP539So40vv3KuBkNBVVEZPqg9Par7YDVd0ybn8aHaDm+RTECzs66HloqLmpiGhE
         p+aeJEtSxn/CbbzXRws15SW6d/KqCzWpxEvboo3zkk6Vf8f8qTrBxQZG5dr+8Qa+eAEi
         T2gA==
X-Gm-Message-State: AOJu0YyXriBXgLFAHe5FN7Gl6vqVxE8njx/D3aMqhq2Wl6y82t5XK2Jm
	pigtePZ2xLm/uPPjl9QPqOBy4vEXkmZYBC23juAIRsfezsD/92ARGd4zKVxWSkOt9/buIkYsEgI
	r
X-Gm-Gg: ASbGncvDif0FdRzAKlaylfNdriCZmixKgijNmDbfsQ/16a+/O51zloe266blw/HyIlI
	F8ZyOIKPNanKBEkv4B63oSgPCR295LLHMWLUV+YoAkhShorRCf/fhMJCOdJO+JiYIhNt5PlGkj2
	VoW6TDa+V7jvY0OHw6sGOmRxiRJehA6X3LlpzZWYkoDw7669KOxSsxMCIDDiaJS3zX3dwVG3M8h
	oCxVE/egGvEAh+b2jsaC45a0z+M029eASI78li61IEuCFhdlzsu9Dk9RKRvZsGfqM7+82OIcCRt
	+9wRAyB/Zgba9x0HMUQhPZNXuZyd/6KsOl+IQadsz4Q3W3th5W9hmVa5/7rOQfBvOjYl3A==
X-Google-Smtp-Source: AGHT+IEe8ijCt7h8jZHFdmlcDPaiLsma0VHD7LPOMJVreudGv4hJBVrjOzP5isEsxLCjSx+A/XfSGQ==
X-Received: by 2002:a5d:5f4e:0:b0:3a0:7b07:157 with SMTP id ffacd0b85a97d-3a08f75262dmr5221498f8f.9.1746078222046;
        Wed, 30 Apr 2025 22:43:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5da2:282a:8abb:2dc8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca5219sm18441636f8f.27.2025.04.30.22.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 22:43:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] util-linux: ignore mkfds BPF related ptests
Date: Thu,  1 May 2025 06:43:39 +0100
Message-ID: <20250501054339.3770986-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 05:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215762

From: Khem Raj <raj.khem@gmail.com>

They do not pass with GCC-15, ignore them for now

[RP: Fix formatting of exclude to be whitespace separated]
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/util-linux/util-linux/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux/run-ptest b/meta/recipes-core/util-linux/util-linux/run-ptest
index 7b6b1d1dc2a..87fc0f11451 100644
--- a/meta/recipes-core/util-linux/util-linux/run-ptest
+++ b/meta/recipes-core/util-linux/util-linux/run-ptest
@@ -24,7 +24,7 @@ mount --make-shared /
 
 # lsfd/option-inet has races in the test script:
 # https://github.com/util-linux/util-linux/issues/2399
-./tests/run.sh --use-system-commands --parsable --show-diff --exclude=lsfd/option-inet | sed -u '{
+./tests/run.sh --use-system-commands --parsable --show-diff --exclude='lsfd/option-inet lsfd/mkfds-bpf-map lsfd/mkfds-bpf-prog' | sed -u '{
       s/^\(.*\):\(.*\) \.\.\. OK$/PASS: \1:\2/                              
       s/^\(.*\):\(.*\) \.\.\. FAILED \(.*\)$/FAIL: \1:\2 \3/                
       s/^\(.*\):\(.*\) \.\.\. SKIPPED \(.*\)$/SKIP: \1:\2 \3/               

