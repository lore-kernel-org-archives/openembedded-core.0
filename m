Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80AECC74A5B
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 00:27:32 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.35795.1678494449892792884
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 16:27:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NEi1wqLw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id p4so368364wre.11
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 16:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678494448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fk1EsUsQdQJLVOluud927umJa7RlSh2+OV9aSO++8eU=;
        b=NEi1wqLwghybBTp23p55WCDZ4718usphZ/mLmKSAysTpCLVptVqhBk1gXfo91eAJ+9
         c9QzlBIITA30glAORagGUPsZcfBYeK8LP5vNywCtgkpZ6GZCnPvi8xDlprafWh6+pKCy
         YydUxs4mKqPIWoAph3bbBsRy+oMTQuqQfMj1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678494448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fk1EsUsQdQJLVOluud927umJa7RlSh2+OV9aSO++8eU=;
        b=gjpZ+Ciqc5Lcxy184K9EaDdZmi4Bh84OHmq3zKIA0XiSn7SpwABR+34FBbvIVLmmN+
         Snh0iAj+h05K4MLs3TFOkfAI04GcHKncwoMO5UK72NH7jE0PbtgnM80dEBsmMywwvF5w
         or7fldqtjHHTvI7zryvrMIWCJgk34J9/uXrGZu7aEoJGtyi5GkakTzQJC7yIRQ49DiyY
         2G663x4T8kSAG0S3vdTZir/ECOqwGG7BYvx0ZOrnkGLPJxppgxiYmWuy++YSX7ypA9Xi
         W7i65xiovXoiQhgjA6I4sLq/3aWLCu/02ZRfk0sj4/aTJvT687q5NCrLIxtIjk4Y5VpP
         kbWg==
X-Gm-Message-State: AO0yUKU45wDB2ubW6DYiFqZwpOhaHVJUOurpYxvfDS+8OSeQzvj09rwr
	7sEmJnfYjx5h4fA4FNGIr+deOkKYZI07XcitmoM=
X-Google-Smtp-Source: AK7set90uEQRkpGalO/WzkSTwnkqorfuXjTVMzCHd1nJWsugDBWkvburoztKJ7rmyZ1wXEi4iOEqLw==
X-Received: by 2002:adf:dd49:0:b0:2c7:1aaa:750 with SMTP id u9-20020adfdd49000000b002c71aaa0750mr17775959wrm.66.1678494448198;
        Fri, 10 Mar 2023 16:27:28 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d400f000000b002cea299a575sm291736wrp.101.2023.03.10.16.27.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 16:27:27 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/16] bc: Fix ptest test output naming
Date: Sat, 11 Mar 2023 00:27:14 +0000
Message-Id: <20230311002722.3211118-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
References: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 00:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178352

The quoting in the script was mangled leading to "0" tests being
found by our log parsing code. Fix the quoting to allow the correct
test counts to appear.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/bc/bc/run-ptest | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/bc/bc/run-ptest b/meta/recipes-extended/bc/bc/run-ptest
index 66a1b9d7087..ba5abe68058 100644
--- a/meta/recipes-extended/bc/bc/run-ptest
+++ b/meta/recipes-extended/bc/bc/run-ptest
@@ -2,8 +2,8 @@
 
 for TEST in *.b; do
 	if bc -l $TEST </dev/null; then
-		echo “PASS: bc/$TEST”
+		echo "PASS: bc/$TEST"
 	else
-		echo “FAIL: bc/$TEST”
+		echo "FAIL: bc/$TEST"
 	fi
 done
-- 
2.38.1


