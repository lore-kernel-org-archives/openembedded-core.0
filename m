Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F84C52D73
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 12:12:39 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.31819.1723032755899434064
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 05:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bCmN7p5j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52efba36802so2659837e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 05:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723032754; x=1723637554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=588kZpX0bEJVODZUtQe8w/wGop8y56VF9+0tqmq4ZDE=;
        b=bCmN7p5jkEyUqMrMS2KnJHWWQKx5OIBL9nu1qOOzIH2N/am7rqAMfugkV1FDTkOf09
         t8tbUgI/+LpzctcF0hHkwGiiq1gOkV8HzY7pbiLrKr/G2rmQTrj/9iQMTKXk7SUzn3j9
         lEwroMz8zUbPUaC+Tebr9ehO1EiDJFEQcqBnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723032754; x=1723637554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=588kZpX0bEJVODZUtQe8w/wGop8y56VF9+0tqmq4ZDE=;
        b=G9ewTsJ02s0qRtMBhnJ+M1TwI+g4QVS57mRI4OWui5eGyRqeSrsoCUVYr+JfcLfb24
         iDbiW8EcuyAxptEkBf5e7/5ohuhOdJj7Fw3AbyeQZ5Bp+beO24d7DTJLGngCbSuBTiuT
         nlCrCPjCFKOxTCqHvNczKvZZcnwYPUbcAUv+vRyPLcyFQbGCae7opXne22neP5VXE7CA
         /MmPkiQosI4sVzO9Ty+S3dGigBbUSypAmxp7BkzpezP+RhKzk9YR3GXzBAFsOdAWpIc9
         4y4MspgxA2qNhTO6ejHT4zAGUbuT/jh60Lnv7oRrJYiKpoR/WQawO4Y3NDeQwrzzcf23
         +FFw==
X-Gm-Message-State: AOJu0Yzw9DFKc6askpwbUz0oDYINOw00OeR+Vx3Y2LMAjq0pucwGeqND
	1+xJX7uHUr/2BJPt2tcWwB0L44YF5aRZEbX9ivL2DoR31d3sf+m7CvoQciggMFiFy0YK6CXCJkJ
	/J+s=
X-Google-Smtp-Source: AGHT+IGjsD81N5TUArvPpLeiwVMPP4LFPNtOwav9T8hrqfC4ccGfSq0I3rMBnsdDLm3S2JWzudwLLQ==
X-Received: by 2002:a05:6512:3403:b0:52c:e133:7b2e with SMTP id 2adb3069b0e04-530bb381ce4mr14393287e87.35.1723032753486;
        Wed, 07 Aug 2024 05:12:33 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1ff8:c4ec:1a07:92b6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbcf0de1csm15941697f8f.4.2024.08.07.05.12.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 05:12:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] m4: Drop ptest INSANE_SKIPs
Date: Wed,  7 Aug 2024 13:12:29 +0100
Message-ID: <20240807121230.185087-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807121230.185087-1-richard.purdie@linuxfoundation.org>
References: <20240807121230.185087-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 12:12:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203068

In my local testing there are now no QA issues from this recipe so we can drop
the ptest INSANE_SKIPs.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/m4/m4-1.4.19.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/m4/m4-1.4.19.inc b/meta/recipes-devtools/m4/m4-1.4.19.inc
index fcc9e582701..1d1f1eb477a 100644
--- a/meta/recipes-devtools/m4/m4-1.4.19.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.19.inc
@@ -62,6 +62,3 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = "\
      glibc-gconv-iso8859-1 \
 "
 
-INSANE_SKIP:${PN}-ptest += "ldflags"
-INSANE_SKIP:${PN}-ptest += "rpaths"
-

