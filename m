Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B565E77199
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:41:37 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.5393.1735810890776255913
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:41:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EgkDScM1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436281c8a38so80015615e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 01:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735810888; x=1736415688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T1QJbU2lRIzWRBqZ4HADWTRKmgOUp3Ai92LPPCKtxH0=;
        b=EgkDScM1UM4y/GZSy92GLZG97Rqy0EbpZm76s0HL4UKqT4Cx+P6irro7zMaCNvehz1
         j+HuLHrj9nWQQGbScGj6R2HZWJYJPCRzl7oa7dRHaPVz8ujCDTZO9VXp5Qu3Yq2qACIR
         gyStkbKOH5Dq1zvwrx+oPXCZ4nueNGDHIjmqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810888; x=1736415688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1QJbU2lRIzWRBqZ4HADWTRKmgOUp3Ai92LPPCKtxH0=;
        b=PIOZygXZdtsfndKTCKdQzlv2tqcJmiVV6kY5fzwEXj7Lrx+sJXGL8T1/78uDgpGDGe
         KLGJdtV0G0PGwKp/wOLK1/ckyWOyYsPFxnIQYNfn0J3uPaBV2R+3xisU8Ut4eYmr3va7
         jkBAM45+dl2cuar/Q+swqR0oCgJkerBACn96hEoqcyM9NkRRboZojqechXrZQN1q2BfR
         NPQ75c3k4qh8WBce2094NSTBEGMux2bdG6AM0Rxcz3fWzS+M7Qp48Ae4EK6vEq4FFsZh
         NvqirDVwy5Ql/NiUZdfQ57+TFcZDUDlbVPytD7H6JLZUg7sYSkDBk82pp9x47xxCnFNR
         9uyQ==
X-Gm-Message-State: AOJu0YwE1DmW7II0ev97pLKmcVD44YL5entvG4fkwtVvyycSY3Ns5gfC
	wyfoH93ogXzZxg2M4+xOzDeEbRZfRiSM/zN1u7Ns96RBC4+ZTFkhhu8bGmpp7/7ihw2GBUWAM2c
	3x/Y=
X-Gm-Gg: ASbGnctzXt19Xax1W+b9rRFUSbhnjujkv6egCQLXwPgRmVUJhCyUUGFe5yVATfFIBLJ
	fyF3A98kTHdXL9CpWosG0s3Quy6mVVK2jL4rKnXbuYPM54xXgxBxEW2iqn1WbJd/srNioO+1CN0
	Xwa3fi/Hm8cUuf1o6WitfQIOEW4EoK//df7F8bQ5EbJU1jMTnwWfyPqUg3irbMPdCLQQpR9k4oR
	P96apkCbcjdxvk4cZJlTvdH5z4vHVP6tSfqtJcs0+ljrunkXOIU9wahCDLBzpzd5iQvSXf67l3G
	iUIizeCIKg==
X-Google-Smtp-Source: AGHT+IE3kf5LyCFdLOF0VMTzN+LgN/Jwscy64I1b8iQKrvNs/49wnpU+fSdrPuoK6BRYL8TJ7l1iyA==
X-Received: by 2002:a05:600c:350b:b0:434:f8e5:1bb with SMTP id 5b1f17b1804b1-436686430a2mr402080655e9.12.1735810888483;
        Thu, 02 Jan 2025 01:41:28 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ae2e:9f02:55c2:739d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119ccsm479785625e9.24.2025.01.02.01.41.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 01:41:27 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 19/21] python3-urllib3: upgrade 2.2.3 -> 2.3.0
Date: Thu,  2 Jan 2025 09:40:50 +0000
Message-ID: <20250102094059.322187-19-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
References: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 09:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209279

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-urllib3_2.2.3.bb => python3-urllib3_2.3.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.2.3.bb => python3-urllib3_2.3.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb b/meta/recipes-devtools/python/python3-urllib3_2.3.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-urllib3_2.2.3.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.3.0.bb
index 35b0786fbac..fe913e6b73c 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.2.3.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/urllib3/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "e7d814a81dad81e6caf2ec9fdedb284ecc9c73076b62654547cc64ccdcae26e9"
+SRC_URI[sha256sum] = "f8c5449b3cf0861679ce7e0503c7b44b5ec981bec0d1d3795a07f1ba96f0204d"
 
 inherit pypi python_hatchling
 

