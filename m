Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A94ECFC5F9
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:10:12 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.52658.1728587408093224749
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=ktDgWAKH;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43115b31366so10892735e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 12:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728587406; x=1729192206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5w4jNMhf/sydqLPWfbF//F5+xYD8cCPxbHJqU8o6GPo=;
        b=ktDgWAKHHMWcccRQ8WKjpUXJHcRzv7iPUmoFuxfurnm7ijp5xvX+PNI5ju7h9LLh2B
         t1nWJj2D77bp92WC/Ip5CHAFBdtpLdb9lu/KSjcFLzTD1S2iYznP/ttoAV4TxbVP366y
         8bxUrK9rpklM0bujujexVV/aF63BFuzaix+Wvbo3KEhVr/xQ7/WgSiFbCp9cKGa6bUrg
         HDMl5rl+C5ajhL9L7g/JJyWs+fmkk4W2sNQrWdjT+xUFX/Vf8GxRY1MULa3uMffE3zJV
         0mlOraeRAlgD9wSnNvdY47b0IH51uLa/Mqf7VXQbD1wdFgeF3dJyQidXlHgRVdhQjHEd
         yvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728587406; x=1729192206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5w4jNMhf/sydqLPWfbF//F5+xYD8cCPxbHJqU8o6GPo=;
        b=qL0GkbfryikKR9PxBfH7dbPhAG/NzW8GHW9FQZxFL/z3ADXkqD36OsjO1ffP/+B/Fm
         wQ1fwOAaNF9lnnKXFrqDpeThKaC9e5T1G6hcqxZZjAnXjOEBIywhiwEhPAu260Uj/V7C
         3ya/TpePwxNYgKqGz9hjNwqigWo6OtU+pq32AQ7XnwjOF6WGZvy5FgqTqlECMM4o/1m2
         lDIeCoSIRl5Uv8WsBcClKQHa0ctvEw8ptt5X5Kj997IAEBczghdqUVT/RLww8SLMuFsZ
         Kr9pSgzo4M2EGwXV3PFdWaaO8uILKIeZ971rmZ2Jzw2MFsTn0yvJgEg8vmbxbYAWtlhP
         JXdw==
X-Forwarded-Encrypted: i=1; AJvYcCXW/9nE6p3ysSOT7xTKBY7+QNBNdUCL1rUzVDkRtonYzyGnbwQSCU4NQUS+Orj69M4ywRZs/Q131ux8TYJukkkPTQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy5vWTTeRtuxo1xNtBT5Y9Lc0E5SdZ+rCIsxfRi2M/qxTy3z/jm
	7/SNI4eXjZkk45t8+VhRWNRRFPZXQ6C07icr9g/Dw5JI+go6Z9hw5u4eiEjgBFA=
X-Google-Smtp-Source: AGHT+IEYyQ7ZIxjdyLdvQveHpo6vTPKIWEowETdf2x2TtVZdPLFK3C7AtIq3yAldWyjBrht765tb9w==
X-Received: by 2002:a05:600c:470e:b0:430:5356:ac8e with SMTP id 5b1f17b1804b1-4311dea3938mr234885e9.5.1728587406323;
        Thu, 10 Oct 2024 12:10:06 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5e5d:bfca:20cc:60ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf45d49sm56281515e9.12.2024.10.10.12.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 12:10:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Zang Ruochen <zangruochen@loongson.cn>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-oe][PATCH] python3-pip: add missing RDEPENDS
Date: Thu, 10 Oct 2024 21:09:56 +0200
Message-ID: <20241010190956.34063-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205427

pip3 package is missing the runtime dependency on tomllib. Add
python3-modules to the recipe's RDEPENDS.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta/recipes-devtools/python/python3-pip_24.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pip_24.2.bb b/meta/recipes-devtools/python/python3-pip_24.2.bb
index 5e1a467990..3019996f07 100644
--- a/meta/recipes-devtools/python/python3-pip_24.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_24.2.bb
@@ -34,6 +34,7 @@ RDEPENDS:${PN} = "\
   python3-io \
   python3-html \
   python3-json \
+  python3-modules \
   python3-multiprocessing \
   python3-netserver \
   python3-setuptools \
-- 
2.43.0


