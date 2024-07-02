Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08501C3065C
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 22:31:42 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.37356.1719959501464879319
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 15:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M1NmHnFE;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4256f102e89so32069815e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 15:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719959499; x=1720564299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7EAHmFCYtX/kPXP6OgP8ya2hRHJPKt4RSm3coqxzkmE=;
        b=M1NmHnFE5oDSTWf+ZaBo/hm0wAbjpOAwKAZmYiPl0egkHlcrp+UDdi1vibC/Ix7FX9
         gETx/RMXuBCMoygBK1IkRu9MjPkPYei/JB4yOS9wdPGbcyhFSJ9/Bpw/clMHt/+sihPt
         p4ePqcxDzEIrLj/CIb6yHCZ/yBmcYSOj/1oCpF0POOlsH0Mp9Hus7P9gpKmHr+Z8AEGs
         slIlHZeLZX5UT2gugTm+crPnA3iaBz93PaxLTEXzyj7a9ybIBVIe05TRddK0X4bwOFcU
         0j/C2s8HxxbWOWCOmdddfI27UL6K9U/kaBe3bREbauG7BrAt2YMM4uB2qUZHZdzSmjJj
         FmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719959499; x=1720564299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7EAHmFCYtX/kPXP6OgP8ya2hRHJPKt4RSm3coqxzkmE=;
        b=PtriDigqlBci7efLeTn9c6b6ZFKs1vtYye2U66VKqoM+/C0vFKt/jPnkzYhUA4tPwe
         4Wn7gimCxDBjE8nrlWQfDQdaAEOeHZnFRJPx76AxpeO246beQxrqIqY1PJ9OMHYgDyPG
         GZu+PenRieTAEHXG9FoQhAmgm38mH/NSRaqfW0xq1E0kbUzK62xAD1k2ado2aDkeCwva
         QTyyO8L24p8YGry7c6VlB5ov0DNOkDn6XDmpIEMNImqk1Kh8lzDaZttrZ5BwXfxvhyPD
         1RjvvpGYcKG4gQEhz361zSGvB2HvmBzncaubz+tMqxLAyGMvoaPYImmrAmuq24RbPJYA
         YI6w==
X-Gm-Message-State: AOJu0YxbUQ1U9W2Afwts8f9nEEpOZ18Wrc/xnT+9wuVDBtOxEXUSnWKa
	LvQ+U3Ct4nvYjNKeOq6IcLnY0wD4WfhZhJzKIdPq98s4YKXtq0sp4urBwYa2
X-Google-Smtp-Source: AGHT+IET3Zv/RGBLMyox9oH4PZYTcQ3iZiKOtyLXtM/BB/F7yeT5FcWYEvTKy8KA6d53azi66z7zNQ==
X-Received: by 2002:a05:600c:3b07:b0:425:6979:9b5f with SMTP id 5b1f17b1804b1-4257a009c28mr66774665e9.6.1719959499344;
        Tue, 02 Jul 2024 15:31:39 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b0c0f26sm211320055e9.39.2024.07.02.15.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 15:31:38 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] python3-setuptools: drop python3-2to3 from RDEPENDS
Date: Tue,  2 Jul 2024 22:31:29 +0000
Message-Id: <20240702223129.3968-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 22:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201445

2to3 module was dropped as a dependency in setuptools 58.0

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-setuptools_69.1.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb b/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
index 77d4e0aa03..67475b68eb 100644
--- a/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
@@ -16,7 +16,6 @@ SRC_URI[sha256sum] = "5c0806c7d9af348e6dd3777b4f4dbb42c7ad85b190104837488eab9a7c
 DEPENDS += "python3"
 
 RDEPENDS:${PN} = "\
-    python3-2to3 \
     python3-compile \
     python3-compression \
     python3-ctypes \
-- 
2.34.1


