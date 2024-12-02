Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F76E69E81
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 19:20:38 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.1446.1733167231871651992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 11:20:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KQHK7h7T;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3ea405aa7b3so2345861b6e.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 11:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733167230; x=1733772030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6RSIHywYl7ZDdm31HUMy29SZLzKpUMAFVzGYY9+M4vo=;
        b=KQHK7h7TZZtXF5xYah69+4WvmF3Q5A8ESbIQwaYQCd2KrYh4oVRxweAFKks42bgbu1
         0G0I4H+xIC/B40+Kg9scx+Kyip+9ZV3y/RhUC+Xxk8WL9ca0lPGo9Mc5qzAzTgDH5W2X
         27gnVHrcejC+gQbEm9g21Of9WiCAD9am6Ig5HVCbnqbRZDI3l0PhxHziIxzIPWzFhXK3
         39O6QiP0BuntFTMA11bSrmGQCtSUfPTkIPo5KrjQBviM0jTxUaHr8GNWkN3JGQYEU5x7
         C2fQJKmwvKNNS+KYDoKydli+yeNkWuuFyBbP1CeJK699T1Oiq4OLVXpYGYwxNLGblNLF
         Vhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733167230; x=1733772030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6RSIHywYl7ZDdm31HUMy29SZLzKpUMAFVzGYY9+M4vo=;
        b=iooDb4bqISjF5Rq4PkWmnCx9LIDl95yHq+cazF/m2oGsAKgQOmSc8HKf+GxxEiJeXF
         zH7/93UbDxY7MwZW4+jm8tgCka7JLq5CJTpnruEOK9kIluUFsybfpmzjw2/8Axpfeg84
         tswVk9nEJphYaOYv+qhQhsp1qcJXQMceeMsaMyOmfAk8rsCcDm1BgP6gsxpMIj7wWMvz
         fuXjCzdmdWp9fW6iNmvP2UJBYJOw7hCK7GxnzBL6ILWyVLof7OfIIClKuGmXhU3LIq72
         jiO9haJaT47d0uEy4IcqRCmb4CVO3ZESSD8vN4WEZyRkL7IQTVQlrlE6xQ/1D1+wIGf6
         Oplg==
X-Gm-Message-State: AOJu0YyuDuGiFKQCY97Knro2/E3A1XbzZbLqXAOP20iNm0zd8muQdEvW
	Pp+0o1nAW8mVE1HKc3e8dP5IbXGOst6vrtUo+kHioXm0T0ebWRKaOfNb/w==
X-Gm-Gg: ASbGnct52SuovyTRNEA+MoSkpTDKksEs0Ysgd+RFNgXWRAu8zfTqV+ziRTdgDqd42GK
	gOOd1QqDU9rNEzws2JjlgQeJjzD7nuYrKVzrC39UC3rBbUe+F9UMim5xy8JPjkd9vKr4Aud/Pz3
	9nk7CLg2q0EXMeYx/r4Jevs5jeARaw6SyVqfiPnJwcqEzoOnGafw3qpfnynwLWVizOpw/Jn677t
	EEbrG69sXohMEDhewLhMiBwNCk6qqayz4/ZNIuLisWcjKjr
X-Google-Smtp-Source: AGHT+IH6EP5ME5pQo5NHp+iU13YUE3W35256q1pV4XTC9wEFpzdbcY3mOLzJMdpLgDRHUDCqE6KpcQ==
X-Received: by 2002:a05:6808:f89:b0:3e6:5b8c:d95a with SMTP id 5614622812f47-3ea6dc1f5b5mr16480405b6e.20.1733167229982;
        Mon, 02 Dec 2024 11:20:29 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::dc1a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ea86125f51sm2476568b6e.31.2024.12.02.11.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 11:20:28 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] lib: spdx30_tasks: Fix supplied By
Date: Mon,  2 Dec 2024 12:20:23 -0700
Message-ID: <20241202192023.1123979-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 19:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208154

Fixes the supplied by property in SPDX to use the correct name

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx30_tasks.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 5aeed5cd6fc..30f1a3a1661 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -596,7 +596,7 @@ def create_spdx(d):
 
             supplier = build_objset.new_agent("SPDX_PACKAGE_SUPPLIER")
             if supplier is not None:
-                spdx_package.supplier = (
+                spdx_package.suppliedBy = (
                     supplier if isinstance(supplier, str) else supplier._id
                 )
 
-- 
2.47.1


