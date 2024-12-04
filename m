Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC696E7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:36:56 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.25161.1733344612498183070
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:36:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WP3ikZjm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7256a7a3d98so219024b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733344612; x=1733949412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+NwRdnPeGyLdeW8vUheYvwrmmGsNozJQ75TO2JAWes=;
        b=WP3ikZjmIFbj+YJpbpctia6jQiwuhrknnVwPOfbhBMLi8ul8stIDbWLe9XdNtryoz0
         QePyVjYd0J/uEvgiclRzHXSXo+i/mQgxIHveR8aEDzbPYcxWqtpDzB4MufnLqmr1o2mC
         96R/yXtIFENzblz9WWosxUhFNHCCmrixZrbQxP2qZIiYXo5aL69FgFTePCPIdaKjeHCU
         C6xobPHormoTVqm7tGnhv/xZZ3BRAMC5IzEeBSzB/OytRiIPU/7t+rMdeSM7oL62jRrk
         SwNQqQD69UB10+La9gCa50EZtOQPWunKUkShHhOYt2sm1NjBnUCU3ScZzMjCTNGFELlW
         ugwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733344612; x=1733949412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+NwRdnPeGyLdeW8vUheYvwrmmGsNozJQ75TO2JAWes=;
        b=dMxOFzRRM4C7ZPz7kITFxg/Tqzyg3oP7GcfeErSamvv6aEapsbZFg7LWcBlLY/0I8Q
         m0kFNzkefKQae6k+caQ8W9sNFf6r/PJ+qdQVojIkt1BgxCzr3fYj87IKe1RBnbGPCEZU
         n5n7zU/DaY9/Yxp6n+wWrOEab6a+NJlstHAAFaq0DdifUwB74gaLvbgn/LEvnm3z0ccA
         pSQq5AKGhT7jgKJppG3OLLLjajm2GYpMGfg+z1/rRQ8QEccrYMDwXg6C4/m2eK1srt9n
         ULnf1O8vFajjz16xUlcfmn5tnld/IN3SxA/LV/QzRR7sxFnMbMZcnGDeXF7KMbrGIzH8
         we6g==
X-Gm-Message-State: AOJu0YxzxQb0p/MjUaOLhVUqnBKzn8X2+8aYIfDaDHhq+flC3biO0lzR
	8n5Z1KSVEpbZcD1w94/VLxDOOnSHJ1z2Ni2lwgmC98ZBof9RUr5gio1dVTtvzPBkOKCdxnK/c7Y
	t
X-Gm-Gg: ASbGncuhL+W4eIK3bKNNvcAYZ+Bxv/CXAATPdKIMRoUOTwL5jr0QgsbulaKm4hneF2S
	TX7WTQNteqJOhD9hZFCXHBZSo3wruAmlLXsvFNCTLQfx3YnoU/B4MMIZiraXvcdxHPuETocuOcf
	RF3oRRBgHdTh6X1WeaeL16hSuvQB7A0ixjzigKWhQXaSfPJU2DpFu2N0s3GLueSeoBtQY8wyXy0
	gvWkuaXrTlte1UDEUEfQ0SLMoyNOBBvnOFNqtM=
X-Google-Smtp-Source: AGHT+IHMRhDbN7wkjuMuETjIQuQguX93YupkdGXScqRJB5kTW+pC5x8fhwtfn28oIsG0XJ5Tt3i+pQ==
X-Received: by 2002:a05:6a00:2302:b0:725:9608:67c0 with SMTP id d2e1a72fcca58-72596086deamr3059745b3a.25.1733344611811;
        Wed, 04 Dec 2024 12:36:51 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176f3d7sm12827805b3a.55.2024.12.04.12.36.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:36:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/15] resulttool: Improve repo layout for oeselftest results
Date: Wed,  4 Dec 2024 12:36:22 -0800
Message-Id: <92cb4641ff4ec8c1f681bca21cfeaf2ba6923ab7.1733344462.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733344462.git.steve@sakoman.com>
References: <cover.1733344462.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208343

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Having all oe-selftest results on top of each other results in a large 640MB
json file which is hard to use. Split the results out per machine and test type.

This also stops the toolchain raw logs from overwriting each other meaning more
than one MACHINE is preserved.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4b890f04bc7d147b4a11b824a84f3d2abd75ac54)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/resulttool/resultutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 760e426de0..b8fc79a6ac 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -34,7 +34,7 @@ regression_map = {
     "manual": ['TEST_TYPE', 'TEST_MODULE', 'IMAGE_BASENAME', 'MACHINE']
 }
 store_map = {
-    "oeselftest": ['TEST_TYPE'],
+    "oeselftest": ['TEST_TYPE', 'TESTSERIES', 'MACHINE'],
     "runtime": ['TEST_TYPE', 'DISTRO', 'MACHINE', 'IMAGE_BASENAME'],
     "sdk": ['TEST_TYPE', 'MACHINE', 'SDKMACHINE', 'IMAGE_BASENAME'],
     "sdkext": ['TEST_TYPE', 'MACHINE', 'SDKMACHINE', 'IMAGE_BASENAME'],
-- 
2.34.1


