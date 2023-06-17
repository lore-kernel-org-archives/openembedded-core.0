Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F89CEB64DB
	for <webhook@archiver.kernel.org>; Sat, 17 Jun 2023 10:51:04 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.3012.1686999056067884874
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Jun 2023 03:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=IhKpQBfT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-30e3caa6aa7so1391012f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Jun 2023 03:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686999054; x=1689591054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Kqz7ZMaB3XUyLqaglX20qtuVc8/HRLlQKFsLTEanfM=;
        b=IhKpQBfTn0kq1veihXg7Adfo3f0oPpmjLwpYAnOegKXJWda9+i3cQitaSGYnKLLMHB
         Y3LUXpgnc7P215moP+aV5XPD/5yoHgddYY3Jf+ypyJklLHHsqVIp0LBB4KlPv6TfO7t0
         d2tdvQn9MVVi7cjuPt4gALzUs6QLFFe6cY1FA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686999054; x=1689591054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Kqz7ZMaB3XUyLqaglX20qtuVc8/HRLlQKFsLTEanfM=;
        b=CMenQjAcAlkRLcImBCT/C4QznI5yD2pMi83wjcU8Wd4z15lo9OmJCPoqcJEpKfALSr
         /UZFf0nqoAMsbgKT83RLA3MI3xD/ul0s5781FInwd/fD9/aPGUMWvyxS6c+rdOU0nXQR
         a1Zmw8N3olpJBR3r4u3XD6eG0788ojvFczho4EaJ6pJ1YLN2ZSHuw9fUjd2vZ3SfCvHI
         8IWs8uvzNsdRi15eo5t3gbcWMuuGV6vsMVn8Sm0wNYcsQPboz5JexhxdkTivjDelp+2D
         L2JcfvxT81kMCMWkanxA+Ud4y9lIR3OwQbHTBL6GYSxX5OI/jTUEfFopJkg2a11r6Ldo
         5tKA==
X-Gm-Message-State: AC+VfDywrYglMPHBAwjNaXy7dGSXTN+OPiPce9IK/3bpsdRG1bOSLNvh
	IzKW9/eTbgxb4PxvO5hNo7hrLQlyNjL36Qi58s4=
X-Google-Smtp-Source: ACHHUZ4+qF5JyXPimkch0APsKU3doiPLB9KBdpIf9QtK/MPjPhFA1WBToYnldFY1xLIXyC/ylwCuRg==
X-Received: by 2002:adf:e910:0:b0:30a:d8f3:3e41 with SMTP id f16-20020adfe910000000b0030ad8f33e41mr3530026wrm.7.1686999053947;
        Sat, 17 Jun 2023 03:50:53 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:aef2:b866:ac5f:df45])
        by smtp.gmail.com with ESMTPSA id n6-20020a5d6b86000000b003111cbd8009sm4641065wrx.97.2023.06.17.03.50.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 03:50:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] testimage: Only note missing target directories, don't warn
Date: Sat, 17 Jun 2023 11:50:52 +0100
Message-Id: <20230617105052.1941482-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Jun 2023 10:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183054

We don't need to see warnings for missing target debug directories. Just
show a note in the logs instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/testimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 765184c1800..0f02eadf573 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -212,7 +212,7 @@ def get_artifacts_list(target, raw_list):
                 raise Exception()
             result += output.split()
         except:
-            bb.warn(f"No file/directory matching path {raw_path}")
+            bb.note(f"No file/directory matching path {raw_path}")
 
     return result
 
-- 
2.39.2


