Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F65CA0EEB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 20:08:25 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.3362.1755634098176821585
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 13:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zHLs3RTA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so3401564b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 13:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755634097; x=1756238897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otpgGpB7BHyr64GSZSIs9SvxKe/BXauIg9Glpc2qHMY=;
        b=zHLs3RTANGosZ9uTeAbYyBU+YqEvPHuWeobbLoOb5Mk8HgkcrE4w7fq0/ZCOR6DUOd
         sDPMsoJzSJsrWJoyxGHIs9V2o/RZdxrzuXwuUfWzCHRHJ1NG3YbGwF9cxPXREbJllaVw
         IKxaZpcp/O+I2ArwwzStGZmc97uudLf9TkJQ9WBEWoUk2etL2ucvHjzLKGGem87RIv4I
         Ds1Vz8OAbPWfeWntrA/kzNtymsDdn1uU+P6I6SfAIAQ/EGrID/o+7Inl5RtWNJxScwD7
         zGWscxKVYO0Pt57ITnkzO7LPCyextUMh5FklrUJ9sKigccM3C3wn+LcpI697v9YlQ4Jt
         99xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755634097; x=1756238897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otpgGpB7BHyr64GSZSIs9SvxKe/BXauIg9Glpc2qHMY=;
        b=cVoKA7jKFewZUibTwS+1L84o8JVTXGI23r+qM8Il4vGijoqU+OmeiGBeU/qOZuLEww
         AJ9q0ZVjooBtfSKLQn989OXtdXA8jP5JCdDMkw58Zj21J609pRL5jPqv340+xhCBofDl
         k48ed5ZxVXqP9uDnGDpf0lNu/MNsFtx9Jqu2TDI5WGVvUzzKP6VmdtE53P+tUnAxPLJH
         lGvNCn6Ejy8T6COde9mhS49ZT6SHJIV2LfUOVHL2R8ZOBczUpVmPj3/9SUQDBZZmXs6H
         I/my9v+spW+C9ilXredYqh5lJEQAZEOh7Q9mtYaNIPnTqtg7Mo08aheKuYfLEhrT2Qy+
         gUbA==
X-Gm-Message-State: AOJu0Yy6Co2hb3DxLWl3i4l8ny4wFS7JD8bL7ZlnVG8UmVZp6sao5Crf
	DjbOhzdE5KBxear7quHAZVDiKeaRU3QY0UJFQBHgEYz4jb296Hu/8+YZ8+TpCMEwKsLMUs+0vvI
	rl7pF
X-Gm-Gg: ASbGncuJkt5JkdVkZaG4CXfpOpg4xb7dUmp3Rk96XrZjCmrPt9p2VP8Pa1FjjX6TEU3
	9thekU7SwPqfTiGTdg6ovQvTa9hojjKEvz/RTdvR7fdn9yU6O7NVw5WjgkTMi1hE5LA1WE5JHS2
	FM6S2Ksprobg2QXqhO021/K4Rz0KA4VhbGyvR1mmiN4gKZgZ2GrL7ODNTEKlGPxZ/dSPzOP05BE
	eBwaBqs/YpdfHTto/5S5eLBE14oI5z8o4+3cD48/J1CNuHvSOMdYeMRzDU+PiwL9IT/fazqOk41
	pFGz8DkHMeAQfSV1NQQcLyYw2sBK/6E3m6nnFEzVLENAGEwSbnzCpw0mRu9FMnTGiPvo5Dvf+jW
	iG1USF8i8K8HOFw==
X-Google-Smtp-Source: AGHT+IFzyS4bmTEclZipDVKUTOuP5Mcd0QcYdAoaYDxVpgWlOBnK9c4tk/DfXcx8ZpxiWMJPQ5hKPQ==
X-Received: by 2002:a05:6a00:1acf:b0:76b:f3da:f91f with SMTP id d2e1a72fcca58-76e8ddc22e2mr605277b3a.16.1755634097432;
        Tue, 19 Aug 2025 13:08:17 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f07e:6fcf:4f52:4db2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdd6sm3348855b3a.29.2025.08.19.13.08.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:08:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/10] bash: use -std=gnu17 also for native CFLAGS
Date: Tue, 19 Aug 2025 13:07:53 -0700
Message-ID: <b9628a9696d3a0df8fc350d2b005a4d9f399c99a.1755633925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755633925.git.steve@sakoman.com>
References: <cover.1755633925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 20:08:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222137

From: Martin Jansa <martin.jansa@gmail.com>

* fixes builds on host with gcc-15:
  http://errors.yoctoproject.org/Errors/Details/853016/

../../bash-5.2.37/builtins/mkbuiltins.c:268:29: error: too many arguments to function ‘xmalloc’; expected 0, have 1
  268 |           error_directory = xmalloc (2 + strlen (argv[arg_index]));
      |                             ^~~~~~~  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/bash/bash_5.2.21.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/bash/bash_5.2.21.bb b/meta/recipes-extended/bash/bash_5.2.21.bb
index 42ab02c440..7652e7d87a 100644
--- a/meta/recipes-extended/bash/bash_5.2.21.bb
+++ b/meta/recipes-extended/bash/bash_5.2.21.bb
@@ -23,5 +23,8 @@ DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 
 CFLAGS += "-std=gnu17"
+# mkbuiltins.c is built with native toolchain and needs gnu17 as well:
+# http://errors.yoctoproject.org/Errors/Details/853016/
+BUILD_CFLAGS += "-std=gnu17"
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.43.0


