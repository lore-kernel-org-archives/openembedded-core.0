Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F56CC3601A
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:41:09 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.42766.1744018861840260610
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S/wq/fD9;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso45445425e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744018860; x=1744623660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dBeaq5ZBXnLDICZZe+kBIXZpXj/d1KA+NFFXMr6ovrs=;
        b=S/wq/fD9zGE8TdgmWmaW0+irVB0bRJDmwaTmKKz85NZKC8afRJ3ZXHKuFVx3VnYx05
         LHP3lO7852I3ZnVJGst0japqftyY/6cP7sor7YJVS4S8mNaFLnQE3KH8Be9UgpKEnubJ
         /qxfqzj5PdeNkRRb8/kq6jVfFlCL8Yg8tHKRe6IbrNsAxPyBYHVN5QrFv0T3SzYT8kFc
         AR4mU1eS3r/HxMeuO9ykHzAwtFd5HjqBVBbYtTr8TPrYg0ruiMIhIfWYM6gv1GI2v+bR
         BPW6KCHk4iWk+zzVR5hLRyhGEDCva4FyTd51xkRsH6YCBYnSvocZrb4ifrcFGOwt2xgo
         FI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018860; x=1744623660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dBeaq5ZBXnLDICZZe+kBIXZpXj/d1KA+NFFXMr6ovrs=;
        b=KNr5TbGILAW97FNNTa5wUprIYd1e+YCUAWjDtDe7UGG/4RaLbpavD8va+l1io2P7ht
         9JfoOOaN8eaYtt9o6c76xMgD8ZMUfMwHcYQ4WVQxMFbSKqGmYCjuorSDk7rVIZWERGEH
         Yx0uMw8I43Qc+qCrLxV1O6egLns6XsxTQJjNEHI3LMj0QRe7w8sfcKhv83vG1gW5kPba
         6p2zAtPTfzcdl0B5tt3bb3iqXAIAytry6VBB4wrOghXeqQPYt04ehhdIz3Uom4GhTd4/
         kWzO9qI6oMM9QKBO2M8Qafl0ej9QvyFuZMRYainpe72BM64DKB864ShXkfux4hIjKWKx
         Aumw==
X-Gm-Message-State: AOJu0Yw6NyxGcfK2xqZ4JCXu5OqlzOgljVmi6oOTunRHv+Qv4pSaL1v4
	4tovrE5ckoojt+a10XuscSwUcYuqSFjoxwCLWLO3QvZ9KcYitFISYPGJRQ==
X-Gm-Gg: ASbGncvyFQHG6SkHtZ5h8yIhWelJQEN7q6Sqx+jIM381g2oLH9UI8TsgH7vQV8ejEBO
	ukuhhtQ/5ZSg0/qqElqrXAdTm6ZJrvHBXK/tD/5aXnxMsVadVZGLTry8ee273Xll0IE7M4Wzvs3
	P7fsExPQ7F3VgdNXnH3ecz78Ly2miqSoXH7u/8v1XefoOT+SqIo1mB7XbaxaR8KLWnbtzh2z4Xm
	t3tKzNBwSiTU+3kLMH6KFuEnO5eWvwSxu+V9UUy5ZmkdyK7nVJpTLPtqqil3oEaeTBddVpwpjSS
	OyvK8G4VLIq4aMqHbkMqgqc5Zbz8giMCG5sOKykx4EOHsV1W0Ho7ghquFDnnHMVJDMMDbAK4zmr
	3ABj9uw==
X-Google-Smtp-Source: AGHT+IFAavZ6S305JLEFRv/pKAbd3aBsSOiYLnH/AmrioR3nxkyL8QeQtx8g5J0YahjriA7YgPVoKQ==
X-Received: by 2002:a05:600c:698c:b0:43c:fa0e:471a with SMTP id 5b1f17b1804b1-43ed6615862mr102187055e9.5.1744018859845;
        Mon, 07 Apr 2025 02:40:59 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a76cesm11562459f8f.37.2025.04.07.02.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:40:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/18] avahi: mark initscript.patch as Inappropriate
Date: Mon,  7 Apr 2025 11:40:43 +0200
Message-Id: <20250407094045.753021-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407094045.753021-1-alex.kanavin@gmail.com>
References: <20250407094045.753021-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214425

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-connectivity/avahi/files/initscript.patch | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/files/initscript.patch b/meta/recipes-connectivity/avahi/files/initscript.patch
index c856c3df046..e1176888df1 100644
--- a/meta/recipes-connectivity/avahi/files/initscript.patch
+++ b/meta/recipes-connectivity/avahi/files/initscript.patch
@@ -1,4 +1,8 @@
-Upstream-Status: Pending
+Note: upcoming avahi 0.9 drops debian initscripts altogether,
+so any version update would probably have to copy the last
+upstream versions into oe-core, and install them from the recipe.
+
+Upstream-Status: Inappropriate [upstream removed the files]
 
 Index: avahi-0.7/initscript/debian/avahi-daemon.in
 ===================================================================
-- 
2.39.5


