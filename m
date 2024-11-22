Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01921E69176
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 16:23:57 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.28288.1732292633184899107
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 08:23:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dT3ABtgj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43169902057so19994735e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 08:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732292631; x=1732897431; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MkR0XJj424CkRmIubfWa8Kfjsh/Ssz2uXeVZLr7q7ws=;
        b=dT3ABtgjEO/79bzCoka036SQ52day8I8RJAhpmzGNTecP+DWeUOC/Oe6OiLR5AbA0J
         D+J240nWbxs13joFha+Z9oTiqCpNQeQYiXly/qsahz5kdKxHPHYfsmalLZstIzdkeQT5
         JSBST9FgIWJaCjjX5BkSiLG/Rehapp66Chco8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732292631; x=1732897431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MkR0XJj424CkRmIubfWa8Kfjsh/Ssz2uXeVZLr7q7ws=;
        b=Q+gpfBFc/W7dWmtxBN5LNTjNzsvGKFxPlWOhHKXIi5I6H048/734c8u3PFJqUgGpa8
         x1P82ZttIZ4a1PC+XPMB6PzuVIMm1qfclIZiFuR4r+1vNmv8w8WMY8mhlunkiGN9WtG5
         W96RZ/4wjqQ7EKylIS9V/ympgRvshGOgJ9Xdf5+wGVs+LxcgGPNTc+uoBBmDpwSfTcmG
         Nh3yJ14BHC53QrZ9lD5bF3CERFgBm1C8/o7oOBce8rbHG5ehTIsajPm6v1mDIqFeokZM
         sbth5iBixyEcIFvkh2pVvBdAr6QKFnPT3KUNKdufnRtHUOe6m1jEVNfouHh4KGbOd03S
         mggQ==
X-Gm-Message-State: AOJu0YzEj/CgBxP8b41jxAysISAA0tIXyMCSA9hw5iXaiyeuTYu9TQiO
	a0nMB8MBySB8IcwAWzGctMjHfgHVTAWGezok+gt6rJaQs1/nHuxXjz2P6FTnuaVYZC0nBP+5KV7
	G
X-Gm-Gg: ASbGncv7li07dLhbKCSuGITi79aboswtJN0ds0O+PCfSMoA/iXAHD92JRR5LkRSasSD
	DRlqefu3EVZOHjF1x5uGSXWLX/uRfC3PzpV0MbnZ6MWVZLjOrV3Nn+CC6+06U3Mmp4DUzxVK2Ro
	rLN59mgeqpgDJGKYaireFLslQLgIUBveTI2yv0lb4rFNe3F01MSYws37mgTjsJD5p5z7RLosjn6
	3jJ9BfUuQvA4KUQk3lDcozsFTALEDjjIHfm7HRIaDfJFM7yfws/u/9I98e7DesZ4hj+43rP1P7M
	QEM=
X-Google-Smtp-Source: AGHT+IH3EDnfCRG7FEq+F5BCB7vuOtq9hWIGdKUtyRra2gp4CaQE3/FXKydNChnYQ7ePotKBsjKlxw==
X-Received: by 2002:a05:600c:4684:b0:42c:ae30:fc4d with SMTP id 5b1f17b1804b1-433ce417fa7mr28899135e9.7.1732292631245;
        Fri, 22 Nov 2024 08:23:51 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:87e7:ee61:98f2:6cd2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b45d4dd6sm100686595e9.24.2024.11.22.08.23.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 08:23:50 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] resulttool: Improve repo layout for oeselftest results
Date: Fri, 22 Nov 2024 16:23:40 +0000
Message-ID: <20241122162340.2770780-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241122162340.2770780-1-richard.purdie@linuxfoundation.org>
References: <20241122162340.2770780-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 16:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207636

Having all oe-selftest results on top of each other results in a large 640MB
json file which is hard to use. Split the results out per machine and test type.

This also stops the toolchain raw logs from overwriting each other meaning more
than one MACHINE is preserved.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/resulttool/resultutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 760e426de0c..b8fc79a6acd 100644
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

