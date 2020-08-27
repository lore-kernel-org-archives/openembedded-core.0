Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.16374.1598526021818702254
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 04:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mqH3CZIs;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id a26so7071213ejc.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 04:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZekodDemZYJY4Y29d0P6wb/8bnr/rxZdRUPgdAWCj1s=;
        b=mqH3CZIsRyUdeheYRJRaFTI60Hntq54vansRlh9gqFsfgQzZpFR7GQZSg14wQLGEVF
         hSUlUqEB1xWH1YQYffC/J27ljvQXJ5TpCVkfiKi9HtSwVyFJv+HGZImEEfF/p4eHDoDJ
         yYV/mJFZEGM8vft0Ti/zsCHzp3f6ZpS1voEJ690oSwIzDsY1PRfQAFHVcWcRONcicyI0
         Fu6Lez9se8WmSM2xTGn2aDR2QgUzgQMlG9RkGFlZJOH7Vs16OcCS6Ow/zLP6molgczJO
         UMq+UitvsmIGc3YoFztvxqwd3ImCEv17C19WxiZzNOc0JYDQFanuo967tb3ccWZZojBj
         Y3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZekodDemZYJY4Y29d0P6wb/8bnr/rxZdRUPgdAWCj1s=;
        b=D00O0/Ep/1acSh1/VAdh2YDrBvfXT9lTU3U3pzBXR618RAkRNizuFqrXJgGUrZEUwd
         VZj09CNc3rgsBlrew+gLN8angwRio75ZZm2v9Q+z5TrR8CtJfHqCPV2ZC4SGJjrOFQzn
         8sPWVOqjePkIiSCb3uwJafQZywrTw9wdcym08rJvYxlpIJDzA/6LOfbJiT86zchlHiRE
         rEfvTgyZRU24bA+YM2oWVUMbxjdL4e8H40xt60ibWMODhgGCQt60LGUTbzgu7xoMQEiW
         s3eBNyM9VQIU6nrcomGr+Y4o8g8YSxqZHiYcHEf0pbaPbFuaDOuD8dcJgldVnNM+eKxu
         h0VQ==
X-Gm-Message-State: AOAM531K3QxLUyRnAy5rrdDzl8/956JoJ6tnfjQCF2AjIieYFKQL/IEf
	liyVU87P2nAQnz4KpSEvb5J3WPPa6hM=
X-Google-Smtp-Source: ABdhPJzvnWJzInZAHLZM6Z6T27Yov+T69saXopHMQfQ/2Gw57P3bTyPk+gu+BI3U8fDf4VhmBGwCIA==
X-Received: by 2002:a17:907:7090:: with SMTP id yj16mr19871558ejb.73.1598526020121;
        Thu, 27 Aug 2020 04:00:20 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id eb5sm1623132ejc.94.2020.08.27.04.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 04:00:19 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 6/6] oeqa/multilib: un-skip the connman test
Date: Thu, 27 Aug 2020 12:59:33 +0200
Message-Id: <20200827105933.3575-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827105933.3575-1-alex.kanavin@gmail.com>
References: <20200827105933.3575-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was previously skipped as it was expecting plain connman
to not be in the image, and for core-image-sato connman is always there.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/runtime/cases/multilib.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/multilib.py b/meta/lib/oeqa/runtime/cases/multilib.py
index 56aed62eea..0d1b9ae2c9 100644
--- a/meta/lib/oeqa/runtime/cases/multilib.py
+++ b/meta/lib/oeqa/runtime/cases/multilib.py
@@ -42,6 +42,6 @@ class MultilibTest(OERuntimeTestCase):
         self.archtest("/lib64/libc.so.6", "ELF64")
 
     @OETestDepends(['multilib.MultilibTest.test_check_multilib_libc'])
-    @OEHasPackage(['lib32-connman', '!connman'])
+    @OEHasPackage(['lib32-connman'])
     def test_file_connman(self):
         self.archtest("/usr/sbin/connmand", "ELF32")
-- 
2.28.0

