Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB3C8C3ABB9
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 09:06:35 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.46258.1746435992098780080
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 02:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ET52nxym;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-223fb0f619dso47883225ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 02:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746435991; x=1747040791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNzhkZxgprF8meM67E04MxVitR+DqzMECL2R0fXMy9E=;
        b=ET52nxymsj/Eloe3e9Jhu6RVmGjkrTamaIFEmsU15FR5pHonTcUM7uCBMMzPuloz4h
         fO4tInN0oPeCGdnegG7zoTQmN6DV0zkbM69F0RvYZDIsM+b6ANabvXk4tDJgZZnnwarX
         GeRxP1Zoy7Ge4n1xqJ/UW0jzgwlx7/gPdjhd+0pKOXyu3/L5/FefFcSsKuY4Q/1h8VtE
         wzUep74YbRrcuP4yKQgUGjZsFWBHIPbs5hvPzRD1oVICnZX+dPjdogZlnWap4eBHfcpM
         evXhd1VwVhWhLynPNK+DMCWnP80+uSYEc3OGW0m5SFq/zGKJ/K4QD9Po3VeSLp9Y0Jmb
         HXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746435991; x=1747040791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNzhkZxgprF8meM67E04MxVitR+DqzMECL2R0fXMy9E=;
        b=t0L541cJhw23ia48nX5qh9+R3nAEuJe0/c7YTavLDNSxCpeuU81x2L+7fAooLqpL4R
         syEkoauqN30rOwhXOSq2afpACyu6XcfSfReGXrm4PORHj0afqozzZmHB58eODUnSHsXS
         YTa9W9I78F9nMBzPAROaVHnsZdNchh8Y+mv1O8JMbsHjXyVcSWZl2oRZlZ792dCFg7+M
         R/ch0sw9K6WxiDg7FENYvB3DURQ1vfcz4hnWi1xOdGv5S9OLFWzB9avOARTS1Lx2sfS8
         vBQNuzAL77nf1oPcEtofHI9cVKXSoFSQxXKsWtxNFv+C/kng+98w/OA/kEMtezVpRS3K
         FldQ==
X-Gm-Message-State: AOJu0YwqcctE/q4czSNJK9j672oyh0mSTwwMyd2WlpFPkrHEBpX3xTBG
	siLzKarTrb2zwGPWKoJZEbtnAoLcuJ3nGZa95MKYpXMKeJkZBndFyCftZw==
X-Gm-Gg: ASbGncscT3CJiU1A1XUPo4fwOTa5bPll4YHcS8kYI1ePLuRBtGAV9FG1MOvuDg3Dexw
	Ysnn6xAQbjWwqOPE+pgFWp3+oA0CUaoSJWd/BDqC83SgJ/q283AERioJBU2HNFA8SkpRFr/0cHH
	+PdcqdTs24wrXBhDPgowYtHayFXhChoMcPRVH8MWly3sP4TXtNbVdDd8c2GGwYQbTfas5DYKzJN
	BMG7WxPx3fjLRL3D18k76UQaBmmGk82wwrZJNmdfIRAXtcYtzpkw2mW/iwo7W8j8nAB4gk3GFTz
	6tmX5PO4VH4cvCOVy/s4fY3cFFpVYYe+3o3N/s8u4dHq5yrcT9Sj
X-Google-Smtp-Source: AGHT+IF904dvLs9NZpbZq7zL/bmJp7IDySXvD00nEdzgL4NxqHNYIn1g6LXYX+2LD1iKVMYMZNujyw==
X-Received: by 2002:a17:902:cece:b0:223:4537:65b1 with SMTP id d9443c01a7336-22e103571bcmr195338965ad.36.1746435991318;
        Mon, 05 May 2025 02:06:31 -0700 (PDT)
Received: from MVIN00210.. ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e152290efsm49698595ad.190.2025.05.05.02.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 02:06:31 -0700 (PDT)
From: Ashish Mishra <emailaddress.ashish@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: henning@itconsulting-heinold.de,
	otavio@ossystems.com.br,
	Ashish Mishra <emailaddress.ashish@gmail.com>
Subject: [meta-java][PATCH 3/4] Updates the SRC_URI for avalon-framework-api recipe
Date: Mon,  5 May 2025 14:36:12 +0530
Message-ID: <20250505090613.818330-4-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505090613.818330-1-emailaddress.ashish@gmail.com>
References: <20250505090613.818330-1-emailaddress.ashish@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 09:06:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215999

Signed-off-by: Ashish Mishra <emailaddress.ashish@gmail.com>
---
 recipes-core/jakarta-libs/avalon-framework-api_4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb b/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
index 081cfe7..e7b4d55 100644
--- a/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
+++ b/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 PR = "r1"
 
 SRC_URI = " \
-	   http://archive.apache.org/dist/excalibur/avalon-framework/source/${BP}-src.tar.gz;name=archive \
+           https://archive.apache.org/dist/excalibur/excalibur-framework/source/${BP}-src.tar.gz;name=archive \
 	   http://archive.apache.org/dist/avalon/logkit/source/logkit-1.2.2-src.tar.gz;name=logkit \
 	  "
 

