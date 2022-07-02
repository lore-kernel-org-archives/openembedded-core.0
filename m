Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F4BC43334
	for <webhook@archiver.kernel.org>; Sat,  2 Jul 2022 12:43:06 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.49335.1656765782064522000
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Jul 2022 05:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TY79ICSA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id f190so2763060wma.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Jul 2022 05:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SBLHNJLOQD5x88r5t/CET30TdlP873Ie8Doe6x0agJo=;
        b=TY79ICSAMJEQM6OR+Zgz8Kjvj6bf4gaYgJmHwswzwObygeA161VL885ulR/fnUYTht
         +kahw4Gg8kdBpMTNsXn9lzPRx/daIimx5ACjKdjo4rRV8T627jOi3yRG38GqrKhd04D8
         FBDjBOTVOYoIieMP0ZD0jg1H4pZQwXRKs09ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SBLHNJLOQD5x88r5t/CET30TdlP873Ie8Doe6x0agJo=;
        b=XQTiYH54i9kud/gE95cjPqUN0f6PfHtRKne5wwuVHUlEdHYDjiuPJukcdd4TxOsihQ
         4/ZI3FFgL7e0QUfwL/BUqwiW/hXamSjytHd5W3CNvIp14UoJTxzCaj1y5AWjYwyJ8eYQ
         annUyaCw8RzALyvEvcrCXcGlqok/o8Fqh4w0BZrlGGjr2zY/cuxuo/X8+5W82scCk0NZ
         /Xo3Ysuc6jNSm8zntAunhr20mlgrNVYbM4aAeLz7z2WdF2ZKrh2UsqQNBgswFfL2kPJB
         ZFuu5VaBqmV4jhMy6EmOCyDW+i/bCABBjMerJV5C73RJQID7CteDxyTev4hs2beUnVES
         KMww==
X-Gm-Message-State: AJIora9xtug420a400LnY8PZ9U8X+G34fcD9XFA4ajZfVtOmXM25Yzor
	hvK+GaJ9GeYcKUvk/FwUyvU8rpGEkBIDaQ==
X-Google-Smtp-Source: 
 AGRyM1tt+q7kwZLvwfJszFA07P50mqZxfcJKePApOVeOO9dlPYs78srsN8M4TJe8oO0mZdQM26/ayg==
X-Received: by 2002:a05:600c:3584:b0:3a0:563a:49d6 with SMTP id
 p4-20020a05600c358400b003a0563a49d6mr23593523wmq.46.1656765780336;
        Sat, 02 Jul 2022 05:43:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3569:71aa:bd43:a6d5])
        by smtp.gmail.com with ESMTPSA id
 r12-20020a05600c35cc00b003a04e900552sm11363279wmq.1.2022.07.02.05.42.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 05:42:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] insane: Fix buildpaths test to work with special devices
Date: Sat,  2 Jul 2022 13:42:59 +0100
Message-Id: <20220702124259.827134-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Jul 2022 12:43:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167551

If enabled, the buildpaths test hangs in psplash as it tries to open
a fifo and read from it, hanging indefinitely.

Tweak the test to ignore fifo/socket/device files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/insane.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 8c5d5ecc820..c7b886fc0a2 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -444,12 +444,14 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
     Check for build paths inside target files and error if paths are not
     explicitly ignored.
     """
+    import stat
     # Ignore .debug files, not interesting
     if path.find(".debug") != -1:
         return
 
-    # Ignore symlinks
-    if os.path.islink(path):
+    # Ignore symlinks/devs/fifos
+    mode = os.stat(path).st_mode
+    if stat.S_ISLNK(mode) or stat.S_ISBLK(mode) or stat.S_ISFIFO(mode) or stat.S_ISCHR(mode) or stat.S_ISSOCK(mode):
         return
 
     tmpdir = bytes(d.getVar('TMPDIR'), encoding="utf-8")
-- 
2.34.1


