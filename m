Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B9B1061B0B
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 15:16:32 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53841.1774883789212702603
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 08:16:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sMnFaz04;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so914584f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 08:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774883788; x=1775488588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qaF2ZqA6ejmwYl6nT7hja/uhPwl649Cfq1F7Lh+q6no=;
        b=sMnFaz04y7ZBHwwB6OzDtd8QECACwxWMHzWtIg/LdJdzbMuSI3CdZMcETFCuR56Z8L
         44LtCsrc9k8mBk9spG1+u+nivMbzByOsbqbwozpeaBshqhiP7qQ1ZwI3/yNZ3WsSs05x
         OJOd0SEOINobRzC3jIloXlCM6PPwsGSe6Fe6b9o0x971t2cmIa0NaBYhEzTLDrJxelBO
         n2zwNsrPk8XVEA3ZEaZkHTJznG0gVHU/COpyNQfU31KGmmYZoBUPE66RMaXwEROkCTpk
         /aiPf2OOoCp7Rvsib7P0tuZ4BfDVrxOksV1tahadkTDwdEmaGhDAhm4J9h7ofrTOVexq
         mjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774883788; x=1775488588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qaF2ZqA6ejmwYl6nT7hja/uhPwl649Cfq1F7Lh+q6no=;
        b=OH7eJMnp5Rc11oOv5MDtHyNkSWYJ22kAhUv3v/yr9QuPtzlKz6RAWAYJavvB+N+Yww
         isVx3LHNCcLXirVaOSh/+pcmEXplN0N1FYqCrcztjhaj5dg6/OsfE5VbWpg5mCIKnHhM
         sH0coKK5NBc1hrFkYBwypSgPLV1SVxOBzj15FvoM4/akGhbbFrsx3VjqAkQxwyifNf7b
         ofUMomCux17Mz+XmUWjDqb5bgiPPdKhhIN8hcVT9eb+aIj3APdL4FC/ZlP4O+tnYtUfS
         Y/6ruBqQJZY9VzpR88KYyuQjzOwVHzkayvOoi9oYmjqfXS9TZmFwsdVKgliBjPfMXbb3
         FUcw==
X-Gm-Message-State: AOJu0YxfKt4WhysRE2ReuLFrnYmMJNbL42G1MF/Muo/bAfO0OSt7RRGr
	DrF7rbvwwuDgz73S86UBQDIAPsqQ2dD6dXqQfrv2vCLZP9V7xN1LsBuxYOkt2g==
X-Gm-Gg: ATEYQzyl2jgNDpUJdofoQ88rMX0IiYDcSy9XCLWLMvj1D2+y2VRaKOZkQdPel3E/3VP
	5VhfAX3+ACk13tuwrK34iTfqCYejFfQwYHrnnHihpKl5vgX13ZZvlWKzD0ftJ1ldcDFuh7cVK9F
	gD9Y9bTJUQP1bSCEldSHzDgr4KxiRPaAp23Wkn/Is74AM8ATeyvxfIjT12mxgwQTaVD+cncfbCx
	NvBTbsjlOERuFwZoKJm8QDH1k/yk1nkqssUG5MAG1+ap1kaEMlp8QPeeuvmUgXoUnOq/r80yHVq
	kZc6wuoc4wlufLPXcmnm70lUwAOsck13TBoXcq/0/4cmjlwWUO9KV8YKbXyr7KBG8MKOtZfuYeS
	3wzR+dvm97g7uIALPdj/Rn6wEJqvJ7agDDuwf/G4LfS4qmGiDkyXjYXOs+UT3ssnasJvZa8wIEK
	hzG6lx3onX4/K6pIicvAk8kR8p7A==
X-Received: by 2002:a05:6000:2f85:b0:43c:f66e:f2d with SMTP id ffacd0b85a97d-43cf66e113cmr13187380f8f.27.1774883787107;
        Mon, 30 Mar 2026 08:16:27 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2727sm21660997f8f.2.2026.03.30.08.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:16:26 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [whinlatter][PATCH 2/7] pseudo: Add fix for glibc 2.43
Date: Mon, 30 Mar 2026 17:16:11 +0200
Message-ID: <20260330151620.3835312-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330151620.3835312-1-martin.jansa@gmail.com>
References: <20260330151620.3835312-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 15:16:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234243

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to add a fix for a function definition to work with glibc 2.43.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index a26a205a16..4d31629903 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "43cbd8fb4914328094ccdb4bb827d74b1bac2046"
+SRCREV = "56e1f8df4761da60e41812fc32b1de797d1765e9"
 PV = "1.9.3+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally

