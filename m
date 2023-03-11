Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFD8C76195
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 00:27:32 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.35733.1678494448660842247
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 16:27:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L6B0rCd8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id f11so6545319wrv.8
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 16:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678494447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TvNxnvf7oYwpHvBVoRnxM0ld2rETFQgJxHH6zT6jBg=;
        b=L6B0rCd8g4YdGk5BwcBimBlqN52VgROdL79bHXZomZIaUpNBHA947g3YEN3BuuKRQJ
         hahTXB5p0wkDu7/HJ9EHf0XEGdkxLw/UmtjAo/j/dp2llSXDScBIeYgxgZL6+kVlIBAu
         SzGD2sP3WikKT0oIKdIJFwRABP39P5fEL/hqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678494447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TvNxnvf7oYwpHvBVoRnxM0ld2rETFQgJxHH6zT6jBg=;
        b=PD94h56ik7YIUeudg3fqw36lxMz1f5ewZO3z2DT24+BkU0HYBj0xVBImqDLZEUAy6N
         SJC2ol08gJ1KBLOhujy+G2IbCLIMP9ir7ROx7gK9LlL8ZFwRtvudxK5P6NTFMTvG0tZ/
         FVAbR3HNq7R66Lxk9WXLF8RjEs/ghP00R7pp7FE6nJum1cCNbm3gML04q19e4i26vrnJ
         RfoQSEGLGV64iiDusIR51r/1FAI5VV8Gv2r95iREdfeS+XMkec34tC7IQn2nhVF9TzkO
         iLmcIhxTzqMfIHpReAYYNM5YERhPn0LO4JstfKwYHrjtvqgskA8KMNj9hWfzzD42neab
         PLLw==
X-Gm-Message-State: AO0yUKUgSI1Hz71Rc5eRXu3tka3I9ds2sYn1GbVDFsHQtX4NKUM6v5q8
	ucWxB/BJ3R7DDMFJFRtugyIfo/avK0mIiXI5cvE=
X-Google-Smtp-Source: AK7set/mXgrbTOa74OZNjRxJ2wFZZHYgMdKZLkOFf5DidUTuokYh4X/3NfuKjX6TgsoXublAV+eCkw==
X-Received: by 2002:a5d:5608:0:b0:2ce:9fd8:8e6d with SMTP id l8-20020a5d5608000000b002ce9fd88e6dmr538250wrv.8.1678494447004;
        Fri, 10 Mar 2023 16:27:27 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d400f000000b002cea299a575sm291736wrp.101.2023.03.10.16.27.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 16:27:26 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/16] m4: Add missing ptest dependency
Date: Sat, 11 Mar 2023 00:27:12 +0000
Message-Id: <20230311002722.3211118-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
References: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 00:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178350

Some of the ptests fail in a minimal image. Add the missing gconv
dependency needed to allow those tests to pass.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/m4/m4-1.4.19.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/m4/m4-1.4.19.inc b/meta/recipes-devtools/m4/m4-1.4.19.inc
index fd3efa54692..3b4303b7fd8 100644
--- a/meta/recipes-devtools/m4/m4-1.4.19.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.19.inc
@@ -57,6 +57,7 @@ RDEPENDS:${PN}-ptest += "make coreutils diffutils bash"
 RDEPENDS:${PN}-ptest:append:libc-glibc = "\
      locale-base-fr-fr \
      locale-base-fr-fr.iso-8859-1 \
+     glibc-gconv-iso8859-1 \
 "
 
 INSANE_SKIP:${PN}-ptest += "ldflags"
-- 
2.38.1


