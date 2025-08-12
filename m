Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AE1C87FCB
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 09:39:53 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.69882.1754991589758022674
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 02:39:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ei93AtpQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b8de193b60so2965946f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 02:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754991588; x=1755596388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mYG8P4MX8S0lbVUFiBtvxSp1i0kZlzKYhbyIb0mbPPY=;
        b=ei93AtpQiIyXg+gT0ZLF1sqZj2tGyDy1otgrvl+mvswq+vd7G6pJ9//xMD9IoeRlBp
         mAUQ137fUtJ+lRG1edS1e+5rgmozclzUDLUVSS5o7tdv2ubrcEL3qTvUQTJOaNANBu2J
         NnXpBQtHbFU2NuuTOeF4Rh7DzU1jafIOBaXqc6f7M7tt0Y+vravXGnQBUavoSC1ld2pW
         tqWui2EIznIp7/6y+ahB17UXhBopLw8Xe6s796MBTcFnOgVXleohcdOAh8skpD3xg6Uf
         iuqlkdicXkMsvihs1GMQheJ405dyWp+kuXdocqPnxJOQPQ+jOoGz99ma2F8BcsNCkMWo
         iKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754991588; x=1755596388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mYG8P4MX8S0lbVUFiBtvxSp1i0kZlzKYhbyIb0mbPPY=;
        b=YIbKfvxCLz+qSo+UzyNu3MPos02ORvSTf89XdQm7+C+7XzzazcyKvKQjYchSUsLHM3
         sY+LTYE30XU4F5dk1dRTMXNaOgZsjww3ApVK7dBSAbJkOIgfHuXKGt+Zvk3giApO/n1w
         jSYnMT0u3JVlefDTQk3kHsQSkKa1VLqatweQ8c1/Q1rJ0go7SdkQTV0zLEZhjiOVy1qj
         xWVd4ciJImoAwCO0M03MSh5pbyeiIqtjVTJg7+D/x4G5krfJ7Nm7g19TsdM+rgJtVL7F
         YFXxv8/NPmt19EPrvBgCMuXJt6ZSTAR+HtOTVDqhptS0yxXYSBGf/oKKDtoZOS+sSrp6
         sqfg==
X-Gm-Message-State: AOJu0Yw1cJ9akvdXnmopofn+MHvEOTsCPpWBm6EzF/bNvfaRIv6+5Lbn
	25xJHI6pUZD+DEQct2oH16SzUZEkPLVqtonov3PL02A/QyYhWsk2F/TLlEv8Og==
X-Gm-Gg: ASbGncuY2YwOajlUMwVBJvzr4A/rivOZ2jznRuo39G/J1tx5/PFY/RKygRkjhX27cU7
	dcn9GtmzulWV103l7C3fkQb0tKSHH+n+UZcGESMx44K7kN9DFfAt+WXkejb5qD1fkAnfTZpCaUH
	oqqnOrTYKtRA/0Cq3d9PWPDJUG5tL1ti46GFbVx65NxSY0gF4KARP6f1nGOsmoMJ+wUBN77VA29
	HlmIbcjt3/tinzi9oCPgxSNoybPfNjlY1WLH73v5PDWo15s9QMSLQ5S52/BGZ7mjK4EVWBzTnVD
	abP4/0d1hVf0w8SHX2zKUD2jqnXFu4XZcGOGd+8/bxpcxcEYD2mAJvUGm4r8vnj79JmMODo9Bxn
	ySwYb3zlRUerpcl0yQop0+CxtLXktVLc0em17KiB5EayJ0Oc3Sq7X+3VV
X-Google-Smtp-Source: AGHT+IHWSxvy3j+n5AuO7VAu/GSFxa+c33jwgeN48vex7Fw0xuBIkH5peKGTNbWUhb+Efpz2PRS3AQ==
X-Received: by 2002:a05:6000:250a:b0:3b8:d1a4:bab9 with SMTP id ffacd0b85a97d-3b9110323c1mr2270280f8f.45.1754991587821;
        Tue, 12 Aug 2025 02:39:47 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c3c51e2sm42432790f8f.32.2025.08.12.02.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:39:47 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] utils.py: use multiprocessing from bb
Date: Tue, 12 Aug 2025 11:39:43 +0200
Message-ID: <20250812093943.1499454-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 09:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221758

From: Martin Jansa <martin.jansa@gmail.com>

Fixes build with python-3.14

It was added to bitbake in 62be9113d98fccb347c6aa0a10d5c4ee2857f8b6
and oe-core now requires latest bitbake already, so we can use this.

[YOCTO #15858]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/lib/oe/utils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 8aa15373f1..0128ee411d 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -5,11 +5,11 @@
 #
 
 import subprocess
-import multiprocessing
 import traceback
 import errno
 
 import bb.parse
+from bb import multiprocessing
 
 def read_file(filename):
     try:

