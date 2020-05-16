Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web10.7372.1589644729775793394
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 May 2020 08:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dD5BFisF;
 spf=pass (domain: gmail.com, ip: 209.85.214.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f193.google.com with SMTP id x10so2211641plr.4
        for <openembedded-core@lists.openembedded.org>; Sat, 16 May 2020 08:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9B/GTxRMMO0jop+QgRXS5yVUWwp+QXQBiVuvb7jJRlk=;
        b=dD5BFisF6zPn7l1uqosLpmkfsTc6dHQ3Q/6BYSwRQjg2XqLEfIfC6kjuWJkTYHRLaz
         vdJejJEDeFCvyl+NW41Ay8J8NzvSLHim6smCIayc3ieLexkdFAB3DoTcCfHsQ6AkD1W1
         4xkWffaKKsfwfy/y16wniAO/LA+liyJgq+JaYfEBz00GDCZpfHqLBlFfkimDpd0UFdWy
         Vu4IQVtXaofHLc1e21treIrcNdXYCyp+iTKOizxkcgh/IQtZVRcsgnzmtmZ6hwnC8Zwn
         VpLfgCSvJli+0ethufBEHqltDhlc4NE7W/iTpS33dD7ZSpz+nzcLCM3bfJzEYGguRF71
         y95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9B/GTxRMMO0jop+QgRXS5yVUWwp+QXQBiVuvb7jJRlk=;
        b=HbEQaVUWez7J/dfugGa2Tw7Sx3WJiAa/y9rZ2lI7Zlmke3Iq1y3LaIW59rpgwyVuZB
         j9rFYByVRiPs+7ddSUTYO6zi9Wm4fg9Cb1Xhs04kAUWGDz+AGNYjB/8fxdTVwoWDL/Si
         D1YURXeRPp/0+l+iGdCcMnuNefbqPAWs9pXclVggcvKAsIdy2Oe/u0MFKFXbEYc9II0W
         CZgi2NziKwQM43FiD4EVD5Ah1Pae72TqrWXr5le9vIKp4cP5LvI7mfiWEDMJ5yyXuA89
         n3jlHVwjJOpAfQ+F1+K59rM7UBGVxFdEt1l/mcBDQ4O62ISOlb33smRznfzD33W/RBuU
         j9rA==
X-Gm-Message-State: AOAM532shsgoBx+qzVdEbqIoGRKCqWxXsbtJk58Ed0TQdLn4rQs7TjNW
	TLYI9p3Y6MwRu5YZaMkuLcB+KV7PDX4=
X-Google-Smtp-Source: ABdhPJw3cZ7e9IJddGX2HIlB+yCjR5CmSIxkG3tnyGfwR0ZtnSNrrBvqoRGCL0FD1Q0BTCm36qSgqQ==
X-Received: by 2002:a17:90b:30cb:: with SMTP id hi11mr9636283pjb.103.1589644729027;
        Sat, 16 May 2020 08:58:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id jz3sm4202003pjb.40.2020.05.16.08.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2020 08:58:48 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/6] multilib_header: Fall back to worsize form libc for bpf target
Date: Sat, 16 May 2020 08:58:41 -0700
Message-Id: <20200516155843.1811017-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200516155843.1811017-1-raj.khem@gmail.com>
References: <20200516155843.1811017-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting bpf to use 64bit for wordlength is not right, it happens to
work perhaps becuase the targets its being run on are 64bit inherently

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/multilib_header_wrapper.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/multilib_header_wrapper.h b/scripts/multilib_header_wrapper.h
index 62b57ca8ee..df01b56a72 100644
--- a/scripts/multilib_header_wrapper.h
+++ b/scripts/multilib_header_wrapper.h
@@ -5,9 +5,7 @@
  * 
  */
 
-#if defined (__bpf__)
-#define __MHWORDSIZE			64
-#elif defined (__arm__)
+#if defined (__arm__)
 #define __MHWORDSIZE			32
 #elif defined (__aarch64__) && defined ( __LP64__)
 #define __MHWORDSIZE			64
-- 
2.26.2

