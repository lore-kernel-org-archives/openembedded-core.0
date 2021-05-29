Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.22280.1622304397435455585
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 May 2021 09:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BpGlIWW/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id f6-20020a1c1f060000b0290175ca89f698so6199648wmf.5
        for <openembedded-core@lists.openembedded.org>; Sat, 29 May 2021 09:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AFApdWKBA6USH9amEbG1weyP4j/ei/tDWwWLQZ6cpMY=;
        b=BpGlIWW/0/G/2AvuKkL70Zztft9Cud6ld5eKzUpOw6ktDSuF7xIai3wx8i6UcZbVDT
         0zWpRDjlHuhgYA9K3cOVFnL3h1QY1wvcfvhnkAx7bf9XBtztVxRFB2nZRaRspJpzTaDq
         3KJH904rqCKeOBtWDXwu3jAJcY28HGWimP65g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AFApdWKBA6USH9amEbG1weyP4j/ei/tDWwWLQZ6cpMY=;
        b=eQkj1gNdTNR2rZ+Dnltzq9UHUfhzroZImTVuLyFopOb/g/FARNRbXM8rS0wyvu+4XT
         kKDvanB5h80UB51rDT5c6dm5EDO/emLApV8fWj+Cuw3CoMul5aYVFIZVB2RGiId29wWA
         ssWZnXr874ntn/fSTtEn9lNGKzxCfGWd1eD1kIy8EGF25EwWDGeeATNLvGdCHCAlNvJt
         gx3vGUM14ByTa1y/bNkQeQujNo5qzvKBW9U+9wSamzSon0XcY47Gay3167jcgrbP7lo5
         1psUTUO9/L/TRVVzt+iHUF0wQXdl8c6uYbcGE0tkoTi9TQB9jy28fHvVipAPI1LNDfqW
         mlOg==
X-Gm-Message-State: AOAM530EKQ3KiP2JbtStT3SAfvNey4BRGeTheHnkXW/nhEP4sFPJPqPE
	+7lVgDf/AZBpVbtiaMVow7qHEuUNcyUIWg==
X-Google-Smtp-Source: ABdhPJw3WBewAtVnjhFqbzH3R19cz3Ql9Zkdz/yOs+GJ5THprzjIEb76nQ/YNVp7CYA8N9u4VT5Mcg==
X-Received: by 2002:a1c:b783:: with SMTP id h125mr5573652wmf.182.1622304395815;
        Sat, 29 May 2021 09:06:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:314e:6a46:a163:7356])
        by smtp.gmail.com with ESMTPSA id q20sm20873615wmq.2.2021.05.29.09.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 09:06:35 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [hardknott] [PATCH 07/10] lib/oe/gpg_sign.py: Fix gpg verification
Date: Sat, 29 May 2021 17:06:29 +0100
Message-Id: <20210529160632.2796977-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529160632.2796977-1-richard.purdie@linuxfoundation.org>
References: <20210529160632.2796977-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel McGregor <daniel.mcgregor@vecima.com>

A stray space made it into the command for verifying gpg signatures.
This caused verification to fail, at least on my host. Removing the
space makes it work as expected.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/gpg_sign.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 7634d7ef1db..492f096eaa7 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -111,7 +111,7 @@ class LocalSigner(object):
 
     def verify(self, sig_file):
         """Verify signature"""
-        cmd = self.gpg_cmd + [" --verify", "--no-permission-warning"]
+        cmd = self.gpg_cmd + ["--verify", "--no-permission-warning"]
         if self.gpg_path:
             cmd += ["--homedir", self.gpg_path]
 
-- 
2.30.2

