Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD41C4332F
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:51 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.9246.1635325670323857190
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XML+3PGs;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id u18so2880157wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e8FaNmGWZfJSq7jn7N7qt2Eqb1uoEN4a/Z9EOsz8hyY=;
        b=XML+3PGspq7qZ3DosUA7zs5A8STq2BkGqP9BMn+GhC+wJgNSNU6wTIE60DNn6usWBK
         z3i3bzTFsk9u0UEOjtxFNUR/mZ+8rL1b2zfuui1VlO5XDe3brLM7woDUvUEp9KZDdvEc
         5miXwkKr4TC5eV9Yn17mx5Ymu48wki2o0f0eic97oFqQjo212IHk1AOpq34vxYJn9344
         sjVdvJcvFZ77+G/QKnUjFcBGW6ySTfmvJS0hwCCW9mMs77ACzIjqO3hOIXYN9xmcZguR
         0gsPbb04bGVDuXuRe02PbeWRK+4IDgdlVY5Vy4TNbn1F7qyKFzEZtdSG1V7tmAJkByRv
         aR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e8FaNmGWZfJSq7jn7N7qt2Eqb1uoEN4a/Z9EOsz8hyY=;
        b=F/rjaQ2EpHQwzrlo9iWv07VrHbNxXTtkPoC/n7NR7tyKn1XkABd9rNEjnTT9W7VUOb
         XEnfeIzxnf0NMZ5egzGGXInxxv3SQdkZBMbbNb0gud/Ik9D8oC+eYLiMmAY2I46abcXe
         KStijWf4m1UTtTXgOVh79L2hXrfOQ8QCh0lbPIk7aatH09Q4rYhyod/9ddj4A3Rd1iU5
         G8ZjjFilN3bm17Ex7ChyDKNUu/r2e1NUSVYNkP/fUptezKbp88SC4FEKStbZ2TKagYnA
         NUmxTAn71tB51kaqgxXHojb3w0mgmSpAs6RowkUGtWmUSRcaab/A/6GLgN94AL2QoNLJ
         7TAA==
X-Gm-Message-State: AOAM532acu5ZL+AMWEH8TGctqjtO4aLnqS4yicqWm62H8+HbxW9pXyq8
	VzG0VbHcBOKAL1l0+24Q6P//3AcCqAY=
X-Google-Smtp-Source: 
 ABdhPJzm9enx5/Sh9XQESETERDq3ZY9XWD641SPP0N/eMQYyI0UY5lu48WSdaO8uTZiA3tA69t/lBA==
X-Received: by 2002:a5d:6103:: with SMTP id v3mr36387134wrt.335.1635325668997;
        Wed, 27 Oct 2021 02:07:48 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/30] diffoscope: upgrade 187 -> 188
Date: Wed, 27 Oct 2021 11:07:22 +0200
Message-Id: <20211027090736.2546759-16-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157492

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../diffoscope/{diffoscope_187.bb => diffoscope_188.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_187.bb => diffoscope_188.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_187.bb b/meta/recipes-support/diffoscope/diffoscope_188.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_187.bb
rename to meta/recipes-support/diffoscope/diffoscope_188.bb
index e10a068cbb..d4fd112e37 100644
--- a/meta/recipes-support/diffoscope/diffoscope_187.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_188.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "e8340880eb9cce0d99498f71bcdb69c6cc4385c972b5bc12e739e71eaca29c5a"
+SRC_URI[sha256sum] = "cdbc401c78d59779ad8ebbb8e2008166f912e77c7ed3be8dc788d36948712ff5"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.20.1


