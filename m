Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152BCC7EE2D
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 11:59:35 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.64034.1677412770911154454
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 03:59:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eRk8aRXX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id h14so3501319wru.4
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 03:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=12DxhlEA6HOXyVy7HqF4iIgKVwRdaAm1AZ3U6CpMzl4=;
        b=eRk8aRXXBTVTEd15SJeXvponODe4XMwzJtXkLo0wDvUjQGwALlIibRT746m2XEqeBj
         EIf+YGjuK2EUPdMpktmFwhdeezdA8wzdX/gEpTe3GPt+UVtzVHaWnISEfx2ugjWlYw78
         Y5/rxXs3udPK/mUzBA7zpmBH3oDqYT5OPEE4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=12DxhlEA6HOXyVy7HqF4iIgKVwRdaAm1AZ3U6CpMzl4=;
        b=uOT8yoj4GW/RV8VL4TKDaiUCEFlYvyd4A8mPtVTWcRJezWw/rnissroEhEMQ7/8Ioa
         XKi9N8HjKL+3cuk3FVie22R8qzJh8gcNcwJn/KXEnMG6UFKXb2AAk8VELVDe/L/paP8t
         hZYWe7X5J7uc9fX7K+Jwc+K0mXRKOSDuYbtL+zWTUc57K5EfNBw01otfAfMMlYsEfGXE
         xlK45OECabX6ldT+JvB2N0d0teIJvrfvc6qk8JJi3IaC1uY6ZcxEK5zjsSed209wJFtx
         lj8HtC7NDe+U/O4biMbPQ4MDtYwPQYQTYU9JWYWlcpcI724eJ4lMdqm0M5SUx3+RLUMm
         b5Yg==
X-Gm-Message-State: AO0yUKVpJQ5hkmGfrbtKJhOP0vxqojJZp+fGQ81kbrKJ+H/noXvD7q88
	jQn/4lFOGJ7hzW4reM9MhehdSy+/H/Hb1H77
X-Google-Smtp-Source: AK7set+4z4se9QKyc2G/YOEpJ52iTCPlFHyJiA81EQRIScXkaoeLZkNnVLobQOCTGIVSaMg7ncxCQg==
X-Received: by 2002:adf:ce0b:0:b0:2c6:e827:21c1 with SMTP id p11-20020adfce0b000000b002c6e82721c1mr16322797wrn.50.1677412768695;
        Sun, 26 Feb 2023 03:59:28 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:acca:18ee:3f6:d4ed])
        by smtp.gmail.com with ESMTPSA id d2-20020adfe842000000b002c552c6c8c2sm4247928wrn.87.2023.02.26.03.59.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 03:59:28 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] resulttool/regression: Ensure LTP results are only compared against other LTP runs
Date: Sun, 26 Feb 2023 11:59:26 +0000
Message-Id: <20230226115927.628364-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 11:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177730

If a test result contains LTP test results, it should only be compared with
other runs containing LTP test results.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/resulttool/regression.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index 1b0c8335a39..04a2f3fbb07 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -146,6 +146,7 @@ def can_be_compared(logger, base, target):
     run with different tests sets or parameters. Return true if tests can be
     compared
     """
+    ret = True
     base_configuration = base['configuration']
     target_configuration = target['configuration']
 
@@ -165,7 +166,11 @@ def can_be_compared(logger, base, target):
             logger.debug(f"Enriching {target_configuration['STARTTIME']} with {guess}")
             target_configuration['OESELFTEST_METADATA'] = guess
 
-    return metadata_matches(base_configuration, target_configuration) \
+    # Test runs with LTP results in should only be compared with other runs with LTP tests in them
+    if base_configuration.get('TEST_TYPE') == 'runtime' and any(result.startswith("ltpresult") for result in base['result']):
+        ret = target_configuration.get('TEST_TYPE') == 'runtime' and any(result.startswith("ltpresult") for result in target['result'])
+
+    return ret and metadata_matches(base_configuration, target_configuration) \
         and machine_matches(base_configuration, target_configuration)
 
 
-- 
2.37.2


