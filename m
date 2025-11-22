Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01CB3CFD307
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 22:15:14 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2721.1763849712124619951
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 14:15:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=b/k6KrZT;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3436cbb723fso2559419a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 14:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763849711; x=1764454511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMPgBERqIeI0HuOIQqEHSX+BGTGfat3ue5rDZCDTqtg=;
        b=b/k6KrZT8QB+F9BgjQjYVhp17t+FvCt6IumNhUAYDyw1EGTe+FXbJ5reA/nuicWpjT
         /p32PzNFG/iDE7dKxQ4artGn1fKpJx6z3BFfNA6gwTXpjQlrKiecHjF1pPUuhFN+3Wr8
         4SLXYw74pYiZ8oIZXfD0ABX49gj9h1jqOpIv74Ozq4tJ1bxugcu9zg+k3b8qz6mKs6e0
         xXipdKw5gJG9ePfWuPXwSwstihJ8kCdN1oRx3JHZL/8o0IVunT0nQzp1vK3l/BQocO2s
         4ZGklWISKjFe6oZdXSf+9wFzOTLgRiy1+7OjEjIneWtNwstJpjakL9doGzhH2KjxM1F8
         jA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763849711; x=1764454511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sMPgBERqIeI0HuOIQqEHSX+BGTGfat3ue5rDZCDTqtg=;
        b=EYQNvzGG+Zg9n1N6lXKyjtgQjJjqEbcUqfahb+4vimnAEvUdHwlD4nsx7PseCEJR/g
         NgLj//joOclN7WJzvC9Lcw/96ZnMXeBQSOYj6MLHE60fkQcRYiomJ0jpZtSeoBIy6RzQ
         mxWz5RkqI3TYT2TsVbribPOqbu33GDpWOR17VvpMcP2hXROsWlBbtE1804oTHpXgUPi1
         elBgewI8iLAUyiQIMMOGPz7kJOMhKcTongNqA9UnyyleicR9vOZLWL533RAJIijvb1DT
         CFvm0hru5FTCecplu0SCPcxzc4NHVF59pTwforhiPkINuM2y6S5UzFlUIJYPZQ7GE56J
         w1XQ==
X-Gm-Message-State: AOJu0YyQdasKuQdSO8+bMfLNX+nEfBkwweS1cLL5kQl+ZxjfBP5XzSBJ
	6n8UwRpFKLjOdnnr+S8W639rFItQTYjV+1KLN65pLm9md4HgW80jnbFsi5JWY7RqMtRWte6/YZF
	Ge2y8
X-Gm-Gg: ASbGncsNUoG1RSo0QwUUrZZJQAoxXcQr1DSt8qgiZ6SBVaHRGVqeFQnoS4PieoaOeoL
	b1eRBwS0oatkPT5gGnmJNFRSlm9YRVQAQYyapkh53qZbED4IArZgYdq0RVG/rJfypVrsP66/6DF
	eDMzJRXMi7H9lSfVdx/T1KBHNYXXwnQEQ+H50fn/X2PkLUEn9GIPpN1iXhldET1VGsxhmoa2Nwq
	112m/vH4MF9+g/txhCC+f9664byv1gkWIPoGdW8F9Sa0GHOEukARjL0Zn6mb7JMl6C1BdszR++K
	UPb2Uu0uJx2YgEzKVK6yhoAE8XdWW9hMcRz30gnCVFtN3ah+f3YjW9rSaJVG51k6QoA8lnZY/gN
	HS0k1KFNZ1K1EYRblQP4tFspanjFEYmLAfLm2UGPMagx2EWdfx7FJsaCO8/klwoU6dr/M72XjRc
	0dng==
X-Google-Smtp-Source: AGHT+IEiPN+CiWcqXLhNFTM4AWxPjJc8JQ+/kIOqtM0Rp2Rdd5pzrpGeciguHtuXuwD72yYRwfSU6A==
X-Received: by 2002:a17:90a:d24c:b0:340:f40c:169c with SMTP id 98e67ed59e1d1-34733f2a47cmr4677895a91.32.1763849711369;
        Sat, 22 Nov 2025 14:15:11 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:a812:a9e4:3291:bb61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345af26d8b1sm7158274a91.3.2025.11.22.14.15.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:15:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/21] oeqa: drop unnecessary dependency from go runtime tests
Date: Sat, 22 Nov 2025 14:14:26 -0800
Message-ID: <4e10e7848cb10307f133f181b41563c995df032a.1763849517.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763849517.git.steve@sakoman.com>
References: <cover.1763849517.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 22:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226718

From: Peter Marko <peter.marko@siemens.com>

The tests do not use scp command, so openssh-scp is not needed.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/go.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/go.py b/meta/lib/oeqa/runtime/cases/go.py
index fc7959b5f4..d4b69438a5 100644
--- a/meta/lib/oeqa/runtime/cases/go.py
+++ b/meta/lib/oeqa/runtime/cases/go.py
@@ -28,7 +28,6 @@ class GoCompileTest(OERuntimeTestCase):
     @OEHasPackage('go')
     @OEHasPackage('go-runtime')
     @OEHasPackage('go-runtime-dev')
-    @OEHasPackage('openssh-scp')
     def test_go_compile(self):
         # Check if go is available
         status, output = self.target.run('which go')
@@ -49,7 +48,6 @@ class GoCompileTest(OERuntimeTestCase):
     @OEHasPackage('go')
     @OEHasPackage('go-runtime')
     @OEHasPackage('go-runtime-dev')
-    @OEHasPackage('openssh-scp')
     def test_go_module(self):
         # Check if go is available
         status, output = self.target.run('which go')
-- 
2.43.0


