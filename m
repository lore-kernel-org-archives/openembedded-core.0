Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98142C369CA
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 03:29:44 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.598.1744860569757922464
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 20:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B+pjMcHI;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so199592f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 20:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744860568; x=1745465368; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJsH/Chk/jkMmDK7ik9BrciyjD2OZaV1tRYfmI4CXbQ=;
        b=B+pjMcHI0xa33YcNgaZRX85p3krrC0TS94JQ/+zoXWCgr9sGBXmEBPNt8KyL2qH0Iy
         BXwqjwUIdL1XZPDtTmDSM6WM7wE8IKSLs8U4A0QuJmenr55ywRcfGVxVllsH4RW3ZTvg
         kuPHzBJEGhb/1+0nnYDO2KiTzaZ585nGhls9VJDpRvAVtjSJEW1O4wL0027XdwP1Vkp5
         X6jiQgF+SZ2xOMQkzRxL9U3qDqCHDCy37exFf2lwF1CQvhjbQFhC3yysUk/Q1ebjNLUB
         MsZ8IOyUqZaumJKo3EiItNltDIucQbuX/HjAhbHej8NAbKAezMGzsgtbFcws4OJ9m3BK
         p/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744860568; x=1745465368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJsH/Chk/jkMmDK7ik9BrciyjD2OZaV1tRYfmI4CXbQ=;
        b=OR9bhEYxwp+jGhpz6hnPzZrIFnk66dzcIAtHWF5yTGZVWpEQDJGpbKWgcGD69fWiv2
         AEzAWf5zA2G9u/5TEYP+FttBT14ZUP/Wcsd7UXfJZrz6QWJ5HJ0cffRFp3JZnIUfqyPs
         ieeQQAJAppoO0+sR+Ozsf//7lY3ZOt5/UmwrL8M+g2x0VNBD5zueJcjQNsnhm+mvXPl9
         M0vBAxtCh58z4EnTpZ8YLxr5qbIcboT0IHca/RiwHwLVzBZGqW5ujGsohGn7xSODfsmr
         d+LT86YeGWbldJk1+2g0NqXgRqxNMV48hiVIeounx6fWtqMDuHebcKjXsXSWShq2shaR
         DrrQ==
X-Gm-Message-State: AOJu0Yy6XTtSaXr1Ksio9r36/zPQCvOjMgsylTs28LGlm3YgJ1GvciGD
	A58Bhdcn4X406IIJl9Z3VXr4koXZRecOS/XZXxpgP7H0Vn+ps9vkQvVjz4Hx
X-Gm-Gg: ASbGncvs6BUMaoT7HS88sJ2UkMljeK5XjIoCKwU/fACjOQROWyN2Jg7aQA6gRYv+W4z
	6dbe8+h3rkOBvDvyZgbNFzhbU0LEvPk7mijc4pTfzyTzXW/KjSi2nS2++zIgjkYQ69sl8nS+fXi
	6CKLYNube9kGHUfDs+BZy4DppstcJymntCEbTaBpsx4Iz7v/yR96iRetdnJLgUh9PFiE6gyv++8
	/ldNieTCnrgIIKVsV3kkKoE7NspkcZZa9a6ZudJ0z5NhqpvGTPRDgMP5QS7qCt7Tl7FxgYZVY34
	F6n1vyjg0HouMaQ36C+u8oYHbb8oENumYM+IqZsU3JCX0KY6fvFxv6sIHN4klNEqxN8WhO6VNPh
	wL2PTysP4
X-Google-Smtp-Source: AGHT+IH1wp9zr6ajBEo2GbihiCQgpjJ+83A+yXM7Ly+JbMxR9zc9hGLwIyHOOuYnexoVRyyDl345wQ==
X-Received: by 2002:a5d:598e:0:b0:391:1222:b444 with SMTP id ffacd0b85a97d-39ee5b17cdbmr3663498f8f.20.1744860568044;
        Wed, 16 Apr 2025 20:29:28 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cb29sm18713620f8f.76.2025.04.16.20.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 20:29:27 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 17 Apr 2025 03:29:14 +0000
Subject: [PATCH OE-Core 1/5] connman: Set --runstatedir to ${runtimedir}
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-connman-fixes-v1-1-160b2b811116@gmail.com>
References: <20250417-connman-fixes-v1-0-160b2b811116@gmail.com>
In-Reply-To: <20250417-connman-fixes-v1-0-160b2b811116@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 03:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215033

We have ${runtimedir} for /run, use it here.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-connectivity/connman/connman_1.44.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman_1.44.bb b/meta/recipes-connectivity/connman/connman_1.44.bb
index aa9da070dec1b4aac02019ae9c3158256b534c61..33b1ca0680b076bb3fb2b0bf1261eca1f81bcd59 100644
--- a/meta/recipes-connectivity/connman/connman_1.44.bb
+++ b/meta/recipes-connectivity/connman/connman_1.44.bb
@@ -37,7 +37,7 @@ EXTRA_OECONF += "\
     --enable-ethernet \
     --enable-tools \
     --disable-polkit \
-    --runstatedir=/run \
+    --runstatedir='${runtimedir}' \
 "
 # For smooth operation it would be best to start only one wireless daemon at a time.
 # If wpa-supplicant is running, connman will use it preferentially.

-- 
2.46.1


