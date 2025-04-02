Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF0EC28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:11:47 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.2264.1743577905286025444
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e7RQacos;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4394036c0efso43003275e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577903; x=1744182703; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hxRBFGxW2d9vVloJGMeTCweZ+ZVYeZxm9KrM4UbCQpY=;
        b=e7RQacosI/J3QyLnIpI5GUcXAKGg322hshML/bzval5HVJ/5oLXp6ACdK7If7nvj07
         OLQKVxGQsGqEUbt3cXTIg1tKwlQ5/0XVDBzdTAEwKLTn8dQO2mhiRVyJdO9leljWrcoI
         ggxTuWXKX6WGZFCtGPk3S0K6H+1DYQWvoz9tM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577903; x=1744182703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxRBFGxW2d9vVloJGMeTCweZ+ZVYeZxm9KrM4UbCQpY=;
        b=LDGt6G50Ch4vWxokwVAMzblDuExYismbdeDjELzgX7JVhMz2OOExJOoNGY1+sLh9jr
         jTSIFDqlLzzswvVov53W6jFahWa4IinfH/NP1VS2dhT1nEBjG5ZSJLurFc+TcbRzaq8D
         9SPXrMdiWr3H4UZzAWAA/IyM1BiNVncvtCJJ2jeYyXx5mnHNSO+jm+X4NUq7b2F0fFbY
         ULxxxQT1gKqAMZLVDZ3WPScJimQI1HQMDaGgp68tGNmcjOgUE9899+13xkda7nPc1/NI
         OjbC5pi1JbPx7lQKNLj1VyaCEYiErARie0ekPowlPeCH4aTMT1TxkC25/EpgHlkL/ybO
         5Ryw==
X-Gm-Message-State: AOJu0YxlunWOezEL7eU1FUq2SbgIrSQXH82m6SVqi6tV2ZDFxdn40VrI
	yUWZgnof9Cn4nKNEjdC0eMO/OFz+mRkxkMZguPP9/Bymuq99sKCJ8eI6rckZlpWGtJzaMKA5AoK
	7
X-Gm-Gg: ASbGnct0oWFyt/KU8hgok7WKGsepVUj5Tmtsio+3+wGAtoqBD3SjTaT/+rc8NoIZVZC
	dcwrwSDy25ANnP5alSbJcdii20llBujI5hl/2fNvaJTLJoQL588V9nzGXDYU5ldGVuwYg9SpDqk
	tZYdDclARPAfhXLV6vp1FMivByZree8NH2tBztlG6NtU9FeqedAkN3MWcLMfIm4CZXGoKttMh0c
	HHB2GkeIo6HPx7DScVCyxbY0g8QYyipyoR4Vcfm8OKw8LD9ueLp6z1n9xAL5jUxYmQrpju+iiby
	amCbkWTohNvgasPSk8+dmP9qL6iZUcG162AwcwMAiSlsC0/jzdqsWNHA+FgV+zPQjjmXM77NI+x
	dQuPw4RTD
X-Google-Smtp-Source: AGHT+IG0b1gBMOv/btfaUV+wBLNQNWCmgXbdTY61X2HBEehzC2CZTKHthmwwjJzSdMMKowSJhDyBwA==
X-Received: by 2002:a05:600c:198c:b0:43c:fffc:786c with SMTP id 5b1f17b1804b1-43db628b89dmr118173685e9.19.1743577902977;
        Wed, 02 Apr 2025 00:11:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.11.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:11:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 33/48] python3-pyparsing: upgrade 3.2.1 -> 3.2.3
Date: Wed,  2 Apr 2025 08:10:02 +0100
Message-ID: <20250402071017.2157620-33-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214206

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-pyparsing_3.2.1.bb => python3-pyparsing_3.2.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.2.1.bb => python3-pyparsing_3.2.3.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.2.1.bb b/meta/recipes-devtools/python/python3-pyparsing_3.2.3.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pyparsing_3.2.1.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.2.3.bb
index ab4eba129a1..459b01fd947 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.2.1.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.2.3.bb
@@ -10,7 +10,7 @@ BUGTRACKER = "https://github.com/pyparsing/pyparsing/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[sha256sum] = "61980854fd66de3a90028d679a954d5f2623e83144b5afe5ee86f43d762e5f0a"
+SRC_URI[sha256sum] = "b9c13f1ab8b3b542f72e28f634bad4de758ab3ce4546e4301970ad6fa77c38be"
 
 inherit pypi python_flit_core
 

