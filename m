Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B63CD342E
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:31:03 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9396.1777739458546642621
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YDfjNGm4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso18890855e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739456; x=1778344256; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lwpEjayiPyFDKFP3RDoBfEuCdK+U8LGMEJ0ZYbuJUVE=;
        b=YDfjNGm4IYq2wSN+K5JjqhHyaYY0hxxVH4YveksNm2Avr2AQwN/7KJQUkqXIgUvK4n
         I6i3gJjKFa3gd2zUi6CIEO5laoqCaoPd3exE627nMc72VTAHdf2Al6PmUxVJar2z3psa
         Zm/25zvksPhnitiM/dAltiygj5KmTsJU/FKoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739456; x=1778344256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lwpEjayiPyFDKFP3RDoBfEuCdK+U8LGMEJ0ZYbuJUVE=;
        b=e7XYBwwAd1OHqHBxz0EpSJKLdVmnhZZDTMaynkFGZqTVI6ApnwzQujD4SsZSHMUVJI
         ILnCXzDfVBHRz0k374NqHwYNdmnljR3Vt4gEVkpIZwLMzJkzRK4SHcmwXewI5tq77orQ
         bLXN6oUYU1o+Fz2+oEU/oIphHd/3fyaU/Ftk7CUMfNWEXyKg2jzMQYGfWT+iuShjPsHR
         bPhcxVK/UTfFrf6RsIhXrBxVvn2E/nFY0EvbSgtdjTsu65vcQ7HbprGXm0HzWj13sgJc
         Cj7htrw/3nilgxvBJV8sQ2qZWjFnV6EGWQFRbv8j0OHJ/HuJrJjt/Jf4by5IoRs1+eTn
         9mLQ==
X-Gm-Message-State: AOJu0YzHka16IOu0wnnjDbcbvN9g1r1V825JJuwHajNazE2nRlmNYCUF
	ksa4cf74Wh3xJNlzub8n4sINx5u9mrKYhBgQh95TjZ7gMlpuxDF99GWDXALz314fFhUT0f/0P7h
	v1ZYQv5KHZo3+RR3tZsMChvQ/PHdqFG0rKzza9JBz3iyAy0PgKa5jaPzachnhmzUWXgOnaXG4yH
	8tJedcMLof28P1u0o=
X-Gm-Gg: AeBDievsm7+UBGgEYgk0FibHGLCAzAU/OxAVejXR7DplUQ8h0JuNLvRJAjxP84LX9nc
	JUc/mtymnhbnNtvQj55YtHlFevR7gJBrwUP0qEbGfWmfQAFmqD1Lllmgl9b4R7rrG6GchB1zTfN
	ud8MWpxPMGU3aeEQz6VxodqTImaBgmb5gAkD0YtrL5dCuVloeMA3Vq92cViiCf2ihUAVMmdhu/t
	WBzngLT1VepoER0PWHZEzD9ssJHR2+QIPaSdzgjQVg7pDcHwP3WA9tq8VXglu0dZ2xnjp9T/Ch/
	Z/NEhXjeR7t+wGFnCGDi8RfAZRHaRGc6FhNKqzqInHZ4meNf+Em2rlSFno3OxEVOQkZn2WPIe6H
	DTGW/IfVPQXh0rqs6YvOXcq3lH5l7uh2u4WQ+Wv6JMthNj6xB9M//9u0kjYILsW2RZJhFc0P0sV
	/4aj/7JK2YQXxd9J9hElJW2GwITkmjOvMRtWWrZDTjtLljkY3Z9g0aKOSxkrRyg6E1ZpNuClIld
	w==
X-Received: by 2002:a05:600c:8b0e:b0:485:ae14:8191 with SMTP id 5b1f17b1804b1-48a9852d122mr55418295e9.5.1777739456597;
        Sat, 02 May 2026 09:30:56 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 41/62] python3-pathspec: upgrade 1.0.4 -> 1.1.1
Date: Sat,  2 May 2026 17:29:01 +0100
Message-ID: <20260502162929.1377831-41-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:31:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236350

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-pathspec_1.0.4.bb => python3-pathspec_1.1.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pathspec_1.0.4.bb => python3-pathspec_1.1.1.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pathspec_1.0.4.bb b/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pathspec_1.0.4.bb
rename to meta/recipes-devtools/python/python3-pathspec_1.1.1.bb
index bcdc04dfb06..df8c0d66215 100644
--- a/meta/recipes-devtools/python/python3-pathspec_1.0.4.bb
+++ b/meta/recipes-devtools/python/python3-pathspec_1.1.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRC_URI[sha256sum] = "0210e2ae8a21a9137c0d470578cb0e595af87edaa6ebf12ff176f14a02e0e645"
+SRC_URI[sha256sum] = "17db5ecd524104a120e173814c90367a96a98d07c45b2e10c2f3919fff91bf5a"
 
 inherit pypi python_flit_core
 

