Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C11D6394C
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:34 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.13834.1732111046650453725
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BnkJXZAu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21260209c68so6512965ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111046; x=1732715846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UD0tpMjzR08rsMBW3pSKtcrG+3qA2maxKenzc5aKv5s=;
        b=BnkJXZAuyGtbBEQYWzOEFsqb3z4pMdpJGJllf0E7OOdom73NOeZO+YOXAAOSuRPSIu
         w3sgBjfXsMqwCJXSFQPEplg30e8CVZTG09gIZCOgBr3b5afiMgRn/tYRLxyRZ21lc7iT
         GoDehRHPiT+ZRHzMnvUP5q5u+fvTbZpQ9B/r7nvO+9bCsGiZMqEF8n3z+ATPHgaCi9Ov
         Sye/NvQqE15bq/Obil48RuZxrEniCLXqy3betdYin3aE45JeEVqp9O/GrUJP9u3LmBj3
         wPH7LGWJ6DwwRm5J5YYTVSvBiohuX1VIQsb4iLA9grI/hm3jE5EHjz5HvhTAKk0oYcZv
         FOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111046; x=1732715846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UD0tpMjzR08rsMBW3pSKtcrG+3qA2maxKenzc5aKv5s=;
        b=fYnQUDdtSIl9GA8jp8SoR1ilfmv30k5WVUQnCCStqp+HoZHk2ODhBau9O9OJYrJVNh
         kM200gAaQ/VQ+rF2Zj3rONv/iCCLGDU9ZqxQIZ4ZJCESqQciUeRkU9ILHRflYXzVu/GR
         y5WdGDNZ+Gkk3TYWm7N7tKjEsEIW+5q6y6ZjDHjlT7GRiPtUtP463bKu8vaMzoXpRREI
         DuFoK4lK7owIkMj2N3XuxDLLuSfcbfBE4dcf4uNE1XZRwvq6GpANpmFZRY6pDdwm2rqy
         kEqTQobQ7LqDuhyyhTky1CV68pES+qEhBhCYzCPne0E1/vwEuYJ6LH4gz5gombpTRBE6
         p64w==
X-Gm-Message-State: AOJu0Yxv6BwGaL3/yiAJUggOchSca08529Wkw0FRYtUnDqBlm0Mh2zOI
	nZ7zlYG7wFSc9kMq3tOqO0OBYdX787SJG62E88i4Zp8uGhEJ/JH4ZEL/nOLgLhVwjKfFKlHI9KT
	J
X-Google-Smtp-Source: AGHT+IEbx/Nob8ty1rhpGoHawez6Pw+jlj2uzLqXBEAdLdR+2OTW3S001yLWtiE1UOHmJUrql1VaXA==
X-Received: by 2002:a17:903:32cf:b0:212:3f36:d983 with SMTP id d9443c01a7336-21269e95910mr39493045ad.27.1732111045889;
        Wed, 20 Nov 2024 05:57:25 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 09/31] pseudo: Fix envp bug and add posix_spawn wrapper
Date: Wed, 20 Nov 2024 05:56:41 -0800
Message-Id: <1f7c468758bf2a47f606cbdbf1e3c2f21a3f890e.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207433

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fix pseudo with python 3.13 by adding a wrapper for posix_spawn and
fixing a NULL pointer dereference in envp handling it uncovered. This
fixes issues on Fedora 41.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d80e20d70d170397f9827c5a5fc75ad1f2e8cd94)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 7d8f71f65d..87c62e0678 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "374089f2ed83da4d0d4e58df067142ff99c7eb12"
+SRCREV = "28dcefb809ce95db997811b5662f0b893b9923e0"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git"
 
-- 
2.34.1


