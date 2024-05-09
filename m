Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84833C10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 20:21:24 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.1795.1715286076501373922
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 13:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hohch3tl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41ebcf01013so7550295e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 13:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715286074; x=1715890874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wv0HVPJpb5vbjK/xZGez4S1e+GMnb+ZFW/1jHwB+mpU=;
        b=Hohch3tlqa3sH++fAmdrI6xX6LZp514eY0L2LawgUdbs1DR7tH3M6XldOAZrPjzkmF
         AveAsfvLdMEv+iCqovBrs8gbfMtQEUxOsLFkwfsp0UHWBS9CB2N6j819rMw1qNquYYS0
         lVChBVrRMNbvStVvhbLDG/PjFR8ozOpC7C+Cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715286074; x=1715890874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wv0HVPJpb5vbjK/xZGez4S1e+GMnb+ZFW/1jHwB+mpU=;
        b=dxaLwnxHKUL+hsjwBofDu99wGSaZ+g6jy+qNNVUH5aMjx2eitEMXenrjFIRg/UFi4J
         M1te3c3ulBs/5WU8RN418+OWKpQrQYFwc2d+aJI6rqPq3HPwZ24BEdyDJnkpZW2kD0ds
         GLjf+gdkeFaF79NEJL3hK2PLQDvL+isgdrIQPad/4otLo595DUHB/Dua+Pf5FMgptKRt
         pKA2tyMxivUZnRnHP8qv2GP7/IKp69UF63VM5xE7Jv3/qjD/RBI0+4d/AZsKUu7rwz4j
         +LUGnFNd65aNneDJ2FlIvOCUginv9Z5RZvm0qLgSKJYWxqVaYAmbZaU9QconUeucBDUk
         fnVg==
X-Gm-Message-State: AOJu0YwZXR7ScU+XL6nXrUkx2vlsqPCsq1gl5ZIMT6I8ZGap+M2J2qbX
	hntAxn++n2ea1t4MTYxwIv8q7HT4cS9D9p1B9lKg0WqUn8pI935gQKPRBpbfmw7yj5drCDF+CN5
	+qwM=
X-Google-Smtp-Source: AGHT+IGj3BcPKfHLkqswCGL87EnS+KIBNq0DiX9lfI2EvxHiGSFly0YA/aQfLiabQTX91VFDiI8jRw==
X-Received: by 2002:a05:600c:1f8d:b0:41b:4506:9fd with SMTP id 5b1f17b1804b1-41feaa2fdc1mr5637445e9.6.1715286074239;
        Thu, 09 May 2024 13:21:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bbe2:a647:8a36:3a80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fdcdd5788sm22715325e9.13.2024.05.09.13.21.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 13:21:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] insane: Fix case where S doesn't exist
Date: Thu,  9 May 2024 21:21:11 +0100
Message-Id: <20240509202111.3959830-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 20:21:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199183

If S doesn't exist, do_qa_patch would fail. Fix the code to not fail
in this situation.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index c32dfffd836..03ac06b102f 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1399,7 +1399,7 @@ python do_qa_patch() {
         oe.qa.handle_error("unimplemented-ptest", "%s: autotools-based tests detected" % d.getVar('PN'), d)
 
     # Last resort, detect a test directory in sources
-    elif any(filename.lower() in ["test", "tests"] for filename in os.listdir(srcdir)):
+    elif os.path.exists(srcdir) and any(filename.lower() in ["test", "tests"] for filename in os.listdir(srcdir)):
         oe.qa.handle_error("unimplemented-ptest", "%s: test subdirectory detected" % d.getVar('PN'), d)
 
     oe.qa.exit_if_errors(d)
-- 
2.40.1


