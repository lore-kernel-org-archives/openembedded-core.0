Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F7D3C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 16:16:40 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.798.1708100190904276971
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 08:16:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nl1hrFC8;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso1862684a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 08:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708100190; x=1708704990; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FFKmH5DTfcgMdYrrQv5b7ycHbr619omXQSEaMSE5UA=;
        b=Nl1hrFC8XNlyJrZYqBUUHIN9pzNrmjvk0aEHfuqw5geuwFX0dsStbSA5GbwDj9MmvD
         qzONOxCramwUOoUv09trODQEl7Q9bnogtLxGa7KgoaljnzDTxZGEy03ZfmnxfgpZL355
         Br/5q8YpJI+/zgc3sKR8eBJkViIm2LsBDQF59Mikk/xHWIQuiHjQWH3I3miLaSrIvxZ0
         vnvsFjUIPYRQPtSldNg7c6m2qv+V+c98myOFt8eswJzqy4r8RN/5yRDGfpoeNEVlcMbq
         TpTtE/CWj0SXdebr4d8i1rSfilivSTIYEwMOpsXJxMcVHeQ3yTHqnr7S9hdjgd9m5Go3
         PUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708100190; x=1708704990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FFKmH5DTfcgMdYrrQv5b7ycHbr619omXQSEaMSE5UA=;
        b=UaLcu/mhFEInoP8gxe88fY0dB92k300z/AQ/36eRnbH1cuZS/sN7/jjrxI8ggXrbUU
         oX14OzXaY4N0mCYWyAdaYC+JuBSVEx4B+4ubw/bL5zlY0Av1kiSwxzY9zB4b6J25eVMr
         Pk4cOj4cBUoXn959AWFCGKQfqPfnaW2Yk++Vbaq03CJxo/RHHCtDZ38to3BShVkfs0CF
         dzIFh7AserPosOAgN2bh8wk8i4h4lZ8P4C6h0zQZLgVXv6vsoQf2TL+Eod6GE2MLjutq
         MKORYnAJBHkWsTJVRqEvGaOWPJYIybyMNTSEJN9S4VZlbqPBJ/2g+j7WLmk8vM2UR0Nr
         0Vug==
X-Gm-Message-State: AOJu0YxsbtdYgsJLXQWBkQrTukcd0oUT8ot/TYGDQaEx4GGnEn8bCkpw
	omXcpoeWHVPYWT4DHUXIOTqoKolY7jxyeS/r+dkdZWoZybI6qIaZJYJo3gXa
X-Google-Smtp-Source: AGHT+IHLGOvqL8dX/Ddx6h/8EXLzxXFfwSE1ax9NjPRxzKsw8FR3F3/fIS1vdIEY5vIkINZITIngFw==
X-Received: by 2002:a17:90b:1017:b0:299:3236:734 with SMTP id gm23-20020a17090b101700b0029932360734mr2510648pjb.42.1708100189998;
        Fri, 16 Feb 2024 08:16:29 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:ef9e:327e:12eb:73bf])
        by smtp.gmail.com with ESMTPSA id w3-20020a17090a528300b002990d91d31dsm198925pjh.15.2024.02.16.08.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 08:16:29 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/2] python3-pytest: upgrade 7.4.4 -> 8.0.0
Date: Fri, 16 Feb 2024 08:15:54 -0800
Message-Id: <20240216161553.3217554-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216161553.3217554-1-tim.orling@konsulko.com>
References: <20240216161553.3217554-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195778

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
#11842: Properly escape the reason of a skip mark when writing JUnit XML files.
#11861: Avoid microsecond exceeds 1_000_000 when using log-date-format with
 %f specifier, which might cause the test suite to crash.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-pytest_7.4.4.bb => python3-pytest_8.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_7.4.4.bb => python3-pytest_8.0.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.4.4.bb b/meta/recipes-devtools/python/python3-pytest_8.0.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pytest_7.4.4.bb
rename to meta/recipes-devtools/python/python3-pytest_8.0.0.bb
index 18062c8fb85..994f6cbdaf5 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.4.4.bb
+++ b/meta/recipes-devtools/python/python3-pytest_8.0.0.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "2cf0005922c6ace4a3e2ec8b4080eb0d9753fdc93107415332f50ce9e7994280"
+SRC_URI[sha256sum] = "249b1b0864530ba251b7438274c4d251c58d868edaaec8762893ad4a0d71c36c"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


