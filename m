Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 048BDC52D7D
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 02:29:04 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.50960.1723084141549552917
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 19:29:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=c/wkq3eP;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2cdadce1a57so433152a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 19:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723084141; x=1723688941; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NtveZTAI3dqQV+FddKrid4zDPv/P5s/s91mVW5tL1Q=;
        b=c/wkq3ePCttTM7N78BFvnvqTaxkwYjxJm7lp26kcWV+V5WFz+VLJ5ehY3/YXPPH/tC
         JypZ2whmfZpPWwjhL/maE9a/LGHtwFl4bqUaGM/yjgWpezg+VUD8f3XPsLeFg1Skxoju
         gNTioiOfdDPv/q5MOEOTSv5cmdDCrmJwr/YkFXjVJ3SIaU5aJwTPg3Bn5QL95wDDc6Ff
         Ci5FbrTTxXDL5CRISLZ1VZdkdBVw5MKRf7EIHVj4xhi4J29UjqQL4KuERWZPGIIzP/oF
         pLet+CXrEONTnWWpk57/uwX1UClWYBW1oRmwYGq9MZgbnzVC5yzpcvEcBajZuLSSbesM
         zIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723084141; x=1723688941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NtveZTAI3dqQV+FddKrid4zDPv/P5s/s91mVW5tL1Q=;
        b=XcZJ1oNWfiUV4K7MN4ArqiRD+vQsQvvyGWXo0H/k5iwmtNtWdMs8Q7DSVFFokP+9Z5
         3jZxs/Ejn/iBTLu/mhu6YVtjaEf3MrjvSCoLLEE+qJiZS4tEBKXtc09b5qnWIXBMDZpa
         t8MJue8WHlD356h/z7eyX0ksWyT5eXXZccFH0aC1uCyyDctWft3LDJxdN83aWP3b2T3r
         ymjAWlXEEdK2QU9do1/OGSL9QrXScfZ42M7thca2ozgpsT/oFhaGS9v1llMjYecj4Dhn
         Vjwiw1Yp+U4Dy5GyFW4QOv7Bkb07Q5ve/oZcymj6QzhvemZVlRZvpb6X6ScWp17WXEom
         XgJw==
X-Gm-Message-State: AOJu0YxBDObIsfrAvQ+yItDKk0LPAo9PTsQ5W9ZuBPDwk7jHedCQsK6v
	/0hB/fzheJJVa8NBltOWd22s7G4GvkPXDpGjVMBWIXoKheOxDkCVhXPGmKn9abhi1rOoTqIGNcX
	CuiU=
X-Google-Smtp-Source: AGHT+IHY1mS4SAQNWwnhGizDIuwPHiLP1D1aGYvCxrWQ4qXQcRvruGiVSUpr5gRR3XCyRy2DlyiQWQ==
X-Received: by 2002:a17:90a:fd93:b0:2cb:5134:562a with SMTP id 98e67ed59e1d1-2d1c336ef54mr607009a91.7.1723084140892;
        Wed, 07 Aug 2024 19:29:00 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b3b0c796sm2269198a91.33.2024.08.07.19.29.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 19:29:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/10] nasm: Upgrade 2.16.01 -> 2.16.03
Date: Wed,  7 Aug 2024 19:28:41 -0700
Message-Id: <5b330f3dfe7a37eff5251d2c29d324e90677b33c.1723083840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723083840.git.steve@sakoman.com>
References: <cover.1723083840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 02:29:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203105

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Removes CVE-2022-46456 from reports.

(From OE-Core rev: 4a5b6e8dd315b2281afb232410db585d431be00f)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/nasm/{nasm_2.16.01.bb => nasm_2.16.03.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/nasm/{nasm_2.16.01.bb => nasm_2.16.03.bb} (88%)

diff --git a/meta/recipes-devtools/nasm/nasm_2.16.01.bb b/meta/recipes-devtools/nasm/nasm_2.16.03.bb
similarity index 88%
rename from meta/recipes-devtools/nasm/nasm_2.16.01.bb
rename to meta/recipes-devtools/nasm/nasm_2.16.03.bb
index 219cc49360..281f3940e7 100644
--- a/meta/recipes-devtools/nasm/nasm_2.16.01.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.16.03.bb
@@ -10,7 +10,7 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0002-Add-debug-prefix-map-option.patch \
            "
 
-SRC_URI[sha256sum] = "35b6ad2ee048d41c4779f073f3efca7762a822b7d2d4ef4e8df24cf65747bb2e"
+SRC_URI[sha256sum] = "bef3de159bcd61adf98bb7cc87ee9046e944644ad76b7633f18ab063edb29e57"
 
 EXTRA_AUTORECONF:append = " -I autoconf/m4"
 
-- 
2.34.1


