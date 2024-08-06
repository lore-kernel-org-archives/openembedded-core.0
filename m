Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2739BC52D70
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 15:01:31 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.9457.1722956490287627900
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 08:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ESoq8rBz;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7d89bb07e7so88944366b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 08:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722956489; x=1723561289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQpOpjYXJ1NGLoGnog5qqZXfGsqWMuG9WqStUgKYAbY=;
        b=ESoq8rBzUalhj9YsLxTC5335UUTLQiKbKPpZx3dnhZZQMuHqk+wBTS0/7qIvUivACn
         smEH3qcwIPHy2SAsIIS14muOiG18gB+/VSDqOtgQ5+0hiTpewfNXQDIeUZHfmZqKUm8S
         7aIejJ8u4E3gQZcI4kQxX7MKxdPxfJy//glAE8QiN1CCD+5c/gAR+kX5gtKBipVgauAg
         kmBuf0x6FX9DhpXkVXHiKDURLSb7fj9+ybRLSHrcK8wGRLoCTaphr6MJlI5cgK9lMsHv
         5/gH+ZvxUp2y2Bf/M7wQuz+NYtMuxlQ2g7gzRkIFr62I19K/OnoA4889bbLY/hh7JLuy
         ENVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722956489; x=1723561289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQpOpjYXJ1NGLoGnog5qqZXfGsqWMuG9WqStUgKYAbY=;
        b=SOAwI9YBnJhULQ5zpMgO5i45YSRGk82hc9ZSqF8qkli+KFSKGrGLfLrDoztMIWPRJa
         RqAo6J2mRMDhWrAshczzZSYQpnPEKE7w37tSWMQWaQbxfa9xVC2p5jV+H7HD8ZbUa6cz
         gEdqWoMJRCP3+sDUwMp77DmNpYzBepnXgJZelhnD/q18pkEV5mrW8DzOKEFuwHdmb3mI
         lAJrJ2D9z4W4B2vqnRJn3g3hYIgU/D0Pt6geQyaoaX+epaeLRInB7Z5Xu3Vg7dLgAYDh
         ujpD1cp2QpkpwfiTzg1KbQ/0o5kD+vk4GhSkOmkTdIAmjpZmqUa7Y4CXbgkAmAyo6F55
         phGw==
X-Gm-Message-State: AOJu0YzB6qsFKgaWayi3pZo5NeSbWsqi2+WewA0GQyEK/v5Y9HzbZ/fO
	VzfetAATOyXVbEIe/5C+mAqsx6eW9k5qpnQDTjqQfVhYxi5DVsHtSfMzuqfj
X-Google-Smtp-Source: AGHT+IFPW3ckT6Aol80A5cyHktY+XD+U5Z1v9ttvvRGKRj5aH7eiQX2Zr1x/WGRH4ozvi8N+or/FRQ==
X-Received: by 2002:a17:907:c26:b0:a7a:abd8:77b1 with SMTP id a640c23a62f3a-a7dc50a1576mr1101445166b.60.1722956488217;
        Tue, 06 Aug 2024 08:01:28 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc3cf3sm566141566b.13.2024.08.06.08.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 08:01:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] python3-cython: correct upstream version check
Date: Tue,  6 Aug 2024 17:01:22 +0200
Message-Id: <20240806150122.2356176-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240806150122.2356176-1-alex.kanavin@gmail.com>
References: <20240806150122.2356176-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 15:01:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203029

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-cython_3.0.10.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-cython_3.0.10.bb b/meta/recipes-devtools/python/python3-cython_3.0.10.bb
index 754543e711f..86ae5f25e99 100644
--- a/meta/recipes-devtools/python/python3-cython_3.0.10.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.0.10.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 PYPI_PACKAGE = "Cython"
 
 SRC_URI[sha256sum] = "dcc96739331fb854dcf503f94607576cfe8488066c61ca50dfd55836f132de99"
-UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi setuptools3
 
-- 
2.39.2


